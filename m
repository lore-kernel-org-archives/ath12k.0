Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F60CFB443
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beKEKKKUI96mL4yCmoRM9zvlrs/OghZLvqgIUgINyDs=; b=jstoAyGxI4+5jzOebNI3GIrao6
	okiEjfNPDL54vMR9bRLdO1hjk+mfTQIGsJaFmFPQbP+LrzfvOYNjyONKyVfn/wfM/nbtOF/8rCmwW
	Buiiomc3Te8eaerrbD0Ou9bWDcTRh16Ay3ddkt6Yu6a3I4v85D9C9l6tSotV4qZewUTRTuXXl1b3h
	VLLVtEcv2VlaA8D2Kv0IcBUa5GWjtazyXb/lb2fNbaHn9zGPso0F4uUsL5s3zISp8qm89RrG6UCCk
	qFEENXz2Oe089yaZZOvesuFZyhYnwTwtnZObltWYGrDfFEG/mzlfDnGEWNqc7UAwLlv4tN4bM5VwL
	qSTR/0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxp1g-00000002n6D-3Wam
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 14:47:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxp1e-00000002n57-2jE2
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 14:47:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D6A4A40EA9
	for <ath12k@lists.infradead.org>; Mon,  7 Oct 2024 14:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5724C4CECC;
	Mon,  7 Oct 2024 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728312473;
	bh=kta8IrAtkDDz8HEN0uJc8OGNkCcT/daoqsaHxC+ytP0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=foNpH4tsH5efDFICChO/4CUQkKmxxdiVQO4Lab9BCGpF3oLMEijZKIXhaNlCSVIs3
	 A29o6ADurF6j4oTh2gfs2/2OmD/zD7IFZy8+b+Q/ktfvZKVqlzCQ4gzzh5sFbeYvL6
	 xAhHLFZT2VSQm9mq6K8t7D/5gMt/LwApkdPO99rXmSWyP/G3ANJ/bwNoCS1ra5go9x
	 i1Tmgh5t277aOj0x9q6voVq1ag5j2/1HiWe43ysOV4FNGa5gSb2n0doEkajzhOA09r
	 bFE+ruG+gUwDewSsUnRA9arb1F+BkhThihoBvYoO4c0P6pszuxnrdQ/QosnwUiLtf4
	 puKRqMILHBZlQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC v3 3/6] wifi: ath12k: switch to using wiphy_lock()
 and remove ar->conf_mutex
References: <20240924092515.1049885-1-kvalo@kernel.org>
	<20240924092515.1049885-4-kvalo@kernel.org>
Date: Mon, 07 Oct 2024 17:47:50 +0300
In-Reply-To: <20240924092515.1049885-4-kvalo@kernel.org> (Kalle Valo's message
	of "Tue, 24 Sep 2024 12:25:12 +0300")
Message-ID: <87v7y43r6x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_074754_777325_A6C318F1 
X-CRM114-Status: GOOD (  14.63  )
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

Kalle Valo <kvalo@kernel.org> writes:

> From: Kalle Valo <quic_kvalo@quicinc.com>
>
> Switch from using driver specific ar->conf_mutex to wiphy->mtx. The benefits are:
>
> * one lock less and simplified locking
>
> * possibility to use wiphy_work_queue() without other locks
>
> Most of the mac80211 ops are called within wiphy_lock(), most notable exception
> being tx op. This can be checked with lockdep_assert_wiphy() from
> net/mac80211/driver-ops.[ch] and I veried that by manually going through all
> the ops in ath12k_ops which had lockdep_assert_wiphy().
>
> The conversion was simple:
>
> * All conf_mutex lock() and unlock() calls which
>   already were called under wiphy_lock() I replaced with
>   lockdep_assert_wiphy().
>
> * The rest of conf_mutex calls I replaced with wiphy_lock() and wiphy_unlock().
>
> * All lockdep_asset_held(conf_mutex) calls I replaced with
>   lockdep_assert_wiphy().
>
> One exception was in ath12k_core_post_reconfigure_recovery() where the wiphy
> lock needs to be taken before hw_mutex to avoid a lockdep warning.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

> @@ -6432,7 +6411,8 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
>  	int i;
>  	int ret, vdev_id;
>  
> -	lockdep_assert_held(&ar->conf_mutex);
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
> +	lockdep_assert_wiphy(hw->wiphy);

The assert is twice, I'll fix that in v3.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

