Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A33C0219D
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 05:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Un0emmw0Ma2rJtDPaGF4154/m+N7aHTAupLr6CNuqek=; b=XKLxxsNGtbKEQ2YwL0ELApmwyy
	u1qCbbF/+wR34lxpcUSg0swKOZG8D2DkYavdpiSE8brXafWyn2mAcrQ97g4GaC0eJDmYbTQv5Oays
	qhDymRAhTuPEiy4RiDb00Yg6tlPYkHV0EC3cgrQw7TknsHi60/WYkZ6wp2WdUh+n8HETRk94oMNsg
	N4QFI4x17MVdHWcJc3rpaib3Kfq0JMU5OFd2IC4x6HN0Z5wx1NlU3U14Jfkq5ibHSe4jTKmMYkvl6
	z/Xbm+AhxIXDGb7ne/h6dZmPzuu8GKJmrmSPrKfrNY4QLtzH3t21rCALpkSdH7LAoR7LB8pzWH1oU
	RbvjW08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGWy-00000008L4t-24mZ
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 05:03:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGWw-00000008L3Q-2Dzg
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 05:03:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51730Ej5016280;
	Fri, 7 Feb 2025 05:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Un0emmw0Ma2rJtDPaGF4154/m+N7aHTAupLr6CNuqek=; b=HsYp4qJC7Hyadd0c
	ExAL+xVX8SY4e9Hikxd5NRTHq+I0rRqx9BXJmhAgq95MpPdHSOCBOJSAJSSMarDM
	QTxEL3zHCUwaRH/lNoP2sxYha6HxY6TCGFaFODuyDeWKmZR/NKR8H2rgQsBz6XRh
	SuDUvoC62B1av/WAz08fXjFrT0n27FmiVKDPoSvaGzxszr5C0QXVpbG2MzBWhooU
	QvD2vkPajFRFDZXGqgRdQeuSpgMiPRK1YYp3c/BLHGavxJL9rYIGJ8W0KAHrCJOk
	lDY+y+NLBRH4BD8U5Zwl01BB/hs99sAXKw6Oe9Dh6BjW1PKjFdnDJ9xp9yw+tYsA
	tdbJig==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n9vq08b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 05:03:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51753qhm013236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 05:03:52 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 21:03:51 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH 3/3] wifi: ath12k: Enable MLO for single split-phy PCI device
Date: Fri, 7 Feb 2025 10:33:27 +0530
Message-ID: <20250207050327.360987-4-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
References: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X4N5rjEdEE_D_LXoSwsEdQwJ_sljXL1x
X-Proofpoint-ORIG-GUID: X4N5rjEdEE_D_LXoSwsEdQwJ_sljXL1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_02,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_210354_686911_8E399982 
X-CRM114-Status: GOOD (  17.06  )
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

The single split-phy PCI device can perform multi-link operation (MLO)
within its own radio, and the MLO-supporting firmware also supports MLO
for split-phy PCI devices.

Therefore, enable MLO for the single split-phy PCI device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 13 ++++---------
 drivers/net/wireless/ath/ath12k/core.h |  3 ---
 drivers/net/wireless/ath/ath12k/qmi.c  |  3 +--
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index e46444c64096..0e4f1fb574b7 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1845,14 +1845,11 @@ void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
 	/* If more than one devices are grouped, then inter MLO
 	 * functionality can work still independent of whether internally
 	 * each device supports single_chip_mlo or not.
-	 * Only when there is one device, then it depends whether the
-	 * device can support intra chip MLO or not
+	 * Only when there is one device, then disable for WCN chipsets
+	 * till the required driver implementation is in place.
 	 */
-	if (ag->num_devices > 1) {
-		ag->mlo_capable = true;
-	} else {
+	if (ag->num_devices == 1) {
 		ab = ag->ab[0];
-		ag->mlo_capable = ab->single_chip_mlo_supp;
 
 		/* WCN chipsets does not advertise in firmware features
 		 * hence skip checking
@@ -1861,8 +1858,7 @@ void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
 			return;
 	}
 
-	if (!ag->mlo_capable)
-		return;
+	ag->mlo_capable = true;
 
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
@@ -1978,7 +1974,6 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	ab->dev = dev;
 	ab->hif.bus = bus;
 	ab->qmi.num_radios = U8_MAX;
-	ab->single_chip_mlo_supp = false;
 
 	/* Device index used to identify the devices in a group.
 	 *
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a247ba525038..2beb4f5f1005 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1050,9 +1050,6 @@ struct ath12k_base {
 
 	const struct hal_rx_ops *hal_rx_ops;
 
-	/* Denotes the whether MLO is possible within the chip */
-	bool single_chip_mlo_supp;
-
 	struct completion restart_completed;
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fcbe234758e1..348dbc81bad8 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2056,8 +2056,7 @@ static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	}
 
 	if (!ab->qmi.num_radios || ab->qmi.num_radios == U8_MAX) {
-		ab->single_chip_mlo_supp = false;
-
+		ag->mlo_capable = false;
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
 			   "skip QMI MLO cap due to invalid num_radio %d\n",
 			   ab->qmi.num_radios);
-- 
2.34.1


