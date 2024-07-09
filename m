Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AD0C2BD09
	for <ath12k@archiver.kernel.org>; Tue,  9 Jul 2024 05:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2sqKfWeLb//E5e1NbZQTLB18yv0j8fhAfiIGY6pQEjs=; b=ip2aX+G/5a7yM9sUQdVS9kMAAq
	JIf58PjW5dDmby/X3tUVI3g7aiW4zaIyp7FHFrrYQTDl1Idh8OIFiwOqBMAR+RdD219sHcbEe9cQ0
	1nuYVq/OmfHLLu4BqgGCb/qSbICFt2/qx7RHxnMUOuyHYCsep5kQIZhyM85qovuo2gfn0gcoAJSJh
	yNwQhKnQBu+kplA4B3kmvHVbg2rIwUJAGWzOEQJ7Rjq9XzQlCvo3sDM1OzwZux5mBqO6A/ifMJJ4q
	e5ZkO6o2rn5XcUPf5fG9ikMg9/yyjTQDeavnssZ1D/GeBhhTLuUkVeJFnxK/XwDTIFM7d5Du9VzJA
	F/Gt4+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR3s8-00000005zlu-3Hse
	for ath12k@archiver.kernel.org;
	Tue, 09 Jul 2024 05:58:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR3s5-00000005zlH-3qfI
	for ath12k@lists.infradead.org;
	Tue, 09 Jul 2024 05:58:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468N8MIs000983;
	Tue, 9 Jul 2024 05:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2sqKfWeLb//E5e1NbZQTLB
	18yv0j8fhAfiIGY6pQEjs=; b=POAL+C5qEefx4HqzuOt03R+kbEQSbq1XvSbRX3
	nVMVL+qUqv6eZGAXy5C1JfmGFxdiuJ8wX5CBC0CWCXVueDKbuyx0f3D9qa4+y0Y1
	BrRf1D7mQ7iGofGTW2UQh85+eWbXwJazaY7C0gpK38J/3EzwwEZx6gkHg6YD0K05
	6pS9o2/ya7CsQWvpookTXQ/ezRWPAskVgxOigRNO7KSVYnkKHqRBq92lGYK8C8yh
	y17YdB/R3sDBotL4GlHExNMC81oQRmAD2uWHTjd5U4FKTgyNjQ6QVwOO7b46mYMb
	cA+gVm31sC6YlsK4dcpvU6ozihw9kfjhDAwwWsEp8Zf2HxkQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t5n9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 05:58:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4695wYB8009291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 05:58:34 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 22:58:32 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH] wifi: ath12k: restore ASPM for supported hardwares only
Date: Tue, 9 Jul 2024 11:28:17 +0530
Message-ID: <20240709055817.3371406-1-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cxWUjw7GihkvnaZ3SejBq5LCiKSa5VzG
X-Proofpoint-ORIG-GUID: cxWUjw7GihkvnaZ3SejBq5LCiKSa5VzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=877 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_225838_193605_FBB84A50 
X-CRM114-Status: GOOD (  13.50  )
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

During PCI based hardware device start up, ASPM is disabled for all. And
once firmware is ready, it is restored back. However, not all hardwares
(for example QCN9274) supports ASPM. Hence there is a need to conditionally
restore ASPM back. Or else, for such hardwares, issue can be seen during
sending and receiving packets.

Introduce a new hardware param supports_aspm which identifies whether a
given hardware supports ASPM or not and then accordingly restore it.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c  | 6 ++++++
 drivers/net/wireless/ath/ath12k/hw.h  | 1 +
 drivers/net/wireless/ath/ath12k/pci.c | 3 ++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 2e11ea763574..76c0e07a88de 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -924,6 +924,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
+
+		.supports_aspm = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -1000,6 +1002,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.acpi_guid = &wcn7850_uuid,
 		.supports_dynamic_smps_6ghz = false,
+
+		.supports_aspm = true,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1072,6 +1076,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
+
+		.supports_aspm = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index e792eb6b249b..4cfbb240bbf4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -187,6 +187,7 @@ struct ath12k_hw_params {
 	bool tcl_ring_retry:1;
 	bool reoq_lut_support:1;
 	bool supports_shadow_regs:1;
+	bool supports_aspm:1;
 
 	u32 num_tcl_banks;
 	u32 max_tx_ring;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 876c029f58f6..ff2199f7754c 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -953,7 +953,8 @@ static void ath12k_pci_update_qrtr_node_id(struct ath12k_base *ab)
 
 static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 {
-	if (test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
+	if (ab_pci->ab->hw_params->supports_aspm &&
+	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
 		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
 						   PCI_EXP_LNKCTL_ASPMC,
 						   ab_pci->link_ctl &

base-commit: 9fddbf081f2da3a20fecda0b58adacbf1379e304
-- 
2.34.1


