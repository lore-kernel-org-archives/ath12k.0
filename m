Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73A3C677C4
	for <ath12k@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YonE9TYwfsRRyLB1012s3xRxd/zvfuGYgf8g8e90SCk=; b=NPw/R2oPMNjambcTIecj+MlWoA
	7O72snXDwb2u95qgaAz7k/kyVgCin54YnIo47cf7VgFkvAWloD/bkXY+r4XAs4mK0UE6ZE3iH40ln
	y9Z+P1b9V5YvyTxoME4Sc0BTx3MUOJileBahOHtX3pWWF+915bjZdADNrJcvfMaau3m/lGvsogdBB
	X8FtQZd7zOtLJdQ0Vn6AERANeJKM87kv/+TFKbJNj3wZveWe2p4OSwQTBaM2J50Ul3Qqz1O7NZ8md
	QLzX5CG5rjZhM/0yI14bbfCXjY/Scixi0v/McILedSO8qcIzCvnOA+Oc9Yv6RbpFA8ETrUTTjLRj7
	AwydaPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lT-00000008F8r-2kln;
	Tue, 10 Jun 2025 22:48:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2yv-00000007f9t-0CZK
	for ath12k@lists.infradead.org;
	Tue, 10 Jun 2025 17:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 02575A51520;
	Tue, 10 Jun 2025 17:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBD2C4CEED;
	Tue, 10 Jun 2025 17:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749577311;
	bh=sRkw8ZsJ4kvpK7qB5Fr0oq2ZSj7pwh8y4ZDPoB3jyFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UY4DIFWUk+S8Rlf6pVsaugp9+cz3GLQVU9yPCEPzUWsF8vKmL3sttS6Ir1DrALavT
	 NO1/WTOseFT9whVFWayqR++eY/GAai+QX0HMX6foi+ARDlEdk2QQTNWk3/M+Zl+hfy
	 AmjS63rB0IK7QVH8wqJjtWRtAmeanoZgyxl9Nx1RwwOScRRTY66c7MTvL2lfofo4TH
	 31sbXjmpzQnyaX054hfs9hG6pC5DvWYiFsZc2muZMGexBMYLcTa1ZrLZtA7S09Xxcs
	 vVKbxOD4lDdsZ2EBB9AHz1Nlpm31+NUJu1ToHjCifkfy2brxHeczg9BF+RT4d5RfST
	 luFfQy2iHStaQ==
Date: Tue, 10 Jun 2025 12:41:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com, Jeff Johnson <jjohnson@kernel.org>, 
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>, Mahendran P <quic_mahep@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT
 and BCN_STAT
Message-ID: <v44xnvqxjdqtonpfvnn6iblzmchgxbhtj7t25dhaxcimippba5@rbjf5roopwdx>
References: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
 <c2d138ba-5b08-4daa-95b3-e1f95f05938d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2d138ba-5b08-4daa-95b3-e1f95f05938d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_104153_213769_863C0B48 
