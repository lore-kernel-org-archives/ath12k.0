Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BEDEB64DD
	for <ath12k@archiver.kernel.org>; Fri, 21 Jul 2023 05:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3r0+1h8ScC0zn6WjsJ3FE9uxOUAgr30PUvW1Tj4G5tc=; b=TDLP0NWXCVncsu
	130f7drezKjZ11QlO5xvi92xLmkzGlkAQKQMEE6lrj+CGJTgqLPyrLKf6hEZl/SjRjKqkKmDqarcw
	3g9X920piwJ9u2Pmj+zKesjRlndhMfvJjGUJstREqcofVshBSTP/fYbJslgVbr8ekbEPSUQT89uFA
	MGTuyT+lPnJxYqoVNOAZuswKN07eS7GY9WheFsj8beLs6+JBZ6eQ1dbEG5aYtuKYrWzX448CefHNl
	raSUVukT4Bu5WERgJ7OcoGy+rjuoNWBy03WSzKOWjepF2O8Aj/awbJ8aO4Ke5LgN0AaYkH6j+KZJz
	RIiTp4ZjnA4J80a3ohVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMj51-00CyIU-1d
	for ath12k@archiver.kernel.org;
	Fri, 21 Jul 2023 05:53:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMj4w-00CyGQ-2Q
	for ath12k@lists.infradead.org;
	Fri, 21 Jul 2023 05:53:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36L5hxVv025121;
	Fri, 21 Jul 2023 05:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=U8LRKtyFT85+iNUIj95aJBRmMti8NyPgBfDddPuni7M=;
 b=IBUbuoeedrq5pSyRIpBgvFIuWKWumJBpRBiBuexFPOSqAoIR5yP9odWXROtEsNON+VU0
 itruSyA3mK3nZxKSIf1+F9ci11wc3Gul23i1LJNbof6od7biUEd/1vO7mIdnBD/OIDwQ
 xs/o5ha5w/JjLDvwIPNZWB0Iztyak/fg1Xkd2JFYrrkuvjNAqAtIbl5XOl/kQbFj/6yD
 RG7LgfDX7m3o91zjYvNt02rJ57+/VKLZl2D+T1gvHn5UXpRF9GkdkIr8r3Ei0ljKoAA3
 1AAsd8swQyIYruG1TMgjI91oGhDcmLoI6nZJp36X8GK1E8LK3R/PCR9GLcFkXf2GzZrW yw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ry3y1j8w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 05:53:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36L5rM6r030451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 05:53:22 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 20 Jul 2023 22:53:20 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 1/3] wifi: ath12k: configure RDDM size to MHI for device recovery
Date: Fri, 21 Jul 2023 01:53:03 -0400
Message-ID: <20230721055305.20420-2-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230721055305.20420-1-quic_wgong@quicinc.com>
References: <20230721055305.20420-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mczhhKezgGF5BIZhjJMRX8aa0MdX3hN5
X-Proofpoint-ORIG-GUID: mczhhKezgGF5BIZhjJMRX8aa0MdX3hN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_02,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=835 bulkscore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_225326_814750_0C873C29 
X-CRM114-Status: GOOD (  17.85  )
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

RDDM is RAM DUMP DEBUG module, it is used to debug issues when firmware
encounters an error.

The rddm_size is needed by firmware while MHI enter RDDM state. Add it
to support device recovery when ath12k receive MHI_CB_EE_RDDM message.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c  | 3 +++
 drivers/net/wireless/ath/ath12k/hw.h  | 1 +
 drivers/net/wireless/ath/ath12k/mhi.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 5991cc91cd00..c69cfca67f7d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -907,6 +907,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.hal_ops = &hal_qcn9274_ops,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+		.rddm_size = 0,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -964,6 +965,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01) |
 					   BIT(CNSS_PCIE_PERST_NO_PULL_V01),
+		.rddm_size = 0x780000,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1019,6 +1021,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.hal_ops = &hal_qcn9274_ops,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+		.rddm_size = 0,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index e6c4223c283c..7d82b76ad021 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -186,6 +186,7 @@ struct ath12k_hw_params {
 	const struct hal_ops *hal_ops;
 
 	u64 qmi_cnss_feature_bitmap;
+	u32 rddm_size;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 42f1140baa4f..91b2abf6da44 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -366,6 +366,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	mhi_ctrl->fw_image = ab_pci->amss_path;
 	mhi_ctrl->regs = ab->mem;
 	mhi_ctrl->reg_len = ab->mem_len;
+	mhi_ctrl->rddm_size = ab->hw_params->rddm_size;
 
 	ret = ath12k_mhi_get_msi(ab_pci);
 	if (ret) {
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
