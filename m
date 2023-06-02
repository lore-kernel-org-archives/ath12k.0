Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C06C77B7A
	for <ath12k@archiver.kernel.org>; Sat,  3 Jun 2023 01:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8at9tMxq8HUA0WctBUz2laB8MrKCB0AYGs6dIm4+As=; b=OJyf2qjv7QT/Zm
	aYt1gzIwz8YqwH6g2650/IhgiFxVdsiyipxFaIAKSSNhS+cdrWNl4L96gv41H3/qYqM+LYmdNXs68
	o0W+SSQmby/GK6H2E7x+0BmCbPpyj2GNo/nprNPn6zbXfiKlcBh+yQH5WnHYXPBBP156qBRXsI/lP
	vW/qmqAUdw5tleU3omTYi+Sf5ywXwJgm0/er3mVVgM6bryIu7nW1lF2ahFpqH1rkZ2gSj1I1ZFn9V
	2ODU/nKRQTeaaggT/I2YRDWL3+haYC7Hr/h14iB2QkCcoNtbRoUPbTIy1LWlySQ1eqRkVD6aen3Qr
	rF6c69E0Y2hDekc1Y89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5FdU-008LO0-2t
	for ath12k@archiver.kernel.org;
	Sat, 03 Jun 2023 01:00:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EfG-008DPW-0b
	for ath12k@lists.infradead.org;
	Fri, 02 Jun 2023 23:58:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352Nwc6H007093;
	Fri, 2 Jun 2023 23:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=uLnKGz8mJRBHU8htkWkmXj7O852md0i7wDlA+FzFFTk=;
 b=fpEbydlvM1kQNGLA7zWLg6bNyTA/BwIiOXKcQmQQu575DX45FK48/Lvph7aymLzPIzAd
 LukJP/nTiLRnAzoB3bmwAKoQ674gzGPf6XBGNGUNs2E7x+TEBtKYevuYZmb+pduOR5ej
 h+nzKRB2UeJQ6N5vZPQd1oyumuWf28TyHrjLSO69CeWgoNt+VVW9QJLFVkqm7I5BgCf3
 V92YNS8jGFqF/U5H22lpWC/YD+AtyyrgKgvlRiRAUzk1pzrM+niT+zLz7/Tk6ZoAWpDE
 7ZoPjyxUr3VuYQLawydSCVRuwOunI17Z6Rfkq9K/v/MNaCy9qUwAPnQFPhAJJTe7mthS zw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qyb6f20pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 23:58:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352NwbwZ003803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Jun 2023 23:58:37 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 2 Jun 2023 16:58:36 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Muna Sinada <quic_msinada@quicinc.com>,
        Aloka Dixit
	<quic_alokad@quicinc.com>
Subject: [PATCH v4 05/11] wifi: ath12k: add EHT PHY modes
Date: Fri, 2 Jun 2023 16:58:14 -0700
Message-ID: <20230602235820.23912-6-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230602235820.23912-1-quic_alokad@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ccxa2XMMihCB17x4XBUqpgdb75Iwc7Wi
X-Proofpoint-ORIG-GUID: ccxa2XMMihCB17x4XBUqpgdb75Iwc7Wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_18,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_165838_252733_83E0F6B1 
X-CRM114-Status: GOOD (  21.87  )
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

From: Muna Sinada <quic_msinada@quicinc.com>

