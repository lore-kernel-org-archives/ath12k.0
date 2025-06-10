Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C161C5B552
	for <ath12k@archiver.kernel.org>; Tue, 10 Jun 2025 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cv44LS1sjh21HGfbYeFYKcPOsKyzLkV/r1e8mW8y0Os=; b=exE5+ALDlFlrAF/SzxzDlk2cxj
	w/7X0aDeHrnQQ3h+yFouGDecS+2OWG7vrScPCY2+3YV4q+miwxZL5Ir5cLBu+9JCMufwfDBMtaPJF
	PZ1RURAFpzQwwWSbVmhSExlEPTkyIZzhKL5wQxk5fBKYDHg0ASR3Uc5cWCQxeFvxUxFWAAkcdjseZ
	d+9NA/MXk4yonZ1VLhIp4N0CR2GHhcbAmZVbVaJaQuPmvcNGI9ow/VFnA/ZqmNgIwe8ufrWoB300d
	5a2K/iYgj8/ARtEmPJJZxt1ahZeQZTaLh3pM+YFtVpbEJOH4fPLZ+M3lA0J/nXyM5lnXs7rx4fx+Y
	NldDr8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuA3-000000068Wq-4AuB;
	Tue, 10 Jun 2025 08:16:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuA1-000000068WJ-49Lt
	for ath12k@lists.infradead.org;
	Tue, 10 Jun 2025 08:16:47 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so7360659a12.0
        for <ath12k@lists.infradead.org>; Tue, 10 Jun 2025 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543404; x=1750148204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cv44LS1sjh21HGfbYeFYKcPOsKyzLkV/r1e8mW8y0Os=;
        b=cPfoaFve1uBEcYz7msePkho4ziNNoJHGx1o3VpKGUbaPyjUgbqk4eW2xsJhGVGj8pK
         JNZNBCT0utmPT72zdlvfUQ82rPD9df+dv4fALx0dy3AT54XDT4QBxRzALXUHmvxNnDUa
         RL1p8MU1L2dbiglXOjNRPnZtBVhmpH4OOtwsbkULCnlqPEnU6oXEipzXPUDXsgnH8aqB
         IrbsafQLPZ09MtIYxWCh5GNr1d08IyiTKTVhuwtZvsor6RKfWYexHQLVOmaaG16irrEb
         0C6o6rENHMBVsGTNcY2DAsKn2wIzWhqQDchvl4R2Yb8Y34VANCaWDpshJJkno+rVGPtY
         iNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543404; x=1750148204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cv44LS1sjh21HGfbYeFYKcPOsKyzLkV/r1e8mW8y0Os=;
        b=fHbNLuPYW6KI9OJxzIVXm+LXZHAxHa4/KzrUW5zYUvN5FAbXIxtbkxWQU0ynrzO8xw
         nVzrmH9SWrnp3JFhUiVI7YFaJw6QEKzcmuONpb/7NlLIkD8MGojksni0dBH4xLyfd/Cw
         L+JpDj0VDxNX+aqNBQZXJitHD4eXvpwLqWsXOjHyzOIIsEmtenT/BVmtxfB6hnGjiKg6
         uiv54K0H/g/e6vDSfZ5mue4rX/R9EpoPMKoM0UP2dbs9xTsYZ5kn/aBkDK6t387k2d40
         RMNuDsCQtAXvTslC4sHZGE/V2Qo5gE4T5gd0c6THAdDtRG41VUlhguY2SBn4xD4a59XY
         nQHg==
X-Forwarded-Encrypted: i=1; AJvYcCW96dREaLSf0rofN8R+rIFENWEfsINiAJeIbNEiKcDe1g+u6+m0kdIIhkgbZgXZpPp8yLBLbtQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDotSJJOFlCcTmQM+9XBpJFr1XjYZC+K6mMBcPycWujZzTWUCe
	X09npc/Y5NKb9CkorQGNwWaCJ4XEQcIDQH5jDcFepUbaeuHpDFNSvPsIyzsXK9R5VqBvklhQ/lE
	tfUxq
X-Gm-Gg: ASbGncttM/bnVg4q0Wnv3hm9F/wHzGdIZfZlOCxSURgkyjfQHBBkytBcaIV1knROIFk
	mQQWmv/UMTC+HNtVB2DjmrcJUxsMAXGM6xmq9FdCppq3+/nM1MtOi8Fy7XhmWHloAXiunJyDp3p
	m6llS+R10F/xzk6XZQxCqVZVJK/cL5I3yFJyepWAicBeSvOu+HMFlqndOQRyS3EN4KnnQPG/kdl
	aulGnV1AcJLrr2/ewc4+fjVoDyxxLCvGOjxcM5GRutKSPKEvy4ajJhO38H5PqAWksjbEJqmvlD5
	PUksjcB7YSEJOR7ZcSj9IyhMihEp7mqPNWr0hQXK3Aw9LL/J1+IUi+HFo0/YieBp1SpGVQ==
