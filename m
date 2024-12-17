Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93B2E7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AB0YIjOwTtmAJkCRJWdWdbV08p2mj0suBXtgyfEYyO8=; b=TmTHizj+EtvpTAz0r2fIkt6EiW
	CmUInon73t0Xdl9x3WH9iDeCm5oL0eUY0B4i2SLJn+8gP0abXqpBhkdrSHqe7oY2W7QjSVfpxHQFj
	BcoQhBF7MH221XskHM9ZHrBcmgfnH2YLUakuVwEIA35++jCJ1Tg2+jutza5d717OF/SdDuoDSeeGG
	AAKQSzT7QgmLimG03YfJt3y929RQJnacHWdqlJMwlS8jluZ3W9ASn/yj9HQBAH8r6jpM3SI152EFT
	rdOwwVCJ55ZOAeE6G3rXh0r/gxfjSBcfdoY9nl9LgwKvy2/qCobDZ4EBX2/PayNUwSfakQB5jjc5A
	fuZXQw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdeE-0000000EgpX-299q
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:54:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdeB-0000000Egou-2knY
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:54:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C45875C475F;
	Tue, 17 Dec 2024 19:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A919CC4CED3;
	Tue, 17 Dec 2024 19:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734465262;
	bh=Ip8++RevUr73qmcoQSNejgVohU9ec7/h7Q+pmIpAEIs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GZSF24PXxFvmcWdBWgte0+debZRIqZHF3PcJKVL5Fh5iaTF9bgfz+xdiPmWWIepGm
	 wweMgf2ZcfUKDWnRZnIk3cLxdBaJGLtaaucfkggpK6gCLjzHaos+PazKKJXMKI3QfM
	 5q2hrO6BYBQsooWND22B0NU8zqwK+ydddL6P/8mFZ2JGnRoQplAruwhGifX4w65c+o
	 3L5iINwIX3UvjnX5o87rpQ0b7pH2c9SjgigKC0Ile7VFkG94/VtJxrWBg3r65rlcxl
	 DQ2TcZSLTdksSj0T6jksSe6mFqDJLys8Rf6J35NyetiDZ1c5udIO5WicqX/jh+fv25
	 1hkHTtYlmDIDA==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 6/8] wifi: ath12k: Remove unused HAL Rx mask in DP
 monitor path
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
	<20241217084511.2981515-7-quic_periyasa@quicinc.com>
Date: Tue, 17 Dec 2024 21:54:20 +0200
In-Reply-To: <20241217084511.2981515-7-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 17 Dec 2024 14:15:09 +0530")
Message-ID: <87msgujdar.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_115423_752188_E40D393A 
X-CRM114-Status: UNSURE (   5.77  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, CODING and TXBF are unused masks defined in the HAL Rx monitor
> status TLV parsing code path. Therefore, remove the unused masks to
> prevent incorrect assumptions for code readers.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

