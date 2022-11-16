Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B874C43217
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 17:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFM/jgPrWg+J5YTuJPRRrZmv9aOKRvQF9zPE3b3AGok=; b=mAD36r2iLtiYBw
	QT8vPWhZMYn0bmIJV3BdMGgvjFoqGzx0PDxRp3uHA5xAetHTprh2sbzRVzYkcjz4VdhZkIM1Ko0DK
	0Bcqix8JlL19jPBkNf59Ci5cjcsb3VS3+cDdp4I9WWqW/0ht9QzOeWGjpEa2nTLtskIhzjMAZpMVi
	/crp/AaZirP/uDDSP1D96GJ9tyKWMXSBZVKVBdenBZ6GAAC4M3ywR3nDDu4RDAvJLbUYRZxReXuYH
	4xRJVPkAhE7baS0tuotMRGDuf38uQOnMo7G6I5nkm8vLrVg9O8ceCBcFnC+gjdpHVgf4WtzmLZIKD
	ZZ78G/pXaM6po/xdwdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMU6-006bmg-Fl
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 17:46:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRb-005xjG-GQ
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2112361EDA
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C12C433D7;
	Wed, 16 Nov 2022 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616762;
	bh=ATo1sKjzu8Op3S6t1v9qL3Bjry5l4Am2KPMrV2NCwuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QfGxDD7bT4AmGLIrUs8lvyh4/q0i1RRP0v/Mw4ILZhOfYbNGUYed9Z/zDbR+Lj7ft
	 UsGTtvt+g9Eb1Ggc2P0tG3D8eHKVczEs7hSAjDOnG6j/38nZ0xtRpkrgKUUpURD1rk
	 alkiKrS192NiKoOm72UctC1W8a7mXGdKAOlAX9Sw8KIdKDE4lJXmNfB1RRAQZAjjoJ
	 SoLCvZNLnJ5PuqHvxGqcnQHAdGYW1yK3/vh/pMOdGdtg7XAyI+R6PJfYBEJaeoMeRQ
	 R8nFx/8q9Cx8w9SyWvckSpTDntq0UP4cIdkyLbXdXStbI6MQ1SJF4aIV+BECl1+GXg
	 TrJK9j5fdLsCw==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 14/50] wifi: ath12k: add dp_mon.h
Date: Wed, 16 Nov 2022 18:38:26 +0200
Message-Id: <20221116163902.24996-15-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_083923_644060_19678D41 
X-CRM114-Status: GOOD (  12.03  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.h | 106 +++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.h b/drivers/net/wireless/ath/ath12k/dp_mon.h
new file mode 100644
index 000000000000..c18c385798a1
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_DP_MON_H
+#define ATH12K_DP_MON_H
+
+#include "core.h"
+
+enum dp_monitor_mode {
+	ATH12K_DP_TX_MONITOR_MODE,
+	ATH12K_DP_RX_MONITOR_MODE
+};
+
+enum dp_mon_tx_ppdu_info_type {
+	DP_MON_TX_PROT_PPDU_INFO,
+	DP_MON_TX_DATA_PPDU_INFO
+};
+
+enum dp_mon_tx_tlv_status {
+	DP_MON_TX_FES_SETUP,
+	DP_MON_TX_FES_STATUS_END,
+	DP_MON_RX_RESPONSE_REQUIRED_INFO,
+	DP_MON_RESPONSE_END_STATUS_INFO,
+	DP_MON_TX_MPDU_START,
+	DP_MON_TX_MSDU_START,
+	DP_MON_TX_BUFFER_ADDR,
+	DP_MON_TX_DATA,
+	DP_MON_TX_STATUS_PPDU_NOT_DONE,
+};
+
+enum dp_mon_tx_medium_protection_type {
+	DP_MON_TX_MEDIUM_NO_PROTECTION,
+	DP_MON_TX_MEDIUM_RTS_LEGACY,
+	DP_MON_TX_MEDIUM_RTS_11AC_STATIC_BW,
+	DP_MON_TX_MEDIUM_RTS_11AC_DYNAMIC_BW,
+	DP_MON_TX_MEDIUM_CTS2SELF,
+	DP_MON_TX_MEDIUM_QOS_NULL_NO_ACK_3ADDR,
+	DP_MON_TX_MEDIUM_QOS_NULL_NO_ACK_4ADDR
+};
+
+struct dp_mon_qosframe_addr4 {
+	__le16 frame_control;
+	__le16 duration;
+	u8 addr1[ETH_ALEN];
+	u8 addr2[ETH_ALEN];
+	u8 addr3[ETH_ALEN];
+	__le16 seq_ctrl;
+	u8 addr4[ETH_ALEN];
+	__le16 qos_ctrl;
+} __packed;
+
+struct dp_mon_frame_min_one {
+	__le16 frame_control;
+	__le16 duration;
+	u8 addr1[ETH_ALEN];
+} __packed;
+
+struct dp_mon_packet_info {
+	u64 cookie;
+	u16 dma_length;
+	bool msdu_continuation;
+	bool truncated;
+};
+
+struct dp_mon_tx_ppdu_info {
+	u32 ppdu_id;
+	u8  num_users;
+	bool is_used;
+	struct hal_rx_mon_ppdu_info rx_status;
+	struct list_head dp_tx_mon_mpdu_list;
+	struct dp_mon_mpdu *tx_mon_mpdu;
+};
+
+enum hal_rx_mon_status
+ath12k_dp_mon_rx_parse_mon_status(struct ath12k *ar,
+				  struct ath12k_mon_data *pmon,
+				  int mac_id, struct sk_buff *skb,
+				  struct napi_struct *napi);
+int ath12k_dp_mon_buf_replenish(struct ath12k_base *ab,
+				struct dp_rxdma_ring *buf_ring,
+				int req_entries);
+int ath12k_dp_mon_srng_process(struct ath12k *ar, int mac_id,
+			       int *budget, enum dp_monitor_mode monitor_mode,
+			       struct napi_struct *napi);
+int ath12k_dp_mon_process_ring(struct ath12k_base *ab, int mac_id,
+			       struct napi_struct *napi, int budget,
+			       enum dp_monitor_mode monitor_mode);
+struct sk_buff *ath12k_dp_mon_tx_alloc_skb(void);
+enum dp_mon_tx_tlv_status
+ath12k_dp_mon_tx_status_get_num_user(u16 tlv_tag,
+				     struct hal_tlv_hdr *tx_tlv,
+				     u8 *num_users);
+enum hal_rx_mon_status
+ath12k_dp_mon_tx_parse_mon_status(struct ath12k *ar,
+				  struct ath12k_mon_data *pmon,
+				  int mac_id,
+				  struct sk_buff *skb,
+				  struct napi_struct *napi,
+				  u32 ppdu_id);
+void ath12k_dp_mon_rx_process_ulofdma(struct hal_rx_mon_ppdu_info *ppdu_info);
+int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
+				   struct napi_struct *napi, int *budget);
+#endif


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
