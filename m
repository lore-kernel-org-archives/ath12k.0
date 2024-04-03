Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74507C6FD1F
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 04:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSDN7PSFnVioU36mdlBgJJqbLhC+bo85EPGDeDejIYg=; b=J41ACgZ8ejKXusMP0B3vIYPrb/
	dgx+ofioSdUhK4ZQdqgdeyJETsWZN2sxAUm6l8EH/69F6HP2IumwcUmIvGfEV0SN1/gBQTDaYCS6a
	aqQB/O70D7OrpwKi9EZF8xkANK3wyrF8nKhzg58TAopjsnZgJ+xvP4p75SNCjyQpZl7vhUqYPOcTL
	E32mVi+ghrjg3gT7VTGHAsG6CKQX1HhG7njWy+STmhMK4V67N+maaYHlUqG98Xsxv96RZ1BrGumcM
	Ji6Nz78rKGxYIjKHyWfQf1te3C8ljWjpUilje3HaqFeG2ctabMXzVtqCIfsCJly7I7cXXvR2Snvf0
	ecFVSzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrs7h-0000000DvaV-0ItM
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 04:21:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrs7e-0000000DvZ6-2s9B
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 04:21:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433430it006255;
	Wed, 3 Apr 2024 04:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=KSDN7PSFnVioU36mdlBgJJqbLhC+bo85EPGDeDejIYg=; b=PU
	knhXhHs2QKv4QhMWxui05HOzZ5ZMte/vM09J5TUYTcRLKNSHWtfHfsMU5HV562rI
	pepB+cv6+T6dsHJ1AnamvjkdDCdziUvhsORf3aoytv+SVV1WPIVL4ifJjiSgtpnl
	Mv4cBxnbmOhAauaC9vZH93k9yngnsHMYzqIQavq9zEjoQPEYtUmzYeLOtbHp3ffX
	VbKWgBa4yg3+gPW/ld0ahxZGGO3GsHP9p0PBrjo4iakvlzP8ft4eBY4vuhG+oqu8
	CWKUKhyMQgfnuvHIm0Gv8RNhWavSJCylhHeZZniqJqevEKmMdPROEAI2ZjSpl4XK
	sgRQzpjC/ekcTCjgZAlQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ex7tnx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 04:21:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4334LCUw001746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 04:21:12 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 21:21:10 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 1/2] [RESEND] wifi: ath12k: extend the link capable flag
Date: Wed, 3 Apr 2024 09:50:55 +0530
Message-ID: <20240403042056.1504209-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403042056.1504209-1-quic_periyasa@quicinc.com>
References: <20240403042056.1504209-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nO3xLi8mh5l06SxxIEIyntHAxdOprK7J
X-Proofpoint-ORIG-GUID: nO3xLi8mh5l06SxxIEIyntHAxdOprK7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_03,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=928 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_212114_852617_67BCBE64 
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


