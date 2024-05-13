Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CC4C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjIku5eYV7xOB9IKFCuRLXcKU5G+Kz397KogYUkOmWU=; b=grVp7wFKffPeMoynP26MjMnIJv
	iiF4bS3IZRfHisORrv3GfbnwNGVCNVUVrf0X8ksEL7ovtwaGnPJO3/Fj3IgQLgyBSr4j9aRuCPxJB
	qrJ1Vp7MXgm0vZoI/vKA7N4GNgdWVH7R1AjK0i0gTtQKYeG1yLpT/9JGtj0z2jZVfJDIqRRgHUyIZ
	/tTa1jquwLvZZ0xTOPlLbhO03daCGN0nOn7+jyAavWofijWLXaI/b/MKWV+AYtWXyHtUolirKqAJc
	wGgqjTkiSuLZ4crMPmN+IOP0y5xO0kG2nsZhkUoV8PMTWh5ZjA5umkE0AWjne16Fip0ftJ/u/kJdr
	cpqKmImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WS8-0000000D9Am-1uUi
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 14:14:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WS5-0000000D9A0-4BkR
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 14:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D57060E07;
	Mon, 13 May 2024 14:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E431CC4AF10;
	Mon, 13 May 2024 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715609693;
	bh=UPuauCYh36dyevJphL1EJxVRpRWQSPlcqWsuOaWqJYg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kUx2QbRK0U2xWMPGy+9v/76znz5fhfdeGGXl8g4bm5sRXIPEVuPo1yvjLwIcedQdc
	 qM9lJHG4GrWsNYcRX648GkGYJcxHZ5pHZrocQWl35aTA5TZXfLah5xHJ217FqqCYgT
	 aEZNs2qSKFif6KmNkRx8KcN2yvHkPcuDIuBgmJzs9bNve2BoSiGyOekQP/BM6tBGzT
	 TFL6/Jumm80F2Nwza/pWfbzcU+5i8oLXE9y1XFLeTKDjrIqhkSi8d6W1t/9Uga427y
	 nNhKbegS6z/nZB2N1PeyqQJyuqiGMvvLRZc+QJMJUEVT6JTy5WxRkFw2jWvFeDWM78
	 xbq5p+bwx4iHA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: fix misspelling of "dma" in
 num_rxmda_per_pdev
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-1-44d2843a2857@quicinc.com>
References: <20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-1-44d2843a2857@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171560969001.1690511.12764694198482040352.kvalo@kernel.org>
Date: Mon, 13 May 2024 14:14:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_071454_111211_DFF4C9B1 
X-CRM114-Status: UNSURE (   5.28  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> The ath12k_hw_params member num_rxmda_per_pdev contains a misspelling
> of "dma" so fix it.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

ff5fa958d2fd wifi: ath12k: fix misspelling of "dma" in num_rxmda_per_pdev
3b9344740843 wifi: ath12k: initialize 'ret' in ath12k_dp_rxdma_ring_sel_config_wcn7850()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-1-44d2843a2857@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


