Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A621C5AE59
	for <ath12k@archiver.kernel.org>; Mon, 26 May 2025 11:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeLS8rBJa3QlFNPqNPmZtyHuwekqXJKXxDDfTSC7wTQ=; b=gRGMuFVyH2gstZLw8/QQy8k/Zs
	kC/PV9/ooclo9WxXW2wUpu+M/N9mG5k+2V6O+fPAX10G+0+D8lFohSrZcxAvJ3ceCf9QDXM8LLBIi
	nVyAysNr0dXBRasoSotldawzBPHyUmHrKynAcHOpYzJDAIhft+mc/3MnErf8PIM3v3Bnyoycnmpbr
	CGvblurErPAgfhJP0YWlTef7zICg75tWADs2wU64EsLElvRnDUcA2jofJhyADIOa4dR+/eCMPPzUi
	/ehNICQjEgkCKvBriEPuhWTViqJ74ur80i8AyrF/LFXwjifBsmLuZy4SM3uoKpEg4HVJGfHZzyDqB
	STB8gszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWNQ-00000008k7r-11bp;
	Mon, 26 May 2025 11:52:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWNN-00000008k5z-1Y16
	for ath12k@lists.infradead.org;
	Mon, 26 May 2025 11:52:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6D7CA4EC53;
	Mon, 26 May 2025 11:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F34DC4CEE9;
	Mon, 26 May 2025 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748260336;
	bh=m/OPqTtOeOWGN0cjMWn0CbNb8uPAv1c+dguTeasO26A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JDoL/kKKaSk9jl3zUPXAyhGbkth+ySalJ+cLkSgCVOQu1TIsK4btml/Xtl3SunHfd
	 BPuvVTG1m4unmBGKsfSoFpOxSI1ddjqcB/oyUBaRJQjXN/KDpA/Scd5uUdh01+A+ko
	 tUBMkrVPPVHz/21W70lBgvMu8Z8WMRhPiIblJXQdefwUs19mYV1vnWb6ajAkn/Ihkt
	 HjlVa63ASsR1/lnGo4bYB3cQRiA3rVP9T5wX7pZSzjJ6v0+sAhPt49f5BVfwsJHtnM
	 V7dJVgR4xludzUG/HvdM60YvYPeungx0ok1hvMS6jFPclrZKxPIj/pp/4djzBCOzEn
	 JawGvZHhFp02Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uJWNO-000000000fI-054Q;
	Mon, 26 May 2025 13:52:18 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/2] wifi: ath12k: use plain access for descriptor length
Date: Mon, 26 May 2025 13:51:37 +0200
Message-ID: <20250526115137.2490-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526115137.2490-1-johan+linaro@kernel.org>
References: <20250526115137.2490-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_045217_468719_ACAAA79C 
X-CRM114-Status: UNSURE (   9.62  )
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

The read memory barrier added by commit 6b67d2cf14ea ("wifi: ath12k: fix
ring-buffer corruption") is enough to guarantee ordering also for plain
descriptor accesses if the length helper is ever inlined so drop the
unnecessary READ_ONCE().

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/hal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 91d5126ca149..962111c66a3e 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -1962,7 +1962,7 @@ u32 ath12k_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc
 {
 	u32 len;
 
-	len = le32_get_bits(READ_ONCE(desc->flags), HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
+	len = le32_get_bits(desc->flags, HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
 	desc->flags &= ~cpu_to_le32(HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
 
 	return len;
-- 
2.49.0


