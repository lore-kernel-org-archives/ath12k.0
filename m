Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5465BC4332F
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFyj56gDZ7sQ8dBBK00VhjAX1H6+K5+ZzU284HLav4A=; b=fu9E3PeXuopie6
	9tLdKl6x8pSNIAMlbkzFIjesXK1lGtwJgRshUYsMbNB8n642pKY1Zou0FzpQW+w6gpFpsm+13FZO1
	oRp/QCudHSC7CMEXVAoauQJPWZXW48dOxBaXc+Ifr2DsuDL/iGdPQPRetzpmUOwf8WoAeTNpZ/wuj
	e6WmBuQchVzTU0x2ida/9ifdsp1f2A2UvnNjgwiEn26JqJgMP/9Q0/Ho6ybtwfQIfQqzPFF+KCVke
	zBliImO+pAR6yblEx7DSLzXn3eQAVlk8+0e8F+RWbeQSdvELJDkGq6KXPfZtzBWvdEzCSj8VOjwPF
	HoLKsA7xoXE47z3znGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMUG-006buF-Pb
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 17:46:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRi-005xgh-8q
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2MjtV/Sw7Y3L2LQIXSKyUHcpL/SofMa+m/n34ZEVUes=; b=Hk+XB1tZxlcZYL5gzbITYPoF3W
	QvfkGcNRYOrxHCKusP1A3gOUinImwW/BH++UrvVhP/x06ETMYXz1p54hBhVOj2zzHYWdVudW6Z1DV
	El35XOg3M9OxIjk9zVqTMyptMU6Q7QElqKL5SyvpmGGMmduxvTzlQnoNSjQRVe8Kghkal2+KhUuNc
	3ROb6sLrv39I2ctfBQ+TrGUkNhqt79KplV8OZV9b57gaZcSu3ijVwUcFS+aIs8lC7TtIEkYQQwU7g
	g9eRSvrNeI+72MEwqdiGTOrzdEpnAEnHYuLn4qUgrMEi1AQKcSLFCy4UkkEYI/dorfmwSbUf5xxML
	Djo5Gr9Q==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRe-001Orc-UC
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 008CCB81DFE
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D91C433D7;
	Wed, 16 Nov 2022 16:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616764;
	bh=+j2zQeaO168nZ8ePaKfG6kKbehPeML0Y1bU9O+Kog/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhd8s7pnmPU6H7O4Pa1YCh2vEDDcicG6ROJNtaWEic6VwOqVONuGBtZpAGg49XawE
	 H5ojgt+WxMjGQscxlo66+Soe4Ca4Gdo5MfFgDW1+1YkweBX8zYUohkzCVYRNPjP72R
	 MRHCKhvZMgUzHOPeJm07g76d2Gc1nm0Lk1fUOkzI2jaNNAE0VOshfYkoefNWs51Ikk
	 CE0WI8eQwWRxSegdpzFJssgLPJjH90R+O/rbp4lufXCE7lTHkCjNW4XAY+Rf5rWccT
	 Cpx35oUU3LDNAzZ1oJ8o2R7/giT0nyiDVV3M5D/TsuuWrYldxD9O6wAjqvm6+ZeKWU
	 QOnFF6IaIPXDg==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 16/50] wifi: ath12k: add dp_rx.h
Date: Wed, 16 Nov 2022 18:38:28 +0200
Message-Id: <20221116163902.24996-17-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_163927_436699_2DF8145C 
X-CRM114-Status: GOOD (  14.91  )
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
 drivers/net/wireless/ath/ath12k/dp_rx.h | 145 ++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
