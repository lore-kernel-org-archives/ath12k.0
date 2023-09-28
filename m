Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41845E732DB
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 15:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+SgZOD5MiWNRMfBwsIqvgfKXudi7MjWlPg1LnHvbko=; b=vkyXTmoN188DmE
	SYxh34kOSH3+wCL+To31i7nLHYKxVMCyhzcznRudzutuZU55RYQgWVX5t8y6Fm7xbNEvDA2MD4nPW
	OVkJpA0/rlFHQbvblpAdWoxX8BSLe2Yon2kxC7/1DvM8OaB++1aIQeyDlVTskY2eWygY5oG+syMRX
	KrVcvya0Vi0N08DusITIMVfX3vsLNdYP/bLNGILiUHdMk5txBIy0ANUAOycFUt7tcIrgA6U/pOqLc
	8LwjfetH1Zvpl6fOeR+gch/ega49EXZAh2MxUDXTQKqtqjGC1ONcwolSm8qjcoeUaBFMr5v9WbcZ5
	Nn5PiVK2/wXuRBMMZKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlscp-005Enh-32
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 15:08:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlscl-005EiI-2B
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 15:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7C620B81CD1;
	Thu, 28 Sep 2023 15:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5ECC433C8;
	Thu, 28 Sep 2023 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913692;
	bh=MIC9UbCOdRiK441GhtK+nFlmChw9LXZtI7u9HMnkp4k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SKrXrbertGeJq1d+qmKgdY4NVAMZ9tQk40r/AgNd+FzkcqU4yf64yPgVD354xnKSE
	 VU6yzNt1L+QlyoYTamekMMWsFlyKfJTOfipTmHtBtllY37YV6ka5MgVsfZJymhlGIU
	 aLL4yEVp3HIfjvn0K8KlrSAzZ7F1WO9hVydmml9u0daHqLzlZ4qtWKIyr4D2CVw7X0
	 MeP3lgSpZxwgpC0pGXVKOaEcQdPUECwONO9HyTRrMwv+OPfj+SODQdn/oaa9pu70AT
	 UyQ8Fq5PsIEHqSN6kTIMIwIcoBfusFytjr7HI8w6w66OvwJRyLppWJ45VRSyh14Xr2
	 ewVy3ZaNoTIVQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: enable
 IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS
 for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230913105507.17675-1-quic_wgong@quicinc.com>
References: <20230913105507.17675-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591368967.3019228.17079892721310631838.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:08:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_080819_847812_0ADB0304 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> Currently mac80211 will send 3 scan request for each scan of WCN7850, they
> are 2.4 GHz/5 GHz/6 GHz band scan. Firmware of WCN7850 will cache the RNR
> IE(Reduced Neighbor Report element) which exist in the beacon of 2.4 GHz/5
> GHz of the AP which is co-located with 6 GHz, and then use the cache to
> scan in 6 GHz band scan if the 6 GHz scan is in the same scan with the 2.4
> GHz/5 GHz band, this will helpful to search more AP of 6 GHz. Also it will
> decrease the time cost of scan because firmware will use dual-band scan
> for the 2.4 GHz/5 GHz, it means the 2.4 GHz and 5 GHz scans are doing
> simultaneously.
> 
> Set the flag IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for WCN7850 since it
> supports 2.4 GHz/5 GHz/6 GHz in a single wiphy/ieee80211_hw.
> 
> This does not impact QCN9274, because it is not single_phy, so does not
> have 2.4 GHz/5 GHz/6 GHz in the same wiphy, then it does not match the
> condition and then IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS will not set for
> QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a1e09eb35476 wifi: ath12k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230913105507.17675-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