X-Google-Smtp-Source: AGHT+IHpCrdRekIe0QYCDgcZtAAoXKuOovlRwWiNArYZwW7mCqUJLOpQ8BUhEtpViMRKEjRU6TLGIA==
X-Received: by 2002:a17:907:1ca2:b0:add:fc26:c1c4 with SMTP id a640c23a62f3a-ade1a9ed855mr1546064966b.59.1749543403926;
        Tue, 10 Jun 2025 01:16:43 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db576basm689286766b.65.2025.06.10.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:16:41 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:16:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: bjorn.andersson@oss.qualcomm.com
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Mahendran P <quic_mahep@quicinc.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT
 and BCN_STAT
Message-ID: <aEfp6B97gwAeeOs3@linaro.org>
References: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_011646_041942_CA503E21 
X-CRM114-Status: GOOD (  30.20  )
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

On 25-06-09 22:06:22, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> When the ath12k driver is built without CONFIG_ATH12K_DEBUG, the
> recently refactored stats code can cause any user space application
> (such at NetworkManager) to consume 100% CPU for 3 seconds, every time
> stats are read.
> 
> Commit 'b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of
> debugfs")' moved ath12k_debugfs_fw_stats_request() out of debugfs, by
> merging the additional logic into ath12k_mac_get_fw_stats().
> 
> Among the added responsibility of ath12k_mac_get_fw_stats() was the
> busy-wait for `fw_stats_done`.
> 
> Signalling of `fw_stats_done` happens when one of the
> WMI_REQUEST_PDEV_STAT, WMI_REQUEST_VDEV_STAT, and WMI_REQUEST_BCN_STAT
> messages are received, but the handling of the latter two commands remained
> in the debugfs code. As `fw_stats_done` isn't signalled, the calling
> processes will spin until the timeout (3 seconds) is reached.
> 
> Moving the handling of these two additional responses out of debugfs
> resolves the issue.
> 
> Fixes: b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of debugfs")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Tested on Dell XPS 13 9345.

