Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C364C02188
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 00:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rw1hdLBgDNACTDI3HCjoo+o9TLh05WBdNyiQ87niMjc=; b=43i+4dicYWom1ivj/c5rOjNAi6
	KY1c3puJ80HurGQKu4fJ9m9O4gtYgcsd2WCTF2avt4B4mv5sJ85n9qbr4jfLo1UMGqLzBH0MLKF5F
	16/cDI5irV0BjM5Zfp6FrN4k0oE6psCddMRkwsA1cUpuaOtFF6ozd2bE3tZynnyYxic9oCPqIA5rL
	7KCh6EhINvTWpYn4bvfbxOPe0RK87wc0+AbZlCDUo7Xz8AmNTmz/PJmlgCQMeuSJXp5zx8WQWvhFc
	k8VWxYichgZH/8kKkq8ZHSZB+AjSo3YisPMB6yCrCP93JlsPKLuhXuuKQAdIKoGcSI5ZNbf1E48x7
	kyHFvKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUwz-000000074Ap-1Ssi
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 00:38:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUwt-0000000746D-1m9p
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 00:38:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DKsOSx026165;
	Tue, 14 Jan 2025 00:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rw1hdLBgDNACTDI3HCjoo+o9TLh05WBdNyiQ87niMjc=; b=k/HfOdVLQnXMJm12
	rn6ffWorJY3Wa7vikKpWVm7u6ItdcKW+btRXIlN3vf6yI2tRp7t4UmnUygSCraBa
	KEZvR1M+xRjhB8ZlGiUMuAOBrXQb/KG2D/I3UaxieTblZj7lkr2OcbaKdg7MEOcP
	kOBOdWUvZ1ONw9NHCxOQFwclE5ueH37robRZdZk2uOMItn0QcX5O+cD+CGaKpjJe
	VSeJQtyNIsqFFBekbnTTglcJWRahD5JxrvFRQD4wFXcrAR4ohZd5C5W27xXrtS4g
	JGAocP91HXLCp1+0zPj9O7Xck4AB2zun+J56sPfNc17y9HG7H0OLe8rg+nyY3ttX
	4axJTQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445a928c3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 00:38:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E0cQhl025738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 00:38:26 GMT
Received: from ath12k-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 16:38:25 -0800
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
Subject: [PATCH v9 8/9] wifi: ath12k: add support for 160 MHz bandwidth
Date: Mon, 13 Jan 2025 16:38:12 -0800
Message-ID: <20250114003813.2783550-9-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P-wsRnJFT8UITLYBTYaFwbRlySAy0aa3
X-Proofpoint-ORIG-GUID: P-wsRnJFT8UITLYBTYaFwbRlySAy0aa3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_163827_466576_464CA9CD 
X-CRM114-Status: GOOD (  19.97  )
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

Add support to configure maximum NSS in 160 MHz bandwidth.
Firmware advertises support for handling NSS ratio information
as a part of service ready ext event using nss_ratio_enabled
flag. Save this information in ath12k_pdev_cap to calculate
NSS ratio.

Additionally, reorder the code by moving
ath12k_peer_assoc_h_phymode() before ath12k_peer_assoc_h_vht()
to ensure that arg->peer_phymode correctly reflects the bandwidth
in the max NSS calculation.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +
 drivers/net/wireless/ath/ath12k/mac.c  | 83 ++++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.h  |  2 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 19 +++++-
 drivers/net/wireless/ath/ath12k/wmi.h  | 28 +++++++++
 5 files changed, 123 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3dd01ad100c5..b473f18e90a0 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -771,6 +771,8 @@ struct ath12k_pdev_cap {
 	struct ath12k_band_cap band[NUM_NL80211_BANDS];
 	u32 eml_cap;
 	u32 mld_cap;
+	bool nss_ratio_enabled;
+	u8 nss_ratio_info;
 };
 
 struct mlo_timestamp {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index da4e22f44165..d52db04f4a6a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2193,6 +2193,34 @@ ath12k_peer_assoc_h_vht_limit(u16 tx_mcs_set,
 	return tx_mcs_set;
 }
 
+static u8 ath12k_get_nss_160mhz(struct ath12k *ar,
+				u8 max_nss)
+{
+	u8 nss_ratio_info = ar->pdev->cap.nss_ratio_info;
+	u8 max_sup_nss = 0;
+
+	switch (nss_ratio_info) {
+	case WMI_NSS_RATIO_1BY2_NSS:
+		max_sup_nss = max_nss >> 1;
+		break;
+	case WMI_NSS_RATIO_3BY4_NSS:
+		ath12k_warn(ar->ab, "WMI_NSS_RATIO_3BY4_NSS not supported\n");
+		break;
+	case WMI_NSS_RATIO_1_NSS:
+		max_sup_nss = max_nss;
+		break;
+	case WMI_NSS_RATIO_2_NSS:
+		ath12k_warn(ar->ab, "WMI_NSS_RATIO_2_NSS not supported\n");
+		break;
+	default:
+		ath12k_warn(ar->ab, "invalid nss ratio received from fw: %d\n",
+			    nss_ratio_info);
+		break;
+	}
+
+	return max_sup_nss;
+}
+
 static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 				    struct ath12k_link_vif *arvif,
 				    struct ath12k_link_sta *arsta,
@@ -2210,6 +2238,7 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 	u8 max_nss, vht_mcs;
 	int i, vht_nss, nss_idx;
 	bool user_rate_valid = true;
+	u32 rx_nss, tx_nss, nss_160;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -2314,10 +2343,24 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 	/* TODO:  Check */
 	arg->tx_max_mcs_nss = 0xFF;
 
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vht peer %pM max_mpdu %d flags 0x%x\n",
-		   arsta->addr, arg->peer_max_mpdu, arg->peer_flags);
+	if (arg->peer_phymode == MODE_11AC_VHT160) {
+		tx_nss = ath12k_get_nss_160mhz(ar, max_nss);
+		rx_nss = min(arg->peer_nss, tx_nss);
+		arg->peer_bw_rxnss_override = ATH12K_BW_NSS_MAP_ENABLE;
 
-	/* TODO: rxnss_override */
+		if (!rx_nss) {
+			ath12k_warn(ar->ab, "invalid max_nss\n");
+			return;
+		}
+
+		nss_160 = u32_encode_bits(rx_nss - 1, ATH12K_PEER_RX_NSS_160MHZ);
+		arg->peer_bw_rxnss_override |= nss_160;
+	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+		   "mac vht peer %pM max_mpdu %d flags 0x%x nss_override 0x%x\n",
+		   arsta->addr, arg->peer_max_mpdu, arg->peer_flags,
+		   arg->peer_bw_rxnss_override);
 }
 
 static int ath12k_mac_get_max_he_mcs_map(u16 mcs_map, int nss)
