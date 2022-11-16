Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459F8C41535
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ki0aQEY1+7FfUEH3XU1viMYPQsywjGshuzlu74q+cxA=; b=KBMVb2dvkyk36q
	meUsieQmzF68RlR41tC5jL7K/Bl9vDR9tS+1jpz4IpHBIrrdxm1XgeVyGX3vvQlvcvCnFerBvPPvg
	3OTygKlSye0gJEDEZo5AhkAsMsqI22BwKsUzScJytX8228LllDhEZXHnLT5OUa0SkD4o5W2W9ge2N
	CrzHHLn+SprREP7GAt0VcnqyvCtye/fayOLvUvThl/ow4TzNqlxOZ8NzPAwRNE7nUCTXAs7qqfPdM
	QrHmYkGkHjMEUCQeyh1PX/iFzkWWfza1MKYAb4+jEq/8yvpFHygHCvImymiN/a2WFfjS19M5NVSnw
	QUu8mbdqoAbhPJvlTdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMUH-006bvr-MC
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 17:46:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRr-005y5K-5H
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7NKAHm87c1Xsyf5V9Ocnq8a2/mBTMpgLAhCrnvjdBy4=; b=kVWdsORUAAac3i9lKuRcBpnMuN
	yyv90IG0N4gjmqsXcNpW+lPRDwTVV81ZYouyx7IqO/Mxc1gvk7Io4SyRQIyEybi4lTVfQNXe3VsWD
	XrGx2Qsku8HWVvrdQm2WZE1KexKyHjhTSrReSFHyiEQq0QpFvMmKWokmDbRbFgoKDUZ2Z4/f+gQHI
	d8ExHdaQwxhfrK/cgovetw2ElfrK4ivKtCk7HEIreb+VofWqYadCnno4i7sH174/emgPuVy/a/5NB
	WBtbVGAaF027ZqpOTtZRlt+vQRNFYTs5zhlQwy/YjksaCtB5ZupjLmbQi8EHewkRwT8/7i5Zqgb9C
	T5WZtrZg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRm-001OuK-NC
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 468E861EEA
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883FDC433D7;
	Wed, 16 Nov 2022 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616773;
	bh=yXTBYLKDGdc+yKHG1u2j2kJjKo1odXchzlJB4BwWIxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGdPharb1EueLxsziDtrEcgwzXdc6Vg6XLMZxbJFhOl5+Mw74krfCYFI7pSxLZQVW
	 P4KaLGiPnu2TiAvNjI/vs5kQdgH/K02ekb7RrDSo9mIJ9NhY0Gn/fnETTyfE44Gdou
	 3saqGdcqLQDumIP1cYNl1j9EadfYpithfA5h+dhtfjzbD+bo3RGgiYz9Me/MIiBkOk
	 rsb8BYLgfw5zvQkixzSR6kMfswtRt7eippczOR27NJ87IBiOMqFdFUNRteo5g6/EEm
	 +3MxxVDIwiS1DjhwYto9jCAglDK2YmntlGp73+IiVdpLr/aOIclwdzCqwUjK/Kz7FZ
	 5KsO9q1XJgPOw==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 24/50] wifi: ath12k: add hal_tx.c
Date: Wed, 16 Nov 2022 18:38:36 +0200
Message-Id: <20221116163902.24996-25-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_163935_509668_7D782E91 
X-CRM114-Status: GOOD (  14.27  )
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
 drivers/net/wireless/ath/ath12k/hal_tx.c | 145 +++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hal_tx.c b/drivers/net/wireless/ath/ath12k/hal_tx.c
