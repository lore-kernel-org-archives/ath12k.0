Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E7AC25B74
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KM2qjXkjGXIYQgaqQPDuQFLrz8u1ucJBKrSSjRc+Tds=; b=1lmkZoJcYAH1W7l1qPKMkN7M7I
	ZTwEnK4ST+0g3H6UAGXIqm+zH9uYvm1ZPV6/OcY+BnMWq3alIBK/Pdk2mS48bQW2BCVKCIVg7kQK8
	4Crhn/y66jqnT8hcu2FJS1fzq8a50oOlC1EL5mhkcv/sd9oXqHpxbvtYaWEZtc9ioXN8OPsBBKgz3
	PdZKgzaY1W0TLXXFyTNFLoMajzUWRQ6t8oM08Nqr1YwKacit9EYvohvPfT8Yk6n3xGC8w+T5diXac
	NJJf+JTEDEqJJ4dZ8slDNMBgS1m8kme24HimrZOdlIYdObSMp+pXwGu0oN83gMvzy492P1xL51UKj
	HN0BujSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WQZ-000000048j8-3F6D
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 08:25:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WQX-000000048hr-0Yxd
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 08:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0CC29CE13D7;
	Thu, 16 May 2024 08:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821F7C113CC;
	Thu, 16 May 2024 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715847918;
	bh=6FvXY67QijEXcpeNfgnrirFNHmtBhw7HjQZnfRwkU0Q=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=F7UoYMLoQC/wmnVWcHSCuF7ry1RkiLRgZ95wPAEVWBgbb+mv2bnMqEvzTivY3rKpP
	 F4X5CnmsypB8q03QoMDR8jBpFGaRmLPkzMl8tRYhR/s49fRqD89pPQQvP243UgDHHE
	 WddvU2NcOY3AlflgL6HKFol5zPpqn/+Bh0Jp13YAf/lh8VhuGsgmBAZcTX2jC0oqoX
	 xTqfZxGtpfr9dIAG2nnOTVAI9NI6Ylcg9BhhCrhpfCN0vnT6zn56KzcjiyFoiw5NmE
	 tQoWE/HA+DiIXWiwleoXJOa4eiGLdByzgAvVA92BtC8FlGeROCo58z7ywL1nFMI4K3
	 zlQcoM2ZULitA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: Fix Tx Completion Ring(WBM2SW) Setup
 Failure
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240510070427.206152-1-quic_nithp@quicinc.com>
References: <20240510070427.206152-1-quic_nithp@quicinc.com>
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Nithyanantham Paramasivam
	<quic_nithp@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171584791537.2781522.14910135960105060836.kvalo@kernel.org>
Date: Thu, 16 May 2024 08:25:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_012525_410501_929E7F15 
X-CRM114-Status: GOOD (  13.14  )
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

Nithyanantham Paramasivam <quic_nithp@quicinc.com> wrote:

> We observe intermittent ping failures from the access point (AP) to
> station (STA) in any mode (AP-STA or Mesh) configured. Specifically,
> the transmission completion status is not received at tx completion
> ring id 4 (WBM2SW ring4) for the packets transmitted via TCL DATA
> ring id 3. This prevents freeing up tx descriptors and leads
> to buffer exhaustion.
> 
> Currently, during initialization of the WBM2SW ring, we are directly
> mapping the ring number to the ring mask to obtain the ring mask
> group index. This approach is causing setup failures for WBM2SW
> ring 4. Similarly, during runtime, when receiving incoming
> transmission completion status, the validation of the ring number by
> mapping the interrupted ring mask. This is resulting in
> validation failure. Thereby preventing entry into the completion
> handler ath12k_dp_tx_completion_handler().
> 
> The existing design assumed that the ring numbers would always be
> sequential and could be directly mapped with the ring mask. However,
> this assumption does not hold true for WBM2SW ring 4. Therefore,
> modify the design such that, instead of mapping the ring number,
> the ring ID is mapped with the ring mask.
> 
> According to this design:
> 
> 1. During initialization of the WBM2SW ring, mapping the ring ID
> to the ring mask will ensure obtaining the correct ring mask group
> ID.
> 
> 2. During runtime, validating the interrupted ring mask group ID
> within the transmission completion group is sufficient. This
> approach allows the ring ID to be derived from the interrupted ring
> mask and enables entry into the completion handler.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

0ce9ab2785e4 wifi: ath12k: Fix tx completion ring (WBM2SW) setup failure

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240510070427.206152-1-quic_nithp@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


