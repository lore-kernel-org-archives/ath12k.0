Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3ECD1D896
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 18:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDOIO2GPwNAJNMHKuxlbphtTtDYLnozARLgr9Yr11KU=; b=MSIdHHDejy2cyEpGNs8ORfAuG/
	mClA5R2KBfm09XDb8KQvF2ECw1JyM7By4NUmhBsMdx2UUozA/Vhz9sqrNez/3uJQGlzy0nNDf2MdR
	yxi54J+qo3jeh2r2te6oyYVkj1Mc4/2UyGIga9zNny4oWnHNSeLMip/98SSqd2ALchRf2w0ZYRiaW
	jhzixBK+g9ArrV87eKTBZew0zH+oK4g3qbQxhIla+YDdBBp4CcfjucPJkI8ESaOoutGg3ADywBO9Z
	cAXVrJ7t4fhAdlzYGiNkU4OSaXFovdhwOwBdE70inR8dSTvUbny2vdEPbAUwo/V2ybqjplE1uOw2x
	PtiX589Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mHE-00000009CJN-390S
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 18:28:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mHC-00000009CI2-0wxt
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 18:28:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FAdonH009437;
	Tue, 15 Oct 2024 18:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDOIO2GPwNAJNMHKuxlbphtTtDYLnozARLgr9Yr11KU=; b=B1VCOMgEnUde3zgN
	q6ph6hAEWX48GGti4QGn90uQDvrvvzR7ou26Mks2p9MuJ9J3afM77DQQF9LizL3j
	KR2sJq7TPhgj1k0JyJIJU92uxra7MBNZGsPQ7fLxVJP9SwmcUAl4j5anSzwdlPN7
	s2p76uKTriln2fleia5bUpATLM9nCT6AQ29Hkm2gR0k/MgaNBHd4FftblfktqDGQ
	aTa4/uPa+V0nNyCbm7KXkyG6wKFt2hauQzOqtqhW3siCNPXW7xf3bJVD0wW0X/Sw
	/gq2bxH+xL0+NGOpojWttpfxfuwXVv8VpUgq3QcV/Ag4j7+w7iWGZJ/p7K4XCNvx
	2soVDQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427jd90jua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:28:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FIS7gi017265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:28:07 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 11:28:02 -0700
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
Subject: [PATCH v2 11/22] wifi: ath12k: remap CMEM register space for IPQ5332
Date: Tue, 15 Oct 2024 23:56:26 +0530
Message-ID: <20241015182637.955753-12-quic_rajkbhag@quicinc.com>
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
X-Proofpoint-GUID: zSKy951daI9-0dLiTsAls_F4sUrwOEip
X-Proofpoint-ORIG-GUID: zSKy951daI9-0dLiTsAls_F4sUrwOEip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_112810_328515_C1011AC3 
X-CRM114-Status: GOOD (  14.58  )
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

In IPQ5332 CMEM region is outside of WCSS register block. Hence, add
hardware param cmem_remap for IPQ5332. This parameter would be used
by Ath12k AHB driver to remap the CMEM registers to a new space for
accessing them.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 7 +++++++
 drivers/net/wireless/ath/ath12k/hal.h  | 4 ++++
 drivers/net/wireless/ath/ath12k/hw.c   | 9 +++++++++
 drivers/net/wireless/ath/ath12k/hw.h   | 1 +
 4 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 126c9fed1fad..535ad8aeb453 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -722,6 +722,11 @@ struct ath12k_pdev {
 	struct mlo_timestamp timestamp;
 };
 
+struct cmem_remap {
+	u32 base;
+	u32 size;
+};
+
 struct ath12k_fw_pdev {
 	u32 pdev_id;
 	u32 phy_id;
@@ -787,6 +792,8 @@ struct ath12k_base {
 	void __iomem *mem;
 	unsigned long mem_len;
 
+	void __iomem *mem_cmem;
+
 	struct {
 		enum ath12k_bus bus;
 		const struct ath12k_hif_ops *ops;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 69579f118b81..2184da129966 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -372,6 +372,10 @@ struct ath12k_base;
  * ath12k_hal_rx_desc_get_err().
  */
 
+#define HAL_IPQ5332_CMEM_REG_BASE	0xC100000
+#define HAL_IPQ5332_CMEM_SIZE		0x40000
+#define HAL_IPQ5332_CMEM_BASE		0x100000
+
 enum hal_srng_ring_id {
 	HAL_SRNG_RING_ID_REO2SW0 = 0,
 	HAL_SRNG_RING_ID_REO2SW1,
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index a4e0c21ac4b7..bf1b62debacf 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1223,6 +1223,11 @@ static const struct ath12k_hw_hal_params ath12k_hw_hal_params_ipq5332 = {
 			    HAL_WBM_SW_COOKIE_CONV_CFG_WBM2SW4_EN,
 };
 
+static const struct cmem_remap ath12k_cmem_remap_ipq5332 = {
+	.base = HAL_IPQ5332_CMEM_REG_BASE,
+	.size = HAL_IPQ5332_CMEM_SIZE,
+};
+
 static const struct ath12k_hw_params ath12k_hw_params[] = {
 	{
 		.name = "qcn9274 hw1.0",
@@ -1301,6 +1306,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.supports_aspm = false,
 
 		.m3_fw_support = true,
+		.cmem_remap = NULL,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -1383,6 +1389,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.supports_aspm = true,
 
 		.m3_fw_support = true,
+		.cmem_remap = NULL,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1461,6 +1468,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.supports_aspm = false,
 
 		.m3_fw_support = true,
+		.cmem_remap = NULL,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -1534,6 +1542,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.supports_aspm = false,
 
 		.m3_fw_support = false,
+		.cmem_remap = &ath12k_cmem_remap_ipq5332,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 22bd0a91b3e9..e30bec688b74 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -222,6 +222,7 @@ struct ath12k_hw_params {
 	u32 iova_mask;
 
 	bool m3_fw_support;
+	const struct cmem_remap *cmem_remap;
 };
 
 struct ath12k_hw_ops {
-- 
2.34.1


