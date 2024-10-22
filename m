Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB84D1CDA1
	for <ath12k@archiver.kernel.org>; Tue, 22 Oct 2024 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FxDKEyZZo29nj7ZoTBY6cVoj9iNUxfeQhNIlfNxEU3c=; b=m6Rcgsoz1I+ePZisTJqJCpNZOT
	bgdTE577BaSFoZ3XWUNAm1bfZ/pKinRm9L2l6BbirJq7ejCs8tUj7xFB+3ZV3KXMn3y2zSXVgyyWI
	ItHutTEcrL9YME6aTC+IZXZMiGT8peNEMqxfMYsm8wc9TivU+FYzrPGRQi8H30WEzm4IJxT/kdj63
	TUsxw9mqvJq+IGR0ehC5WhFqpoNovwJp+k9Fo72o8vwbDHl0WbiNLoa3nMVJqx1zo8j2s5Y/fTBAN
	wYUAZ4ZfVsHmeCiouIkLm8+sqS8yLFfb/nGDGLtyZG3J6nltLCNLQvgbGuV05UkVVX0C+9K7p5R/j
	K6p0+tng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t39Fp-00000009xlD-3rUL
	for ath12k@archiver.kernel.org;
	Tue, 22 Oct 2024 07:24:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t39Fn-00000009xkn-1HiR
	for ath12k@lists.infradead.org;
	Tue, 22 Oct 2024 07:24:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LNFJkg028031;
	Tue, 22 Oct 2024 07:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FxDKEyZZo29nj7ZoTBY6cV
	oj9iNUxfeQhNIlfNxEU3c=; b=YFgz3AC1uzPJp3EckxguD6QZ0nd2J6AqBI7STR
	hQXecsw0n6T/dNP/LstDvXZSqfDi8z23e/jUm2MQSYjvTNdSA4xTmYynYPco/oOl
	5Y3hru0gaOEDUUxzTpaP4/KcEA8cz9UV/cAOvPlqzQd3Av4cxFL4ZRVExP9oq2r6
	DaGSLE937f87WTEoOWZsVG25iuqPBHc/v1HtozSDQ+qoaDypdzeQN9Xxfr1QZash
	rmEFvvqteIOqAQE1WNe5HAe0v9EV+qb5A3u6hVnn2UcXA9K5pZyx8jqszLuwedqt
	NGhZQ7hztHDVGBJJ7LF19JBIKfQAtpbJX2BTVFot8uE4H8Zw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj13akw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:24:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M7OSfC024937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:24:28 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 00:24:27 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v3] wifi: ath12k: convert tasklet to BH workqueue for CE interrupts
Date: Tue, 22 Oct 2024 12:54:06 +0530
Message-ID: <20241022072406.3231450-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uOwi9i0iqHCxeRv1OAUWpcGP2AsD-Qo3
X-Proofpoint-ORIG-GUID: uOwi9i0iqHCxeRv1OAUWpcGP2AsD-Qo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=981 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_002431_488241_C8758848 
X-CRM114-Status: GOOD (  14.69  )
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

Currently in Ath12k, tasklet is used to handle the BH context of CE
interrupts. However the tasklet is marked deprecated and has some
design flaws. To replace tasklets, BH workqueue support has been
added. BH workqueue behaves similarly to regular workqueues except
that the queued work items are executed in the BH context.

Hence, convert the tasklet to BH workqueue for handling CE interrupts
in the BH context.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
v3:
 - Removing this patch and sending it seperately from the series:
   "wifi: ath12k: add Ath12k AHB driver support for IPQ5332"

v2: https://patchwork.kernel.org/project/linux-wireless/patch/20241015182637.955753-17-quic_rajkbhag@quicinc.com/
 - No change
---
 drivers/net/wireless/ath/ath12k/ce.h  |  2 +-
 drivers/net/wireless/ath/ath12k/pci.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index 857bc5f9e946..1a14b9fb86b8 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -148,7 +148,7 @@ struct ath12k_ce_pipe {
 	void (*send_cb)(struct ath12k_ce_pipe *pipe);
 	void (*recv_cb)(struct ath12k_base *ab, struct sk_buff *skb);
 
-	struct tasklet_struct intr_tq;
+	struct work_struct intr_wq;
 	struct ath12k_ce_ring *src_ring;
 	struct ath12k_ce_ring *dest_ring;
 	struct ath12k_ce_ring *status_ring;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index fd47394553b8..cf907550e6a4 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -427,9 +427,9 @@ static void ath12k_pci_sync_ce_irqs(struct ath12k_base *ab)
 	}
 }
 
-static void ath12k_pci_ce_tasklet(struct tasklet_struct *t)
+static void ath12k_pci_ce_workqueue(struct work_struct *work)
 {
-	struct ath12k_ce_pipe *ce_pipe = from_tasklet(ce_pipe, t, intr_tq);
+	struct ath12k_ce_pipe *ce_pipe = from_work(ce_pipe, work, intr_wq);
 	int irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + ce_pipe->pipe_num;
 
 	ath12k_ce_per_engine_service(ce_pipe->ab, ce_pipe->pipe_num);
@@ -451,7 +451,7 @@ static irqreturn_t ath12k_pci_ce_interrupt_handler(int irq, void *arg)
 
 	disable_irq_nosync(ab->irq_num[irq_idx]);
 
-	tasklet_schedule(&ce_pipe->intr_tq);
+	queue_work(system_bh_wq, &ce_pipe->intr_wq);
 
 	return IRQ_HANDLED;
 }
@@ -677,7 +677,7 @@ static int ath12k_pci_config_irq(struct ath12k_base *ab)
 
 		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
 
-		tasklet_setup(&ce_pipe->intr_tq, ath12k_pci_ce_tasklet);
+		INIT_WORK(&ce_pipe->intr_wq, ath12k_pci_ce_workqueue);
 
 		ret = request_irq(irq, ath12k_pci_ce_interrupt_handler,
 				  ab_pci->irq_flags, irq_name[irq_idx],
@@ -964,7 +964,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 						   PCI_EXP_LNKCTL_ASPMC);
 }
 
-static void ath12k_pci_kill_tasklets(struct ath12k_base *ab)
+static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
 {
 	int i;
 
@@ -974,7 +974,7 @@ static void ath12k_pci_kill_tasklets(struct ath12k_base *ab)
 		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 
-		tasklet_kill(&ce_pipe->intr_tq);
+		cancel_work_sync(&ce_pipe->intr_wq);
 	}
 }
 
@@ -982,7 +982,7 @@ static void ath12k_pci_ce_irq_disable_sync(struct ath12k_base *ab)
 {
 	ath12k_pci_ce_irqs_disable(ab);
 	ath12k_pci_sync_ce_irqs(ab);
-	ath12k_pci_kill_tasklets(ab);
+	ath12k_pci_cancel_workqueue(ab);
 }
 
 int ath12k_pci_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,

base-commit: fa934bf3e0a825ee09f035c6580af513187d59a2
-- 
2.34.1


