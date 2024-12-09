Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF54E77181
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MixiaH7HSrwFEr5eFzmvu+sB3mCpX/mvtsR2aBtTiuA=; b=IIJJNYfMSpVqOSrpFQX7GJgWdg
	ULTRLgR8oxiokfpw4+nCQouxLtqBzZGlqFBQakdjdqKxvwY8UY9DFoX6DtJjtH9LjqGCiadEssE77
	wpOOFpJRcYWNbb08B0uU+Q/XQwnIpiq8zlwgepjQNx3k75ErCVY6GPEjwA7XdhcsPKRo71HJ5mJa1
	fFjT6wNRpnkHgVEsWQel+oYrxxM8+6RoQsNUNWxhbhH3v/bGfMUPhx961HPabOY/T2B7GBsagq5Nd
	g0diPWnnRzDW6DVF+uiz+XGvXkm56+lWH7+I66biNZ4OLeTAurJwo0FJPkH8+D8Tk5FfX5sg50szu
	ec6wZFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh4q-00000008cpQ-3rJz
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 16:57:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh4p-00000008co3-0r1M
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 16:57:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B99vp3d022354;
	Mon, 9 Dec 2024 16:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MixiaH7HSrwFEr5eFzmvu+sB3mCpX/mvtsR2aBtTiuA=; b=ekRCjloHTU/fTHI5
	cExO+MgrEpCD/9GggW7RDhGv7T6rFKiNSzOQiWT7cPu7a8dH2cQKqyQQD8DQm7Q2
	te5HvHV6sIiwIBrG6JFBovAtOU3W/FqzBrD4voAOKGnR0vCvI7JYQKT2RLDYnF9+
	iRZK4TDv1YpDtGF/I0DJh83esFD5sUqCr5c+3wpFdADNF7C0K7RPa2FDrG1p0gPg
	OOL5b8xVKkrjDwQxt8+PNbxc2kS0CYw/Ho62nNjKQZ8Aa9VK5pkQseRmYZGOLVjA
	m2yUV9tqXQI6LrbhctkBfF2bRZliKTMTQ2DBxJX2qJLMsmIWMtyWj/N8PPBKNIIm
	G0o+0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgnp2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 16:57:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9GvcxP025302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 16:57:38 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 08:57:35 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-kernel@vger.kernel.org>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 09/13] wifi: ath12k: Power up root PD
