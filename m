Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79740C4708C
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 17:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcWlhe4Yl+oILwi4Zi0ORheXu1A9bwWXqCSG/LzY6ug=; b=yF1toZyPTjTV4h
	DYe7P0jFkfojXLbVKZtiQcOVWU+qojtSFmyquSFl2Hg2CSbsSlT8oN4vl/yP+8v/7veqP9onwCWUD
	figQcfNE8hEsWAmN+MoGcLsniz7zxhKaAl4MwgBvn6KpeHI2sj02DBzyF2SVL8nVE3ERYh02uLM+8
	+ugxO7yHjMT/8y8XgOXvvmfEWsXcSLeI8U6JE+bHXS73U5WDd3bvcuS9k5R99G4//9hmm++9MOPrc
	KbJlG2OHDVWVu1s7DD6h6k97j+b6ym2DDVA5u0y9lR90aixAtAgg1KycE46S/80qkqB3ijQsoH9VK
	/yQza58+t1SM+rvSEzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMUI-006byA-Rr
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 17:46:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLS3-005yOG-1u
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JiT+Rm6AKIy9YAe2v5Cp56VdyTJPHd9aP5yfcLUcLaI=; b=Is3x3LPY18pZQ274AhhYFWNS35
	/w2w0LTWFzzPANazz8GOkXXaUxRA7sdPgInOC8DjL1oGm03q6Z4PDdR3sKY+OUWxJS5wP/Fm1S2pk
	ZUD5Wu+KDDneTE0MAMZJwYjtMV3Gdqkc8I56HzaAtQNG65Ro+DHDjDbkMJBcp61kbkxFtd5mimzYL
	06g/+k41OXKuFoQxJa10G6LtCXQGzy1pXxheqlYJrBYJp/1BtDrDiqzNS5gowx+n+0IMer7VKK4hr
	tF+3B9+TBBaYUEw4RuHrZeerR5dve/P2lQlukL3XinOI+mblEV5n5Py81v4z8Rv0PuZJUBv01rV8Q
	zFMzahkg==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRt-001OzJ-Ou
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0D01B81DFC
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF18CC4347C;
	Wed, 16 Nov 2022 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616779;
	bh=cn+A+aylJXF4OaJzk23WZu0lga0QcZMm9eDAR7zNZ8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EWUNtHPylpUYu2AsPhOvjXuX9vFBXrFJ4j+albbhhyeySJTwUdjyQsiEEjcsW3K89
	 H7TT01vwQ40Hod0Yd9AZFtT02tTxGcb6lcixkYojya9dJwfTtGkMu5HtN3JmlhWxxL
	 BO0D8DfzDBnI3VamMFeX7VagqHUtgxBOCaFBrzrDXFhxsUdlDxLXpl6NNhgiwaalz6
	 Lfw4uXE0yI1NhJb/MVyqc5Nm26XrxfAgJXSBUW/oX/GqnEdDMfrXzFNIhWjNy72haM
	 fwCyZjKucxmYTIdiuYolGsfCQdMTN0oFwxccFkU7KVIDJvaOfLKVrOJHIbyZsJUWZK
	 UKI7S0tREAG9w==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 30/50] wifi: ath12k: add hw.h
Date: Wed, 16 Nov 2022 18:38:42 +0200
Message-Id: <20221116163902.24996-31-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_163942_004624_28D1C053 
X-CRM114-Status: GOOD (  14.74  )
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
 drivers/net/wireless/ath/ath12k/hw.h | 312 +++++++++++++++++++++++++++++++++++
 1 file changed, 312 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
