Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFA9C3DA42
	for <ath12k@archiver.kernel.org>; Wed, 10 Jul 2024 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6Rn/bJCuLHmyP71FdbZN2E5X2MK6Vg0AP2VOTXKTGc=; b=zaubrEseOUUua4pTXZiT8njHmg
	xpBvEX1b1mkaNFdBFpIFqX55UoaYO/D1xBgbU0xwro6PW/vqwGG7OIDjRcFsoZh64m7yfLiLxzdwC
	+6mhYN5S2wn7h8m8p8FT5PU37OeDbgz7xjwpZP6ckqlq9841ARPk2j/AkW+rzTsWfFo4tEZvHve4O
	L2BN62c0cudnzNJSP5OweHxNd75C0dV9egKP+qpA/6UnFuiQP6LLYlkNDzdGf14SWsm8M3QC1F0jU
	0DElEF2NereyzTCszJVwuNj8MtzqfAJcAl2eBMfZawi4RZM/so+lxmKploxpPM2ppMR5WYLMvKRr4
	rEDq4dIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRaBl-0000000B9t2-3HeW
	for ath12k@archiver.kernel.org;
	Wed, 10 Jul 2024 16:29:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRaBS-0000000B9kW-17gx;
	Wed, 10 Jul 2024 16:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D45561489;
	Wed, 10 Jul 2024 16:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2294FC32786;
	Wed, 10 Jul 2024 16:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720628925;
	bh=EgdzbU+3yPs9BQQAdZ0RzeqYD2FW6i/xT6qw+amuVHo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=oi9/eEpaRAr5Vfg+21ANwLl8HQbTTFLz2DGjObapagXWPGGZWdXCWDc6KBqVOOLUK
	 poGhOkpOY4Yjvjt8oS+hZPEGWyDuYl7MdlsX5EYqSl/VGSylOs4wGVYPGK5pzLKXMp
	 wV3Wim0rNsssrtKBJVLSKmNKt073dbr6Lcx553BO8OkHG2ybPhlpbzOWLRuwD/65WV
	 AliNsL6HAKgkU/bonY4ofnhmoVOr9j1y3V59b4V+CXGXD8CH7h40ctukG4PWLfRVY9
	 M8HxIT+Z+ztSADWLRHBSb2+bxSk4QQSIHrIQhRFwjV/MqdI2nds0pS0obB8N4Ozjhu
	 MXCdY0R/AQHLw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: fix array out-of-bound access in SoC
 stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240704070811.4186543-2-quic_periyasa@quicinc.com>
References: <20240704070811.4186543-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172062892254.1204645.1517943007872278005.kvalo@kernel.org>
Date: Wed, 10 Jul 2024 16:28:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092847_209712_A30DB240 
X-CRM114-Status: UNSURE (   7.17  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Currently, the ath12k_soc_dp_stats::hal_reo_error array is defined with a
> maximum size of DP_REO_DST_RING_MAX. However, the ath12k_dp_rx_process()
> function access ath12k_soc_dp_stats::hal_reo_error using the REO
> destination SRNG ring ID, which is incorrect. SRNG ring ID differ from
> normal ring ID, and this usage leads to out-of-bounds array access. To
> fix this issue, modify ath12k_dp_rx_process() to use the normal ring ID
> directly instead of the SRNG ring ID to avoid out-of-bounds array access.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

e106b7ad13c1 wifi: ath12k: fix array out-of-bound access in SoC stats
69f253e46af9 wifi: ath11k: fix array out-of-bound access in SoC stats

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240704070811.4186543-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


