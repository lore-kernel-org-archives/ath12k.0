Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4BBC79FA0
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkkTpGuw3kjQPg0827cXMo9wlb6PxVdztbjyv9fxYRE=; b=DUcBYftwciF5E/Q0dVSkmCTy2c
	18nxiGbxvJJVzXHcd3BqEHqbE1yF0PsueJwm5pVDw2e0Tb+GS9f6BB7JpYUj1phUR5e5Mte/dEIhd
	wHCWzAFN+sNAfIIA7nOmuSIzPBFzbqjVnYAc1LZvWmeTlZyzS8Y4ECo5a5IIYz18/Yv8asdS3QpyY
	4HFdJmIXoPbETM1bhdZWKPzIoIfCUWrF22684/y/3Np0pknPbD4suTbXH/8FBANvdTghM+SxBIwWQ
	5jZsE+XTDuH0GRXCWTtN3BRX7cRZnLOrC+tlEIg/OV52VDMfz5ubZbC/+NY5dSY7E2HPHvHpuk/SN
	o2WpwZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sEo-00000008cPW-48n9;
	Tue, 08 Sep 2026 09:35:34 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sEk-00000008cLb-0MnH;
	Tue, 08 Sep 2026 09:35:33 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfJhC3YFGz49QFh;
	Tue, 08 Sep 2026 12:35:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788860123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkkTpGuw3kjQPg0827cXMo9wlb6PxVdztbjyv9fxYRE=;
	b=j+2gJMGwwmjBtxoXBs8ny6dmWNq+unD3mb/KDp7N+adGO5Q1sIMw73sbC/3B5k5afQIWfX
	v+wvgth/SOI9eyq629wRV+bi+7Un2J7oIdemScOMhhNdPOj8sMH40TXt7LvV08pxUTI5ww
	KVMIZ6lT2hy/HCXFdMBDfB1AC09LEWFhygjPNUfgNioIeCMucGZ9TDSGWM5pDrvJhGNa2u
	Dv/r0SPtclNl68AdsIVTAY7+AhcbQpyCrWShbbwXDVLLQnn5l642ytGSI1jza/dDMH7kP0
	xpRRLk8QOeuVmUNcEn4FNbPwbPKRLklhbD44ik0djpCBkZM7JguRXjJd0tLrzQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788860123;
	b=LLuwfAlDw/WdlEl+T79niodd2dQylCSWvnmCVgTo2sBS4dooyg3ufW9i48KiScTFOdYEXW
	9/X+/KQdCoIWXfnXpCz7KORg0Ck0A/m6Zl8gocDar8mmSfQOePLdT/HiIDSWpvGKsRxCzi
	dtXomjoPFxODkANQ7k7Y3K69+rit875+7V5yTQwov3x8s4hvH+aEjrxBmnZ83hptjh/95+
	3s1K6yL84bMDU9AdCAs/X+/vTYijp4lLnLsEH0Dd0ZtbpKEfZ4IrHbz8rDZieOZhglii1W
	RcruGXGMTCkb3nrwq+FgcaB/M6kV552+57hFMby8tJMa8xcie7FDZ7GgQ9IExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788860123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkkTpGuw3kjQPg0827cXMo9wlb6PxVdztbjyv9fxYRE=;
	b=KpznF5yAjdAqUS+GF8F+v1GbzMEOLGyNN9NVBSlcNoEn3uesu8yllRV5K4bjB/+6vePh7V
	svvhEmwvJpv3+4YGmSD7FHjAtMFdF9UyweTjAiupRcTdeSvesq3CqpWxfSZZ+VQSNdB7bB
	mO4JWvpRBwfsjoCdBZ4pDhf9phKvFDoeur1BpEoMzY4/lJst9piTRVTYnEZrKWqMiSljt3
	xK/iueJT1S+jvJ7gIRPGjtIWDLaEs8EqWeHKPcn5QD4ta2b9Z4KE01AJDMOY0socRNcfwC
	WhXhH6ys/pdRCprwxG4WrrH2YAp4ZgEouOBc95MwMUzIZtrKh6htIkqgP/1mXw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
