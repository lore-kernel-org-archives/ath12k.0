Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBF9C369D2
	for <ath12k@archiver.kernel.org>; Wed, 25 Sep 2024 11:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IH4mvBrWbbziALH4zE/FcRLJTcXZshxhG79mgpyIbeA=; b=CmJD2dxmFxgtNB7Bm9VB4UnjeP
	h9ezz/9kYoU91AlOgWewneOLAvldHB0nqyJu2lktJ3scxZkqHt6MJsjLSyi8vBn+8t20h6TRxPs6m
	XSRcMqZyxswX1MvNdyzSvoED3Uevu/1/n3wkd5l5qPf1LbN4zIhN+KexmjmTL2f2UF8eNKbdxq3kw
	kcwexc8iRQ+5gSr5Z/JB66Pr4Cefl48w9evciq/XELC7wjIaed4YLENcSRAMXnOzWEnngxeEKuwVE
	1mqoXbsWgqMrpcxAIsvlHzwbQ8D2+lTsyCThz8Tobeob6PGuKmH+lW3t/7Ix7D+AlbvZSxa4iBQR0
	f0t5v8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQMB-00000004u0w-3PIP
	for ath12k@archiver.kernel.org;
	Wed, 25 Sep 2024 11:38:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQLB-00000004tkS-2dgk
	for ath12k@lists.infradead.org;
	Wed, 25 Sep 2024 11:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 144E75C5987;
	Wed, 25 Sep 2024 11:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84352C4CECD;
	Wed, 25 Sep 2024 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727264272;
	bh=ghpmuDuu0eWFdJ+JnPGVfeCo9TbE7aASMOcYeNCzKac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iwUQ8zDIZqm+q6RQrvxTBSBpe3am5Oxf5DBJ0/+NgmDJy3Hk+gGgWWg1MVZmnCiPM
	 INTmDDkP85dQWCMYO+60qFos0U6L71KFJWuwKATLunVHpU4ZcAainRQ7oxLmGNrWLi
	 d9JSTGXn4uTiBikFwhTfw+USyJ0to7YICkQw8UNytsFcwXcCV956lz0mnStS0N3R5W
	 +VIlXFVkL3HiBk06nP3BxDzTDVPD4yCRoIX8xxO18BHI4od3YZw4m0KcaJDqlt2u9P
	 5XHlGApq1+HemrgdszhnnF6LoIVOeyx1sK7UeRLPtQNHZjpwGCaIMGLobrJvWR68v4
	 t0unOWl4QKOEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 033/244] wifi: ath12k: fix array out-of-bound access in SoC stats
Date: Wed, 25 Sep 2024 07:24:14 -0400
Message-ID: <20240925113641.1297102-33-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_043753_738808_3A59B080 
X-CRM114-Status: GOOD (  10.61  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

[ Upstream commit e106b7ad13c1d246adaa57df73edb8f8b8acb240 ]

Currently, the ath12k_soc_dp_stats::hal_reo_error array is defined with a
maximum size of DP_REO_DST_RING_MAX. However, the ath12k_dp_rx_process()
function access ath12k_soc_dp_stats::hal_reo_error using the REO
destination SRNG ring ID, which is incorrect. SRNG ring ID differ from
normal ring ID, and this usage leads to out-of-bounds array access. To
fix this issue, modify ath12k_dp_rx_process() to use the normal ring ID
directly instead of the SRNG ring ID to avoid out-of-bounds array access.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://patch.msgid.link/20240704070811.4186543-2-quic_periyasa@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 14236d0a0c89d..91e3393f7b5f4 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2681,7 +2681,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 		if (push_reason !=
 		    HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
 			dev_kfree_skb_any(msdu);
-			ab->soc_stats.hal_reo_error[dp->reo_dst_ring[ring_id].ring_id]++;
+			ab->soc_stats.hal_reo_error[ring_id]++;
 			continue;
 		}
 
-- 
2.43.0