@@ -2410,6 +2453,7 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 	u16 he_tx_mcs = 0, v = 0;
 	int he_nss, nss_idx;
 	bool user_rate_valid = true;
+	u32 rx_nss, tx_nss, nss_160;
 
 	if (WARN_ON(ath12k_mac_vif_link_chan(vif, link_id, &def)))
 		return;
@@ -2604,10 +2648,27 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 			max_nss = i + 1;
 	}
 	arg->peer_nss = min(link_sta->rx_nss, max_nss);
+	max_nss = min(max_nss, ar->num_tx_chains);
+
+	if (arg->peer_phymode == MODE_11AX_HE160) {
+		tx_nss = ath12k_get_nss_160mhz(ar, max_nss);
+		rx_nss = min(arg->peer_nss, tx_nss);
+		arg->peer_bw_rxnss_override = ATH12K_BW_NSS_MAP_ENABLE;
+
+		if (!rx_nss) {
+			ath12k_warn(ar->ab, "invalid max_nss\n");
+			return;
+		}
+
+		nss_160 = u32_encode_bits(rx_nss - 1, ATH12K_PEER_RX_NSS_160MHZ);
+		arg->peer_bw_rxnss_override |= nss_160;
+	}
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
-		   "mac he peer %pM nss %d mcs cnt %d\n",
-		   arsta->addr, arg->peer_nss, arg->peer_he_mcs_count);
+		   "mac he peer %pM nss %d mcs cnt %d nss_override 0x%x\n",
+		   arsta->addr, arg->peer_nss,
+		   arg->peer_he_mcs_count,
+		   arg->peer_bw_rxnss_override);
 }
 
 static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
