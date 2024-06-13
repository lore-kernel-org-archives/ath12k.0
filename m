Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5719C27C4F
	for <ath12k@archiver.kernel.org>; Thu, 13 Jun 2024 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A8aeYZsa7JGE0rH7Tel4DmK1ah4URP3cl1JkVWPqQmA=; b=KMYsAMnuxrF4TZiDQTSL8Umsrb
	wiLDwEukyfR8yH4qYZsIptffEMMP2vi8rVcn+Uu8/Bddaw3dakWuDXTw1sXd9LfyLvYUXDcmHUb6f
	WD8Y7NTtB9HTz2SV34pMkB3u8pHO5I3YhWCm0N8cQa5HmAu4+EP50QUggPFGLd1Vc6K6o/7jAen+r
	kwedvxKaAtsAdT6GJrxRlJBP5GkKv6n0KC58df9LtvrdcV+iduE1IPpQXj/B75pODsPOeVOyzHZIi
	5vNCkYxH7VB440HJOieRURZVq9DElezPlr+rhbFdch9wnmnhAjoLpg/wXqI4+vtn1fwCBpDYxRiJV
	hYXmZT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHmX6-0000000HC9m-19VY
	for ath12k@archiver.kernel.org;
	Thu, 13 Jun 2024 15:38:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHmX3-0000000HC8J-12HU
	for ath12k@lists.infradead.org;
	Thu, 13 Jun 2024 15:38:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D9TmtO027312;
	Thu, 13 Jun 2024 15:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A8aeYZsa7JGE0rH7Tel4Dm
	K1ah4URP3cl1JkVWPqQmA=; b=Y+zLosD4Os3Qi/CqrUcZKDRZcIvpxf8SzObq/t
	mVeJ9rYxUll6UdR5cyselrCDKc77Dfer/T/BXSbl/yl7ikaJ9Sds97jlj2dSuWFU
	9+V2KaQzjMepEv/O8owUCBqn4KIJ+KphaMyiiBpqqCTSQqlkHKu3wmzslzycFhte
	ugVK/Jhr3gH4z4Js0KusnaBktH1+0bwRqpyWkW+JBq36uuo9XHpvKgN6ln8DVS9t
	RgTzkCEVrnofBCNnbXXztaATCNT4A/p5sSaplzvPqmABb3d2AkQsDuqFxAUvnGZE
	vmCPqkC4xGjt1q+vCSZIfA9ztdCbhfXO3XvJFnG4J4swQoOQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yps5xdspp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 15:38:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DFcT59022433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 15:38:29 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Jun 2024 08:38:27 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix mbssid max interface advertisement
Date: Thu, 13 Jun 2024 21:08:13 +0530
Message-ID: <20240613153813.3509837-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Jj6GY_YqdAIPlFrUyXb0E7W9Oof7XOOn
X-Proofpoint-ORIG-GUID: Jj6GY_YqdAIPlFrUyXb0E7W9Oof7XOOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_09,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=748
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406130113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_083833_498616_57F2F878 
X-CRM114-Status: GOOD (  12.12  )
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

The Current method for advertising the maximum MBSSID interface count
assumes single radio per wiphy (multi wiphy model). However, this
assumption is incorrect for multi radio per wiphy (single wiphy model).
Therefore, populate the parameter for each radio present in the MAC
abstraction layer (ah). This approach ensure scalability for both single
wiphy and multi wiphy models.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: 519a545cfee7 ("wifi: ath12k: advertise driver capabilities for MBSSID and EMA")
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2259ce22cc8b..cab9021b9071 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8959,6 +8959,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	u32 ht_cap = U32_MAX, antennas_rx = 0, antennas_tx = 0;
 	bool is_6ghz = false, is_raw_mode = false, is_monitor_disable = false;
 	u8 *mac_addr = NULL;
+	u8 mbssid_max_interfaces = 0;
 
 	wiphy->max_ap_assoc_sta = 0;
 
@@ -9002,6 +9003,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 			mac_addr = ar->mac_addr;
 		else
 			mac_addr = ab->mac_addr;
+
+		mbssid_max_interfaces += TARGET_NUM_VDEVS;
 	}
 
 	wiphy->available_antennas_rx = antennas_rx;
@@ -9094,7 +9097,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->iftype_ext_capab = ath12k_iftypes_ext_capa;
 	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ath12k_iftypes_ext_capa);
 
-	wiphy->mbssid_max_interfaces = TARGET_NUM_VDEVS;
+	wiphy->mbssid_max_interfaces = mbssid_max_interfaces;
 	wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
 
 	if (is_6ghz) {

base-commit: e72048809ec7355a947415ae6836d2eb7fdcda39
-- 
2.34.1


