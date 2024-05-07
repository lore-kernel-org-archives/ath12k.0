Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F18C10F1A
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 10:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1KXweFD83+gjl95HwAF4SWCZCx4o76PDC8jjNAzdA0=; b=ckPTZw6f1xExT8Sqvi/y2v5ssi
	GowI2gMOxzTuOfv7XBQaVLi6LZy4aTFrihMaC/8/xD/s5x/HHcWDnNkdVmlMaTV/sq16v2DqIR+Mu
	xZDDr3iN1tlA8GDYJMNEU5WpcMaJrowMzuNIdsGMDHTHzJUu8PPWuEd3RulFvzMKsm4ty+Wd417Tp
	u6Pa8laK/vQ5aTbp5oSgyG3+UMpa31nuj7ZWBG38T7j8Ohi02xIf3EHVDOtHPneiZkEGiEco8VQnW
	+chwMOYdUUBR0GbWeieZp+xvENFYqkU6A75YTU9F1/poOHESCCURHo1Bzf/x1dSBSOuj82MqalU41
	mUvrF0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ISp-0000000AcQk-2gh4
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 10:54:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ISn-0000000AcPy-3r03
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 10:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66EA060C2B;
	Tue,  7 May 2024 10:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B813BC2BBFC;
	Tue,  7 May 2024 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715079265;
	bh=x3+TjIsYg6xVZcpqHsEC6+vHNVSJS+vbAGLYUkgzoHY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=oRSHGPstoXLM047W8nTxzF4tFZ7raDGOAmpEJB9rhPiCcoLHBjWwoJHmZdtkfxVdT
	 QlvDSgvEJ0EqXM8xPMHtTlgczZ5QHkPZ3fPmGCCKqB3hMo+Hg9TczVvCyVRUhZ5KS0
	 lW4QVQBKoYUw0pfodhxPlPviHpbaAwWaKmGQQ+ru/UK9uLfQMvXuDy0XwvifE8iM/s
	 uy+ts1jMRRXeEf0A0meDdPNcItDiu6+r0YdalFc2DvKJhOdZw/XLrvET70SLOvLDAD
	 y4Fs984dyHSmDEy5VsJQpr5U5NlrD3NTo5lutoEo0wKZ0ZRYwnqHuZxI7hS2aPEbmv
	 Mvd9r2RSrNLYw==
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
Message-ID: <171507926213.4120318.15441054563934456845.kvalo@kernel.org>
Date: Tue,  7 May 2024 10:54:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_035426_066535_4DBF33C7 
X-CRM114-Status: UNSURE (   5.42  )
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

There was a trivial conflict in ath12k_dp_rx_pdev_srng_free(), please check my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=238d04b67c32e99181b0249bb847b11ce702960b

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-1-44d2843a2857@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


