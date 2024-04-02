Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DD4CD1294
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 22:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuHKgaN0UdFzti4ivh25s5UvnrZVlq0j6E+8ytyec6A=; b=4O865U/MOZ3kYjrDEFac5Sumc6
	9TFIEESkLt1BHPu0+Ri8oX6I4X9WG1HKNWVU2pwBngbbqTY4HO81fE7xMZ8ClEEip/xogerwbi9HC
	NNncXriP6NDyqudjUykvBre//fw49OlxmzHgaViHr62g6M9fHNbm55ugGcgRxsSvsrTj5VU093Pub
	BKMkmtcdN+qwrZ6t6g7PyHF5QEO+fZB7blkxxac820cI0Xu1qu2fSXdenwIyActRpqgWdRlnblPST
	WIziWM8FqvePNXtOMzmAh45Mppz0HJDddvw1r3jJ9jKn5k1+CCvo8onO+61XhUKO9cA3+/1AEnn+W
	79iZLTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrmT0-0000000D0H5-28L3
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 22:18:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlKJ-0000000Cohz-475y
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 21:05:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432HDuSg018895;
	Tue, 2 Apr 2024 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=iuHKgaN0UdFzti4ivh25s5UvnrZVlq0j6E+8ytyec6A=; b=jb
	vmWhZ9zZYHmkKBdT2nALKkAQgU4qUbDlQwfke5n+Cr9rp9mRaCscqdkg7AsBaey9
	1vAqCjV5UFFOPKOHrCQleXdn7wWOahBlX7msYsVpdD7Z0mGWPW+QW5OLQvkPWP0E
	VEzIq8e3UAIYD0YhRcQMReEjQD6fFiUdzGY/JPR+xJa9ppU2NR3UB22ACGO7gpKx
	rdLIKA57tGpqLCbjI/bSgBAGI2ldEnba/oDAvr6sbXUHaM5BkRKijjNd6ggEOAeF
	6sAm1dz83KeFlGGMbHW9gCgpwKX4fT+Zh9KnIMu4XtMiTKI0ZUuErPfHQeRNsWc1
	lxIcDnQn5mCmQoGDQ5ig==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ha3hfd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 21:05:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432L5o0U031821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 21:05:50 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 14:05:50 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH 6/9] wifi: ath12k: refactor arvif security parameter configuration
Date: Tue, 2 Apr 2024 14:05:35 -0700
Message-ID: <20240402210538.7308-7-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240402210538.7308-1-quic_alokad@quicinc.com>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UpNw-9e0Uxfb4GYsR9_q2pjvUnNSixK1
X-Proofpoint-GUID: UpNw-9e0Uxfb4GYsR9_q2pjvUnNSixK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_140552_084978_2BD12B2A 
X-CRM114-Status: GOOD (  13.12  )
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
---
 drivers/net/wireless/ath/ath12k/mac.c | 33 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01422fcfa760..996ce2c4698a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1242,6 +1242,26 @@ static int ath12k_mac_remove_vendor_ie(struct sk_buff *skb, unsigned int oui,
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
@@ -1250,8 +1270,6 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_vif *arvif)
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
-	struct ieee80211_mgmt *mgmt;
-	u8 *ies;
 	int ret;
 
 	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
@@ -1263,16 +1281,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_vif *arvif)
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


