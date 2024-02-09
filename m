Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71DDC48297
	for <ath12k@archiver.kernel.org>; Fri,  9 Feb 2024 10:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUEkhgX5BLiL39OF3y78mrwwqhPp2Bu3Sj2bWugIPNU=; b=ZtC2NFdb9VtAl20OjM7cqikNUY
	Q+fzCHFGpOvVkH1FQbtYtG55Ku1PmJW5z3IGAbhmy4EuyM0nKdJYMyFxDGqGzU5RCR64Ybdgtbsa9
	mx67Xr+EUtP/XVuW/HCVSifYABIApXZu2+SFbUjQn/nUN2xPmuMoCwki4EWgCMe7BdBUQrW9JbxIf
	9JS4FliE3/FoaOEZkFBo4L9FiOGCPwcQMET385XWiyuma3vj7F1GHQIEqMElEMARCVliJCTwTE500
	5ujIJ54kliAnpSrPnTdiDnwSfaiaxd62uq4HXk3wo2BnrL5ezFJXlqRW/XNWnyAqRRZLeTNtiyZ3q
	JKKDc/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYNsK-0000000GgCy-27K7
	for ath12k@archiver.kernel.org;
	Fri, 09 Feb 2024 10:12:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYNsH-0000000GgCV-2R1N
	for ath12k@lists.infradead.org;
	Fri, 09 Feb 2024 10:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76C3ECE1EB9;
	Fri,  9 Feb 2024 10:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E722AC433F1;
	Fri,  9 Feb 2024 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707473566;
	bh=m/Ioyes5yrICnVycteB2uRJv/WQnHgJIFWkW/s4fuDg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=vGUlxuX1OdonFAVzfZ213gPef8sxWeLo4PbBTsbwDRjL+1NUifdntMm+a4slkjBpV
	 aIcwjhUr8hRlFMGkV5ECueKZR/ZfPTl9Ryo0z0ByFR1fS+ToVJNwcOq1DhcwKZwDud
	 Fnmvd3hn2pMukRpgo/eb5ILF4r74NIipXu7JqnKP1Yehb1GPeHdd2faKGDL8T01jwJ
	 NuvzRu9HYPsGAp+/0goPDwMWSn9fwJu0Q3Ot4Xd6k1CLUDRAGUnKu4zXGKKMpb/OOT
	 BtUp4VGWQU5lsLa8cLyN/ByEomUVcCvcuoQXg0PcSAW237UFGrfy9AmoSbNQ7nNVds
	 AoUBQjPczEa4Q==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: ath12k: Refactor hardware recovery synchronous
References: <20240130060838.3895599-1-quic_periyasa@quicinc.com>
	<20240130060838.3895599-3-quic_periyasa@quicinc.com>
Date: Fri, 09 Feb 2024 12:12:43 +0200
In-Reply-To: <20240130060838.3895599-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 30 Jan 2024 11:38:37 +0530")
Message-ID: <87sf22osis.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_021249_813227_78D0E047 
X-CRM114-Status: GOOD (  13.42  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, in multi wiphy models, radio/link level synchronization is
> sufficient for MAC hardware (ieee80211_hw) reconfigure/recovery procedures
> since each radio/link is exposed as a MAC hardware (ieee80211_hw). However,
> in single wiphy models, multiple radio/links is exposed as a MAC hardware
> (ieee80211_hw) through the driver hardware abstraction (ath12k_hw) layer.
> In such scenario, we need synchronization between the reconfigure/recovery
> callback operations (i.e., ath12k_core_post_reconfigure_recovery(),
> ieee80211_ops->start(), ieee80211_ops->reconfig_complete(),
> ieee80211_ops->stop()) at the driver hardware abstraction (ath12k_hw) layer
> instead of radio/link (ath12k) layer. Therefore, introduce a new mutex in
> the ath12k_hw layer. This approach ensures compatibility of the hardware
> recovery procedure with both multi wiphy models and future single wiphy
> models.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -600,7 +600,12 @@ struct ath12k {
>  struct ath12k_hw {
>  	struct ieee80211_hw *hw;
>  
> +	/* To synchronize hardware restart operation */
> +	struct mutex conf_mutex;

As we discussed already offline, there's a high bar for adding new
mutexes. I would rather remove the existing conf_mutex than add a new
one.

Also having two mutexes named 'conf_mutex' in the same driver is risky,
it would be very easy to confuse the two.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

