Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37961C369C2
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 02:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PU2BqaT05FL21n9tISzRGgmjjsEijWVDsCfhdwSwt1Y=; b=L0vgelA+ErH8OnRX+dn0jPcqb0
	DHkfVezt00KlgIUfWawCd7dxUCHd7N5Jk+s6QRruqbO4GzCfdgNemO+51Zcc175qSUuOFuuNjQFPE
	fYAULQL3YoUPFxT1WoTNZD4h3KBg27uoDNRQnTgi2Hb03nXU7gyn/riulsd715B698OD6zH6iw2Aw
	4SCqPwuWAjdqIcTftdcTL1ZbCOgE4f0MDOTY2i1y8wBGJcLCahWx7xdFUK6rUSnp/7dgmC+jJTuap
	CVN2gowH25Jrh46S5OHidt0QUwzB0RGSSRGgkZNNjFoy03HRMgdb/+61E28GV4dkhjW15ahd3AFLa
	36gRrxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5btl-0000000EufV-45il;
	Fri, 18 Apr 2025 02:56:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5btk-0000000Eudr-0vi4
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 02:56:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2HTKo032076;
	Fri, 18 Apr 2025 02:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PU2BqaT05FL21n9tISzRGgmjjsEijWVDsCfhdwSwt1Y=; b=hb27IZ3q0sAsSZWj
	Iq+49gAyQRBu9aSQx6oQ/az7yBj3QlLs2AFyoBtlulLMtVATaWmc9qvz7SAMj0MA
	38paepChJLZxuV7yb7he9qieFOHasDlAJ1UtbYW+QbjsdM8wVxhLAPJAkRuS+BLu
	5D4lbJDU00ZfOQQ9DLuW5ktRGpxTgRlBgYTq1cDU7qMnp7W1ZGFJDWA8xtDk4zLD
	lwoSkXUgd6PUtp//slWC+6lru4OHO0/kouXIk45SRlSj3gfBAczuGNQHl12xmQ3J
	xpnpLLJX0AM+Tg+obz4NiD8p8wEY+ny/1MwdmWykVbRoHwp9MIjn34oDIb54zmUT
	a4gmxw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wrucp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I2u8go023152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:08 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 19:56:06 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Fri, 18 Apr 2025 10:55:40 +0800
Subject: [PATCH ath-next 07/15] wifi: ath12k: determine interface mode in
 _op_add_interface()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-ath12k-6g-lp-vlp-v1-7-c869c86cad60@quicinc.com>
References: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
In-Reply-To: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=6801bf49 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=fIsPwQ-XCDuHsJVo-4IA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FAYtYhOzNl8GE1wwlXyVGn19BUEDZ_sn
X-Proofpoint-GUID: FAYtYhOzNl8GE1wwlXyVGn19BUEDZ_sn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_195612_391915_1664CF3C 
X-CRM114-Status: GOOD (  11.41  )
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

Currently interface mode is determined each time a vdev is created.
In MLO scenario where there could be multiple vdevs this is just a
waste of time.

Move related logic into a new helper ath12k_mac_determine_vdev_type()
and call it once in ath12k_mac_op_add_interface().

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 73 ++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d170bca729482270d2c760c9cc8b6a3a219d882d..165a9bb4378dabdf49e1b3c4c92917eca6386f15 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8305,6 +8305,43 @@ void ath12k_mac_11d_scan_stop_all(struct ath12k_base *ab)
 	}
 }
 
+static void ath12k_mac_determine_vdev_type(struct ieee80211_vif *vif,
+					   struct ath12k_vif *ahvif)
+{
+	ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_NONE;
+
+	switch (vif->type) {
+	case NL80211_IFTYPE_UNSPECIFIED:
+	case NL80211_IFTYPE_STATION:
+		ahvif->vdev_type = WMI_VDEV_TYPE_STA;
+
+		if (vif->p2p)
+			ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_CLIENT;
+
+		break;
+	case NL80211_IFTYPE_MESH_POINT:
+		ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_MESH_11S;
+		fallthrough;
+	case NL80211_IFTYPE_AP:
+		ahvif->vdev_type = WMI_VDEV_TYPE_AP;
+
+		if (vif->p2p)
+			ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_GO;
+
+		break;
+	case NL80211_IFTYPE_MONITOR:
+		ahvif->vdev_type = WMI_VDEV_TYPE_MONITOR;
+		break;
+	case NL80211_IFTYPE_P2P_DEVICE:
+		ahvif->vdev_type = WMI_VDEV_TYPE_STA;
+		ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_DEVICE;
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
+}
+
 int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 {
 	struct ath12k_hw *ah = ar->ah;
@@ -8349,39 +8386,8 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	arvif->ar = ar;
 	vdev_id = __ffs64(ab->free_vdev_map);
 	arvif->vdev_id = vdev_id;
-	ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_NONE;
-
-	switch (vif->type) {
-	case NL80211_IFTYPE_UNSPECIFIED:
-	case NL80211_IFTYPE_STATION:
-		ahvif->vdev_type = WMI_VDEV_TYPE_STA;
-
-		if (vif->p2p)
-			ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_CLIENT;
-
-		break;
-	case NL80211_IFTYPE_MESH_POINT:
-		ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_MESH_11S;
-		fallthrough;
-	case NL80211_IFTYPE_AP:
-		ahvif->vdev_type = WMI_VDEV_TYPE_AP;
-
-		if (vif->p2p)
-			ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_GO;
-
-		break;
-	case NL80211_IFTYPE_MONITOR:
-		ahvif->vdev_type = WMI_VDEV_TYPE_MONITOR;
+	if (vif->type == NL80211_IFTYPE_MONITOR)
 		ar->monitor_vdev_id = vdev_id;
-		break;
-	case NL80211_IFTYPE_P2P_DEVICE:
-		ahvif->vdev_type = WMI_VDEV_TYPE_STA;
-		ahvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_DEVICE;
-		break;
-	default:
-		WARN_ON(1);
-		break;
-	}
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev create id %d type %d subtype %d map %llx\n",
 		   arvif->vdev_id, ahvif->vdev_type, ahvif->vdev_subtype,
@@ -8756,6 +8762,9 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 		vif->hw_queue[i] = ATH12K_HW_DEFAULT_QUEUE;
 
 	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
+
+	ath12k_mac_determine_vdev_type(vif, ahvif);
+
 	/* Defer vdev creation until assign_chanctx or hw_scan is initiated as driver
 	 * will not know if this interface is an ML vif at this point.
 	 */

-- 
2.34.1


