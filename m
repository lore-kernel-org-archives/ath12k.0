Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AF9C4332F
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNRCCHVPOZCv0tNOAXOg3jLymZ2HeTkuOSAW6Q1REqg=; b=sfBjhshV78V7uq
	T9qTE3mA8MzYj+ZrmuFBlSJTPtNmNGXZuztbeObjOdAp2FgJf+/UoH6Fzh5E3ab5iKCG0Ns1p3poy
	8dbz1cbu0iWBv5odcKmO81dGUs+LEAwPsgWPdooqwUEcSXACZrQiaB96IAFQf5jLS30sqkq1WmZiE
	S0g14/WLLJb2ntyYPx5eZzQZXyp+RifyR3FujLQMxu5Oa0p6pKJkGXlfCMYXhoe6M4yjCLKwFeqyY
	uCQEWr8mjvKS2QRpLSgMjWPqFgo3nycqg24IH/IZlQdhy8t1vGwDbozfVuv3KJSL4pVL0dIdNbRbJ
	Z0YsZ2TztSW9K7QfLIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLS0-005yHC-3r
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:39:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRu-005yBH-Kt
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31E6861BC5
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C892C433D7;
	Wed, 16 Nov 2022 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616781;
	bh=2mNkmO2Ydttl38g21L/S9zsWVh8YYOnQh25A44zHhTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0+cJpdLWKdb3/G7MRC0KdLZOMJ+x7t/zukPYp7CEyH3ooLjRu12IMRKKt03Cp0y8
	 wi3fNu1H3vPzuXAi/p3MqX0EXQkbuGDgJ01dSRpbB7zhLntOwOkq+0uKsw1Aw8W7d4
	 v3M5d7mg2J7cEy7Flc+y9oE77PARh+XbFhjOmBDwM/0xMDIG/kFT+SkAM31m6egYVO
	 FEro7OelMwie+2W0rpFI2ZZMtwdVkabjKY8tsePYvNDeIe77hKu0c0AP4oI0+esF+9
	 i1PUsRLWpPzu8H8woUfcVpb3YFkQeaf+lcdgXDyTyENIu0hbQ3IvTJt6qLrroYbAyi
	 zS0adULrlzz8Q==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 32/50] wifi: ath12k: add mac.h
Date: Wed, 16 Nov 2022 18:38:44 +0200
Message-Id: <20221116163902.24996-33-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_083942_796422_5F970DFE 
X-CRM114-Status: GOOD (  13.47  )
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
 drivers/net/wireless/ath/ath12k/mac.h | 76 +++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
new file mode 100644
index 000000000000..57f4295420bb
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_MAC_H
+#define ATH12K_MAC_H
+
+#include <net/mac80211.h>
+#include <net/cfg80211.h>
+
+struct ath12k;
+struct ath12k_base;
+
+struct ath12k_generic_iter {
+	struct ath12k *ar;
+	int ret;
+};
+
+/* number of failed packets (20 packets with 16 sw reties each) */
+#define ATH12K_KICKOUT_THRESHOLD		(20 * 16)
+
+/* Use insanely high numbers to make sure that the firmware implementation
+ * won't start, we have the same functionality already in hostapd. Unit
+ * is seconds.
+ */
+#define ATH12K_KEEPALIVE_MIN_IDLE		3747
+#define ATH12K_KEEPALIVE_MAX_IDLE		3895
+#define ATH12K_KEEPALIVE_MAX_UNRESPONSIVE	3900
+
+/* FIXME: should these be in ieee80211.h? */
+#define IEEE80211_VHT_MCS_SUPPORT_0_11_MASK	GENMASK(23, 16)
+#define IEEE80211_DISABLE_VHT_MCS_SUPPORT_0_11	BIT(24)
+
+#define ATH12K_CHAN_WIDTH_NUM			8
+
+#define ATH12K_TX_POWER_MAX_VAL	70
+#define ATH12K_TX_POWER_MIN_VAL	0
+
+enum ath12k_supported_bw {
+	ATH12K_BW_20    = 0,
+	ATH12K_BW_40    = 1,
+	ATH12K_BW_80    = 2,
+	ATH12K_BW_160   = 3,
+};
+
+extern const struct htt_rx_ring_tlv_filter ath12k_mac_mon_status_filter_default;
+
+void ath12k_mac_destroy(struct ath12k_base *ab);
+void ath12k_mac_unregister(struct ath12k_base *ab);
+int ath12k_mac_register(struct ath12k_base *ab);
+int ath12k_mac_allocate(struct ath12k_base *ab);
+int ath12k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc, u8 preamble, u8 *rateidx,
+					  u16 *rate);
+u8 ath12k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
+			     u32 bitrate);
+u8 ath12k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
+			     u8 hw_rate, bool cck);
+
+void __ath12k_mac_scan_finish(struct ath12k *ar);
+void ath12k_mac_scan_finish(struct ath12k *ar);
+
+struct ath12k_vif *ath12k_mac_get_arvif(struct ath12k *ar, u32 vdev_id);
+struct ath12k_vif *ath12k_mac_get_arvif_by_vdev_id(struct ath12k_base *ab,
+						   u32 vdev_id);
+struct ath12k *ath12k_mac_get_ar_by_vdev_id(struct ath12k_base *ab, u32 vdev_id);
+struct ath12k *ath12k_mac_get_ar_by_pdev_id(struct ath12k_base *ab, u32 pdev_id);
+
+void ath12k_mac_drain_tx(struct ath12k *ar);
+void ath12k_mac_peer_cleanup_all(struct ath12k *ar);
+int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
+enum rate_info_bw ath12k_mac_bw_to_mac80211_bw(enum ath12k_supported_bw bw);
+enum ath12k_supported_bw ath12k_mac_mac80211_bw_to_ath12k_bw(enum rate_info_bw bw);
+enum hal_encrypt_type ath12k_dp_tx_get_encrypt_type(u32 cipher);
+#endif


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
