Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48191C43219
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4svMCKe8kpjuWobkWwV1OnlHvX/hXrMSABrJkTyiv4U=; b=YEjXtgeBTALm/P
	Ba0j2nHV4Jc5fdWAEo88ANNXbvkEhRHaSC7NSzhPaLtgLrrzqnX8mylZsBIXOOHQSjCFtCRaCvHMu
	LsNkTKEnCGqvNF9LN+pv7po3me7RIbwxEj4fZziMjflgzTuq95rwKw9zmgsanlMeMJRMA9Pamx0t6
	CIQ18+K4x6BznvWoVAD+OTmtBBsWxNS4VaxXVrmtsQNVgAHcp3DZ7+dqJ6ouSQmNY1u6mrCCVo7/9
	zK06uuG7INVK/ajvtxA8XAMhLlPrBOpNlmCb3I/gys+U+s/P4wIlljRma40dE5c3YSafV2DgHE2lz
	SznkrWILlFkb/JeclNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLS3-005yPm-NT
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:39:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLS2-005yO6-Pn
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=brpDbHLW4avqsk1pFbwF2VjzQsGlNPOU/eoCloLZXb0=; b=Ob4foYU9ene94kVnF3SyIjNzXO
	nMZ+Sz2M28tnSDV3U9p3L1/HU37Vuraly+7QASiZ0wgeQnKcndfGQQdKHxTrLErc1VljAEU/Jlzpe
	5AJrvLsAaQ2KgbAMihnlSMmHsqgwaOYQPtGr7MJd4x1gxJ73eWhEAC1oKiJQWaiwG7p3kJx/irg0v
	Fi5lzhnjv+/aqioH6TfvkAyV8EM5O7+5G3zuiI/87uz7CXKDGzPZBQdPBmOzTRv8EWX8dqLvOr1qu
	UNYtVtU6xcPa+dyHIioAaTlHrRPyroTnGpVU/Ve1ORU7NRUXleoovdGL11mjW47YnTSAmzB7xsoOk
	KOLRUrDw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRv-001OuK-Is
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C72A61EE3
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127B0C433D6;
	Wed, 16 Nov 2022 16:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616782;
	bh=b5W9ToVoIm1eL95b7ImCQSwd/E1ZS5c51KPsG0O1y5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMF9M/aE2saraHDeWe3G/LknF+xGAlhXnYXN+ps9VwaKzdDqxZaK4hlvqs8CfDtmD
	 o28CUwvfyDoLNArOY+0IixeP58ObCxs8UVpFNI+DvFuKeg5l95BSsy0ZXokae/UpwI
	 DvP21CWyGtTCxcdNGaJIDCe30WJ/qYwp5lq23pvxB2xZZbuJy5LC5l3lPXlnDnHhGM
	 SGQOlPJW1qMOuhYv/qAfs+xI0GbnTAXBgq+m6A1vW4zTUy3rMmdlzp4LClqhK7Y3QX
	 NVef0eVzULRyUm98skbrRmeyO0x+FfkILiVVsRxSz7XtPEZ+9okMAM+ZgBEJL32wFM
	 qUJeJgZA35jXA==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 33/50] wifi: ath12k: add mhi.c
Date: Wed, 16 Nov 2022 18:38:45 +0200
Message-Id: <20221116163902.24996-34-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_163944_270235_56CCF968 
X-CRM114-Status: GOOD (  19.11  )
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
 drivers/net/wireless/ath/ath12k/mhi.c | 616 ++++++++++++++++++++++++++++++++++
 1 file changed, 616 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