new file mode 100644
index 000000000000..c955b5c859d1
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef ATH12K_DP_RX_H
+#define ATH12K_DP_RX_H
+
+#include "core.h"
+#include "rx_desc.h"
+#include "debug.h"
+
+#define DP_MAX_NWIFI_HDR_LEN	30
+
+struct ath12k_dp_rx_tid {
+	u8 tid;
+	u32 *vaddr;
+	dma_addr_t paddr;
+	u32 size;
+	u32 ba_win_sz;
+	bool active;
+
+	/* Info related to rx fragments */
+	u32 cur_sn;
+	u16 last_frag_no;
+	u16 rx_frag_bitmap;
+
+	struct sk_buff_head rx_frags;
+	struct hal_reo_dest_ring *dst_ring_desc;
+
+	/* Timer info related to fragments */
+	struct timer_list frag_timer;
+	struct ath12k_base *ab;
+};
+
+struct ath12k_dp_rx_reo_cache_flush_elem {
+	struct list_head list;
+	struct ath12k_dp_rx_tid data;
+	unsigned long ts;
+};
+
+struct ath12k_dp_rx_reo_cmd {
+	struct list_head list;
+	struct ath12k_dp_rx_tid data;
+	int cmd_num;
+	void (*handler)(struct ath12k_dp *dp, void *ctx,
+			enum hal_reo_cmd_status status);
+};
+
+#define ATH12K_DP_RX_REO_DESC_FREE_THRES  64
+#define ATH12K_DP_RX_REO_DESC_FREE_TIMEOUT_MS 1000
+
+enum ath12k_dp_rx_decap_type {
+	DP_RX_DECAP_TYPE_RAW,
+	DP_RX_DECAP_TYPE_NATIVE_WIFI,
+	DP_RX_DECAP_TYPE_ETHERNET2_DIX,
+	DP_RX_DECAP_TYPE_8023,
+};
+
+struct ath12k_dp_rx_rfc1042_hdr {
+	u8 llc_dsap;
+	u8 llc_ssap;
+	u8 llc_ctrl;
+	u8 snap_oui[3];
+	__be16 snap_type;
+} __packed;
+
+static inline u32 ath12k_he_gi_to_nl80211_he_gi(u8 sgi)
+{
+	u32 ret = 0;
+
+	switch (sgi) {
+	case RX_MSDU_START_SGI_0_8_US:
+		ret = NL80211_RATE_INFO_HE_GI_0_8;
+		break;
+	case RX_MSDU_START_SGI_1_6_US:
+		ret = NL80211_RATE_INFO_HE_GI_1_6;
+		break;
+	case RX_MSDU_START_SGI_3_2_US:
+		ret = NL80211_RATE_INFO_HE_GI_3_2;
+		break;
+	}
+
+	return ret;
+}
+
+int ath12k_dp_rx_ampdu_start(struct ath12k *ar,
+			     struct ieee80211_ampdu_params *params);
+int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
+			    struct ieee80211_ampdu_params *params);
+int ath12k_dp_rx_peer_pn_replay_config(struct ath12k_vif *arvif,
+				       const u8 *peer_addr,
+				       enum set_key_cmd key_cmd,
+				       struct ieee80211_key_conf *key);
+void ath12k_dp_rx_peer_tid_cleanup(struct ath12k *ar, struct ath12k_peer *peer);
+void ath12k_dp_rx_peer_tid_delete(struct ath12k *ar,
+				  struct ath12k_peer *peer, u8 tid);
+int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id,
+				u8 tid, u32 ba_win_sz, u16 ssn,
+				enum hal_pn_type pn_type);
+void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
+				       struct sk_buff *skb);
+int ath12k_dp_rx_pdev_reo_setup(struct ath12k_base *ab);
+void ath12k_dp_rx_pdev_reo_cleanup(struct ath12k_base *ab);
+int ath12k_dp_rx_htt_setup(struct ath12k_base *ab);
+int ath12k_dp_rx_alloc(struct ath12k_base *ab);
+void ath12k_dp_rx_free(struct ath12k_base *ab);
+int ath12k_dp_rx_pdev_alloc(struct ath12k_base *ab, int pdev_idx);
+void ath12k_dp_rx_pdev_free(struct ath12k_base *ab, int pdev_idx);
+void ath12k_dp_rx_reo_cmd_list_cleanup(struct ath12k_base *ab);
+void ath12k_dp_rx_process_reo_status(struct ath12k_base *ab);
+int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
+				 struct napi_struct *napi, int budget);
+int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
+			     int budget);
+int ath12k_dp_rx_process(struct ath12k_base *ab, int mac_id,
+			 struct napi_struct *napi,
+			 int budget);
+int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab, int mac_id,
+				struct dp_rxdma_ring *rx_ring,
+				int req_entries,
+				enum hal_rx_buf_return_buf_manager mgr,
+				bool hw_cc);
+int ath12k_dp_rx_pdev_mon_attach(struct ath12k *ar);
+int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id);
+
+int ath12k_dp_rx_pktlog_start(struct ath12k_base *ab);
+int ath12k_dp_rx_pktlog_stop(struct ath12k_base *ab, bool stop_timer);
+u8 ath12k_dp_rx_h_l3pad(struct ath12k_base *ab,
+			struct hal_rx_desc *desc);
+struct ath12k_peer *
+ath12k_dp_rx_h_find_peer(struct ath12k_base *ab, struct sk_buff *msdu);
+u8 ath12k_dp_rx_h_decap_type(struct ath12k_base *ab,
+			     struct hal_rx_desc *desc);
+u32 ath12k_dp_rx_h_mpdu_err(struct ath12k_base *ab,
+			    struct hal_rx_desc *desc);
+void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct hal_rx_desc *rx_desc,
+			 struct ieee80211_rx_status *rx_status);
+struct ath12k_peer *
+ath12k_dp_rx_h_find_peer(struct ath12k_base *ab, struct sk_buff *msdu);
+
+int ath12k_dp_rxdma_ring_sel_config_qcn9274(struct ath12k_base *ab);
+int ath12k_dp_rxdma_ring_sel_config_wcn7850(struct ath12k_base *ab);
+
+#endif /* ATH12K_DP_RX_H */


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
