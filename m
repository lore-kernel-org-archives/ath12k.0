Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE58C3ABBF
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 02:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYzGpO37+Mimnv+Uqs5niRwH2D+HWHvLryHL0mzdT94=; b=lY1maH7JfTy/3RqO+C8AgroDOm
	mYU2f2nTZe3DyXJfxaraCi3FePXFjAbk9OnkVT/nL4YJBzp0Dx9s1omPTzey0cInk2lfti7X/jG8v
	p/APk/M+MeT12G6ohWPI7AlR32s8pnZNzjp+gLZ/A2tjNBemeEkioTd+A2P9Y3odrWUQ2jY5S2LsN
	3qc3NGle0dnRKZ2o6fEBK/YUuKG/gSJ3Ls2mNaYhZPpMhGO1npOLxuXOxMwKdMqz2OoEToMrQvUTi
	qjYq6LwtI3t92ieeavgVPSsmv1aej3RoMPtJtqWpx/ODiNVXKO8PVUQgZLeWs7QRZ0du5mFomEtqf
	XU3aOcPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7xL-00000009jCn-0O7U;
	Tue, 06 May 2025 02:22:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4jE-00000008uP0-2zSZ
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EE83A4D24B;
	Mon,  5 May 2025 22:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B04C4CEE4;
	Mon,  5 May 2025 22:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485763;
	bh=TsQGUHxbunuYlL+5yeNWrYVRKxT6Qrp6Bdsbu5dSO3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f3uo+kFepgFiHXPI60VL/BsSSxSb+GaLhjnC0ctlyw/RyZfxjXcgMCpdpYGFPgcq+
	 luvr7jfiaWLzVc4g3o5Xj76Tclqmx51Xe2kuipg0lFxo/GueSI6HGeFxefqDKA3xP7
	 mGdPynbliGZd5rM+BYcmKEjhtBfPUWDgHNU+4ZFXn8Pdrpf8U0rAG2f7oaUUxHcpWo
	 CBcxND9PBsK1y4q9uhvWVIKxIdU5cJv30qEOuKqoxwwVrMVQRKYKB2hF1bPksSJRdT
	 pg/Vaw47nNY3HHFsMnTD/khU0RthNEDrS3LnHEgq6g8CV//7GqhfwRByHc5+gQ0fmm
	 dTKUAj1qlE30A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: P Praneesh <quic_ppranees@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 472/486] wifi: ath12k: Fix end offset bit definition in monitor ring descriptor
Date: Mon,  5 May 2025 18:39:08 -0400
Message-Id: <20250505223922.2682012-472-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_155604_824682_19844A0B 
X-CRM114-Status: UNSURE (   9.85  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

[ Upstream commit 6788a666000d600bd8f2e9f991cad9cc805e7f01 ]

End offset for the monitor destination ring descriptor is defined as
16 bits, while the firmware definition specifies only 12 bits.
The remaining bits (bit 12 to bit 15) are reserved and may contain
junk values, leading to invalid information retrieval. Fix this issue
by updating the correct genmask values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Link: https://patch.msgid.link/20241223060132.3506372-8-quic_ppranees@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/hal_desc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 739f73370015e..4f745cfd7d8e7 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -2966,7 +2966,7 @@ struct hal_mon_buf_ring {
 
 #define HAL_MON_DEST_COOKIE_BUF_ID      GENMASK(17, 0)
 
-#define HAL_MON_DEST_INFO0_END_OFFSET		GENMASK(15, 0)
+#define HAL_MON_DEST_INFO0_END_OFFSET		GENMASK(11, 0)
 #define HAL_MON_DEST_INFO0_FLUSH_DETECTED	BIT(16)
 #define HAL_MON_DEST_INFO0_END_OF_PPDU		BIT(17)
 #define HAL_MON_DEST_INFO0_INITIATOR		BIT(18)
-- 
2.39.5


