Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DB7C47079
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 06:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzE8b+TzVlArLN9l3Cx3bw7GgUhpbD/KvhtmQjAt0Bw=; b=Blh1o/JH7mR136voUO0b9VpXsC
	vCt9GkepidWOLjh3nYkh1HuWcGgnTrhHMSqEGZlesR4g/g3217qp+JbrCaYpzD3UDcRlbnxeqWtaU
	1Jw3c65vos4WNpp2XgACNjeZRHSF077DLA9YKIwgG2dsm4TaKF67z2kiVi/jx2J9H2XZRIsul+hnT
	9bVYwquO/lWpCs+5k9r/b8Ga3WcjCFVC20kHVGQa/RB54fYMHGj/GZJo00IT0ir04/beuuKlulJBf
	o4tT6LMaThp+Ix9FInQkc0enMwkhqNGRPOJLmGDqv70D+mseZREll0X76ZCBjLbMvUUEqb9Qyv2OT
	ggfF6CGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKutA-009uIb-1z
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 06:38:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKut8-009uHN-0c
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 06:38:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4035CE1J017806;
	Wed, 3 Jan 2024 06:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=LzE8b+TzVlArLN9l3Cx3bw7GgUhpbD/KvhtmQjAt0Bw=; b=lB
	DuM27/ZTDEIvcVnaJhUrLzGHlbGoxNu0/qrm2JPCBT3G+JMnDmp9GtVRvpXNF7qj
	n9eha2r5W95kJQI5dmftwHwIoBQQSZo0lho4UZaD9aGHRFMJn4eXkwkuDD5Urk78
	z9NznbxsC5ZsIFqxWHNvxnJvo5hJ3mhsprdaQoUQIKEyKC8KSavmlds4TMLunq0x
	8j0RtSy9HHSXDemyraj7Ph4qcIyH3CwQ+ng32qlu1ukG+emLM++emfmI97z0h0y6
	g6kUceuhGnfk3vs9Tgt3xTGxWhl4LZ0TyNvq1Yxpd1W+aX5mDgtqLra5IYYyd864
	9wwh+pKDHU8bgL4T0TfA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vcqak9e8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 06:38:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4036c0pq017734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 06:38:00 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 22:37:58 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 06/10] wifi: ath12k: Refactor mac callback of update vif offload
Date: Wed, 3 Jan 2024 12:07:27 +0530
Message-ID: <20240103063731.3356060-7-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
References: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hBnJbK3U7dxReFmS0DWPI6nVvTuGE37G
X-Proofpoint-ORIG-GUID: hBnJbK3U7dxReFmS0DWPI6nVvTuGE37G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxlogscore=675 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_223802_348584_BF20B4C6 
X-CRM114-Status: GOOD (  11.31  )
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

To support single wiphy abstraction, introduce link/radio specific helper
function in the mac80211 callback update_vif_offload(). This way, the
callback can be extended to handle multiple link/radio in the future.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0b72b32e25d4..5c7b747addda 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5434,12 +5434,11 @@ static int ath12k_set_he_mu_sounding_mode(struct ath12k *ar,
 	return ret;
 }
 
-static void ath12k_mac_op_update_vif_offload(struct ieee80211_hw *hw,
-					     struct ieee80211_vif *vif)
+static void ath12k_mac_update_vif_offload(struct ath12k_vif *arvif)
 {
-	struct ath12k *ar = hw->priv;
+	struct ieee80211_vif *vif = arvif->vif;
+	struct ath12k *ar = arvif->ar;
 	struct ath12k_base *ab = ar->ab;
-	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	u32 param_id, param_value;
 	int ret;
 
@@ -5481,6 +5480,14 @@ static void ath12k_mac_op_update_vif_offload(struct ieee80211_hw *hw,
 	}
 }
 
+static void ath12k_mac_op_update_vif_offload(struct ieee80211_hw *hw,
+					     struct ieee80211_vif *vif)
+{
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
+
+	ath12k_mac_update_vif_offload(arvif);
+}
+
 static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 				       struct ieee80211_vif *vif)
 {
@@ -5584,7 +5591,7 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 	list_add(&arvif->list, &ar->arvifs);
 	spin_unlock_bh(&ar->data_lock);
 
-	ath12k_mac_op_update_vif_offload(hw, vif);
+	ath12k_mac_update_vif_offload(arvif);
 
 	nss = hweight32(ar->cfg_tx_chainmask) ? : 1;
 	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-- 
2.34.1


