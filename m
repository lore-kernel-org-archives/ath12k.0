Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2617C3ABC0
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 00:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+79jdY+oTxVKcP6dy6K0xdMccwjtN+PM1hCzouyKlM=; b=EbAT9QyGM+UBt0oz4uhBk+xGZS
	4Sjucfm/BNrCKlx0P35d1VKIEAOP8QTTU6vmJbQHc4SJ2tTdSFM3AOPMWr45m14F6IuM3DEOlfMbJ
	0cLDeR+Whu+Hwh2YEN7mafAY8B4gam7ayxhOrGH48XuwhqPMr9SgELaqF1GB/8Sk/hcTXZLgxDe2u
	yQVlr72AjeyAUjfogfPjaUqWnppuHeRxaIELUVU6lTbD/QerOJh/DJsPcsld524k2BNrz7Bzy0bgL
	hcdgW+1PTaG/wiyQzrrzPV3Ygyz2pblMcVQUlp0Tu/vK5Lo98Lk7O5JMvoAQzVKjEvqS3oQeE0eLJ
	QT+D09ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6Dg-00000009IZ5-2TZE;
	Tue, 06 May 2025 00:31:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Oh-00000008nfq-1HOn
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B96F2A4CE78;
	Mon,  5 May 2025 22:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F253AC4CEEE;
	Mon,  5 May 2025 22:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484490;
	bh=I3P7F81fwQO4vFcX7jTNe5dzmappe2y4BGmiNPIeY40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ExfAynp08L4xR3kM5nROO3pmyiw3SHrThw8d37Oj9coLvdGt7bGOnm3ifvbaAS5aN
	 2SQhjnNQ1QAXkrKRCfECDEDuW0oadgPXjgqqhmmKRCDGT3wMcEfqWuMsTiyqy30BX9
	 ahf/yV1wxYMVa0qkpsQNRlTx6jWlvuiC4K62cnq8srk7X1+5lMNZ3xByB4LVRJbWxW
	 WR3/9Yaq9LkX+ILmArruyr9PST9/i7APJshHYVyH43//Bf72NvSYBzsEk4StLvGPHR
	 Zu8mzGfZNm8KI9S2vu+q32+3rgl6WWxZpj6EI8o7O0NXG9GtH0Ite30hHj1o1vl3XK
	 R9GzJZvoKin1Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 497/642] wifi: ath12k: Update the peer id in PPDU end user stats TLV
Date: Mon,  5 May 2025 18:11:53 -0400
Message-Id: <20250505221419.2672473-497-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153451_412617_1E441C4B 
X-CRM114-Status: UNSURE (   8.49  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

[ Upstream commit 0cded0e413468183a3b2dd445ab3bdc4d4375967 ]

Currently, peer id get reported in the PPDU end user TLV tag. But the
monitor status handler is inherited from ath11k, but it was not updated
to incorporate the changes made to ath12k 802.11be hardware architecture.
Therefore, update the peer id from the PPDU end user TLV data to get latest
peer id update, it helps to populate accurate peer information on the
statistics data.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Link: https://patch.msgid.link/20250206013854.174765-6-quic_periyasa@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f23fee7055abc..8737dc8fea354 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -638,6 +638,9 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		ppdu_info->num_mpdu_fcs_err =
 			u32_get_bits(info[0],
 				     HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR);
+		ppdu_info->peer_id =
+			u32_get_bits(info[0], HAL_RX_PPDU_END_USER_STATS_INFO0_PEER_ID);
+
 		switch (ppdu_info->preamble_type) {
 		case HAL_RX_PREAMBLE_11N:
 			ppdu_info->ht_flags = 1;
-- 
2.39.5


