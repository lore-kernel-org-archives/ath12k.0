Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E3C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 04:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E09HZyKkud8ILqJ6swB1M1D6nE24WKAlHnogGfWZsj8=; b=SFjuf3em5lKFaL7vmtu604+Ow9
	ZgGdByTxb/GDyK3lHABki1WcZBkAWESnFEnkCpUNYXQCfbKA4+6xt4/pageJE+CEjZyCe7uWgcYAp
	sw8mG7bFkcqrzYp7wa5Bpns6eZgx9k/TTjMKHPei9u95w6TN3pSqMg9BTwjsdm6k1hafX5ZDV3QKT
	OWJqGcVF49eYmLofV9j7EItXV1HZTpLcr7snAm3YYophJV0+ABqW/p5MVSWroKBU9C70kiWcRRafP
	Df0opVUpVECT70EW6iW6jA44yleqtuuKrj7UXBYjn9nRoPjkAYz+fz2m83ojnSJ8YYuzKV+luSKNz
	yo6JKLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMI2-00000008BZb-06Og
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 04:36:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMHz-00000008BWw-1eaX
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 04:36:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U1wlce031587;
	Thu, 30 Jan 2025 04:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E09HZyKkud8ILqJ6swB1M1D6nE24WKAlHnogGfWZsj8=; b=OEH2TTkWm3Lda0hP
	xdauCn76wzUtK8CQlkqv31RfcnQs1DM+7K/4CfhQrO4AYlv5hMowF4kRo/t6zf3V
	TnKXIyD0ObgyFKMJQVoLpt4aA9BEnoiM9ZoIFd+9XhcmNkwyZMkaRgt8XyH5TqpX
	b1Up+9N9p8toQEDtwpy2nbb8kjjECgRu5SRDU2cBwIeZ8dVBoXijY6l639ChZT3X
	xpEoMq/ZSBksoKpb+0SxHZd/SbT5iSzFO+lgkRtJsNJg8uUmCMpdQ7fJ7rfNz6nb
	KaYkimGnnwb9ij+bgLjJXV3Yb2mT4yBjQ8LGyEvRRjgiksSf5cXLeB8nleCaHC1W
	+op1zQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g08306uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 04:36:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50U4a3pv000443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 04:36:03 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 Jan 2025 20:35:59 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Balamurugan S
	<quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        "Raj
 Kumar Bhagat" <quic_rajkbhag@quicinc.com>
Subject: [PATCH v5 06/13] wifi: ath12k: Add hw_params to remap CE register space for IPQ5332
Date: Thu, 30 Jan 2025 10:05:01 +0530
Message-ID: <20250130043508.1885026-7-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HDc2cov3m1_UhifQNT_lmSUIiAOmC8AP
X-Proofpoint-ORIG-GUID: HDc2cov3m1_UhifQNT_lmSUIiAOmC8AP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_203627_555705_9BD4BBEE 
X-CRM114-Status: GOOD (  17.49  )
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
AHB driver (in subsequent patches) to remap the CE registers to a
new space for accessing them.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ce.h   | 11 ++++++++
 drivers/net/wireless/ath/ath12k/core.h |  4 +++
 drivers/net/wireless/ath/ath12k/hal.h  |  4 +++
 drivers/net/wireless/ath/ath12k/hw.c   | 35 +++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/hw.h   |  3 +++
 5 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index 8007a94cec5d..57f75899ee03 100644
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
index 353dce22682a..22ade838b99f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -912,6 +912,10 @@ struct ath12k_base {
 	void __iomem *mem;
 	unsigned long mem_len;
 
+	void __iomem *mem_ce;
+	u32 ce_remap_base_addr;
+	bool ce_remap;
+
 	struct {
 		enum ath12k_bus bus;
 		const struct ath12k_hif_ops *ops;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 1ce97f9a92ac..47ff0b1bfdf4 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -11,6 +11,7 @@
 #include "rx_desc.h"
 
 struct ath12k_base;
+#define HAL_CE_REMAP_REG_BASE	(ab->ce_remap_base_addr)
 
 #define HAL_LINK_DESC_SIZE			(32 << 2)
 #define HAL_LINK_DESC_ALIGN			128
@@ -372,6 +373,9 @@ struct ath12k_base;
  * ath12k_hal_rx_desc_get_err().
  */
 
+#define HAL_IPQ5332_CE_WFSS_REG_BASE	0x740000
+#define HAL_IPQ5332_CE_SIZE		0x100000
+
 enum hal_srng_ring_id {
 	HAL_SRNG_RING_ID_REO2SW0 = 0,
 	HAL_SRNG_RING_ID_REO2SW1,
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 84f542c02c94..91aecca566a4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1110,10 +1110,14 @@ static const struct ath12k_hw_regs ipq5332_regs = {
 	.hal_ppe_rel_ring_base = 0x0000046c,
 
 	/* CE address */
-	.hal_umac_ce0_src_reg_base = 0x00740000,
-	.hal_umac_ce0_dest_reg_base = 0x00741000,
-	.hal_umac_ce1_src_reg_base = 0x00742000,
-	.hal_umac_ce1_dest_reg_base = 0x00743000,
+	.hal_umac_ce0_src_reg_base = 0x00740000 -
+		HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.hal_umac_ce0_dest_reg_base = 0x00741000 -
+		HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.hal_umac_ce1_src_reg_base = 0x00742000 -
+		HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.hal_umac_ce1_dest_reg_base = 0x00743000 -
+		HAL_IPQ5332_CE_WFSS_REG_BASE,
 };
 
 static const struct ath12k_hw_regs wcn7850_regs = {
@@ -1227,6 +1231,17 @@ static const struct ath12k_hw_hal_params ath12k_hw_hal_params_ipq5332 = {
 			    HAL_WBM_SW_COOKIE_CONV_CFG_WBM2SW4_EN,
 };
 
+static const struct ce_ie_addr ath12k_ce_ie_addr_ipq5332 = {
+	.ie1_reg_addr = CE_HOST_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie2_reg_addr = CE_HOST_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie3_reg_addr = CE_HOST_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
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
@@ -1304,6 +1319,9 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.iova_mask = 0,
 
 		.supports_aspm = false,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -1385,6 +1403,9 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.iova_mask = ATH12K_PCIE_MAX_PAYLOAD_SIZE - 1,
 
 		.supports_aspm = true,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1462,6 +1483,9 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.iova_mask = 0,
 
 		.supports_aspm = false,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -1534,6 +1558,9 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.iova_mask = 0,
 		.supports_aspm = false,
+
+		.ce_ie_addr = &ath12k_ce_ie_addr_ipq5332,
+		.ce_remap = &ath12k_ce_remap_ipq5332,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index fbe1aec475ce..6a75af093f31 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -226,6 +226,9 @@ struct ath12k_hw_params {
 	bool supports_dynamic_smps_6ghz;
 
 	u32 iova_mask;
+
+	const struct ce_ie_addr *ce_ie_addr;
+	const struct ce_remap *ce_remap;
 };
 
 struct ath12k_hw_ops {
-- 
2.34.1