new file mode 100644
index 000000000000..42f1140baa4f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -0,0 +1,616 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/msi.h>
+#include <linux/pci.h>
+
+#include "core.h"
+#include "debug.h"
+#include "mhi.h"
+#include "pci.h"
+
+#define MHI_TIMEOUT_DEFAULT_MS	90000
+
+static const struct mhi_channel_config ath12k_mhi_channels_qcn9274[] = {
+	{
+		.num = 0,
+		.name = "LOOPBACK",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 1,
+		.name = "LOOPBACK",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = true,
+	},
+};
+
+static struct mhi_event_config ath12k_mhi_events_qcn9274[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_mhi_config_qcn9274 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_mhi_channels_qcn9274),
+	.ch_cfg = ath12k_mhi_channels_qcn9274,
+	.num_events = ARRAY_SIZE(ath12k_mhi_events_qcn9274),
+	.event_cfg = ath12k_mhi_events_qcn9274,
+};
+
+static const struct mhi_channel_config ath12k_mhi_channels_wcn7850[] = {
+	{
+		.num = 0,
+		.name = "LOOPBACK",
+		.num_elements = 32,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 1,
+		.name = "LOOPBACK",
+		.num_elements = 32,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 64,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 64,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = true,
+	},
+};
+
+static struct mhi_event_config ath12k_mhi_events_wcn7850[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_CTRL,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_mhi_config_wcn7850 = {
+	.max_channels = 128,
+	.timeout_ms = 2000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_mhi_channels_wcn7850),
+	.ch_cfg = ath12k_mhi_channels_wcn7850,
+	.num_events = ARRAY_SIZE(ath12k_mhi_events_wcn7850),
+	.event_cfg = ath12k_mhi_events_wcn7850,
+};
+
+void ath12k_mhi_set_mhictrl_reset(struct ath12k_base *ab)
+{
+	u32 val;
+
+	val = ath12k_pci_read32(ab, MHISTATUS);
+
+	ath12k_dbg(ab, ATH12K_DBG_PCI, "MHISTATUS 0x%x\n", val);
+
+	/* Observed on some targets that after SOC_GLOBAL_RESET, MHISTATUS
+	 * has SYSERR bit set and thus need to set MHICTRL_RESET
+	 * to clear SYSERR.
+	 */
+	ath12k_pci_write32(ab, MHICTRL, MHICTRL_RESET_MASK);
+
+	mdelay(10);
+}
+
+static void ath12k_mhi_reset_txvecdb(struct ath12k_base *ab)
+{
+	ath12k_pci_write32(ab, PCIE_TXVECDB, 0);
+}
+
+static void ath12k_mhi_reset_txvecstatus(struct ath12k_base *ab)
+{
+	ath12k_pci_write32(ab, PCIE_TXVECSTATUS, 0);
+}
+
+static void ath12k_mhi_reset_rxvecdb(struct ath12k_base *ab)
+{
+	ath12k_pci_write32(ab, PCIE_RXVECDB, 0);
+}
+
+static void ath12k_mhi_reset_rxvecstatus(struct ath12k_base *ab)
+{
+	ath12k_pci_write32(ab, PCIE_RXVECSTATUS, 0);
+}
+
+void ath12k_mhi_clear_vector(struct ath12k_base *ab)
+{
+	ath12k_mhi_reset_txvecdb(ab);
+	ath12k_mhi_reset_txvecstatus(ab);
+	ath12k_mhi_reset_rxvecdb(ab);
+	ath12k_mhi_reset_rxvecstatus(ab);
+}
+
+static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
+{
+	struct ath12k_base *ab = ab_pci->ab;
+	u32 user_base_data, base_vector;
+	int ret, num_vectors, i;
+	int *irq;
+
+	ret = ath12k_pci_get_user_msi_assignment(ab,
+						 "MHI", &num_vectors,
+						 &user_base_data, &base_vector);
+	if (ret)
+		return ret;
+
+	ath12k_dbg(ab, ATH12K_DBG_PCI, "Number of assigned MSI for MHI is %d, base vector is %d\n",
+		   num_vectors, base_vector);
+
+	irq = kcalloc(num_vectors, sizeof(*irq), GFP_KERNEL);
+	if (!irq)
+		return -ENOMEM;
+
+	for (i = 0; i < num_vectors; i++)
+		irq[i] = ath12k_pci_get_msi_irq(ab->dev,
+						base_vector + i);
+
+	ab_pci->mhi_ctrl->irq = irq;
+	ab_pci->mhi_ctrl->nr_irqs = num_vectors;
+
+	return 0;
+}
+
+static int ath12k_mhi_op_runtime_get(struct mhi_controller *mhi_cntrl)
+{
+	return 0;
+}
+
+static void ath12k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
+{
+}
+
+static char *ath12k_mhi_op_callback_to_str(enum mhi_callback reason)
+{
+	switch (reason) {
+	case MHI_CB_IDLE:
+		return "MHI_CB_IDLE";
+	case MHI_CB_PENDING_DATA:
+		return "MHI_CB_PENDING_DATA";
+	case MHI_CB_LPM_ENTER:
+		return "MHI_CB_LPM_ENTER";
+	case MHI_CB_LPM_EXIT:
+		return "MHI_CB_LPM_EXIT";
+	case MHI_CB_EE_RDDM:
+		return "MHI_CB_EE_RDDM";
+	case MHI_CB_EE_MISSION_MODE:
+		return "MHI_CB_EE_MISSION_MODE";
+	case MHI_CB_SYS_ERROR:
+		return "MHI_CB_SYS_ERROR";
+	case MHI_CB_FATAL_ERROR:
+		return "MHI_CB_FATAL_ERROR";
+	case MHI_CB_BW_REQ:
+		return "MHI_CB_BW_REQ";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static void ath12k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
+				    enum mhi_callback cb)
+{
+	struct ath12k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+
+	ath12k_dbg(ab, ATH12K_DBG_BOOT, "mhi notify status reason %s\n",
+		   ath12k_mhi_op_callback_to_str(cb));
+
+	switch (cb) {
+	case MHI_CB_SYS_ERROR:
+		ath12k_warn(ab, "firmware crashed: MHI_CB_SYS_ERROR\n");
+		break;
+	case MHI_CB_EE_RDDM:
+		if (!(test_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags)))
+			queue_work(ab->workqueue_aux, &ab->reset_work);
+		break;
+	default:
+		break;
+	}
+}
+
+static int ath12k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
+				  void __iomem *addr,
+				  u32 *out)
+{
+	*out = readl(addr);
+
+	return 0;
+}
+
+static void ath12k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
+				    void __iomem *addr,
+				    u32 val)
+{
+	writel(val, addr);
+}
+
+int ath12k_mhi_register(struct ath12k_pci *ab_pci)
+{
+	struct ath12k_base *ab = ab_pci->ab;
+	struct mhi_controller *mhi_ctrl;
+	int ret;
+
+	mhi_ctrl = mhi_alloc_controller();
+	if (!mhi_ctrl)
+		return -ENOMEM;
+
+	ath12k_core_create_firmware_path(ab, ATH12K_AMSS_FILE,
+					 ab_pci->amss_path,
+					 sizeof(ab_pci->amss_path));
+
+	ab_pci->mhi_ctrl = mhi_ctrl;
+	mhi_ctrl->cntrl_dev = ab->dev;
+	mhi_ctrl->fw_image = ab_pci->amss_path;
+	mhi_ctrl->regs = ab->mem;
+	mhi_ctrl->reg_len = ab->mem_len;
+
+	ret = ath12k_mhi_get_msi(ab_pci);
+	if (ret) {
+		ath12k_err(ab, "failed to get msi for mhi\n");
+		mhi_free_controller(mhi_ctrl);
+		return ret;
+	}
+
+	mhi_ctrl->iova_start = 0;
+	mhi_ctrl->iova_stop = 0xffffffff;
+	mhi_ctrl->sbl_size = SZ_512K;
+	mhi_ctrl->seg_len = SZ_512K;
+	mhi_ctrl->fbc_download = true;
+	mhi_ctrl->runtime_get = ath12k_mhi_op_runtime_get;
+	mhi_ctrl->runtime_put = ath12k_mhi_op_runtime_put;
+	mhi_ctrl->status_cb = ath12k_mhi_op_status_cb;
+	mhi_ctrl->read_reg = ath12k_mhi_op_read_reg;
+	mhi_ctrl->write_reg = ath12k_mhi_op_write_reg;
+
+	ret = mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
+	if (ret) {
+		ath12k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
+		mhi_free_controller(mhi_ctrl);
+		return ret;
+	}
+
+	return 0;
+}
+
+void ath12k_mhi_unregister(struct ath12k_pci *ab_pci)
+{
+	struct mhi_controller *mhi_ctrl = ab_pci->mhi_ctrl;
+
+	mhi_unregister_controller(mhi_ctrl);
+	kfree(mhi_ctrl->irq);
+	mhi_free_controller(mhi_ctrl);
+	ab_pci->mhi_ctrl = NULL;
+}
+
+static char *ath12k_mhi_state_to_str(enum ath12k_mhi_state mhi_state)
+{
+	switch (mhi_state) {
+	case ATH12K_MHI_INIT:
+		return "INIT";
+	case ATH12K_MHI_DEINIT:
+		return "DEINIT";
+	case ATH12K_MHI_POWER_ON:
+		return "POWER_ON";
+	case ATH12K_MHI_POWER_OFF:
+		return "POWER_OFF";
+	case ATH12K_MHI_FORCE_POWER_OFF:
+		return "FORCE_POWER_OFF";
+	case ATH12K_MHI_SUSPEND:
+		return "SUSPEND";
+	case ATH12K_MHI_RESUME:
+		return "RESUME";
+	case ATH12K_MHI_TRIGGER_RDDM:
+		return "TRIGGER_RDDM";
+	case ATH12K_MHI_RDDM_DONE:
+		return "RDDM_DONE";
+	default:
+		return "UNKNOWN";
+	}
+};
+
+static void ath12k_mhi_set_state_bit(struct ath12k_pci *ab_pci,
+				     enum ath12k_mhi_state mhi_state)
+{
+	struct ath12k_base *ab = ab_pci->ab;
+
+	switch (mhi_state) {
+	case ATH12K_MHI_INIT:
+		set_bit(ATH12K_MHI_INIT, &ab_pci->mhi_state);
+		break;
+	case ATH12K_MHI_DEINIT:
+		clear_bit(ATH12K_MHI_INIT, &ab_pci->mhi_state);
+		break;
+	case ATH12K_MHI_POWER_ON:
+		set_bit(ATH12K_MHI_POWER_ON, &ab_pci->mhi_state);
+		break;
+	case ATH12K_MHI_POWER_OFF:
+	case ATH12K_MHI_FORCE_POWER_OFF:
+		clear_bit(ATH12K_MHI_POWER_ON, &ab_pci->mhi_state);
+		clear_bit(ATH12K_MHI_TRIGGER_RDDM, &ab_pci->mhi_state);
+		clear_bit(ATH12K_MHI_RDDM_DONE, &ab_pci->mhi_state);
+		break;
+	case ATH12K_MHI_SUSPEND:
+		set_bit(ATH12K_MHI_SUSPEND, &ab_pci->mhi_state);
+		break;
+	case ATH12K_MHI_RESUME:
+		clear_bit(ATH12K_MHI_SUSPEND, &ab_pci->mhi_state);
+		break;
+	case ATH12K_MHI_TRIGGER_RDDM:
+		set_bit(ATH12K_MHI_TRIGGER_RDDM, &ab_pci->mhi_state);
+		break;
+	case ATH12K_MHI_RDDM_DONE:
+		set_bit(ATH12K_MHI_RDDM_DONE, &ab_pci->mhi_state);
+		break;
+	default:
+		ath12k_err(ab, "unhandled mhi state (%d)\n", mhi_state);
+	}
+}
+
+static int ath12k_mhi_check_state_bit(struct ath12k_pci *ab_pci,
+				      enum ath12k_mhi_state mhi_state)
+{
+	struct ath12k_base *ab = ab_pci->ab;
+
+	switch (mhi_state) {
+	case ATH12K_MHI_INIT:
+		if (!test_bit(ATH12K_MHI_INIT, &ab_pci->mhi_state))
+			return 0;
+		break;
+	case ATH12K_MHI_DEINIT:
+	case ATH12K_MHI_POWER_ON:
+		if (test_bit(ATH12K_MHI_INIT, &ab_pci->mhi_state) &&
+		    !test_bit(ATH12K_MHI_POWER_ON, &ab_pci->mhi_state))
+			return 0;
+		break;
+	case ATH12K_MHI_FORCE_POWER_OFF:
+		if (test_bit(ATH12K_MHI_POWER_ON, &ab_pci->mhi_state))
+			return 0;
+		break;
+	case ATH12K_MHI_POWER_OFF:
+	case ATH12K_MHI_SUSPEND:
+		if (test_bit(ATH12K_MHI_POWER_ON, &ab_pci->mhi_state) &&
+		    !test_bit(ATH12K_MHI_SUSPEND, &ab_pci->mhi_state))
+			return 0;
+		break;
+	case ATH12K_MHI_RESUME:
+		if (test_bit(ATH12K_MHI_SUSPEND, &ab_pci->mhi_state))
+			return 0;
+		break;
+	case ATH12K_MHI_TRIGGER_RDDM:
+		if (test_bit(ATH12K_MHI_POWER_ON, &ab_pci->mhi_state) &&
+		    !test_bit(ATH12K_MHI_TRIGGER_RDDM, &ab_pci->mhi_state))
+			return 0;
+		break;
+	case ATH12K_MHI_RDDM_DONE:
+		return 0;
+	default:
+		ath12k_err(ab, "unhandled mhi state: %s(%d)\n",
+			   ath12k_mhi_state_to_str(mhi_state), mhi_state);
+	}
+
+	ath12k_err(ab, "failed to set mhi state %s(%d) in current mhi state (0x%lx)\n",
+		   ath12k_mhi_state_to_str(mhi_state), mhi_state,
+		   ab_pci->mhi_state);
+
+	return -EINVAL;
+}
+
+static int ath12k_mhi_set_state(struct ath12k_pci *ab_pci,
+				enum ath12k_mhi_state mhi_state)
+{
+	struct ath12k_base *ab = ab_pci->ab;
+	int ret;
+
+	ret = ath12k_mhi_check_state_bit(ab_pci, mhi_state);
+	if (ret)
+		goto out;
+
+	ath12k_dbg(ab, ATH12K_DBG_PCI, "setting mhi state: %s(%d)\n",
+		   ath12k_mhi_state_to_str(mhi_state), mhi_state);
+
+	switch (mhi_state) {
+	case ATH12K_MHI_INIT:
+		ret = mhi_prepare_for_power_up(ab_pci->mhi_ctrl);
+		break;
+	case ATH12K_MHI_DEINIT:
+		mhi_unprepare_after_power_down(ab_pci->mhi_ctrl);
+		ret = 0;
+		break;
+	case ATH12K_MHI_POWER_ON:
+		ret = mhi_async_power_up(ab_pci->mhi_ctrl);
+		break;
+	case ATH12K_MHI_POWER_OFF:
+		mhi_power_down(ab_pci->mhi_ctrl, true);
+		ret = 0;
+		break;
+	case ATH12K_MHI_FORCE_POWER_OFF:
+		mhi_power_down(ab_pci->mhi_ctrl, false);
+		ret = 0;
+		break;
+	case ATH12K_MHI_SUSPEND:
+		ret = mhi_pm_suspend(ab_pci->mhi_ctrl);
+		break;
+	case ATH12K_MHI_RESUME:
+		ret = mhi_pm_resume(ab_pci->mhi_ctrl);
+		break;
+	case ATH12K_MHI_TRIGGER_RDDM:
+		ret = mhi_force_rddm_mode(ab_pci->mhi_ctrl);
+		break;
+	case ATH12K_MHI_RDDM_DONE:
+		break;
+	default:
+		ath12k_err(ab, "unhandled MHI state (%d)\n", mhi_state);
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		goto out;
+
+	ath12k_mhi_set_state_bit(ab_pci, mhi_state);
+
+	return 0;
+
+out:
+	ath12k_err(ab, "failed to set mhi state: %s(%d)\n",
+		   ath12k_mhi_state_to_str(mhi_state), mhi_state);
+	return ret;
+}
+
+int ath12k_mhi_start(struct ath12k_pci *ab_pci)
+{
+	int ret;
+
+	ab_pci->mhi_ctrl->timeout_ms = MHI_TIMEOUT_DEFAULT_MS;
+
+	ret = ath12k_mhi_set_state(ab_pci, ATH12K_MHI_INIT);
+	if (ret)
+		goto out;
+
+	ret = ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_ON);
+	if (ret)
+		goto out;
+
+	return 0;
+
+out:
+	return ret;
+}
+
+void ath12k_mhi_stop(struct ath12k_pci *ab_pci)
+{
+	ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_OFF);
+	ath12k_mhi_set_state(ab_pci, ATH12K_MHI_DEINIT);
+}
+
+void ath12k_mhi_suspend(struct ath12k_pci *ab_pci)
+{
+	ath12k_mhi_set_state(ab_pci, ATH12K_MHI_SUSPEND);
+}
+
+void ath12k_mhi_resume(struct ath12k_pci *ab_pci)
+{
+	ath12k_mhi_set_state(ab_pci, ATH12K_MHI_RESUME);
+}


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
