Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ACFC6FD1F
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 05:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSDN7PSFnVioU36mdlBgJJqbLhC+bo85EPGDeDejIYg=; b=1XppWYb5S+HReEYhclUroKo3GI
	7i0+eHRchRW/noEKg5+dA1WxRZL6knffFq6pLgc+3sPrK9HNOF4M8WtCt0wmnwWtQivVLfj46AmSL
	0yJ0sBT8nVmmP3q6HUh4ALsou9pbFMcvlEh7oGDXdCj+OLuspbPYqdhHc2e41C0otJdafCyW0mIg7
	1sMI3sG/j556SwyMQiZya82Lgq6VlY77AKD0o19SjxlEdg3hCkxstBMlW9NY1x7jM7TskWZ3+8mUT
	ZY+rkHMK2XA6YvsIukH5sCJkmlwWI1aHlnhcPr/brX3sczE5UtY8dvpwxCYfo352BPgCRDX9KrKkb
	LgZBt0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrt1T-0000000E4CE-2bQ1
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 05:18:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrrrT-0000000DtKS-1Evb
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 04:04:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433431uo006277;
	Wed, 3 Apr 2024 04:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=KSDN7PSFnVioU36mdlBgJJqbLhC+bo85EPGDeDejIYg=; b=Rd
	Q+yQUKU4xRWiltIsBgOqXnAoT2L89z8YBucLbTz8griKvwQIFnaj60VUmmXB2J88
	avqx65nbli+TMmkJNRhgdUVFGEa563n3BDTKtFjLE74P/nLeNXT1kvJvmRCYuew1
	RSm9JOhcrBQU0T+gPYzylunY/nSZO4d9+/KNHXKI4pbl0L2aa+mRvDrpU2yqL17Y
	xL6JN01HpMr6rZyX7tveR+6zxpe38pEDEHDmxzsPoggohM9ivCPzx53Ghh/+//5X
	h0D3ojHtOEWFBNl2XJZectBRRfvlUdf9wRj41U75bq3/3syLpprfatRleMrRuPbF
	6x+4xQLHpM2t/HBau+jA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ex7tn3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 04:04:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43344TsK014147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 04:04:29 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 21:04:27 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 1/2] wifi: ath12k: extend the link capable flag
Date: Wed, 3 Apr 2024 09:34:11 +0530
Message-ID: <20240403040412.1488095-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403040412.1488095-1-quic_periyasa@quicinc.com>
References: <20240403040412.1488095-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hjqN0sYbx2ngXGxOes6mhkqBjILgqHUj
X-Proofpoint-ORIG-GUID: hjqN0sYbx2ngXGxOes6mhkqBjILgqHUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_03,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=928 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_210431_601008_7F291D2A 
X-CRM114-Status: GOOD (  18.60  )
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

Link capability categorized as Single Link Operation (SLO) and Multi Link
Operation (MLO).

 - Intra-device SLO/MLO refers to links present within a device
 - Inter-device SLO/MLO refers to links present across multiple devices

Currently, driver uses a boolean variable to represent intra-device SLO/MLO
capability. To accommodate inter-device SLO/MLO capabilities within the
same variable, modify the existing variable name and type. Define a new
enumeration for the link capabilities to accommodate both intra-device
and inter-device scenarios. Populate the enum based on the supported
capabilities.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  2 +-
 drivers/net/wireless/ath/ath12k/core.h | 23 ++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/mhi.c  |  2 +-
 drivers/net/wireless/ath/ath12k/qmi.c  |  2 +-
 4 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 391b6fb2bd42..942a4274fda1 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1227,7 +1227,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	ab->dev = dev;
 	ab->hif.bus = bus;
 	ab->qmi.num_radios = U8_MAX;
-	ab->slo_capable = true;
+	ab->mlo_capable_flags = ATH12k_INTRA_DEVICE_MLO_SUPPORT;
 
 	return ab;
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 97e5a0ccd233..e4eabd0f6e0e 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -688,6 +688,21 @@ struct ath12k_soc_dp_stats {
 	struct ath12k_soc_dp_tx_err_stats tx_err;
 };
 
+/**
+ * enum ath12k_link_capable_flags - link capable flags
+ *
+ * Single/Multi link capability information
+ *
+ * @ATH12k_INTRA_DEVICE_MLO_SUPPORT: SLO/MLO form between the radio, where all
+ *	the links (radios) present within a device.
+ * @ATH12k_INTER_DEVICE_MLO_SUPPORT: SLO/MLO form between the radio, where all
+ *	the links (radios) present across the devices.
+ */
+enum ath12k_link_capable_flags {
+	ATH12k_INTRA_DEVICE_MLO_SUPPORT	= BIT(0),
+	ATH12k_INTER_DEVICE_MLO_SUPPORT	= BIT(1),
+};
+
 /* Master structure to hold the hw data which may be used in core module */
 struct ath12k_base {
 	enum ath12k_hw_rev hw_rev;
@@ -843,10 +858,12 @@ struct ath12k_base {
 
 	const struct hal_rx_ops *hal_rx_ops;
 
-	/* slo_capable denotes if the single/multi link operation
-	 * is supported within the same chip (SoC).
+	/* mlo_capable_flags denotes the single/multi link operation
+	 * capabilities of the Device.
+	 *
+	 * See enum ath12k_link_capable_flags
 	 */
-	bool slo_capable;
+	u8 mlo_capable_flags;
 
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index adb8c3ec1950..fd519c87ae24 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -385,7 +385,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 				   "failed to read board id\n");
 		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
 			dualmac = true;
-			ab->slo_capable = false;
+			ab->mlo_capable_flags = 0;
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "dualmac fw selected for board id: %x\n", board_id);
 		}
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 92845ffff44a..3f0d2b99127a 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2124,7 +2124,7 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 	struct qmi_txn txn;
 	int ret;
 
-	if (!ab->slo_capable)
+	if (!ab->mlo_capable_flags)
 		goto out;
 
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
-- 
2.34.1


