Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CB4C48BF8
	for <ath12k@archiver.kernel.org>; Thu, 22 Feb 2024 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRArE7dUAcUWsYrGH5QpXG60jI/Bywls5niWJ9K/z5s=; b=3UTsiXVA4xX+G76oA3Y1kSOVS6
	jBRxE4MrShx7UADuoLGFfgYtliaCMPCsy4xmBQ7QqEQ3IZx2OiQ9WFHx2fyHncVVwTehKC0mODeKo
	NRhz9T0+zL7T094J8xofUl0UuSNaaboGjjxjC6Cz9+ooG+n03du1l86eEXbt4yTxcvSaKeMDlANZh
	WlhalL/7RhQYKVLaVpxMTyajBxWqQxLI9XjOx573FbfzjoY2gOoGfPkI+w1ycc5c5J3bgin6NhEAR
	YjZc2oC0iRmA9g81DTugbplfxYJGA/mE8k2BffcEMYATKTue26Dc13E1poIMjcZWKj+Ul0DAcNylu
	4joHC3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd6YC-00000004WZ9-2CoE
	for ath12k@archiver.kernel.org;
	Thu, 22 Feb 2024 10:43:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd6Y8-00000004WYA-18BD;
	Thu, 22 Feb 2024 10:43:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75BC861795;
	Thu, 22 Feb 2024 10:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11CFC433F1;
	Thu, 22 Feb 2024 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708598611;
	bh=PHAYR+G8AEvsMILj2TGvpVCTUhyBs8YZi1hH4Qg/CIc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=e8gXrHGNxRBvV8NmJaFSP9Ip3AIwZiihjEDfH3OpsgfZO7tBFvo9ycEWl+sx8/ylu
	 Q54AgX97YFkgBG8iIGtXWhSDzV6uaSdowshlosM7K2oOO/NuBxbKYgwp3qPMXuq/0I
	 A/4od94pfngBbhr0jvHTiH8zJTfKK4U5zu573yYc4Ze31M4FXf5JF8GssRk9qUZ8Z8
	 v68zyR/HGYp/c7a+0udvGRReSXs/seAVcpHkdGwjcgh0DgJiWg8N56whYrys3q3I2v
	 O5r2v5dV0C4p7UNkvFhzqVkfz9g/ZBJQ7+7mJjR04PWL7Ypo65K6TFuNEJr8N7CK16
	 WCV3nPUh5WQJQ==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org,  ath11k@lists.infradead.org,
  ath12k@lists.infradead.org,  quic_jjohnson@quicinc.com
Subject: Re: pull-request: ath-next-20240222
References: <87plwolx2z.fsf@kernel.org>
Date: Thu, 22 Feb 2024 12:43:27 +0200
In-Reply-To: <87plwolx2z.fsf@kernel.org> (Kalle Valo's message of "Thu, 22 Feb
	2024 10:31:00 +0200")
Message-ID: <87h6i0lqy8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_024332_378255_214FCB64 
X-CRM114-Status: GOOD (  12.26  )
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

> Hi,
>
> Here's an ath-next pull request to wireless-next. More info below.
>
> Kalle
>
> The following changes since commit 2a71528427c635f0a8bff704b2e62ce81c641d6f:
>
>   wifi: brcmfmac: fix copyright year mentioned in platform_data header (2024-01-31 18:48:06 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git tags/ath-next-20240222
>
> for you to fetch changes up to 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5:
>
>   wifi: ath11k: remove unused scan_events from struct scan_req_params (2024-02-15 13:24:18 +0200)
>
> ----------------------------------------------------------------
> ath.git patches for v6.9
>
> We have support for QCA2066 now and also several new features in ath12k.
>
> Major changes:
>
> ath12k
>
> * firmware-2.bin support
>
> * support having multiple identical PCI devices (firmware needs to
>   have ATH12K_FW_FEATURE_MULTI_QRTR_ID)
>
> * QCN9274: support split-PHY devices
>
> * WCN7850: enable Power Save Mode in station mode
>
> * WCN7850: P2P support
>
> ath11k:
>
> * QCA6390 & WCN6855: support 2 concurrent station interfaces
>
> * QCA2066 support
>
> ----------------------------------------------------------------

Pulled.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

