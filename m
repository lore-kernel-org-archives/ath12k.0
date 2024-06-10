Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EE5C27C55
	for <ath12k@archiver.kernel.org>; Mon, 10 Jun 2024 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LPXzd3NsTqlBdI1QwLdBwFQzCnCWsOJgHBPsMAEvnM=; b=FQMbpAl8rqjUZH88qBEkjgj+Xf
	fgFVfCj5q6ePpp4qPoCXwcsgUjGwWIzg6WKdrS/sNn9yMHGfOCo0jO0wvDYHDLLTZFEZUw6ODNOGt
	MR0E6mQ5Z/n5psIOFMna/VA5qJ3pph9P6VIyp8kDDDxriSw2m0mLYynMwOjNA6HK/UXJPVOnqbqYm
	fzHUfZJ6qi2CW4pdBhaZdgDh0QSV36HZ8CAhXXlHzTnwImfO3br5WHuZ6e911RwrpkD2hSjUCn5fp
	cxbMIc8hkz8yCoH2Jv+3901km5MsKqMDO7YPAfGuctGxIbCm3AX6hYaSsSrVShmEQwAmzmgCAMIm9
	q+rpu/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGfVV-00000005IuU-1y68
	for ath12k@archiver.kernel.org;
	Mon, 10 Jun 2024 13:56:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGfVQ-00000005IsB-13al
	for ath12k@lists.infradead.org;
	Mon, 10 Jun 2024 13:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F160560AD1;
	Mon, 10 Jun 2024 13:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A8AC2BBFC;
	Mon, 10 Jun 2024 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718027774;
	bh=mwASIRN5NsLuWkUIYYooU07pZnqx8CMFU2vYlxGCbeo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DpyP9sDjmbpvfwuY9Ygb8etcdbCMTQD9BozdDoiO3uctwWGtwO/TkNvpLWAaS/mHh
	 hhJa0K4bkvtrAHJWq8sbnT2TVTEZD0Dj6AxOhD/RHFhNOFTpQON9xmDuZDrjMHsZ+S
	 7Gu0Fbs3AjHbQb6Tao5c1FLkYZ4IRUQmo4PsvOvFCkXqi8xoCp5u+sA86qjsbj/Rae
	 Z4uNVuRT6Y5CQdiz1en0XYTA1BqG/L0hKUzpu+T1UvCfG4erxLOZefhnrkpIKwa2+N
	 Vr9Y8YVLBp5qyb1+frQYoTwlo+Sirs9aXz+agvO5//nl5F39VmluhDzqtp8ZeIZdd4
	 vBITm7D72fKTQ==
From: Kalle Valo <kvalo@kernel.org>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: modify remain on channel for single wiphy
References: <20240528082739.1226758-1-quic_ramess@quicinc.com>
Date: Mon, 10 Jun 2024 16:56:11 +0300
In-Reply-To: <20240528082739.1226758-1-quic_ramess@quicinc.com> (Rameshkumar
	Sundaram's message of "Tue, 28 May 2024 13:57:39 +0530")
Message-ID: <878qzcq4uc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_065616_453132_41A34316 
X-CRM114-Status: GOOD (  27.55  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:

> When multiple radios are advertised as a single wiphy which
> supports various bands, vdev creation for the vif is deferred
> until channel is assigned to it.
> If a remain on channel(RoC) request is received from mac80211,
> select the corresponding radio(ar) based on channel and create
> a vdev on that radio to initiate an RoC scan.
>
> Note that on RoC completion this vdev is not deleted. If a new
> RoC/hw scan request is seen on that same vif for a different band the
> vdev will be deleted and created on the new radio supporting the
> request.
>
> Also if the RoC scan is requested when the vdev is in started state,
> no switching to new radio is allowed and RoC request can be accepted
> only on channels within same radio.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>

I did some white space changes to the commit message.

> @@ -8416,12 +8416,63 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
>  	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
>  	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>  	struct ath12k_wmi_scan_req_arg arg;
> -	struct ath12k *ar;
> +	struct ath12k *ar, *prev_ar;
>  	u32 scan_time_msec;
> +	bool create = true;
>  	int ret;
>  
> -	ar = ath12k_ah_to_ar(ah, 0);
> +	if (ah->num_radio == 1) {
> +		WARN_ON(!arvif->is_created);
> +		ar = ath12k_ah_to_ar(ah, 0);
> +		goto scan;
> +	}
> +
> +	ar = ath12k_mac_select_scan_device(hw, vif, chan->center_freq);
> +	if (!ar)
> +		return -EINVAL;
> +
> +	/* If the vif is already assigned to a specific vdev of an ar,
> +	 * check whether its already started, vdev which is started
> +	 * are not allowed to switch to a new radio.
> +	 * If the vdev is not started, but was earlier created on a
> +	 * different ar, delete that vdev and create a new one. We don't
> +	 * delete at the scan stop as an optimization to avoid redundant
> +	 * delete-create vdev's for the same ar, in case the request is
> +	 * always on the same band for the vif
> +	 */
> +	if (arvif->is_created) {
> +		if (WARN_ON(!arvif->ar))
> +			return -EINVAL;
> +
> +		if (ar != arvif->ar && arvif->is_started)
> +			return -EINVAL;

I wonder if -EBUSY would be more descriptive here? I changed to that in
the pending branch.

> +		if (ar != arvif->ar) {
> +			/* backup the previously used ar ptr, since the vdev delete
> +			 * would assign the arvif->ar to NULL after the call
> +			 */
> +			prev_ar = arvif->ar;
> +			mutex_lock(&prev_ar->conf_mutex);
> +			ret = ath12k_mac_vdev_delete(prev_ar, vif);
> +			mutex_unlock(&prev_ar->conf_mutex);
> +			if (ret)
> +				ath12k_warn(prev_ar->ab,
> +					    "unable to delete scan vdev %d\n", ret);

Do we really want to continue if vdev_delete() fails? In the pending
branch I added 'return ret' here and modified the warning message a bit.

> +		} else {
> +			create = false;
> +		}
> +	}
> +
> +	if (create) {
> +		mutex_lock(&ar->conf_mutex);
> +		ret = ath12k_mac_vdev_create(ar, vif);
> +		mutex_unlock(&ar->conf_mutex);
> +		if (ret) {
> +			ath12k_warn(ar->ab, "unable to create scan vdev %d\n", ret);
> +			return -EINVAL;
> +		}

Also here I modified the warning message a bit.

The pending commit here:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=9b4ec32e921b34bd7a03d39cc0a75cba7e85dc02

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

