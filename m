Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AED0D3B7D0
	for <ath12k@archiver.kernel.org>; Mon, 25 Nov 2024 03:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zURFGllpIljKKB3tL6gsRA+jdPRpFcuTN7gXMjco7hk=; b=urkF2R1N4PFIP9k1LI5SKnKxKj
	myi+DHMipK4Ru3X2f3mAYz4Me2dOqprhvYo2/emcHOvU7RRyvd/xi5tIrSLaRtE3cGYGgs614+4bR
	mOSEUQaHR/Q98YVA389Hl+v//24bac0dJvT1lWKglpPSdZK3DPtZgCjBH7/3B8G2nrtWYgyfXtVRf
	NH1XE1hr4GSmXN7OaGGP7fKrjVzBLhSFEVJ5C9h5D2/eGNwWt72W30/WQdinNErL/J4/bAUJC44DF
	jgVUQuTwPKBOK7Sj7kxSuYINJxsru2YhdUIUDKm/JIYAEZ335I1SX92VgWI8Gh1NB/OgT4Sn67Hou
	ZJ00Wjpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8t-00000006zOp-1Gi2
	for ath12k@archiver.kernel.org;
	Mon, 25 Nov 2024 03:52:07 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8i-00000006z8w-289Z;
	Mon, 25 Nov 2024 03:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732506710; bh=JHo5yCp8VACc+UBmU5nSM4syrbWRWoUtL5s/bOzLsRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oE3KuVgx2WBFexO24XieyFZYZiWv/m2a6S0hf3cx0zh2q1v+/BbTwSASL6imFkU5l
	 7X7oxmHqFFsx+sko+OaiUPWZ6aO8zm5BvZRHSdpBuTM+UxiST1OuPtfr0y3aVMdpeP
	 PRmHbz/a5yisZr2GjG/VnZFc+nA3dOcNJRVqmR6g=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 80CF81488DDB;
	Mon, 25 Nov 2024 04:51:50 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
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
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFC] [PATCH v2 12/13] wifi: ath12k: implement QRTR endpoint ID fetching for PCI
Date: Mon, 25 Nov 2024 04:50:27 +0100
Message-ID: <c866d89b97c5e74a9575449324d1d152ab0fd939.1732506261.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1732506261.git.ionic@ionic.de>
References: <cover.1732506261.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_195157_448861_2FDE4ADF 
X-CRM114-Status: GOOD (  10.35  )
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

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/mhi.h |  2 ++
 drivers/net/wireless/ath/ath12k/pci.c |  1 +
 3 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 2f6d14382ed7..a6067c236c0d 100644
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
@@ -654,3 +656,23 @@ void ath12k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic)
 {
 	mhi_download_rddm_image(mhi_ctrl, in_panic);
 }
+
+int ath12k_mhi_set_qrtr_endpoint_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+	struct ath12k_qmi *qmi = &ab->qmi;
+	int ret;
+
+	/* Pass endpoint ID up for QMI usage. */
+	ret = qrtr_endpoint_id_get_or_assign(ab_pci->mhi_ctrl,
+					     &qmi->handle.endpoint_id);
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
index 7358b8477536..c4e00c1747c8 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.h
+++ b/drivers/net/wireless/ath/ath12k/mhi.h
@@ -44,4 +44,6 @@ void ath12k_mhi_clear_vector(struct ath12k_base *ab);
 void ath12k_mhi_suspend(struct ath12k_pci *ar_pci);
 void ath12k_mhi_resume(struct ath12k_pci *ar_pci);
 void ath12k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic);
+
+int ath12k_mhi_set_qrtr_endpoint_id(struct ath12k_base *ab);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index cf907550e6a4..3d65c64d1b31 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1514,6 +1514,7 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 #ifdef CONFIG_ATH12K_COREDUMP
 	.coredump_download = ath12k_pci_coredump_download,
 #endif
+	.set_qrtr_endpoint_id = ath12k_mhi_set_qrtr_endpoint_id,
 };
 
 static
-- 
2.45.2


