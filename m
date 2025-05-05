Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604F6C3ABBE
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 01:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAi0QmomfwDAm6Ul4+pfM5lamt+4hkUKGfslmQdsX6o=; b=Vqefv9AnD892U8oaEEqPyhTVhs
	x7o71acOxkpaC5AETNAn99/6p0g61sbVSvsA96f84j2obEN6InZZlZbI1p+ACxZ20fA61GYwzU66Y
	JHuz7ZUL8pWeWykADcZQogtqAlgXPgahbarLcON9Ss35SK85XHhQqDpoADjpUMl8mh7ZaariNYthT
	tn4TtzBUgRH19z/64MSnp2hUr5nW24wpqFmIZp7kPVGdSU1B/JedRia13AJjcQIopjGw/VO81+ucw
	ZJDKid99PfU5BSAfNjmtNqeAONLO6puq+nZ0HcIliB9hipcNY7t/FQbiSMcYEvnQG6fNVLYwhop2Z
	oG0Y38fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7LC-00000009Zkf-0WWi;
	Tue, 06 May 2025 01:43:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4ap-00000008rX0-38OM
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA6B85C2C8D;
	Mon,  5 May 2025 22:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BE6C4CEEE;
	Mon,  5 May 2025 22:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485242;
	bh=ob0vvT2R1TZYXplndaOjW3twfOQy1RYATc7niEKvVFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nc5oHZjr6V5lg/J9TipRDP8ftjZNB17madeqkKEh4wi4sBg2mqyXjuhb94Ro/Nnwi
	 gsQwiBxm4xGzwtI8Ns2cPiW2LwogGaJ6m/nBsggtG/MKGWtXwAsfsFwJ78D5Zhree8
	 0MvA1Fyn9MIRGP7pdH7oMCZtMaSin6vdDElOSm3uiYYWy/qWmDqGDmacx1++COLz+z
	 u2+3032UJMGqh00FNkvyxR8lzkmnbXfpOkKLSTSU07zdFFlFYukemSOkDmsMizX836
	 z8Gj4FbgBj9c70C1MAIhlB8apfKCyDEgzWjtRDp3dkRGj6Brh6GopKnUC/CG8r2WZk
	 yvzE3vO+0gp5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vinith Kumar R <quic_vinithku@quicinc.com>,
	Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 231/486] wifi: ath12k: Report proper tx completion status to mac80211
Date: Mon,  5 May 2025 18:35:07 -0400
Message-Id: <20250505223922.2682012-231-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154723_841996_C69FAEAA 
X-CRM114-Status: GOOD (  10.18  )
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

From: Vinith Kumar R <quic_vinithku@quicinc.com>

[ Upstream commit d2d9c9b8de725e1006d3aa3d18678a732f5d3584 ]

Currently Tx completion for few exception packets are received from
firmware and the tx status updated to mac80211. The tx status values of
HAL_WBM_REL_HTT_TX_COMP_STATUS_DROP and HAL_WBM_REL_HTT_TX_COMP_STATUS_TTL
are considered as tx failure and reported as tx failure to mac80211.
But these failure status is due to internal firmware tx drop and these
packets were not tried to transmit in the air.
In case of mesh this invalid tx status report might trigger mpath broken
issue due to increase in mpath fail average.
So do not report these tx status as tx failure instead free the skb
by calling ieee80211_free_txskb(), and that will be accounted as dropped
frame.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Vinith Kumar R <quic_vinithku@quicinc.com>
Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Link: https://patch.msgid.link/20241122173432.2064858-1-quic_tamizhr@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 44406e0b4a342..ad21fbfbcbe22 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -557,13 +557,13 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab,
 
 	switch (wbm_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
-	case HAL_WBM_REL_HTT_TX_COMP_STATUS_DROP:
-	case HAL_WBM_REL_HTT_TX_COMP_STATUS_TTL:
 		ts.acked = (wbm_status == HAL_WBM_REL_HTT_TX_COMP_STATUS_OK);
 		ts.ack_rssi = le32_get_bits(status_desc->info2,
 					    HTT_TX_WBM_COMP_INFO2_ACK_RSSI);
 		ath12k_dp_tx_htt_tx_complete_buf(ab, msdu, tx_ring, &ts);
 		break;
+	case HAL_WBM_REL_HTT_TX_COMP_STATUS_DROP:
+	case HAL_WBM_REL_HTT_TX_COMP_STATUS_TTL:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT:
 		ath12k_dp_tx_free_txbuf(ab, msdu, mac_id, tx_ring);
-- 
2.39.5