X-CRM114-Status: GOOD (  36.46  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Tue, Jun 10, 2025 at 01:16:30PM +0530, Rameshkumar Sundaram wrote:
> 
> 
> On 6/10/2025 8:36 AM, Bjorn Andersson via B4 Relay wrote:
> > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > 
> > When the ath12k driver is built without CONFIG_ATH12K_DEBUG, the
> > recently refactored stats code can cause any user space application
> > (such at NetworkManager) to consume 100% CPU for 3 seconds, every time
> > stats are read.
> > 
> > Commit 'b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of
> > debugfs")' moved ath12k_debugfs_fw_stats_request() out of debugfs, by
> > merging the additional logic into ath12k_mac_get_fw_stats().
> > 
> > Among the added responsibility of ath12k_mac_get_fw_stats() was the
> > busy-wait for `fw_stats_done`.
> > 
> > Signalling of `fw_stats_done` happens when one of the
> > WMI_REQUEST_PDEV_STAT, WMI_REQUEST_VDEV_STAT, and WMI_REQUEST_BCN_STAT
> > messages are received, but the handling of the latter two commands remained
> > in the debugfs code. As `fw_stats_done` isn't signalled, the calling
> > processes will spin until the timeout (3 seconds) is reached.
> > 
> > Moving the handling of these two additional responses out of debugfs
> > resolves the issue.
> > 
> > Fixes: b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of debugfs")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >   drivers/net/wireless/ath/ath12k/debugfs.c | 58 --------------------------
> >   drivers/net/wireless/ath/ath12k/debugfs.h |  7 ----
> >   drivers/net/wireless/ath/ath12k/wmi.c     | 67 +++++++++++++++++++++++++++----
> >   3 files changed, 60 insertions(+), 72 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> > index dd624d73b8b2714e77c9d89b5a52f7b3fcb02951..23da93afaa5c25e806c9859dbbdd796afd23d78a 100644
> > --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> > +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> > @@ -1251,64 +1251,6 @@ void ath12k_debugfs_soc_destroy(struct ath12k_base *ab)
> >   	 */
> >   }
> > -void
> > -ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> > -				struct ath12k_fw_stats *stats)
> > -{
> > -	struct ath12k_base *ab = ar->ab;
> > -	struct ath12k_pdev *pdev;
> > -	bool is_end;
> > -	static unsigned int num_vdev, num_bcn;
> > -	size_t total_vdevs_started = 0;
> > -	int i;
> > -
> > -	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
> > -		if (list_empty(&stats->vdevs)) {
> > -			ath12k_warn(ab, "empty vdev stats");
> > -			return;
> > -		}
> > -		/* FW sends all the active VDEV stats irrespective of PDEV,
> > -		 * hence limit until the count of all VDEVs started
> > -		 */
> > -		rcu_read_lock();
> > -		for (i = 0; i < ab->num_radios; i++) {
> > -			pdev = rcu_dereference(ab->pdevs_active[i]);
> > -			if (pdev && pdev->ar)
> > -				total_vdevs_started += pdev->ar->num_started_vdevs;
> > -		}
> > -		rcu_read_unlock();
> > -
> > -		is_end = ((++num_vdev) == total_vdevs_started);
> > -
> > -		list_splice_tail_init(&stats->vdevs,
> > -				      &ar->fw_stats.vdevs);
> > -
> > -		if (is_end) {
> > -			ar->fw_stats.fw_stats_done = true;
> > -			num_vdev = 0;
> > -		}
> > -		return;
> > -	}
> > -	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
> > -		if (list_empty(&stats->bcn)) {
> > -			ath12k_warn(ab, "empty beacon stats");
> > -			return;
> > -		}
> > -		/* Mark end until we reached the count of all started VDEVs
> > -		 * within the PDEV
> > -		 */
> > -		is_end = ((++num_bcn) == ar->num_started_vdevs);
> > -
> > -		list_splice_tail_init(&stats->bcn,
> > -				      &ar->fw_stats.bcn);
> > -
> > -		if (is_end) {
> > -			ar->fw_stats.fw_stats_done = true;
> > -			num_bcn = 0;
> > -		}
> > -	}
> > -}
> > -
> >   static int ath12k_open_vdev_stats(struct inode *inode, struct file *file)
> >   {
> >   	struct ath12k *ar = inode->i_private;
> > diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
> > index ebef7dace3448e4bdf2d6cb155d089267315172c..21641a8a03460c6cc1b34929a353e5605bb834ce 100644
> > --- a/drivers/net/wireless/ath/ath12k/debugfs.h
> > +++ b/drivers/net/wireless/ath/ath12k/debugfs.h
> > @@ -12,8 +12,6 @@ void ath12k_debugfs_soc_create(struct ath12k_base *ab);
> >   void ath12k_debugfs_soc_destroy(struct ath12k_base *ab);
> >   void ath12k_debugfs_register(struct ath12k *ar);
> >   void ath12k_debugfs_unregister(struct ath12k *ar);
> > -void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> > -				     struct ath12k_fw_stats *stats);
> >   void ath12k_debugfs_op_vif_add(struct ieee80211_hw *hw,
> >   			       struct ieee80211_vif *vif);
> >   void ath12k_debugfs_pdev_create(struct ath12k_base *ab);
> > @@ -126,11 +124,6 @@ static inline void ath12k_debugfs_unregister(struct ath12k *ar)
> >   {
> >   }
> > -static inline void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> > -						   struct ath12k_fw_stats *stats)
> > -{
> > -}
> > -
> >   static inline bool ath12k_debugfs_is_extd_rx_stats_enabled(struct ath12k *ar)
> >   {
> >   	return false;
> > diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> > index 60e2444fe08cefa39ae218d07eb9736d2a0c982b..2d2444417e2b2d9281754d113f2b073034e27739 100644
> > --- a/drivers/net/wireless/ath/ath12k/wmi.c
> > +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> > @@ -7626,6 +7626,63 @@ static int ath12k_wmi_pull_fw_stats(struct ath12k_base *ab, struct sk_buff *skb,
> >   				   &parse);
> >   }
> > +static void ath12k_wmi_fw_stats_process(struct ath12k *ar,
> > +					struct ath12k_fw_stats *stats)
> > +{
> > +	struct ath12k_base *ab = ar->ab;
> > +	struct ath12k_pdev *pdev;
> > +	bool is_end;
> > +	static unsigned int num_vdev, num_bcn;
> > +	size_t total_vdevs_started = 0;
> > +	int i;
> > +
> > +	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
> > +		if (list_empty(&stats->vdevs)) {
> > +			ath12k_warn(ab, "empty vdev stats");
> > +			return;
> > +		}
> > +		/* FW sends all the active VDEV stats irrespective of PDEV,
> > +		 * hence limit until the count of all VDEVs started
> > +		 */
> > +		rcu_read_lock();
> > +		for (i = 0; i < ab->num_radios; i++) {
> > +			pdev = rcu_dereference(ab->pdevs_active[i]);
> > +			if (pdev && pdev->ar)
> > +				total_vdevs_started += pdev->ar->num_started_vdevs;
> > +		}
> > +		rcu_read_unlock();
> > +
> > +		is_end = ((++num_vdev) == total_vdevs_started);
> > +
> > +		list_splice_tail_init(&stats->vdevs,
> > +				      &ar->fw_stats.vdevs);
> > +
> > +		if (is_end) {
> > +			ar->fw_stats.fw_stats_done = true;
> > +			num_vdev = 0;
> > +		}
> > +		return;
> > +	}
> > +	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
> > +		if (list_empty(&stats->bcn)) {
> > +			ath12k_warn(ab, "empty beacon stats");
> > +			return;
> > +		}
> > +		/* Mark end until we reached the count of all started VDEVs
> > +		 * within the PDEV
> > +		 */
> > +		is_end = ((++num_bcn) == ar->num_started_vdevs);
> > +
> > +		list_splice_tail_init(&stats->bcn,
> > +				      &ar->fw_stats.bcn);
> > +
> > +		if (is_end) {
> > +			ar->fw_stats.fw_stats_done = true;
> > +			num_bcn = 0;
> > +		}
> > +	}
> > +}
> > +
> >   static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *skb)
> >   {
> >   	struct ath12k_fw_stats stats = {};
> > @@ -7655,19 +7712,15 @@ static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *sk
> >   	spin_lock_bh(&ar->data_lock);
> > -	/* WMI_REQUEST_PDEV_STAT can be requested via .get_txpower mac ops or via
> > -	 * debugfs fw stats. Therefore, processing it separately.
> > -	 */
> > +	/* Handle WMI_REQUEST_PDEV_STAT status update */
> >   	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
> >   		list_splice_tail_init(&stats.pdevs, &ar->fw_stats.pdevs);
> >   		ar->fw_stats.fw_stats_done = true;
> >   		goto complete;
> >   	}
> > -	/* WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT are currently requested only
> > -	 * via debugfs fw stats. Hence, processing these in debugfs context.
> > -	 */
> > -	ath12k_debugfs_fw_stats_process(ar, &stats);
> > +	/* Handle WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT updates. */
> > +	ath12k_wmi_fw_stats_process(ar, &stats);
> >   complete:
> >   	complete(&ar->fw_stats_complete);
> > 
> 
> 
> This look fine to me, Thanks for fixing this.
> 
> Apart from this we may also have to free up the stats buffer list maintained
> when the stats is requested out of debugfs (like ath12k_mac_op_get_txpower()
> and ath12k_mac_op_sta_statistics()) once its scope of usage is done, else
> the memory will be held untill next fw stats request or module unload.
> 

I agree with this. In fact it seems to me that the majority of [1]
should be considered for ath12k as well (and Jeff acknowledged the
same).

The purpose of this patch was solely to deal with the regression from
the previous behavior introduced in v6.16-rc1, causing my X Elite laptop
to idle about 10C warmer. (Afaict neither distros or upstream arm64
defconfig has ATH12K_DEBUG enabled)

The "also fix X, Y, Z" would at least be separate patches, and could be
applied either to -rc or v6.17 on top of something like this.

[1] https://lore.kernel.org/ath11k/20250220082448.31039-1-quic_bqiang@quicinc.com/

Regards,
Bjorn

> -- 
> --
> Ramesh
> 
> 

