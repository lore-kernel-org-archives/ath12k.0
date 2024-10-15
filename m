Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D339ED1D896
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 18:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FaB3RkTljmeZAxMGkZIafeqQwllv5JF5XhbMwB5wwc=; b=Bx42YOiAMpM6r6AsBTpBkzy2Xk
	PAvzMkzu6gGW7uZtanYfmZkV7pzm5ke4+mIpzMuKdPh1bKhb6jNoOMz8aEqtAyz8scpBuliFS22lw
	01UEeBLfStBgGMpkJojeD+75DrDyN3P7PDMqaaB1nVaoCWSo8zIv9QgNy3cAmQq0RkiMNqOTQAiVi
	exvdTXZGOxAoJH22vfOitE63LfN8SR7lBahP3QEnxzmrRRp8bHDwKoSXReBfUlEPtpvKAWQcVY+NN
	8bXEs6Ba5jksOVkot/7p9/XAc9lgheyHGt7QAonCwuaFmXbvCRXC5hji+iRHLTiMr0D6ooudl4P9x
	wtEZFYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mHO-00000009COw-2TYr
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 18:28:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mHL-00000009CO3-31El
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 18:28:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FC5Bhi023378;
	Tue, 15 Oct 2024 18:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FaB3RkTljmeZAxMGkZIafeqQwllv5JF5XhbMwB5wwc=; b=SABHGt/8T/uVpAbQ
	zd8mC6ozINu7JTO+qK544caQjSnDgS7WzYTCsLBtjRKa0dFr8Yqus3/jz2qvXZab
	i10uVtsgihd3IdJ6uDJuo1pFvKW9zvHzXC3wVKfzcLIA4TlTycT+SJBjfymx/yzY
	MgUY+QRlo2eKaUKSC1bauW79Uu8/adwz4B721HXywsdlh58InkVzXcA0hWLB0MrX
	cm9EHzJOTtcYqDX8PLzCqpbhH1T6rmR8s5Vkqv4e6JhjZioEjrqbCP2Xb+ezM6zN
	uSUsYZa0sVBqLaCVvzY5FmAounNTYYn0WEt6tAweFEM5699RpleoKpxIjremDrtK
	N4/zYw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429r3b9646-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:28:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FISHG6018796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:28:17 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 11:28:12 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        "P Praneesh" <quic_ppranees@quicinc.com>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v2 13/22] wifi: ath12k: remap CE register space for IPQ5332
Date: Tue, 15 Oct 2024 23:56:28 +0530
Message-ID: <20241015182637.955753-14-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LhkoMcJ1yrqioYImXM7rmhdfLCk2mWrn
X-Proofpoint-GUID: LhkoMcJ1yrqioYImXM7rmhdfLCk2mWrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_112819_793597_DD9D2730 
X-CRM114-Status: GOOD (  14.63  )
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

From: Balamurugan S <quic_bselvara@quicinc.com>

For IPQ5332 CE register space is moved out of WCSS region and the
space is not contiguous. Hence, add hardware params (ce_ie_addr &
ce_remap) for IPQ5332. These parameters would be used by Ath12k
AHB driver to remap the CE registers to a new space for accessing
them.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ce.h   | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/core.h |  4 ++++
 drivers/net/wireless/ath/ath12k/hal.h  |  4 ++++
 drivers/net/wireless/ath/ath12k/hw.c   | 19 +++++++++++++++++++
 drivers/net/wireless/ath/ath12k/hw.h   |  2 ++
 5 files changed, 40 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index 46fd1f49ec4a..9dd71056e1c5 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -76,6 +76,17 @@ struct ce_pipe_config {
 	__le32 reserved;
 };
 
+struct ce_ie_addr {
+	u32 ie1_reg_addr;
+	u32 ie2_reg_addr;
+	u32 ie3_reg_addr;
+};
+
+struct ce_remap {
+	u32 base;
+	u32 size;
+};
+
 struct ce_attr {
 	/* CE_ATTR_* values */
 	unsigned int flags;
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 535ad8aeb453..ec95a9baf36a 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -794,6 +794,10 @@ struct ath12k_base {
 
 	void __iomem *mem_cmem;
 
+	void __iomem *mem_ce;
+	u32 ce_remap_base_addr;
+	bool ce_remap;
+
 	struct {
 		enum ath12k_bus bus;
 		const struct ath12k_hif_ops *ops;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 2184da129966..90756af4c4c2 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -11,6 +11,7 @@
 #include "rx_desc.h"
 
 struct ath12k_base;
+#define HAL_CE_REMAP_REG_BASE	(ab->ce_remap_base_addr)
 
 #define HAL_LINK_DESC_SIZE			(32 << 2)
 #define HAL_LINK_DESC_ALIGN			128
@@ -376,6 +377,9 @@ struct ath12k_base;
 #define HAL_IPQ5332_CMEM_SIZE		0x40000
 #define HAL_IPQ5332_CMEM_BASE		0x100000
 
+#define HAL_IPQ5332_CE_WFSS_REG_BASE	0x740000
+#define HAL_IPQ5332_CE_SIZE		0x200000
+
 enum hal_srng_ring_id {
 	HAL_SRNG_RING_ID_REO2SW0 = 0,
 	HAL_SRNG_RING_ID_REO2SW1,
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index bf1b62debacf..4117a4b718e3 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1228,6 +1228,17 @@ static const struct cmem_remap ath12k_cmem_remap_ipq5332 = {
 	.size = HAL_IPQ5332_CMEM_SIZE,
 };
 
+static const struct ce_ie_addr ath12k_ce_ie_addr_ipq5332 = {
+	.ie1_reg_addr = CE_HOST_IE_ADDRESS,
+	.ie2_reg_addr = CE_HOST_IE_2_ADDRESS,
+	.ie3_reg_addr = CE_HOST_IE_3_ADDRESS,
+};
+
+static const struct ce_remap ath12k_ce_remap_ipq5332 = {
+	.base = HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.size = HAL_IPQ5332_CE_SIZE,
+};
+
 static const struct ath12k_hw_params ath12k_hw_params[] = {
 	{
 		.name = "qcn9274 hw1.0",
@@ -1307,6 +1318,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.m3_fw_support = true,
 		.cmem_remap = NULL,
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -1390,6 +1403,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.m3_fw_support = true,
 		.cmem_remap = NULL,
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1469,6 +1484,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.m3_fw_support = true,
 		.cmem_remap = NULL,
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -1543,6 +1560,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.m3_fw_support = false,
 		.cmem_remap = &ath12k_cmem_remap_ipq5332,
+		.ce_ie_addr = &ath12k_ce_ie_addr_ipq5332,
+		.ce_remap = &ath12k_ce_remap_ipq5332,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index e30bec688b74..580c7be109e0 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -223,6 +223,8 @@ struct ath12k_hw_params {
 
 	bool m3_fw_support;
 	const struct cmem_remap *cmem_remap;
+	const struct ce_ie_addr *ce_ie_addr;
+	const struct ce_remap *ce_remap;
 };
 
 struct ath12k_hw_ops {
-- 
2.34.1