Tested-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/net/wireless/ath/ath12k/debugfs.c | 58 --------------------------
>  drivers/net/wireless/ath/ath12k/debugfs.h |  7 ----
>  drivers/net/wireless/ath/ath12k/wmi.c     | 67 +++++++++++++++++++++++++++----
>  3 files changed, 60 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index dd624d73b8b2714e77c9d89b5a52f7b3fcb02951..23da93afaa5c25e806c9859dbbdd796afd23d78a 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1251,64 +1251,6 @@ void ath12k_debugfs_soc_destroy(struct ath12k_base *ab)
>  	 */
>  }
>  
> -void
> -ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> -				struct ath12k_fw_stats *stats)
> -{
> -	struct ath12k_base *ab = ar->ab;
> -	struct ath12k_pdev *pdev;
> -	bool is_end;
> -	static unsigned int num_vdev, num_bcn;
> -	size_t total_vdevs_started = 0;
> -	int i;
> -
> -	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
> -		if (list_empty(&stats->vdevs)) {
> -			ath12k_warn(ab, "empty vdev stats");
> -			return;
> -		}
> -		/* FW sends all the active VDEV stats irrespective of PDEV,
> -		 * hence limit until the count of all VDEVs started
> -		 */
> -		rcu_read_lock();
> -		for (i = 0; i < ab->num_radios; i++) {
> -			pdev = rcu_dereference(ab->pdevs_active[i]);
> -			if (pdev && pdev->ar)
> -				total_vdevs_started += pdev->ar->num_started_vdevs;
> -		}
> -		rcu_read_unlock();
> -
> -		is_end = ((++num_vdev) == total_vdevs_started);
> -
> -		list_splice_tail_init(&stats->vdevs,
> -				      &ar->fw_stats.vdevs);
> -
> -		if (is_end) {
> -			ar->fw_stats.fw_stats_done = true;
> -			num_vdev = 0;
> -		}
> -		return;
> -	}
> -	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
> -		if (list_empty(&stats->bcn)) {
> -			ath12k_warn(ab, "empty beacon stats");
> -			return;
> -		}
> -		/* Mark end until we reached the count of all started VDEVs
> -		 * within the PDEV
> -		 */
> -		is_end = ((++num_bcn) == ar->num_started_vdevs);
> -
> -		list_splice_tail_init(&stats->bcn,
> -				      &ar->fw_stats.bcn);
> -
> -		if (is_end) {
> -			ar->fw_stats.fw_stats_done = true;
> -			num_bcn = 0;
> -		}
> -	}
> -}
> -
>  static int ath12k_open_vdev_stats(struct inode *inode, struct file *file)
>  {
>  	struct ath12k *ar = inode->i_private;
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
> index ebef7dace3448e4bdf2d6cb155d089267315172c..21641a8a03460c6cc1b34929a353e5605bb834ce 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.h
> @@ -12,8 +12,6 @@ void ath12k_debugfs_soc_create(struct ath12k_base *ab);
>  void ath12k_debugfs_soc_destroy(struct ath12k_base *ab);
>  void ath12k_debugfs_register(struct ath12k *ar);
>  void ath12k_debugfs_unregister(struct ath12k *ar);
> -void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> -				     struct ath12k_fw_stats *stats);
>  void ath12k_debugfs_op_vif_add(struct ieee80211_hw *hw,
>  			       struct ieee80211_vif *vif);
>  void ath12k_debugfs_pdev_create(struct ath12k_base *ab);
> @@ -126,11 +124,6 @@ static inline void ath12k_debugfs_unregister(struct ath12k *ar)
>  {
>  }
>  
> -static inline void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> -						   struct ath12k_fw_stats *stats)
> -{
> -}
> -
>  static inline bool ath12k_debugfs_is_extd_rx_stats_enabled(struct ath12k *ar)
>  {
>  	return false;
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 60e2444fe08cefa39ae218d07eb9736d2a0c982b..2d2444417e2b2d9281754d113f2b073034e27739 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -7626,6 +7626,63 @@ static int ath12k_wmi_pull_fw_stats(struct ath12k_base *ab, struct sk_buff *skb,
>  				   &parse);
>  }
>  
> +static void ath12k_wmi_fw_stats_process(struct ath12k *ar,
> +					struct ath12k_fw_stats *stats)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	struct ath12k_pdev *pdev;
> +	bool is_end;
> +	static unsigned int num_vdev, num_bcn;
> +	size_t total_vdevs_started = 0;
> +	int i;
> +
> +	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
> +		if (list_empty(&stats->vdevs)) {
> +			ath12k_warn(ab, "empty vdev stats");
> +			return;
> +		}
> +		/* FW sends all the active VDEV stats irrespective of PDEV,
> +		 * hence limit until the count of all VDEVs started
> +		 */
> +		rcu_read_lock();
> +		for (i = 0; i < ab->num_radios; i++) {
> +			pdev = rcu_dereference(ab->pdevs_active[i]);
> +			if (pdev && pdev->ar)
> +				total_vdevs_started += pdev->ar->num_started_vdevs;
> +		}
> +		rcu_read_unlock();
> +
> +		is_end = ((++num_vdev) == total_vdevs_started);
> +
> +		list_splice_tail_init(&stats->vdevs,
> +				      &ar->fw_stats.vdevs);
> +
> +		if (is_end) {
> +			ar->fw_stats.fw_stats_done = true;
> +			num_vdev = 0;
> +		}
> +		return;
> +	}
> +	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
> +		if (list_empty(&stats->bcn)) {
> +			ath12k_warn(ab, "empty beacon stats");
> +			return;
> +		}
> +		/* Mark end until we reached the count of all started VDEVs
> +		 * within the PDEV
> +		 */
> +		is_end = ((++num_bcn) == ar->num_started_vdevs);
> +
> +		list_splice_tail_init(&stats->bcn,
> +				      &ar->fw_stats.bcn);
> +
> +		if (is_end) {
> +			ar->fw_stats.fw_stats_done = true;
> +			num_bcn = 0;
> +		}
> +	}
> +}
> +
>  static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *skb)
>  {
>  	struct ath12k_fw_stats stats = {};
> @@ -7655,19 +7712,15 @@ static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *sk
>  
>  	spin_lock_bh(&ar->data_lock);
>  
> -	/* WMI_REQUEST_PDEV_STAT can be requested via .get_txpower mac ops or via
> -	 * debugfs fw stats. Therefore, processing it separately.
> -	 */
> +	/* Handle WMI_REQUEST_PDEV_STAT status update */
>  	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
>  		list_splice_tail_init(&stats.pdevs, &ar->fw_stats.pdevs);
>  		ar->fw_stats.fw_stats_done = true;
>  		goto complete;
>  	}
>  
> -	/* WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT are currently requested only
> -	 * via debugfs fw stats. Hence, processing these in debugfs context.
> -	 */
> -	ath12k_debugfs_fw_stats_process(ar, &stats);
> +	/* Handle WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT updates. */
> +	ath12k_wmi_fw_stats_process(ar, &stats);
>  
>  complete:
>  	complete(&ar->fw_stats_complete);
> 
> ---
> base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
> change-id: 20250609-ath12k-fw-stats-done-dca8bf77a7da
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> 
> 