new file mode 100644
index 000000000000..e3461004188b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -0,0 +1,312 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_HW_H
+#define ATH12K_HW_H
+
+#include <linux/mhi.h>
+
+#include "wmi.h"
+#include "hal.h"
+
+/* Target configuration defines */
+
+/* Num VDEVS per radio */
+#define TARGET_NUM_VDEVS	(16 + 1)
+
+#define TARGET_NUM_PEERS_PDEV	(512 + TARGET_NUM_VDEVS)
+
+/* Num of peers for Single Radio mode */
+#define TARGET_NUM_PEERS_SINGLE		(TARGET_NUM_PEERS_PDEV)
+
+/* Num of peers for DBS */
+#define TARGET_NUM_PEERS_DBS		(2 * TARGET_NUM_PEERS_PDEV)
+
+/* Num of peers for DBS_SBS */
+#define TARGET_NUM_PEERS_DBS_SBS	(3 * TARGET_NUM_PEERS_PDEV)
+
+/* Max num of stations (per radio) */
+#define TARGET_NUM_STATIONS	512
+
+#define TARGET_NUM_PEERS(x)	TARGET_NUM_PEERS_##x
+#define TARGET_NUM_PEER_KEYS	2
+#define TARGET_NUM_TIDS(x)	(2 * TARGET_NUM_PEERS(x) + \
+				 4 * TARGET_NUM_VDEVS + 8)
+
+#define TARGET_AST_SKID_LIMIT	16
+#define TARGET_NUM_OFFLD_PEERS	4
+#define TARGET_NUM_OFFLD_REORDER_BUFFS 4
+
+#define TARGET_TX_CHAIN_MASK	(BIT(0) | BIT(1) | BIT(2) | BIT(4))
+#define TARGET_RX_CHAIN_MASK	(BIT(0) | BIT(1) | BIT(2) | BIT(4))
+#define TARGET_RX_TIMEOUT_LO_PRI	100
+#define TARGET_RX_TIMEOUT_HI_PRI	40
+
+#define TARGET_DECAP_MODE_RAW		0
+#define TARGET_DECAP_MODE_NATIVE_WIFI	1
+#define TARGET_DECAP_MODE_ETH		2
+
+#define TARGET_SCAN_MAX_PENDING_REQS	4
+#define TARGET_BMISS_OFFLOAD_MAX_VDEV	3
+#define TARGET_ROAM_OFFLOAD_MAX_VDEV	3
+#define TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES	8
+#define TARGET_GTK_OFFLOAD_MAX_VDEV	3
+#define TARGET_NUM_MCAST_GROUPS		12
+#define TARGET_NUM_MCAST_TABLE_ELEMS	64
+#define TARGET_MCAST2UCAST_MODE		2
+#define TARGET_TX_DBG_LOG_SIZE		1024
+#define TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK 1
+#define TARGET_VOW_CONFIG		0
+#define TARGET_NUM_MSDU_DESC		(2500)
+#define TARGET_MAX_FRAG_ENTRIES		6
+#define TARGET_MAX_BCN_OFFLD		16
+#define TARGET_NUM_WDS_ENTRIES		32
+#define TARGET_DMA_BURST_SIZE		1
+#define TARGET_RX_BATCHMODE		1
+
+#define ATH12K_HW_MAX_QUEUES		4
+#define ATH12K_QUEUE_LEN		4096
+
+#define ATH12K_HW_RATECODE_CCK_SHORT_PREAM_MASK  0x4
+
+#define ATH12K_FW_DIR			"ath12k"
+
+#define ATH12K_BOARD_MAGIC		"QCA-ATH12K-BOARD"
+#define ATH12K_BOARD_API2_FILE		"board-2.bin"
+#define ATH12K_DEFAULT_BOARD_FILE	"board.bin"
+#define ATH12K_DEFAULT_CAL_FILE		"caldata.bin"
+#define ATH12K_AMSS_FILE		"amss.bin"
+#define ATH12K_M3_FILE			"m3.bin"
+#define ATH12K_REGDB_FILE_NAME		"regdb.bin"
+
+enum ath12k_hw_rate_cck {
+	ATH12K_HW_RATE_CCK_LP_11M = 0,
+	ATH12K_HW_RATE_CCK_LP_5_5M,
+	ATH12K_HW_RATE_CCK_LP_2M,
+	ATH12K_HW_RATE_CCK_LP_1M,
+	ATH12K_HW_RATE_CCK_SP_11M,
+	ATH12K_HW_RATE_CCK_SP_5_5M,
+	ATH12K_HW_RATE_CCK_SP_2M,
+};
+
+enum ath12k_hw_rate_ofdm {
+	ATH12K_HW_RATE_OFDM_48M = 0,
+	ATH12K_HW_RATE_OFDM_24M,
+	ATH12K_HW_RATE_OFDM_12M,
+	ATH12K_HW_RATE_OFDM_6M,
+	ATH12K_HW_RATE_OFDM_54M,
+	ATH12K_HW_RATE_OFDM_36M,
+	ATH12K_HW_RATE_OFDM_18M,
+	ATH12K_HW_RATE_OFDM_9M,
+};
+
+enum ath12k_bus {
+	ATH12K_BUS_PCI,
+};
+
+#define ATH12K_EXT_IRQ_GRP_NUM_MAX 11
+
+struct hal_rx_desc;
+struct hal_tcl_data_cmd;
+struct htt_rx_ring_tlv_filter;
+enum hal_encrypt_type;
+
+struct ath12k_hw_ring_mask {
+	u8 tx[ATH12K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rx_mon_dest[ATH12K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rx[ATH12K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rx_err[ATH12K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rx_wbm_rel[ATH12K_EXT_IRQ_GRP_NUM_MAX];
+	u8 reo_status[ATH12K_EXT_IRQ_GRP_NUM_MAX];
+	u8 host2rxdma[ATH12K_EXT_IRQ_GRP_NUM_MAX];
+	u8 tx_mon_dest[ATH12K_EXT_IRQ_GRP_NUM_MAX];
+};
+
+struct ath12k_hw_hal_params {
+	enum hal_rx_buf_return_buf_manager rx_buf_rbm;
+	u32	  wbm2sw_cc_enable;
+};
+
+struct ath12k_hw_params {
+	const char *name;
+	u16 hw_rev;
+
+	struct {
+		const char *dir;
+		size_t board_size;
+		size_t cal_offset;
+	} fw;
+
+	u8 max_radios;
+	bool single_pdev_only:1;
+	u32 qmi_service_ins_id;
+	bool internal_sleep_clock:1;
+
+	const struct ath12k_hw_ops *hw_ops;
+	const struct ath12k_hw_ring_mask *ring_mask;
+	const struct ath12k_hw_regs *regs;
+
+	const struct ce_attr *host_ce_config;
+	u32 ce_count;
+	const struct ce_pipe_config *target_ce_config;
+	u32 target_ce_count;
+	const struct service_to_pipe *svc_to_ce_map;
+	u32 svc_to_ce_map_len;
+
+	const struct ath12k_hw_hal_params *hal_params;
+
+	bool rxdma1_enable:1;
+	int num_rxmda_per_pdev;
+	int num_rxdma_dst_ring;
+	bool rx_mac_buf_ring:1;
+	bool vdev_start_delay:1;
+
+	u16 interface_modes;
+	bool supports_monitor:1;
+
+	bool idle_ps:1;
+	bool download_calib:1;
+	bool supports_suspend:1;
+	bool tcl_ring_retry:1;
+	bool reoq_lut_support:1;
+	bool supports_shadow_regs:1;
+
+	u32 hal_desc_sz;
+	u32 num_tcl_banks;
+	u32 max_tx_ring;
+
+	const struct mhi_controller_config *mhi_config;
+
+	void (*wmi_init)(struct ath12k_base *ab,
+			 struct ath12k_wmi_resource_config_arg *config);
+
+	const struct hal_ops *hal_ops;
+};
+
+struct ath12k_hw_ops {
+	u8 (*get_hw_mac_from_pdev_id)(int pdev_id);
+	int (*mac_id_to_pdev_id)(const struct ath12k_hw_params *hw, int mac_id);
+	int (*mac_id_to_srng_id)(const struct ath12k_hw_params *hw, int mac_id);
+	int (*rxdma_ring_sel_config)(struct ath12k_base *ab);
+	u8 (*get_ring_selector)(struct sk_buff *skb);
+	bool (*dp_srng_is_tx_comp_ring)(int ring_num);
+};
+
+static inline
+int ath12k_hw_get_mac_from_pdev_id(const struct ath12k_hw_params *hw,
+				   int pdev_idx)
+{
+	if (hw->hw_ops->get_hw_mac_from_pdev_id)
+		return hw->hw_ops->get_hw_mac_from_pdev_id(pdev_idx);
+
+	return 0;
+}
+
+static inline int ath12k_hw_mac_id_to_pdev_id(const struct ath12k_hw_params *hw,
+					      int mac_id)
+{
+	if (hw->hw_ops->mac_id_to_pdev_id)
+		return hw->hw_ops->mac_id_to_pdev_id(hw, mac_id);
+
+	return 0;
+}
+
+static inline int ath12k_hw_mac_id_to_srng_id(const struct ath12k_hw_params *hw,
+					      int mac_id)
+{
+	if (hw->hw_ops->mac_id_to_srng_id)
+		return hw->hw_ops->mac_id_to_srng_id(hw, mac_id);
+
+	return 0;
+}
+
+struct ath12k_fw_ie {
+	__le32 id;
+	__le32 len;
+	u8 data[];
+};
+
+enum ath12k_bd_ie_board_type {
+	ATH12K_BD_IE_BOARD_NAME = 0,
+	ATH12K_BD_IE_BOARD_DATA = 1,
+};
+
+enum ath12k_bd_ie_type {
+	/* contains sub IEs of enum ath12k_bd_ie_board_type */
+	ATH12K_BD_IE_BOARD = 0,
+	ATH12K_BD_IE_BOARD_EXT = 1,
+};
+
+struct ath12k_hw_regs {
+	u32 hal_tcl1_ring_id;
+	u32 hal_tcl1_ring_misc;
+	u32 hal_tcl1_ring_tp_addr_lsb;
+	u32 hal_tcl1_ring_tp_addr_msb;
+	u32 hal_tcl1_ring_consumer_int_setup_ix0;
+	u32 hal_tcl1_ring_consumer_int_setup_ix1;
+	u32 hal_tcl1_ring_msi1_base_lsb;
+	u32 hal_tcl1_ring_msi1_base_msb;
+	u32 hal_tcl1_ring_msi1_data;
+	u32 hal_tcl_ring_base_lsb;
+
+	u32 hal_tcl_status_ring_base_lsb;
+
+	u32 hal_wbm_idle_ring_base_lsb;
+	u32 hal_wbm_idle_ring_misc_addr;
+	u32 hal_wbm_r0_idle_list_cntl_addr;
+	u32 hal_wbm_r0_idle_list_size_addr;
+	u32 hal_wbm_scattered_ring_base_lsb;
+	u32 hal_wbm_scattered_ring_base_msb;
+	u32 hal_wbm_scattered_desc_head_info_ix0;
+	u32 hal_wbm_scattered_desc_head_info_ix1;
+	u32 hal_wbm_scattered_desc_tail_info_ix0;
+	u32 hal_wbm_scattered_desc_tail_info_ix1;
+	u32 hal_wbm_scattered_desc_ptr_hp_addr;
+
+	u32 hal_wbm_sw_release_ring_base_lsb;
+	u32 hal_wbm_sw1_release_ring_base_lsb;
+	u32 hal_wbm0_release_ring_base_lsb;
+	u32 hal_wbm1_release_ring_base_lsb;
+
+	u32 pcie_qserdes_sysclk_en_sel;
+	u32 pcie_pcs_osc_dtct_config_base;
+
+	u32 hal_ppe_rel_ring_base;
+
+	u32 hal_reo2_ring_base;
+	u32 hal_reo1_misc_ctrl_addr;
+	u32 hal_reo1_sw_cookie_cfg0;
+	u32 hal_reo1_sw_cookie_cfg1;
+	u32 hal_reo1_qdesc_lut_base0;
+	u32 hal_reo1_qdesc_lut_base1;
+	u32 hal_reo1_ring_base_lsb;
+	u32 hal_reo1_ring_base_msb;
+	u32 hal_reo1_ring_id;
+	u32 hal_reo1_ring_misc;
+	u32 hal_reo1_ring_hp_addr_lsb;
+	u32 hal_reo1_ring_hp_addr_msb;
+	u32 hal_reo1_ring_producer_int_setup;
+	u32 hal_reo1_ring_msi1_base_lsb;
+	u32 hal_reo1_ring_msi1_base_msb;
+	u32 hal_reo1_ring_msi1_data;
+	u32 hal_reo1_aging_thres_ix0;
+	u32 hal_reo1_aging_thres_ix1;
+	u32 hal_reo1_aging_thres_ix2;
+	u32 hal_reo1_aging_thres_ix3;
+
+	u32 hal_reo2_sw0_ring_base;
+
+	u32 hal_sw2reo_ring_base;
+	u32 hal_sw2reo1_ring_base;
+
+	u32 hal_reo_cmd_ring_base;
+
+	u32 hal_reo_status_ring_base;
+};
+
+int ath12k_hw_init(struct ath12k_base *ab);
+
+#endif


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
