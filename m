Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A03C282D4
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 18:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UPqro2A4t+6dGrcMG1QVtsONIWe1YM1p2VBZkFe2VM=; b=wNYIEe8OfFGEJv5nF82cH01d/n
	xqy2pfOz9m2izGRtbXQbUa6RnmgJ8Kuj8xAKB3u5uKAV37nr0e++kWOR3J3aQlOtmIo6GG1R7evGR
	oVr+Ev01F6+NvVXutctQql8vEm6WmCUt8Nf+j7XEKu9A2NS0WuTRWkqmVOmhuB3pZUyWlNM1OxExe
	mCR1FysZp4VZfyUs+kyKTyH563Tyxws8VoxokohcQQgedM8YL54zqsHHZIh+RpFzwH2Pi9yTNbfoW
	eytGvCz7jFW2JIbfUTiYGeyQxRgB+0PWp9Ue5jDlUi0xBkVKvuKvMfaFhVD+preRYUw3UuOqofYlD
	fG8cTuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Z1-0000000CGcu-3Zrq
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 18:58:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Ku-0000000CCpd-0RY1
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 18:43:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SBfAIA022554;
	Fri, 28 Feb 2025 18:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UPqro2A4t+6dGrcMG1QVtsONIWe1YM1p2VBZkFe2VM=; b=XOyg9/XqpXu90Bzm
	nZzptuCpvUtg9tc7cVQJF4JYKAipe16V9NlApAqjdWAmRm9WIBl6LQ+OnXh1Y3S3
	3gnAJq9ad3io3qpRpu/6S9W0PVSWFXp3DiDyrZYUL8tbB/7JxPnbWn3uoBku3mRb
	yFRLESaWQRyu0+h9reGmwaKCw1Xk+SrF39qidRe1sgJxskKni26/xPxXH0NIoipe
	RJbvX642lwAAelgXuYugEHBh8f/WedxinwXZfyu2QmEmWF1G3Szb5qz6LHIKg6oT
	g5aOE1OXpWcZCElaBzuit2e73+qocG/4ksvVBDHMz0IlPgMlA/KJWV1VLGPKizrY
	CzD/SQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453cg3s5x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 18:43:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51SIhiD7019863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 18:43:44 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Feb 2025 10:43:40 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Balamurugan S
	<quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        "Raj
 Kumar Bhagat" <quic_rajkbhag@quicinc.com>
Subject: [PATCH v8 05/13] wifi: ath12k: avoid m3 firmware download in AHB device IPQ5332
Date: Sat, 1 Mar 2025 00:12:06 +0530
Message-ID: <20250228184214.337119-6-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FP3xGEVxRKMfhlC_HCYZ5tO6V_VwIhdR
X-Proofpoint-ORIG-GUID: FP3xGEVxRKMfhlC_HCYZ5tO6V_VwIhdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_05,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_104348_141647_CAF3B3ED 
X-CRM114-Status: GOOD (  15.39  )
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

Hence, add new parameter (fw.m3_loader) in ath12k_hw_params to avoid
m3 firmware download in IPQ5332.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c  |  4 ++++
 drivers/net/wireless/ath/ath12k/hw.h  |  6 ++++++
 drivers/net/wireless/ath/ath12k/qmi.c | 28 ++++++++++++++++-----------
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 86c4ce143169..84f542c02c94 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1235,6 +1235,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 			.dir = "QCN9274/hw1.0",
 			.board_size = 256 * 1024,
 			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_driver,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -1312,6 +1313,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 			.dir = "WCN7850/hw2.0",
 			.board_size = 256 * 1024,
 			.cal_offset = 256 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_driver,
 		},
 
 		.max_radios = 1,
@@ -1391,6 +1393,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 			.dir = "QCN9274/hw2.0",
 			.board_size = 256 * 1024,
 			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_driver,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,
@@ -1467,6 +1470,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 			.dir = "IPQ5332/hw1.0",
 			.board_size = 256 * 1024,
 			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index acb81b5798ac..fbe1aec475ce 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -146,6 +146,11 @@ struct ath12k_hw_hal_params {
 	u32	  wbm2sw_cc_enable;
 };
 
+enum ath12k_m3_fw_loaders {
+	ath12k_m3_fw_loader_driver,
+	ath12k_m3_fw_loader_remoteproc,
+};
+
 struct ath12k_hw_params {
 	const char *name;
 	u16 hw_rev;
@@ -154,6 +159,7 @@ struct ath12k_hw_params {
 		const char *dir;
 		size_t board_size;
 		size_t cal_offset;
+		enum ath12k_m3_fw_loaders m3_loader;
 	} fw;
 
 	u8 max_radios;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 348dbc81bad8..6978200fb79a 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2168,10 +2168,12 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 	req.bdf_support_valid = 1;
 	req.bdf_support = 1;
 
-	req.m3_support_valid = 1;
-	req.m3_support = 1;
-	req.m3_cache_support_valid = 1;
-	req.m3_cache_support = 1;
+	if (ab->hw_params->fw.m3_loader == ath12k_m3_fw_loader_driver) {
+		req.m3_support_valid = 1;
+		req.m3_support = 1;
+		req.m3_cache_support_valid = 1;
+		req.m3_cache_support = 1;
+	}
 
 	req.cal_done_valid = 1;
 	req.cal_done = ab->qmi.cal_done;
@@ -2939,6 +2941,9 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 {
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
 
+	if (ab->hw_params->fw.m3_loader == ath12k_m3_fw_loader_remoteproc)
+		return;
+
 	if (!m3_mem->vaddr)
 		return;
 
@@ -3019,15 +3024,16 @@ int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 	struct qmi_txn txn;
 	int ret = 0;
 
-	ret = ath12k_qmi_m3_load(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to load m3 firmware: %d", ret);
-		return ret;
+	if (ab->hw_params->fw.m3_loader == ath12k_m3_fw_loader_driver) {
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