From: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
To: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mihai Moldovan <ionic@ionic.de>,
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/12] wifi: ath12k: implement QRTR endpoint ID fetching for PCI
Date: Tue,  8 Sep 2026 12:34:36 +0300
Message-Id: <20260908093437.2493698-4-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908093437.2493698-1-juha-matti.tilli@iki.fi>
References: <20260908093437.2493698-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_023530_523606_B3090FE3 
X-CRM114-Status: GOOD (  11.81  )
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

QRTR endpoint ID fetching for PCIe devices will use MHI.

Originally-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 46 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/mhi.h |  3 ++
 drivers/net/wireless/ath/ath12k/pci.c |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de9..3d0884e65939d 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -8,6 +8,8 @@
 #include <linux/pci.h>
 #include <linux/firmware.h>
 
+#include <net/qrtr.h>
+
 #include "core.h"
 #include "debug.h"
 #include "mhi.h"
@@ -527,3 +529,47 @@ void ath12k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic)
 {
 	mhi_download_rddm_image(mhi_ctrl, in_panic);
 }
+
+static void ath12k_mhi_qrtr_free_mhi_id(void *mhi_cntrl_void)
+{
+	struct mhi_controller *mhi_cntrl = mhi_cntrl_void;
+	u32 id = mhi_cntrl->qrtr_endpoint_id;
+
+	if (id != 0)
+		qrtr_endpoint_free_data_id(id);
+	mhi_cntrl->qrtr_endpoint_id = 0;
+	mhi_cntrl->free_qrtr_endpoint_id = NULL;
+}
+
+int ath12k_mhi_set_qrtr_endpoint_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+	struct ath12k_qmi *qmi = &ab->qmi;
+	int ret;
+
+	spin_lock(&ab_pci->mhi_ctrl->qrtr_endpoint_lock);
+
+	if (ab_pci->mhi_ctrl->qrtr_endpoint_id) {
+		qmi->handle.endpoint_id = ab_pci->mhi_ctrl->qrtr_endpoint_id;
+	} else {
+		ret = qrtr_endpoint_get_data_id(&qmi->handle.endpoint_id);
+		if (!ret) {
+			ab_pci->mhi_ctrl->qrtr_endpoint_id =
+				qmi->handle.endpoint_id;
+			ab_pci->mhi_ctrl->free_qrtr_endpoint_id =
+				ath12k_mhi_qrtr_free_mhi_id;
+		}
+	}
+
+	spin_unlock(&ab_pci->mhi_ctrl->qrtr_endpoint_lock);
+
+	ath12k_dbg(ab, ATH12K_DBG_PCI,
+		   "queried mhi_ctrl QRTR endpoint ID: %u\n",
+		   qmi->handle.endpoint_id);
+	if (ret) {
+		ath12k_warn(ab, "failed to query QRTR endpoint ID: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/mhi.h b/drivers/net/wireless/ath/ath12k/mhi.h
index 3674326763858..3e692ce0b5108 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.h
+++ b/drivers/net/wireless/ath/ath12k/mhi.h
@@ -41,4 +41,7 @@ void ath12k_mhi_clear_vector(struct ath12k_base *ab);
 void ath12k_mhi_suspend(struct ath12k_pci *ar_pci);
 void ath12k_mhi_resume(struct ath12k_pci *ar_pci);
 void ath12k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic);
+
+int ath12k_mhi_set_qrtr_endpoint_id(struct ath12k_base *ab);
+
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 6441927b53822..7b73672e5e8e4 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1508,6 +1508,7 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 	.ce_irq_enable = ath12k_pci_hif_ce_irq_enable,
 	.ce_irq_disable = ath12k_pci_hif_ce_irq_disable,
 	.get_ce_msi_idx = ath12k_pci_get_ce_msi_idx,
+	.set_qrtr_endpoint_id = ath12k_mhi_set_qrtr_endpoint_id,
 	.panic_handler = ath12k_pci_panic_handler,
 #ifdef CONFIG_ATH12K_COREDUMP
 	.coredump_download = ath12k_pci_coredump_download,
-- 
2.34.1


