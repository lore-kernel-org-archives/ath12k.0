Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76030C7EE2D
	for <ath12k@archiver.kernel.org>; Fri,  2 Jun 2023 23:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UViC1SUumVKwd7ZKMhS62YW3I8DqBtdV5iW6TV0tUCU=; b=Iv0ONeCxFHxCX7
	8eGRxbezd03p5UNZ3DHGHOf5uSF0pmz6uN/hfhHF/2ya4I94a2SwQtAPdBSNLRd00lDJSrcDanlwA
	wsHbieVDm2a8lleDMw67saL1j+3tzS8fCE3MCJstoTFtjdDGAB/GT96e77uR6s8cPoQ4bp/UjtM2K
	gRn5YpjgdJzYZhkg3ZIzX3qnGUZgi3Dm4b85ALbOk/nB8NbxMetDhw9ypN6rzPwy7FNQeeIWDbccp
	fbKDWzKIs9LRijeKMUokkvH0lxrZitpKtbey7A4rUONm+X7k7lC6cy7MJtlI2g2qQF5KgKUDk7C3x
	zcmu1+PmqECoub5p3zNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EfK-008DT6-36
	for ath12k@archiver.kernel.org;
	Fri, 02 Jun 2023 23:58:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EfG-008DPD-27
	for ath12k@lists.infradead.org;
	Fri, 02 Jun 2023 23:58:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352NMIlf000927;
	Fri, 2 Jun 2023 23:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=7KUGHXyvDVotXJUEFdoGD4SxlzKZ6SuiL02/HDr6v9c=;
 b=Iyo0dYZMnZMx1WIwSrqKDTHCblRk6Vtkl4cfxSY59FT3trCh0R4Q12+yol+8NhMG8agQ
 7DjPYrV2hvjiuL3TAlzLkEd206cFbVz3X88HLSSo/VMLRuLueXTFerIv5j0kdQPGBzim
 4HyMwRzshiuTjgyzPV+H6FXmAaTOoATAfPNmfOI2zUByjI60YOHSjXM5Gs5IG0mzFuSj
 lqmFpzpYOyMsdljilWVo+YXnEsbV8YHr1sjVIOWN8PZ4cvmwnYay9P/rsjIiov4By9aN
 6AJv1KeTR4UHlPp6Buw9wQV1b0fhjBZ0fQAgUjRIbVdI6hRw43fFs7avTC/XSIPzD+JS yw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qyb6f20pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 23:58:36 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352NwZg1013489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Jun 2023 23:58:35 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 2 Jun 2023 16:58:35 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH v4 02/11] wifi: ath12k: move HE capabilities processing to a new function