new file mode 100644
index 000000000000..869e07e406fe
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/hal_tx.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "hal_desc.h"
+#include "hal.h"
+#include "hal_tx.h"
+#include "hif.h"
+
+#define DSCP_TID_MAP_TBL_ENTRY_SIZE 64
+
+/* dscp_tid_map - Default DSCP-TID mapping
+ *=================
+ * DSCP        TID
+ *=================
+ * 000xxx      0
+ * 001xxx      1
+ * 010xxx      2
+ * 011xxx      3
+ * 100xxx      4
+ * 101xxx      5
+ * 110xxx      6
+ * 111xxx      7
+ */
+static inline u8 dscp2tid(u8 dscp)
+{
+	return dscp >> 3;
+}
+
+void ath12k_hal_tx_cmd_desc_setup(struct ath12k_base *ab,
+				  struct hal_tcl_data_cmd *tcl_cmd,
+				  struct hal_tx_info *ti)
+{
+	tcl_cmd->buf_addr_info.info0 =
+		le32_encode_bits(ti->paddr, BUFFER_ADDR_INFO0_ADDR);
+	tcl_cmd->buf_addr_info.info1 =
+		le32_encode_bits(((uint64_t)ti->paddr >> HAL_ADDR_MSB_REG_SHIFT),
+				 BUFFER_ADDR_INFO1_ADDR);
+	tcl_cmd->buf_addr_info.info1 |=
+		le32_encode_bits((ti->rbm_id), BUFFER_ADDR_INFO1_RET_BUF_MGR) |
+		le32_encode_bits(ti->desc_id, BUFFER_ADDR_INFO1_SW_COOKIE);
+
+	tcl_cmd->info0 =
+		le32_encode_bits(ti->type, HAL_TCL_DATA_CMD_INFO0_DESC_TYPE) |
+		le32_encode_bits(ti->bank_id, HAL_TCL_DATA_CMD_INFO0_BANK_ID);
+
+	tcl_cmd->info1 =
+		le32_encode_bits(ti->meta_data_flags,
+				 HAL_TCL_DATA_CMD_INFO1_CMD_NUM);
+
+	tcl_cmd->info2 = cpu_to_le32(ti->flags0) |
+		le32_encode_bits(ti->data_len, HAL_TCL_DATA_CMD_INFO2_DATA_LEN) |
+		le32_encode_bits(ti->pkt_offset, HAL_TCL_DATA_CMD_INFO2_PKT_OFFSET);
+
+	tcl_cmd->info3 = cpu_to_le32(ti->flags1) |
+		le32_encode_bits(ti->tid, HAL_TCL_DATA_CMD_INFO3_TID) |
+		le32_encode_bits(ti->lmac_id, HAL_TCL_DATA_CMD_INFO3_PMAC_ID) |
+		le32_encode_bits(ti->vdev_id, HAL_TCL_DATA_CMD_INFO3_VDEV_ID);
+
+	tcl_cmd->info4 = le32_encode_bits(ti->bss_ast_idx,
+					  HAL_TCL_DATA_CMD_INFO4_SEARCH_INDEX) |
+			 le32_encode_bits(ti->bss_ast_hash,
+					  HAL_TCL_DATA_CMD_INFO4_CACHE_SET_NUM);
+	tcl_cmd->info5 = 0;
+}
+
+void ath12k_hal_tx_set_dscp_tid_map(struct ath12k_base *ab, int id)
+{
+	u32 ctrl_reg_val;
+	u32 addr;
+	u8 hw_map_val[HAL_DSCP_TID_TBL_SIZE], dscp, tid;
+	int i;
+	u32 value;
+
+	ctrl_reg_val = ath12k_hif_read32(ab, HAL_SEQ_WCSS_UMAC_TCL_REG +
+					 HAL_TCL1_RING_CMN_CTRL_REG);
+	/* Enable read/write access */
+	ctrl_reg_val |= HAL_TCL1_RING_CMN_CTRL_DSCP_TID_MAP_PROG_EN;
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_TCL_REG +
+			   HAL_TCL1_RING_CMN_CTRL_REG, ctrl_reg_val);
+
+	addr = HAL_SEQ_WCSS_UMAC_TCL_REG + HAL_TCL1_RING_DSCP_TID_MAP +
+	       (4 * id * (HAL_DSCP_TID_TBL_SIZE / 4));
+
+	/* Configure each DSCP-TID mapping in three bits there by configure
+	 * three bytes in an iteration.
+	 */
+	for (i = 0, dscp = 0; i < HAL_DSCP_TID_TBL_SIZE; i += 3) {
+		tid = dscp2tid(dscp);
+		value = u32_encode_bits(tid, HAL_TCL1_RING_FIELD_DSCP_TID_MAP0);
+		dscp++;
+
+		tid = dscp2tid(dscp);
+		value |= u32_encode_bits(tid, HAL_TCL1_RING_FIELD_DSCP_TID_MAP1);
+		dscp++;
+
+		tid = dscp2tid(dscp);
+		value |= u32_encode_bits(tid, HAL_TCL1_RING_FIELD_DSCP_TID_MAP2);
+		dscp++;
+
+		tid = dscp2tid(dscp);
+		value |= u32_encode_bits(tid, HAL_TCL1_RING_FIELD_DSCP_TID_MAP3);
+		dscp++;
+
+		tid = dscp2tid(dscp);
+		value |= u32_encode_bits(tid, HAL_TCL1_RING_FIELD_DSCP_TID_MAP4);
+		dscp++;
+
+		tid = dscp2tid(dscp);
+		value |= u32_encode_bits(tid, HAL_TCL1_RING_FIELD_DSCP_TID_MAP5);
+		dscp++;
+
+		tid = dscp2tid(dscp);
+		value |= u32_encode_bits(tid, HAL_TCL1_RING_FIELD_DSCP_TID_MAP6);
+		dscp++;
+
+		tid = dscp2tid(dscp);
+		value |= u32_encode_bits(tid, HAL_TCL1_RING_FIELD_DSCP_TID_MAP7);
+		dscp++;
+
+		memcpy(&hw_map_val[i], &value, 3);
+	}
+
+	for (i = 0; i < HAL_DSCP_TID_TBL_SIZE; i += 4) {
+		ath12k_hif_write32(ab, addr, *(u32 *)&hw_map_val[i]);
+		addr += 4;
+	}
+
+	/* Disable read/write access */
+	ctrl_reg_val = ath12k_hif_read32(ab, HAL_SEQ_WCSS_UMAC_TCL_REG +
+					 HAL_TCL1_RING_CMN_CTRL_REG);
+	ctrl_reg_val &= ~HAL_TCL1_RING_CMN_CTRL_DSCP_TID_MAP_PROG_EN;
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_TCL_REG +
+			   HAL_TCL1_RING_CMN_CTRL_REG,
+			   ctrl_reg_val);
+}
+
+void ath12k_hal_tx_configure_bank_register(struct ath12k_base *ab, u32 bank_config,
+					   u8 bank_id)
+{
+	ath12k_hif_write32(ab, HAL_TCL_SW_CONFIG_BANK_ADDR + 4 * bank_id,
+			   bank_config);
+}


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
