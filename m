Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CF4C25B78
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 02:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8rh1DS6E+AYvMZCyW+dBD2F1wkQNcLlVjCAWEkUWDHM=; b=ZajSTq0zJiJ17SNoEfzIC3IP1O
	MdPyyoYWXQfT3o4IfG7slv1u/hkDd1lgw+hoZQEQ6jWtzYyK+ZCpoNHleFNWn/UN/lyZCUtpl8BjO
	bhhzhOcRot5wkfdS4O/ppj4V7ix0qUt4E9rdT06PDkdDcX60uFZ5OrZf3VP9mPfnK343AAOImH9yR
	MzGSJXovKpvFt/FwYnzu/ooALtXMFFfYMaRjc3MSp+RAD+hoGId0u2rnmxhF71w8peCNGl6G2F5Ud
	YHPDdUIFChUa7ynn5JC7gmKUDFRZCR11EIh5mQklGZuH1F3vzBx57XnE7a7u2Y2wO5REf/BOIKpKG
	pY1+Vimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC8qz-00000002aDl-1qss
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 02:15:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC8qw-00000002aDI-1aaG
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 02:15:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SLGgHx016293;
	Wed, 29 May 2024 02:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8rh1DS6E+AYvMZCyW+dBD2
	F1wkQNcLlVjCAWEkUWDHM=; b=onDBc0W/rSMAcumDoKcXfw59ysYr6CULIPRHJy
	IXHVLjWW+kMJSRLmbjil8mnav3rDk1HYag/F+Gyb/vTcDJU3b0uWoNyvkgvHu8cl
	kUQ55TD3dDVfcMlM+qbFLEld4TXSbG//O138PHiuoo/VZCr8/P0vKrHwDh9mKB4U
	ej3UiPFasgpbgaGMj9d80IGY7IL42IeYjOHBJa3I8zFfP53lF0Eea0F8ATVhpcyz
	6b3Tat+dbrE8zqCwTXaK3JXsHX/ALl8cg4TKh3XMxUUae0Yz+L26wT8FkQRDLIuf
	hpmWexS9aNvACrE5NVFN8W5JTYxmhCclyFR2zciem2TUB9nw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2myq7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 02:15:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44T2Fhmh029700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 02:15:43 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 19:15:42 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: add panic handler
Date: Wed, 29 May 2024 10:15:33 +0800
Message-ID: <20240529021533.10861-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dVhx3NzaKvgWqkJAtL3riZPsVckaeLqx
X-Proofpoint-ORIG-GUID: dVhx3NzaKvgWqkJAtL3riZPsVckaeLqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_191546_633845_0036EC14 
X-CRM114-Status: GOOD (  19.26  )
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

Currently for ath12k PCI devices, firmware could be running in one of
several execution environments, e.g., PBL, SBL and mission mode etc. Among
which PBL is the only stage where PCIe link negotiation could happen. So
normally firmware runs in PBL in order to be enumerated during system reboot.

However it might not work in kernel crash scenario: ath12k target is not
found after warm reboot from kernel crash. This is because when kernel crashes,
ath12k host does nothing to firmware. And during warm reboot, WLAN power
is sustained. So firmware is likely to keep running in mission mode throughout
the bootup process. As a result PCIe link is not established and thus target
not enumerated.

So add a handler in panic notification list for ath12k. When kernel crashes,
this handler gets called and tries to reset target to PBL state. Then PCIe
link negotiation could happen and target gets enumerated.

This change applies to all PCI devices including WCN7850 and QCN9274.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 29 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/core.h |  3 +++
 drivers/net/wireless/ath/ath12k/hif.h  |  9 ++++++++
 drivers/net/wireless/ath/ath12k/pci.c  |  8 +++++++
 4 files changed, 49 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index e7f628e935e4..4c3eab4686c2 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1188,6 +1188,29 @@ int ath12k_core_pre_init(struct ath12k_base *ab)
 	return 0;
 }
 
+static int ath12k_core_panic_handler(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	struct ath12k_base *ab = container_of(nb, struct ath12k_base,
+					      panic_nb);
+
+	return ath12k_hif_panic_handler(ab);
+}
+
+static int ath12k_core_panic_notifier_register(struct ath12k_base *ab)
+{
+	ab->panic_nb.notifier_call = ath12k_core_panic_handler;
+
+	return atomic_notifier_chain_register(&panic_notifier_list,
+					      &ab->panic_nb);
+}
+
+static void ath12k_core_panic_notifier_unregister(struct ath12k_base *ab)
+{
+	atomic_notifier_chain_unregister(&panic_notifier_list,
+					 &ab->panic_nb);
+}
+
 int ath12k_core_init(struct ath12k_base *ab)
 {
 	int ret;
@@ -1198,11 +1221,17 @@ int ath12k_core_init(struct ath12k_base *ab)
 		return ret;
 	}
 
+	ret = ath12k_core_panic_notifier_register(ab);
+	if (ret)
+		ath12k_warn(ab, "failed to register panic handler: %d\n", ret);
+
 	return 0;
 }
 
 void ath12k_core_deinit(struct ath12k_base *ab)
 {
+	ath12k_core_panic_notifier_unregister(ab);
+
 	mutex_lock(&ab->core_lock);
 
 	ath12k_core_pdev_destroy(ab);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7d20b09c52e6..44ca30b67fa2 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -14,6 +14,7 @@
 #include <linux/dmi.h>
 #include <linux/ctype.h>
 #include <linux/firmware.h>
+#include <linux/panic_notifier.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -924,6 +925,8 @@ struct ath12k_base {
 
 #endif /* CONFIG_ACPI */
 
+	struct notifier_block panic_nb;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index 7f0926fe751d..0e53ec269fa4 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -30,6 +30,7 @@ struct ath12k_hif_ops {
 	void (*ce_irq_enable)(struct ath12k_base *ab);
 	void (*ce_irq_disable)(struct ath12k_base *ab);
 	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
+	int (*panic_handler)(struct ath12k_base *ab);
 };
 
 static inline int ath12k_hif_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
@@ -147,4 +148,12 @@ static inline void ath12k_hif_power_down(struct ath12k_base *ab, bool is_suspend
 	ab->hif.ops->power_down(ab, is_suspend);
 }
 
+static inline int ath12k_hif_panic_handler(struct ath12k_base *ab)
+{
+	if (!ab->hif.ops->panic_handler)
+		return NOTIFY_DONE;
+
+	return ab->hif.ops->panic_handler(ab);
+}
+
 #endif /* ATH12K_HIF_H */
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 11b95d037051..876c029f58f6 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1302,6 +1302,13 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
 	ath12k_pci_sw_reset(ab_pci->ab, false);
 }
 
+static int ath12k_pci_panic_handler(struct ath12k_base *ab)
+{
+	ath12k_pci_sw_reset(ab, false);
+
+	return NOTIFY_OK;
+}
+
 static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 	.start = ath12k_pci_start,
 	.stop = ath12k_pci_stop,
@@ -1319,6 +1326,7 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 	.ce_irq_enable = ath12k_pci_hif_ce_irq_enable,
 	.ce_irq_disable = ath12k_pci_hif_ce_irq_disable,
 	.get_ce_msi_idx = ath12k_pci_get_ce_msi_idx,
+	.panic_handler = ath12k_pci_panic_handler,
 };
 
 static

base-commit: 2580be9ee6f5d97d6763b5d4ae4f9c0383fdf130
-- 
2.25.1