Add support to retrieve and configure the phy modes supported
by the hardware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
v4: No change from v3.
v3: No change from v2.
v2: Changed 'target' to 'hardware' in the description.

 drivers/net/wireless/ath/ath12k/mac.c | 98 +++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h |  2 +-
 drivers/net/wireless/ath/ath12k/wmi.h | 13 +++-
 3 files changed, 91 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4e97424dbc1..4f61c8993c87 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -182,32 +182,35 @@ ath12k_phymodes[NUM_NL80211_BANDS][ATH12K_CHAN_WIDTH_NUM] = {
 	[NL80211_BAND_2GHZ] = {
 			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
 			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11AX_HE20_2G,
-			[NL80211_CHAN_WIDTH_20] = MODE_11AX_HE20_2G,
-			[NL80211_CHAN_WIDTH_40] = MODE_11AX_HE40_2G,
-			[NL80211_CHAN_WIDTH_80] = MODE_11AX_HE80_2G,
+			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11BE_EHT20_2G,
+			[NL80211_CHAN_WIDTH_20] = MODE_11BE_EHT20_2G,
+			[NL80211_CHAN_WIDTH_40] = MODE_11BE_EHT40_2G,
+			[NL80211_CHAN_WIDTH_80] = MODE_UNKNOWN,
 			[NL80211_CHAN_WIDTH_80P80] = MODE_UNKNOWN,
 			[NL80211_CHAN_WIDTH_160] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_320] = MODE_UNKNOWN,
 	},
 	[NL80211_BAND_5GHZ] = {
 			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
 			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11AX_HE20,
-			[NL80211_CHAN_WIDTH_20] = MODE_11AX_HE20,
-			[NL80211_CHAN_WIDTH_40] = MODE_11AX_HE40,
-			[NL80211_CHAN_WIDTH_80] = MODE_11AX_HE80,
-			[NL80211_CHAN_WIDTH_160] = MODE_11AX_HE160,
-			[NL80211_CHAN_WIDTH_80P80] = MODE_11AX_HE80_80,
+			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11BE_EHT20,
+			[NL80211_CHAN_WIDTH_20] = MODE_11BE_EHT20,
+			[NL80211_CHAN_WIDTH_40] = MODE_11BE_EHT40,
+			[NL80211_CHAN_WIDTH_80] = MODE_11BE_EHT80,
+			[NL80211_CHAN_WIDTH_160] = MODE_11BE_EHT160,
+			[NL80211_CHAN_WIDTH_80P80] = MODE_11BE_EHT80_80,
+			[NL80211_CHAN_WIDTH_320] = MODE_11BE_EHT320,
 	},
 	[NL80211_BAND_6GHZ] = {
 			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
 			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11AX_HE20,
-			[NL80211_CHAN_WIDTH_20] = MODE_11AX_HE20,
-			[NL80211_CHAN_WIDTH_40] = MODE_11AX_HE40,
-			[NL80211_CHAN_WIDTH_80] = MODE_11AX_HE80,
-			[NL80211_CHAN_WIDTH_160] = MODE_11AX_HE160,
-			[NL80211_CHAN_WIDTH_80P80] = MODE_11AX_HE80_80,
+			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11BE_EHT20,
+			[NL80211_CHAN_WIDTH_20] = MODE_11BE_EHT20,
+			[NL80211_CHAN_WIDTH_40] = MODE_11BE_EHT40,
+			[NL80211_CHAN_WIDTH_80] = MODE_11BE_EHT80,
+			[NL80211_CHAN_WIDTH_160] = MODE_11BE_EHT160,
+			[NL80211_CHAN_WIDTH_80P80] = MODE_11BE_EHT80_80,
+			[NL80211_CHAN_WIDTH_320] = MODE_11BE_EHT320,
 	},
 
 };
@@ -292,6 +295,24 @@ static const char *ath12k_mac_phymode_str(enum wmi_phy_mode mode)
 		return "11ax-he40-2g";
 	case MODE_11AX_HE80_2G:
 		return "11ax-he80-2g";
+	case MODE_11BE_EHT20:
+		return "11be-eht20";
+	case MODE_11BE_EHT40:
+		return "11be-eht40";
+	case MODE_11BE_EHT80:
+		return "11be-eht80";
+	case MODE_11BE_EHT80_80:
+		return "11be-eht80+80";
+	case MODE_11BE_EHT160:
+		return "11be-eht160";
+	case MODE_11BE_EHT160_160:
+		return "11be-eht160+160";
+	case MODE_11BE_EHT320:
+		return "11be-eht320";
+	case MODE_11BE_EHT20_2G:
+		return "11be-eht20-2g";
+	case MODE_11BE_EHT40_2G:
+		return "11be-eht40-2g";
 	case MODE_UNKNOWN:
 		/* skip */
 		break;