@@ -6739,10 +6800,8 @@ ath12k_create_vht_cap(struct ath12k *ar, u32 rate_cap_tx_chainmask,
 
 	ath12k_set_vht_txbf_cap(ar, &vht_cap.cap);
 
-	/* TODO: Enable back VHT160 mode once association issues are fixed */
-	/* Disabling VHT160 and VHT80+80 modes */
-	vht_cap.cap &= ~IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_MASK;
-	vht_cap.cap &= ~IEEE80211_VHT_CAP_SHORT_GI_160;
+	/* 80P80 is not supported */
+	vht_cap.cap &= ~IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ;
 
 	rxmcs_map = 0;
 	txmcs_map = 0;
@@ -11186,7 +11245,8 @@ ath12k_mac_setup_radio_iface_comb(struct ath12k *ar,
 	comb[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
 					BIT(NL80211_CHAN_WIDTH_20) |
 					BIT(NL80211_CHAN_WIDTH_40) |
-					BIT(NL80211_CHAN_WIDTH_80);
+					BIT(NL80211_CHAN_WIDTH_80) |
+					BIT(NL80211_CHAN_WIDTH_160);
 
 	return 0;
 }
@@ -11560,6 +11620,9 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
 	ieee80211_hw_set(hw, REPORTS_LOW_ACK);
 
+	if (cap->nss_ratio_enabled)
+		ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
+
 	if ((ht_cap & WMI_HT_CAP_ENABLED) || is_6ghz) {
 		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
 		ieee80211_hw_set(hw, TX_AMPDU_SETUP_IN_HW);
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index bce142ce78f5..8ccc795041c0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -38,6 +38,8 @@ struct ath12k_generic_iter {
 #define IEEE80211_DISABLE_VHT_MCS_SUPPORT_0_11	BIT(24)
 
 #define ATH12K_CHAN_WIDTH_NUM			14
+#define ATH12K_BW_NSS_MAP_ENABLE		BIT(31)
+#define ATH12K_PEER_RX_NSS_160MHZ		GENMASK(2, 0)
 
 #define ATH12K_TX_POWER_MAX_VAL	70
 #define ATH12K_TX_POWER_MIN_VAL	0
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d13c609edc63..1185be8b2905 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -523,6 +523,10 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 		pdev_cap->he_mcs = le32_to_cpu(mac_caps->he_supp_mcs_5g);
 		pdev_cap->tx_chain_mask = le32_to_cpu(mac_caps->tx_chain_mask_5g);
 		pdev_cap->rx_chain_mask = le32_to_cpu(mac_caps->rx_chain_mask_5g);
+		pdev_cap->nss_ratio_enabled =
+			WMI_NSS_RATIO_EN_DIS_GET(mac_caps->nss_ratio);
+		pdev_cap->nss_ratio_info =
+			WMI_NSS_RATIO_INFO_GET(mac_caps->nss_ratio);
 	} else {
 		return -EINVAL;
 	}
@@ -998,11 +1002,24 @@ int ath12k_wmi_vdev_down(struct ath12k *ar, u8 vdev_id)
 static void ath12k_wmi_put_wmi_channel(struct ath12k_wmi_channel_params *chan,
 				       struct wmi_vdev_start_req_arg *arg)
 {
+	u32 center_freq1 = arg->band_center_freq1;
+
 	memset(chan, 0, sizeof(*chan));
 
 	chan->mhz = cpu_to_le32(arg->freq);
 	chan->band_center_freq1 = cpu_to_le32(arg->band_center_freq1);
-	chan->band_center_freq2 = 0;
+	if (arg->mode == MODE_11AX_HE160) {
+		if (arg->freq > center_freq1)
+			chan->band_center_freq1 =
+					cpu_to_le32(center_freq1 + 40);
+		else
+			chan->band_center_freq1 =
+					cpu_to_le32(center_freq1 - 40);
+
+		chan->band_center_freq2 = cpu_to_le32(arg->band_center_freq1);
+	} else {
+		chan->band_center_freq2 = 0;
+	}
 
 	chan->info |= le32_encode_bits(arg->mode, WMI_CHAN_INFO_MODE);
 	if (arg->passive)
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index a6644b8940ba..3bd61f30a9c5 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2290,6 +2290,21 @@ enum wmi_direct_buffer_module {
 	WMI_DIRECT_BUF_MAX
 };
 
+/**
+ * enum wmi_nss_ratio - NSS ratio received from FW during service ready ext event
+ * @WMI_NSS_RATIO_1BY2_NSS: Max nss of 160MHz is equals to half of the max nss of 80MHz
+ * @WMI_NSS_RATIO_3BY4_NSS: Max nss of 160MHz is equals to 3/4 of the max nss of 80MHz
+ * @WMI_NSS_RATIO_1_NSS: Max nss of 160MHz is equals to the max nss of 80MHz
+ * @WMI_NSS_RATIO_2_NSS: Max nss of 160MHz is equals to two times the max nss of 80MHz
+ */
+
+enum wmi_nss_ratio {
+	WMI_NSS_RATIO_1BY2_NSS,
+	WMI_NSS_RATIO_3BY4_NSS,
+	WMI_NSS_RATIO_1_NSS,
+	WMI_NSS_RATIO_2_NSS
+};
+
 struct ath12k_wmi_pdev_band_arg {
 	u32 pdev_id;
 	u32 start_freq;
@@ -2606,6 +2621,12 @@ struct ath12k_wmi_hw_mode_cap_params {
 } __packed;
 
 #define WMI_MAX_HECAP_PHY_SIZE                 (3)
+#define WMI_NSS_RATIO_EN_DIS_BITPOS    BIT(0)
+#define WMI_NSS_RATIO_EN_DIS_GET(_val) \
+	le32_get_bits(_val, WMI_NSS_RATIO_EN_DIS_BITPOS)
+#define WMI_NSS_RATIO_INFO_BITPOS              GENMASK(4, 1)
+#define WMI_NSS_RATIO_INFO_GET(_val) \
+	le32_get_bits(_val, WMI_NSS_RATIO_INFO_BITPOS)
 
 /* pdev_id is present in lower 16 bits of pdev_and_hw_link_ids in
  * ath12k_wmi_mac_phy_caps_params & ath12k_wmi_caps_ext_params.
@@ -2647,6 +2668,13 @@ struct ath12k_wmi_mac_phy_caps_params {
 	__le32 he_cap_info_2g_ext;
 	__le32 he_cap_info_5g_ext;
 	__le32 he_cap_info_internal;
+	__le32 wireless_modes;
+	__le32 low_2ghz_chan_freq;
+	__le32 high_2ghz_chan_freq;
+	__le32 low_5ghz_chan_freq;
+	__le32 high_5ghz_chan_freq;
+	__le32 nss_ratio;
+
 } __packed;
 
 struct ath12k_wmi_hal_reg_caps_ext_params {
-- 
2.34.1


