Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EDDC83000
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 04:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8YCmbusEIkQ7cMJdhzKT8FNODxsAypJ/W8vAjHz7xRU=; b=r0fw+KUZcOnnxb8jyLqK9gA/a4
	Lsj4Sa1hxGFG39aKdcaNECPK5FzqLqDHegphUbe7JxZNedy+lZa1m85u+54VRWWeau3kuAMGzEotb
	M1daZAmo9G82b+zjQTK6rxlopFFDiBlEsoKWC+gZ86IUcjymP22vzNYmRBXDn+bPHm+T4VlggGy06
	GAAxhLUprQ8HmR9pb6cnQ0TJxGrHwSySWlAfdHfMahmXu1EBl9/kGGkVh6IxBea6Eo3Fdi4Fjjqbi
	34nCLjgKN210laLCodIq7nXQxTw70NO/0JkWTEzfm1SFkGyidxcrBxvAyAwEHJmgWK5WUjAXsbdfb
	6da0UoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6Ou-00000001DfG-2go5;
	Mon, 30 Jun 2025 04:45:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6Os-00000001Det-0A5k
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 04:45:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJoPaS020133;
	Mon, 30 Jun 2025 04:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8YCmbusEIkQ7cMJdhzKT8F
	NODxsAypJ/W8vAjHz7xRU=; b=g0XZ0tQhaWLCKOwC7Xzd9/t4BqLhX9MhpqHNL3
	U4Y3BsWkNGKud5iDN0zIhd3B2t2xZaa4CLZaoXbO+jEvfXm+RXrZ6IRgW/NHeS+q
	Q3kRtSDAkeKlU6RRLoDgO2kPCbYcXivhK1Lx1HvsX9A/7t/bXK5QoS1t7fuehBE9
	PE5UO93fGcbFuUJJDn/jewjYnBa4FKdE3yMxj4BvB3NsXy3wi8ZLx7RmSZt6VeAb
	NgAD7q8tnHPRkoIUHBEcV5NC36DvhB2NRdit7zbTnBZjH8Qvhd2hOYtP7DeheycG
	SGfl6MaTA61jC/I/SUiXvOHrkZwyydfsKTt6+h6YEsv7wLfg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm3cd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 04:45:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U4jljb012943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 04:45:47 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 29 Jun 2025 21:45:45 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<aditya.kumar.singh@oss.qualcomm.com>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Add num_stations counter for each interface
Date: Mon, 30 Jun 2025 10:15:31 +0530
Message-ID: <20250630044531.3490058-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6862167c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=092lRn7l_lvejaHzxYUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: U4MBF-bbOh_0LjJAGnIkoBcpBRG4pxNc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDAzNyBTYWx0ZWRfX67/ODuiAAES5
 Z9jScbQp8DIcoQB+UE01QakDucAdICrbQwMfR5zBm6HVVCSJumYMRBSgqm/35Ln9tKUfQuDlomi
 1AvNV9/T5eV2RUkF06PQoip2r2JPCg/cKEf0lbWJJ1+K9NVVJkf2Hsu96PMdwX2N4URv7rEOqhc
 4rv80fyMHrxpAumD3R2BVQHShKhycfi6HWKmuAmnN8p3ueFPMwLXsFPYv0KRnO3moBI8gu92du8
 QHm/rEhESIugQ7Rw59NYZr5fnDzt40I2C8EI3YBPyq/FMNOCLwX8tWA5sDO9Pe+b7y3mFxPZfSt
 YCCy0z5VxeoOfCit07rPL1EvGJzk9r3+v4De+MUsTCCTNczfYDj1/xTZTJ30mMMRpQ/wBIQu4L5
 UXaaEAWtRMpPj7mkPa5M/jw2HczaX2iTk6P39VBEHbPpefnSoE0VUQNOXhS6oenRbGp2YjGy
X-Proofpoint-GUID: U4MBF-bbOh_0LjJAGnIkoBcpBRG4pxNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_214550_201856_4E3F1C28 
X-CRM114-Status: GOOD (  15.32  )
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

From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Currently, ath12k driver maintains a counter to store the number of
stations connected to each radio. However, at certain times like
debugging, it is useful to know number of stations connected to any
one of the interface in that radio.

Add support to maintain a counter for number of stations connected to
each interface.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3c10d7eb9669..20fe10eea507 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -349,6 +349,7 @@ struct ath12k_link_vif {
 	bool group_key_valid;
 	struct wmi_vdev_install_key_arg group_key;
 	bool pairwise_key_done;
+	u16 num_stations;
 };
 
 struct ath12k_vif {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 71e07c546a2d..0f3ccefbee00 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3455,6 +3455,8 @@ static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
 	INIT_DELAYED_WORK(&arvif->connection_loss_work,
 			  ath12k_mac_vif_sta_connection_loss_work);
 
+	arvif->num_stations = 0;
+
 	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
 		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
 		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
@@ -5660,6 +5662,11 @@ static int ath12k_mac_inc_num_stations(struct ath12k_link_vif *arvif,
 		return -ENOBUFS;
 
 	ar->num_stations++;
+	arvif->num_stations++;
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+		   "mac station %pM connected to vdev %u num_stations %u\n",
+		   arsta->addr, arvif->vdev_id, arvif->num_stations);
 
 	return 0;
 }
@@ -5676,6 +5683,17 @@ static void ath12k_mac_dec_num_stations(struct ath12k_link_vif *arvif,
 		return;
 
 	ar->num_stations--;
+
+	if (arvif->num_stations) {
+		arvif->num_stations--;
+		ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+			   "mac station %pM disconnected from vdev %u num_stations %u\n",
+			   arsta->addr, arvif->vdev_id, arvif->num_stations);
+	} else {
+		ath12k_warn(ar->ab,
+			    "mac station %pM disconnect for vdev %u without any connected station\n",
+			    arsta->addr, arvif->vdev_id);
+	}
 }
 
 static void ath12k_mac_station_post_remove(struct ath12k *ar,

base-commit: 391a83d0c8ebb1e476cba73bf4c010af73993111
-- 
2.25.1