@@ -1929,6 +1950,38 @@ static enum wmi_phy_mode ath12k_mac_get_phymode_he(struct ath12k *ar,
 	return MODE_UNKNOWN;
 }
 
+static enum wmi_phy_mode ath12k_mac_get_phymode_eht(struct ath12k *ar,
+						    struct ieee80211_sta *sta)
+{
+	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_320)
+		if (sta->deflink.eht_cap.eht_cap_elem.phy_cap_info[0] &
+		    IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ)
+			return MODE_11BE_EHT320;
+	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_160) {
+		if (sta->deflink.he_cap.he_cap_elem.phy_cap_info[0] &
+		    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G)
+			return MODE_11BE_EHT160;
+
+		if (sta->deflink.he_cap.he_cap_elem.phy_cap_info[0] &
+			 IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)
+			return MODE_11BE_EHT80_80;
+
+		ath12k_warn(ar->ab, "invalid eht phy cap info for 160 Mhz\n");
+		return MODE_11BE_EHT160;
+	}
+
+	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_80)
+		return MODE_11BE_EHT80;
+
+	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_40)
+		return MODE_11BE_EHT40;
+
+	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_20)
+		return MODE_11BE_EHT20;
+
+	return MODE_UNKNOWN;
+}
+
 static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 					struct ieee80211_vif *vif,
 					struct ieee80211_sta *sta,
@@ -1950,7 +2003,12 @@ static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 
 	switch (band) {
 	case NL80211_BAND_2GHZ:
-		if (sta->deflink.he_cap.has_he) {
+		if (sta->deflink.eht_cap.has_eht) {
+			if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_40)
+				phymode = MODE_11BE_EHT40_2G;
+			else
+				phymode = MODE_11BE_EHT20_2G;
+		} else if (sta->deflink.he_cap.has_he) {
 			if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_80)
 				phymode = MODE_11AX_HE80_2G;
 			else if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_40)
@@ -1977,8 +2035,10 @@ static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 		break;
 	case NL80211_BAND_5GHZ:
 	case NL80211_BAND_6GHZ:
-		/* Check HE first */
-		if (sta->deflink.he_cap.has_he) {
+		/* Check EHT first */
+		if (sta->deflink.eht_cap.has_eht) {
+			phymode = ath12k_mac_get_phymode_eht(ar, sta);
+		} else if (sta->deflink.he_cap.has_he) {
 			phymode = ath12k_mac_get_phymode_he(ar, sta);
 		} else if (sta->deflink.vht_cap.vht_supported &&
 		    !ath12k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 57f4295420bb..7b16b70df4fa 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -33,7 +33,7 @@ struct ath12k_generic_iter {
 #define IEEE80211_VHT_MCS_SUPPORT_0_11_MASK	GENMASK(23, 16)
 #define IEEE80211_DISABLE_VHT_MCS_SUPPORT_0_11	BIT(24)
 
-#define ATH12K_CHAN_WIDTH_NUM			8
+#define ATH12K_CHAN_WIDTH_NUM			14
 
 #define ATH12K_TX_POWER_MAX_VAL	70
 #define ATH12K_TX_POWER_MIN_VAL	0
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b722eab281c3..aecc739164ae 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2796,8 +2796,17 @@ enum wmi_phy_mode {
 	MODE_11AX_HE20_2G = 21,
 	MODE_11AX_HE40_2G = 22,
 	MODE_11AX_HE80_2G = 23,
-	MODE_UNKNOWN = 24,
-	MODE_MAX = 24
+	MODE_11BE_EHT20 = 24,
+	MODE_11BE_EHT40 = 25,
+	MODE_11BE_EHT80 = 26,
+	MODE_11BE_EHT80_80 = 27,
+	MODE_11BE_EHT160 = 28,
+	MODE_11BE_EHT160_160 = 29,
+	MODE_11BE_EHT320 = 30,
+	MODE_11BE_EHT20_2G = 31,
+	MODE_11BE_EHT40_2G = 32,
+	MODE_UNKNOWN = 33,
+	MODE_MAX = 33,
 };
 
 struct wmi_vdev_start_req_arg {
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
