Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2F8C3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsvfOzhj5BKclpW+etMSL7ugsDpt4z+vpKn2XCqSKTQ=; b=ezx2qvD63fxfXBd9bBxC1J0J+B
	JncAsXCI7P08cnakhem88IdJ2kj4Z4aBhUJD3//EvAQjq+rqi67FvpiGxyXaAPu0RTNaUYx7zhxz+
	Ukbs77i4/cro9sJFjZq40Ijfe3BQr1/o2+tike0A+8Ict3lBy+NkBWdw88uRVgiXQ+Da05+Uw9RE+
	7nodSz1vVV8GJVDGX8rg9+ibclEwJ/rs7OfXog1B4cQdodIMAAC6VsV7O3cBlgmb9WDYLVGaZ62zB
	6sbkfwiNygcm46HwWkfY37CVhbPk0Zp9I/nPK0hUoWaK5LrVGfmrIhnIaX66kMi3tp/5m6cWjUcQL
	5MwaFDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAYd-00000006Rai-0Y3f
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 09:44:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAYa-00000006RZS-3EoA
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 09:44:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNFk6L031130;
	Wed, 14 Aug 2024 09:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsvfOzhj5BKclpW+etMSL7ugsDpt4z+vpKn2XCqSKTQ=; b=cEn/CDiNl6i34xOD
	pvdBt7Nk9rkRACuTjDLzKYmqYmxtMjqn9y2tLbw3KwdvC9dz7YhwciNH+xv7Tdim
	zZZNyfH5fhWCNIOeoSmXfJydvnOai+x2qgIkS2sCQUDQcqEPTi+YlEdh2tZhYz0Q
	K2nZRRHxcw8nvw+Gh3lQXewWxSGly5qlrTOQyxSYXRfBSReVhOz5maaQ7cgqgSVn
	khrwuZmUaX1U4s+imiK4G87AkDSVov0uHjRRH5DY0lRpyU7tK7I7+UFJ0HpmK4On
	1eHLAGKKJTXZJhNeGzruYqRePb2dQxYX4OF8Jl+ZZMjfDcLdhu3a78zSqmM4+W8n
	hzllUA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4103ws3uj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 09:44:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E9idnc010529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 09:44:39 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 02:44:37 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Balamurugan S
	<quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        "Raj
 Kumar Bhagat" <quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH 09/18] wifi: ath12k: avoid m3 firmware download in AHB device IPQ5332
Date: Wed, 14 Aug 2024 15:13:14 +0530
Message-ID: <20240814094323.3927603-10-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814094323.3927603-1-quic_rajkbhag@quicinc.com>
References: <20240814094323.3927603-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HWRBNSr24X5tLpyvKH9mJK9Dol9Q57GB
X-Proofpoint-ORIG-GUID: HWRBNSr24X5tLpyvKH9mJK9Dol9Q57GB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_024440_845841_8673ED00 
X-CRM114-Status: GOOD (  16.61  )
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

Hence, add new parameter (m3_fw_support) in ath12k_hw_params to avoid
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
index fcf2b462263b..58ffdef3efcb 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1298,6 +1298,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.iova_mask = 0,
 		.supports_aspm = false,
+
+		.m3_fw_support = true,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -1377,6 +1379,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.iova_mask = ATH12K_PCIE_MAX_PAYLOAD_SIZE - 1,
 		.supports_aspm = true,
+
+		.m3_fw_support = true,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1452,6 +1456,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.iova_mask = 0,
 		.supports_aspm = false,
+
+		.m3_fw_support = true,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -1523,6 +1529,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.iova_mask = 0,
 		.supports_aspm = false,
+
+		.m3_fw_support = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 36bec99e9e4d..22bd0a91b3e9 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -220,6 +220,8 @@ struct ath12k_hw_params {
 	bool supports_dynamic_smps_6ghz;
 
 	u32 iova_mask;
+
+	bool m3_fw_support;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b93ce9f87f61..668232d83c10 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2080,10 +2080,12 @@ static int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 	req.bdf_support_valid = 1;
 	req.bdf_support = 1;
 
-	req.m3_support_valid = 1;
-	req.m3_support = 1;
-	req.m3_cache_support_valid = 1;
-	req.m3_cache_support = 1;
+	if (ab->hw_params->m3_fw_support) {
+		req.m3_support_valid = 1;
+		req.m3_support = 1;
+		req.m3_cache_support_valid = 1;
+		req.m3_cache_support = 1;
+	}
 
 	req.cal_done_valid = 1;
 	req.cal_done = ab->qmi.cal_done;
@@ -2721,6 +2723,9 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 {
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
 
+	if (!ab->hw_params->m3_fw_support)
+		return;
+
 	if (!m3_mem->vaddr)
 		return;
 
@@ -2799,15 +2804,16 @@ static int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 	struct qmi_txn txn;
 	int ret = 0;
 
-	ret = ath12k_qmi_m3_load(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to load m3 firmware: %d", ret);
-		return ret;
+	if (ab->hw_params->m3_fw_support) {
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