Date: Fri, 2 Jun 2023 16:58:11 -0700
Message-ID: <20230602235820.23912-3-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230602235820.23912-1-quic_alokad@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pch-eszq7iEtTXLGjtYIvXe2iDn_Ycs7
X-Proofpoint-ORIG-GUID: pch-eszq7iEtTXLGjtYIvXe2iDn_Ycs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_18,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_165838_700182_B3FAF4FC 
X-CRM114-Status: GOOD (  19.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

The function ath12k_mac_copy_sband_iftype_data() is currently
used HE capabilities propagation but it can be extended to
include EHT data. Move the HE specific functionality from to
ath12k_mac_copy_he_cap() to make EHT additions easier.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
v4: No change from v3.
v3: No change from v2.
v2: No change from v1.

 drivers/net/wireless/ath/ath12k/mac.c | 111 +++++++++++++-------------
 1 file changed, 55 insertions(+), 56 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ddc293ebbd75..2eec7e114196 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4209,18 +4209,69 @@ static __le16 ath12k_mac_setup_he_6ghz_cap(struct ath12k_pdev_cap *pcap,
 	return cpu_to_le16(bcap->he_6ghz_capa);
 }
 
+static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
+				   int iftype, u8 num_tx_chains,
+				   struct ieee80211_sta_he_cap *he_cap)
+{
+	struct ieee80211_he_cap_elem *he_cap_elem = &he_cap->he_cap_elem;
+	struct ieee80211_he_mcs_nss_supp *mcs_nss = &he_cap->he_mcs_nss_supp;
+
+	he_cap->has_he = true;
+	memcpy(he_cap_elem->mac_cap_info, band_cap->he_cap_info,
+	       sizeof(he_cap_elem->mac_cap_info));
+	memcpy(he_cap_elem->phy_cap_info, band_cap->he_cap_phy_info,
+	       sizeof(he_cap_elem->phy_cap_info));
+
+	he_cap_elem->mac_cap_info[1] &=
+		IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_MASK;
+
+	he_cap_elem->phy_cap_info[5] &=
+		~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK;
+	he_cap_elem->phy_cap_info[5] &=
+		~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK;
+	he_cap_elem->phy_cap_info[5] |= num_tx_chains - 1;
+
+	switch (iftype) {
+	case NL80211_IFTYPE_AP:
+		he_cap_elem->phy_cap_info[3] &=
+			~IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_MASK;
+		he_cap_elem->phy_cap_info[9] |=
+			IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
+		break;
+	case NL80211_IFTYPE_STATION:
+		he_cap_elem->mac_cap_info[0] &= ~IEEE80211_HE_MAC_CAP0_TWT_RES;
+		he_cap_elem->mac_cap_info[0] |= IEEE80211_HE_MAC_CAP0_TWT_REQ;
+		he_cap_elem->phy_cap_info[9] |=
+			IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU;
+		break;
+	case NL80211_IFTYPE_MESH_POINT:
+		ath12k_mac_filter_he_cap_mesh(he_cap_elem);
+		break;
+	}
+
+	mcs_nss->rx_mcs_80 = cpu_to_le16(band_cap->he_mcs & 0xffff);
+	mcs_nss->tx_mcs_80 = cpu_to_le16(band_cap->he_mcs & 0xffff);
+	mcs_nss->rx_mcs_160 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	mcs_nss->tx_mcs_160 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	mcs_nss->rx_mcs_80p80 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	mcs_nss->tx_mcs_80p80 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+
+	memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
+	if (he_cap_elem->phy_cap_info[6] &
+	    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT)
+		ath12k_gen_ppe_thresh(&band_cap->he_ppet, he_cap->ppe_thres);
+}
+
 static int ath12k_mac_copy_sband_iftype_data(struct ath12k *ar,
 					     struct ath12k_pdev_cap *cap,
 					     struct ieee80211_sband_iftype_data *data,
 					     int band)
 {
+	struct ath12k_band_cap *band_cap = &cap->band[band];
 	int i, idx = 0;
 
 	for (i = 0; i < NUM_NL80211_IFTYPES; i++) {
 		struct ieee80211_sta_he_cap *he_cap = &data[idx].he_cap;
-		struct ath12k_band_cap *band_cap = &cap->band[band];
-		struct ieee80211_he_cap_elem *he_cap_elem =
-				&he_cap->he_cap_elem;
 
 		switch (i) {
 		case NL80211_IFTYPE_STATION:
@@ -4233,60 +4284,8 @@ static int ath12k_mac_copy_sband_iftype_data(struct ath12k *ar,
 		}
 
 		data[idx].types_mask = BIT(i);
-		he_cap->has_he = true;
-		memcpy(he_cap_elem->mac_cap_info, band_cap->he_cap_info,
-		       sizeof(he_cap_elem->mac_cap_info));
-		memcpy(he_cap_elem->phy_cap_info, band_cap->he_cap_phy_info,
-		       sizeof(he_cap_elem->phy_cap_info));
-
-		he_cap_elem->mac_cap_info[1] &=
-			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_MASK;
-
-		he_cap_elem->phy_cap_info[5] &=
-			~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK;
-		he_cap_elem->phy_cap_info[5] &=
-			~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK;
-		he_cap_elem->phy_cap_info[5] |= ar->num_tx_chains - 1;
-
-		switch (i) {
-		case NL80211_IFTYPE_AP:
-			he_cap_elem->phy_cap_info[3] &=
-				~IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_MASK;
-			he_cap_elem->phy_cap_info[9] |=
-				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
-			break;
-		case NL80211_IFTYPE_STATION:
-			he_cap_elem->mac_cap_info[0] &=
-				~IEEE80211_HE_MAC_CAP0_TWT_RES;
-			he_cap_elem->mac_cap_info[0] |=
-				IEEE80211_HE_MAC_CAP0_TWT_REQ;
-			he_cap_elem->phy_cap_info[9] |=
-				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU;
-			break;
-		case NL80211_IFTYPE_MESH_POINT:
-			ath12k_mac_filter_he_cap_mesh(he_cap_elem);
-			break;
-		}
-
-		he_cap->he_mcs_nss_supp.rx_mcs_80 =
-			cpu_to_le16(band_cap->he_mcs & 0xffff);
-		he_cap->he_mcs_nss_supp.tx_mcs_80 =
-			cpu_to_le16(band_cap->he_mcs & 0xffff);
-		he_cap->he_mcs_nss_supp.rx_mcs_160 =
-			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-		he_cap->he_mcs_nss_supp.tx_mcs_160 =
-			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-		he_cap->he_mcs_nss_supp.rx_mcs_80p80 =
-			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-		he_cap->he_mcs_nss_supp.tx_mcs_80p80 =
-			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-
-		memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
-		if (he_cap_elem->phy_cap_info[6] &
-		    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT)
-			ath12k_gen_ppe_thresh(&band_cap->he_ppet,
-					      he_cap->ppe_thres);
 
+		ath12k_mac_copy_he_cap(band_cap, i, ar->num_tx_chains, he_cap);
 		if (band == NL80211_BAND_6GHZ) {
 			data[idx].he_6ghz_capa.capa =
 				ath12k_mac_setup_he_6ghz_cap(cap, band_cap);
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
