Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02C9C04FFE
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 20:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qw/gD/Ez6xbn+jHvRP7Wq/nhmWExVTCPzOqpd510MPs=; b=Tdw1jN8u7c3B97m+r6iJPqtJY5
	6URr+ycPgKNU1qld+cFxplnvOaS2qfW/bbRHy4rMTXPx1ehENOYldrjfIcyKNpzw1nWLyUmFjD6Zl
	igg67nt3/8sB6cDPSKw4W0Whf6OqbRVw434BQuVewObOhWHVX4VusSTwxoiDl12M+q7Qij+3eRa7b
	kZ94G0csVm2ptXPFbgffzE1vxmfoCzhPPJWU/CTNJAWgBwelXXd7V6+o4n73ZjHwlaYK+EHNnTMT5
	JxcveACvI+o73sPKqG7O3zzQZ1CQvO1F5RXnmItkhD85FyoLjK6fgAmmUCdd/mStC1I0dsY6vQpBW
	EcWlWUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nv4-0000000GtTh-2Wzt
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 20:29:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nuv-0000000GtN6-2ynV
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 20:29:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448CiPvu010621;
	Wed, 8 May 2024 20:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Qw/gD/Ez6xbn+jHvRP7Wq/nhmWExVTCPzOqpd510MPs=; b=M9
	bD/kP2BUtpB/ffTssr0VCGghcdgcTdyhldY3IVsgzb8iJhJd0S1U7Y/bkbwU4/E0
	008j//ooHcLroqxvuBPCuCua8f4xi1Vq/n6AjyHeYz2qaktrnNrrho9OzdvPGxge
	piiqD+f41A9tsxeeNWx3pY4jvg6AqK9lFyeYBV1qKmM3oKS0NzBA1XJGTtt+H/DC
	XI6s6eiPUibR/GvPkkNGPS1a/FZ40poabi5JVZ6/IH51XM1f9jtyNrSg28vEavIn
	BvgvsZzMbHQaRTy2mjQhwHTYnpFvndL8+j/P8QXh6W8pu9OI9BXmn9P9CiJ46vGi
	KSC3b9UKlH+aov4oxpmA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09nqh1ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 20:29:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448KTPP6007908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 20:29:25 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 May 2024 13:29:24 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
Subject: [PATCH v2 6/9] wifi: ath12k: refactor arvif security parameter configuration
Date: Wed, 8 May 2024 13:29:09 -0700
Message-ID: <20240508202912.11902-7-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240508202912.11902-1-quic_alokad@quicinc.com>
References: <20240508202912.11902-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v624LnmGjtbAPOe84h0lKGnBTQW5yNKu
X-Proofpoint-GUID: v624LnmGjtbAPOe84h0lKGnBTQW5yNKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_132933_979414_98C00C64 
X-CRM114-Status: GOOD (  12.61  )
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

Configure security parameters in a separate function to make it
easier to support setting the same for nontransmitted profiles.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 33 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 97bb50e04b00..9391bea86050 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1295,6 +1295,26 @@ static int ath12k_mac_remove_vendor_ie(struct sk_buff *skb, unsigned int oui,
 	return 0;
 }
 
+static void ath12k_mac_set_arvif_ies(struct ath12k_vif *arvif, struct sk_buff *bcn)
+{
+	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)bcn->data;
+	const u8 *start, *tail;
+	u16 rem_len;
+
+	start = bcn->data + ieee80211_get_hdrlen_from_skb(bcn) + sizeof(mgmt->u.beacon);
+	tail = skb_tail_pointer(bcn);
+	rem_len = tail - start;
+
+	arvif->rsnie_present = false;
+	arvif->wpaie_present = false;
+
+	if (cfg80211_find_ie(WLAN_EID_RSN, start, rem_len))
+		arvif->rsnie_present = true;
+	if (cfg80211_find_vendor_ie(WLAN_OUI_MICROSOFT, WLAN_OUI_TYPE_MICROSOFT_WPA,
+				    start, rem_len))
+		arvif->wpaie_present = true;
+}
+
 static int ath12k_mac_setup_bcn_tmpl(struct ath12k_vif *arvif)
 {
 	struct ath12k *ar = arvif->ar;
@@ -1303,8 +1323,6 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_vif *arvif)
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
-	struct ieee80211_mgmt *mgmt;
-	u8 *ies;
 	int ret;
 
 	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
@@ -1316,16 +1334,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_vif *arvif)
 		return -EPERM;
 	}
 
-	ies = bcn->data + ieee80211_get_hdrlen_from_skb(bcn);
-	ies += sizeof(mgmt->u.beacon);
-
-	if (cfg80211_find_ie(WLAN_EID_RSN, ies, (skb_tail_pointer(bcn) - ies)))
-		arvif->rsnie_present = true;
-
-	if (cfg80211_find_vendor_ie(WLAN_OUI_MICROSOFT,
-				    WLAN_OUI_TYPE_MICROSOFT_WPA,
-				    ies, (skb_tail_pointer(bcn) - ies)))
-		arvif->wpaie_present = true;
+	ath12k_mac_set_arvif_ies(arvif, bcn);
 
 	if (arvif->vif->type == NL80211_IFTYPE_AP && arvif->vif->p2p) {
 		ret = ath12k_mac_setup_bcn_p2p_ie(arvif, bcn);
-- 
2.39.0


