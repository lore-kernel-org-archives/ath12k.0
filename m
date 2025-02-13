Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4258EC021A8
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 01:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgBbskVfuomIT5LJl7PX7j2Ltbe7ANEp3wO5usvTkEQ=; b=w0I7+8TaDVS5VdDnGZ66TyJOju
	ikhLWy7aGHG3z5huqppnFdk6wzSfKFtzlX8ynKkte/Eyeek334KUHMZm1wFVXni+7G0jEIpe/LTeY
	lcXWuKFG671t5EZ7xJvQ9H6FtLIr6dl9hKqd/ayfE6/IzzSnWoE1aubU14FJ2sK2/FpdjzrP/TtfN
	5GEl5L+kNBVjrbrwEq9ClNqlrAPleA+Ds17ImfDHmqWWW3zZAQhnN7YW7fsAr/oWzGmPfnM8yJQ3N
	eQNxjyKbiAIM94+ZoqKMGKTLHmJuWZIVfkKFhVf8o188+Nzwrn84u2rbsHhmwr5OHfjD7+KoDhnAg
	Bjigf0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNyQ-00000009Ngk-06ad
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 01:25:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNyK-00000009Naw-38gU
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 01:24:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CJc30v011688;
	Thu, 13 Feb 2025 01:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgBbskVfuomIT5LJl7PX7j2Ltbe7ANEp3wO5usvTkEQ=; b=c8L3BEVd65rUncO0
	HpqECnMMv4iSJOr7n7ANvoC1D5kYIeDOkmOSwS/VBgr+o7S9E5mCnsGnyRVtp3Mg
	RcjgsaewZgKYVUx1vP2UeK+Ix7XQl+5JMxcDlr56jueGibwVCzGkQe66MeH9P/JC
	2DJqa3OhpVq9GIr3O6lL9BGN9AGa6KgbBTLyyWifKsRmxX+rPwQDFdRCeiMczn9A
	+9a5nY1o26k1hSlFT69dNb3+cGHIJWnhntcdqFpURiBuoehICkB0NGrw8E3w4tR5
	qFp8y8/iK3UJjjzRkd6Slzbe/UU2xVSZ10iRrLvz1H/zWZvFFRdHGDPYZ3hwhKeh
	rDq9GA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s1yngmse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 01:24:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D1OsR9013044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 01:24:54 GMT
Received: from ath12k-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 17:24:54 -0800
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH V10 9/9] wifi: ath12k: add extended NSS bandwidth support for 160 MHz
Date: Wed, 12 Feb 2025 17:24:39 -0800
Message-ID: <20250213012439.278373-10-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213012439.278373-1-quic_pradeepc@quicinc.com>
References: <20250213012439.278373-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZeocotTrilqM6WRxr7_Hp56hfdZtF--7
X-Proofpoint-GUID: ZeocotTrilqM6WRxr7_Hp56hfdZtF--7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_172456_963763_275F56F5 
X-CRM114-Status: GOOD (  15.88  )
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

Currently rx and tx MCS map for 160 MHz under HE capabilities
are not updating properly, when 160 MHz is configured with NSS
lesser than max NSS support. Fix this by utilizing
nss_ratio_enabled and nss_ratio_info fields sent by firmware
in service ready event.

