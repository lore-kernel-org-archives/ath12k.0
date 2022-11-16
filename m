Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36DFC4332F
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kdo96YIxstoScWc1U9fxCFpRvC4sjqCSFjac15w7dfA=; b=ZawzGPl+UIKAMY
	3z47lL+s5dDmgFrOSMgVofJ8OpErz4Hxk4TdjjnTcdksAKmm8lEStX2hcUf+pniErRW4315FVivOi
	bk0F4UIG//LSnJfEFejZGMWvxKRokE7nvJzmb2aU9SccLnoxeqUePYY8TicF2xR7ubXczvt3dIAsS
	Kwt65QTzl2bsF6FSNhRqFJ3EUzb1BTwKEZ5czZH5Lz/ZeBbWtwoZmXM7M+msY8Pyyf1/OGevCNfJc
	j/9vQA8gvc239saXNUqRQ9UeYe8Ndsl28FQEBwbo2QObUS1ZmCiMmw0q7vtkar3AxE7Jou6YLb+9a
	f+HUb1nbAExoK8C9lH5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRq-005y4s-4h
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:39:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRp-005xe0-73
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+jlHBSOLsLGt29EKdHGt5FYD9WP+7bXab0ELExTdFMo=; b=UJF/w1uGA0YTEq9/6vKYVYn7CH
	RqF1MiCUOGFsj0QqQGHMjnbIsGKt6PFmEhf4jegUyceeycqyT9iCloVmfFexqD3QPmekVucd6HRBh
	5B/Lf21k3tThHxPRH+v0TPFy5oUg6QuXNsK5CE7QfrqLt9SXx8kfVAQJLil9YoOZ5UKZPjRWY3o7d
	smDDiQoE0ahC+Dxul4f2cJAzSTK4eWS9QWVQ2mc2iuQxBD2N9VYNd2Vree/szXbEqODHk0BI5wx4Q
	2shL8CflvUUz3xi7BVfBQdzhubrQ4aVL5vHHSZ7iugQ+lPvVF+E7myOduDgoE4suUtXCtahtzdTTx
	7pS+Qo2g==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRl-001OtB-QU
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8CC5ECE1BF2
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3744AC43470;
	Wed, 16 Nov 2022 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616766;
	bh=/hX3OzB39UruIkacA08xZgaTBDYUxigx0gBqm8j9Lvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kW6EFw599tbOlTMCa9/QVDX8nNSSNJ/Y3i32dCGyBJe8lVvQyhmqh1I0KVeJMsAuX
	 TtCSmWDrhqMYHSCi/TMDQQeKrh77FXS1mpEgCDAJT1kSQOnr8jw9b5l4laYUr45fKJ
	 IJTblv7rAG4nxeSnqkC7lPKSo958I2000zhD5BMnQnE+GigXoLTD9283YLGqJOKoJL
	 yI28OEelfzF30BCAFWRyEvMt+AeoNh+qRQe/H4S6HwFDoapzZ4fxKfX0nwnOhDX+n/
	 9O8+WqUApLhoRYy38mKWkdtTI9kUHG3Rz8JnkGkVUOTI+io3pgWP+RFFVOLPjskUfx
	 OtPhJtk6D9odg==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 18/50] wifi: ath12k: add dp_tx.h
Date: Wed, 16 Nov 2022 18:38:30 +0200
Message-Id: <20221116163902.24996-19-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_163934_186080_DE6FFE3D 
X-CRM114-Status: GOOD (  11.80  )
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
 drivers/net/wireless/ath/ath12k/dp_tx.h | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.h b/drivers/net/wireless/ath/ath12k/dp_tx.h
new file mode 100644
index 000000000000..436d77e5e9ee
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_DP_TX_H
+#define ATH12K_DP_TX_H
+
+#include "core.h"
+#include "hal_tx.h"
+
+struct ath12k_dp_htt_wbm_tx_status {
+	bool acked;
+	int ack_rssi;
+};
+
+int ath12k_dp_tx_htt_h2t_ver_req_msg(struct ath12k_base *ab);
+int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
+		 struct sk_buff *skb);
+void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id);
+
+int ath12k_dp_tx_htt_h2t_ppdu_stats_req(struct ath12k *ar, u32 mask);
+int
+ath12k_dp_tx_htt_h2t_ext_stats_req(struct ath12k *ar, u8 type,
+				   struct htt_ext_stats_cfg_params *cfg_params,
+				   u64 cookie);
+int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar, bool reset);
+
+int ath12k_dp_tx_htt_rx_filter_setup(struct ath12k_base *ab, u32 ring_id,
+				     int mac_id, enum hal_ring_type ring_type,
+				     int rx_buf_size,
+				     struct htt_rx_ring_tlv_filter *tlv_filter);
+void ath12k_dp_tx_put_bank_profile(struct ath12k_dp *dp, u8 bank_id);
+int ath12k_dp_tx_htt_tx_filter_setup(struct ath12k_base *ab, u32 ring_id,
+				     int mac_id, enum hal_ring_type ring_type,
+				     int tx_buf_size,
+				     struct htt_tx_ring_tlv_filter *htt_tlv_filter);
+int ath12k_dp_tx_htt_tx_monitor_mode_ring_config(struct ath12k *ar, bool reset);
+int ath12k_dp_tx_htt_monitor_mode_ring_config(struct ath12k *ar, bool reset);
+#endif


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
