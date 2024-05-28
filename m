Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3D8C25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7+MmbYJweCFJZ6FptiJK5ft9rfNuytH0xsHp7M7F+U=; b=yPsN42QupvqFN3Px+PLBgGgVrM
	Ty9Znxz9Bvmy93pkK9HMv7rQ+mGSxM+MJ0cpXutNaD+KOOnPax7cdJ0CoJAlcOmqpW4aauBSNVn9p
	krvAkPEmZNNCbN95yJAOJ37cyHQO/B/RX5cWBcXkYVIS1wj6eTlxZ8lcesbZCRMKpB+80gPlftrqB
	o/UPbEr3TcTTzNqLYeEmRcK1JxA8FMhDvntqz2re56ZG/+I6/A1hMn7QfkCa89Oq33+oZtzyM+F78
	0dfEgOkP2OevfhkbRHlRk+aY4fgl9ttByZTpW11yL/QtGbo4rTMUzEN0QDYl+GF6yo+EN9dGZJS4o
	iO+tOfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0tT-00000001as0-0X9A
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 17:45:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0tQ-00000001arB-2NRn
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 17:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9C9E8CE0E7D;
	Tue, 28 May 2024 17:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADD4C3277B;
	Tue, 28 May 2024 17:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716918345;
	bh=sKLWwnpnlmhE+bUX9QrAVOLuHKIQAriHb2GHbk54UC0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SB6n8E0DKc2y1A29J2akEghPSSOAngxwmBGoXhGOx//9nROxUl+sCay3NiBchHkwz
	 YqHx/qi7pByY+rsVhd+EdikmbSGv6WC6xLqGpZgRGFt7X/G6p4kCMQ6pBO+V803UFx
	 tLd45rGxgrwt7NkmuvqX9CF3lBBUphGfLCdpUY9+NW+hpPxTxU1nANhzOaBlao2LYg
	 j3v3fPn14KUZRoAF1RMctGf/H46VZJzncOmsMZ59Mz5aP2BWim4gL1v4XDx/8xkhrB
	 iiW3NxxPt1jRYkzo2DXdpxpouP5+3v7jTuCu7C30fu72i/p87tsI0kypNvSAirpJrB
	 8VDZZ+18bu2ow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix wrong definition of CE ring's base
 address
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240524024021.37711-1-quic_bqiang@quicinc.com>
References: <20240524024021.37711-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171691834316.1700985.14768410364524258045.kvalo@kernel.org>
Date: Tue, 28 May 2024 17:45:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_104548_825066_D147E32C 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Base address of CE ring is defined as u32, currently this works
> because DMA mask configured as 32 bit:
> 
>         #define ATH12K_PCI_DMA_MASK     32
> 
> However this mask could be changed once firmware bugs are fixed
> to fully support 36 bit DMA addressing. So to protect against any
> future changes to the DMA mask, change the type of the fields that
> are dependent upon it.
> 
> This is found during code review. Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

0ae570703754 wifi: ath12k: fix wrong definition of CE ring's base address

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240524024021.37711-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