However, if firmware advertises EXT NSS BW support in VHT caps
as 1(1x2) and when nss_ratio_info indicates 1:1, reset the EXT
NSS BW Support in VHT caps to 0 which indicates 1x1. This is
to avoid incorrectly choosing 1:2 NSS ratio when using the
default VHT caps advertised by firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 33 ++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 047042662197..c3afc6d9c8e9 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2729,8 +2729,10 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 	max_nss = min(max_nss, ar->num_tx_chains);
 
 	if (arg->peer_phymode == MODE_11AX_HE160) {
-		tx_nss = ath12k_get_nss_160mhz(ar, max_nss);
+		tx_nss = ath12k_get_nss_160mhz(ar, ar->num_tx_chains);
 		rx_nss = min(arg->peer_nss, tx_nss);
+
+		arg->peer_nss = min(link_sta->rx_nss, ar->num_rx_chains);
 		arg->peer_bw_rxnss_override = ATH12K_BW_NSS_MAP_ENABLE;
 
 		if (!rx_nss) {
@@ -6958,6 +6960,12 @@ ath12k_create_vht_cap(struct ath12k *ar, u32 rate_cap_tx_chainmask,
 	vht_cap.vht_mcs.rx_mcs_map = cpu_to_le16(rxmcs_map);
 	vht_cap.vht_mcs.tx_mcs_map = cpu_to_le16(txmcs_map);
 
+	/* Check if the HW supports 1:1 NSS ratio and reset
+	 * EXT NSS BW Support field to 0 to indicate 1:1 ratio
+	 */
+	if (ar->pdev->cap.nss_ratio_info == WMI_NSS_RATIO_1_NSS)
+		vht_cap.cap &= ~IEEE80211_VHT_CAP_EXT_NSS_BW_MASK;
+
 	return vht_cap;
 }
 
@@ -7140,11 +7148,12 @@ static void ath12k_mac_set_hemcsmap(struct ath12k *ar,
 				    struct ieee80211_sta_he_cap *he_cap)
 {
 	struct ieee80211_he_mcs_nss_supp *mcs_nss = &he_cap->he_mcs_nss_supp;
-	u16 txmcs_map, rxmcs_map;
+	u8 maxtxnss_160 = ath12k_get_nss_160mhz(ar, ar->num_tx_chains);
+	u8 maxrxnss_160 = ath12k_get_nss_160mhz(ar, ar->num_rx_chains);
+	u16 txmcs_map_160 = 0, rxmcs_map_160 = 0;
+	u16 txmcs_map = 0, rxmcs_map = 0;
 	u32 i;
 
-	rxmcs_map = 0;
-	txmcs_map = 0;
 	for (i = 0; i < 8; i++) {
 		if (i < ar->num_tx_chains &&
 		    (ar->cfg_tx_chainmask >> cap->tx_chain_mask_shift) & BIT(i))
@@ -7157,12 +7166,24 @@ static void ath12k_mac_set_hemcsmap(struct ath12k *ar,
 			rxmcs_map |= IEEE80211_HE_MCS_SUPPORT_0_11 << (i * 2);
 		else
 			rxmcs_map |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+
+		if (i < maxtxnss_160 &&
+		    (ar->cfg_tx_chainmask >> cap->tx_chain_mask_shift) & BIT(i))
+			txmcs_map_160 |= IEEE80211_HE_MCS_SUPPORT_0_11 << (i * 2);
+		else
+			txmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+
+		if (i < maxrxnss_160 &&
+		    (ar->cfg_tx_chainmask >> cap->tx_chain_mask_shift) & BIT(i))
+			rxmcs_map_160 |= IEEE80211_HE_MCS_SUPPORT_0_11 << (i * 2);
+		else
+			rxmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
 	}
 
 	mcs_nss->rx_mcs_80 = cpu_to_le16(rxmcs_map & 0xffff);
 	mcs_nss->tx_mcs_80 = cpu_to_le16(txmcs_map & 0xffff);
-	mcs_nss->rx_mcs_160 = cpu_to_le16(rxmcs_map & 0xffff);
-	mcs_nss->tx_mcs_160 = cpu_to_le16(txmcs_map & 0xffff);
+	mcs_nss->rx_mcs_160 = cpu_to_le16(rxmcs_map_160 & 0xffff);
+	mcs_nss->tx_mcs_160 = cpu_to_le16(txmcs_map_160 & 0xffff);
 }
 
 static void ath12k_mac_copy_he_cap(struct ath12k *ar,
-- 
2.34.1


