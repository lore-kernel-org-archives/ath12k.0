Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2CAC197A0
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrJtpM55yjgSi536yU5wsbKh7uTtXU0gelJe6omEvSs=; b=SgxE0dCLIfc3YR
	d3vJbVgt4zFsCtTFEk+7zzH9d+Twvv4TG7BeY24QE9HyAQUazFhhZTjdi+ggDhSMbFQU7OQtIX9Ii
	G96+nleYrBo9W2zoiUMSWWmIPWkNzHPOPa3MWAgFvmYrw/kNRmwOFhExiDFfZUAKXgDWhLdchZYqi
	beJf8wEMzYkNvgCL4T3sAizmI/elIM7gWxiJNk2zwF8rVHQz/9PypwhjgVQ1WY1Fj/PWv3gFzFMK6
	IAl/1DOwuPt8xZtbh2Ze3Lhj2yIRkQ58yVB6Y3Cj0JXFq93O/RtSkLXXmIe1dRQ68MP2hyXAQde+D
	0YsuYf4POCCEgvVbeEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51KE-00Bkga-1x
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 10:16:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51K3-00BkcL-2D
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 10:16:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK8qNPF008174;
	Mon, 20 Nov 2023 10:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=24HKzInYJko9UhmnoYizm+FRjJugTmJLTmD9ciQQlM8=;
 b=hBitDSb+FlNZdxJ/juP09PyQq3O9fMnGTBSXuZ/43QDSKjkfKa7ZRLu5u7Ot0/DG9rTr
 SWXHW9o5mQxU2yv3mcb5OTjzZNqRxEL1DetFJVbY8EtsLDyYfh6lmQuIa3hZCO3PhU1j
 F7tTl2lSJ+0SDGmtX2BrD0QLMf7usQrPYKC9Oy/ge42rooVfBTUrolz74iGe3d6dHcFL
 w81bSSzggi50pF07Mf+weI7lfNlNA26L/g9opjss217kYbRQmDPLW0FrFZn54KLEAeI5
 gz0g++szRdM12Wo/+HUvpleMen4bsuY6RrbSaperuHyQL+WnutxW1MUbJQ9fKKJ36nvl Yw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug26trh4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:16:06 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKAG55o031944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:16:05 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 02:16:03 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 5/7] wifi: ath12k: add support one MSI vector
Date: Mon, 20 Nov 2023 18:15:41 +0800
Message-ID: <20231120101543.4369-6-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120101543.4369-1-quic_kangyang@quicinc.com>
References: <20231120101543.4369-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N8zIpk2WDImfpRRit1T__yQe8NAr9SlR
X-Proofpoint-GUID: N8zIpk2WDImfpRRit1T__yQe8NAr9SlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_07,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=867 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_021607_866705_2930C5B5 
X-CRM114-Status: GOOD (  26.92  )
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

On some platforms it's not possible to allocate 32 MSI vectors for
various reasons, maybe kernel configuration, VT-d disabled, buggy BIOS
etc. So ath12k was not able to use WCN7850 PCI devices on those
platforms. Add support for one MSI vector to solve that.

In case of one MSI vector, interrupt migration needs to be disabled.
This is because when interrupt migration happens, the msi_data may
change. However, msi_data is already programmed to rings during initial
phase and ath12k has no way to know that msi_data is changed during run
time and reprogram again.

In case of one MSI vector, MHI subsystem should not use IRQF_NO_SUSPEND
as WCN7850 doesn't set this flag too. Ath12k doesn't need to leave IRQ
enabled in suspend state.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 16 +++++++--
 drivers/net/wireless/ath/ath12k/pci.c | 51 ++++++++++++++++++++-------
 2 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 39e640293cdc..638b124eb895 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -251,6 +251,7 @@ static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
 	u32 user_base_data, base_vector;
 	int ret, num_vectors, i;
 	int *irq;
+	unsigned int msi_data;
 
 	ret = ath12k_pci_get_user_msi_assignment(ab,
 						 "MHI", &num_vectors,
@@ -265,9 +266,15 @@ static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
 	if (!irq)
 		return -ENOMEM;
 
-	for (i = 0; i < num_vectors; i++)
-		irq[i] = ath12k_pci_get_msi_irq(ab->dev,
-						base_vector + i);
+	msi_data = base_vector;
+	for (i = 0; i < num_vectors; i++) {
+		if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+			irq[i] = ath12k_pci_get_msi_irq(ab->dev,
+							msi_data++);
+		else
+			irq[i] = ath12k_pci_get_msi_irq(ab->dev,
+							msi_data);
+	}
 
 	ab_pci->mhi_ctrl->irq = irq;
 	ab_pci->mhi_ctrl->nr_irqs = num_vectors;
@@ -374,6 +381,9 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		goto free_controller;
 	}
 
+	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		mhi_ctrl->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
+
 	mhi_ctrl->iova_start = 0;
 	mhi_ctrl->iova_stop = 0xffffffff;
 	mhi_ctrl->sbl_size = SZ_512K;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 3bb2d622dc52..4484bac18f4e 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -61,6 +61,17 @@ static const struct ath12k_msi_config ath12k_msi_config[] = {
 	},
 };
 
