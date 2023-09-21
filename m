Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F759E706E5
	for <ath12k@archiver.kernel.org>; Thu, 21 Sep 2023 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXA8V2zEv3pyVxxPCaGQN0tw3Vh7xNTZFjjZA+BsX4c=; b=YQRlKmYfgXCbhQ
	GpWeqe9Dn8F5sq/cPEr98clYwLw8i/2UjETmrbGDG8c1qw20uNymz6VxQV+wTg7qDBRYd/2kGSEUF
	cHxuiyKwaOP9Ga0VZ65RqNh2AcMkq3F9XGW7LjailJvGPPXU30ofwRVzs+HmKlarCOQlBHd6Sk9FI
	g0T5X6tLcE8VwUXF9rlDE9dtoIBAJgRGXaDelRbVeyoGdINJlbjd0Nj0uPX0gYK87YxmJAq6BSwY+
	102abWpw7jC+Wl+4//cpGaUZ6Bk1w0ysjRNGoj7GU/vCS1bfEaxa2K/ha7zYfZMyGoUsaeTiHZfiH
	SGaYYxk/XLy9YNzwmC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEeL-005RKw-2a
	for ath12k@archiver.kernel.org;
	Thu, 21 Sep 2023 08:03:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEeI-005RJa-0n
	for ath12k@lists.infradead.org;
	Thu, 21 Sep 2023 08:02:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91D2D61E7C;
	Thu, 21 Sep 2023 08:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C98C116A9;
	Thu, 21 Sep 2023 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695283376;
	bh=IOdNZNubT9aIKkrAuzJC/mLMct1EI8QHVI/pL/hli6Q=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Yrfq946hPwnkGTVSaqo00WtrSsQR6WYrjwOYpxTcuW55WmhTsfyf2usR/CG1c2g8z
	 g5u55R+5BWMI33pC1C3rRf4lIb/h+RWUSotdn+Ac9L20pMNEEujkXFLHaA/3IldEMS
	 AXet4R2lDMMejOt6LrAK6LU1jyT7QbryeFri3UsnOObWMUwl0YCgAPMrNLqaZFuy6q
	 To1gNw0nn5VXYqCXVemoLwIiUDZoxKbHCeQOEbnzhN60IVRz/45zhqSaTlBsZc525Y
	 fn+1YfBXtHSRFIYIoAtSkfRKhX/eMWBxSLI5EnevQHBFYPeKNf7R5olAr5BhAvAvw7
	 3p8fdfccf40PA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix DMA unmap warning on NULL DMA address
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230830021131.5610-1-quic_bqiang@quicinc.com>
References: <20230830021131.5610-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169528337320.1539628.12793449694122971146.kvalo@kernel.org>
Date: Thu, 21 Sep 2023 08:02:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_010258_326959_87AEE743 
X-CRM114-Status: UNSURE (   8.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> In ath12k_dp_tx(), if we reach fail_dma_unmap due to some errors,
> current code does DMA unmap unconditionally on skb_cb->paddr_ext_desc.
> However, skb_cb->paddr_ext_desc may be NULL and thus we get below
> warning:
> 
> kernel: [ 8887.076212] WARNING: CPU: 3 PID: 0 at drivers/iommu/dma-iommu.c:1077 iommu_dma_unmap_page+0x79/0x90
> 
> Fix it by checking skb_cb->paddr_ext_desc before unmap it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9ae8c496d211 wifi: ath12k: fix DMA unmap warning on NULL DMA address

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230830021131.5610-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
