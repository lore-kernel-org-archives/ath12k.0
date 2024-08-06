Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A996C3DA64
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL6JD4J0/c4/ln9lyy3BlO698kTweg8ML3al9nmemHs=; b=4L79EpRtOXo46gyBuBI2pQR8Cl
	kUZnGtK68QAVogmpOkrEZKXtyUcbOp7c+fr9veDGKDKTiKx0fB86RkOi8fW3zvxj/Yd+eicnyvmzj
	eFxC/T/4xioi4V4hBtPkk627OHsKRbl6ntCtbgr9riUK5cvx0mWxOwyyrfQSqRxJgY9FK9dKR9mgi
	TVKEUK+UsMi58/c9afAdtVSsp5fZL/B4LJ9+X9NrdunW1bw/Qwt7SH9ISAnNIS+3514ArvgSp7i9K
	FqrwkZ0HdnPkPDD2wNsPfXSA3dEN9BL5moKXIw+aVpDud+O/2HmqOXxIj0rk11xUesggrUCzKs0AP
	YWDXQa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbJIt-00000001VSb-1ADO
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 12:28:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbJIr-00000001VRd-02Mq
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 12:28:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CBA3ACE0C72;
	Tue,  6 Aug 2024 12:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280DAC32786;
	Tue,  6 Aug 2024 12:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722947314;
	bh=HdTMVRdc12tPj1LHH7gWkcRksixd5PCo1Ix+DBmm/+4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JAUK+xEqzffYMK0JpAmf0IiZmXUkA4DKE0Ed5a0/XqTk5Yfo+R59TUIcJ/XfR4w4O
	 1eyta/Wktf3cPl+SXAgFmJXAlZK0r225qcLDiiQVwDJcpLk6Smb6566pf2CT7JMD6M
	 lXWa7P+4sRA5Nz2v1HCRYA0rShYxh1ZJ1VN0+INFrGeNNFgb6CDkKGD8RL1EHjlNwr
	 4aWz/i+/IR5mockfRaBCauxO6lpaHHmqJYKpK36ZFWAT9i9yhbpTUYgyHhOq9NHu1A
	 j66+kZkz3KLcv8bet3Efh5BMaOOrfREZEeH9POlJx4yKRVsPgT4vbU3bVsVwpN1xXc
	 ksfXUwk1OhN0A==
From: Kalle Valo <kvalo@kernel.org>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram
 R <quic_srirrama@quicinc.com>
Subject: Re: [PATCH v6 1/3] wifi: ath12k: prepare vif data structure for MLO
 handling
References: <20240711165511.3100433-1-quic_ramess@quicinc.com>
	<20240711165511.3100433-2-quic_ramess@quicinc.com>
Date: Tue, 06 Aug 2024 15:28:31 +0300
In-Reply-To: <20240711165511.3100433-2-quic_ramess@quicinc.com> (Rameshkumar
	Sundaram's message of "Thu, 11 Jul 2024 22:25:09 +0530")
Message-ID: <87plql6djk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_052837_245395_C2FB1AD3 
X-CRM114-Status: GOOD (  12.18  )
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

> From: Sriram R <quic_srirrama@quicinc.com>
>
> To prepare the driver for MLO support, split the driver vif
> data structure to scale for multiple links. This requires changing
> the use of arvif to per link and not per hw which can now
> comprise of multiple links.
> Also since most configurations from mac80211 are done per link, do refactoring
> of the driver functions to apply these configurations at link level.

Something I noticed while reviewing this patchset:

>  static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
>  				       struct ieee80211_vif *vif)
>  {
> -	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> +	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
> +	struct ath12k_link_vif *arvif;
>  	int i;
>  
> -	memset(arvif, 0, sizeof(*arvif));
> +	mutex_lock(&ah->conf_mutex);
> +	memset(ahvif, 0, sizeof(*ahvif));

Here we are we clearing ahvif so ahvif->deflink is NULL.

> -	arvif->vif = vif;
> +	ahvif->ah = ah;
> +	ahvif->vif = vif;
> +	arvif = &ahvif->deflink;

So here we assign arvif to NULL.

> +	arvif->ahvif = ahvif;

And because arvif is NULL this is a null pointer reference, right? Or am
I missing something?

I'm still reviewing the patchset, please don't submit a new version
until I have said that the review is done.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