Date: Mon, 9 Dec 2024 22:26:40 +0530
Message-ID: <20241209165644.1680167-10-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209165644.1680167-1-quic_rajkbhag@quicinc.com>
References: <20241209165644.1680167-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4KrF3TDdYRb64U5Yj1urlUPiBFyxfg2w
X-Proofpoint-ORIG-GUID: 4KrF3TDdYRb64U5Yj1urlUPiBFyxfg2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_085743_361390_11669B57 
X-CRM114-Status: GOOD (  21.38  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Q6 processor acts as rootPD, other hardware like IPQ5332 which are
attached to Q6 act as userPDs. WCSS driver handles loading and booting
of rootPD, while the ath12k driver boots the userPD.
Get the rproc handle from the DTS entry and boot the rootPD if it
is not already powered on. Register to the rproc notifier to monitor
the rproc state, this allows ath12k driver to know power up/down
sequence of the rootPD. Power up the rootPD and wait for a power-up
notification from the notifier callback before powering up the userPDs.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 128 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/ahb.h |   7 ++
 2 files changed, 135 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index fcd949faea9f..82bfd675b45b 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -554,6 +554,124 @@ static const struct ath12k_hif_ops ath12k_ahb_hif_ops_ipq5332 = {
 	.map_service_to_pipe = ath12k_ahb_map_service_to_pipe,
 };
 
+static int ath12k_ahb_root_pd_state_notifier(struct notifier_block *nb,
+					     const unsigned long event, void *data)
+{
+	struct ath12k_ahb *ab_ahb = container_of(nb, struct ath12k_ahb, root_pd_nb);
+	struct ath12k_base *ab = ab_ahb->ab;
+
+	if (event == ATH12K_RPROC_AFTER_POWERUP) {
+		ath12k_dbg(ab, ATH12K_DBG_AHB, "Root PD is UP\n");
+		complete(&ab_ahb->rootpd_ready);
+	}
+
+	return 0;
+}
+
+static int ath12k_ahb_register_rproc_notifier(struct ath12k_base *ab)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+
+	ab_ahb->root_pd_nb.notifier_call = ath12k_ahb_root_pd_state_notifier;
+	init_completion(&ab_ahb->rootpd_ready);
+
+	ab_ahb->root_pd_notifier = qcom_register_ssr_notifier(ab_ahb->tgt_rproc->name,
+							      &ab_ahb->root_pd_nb);
+
+	if (!ab_ahb->root_pd_notifier)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void ath12k_ahb_unregister_rproc_notifier(struct ath12k_base *ab)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+
+	if (!ab_ahb->root_pd_notifier) {
+		ath12k_err(ab, "Rproc notifier not registered\n");
+		return;
+	}
+
+	qcom_unregister_ssr_notifier(ab_ahb->root_pd_notifier,
+				     &ab_ahb->root_pd_nb);
+}
+
+static int ath12k_ahb_get_rproc(struct ath12k_base *ab)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	struct device *dev = ab->dev;
+	struct rproc *prproc;
+	phandle rproc_phandle;
+
+	if (of_property_read_u32(dev->of_node, "qcom,rproc", &rproc_phandle)) {
+		ath12k_err(ab, "failed to get q6_rproc handle\n");
+		return -ENOENT;
+	}
+
+	prproc = rproc_get_by_phandle(rproc_phandle);
+	if (!prproc) {
+		ath12k_err(ab, "failed to get rproc\n");
+		return -EINVAL;
+	}
+	ab_ahb->tgt_rproc = prproc;
+
+	return 0;
+}
+
+static int ath12k_ahb_boot_root_pd(struct ath12k_base *ab)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	unsigned long time_left;
+	int ret;
+
+	ret = rproc_boot(ab_ahb->tgt_rproc);
+	if (ret < 0) {
+		ath12k_err(ab, "RootPD boot failed\n");
+		return ret;
+	}
+
+	time_left = wait_for_completion_timeout(&ab_ahb->rootpd_ready,
+						ATH12K_ROOTPD_READY_TIMEOUT);
+	if (!time_left) {
+		ath12k_err(ab, "RootPD ready wait timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int ath12k_ahb_configure_rproc(struct ath12k_base *ab)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	int ret;
+
+	ret = ath12k_ahb_get_rproc(ab);
+	if (ret < 0) {
+		ath12k_err(ab, "failed to get rproc: %d\n", ret);
+		return ret;
+	}
+
+	ret = ath12k_ahb_register_rproc_notifier(ab);
+	if (ret < 0) {
+		ath12k_err(ab, "failed to register rproc notifier\n");
+		return ret;
+	}
+
+	if (ab_ahb->tgt_rproc->state != RPROC_RUNNING) {
+		ret = ath12k_ahb_boot_root_pd(ab);
+		if (ret < 0) {
+			ath12k_err(ab, "failed to boot the remote processor Q6\n");
+			goto unreg_notifier;
+		}
+	}
+	return 0;
+
+unreg_notifier:
+	ath12k_ahb_unregister_rproc_notifier(ab);
+	return ret;
+}
+
 static int ath12k_ahb_clock_init(struct ath12k_base *ab)
 {
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
@@ -695,6 +813,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 	struct ath12k_base *ab;
 	const struct ath12k_hif_ops *hif_ops;
 	struct device_node *mem_node;
+	struct ath12k_ahb *ab_ahb;
 	enum ath12k_hw_rev hw_rev;
 	u32 addr;
 	int ret;
@@ -726,6 +845,8 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 	ab->pdev = pdev;
 	ab->hw_rev = hw_rev;
 	platform_set_drvdata(pdev, ab);
+	ab_ahb = ath12k_ab_to_ahb(ab);
+	ab_ahb->ab = ab;
 
 	/* Set fixed_mem_region to true for platforms that support fixed memory
 	 * reservation from DT. If memory is reserved from DT for FW, ath12k driver
@@ -765,6 +886,12 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 
 	ath12k_ahb_init_qmi_ce_config(ab);
 
+	ret = ath12k_ahb_configure_rproc(ab);
+	if (ret) {
+		ath12k_err(ab, "failed to configure rproc: %d\n", ret);
+		goto err_ce_free;
+	}
+
 	ret = ath12k_ahb_config_irq(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to configure irq: %d\n", ret);
@@ -809,6 +936,7 @@ static void ath12k_ahb_remove_prepare(struct ath12k_base *ab)
 	set_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags);
 	cancel_work_sync(&ab->restart_work);
 	cancel_work_sync(&ab->qmi.event_work);
+	ath12k_ahb_unregister_rproc_notifier(ab);
 }
 
 static void ath12k_ahb_free_resources(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index bd0366a79587..d1fc63091fb0 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -7,6 +7,7 @@
 #define ATH12K_AHB_H
 
 #include <linux/clk.h>
+#include <linux/remoteproc/qcom_rproc.h>
 #include "core.h"
 
 #define ATH12K_AHB_RECOVERY_TIMEOUT (3 * HZ)
@@ -16,6 +17,8 @@
 #define ATH12K_AHB_SMP2P_SMEM_VALUE_MASK	0xFFFFFFFF
 #define ATH12K_PCI_CE_WAKE_IRQ			2
 #define ATH12K_PCI_IRQ_CE0_OFFSET		3
+#define ATH12K_ROOTPD_READY_TIMEOUT		(5 * HZ)
+#define ATH12K_RPROC_AFTER_POWERUP		QCOM_SSR_AFTER_POWERUP
 
 enum ath12k_ahb_smp2p_msg_id {
 	ATH12K_AHB_POWER_SAVE_ENTER = 1,
@@ -25,8 +28,12 @@ enum ath12k_ahb_smp2p_msg_id {
 struct ath12k_base;
 
 struct ath12k_ahb {
+	struct ath12k_base *ab;
 	struct rproc *tgt_rproc;
 	struct clk *xo_clk;
+	struct completion rootpd_ready;
+	struct notifier_block root_pd_nb;
+	void *root_pd_notifier;
 };
 
 static inline struct ath12k_ahb *ath12k_ab_to_ahb(struct ath12k_base *ab)
-- 
2.34.1


