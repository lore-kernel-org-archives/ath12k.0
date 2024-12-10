Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DC5E77181
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcXk4MozWcgpt2wOzcHjeG5IN/KsMcmZYEFOXIESlW4=; b=O8Id01gbiTwX3+AQt1zW9GJCvG
	5g/a35kz+f2H3rzO8LF5tBKe2wBUomuaMWMOWayYMwrOYKqh60QLMwZ9JgJwUazO7n8t3uvi67XJE
	2YRDPSYlt8k/DCYQ5sMI7L5QnmHnQRqId/A26kfEq6CbLLEE1VxR0+nnr+Q/G0+1I0xv8zFonahp0
	ZZeGCc2Y/mbigUmZ/utB3goaOl+6lVUaz6M+tsUZRpPZq4ZOSF+Dj/G3bfSCaYqzwXywaJRDSD2/L
	SB0VShzoOc30cmQbSa6bf7qGpWl72Sa8idPZbAS0DZ7605hcNpioiZzQsKgOTqaZ5zPSoxq1eiRo4
	XnzSMxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKutX-0000000Aays-20t6
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 07:42:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKutV-0000000Aax7-0i4N
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 07:42:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9ILMcS031613;
	Tue, 10 Dec 2024 07:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcXk4MozWcgpt2wOzcHjeG5IN/KsMcmZYEFOXIESlW4=; b=GSWiPPtydgLjCHeX
	G+L3O42pH9iWH1TXQ/qY6+fJ5Hxskdz4jGse9GfxSQD4ZRPuW9HvcklN5o2Kmu4J
	28dc1wzzYlM8FmGWxUUxfuzCbZluVdepqeabpaqRi5xH0fo8CUOJnD21fAiBj2HM
	MM3qR2InaZWEeX5mVeS68NovK7AO9gy50bCKvWy9edbLvHsJ2OfeMXGYfg+8/g+b
	zkqCKmJpgX9DnpN5Xe6/YkhYvOiD89EDc3U3VPXFAltlJYvGD0f2i0+ZdxPdpQZw
	POoaCsskrlTB6AjHo3Qg9CLCouX44NidK0+s1PeJx8LQ75qu3Vb+PVx6dNmBWgYc
	Ok8bGg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxfgk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 07:42:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA7gq0P002619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 07:42:52 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 23:42:48 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Balamurugan S
	<quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        "Raj
 Kumar Bhagat" <quic_rajkbhag@quicinc.com>
Subject: [PATCH v4 05/13] wifi: ath12k: avoid m3 firmware download in AHB device IPQ5332
Date: Tue, 10 Dec 2024 13:11:51 +0530
Message-ID: <20241210074159.2637933-6-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210074159.2637933-1-quic_rajkbhag@quicinc.com>
References: <20241210074159.2637933-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DgfN3c3zg6E0jBaaKdsEfJPmlKwBNknX
X-Proofpoint-GUID: DgfN3c3zg6E0jBaaKdsEfJPmlKwBNknX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_234257_331189_38BECFB3 
X-CRM114-Status: GOOD (  16.07  )
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

Current ath12k devices, QCN9274 and WCN7850, supports m3.bin firmware
download through ath12k driver. The new ath12k AHB based device
IPQ5332 supports m3 firmware download through remoteproc driver.

Hence, add new parameter (needs_m3_fw) in ath12k_hw_params to avoid
m3 firmware download in IPQ5332.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c  |  8 ++++++++
 drivers/net/wireless/ath/ath12k/hw.h  |  2 ++
 drivers/net/wireless/ath/ath12k/qmi.c | 28 ++++++++++++++++-----------
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index c9cddb1417df..f7035669bc6f 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1299,6 +1299,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.iova_mask = 0,
 
 		.supports_aspm = false,
+
+		.needs_m3_fw = true,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -1379,6 +1381,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.iova_mask = ATH12K_PCIE_MAX_PAYLOAD_SIZE - 1,
 
 		.supports_aspm = true,
+
+		.needs_m3_fw = true,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1455,6 +1459,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.iova_mask = 0,
 
 		.supports_aspm = false,
+
+		.needs_m3_fw = true,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -1526,6 +1532,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.iova_mask = 0,
 		.supports_aspm = false,
+
+		.needs_m3_fw = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 36bec99e9e4d..241aa83ddbdd 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -220,6 +220,8 @@ struct ath12k_hw_params {
 	bool supports_dynamic_smps_6ghz;
 
 	u32 iova_mask;
+
+	bool needs_m3_fw;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index ba3cd2342465..7a29a24b9268 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2082,10 +2082,12 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 	req.bdf_support_valid = 1;
 	req.bdf_support = 1;
 
-	req.m3_support_valid = 1;
-	req.m3_support = 1;
-	req.m3_cache_support_valid = 1;
-	req.m3_cache_support = 1;
+	if (ab->hw_params->needs_m3_fw) {
+		req.m3_support_valid = 1;
+		req.m3_support = 1;
+		req.m3_cache_support_valid = 1;
+		req.m3_cache_support = 1;
+	}
 
 	req.cal_done_valid = 1;
 	req.cal_done = ab->qmi.cal_done;
@@ -2726,6 +2728,9 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 {
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
 
+	if (!ab->hw_params->needs_m3_fw)
+		return;
+
 	if (!m3_mem->vaddr)
 		return;
 
@@ -2806,15 +2811,16 @@ int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 	struct qmi_txn txn;
 	int ret = 0;
 
-	ret = ath12k_qmi_m3_load(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to load m3 firmware: %d", ret);
-		return ret;
+	if (ab->hw_params->needs_m3_fw) {
+		ret = ath12k_qmi_m3_load(ab);
+		if (ret) {
+			ath12k_err(ab, "failed to load m3 firmware: %d", ret);
+			return ret;
+		}
+		req.addr = m3_mem->paddr;
+		req.size = m3_mem->size;
 	}
 
-	req.addr = m3_mem->paddr;
-	req.size = m3_mem->size;
-
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_m3_info_resp_msg_v01_ei, &resp);
 	if (ret < 0)
-- 
2.34.1


