Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F8FC79FA0
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dMiUD8CXxFO5/POyjEVKFLNmf5/jxdGfzIul6o7WvA0=; b=n1p8NKt4y7PAsqFrWO1XhdW22o
	C8fOhDDxe7lseOG4LdQMn5i5f+NtCqZmyxVXYTwkvgPq1G0jDSzhAdnf5diOJHm/hHRoz1K9DtSnP
	EKje9IcfHwnzcB0ak4onsOj+BSaXdmomnDOPZwyXhHmUM13TGxTX6OqkzXh+xpL7pNNVjIx9nqj1m
	PH8h8+fcqVVm7aN77M8x66ITZvET3MiO7Hq3Yel0yRtJp1P4Z9TIZmgXT8hhhlvXE9NX81J4prNaJ
	fL6Ta1Dg/zNfr2jlssGOOa3l4UiFzIex6YkBi3XCCLawCdhqnxS4aGXuY7Fse1zlNBV3zxD+jrQ2R
	zE3KvgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sEH-00000008c6a-2VoA;
	Tue, 08 Sep 2026 09:35:01 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sEE-00000008c5F-2BF6;
	Tue, 08 Sep 2026 09:34:59 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfJgc1kNTz49Q5T;
	Tue, 08 Sep 2026 12:34:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788860092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMiUD8CXxFO5/POyjEVKFLNmf5/jxdGfzIul6o7WvA0=;
	b=VXjEG8PhTpo/Q51+H9fHF7FH5GOZXiiFcGN8TmdXeiYJW6oIV/OBg0Ew1zaQsjf7zYuGFW
	4gsOV2bUcXUsX1RZq0SCrD3y5pis56efzanry7ciOgb5j3406KRCLdnurQ4LstCb6dF5L3
	o436l9gTA+sRDWXoHN8vdEDGpBz6vCuvA2zqDSisjv3aRYBAtdjjCnYiGD5T0lPmfw91ON
	sVQ+Tz1k81122mlAZziiRfeySZG76jPH6SRY97UQgNna0qB5Ll3aiRtLfdy8NYRVHfDSMQ
	DDL89f9wvidXwvlUHISK+rlGYm+ar+0fBS80XNf5OqsuKM1OoWg/mwbE2kspeQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788860092;
	b=c2Mi5Drvv9/uXUnQ3yphwJF2J8xEuLJT1EQWQevg5CS67OyLdwbq5I/Ha9mKwBEUKU63vF
	EIvs99u+XHPolHwjFZOoZgDK5xAict6nIpnZ/ko8ODbb8jPySgqusDHzEUcMj9StoPDSB8
	VqAp0G8fvAz00TtM7eD2alAyavQWkr0q2CC79xRXi0A3f7LE+Z88GScAThXtu915697aps
	/0PjahmvMcAmGCTam61bKtnGeDnr+C9tymxwjYblZ5kfHMDGLKkVdmmgK8EMFpzfPPDP0f
	Qo9+RhCrIxC41wTVQa1PjDbPRZJIHpq4Gp1kWxF9FAoIkbt6jALCwRIA2v1LpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788860092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMiUD8CXxFO5/POyjEVKFLNmf5/jxdGfzIul6o7WvA0=;
	b=sdE6EVLqgEBAt7ATM8O5/rpHyFG9APH+ZDEdEuuPDtzqX+zsSXRid3uNzI1/zvQMB77BXH
	MCV+AAX5VzEIiVQ2/J50uhFlbK3TTfydPWMdi5pLsj3C4/k3k/5m9EUFlLvjNrEgRZWjUF
	kmIZ9XiSKWZWdB0T/yUt4/zNLwxx40syvlhs4V7I5lEBw/uDq8XTorZWpOQOu8oIBjjQ+9
	aril2sps1wGv285d2lau9yDZ5ltRFo6xFrPYQfn/PrLS9IDSKV9vPR+HsjNZ/5ei0Ukqoc
	HtsBhi5eCw6PJVXz9r2mTgID2Ybv3BfWVIomyfG3rgU/fmlrUVesjqXbpHsvZQ==
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
Subject: [PATCH v3 08/12] wifi: ath11k: implement QRTR endpoint ID fetching for PCI
Date: Tue,  8 Sep 2026 12:34:33 +0300
Message-Id: <20260908093437.2493698-1-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_023458_716009_E3C13C81 
X-CRM114-Status: GOOD (  11.30  )
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
 drivers/net/wireless/ath/ath11k/mhi.c | 46 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.h |  1 +
 drivers/net/wireless/ath/ath11k/pci.c |  1 +
 3 files changed, 48 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index a6c9ff112c68f..755a57b6058a1 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -11,6 +11,8 @@
 #include <linux/of_address.h>
 #include <linux/ioport.h>
 
+#include <net/qrtr.h>
+
 #include "core.h"
 #include "debug.h"
 #include "mhi.h"
@@ -502,3 +504,47 @@ void ath11k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic)
 {
 	mhi_download_rddm_image(mhi_ctrl, in_panic);
 }
+
+static void ath11k_mhi_qrtr_free_mhi_id(void *mhi_cntrl_void)
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
+int ath11k_mhi_set_qrtr_endpoint_id(struct ath11k_base *ab)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+	struct ath11k_qmi *qmi = &ab->qmi;
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
+				ath11k_mhi_qrtr_free_mhi_id;
+		}
+	}
+
+	spin_unlock(&ab_pci->mhi_ctrl->qrtr_endpoint_lock);
+
+	ath11k_dbg(ab, ATH11K_DBG_PCI,
+		   "queried mhi_ctrl QRTR endpoint ID: %u\n",
+		   qmi->handle.endpoint_id);
+	if (ret) {
+		ath11k_warn(ab, "failed to query QRTR endpoint ID: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath11k/mhi.h b/drivers/net/wireless/ath/ath11k/mhi.h
index 7e7561ce883cb..46a9c978b30d1 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.h
+++ b/drivers/net/wireless/ath/ath11k/mhi.h
@@ -28,4 +28,5 @@ int ath11k_mhi_suspend(struct ath11k_pci *ar_pci);
 int ath11k_mhi_resume(struct ath11k_pci *ar_pci);
 void ath11k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic);
 
+int ath11k_mhi_set_qrtr_endpoint_id(struct ath11k_base *ab);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index a163168f36176..56490a21964a3 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -918,6 +918,7 @@ static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 	.ce_irq_enable = ath11k_pci_hif_ce_irq_enable,
 	.ce_irq_disable = ath11k_pci_hif_ce_irq_disable,
 	.get_ce_msi_idx = ath11k_pcic_get_ce_msi_idx,
+	.set_qrtr_endpoint_id = ath11k_mhi_set_qrtr_endpoint_id,
 #ifdef CONFIG_DEV_COREDUMP
 	.coredump_download = ath11k_pci_coredump_download,
 #endif
-- 
2.34.1