+static const struct ath12k_msi_config msi_config_one_msi = {
+	.total_vectors = 1,
+	.total_users = 4,
+	.users = (struct ath12k_msi_user[]) {
+		{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+		{ .name = "CE", .num_vectors = 1, .base_vector = 0 },
+		{ .name = "WAKE", .num_vectors = 1, .base_vector = 0 },
+		{ .name = "DP", .num_vectors = 1, .base_vector = 0 },
+	},
+};
+
 static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 	"bhi",
 	"mhi-er0",
@@ -414,16 +425,18 @@ static void ath12k_pci_sync_ce_irqs(struct ath12k_base *ab)
 static void ath12k_pci_ce_tasklet(struct tasklet_struct *t)
 {
 	struct ath12k_ce_pipe *ce_pipe = from_tasklet(ce_pipe, t, intr_tq);
+	int irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + ce_pipe->pipe_num;
 
 	ath12k_ce_per_engine_service(ce_pipe->ab, ce_pipe->pipe_num);
 
-	ath12k_pci_ce_irq_enable(ce_pipe->ab, ce_pipe->pipe_num);
+	enable_irq(ce_pipe->ab->irq_num[irq_idx]);
 }
 
 static irqreturn_t ath12k_pci_ce_interrupt_handler(int irq, void *arg)
 {
 	struct ath12k_ce_pipe *ce_pipe = arg;
 	struct ath12k_base *ab = ce_pipe->ab;
+	int irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + ce_pipe->pipe_num;
 
 	if (!test_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
 		return IRQ_HANDLED;
@@ -431,7 +444,8 @@ static irqreturn_t ath12k_pci_ce_interrupt_handler(int irq, void *arg)
 	/* last interrupt received for this CE */
 	ce_pipe->timestamp = jiffies;
 
-	ath12k_pci_ce_irq_disable(ce_pipe->ab, ce_pipe->pipe_num);
+	disable_irq_nosync(ab->irq_num[irq_idx]);
+
 	tasklet_schedule(&ce_pipe->intr_tq);
 
 	return IRQ_HANDLED;
@@ -504,11 +518,13 @@ static int ath12k_pci_ext_grp_napi_poll(struct napi_struct *napi, int budget)
 						napi);
 	struct ath12k_base *ab = irq_grp->ab;
 	int work_done;
+	int i;
 
 	work_done = ath12k_dp_service_srng(ab, irq_grp, budget);
 	if (work_done < budget) {
 		napi_complete_done(napi, work_done);
-		ath12k_pci_ext_grp_enable(irq_grp);
+		for (i = 0; i < irq_grp->num_irq; i++)
+			enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 	}
 
 	if (work_done > budget)
@@ -521,6 +537,7 @@ static irqreturn_t ath12k_pci_ext_interrupt_handler(int irq, void *arg)
 {
 	struct ath12k_ext_irq_grp *irq_grp = arg;
 	struct ath12k_base *ab = irq_grp->ab;
+	int i;
 
 	if (!test_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags))
 		return IRQ_HANDLED;
@@ -530,7 +547,8 @@ static irqreturn_t ath12k_pci_ext_interrupt_handler(int irq, void *arg)
 	/* last interrupt received for this group */
 	irq_grp->timestamp = jiffies;
 
-	ath12k_pci_ext_grp_disable(irq_grp);
+	for (i = 0; i < irq_grp->num_irq; i++)
+		disable_irq_nosync(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 
 	napi_schedule(&irq_grp->napi);
 
@@ -713,18 +731,26 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 					    msi_config->total_vectors,
 					    msi_config->total_vectors,
 					    PCI_IRQ_MSI);
-	if (num_vectors != msi_config->total_vectors) {
-		ath12k_err(ab, "failed to get %d MSI vectors, only %d available",
-			   msi_config->total_vectors, num_vectors);
 
-		if (num_vectors >= 0)
-			return -EINVAL;
-		else
-			return num_vectors;
-	} else {
+	if (num_vectors == msi_config->total_vectors) {
 		set_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
 		ab_pci->irq_flags = IRQF_SHARED;
+	} else {
+		num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
+						    1,
+						    1,
+						    PCI_IRQ_MSI);
+		if (num_vectors < 0) {
+			ret = -EINVAL;
+			goto reset_msi_config;
+		}
+		clear_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
+		ab_pci->msi_config = &msi_config_one_msi;
+		ab_pci->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
+		ath12k_dbg(ab, ATH12K_DBG_PCI, "request MSI one vector\n");
+
 	}
+	ath12k_info(ab, "MSI vectors: %d\n", num_vectors);
 
 	ath12k_pci_msi_disable(ab_pci);
 
@@ -746,6 +772,7 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 free_msi_vector:
 	pci_free_irq_vectors(ab_pci->pdev);
 
+reset_msi_config:
 	return ret;
 }
 
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
