Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6D8C369AB
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 11:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=97qgRjv+DMq9qzeWj1r82+ZRkb/4AuF7pRoL1UNlID0=; b=tt0PvUeJI3McTodIv41gp0QEmR
	GRzn5xr5H465ZsdR8y/AcTY2s8CAbWQYTD12/Fs71hXXmcwG4IVo5/3e8P6B2dUHQWOpi+pL0utnY
	bOsKIw8ZvtqAzqKaVFmX12rhFo2p9zzDHeNF+LA4O8cxNRwrb21DXDeCkB8UaaILJejAzY2H3ruvB
	FMW5koyytin4LfR3uXY33jsXKkSeusc/ohvaM5B3CaIh0sFiYr6297eDDCnB9TgBnFHJqefmi27W9
	8nHcsY5HiIKyr3R4a/amqGi8ihJy9bX0CHJIzenKrmuQLftcp+dYuD2RLa6dHIHLy6WXaoA+pIHkI
	hT0GsmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pcV-00000004Dmm-3ieO;
	Mon, 21 Apr 2025 11:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pcT-00000004DmO-34Xa
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 11:47:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LAbgbI029441
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 11:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=97qgRjv+DMq9qzeWj1r82+ZRkb/4AuF7pRo
	L1UNlID0=; b=LxmY68ai/5RUsLe3wQKt8XP0Z4NJo/1ZQXgA99QxscnNwXn/yx+
	cHbPrgcWY4KtifaHe0o8cjWpyz54aJaR7gXFGmCwB/kfU2jBDvuD/S3nu4QFB4WQ
	0CSfQo9DakrxYlOmTa96zhCzcZ7H6WSJcs38Gz00tGsvlqd8qYsIjhUeXK9VzgV3
	0Ska9V27vO2nYjtWSWzLjSfOwYNDtuWvJYFIrC6XecOLddQORfTHGWnP5AloIYgH
	e8qTRhQbnVuuXqueNmAf6ZL3XEc+6JG8n6+X1h0YfkNYnuyfsYg6Gd1lfj/p19WG
	OOT6DTcF/lkz/vtujhGz2eaA+5BtWWy1/UQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svc405-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 11:47:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af53a6bc0b6so1482238a12.1
        for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 04:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745236043; x=1745840843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97qgRjv+DMq9qzeWj1r82+ZRkb/4AuF7pRoL1UNlID0=;
        b=FxcjXBXMOmVHIo8b7u8ATClpLeYixsWqjaDhAR+Ui5w/8YJ/gkLZVhQKTOYEjHZCZI
         RMhaepFKcCkLNc7GSB7bprKAm+LbIMNCdhO70l1l3wtTcjRZ0dEEBTlpwUTEd55FBY3U
         IjZTyW36kBBp4aac60CmzDEBl7qoBI6S1NG8DjElWwSr/qKnwUc1/z4LmkmLrpkU2n94
         ziF+7G4UPnTjnHGquxPVVDBGD6SDXvRBYM/DNMPZ4jteMVTsZ3K2iEB8Dtz+GNBiJJ8e
         9tvMRH1xHqwJo7e+MT5iKFPPTGbeRhDlLbUC826Q/nB3PNpLl+6KileA6bt4pLf6HW14
         0oyw==
X-Gm-Message-State: AOJu0YyIG0jVpw2b6mQ23cmRi3vEImD+ApmrlvvEIt379fQxsTkrVRZ0
	GJDWCyg4EcdaTs8Y1CCEqdNHMEGEPcu66Cxop/6IBC+Is4peSYoM+iATdw8WBi8h//xFeshfMKh
	915zDZWg3A4tqVSPmH42Hq2HHEKYx3EUWybAp6qZrkdViIw3qUnOelgt5WPGJgfTxjSJl
X-Gm-Gg: ASbGncv9A2ALFosahomBbulP0ypRfotfP66Xrfaa7iehaoLDwPbjmui9xjv4RVwUPO0
	DRyJWDfM51MpUoFjOSAYHruCj6GB9yc27usrAyPOsUJWClnnxhxrr+jo7AeqLXVpW1M5wecZyoA
	dyROMjzKjRrvQz70DDgU4fPwjACUJeIaZmXcxFJMeBWKevI2kLSBN/kxgSdGXs2OHD4X+fPmwgw
	+nc/A2S6mByBpZ5DDCFoEddncQA+T2qdECVznDSOuDvhlXX4EUL/lXSE8hxi+tVr3QAxtmv960v
	vzPS1KcWe0/LuCHnxOlzs+jJvbKOEbC5tpYNF8QgI2Xrjdq89BrROMq0
X-Received: by 2002:a17:90b:2801:b0:2fe:99cf:f566 with SMTP id 98e67ed59e1d1-3087bb573d8mr16488882a91.13.1745236042942;
        Mon, 21 Apr 2025 04:47:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuStkKMdb4q+TpBnfcVEupfU7/7Jnc0mQi7iH1c1GzjO0O2h/W9TO93xrkLfGGHtm9os+kNg==
X-Received: by 2002:a17:90b:2801:b0:2fe:99cf:f566 with SMTP id 98e67ed59e1d1-3087bb573d8mr16488850a91.13.1745236042434;
        Mon, 21 Apr 2025 04:47:22 -0700 (PDT)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df1e2acsm6384283a91.21.2025.04.21.04.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 04:47:21 -0700 (PDT)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be installed in hardware
Date: Mon, 21 Apr 2025 17:17:11 +0530
Message-Id: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4nUA9MM-372rgXlALpKeKfABtXktCh1w
X-Proofpoint-ORIG-GUID: 4nUA9MM-372rgXlALpKeKfABtXktCh1w
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6806304c cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=-gpDE4vgwXxYWL_pqeMA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_044725_782399_6583902D 
X-CRM114-Status: GOOD (  21.17  )
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

Install beacon protection keys in hardware for AP modes only if hardware
supports it, as indicated by the WMI service bit
WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT. Allow keyidx up to 7, since
beacon protection uses keyidx 6 and 7.

Control this feature by setting bit 0 of feature_enable_bitmap when sending
the WMI_BCN_TMPL_CMDID command to firmware.

Check for the beacon protection enabled bit in both tx and non-tx profiles
for MBSSID cases. If set in either profile, enable the beacon protection
feature in firmware for transmitted vif.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 52 +++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/wmi.c  |  3 ++
 drivers/net/wireless/ath/ath12k/wmi.h  |  5 ++-
 4 files changed, 46 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4b8f434e3e9a..48bcb6d95479 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -290,6 +290,7 @@ struct ath12k_link_vif {
 
 	int bank_id;
 	u8 vdev_id_check_en;
+	bool beacon_prot;
 
 	struct wmi_wmm_params_all_arg wmm_params;
 	struct list_head list;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d170bca72948..71236c4f36a6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1445,11 +1445,13 @@ static int ath12k_mac_remove_vendor_ie(struct sk_buff *skb, unsigned int oui,
 	return 0;
 }
 
-static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_buff *bcn,
+static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif,
+				     struct ath12k_link_vif *tx_arvif,
+					 struct sk_buff *bcn,
 				     u8 bssid_index, bool *nontx_profile_found)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)bcn->data;
-	const struct element *elem, *nontx, *index, *nie;
+	const struct element *elem, *nontx, *index, *nie, *ext_cap_ie;
 	const u8 *start, *tail;
 	u16 rem_len;
 	u8 i;
@@ -1467,6 +1469,11 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 				    start, rem_len))
 		arvif->wpaie_present = true;
 
+	ext_cap_ie = cfg80211_find_elem(WLAN_EID_EXT_CAPABILITY, start, rem_len);
+	if (ext_cap_ie && ext_cap_ie->datalen >= 11 &&
+	    (ext_cap_ie->data[10] & WLAN_EXT_CAPA11_BCN_PROTECT))
+		tx_arvif->beacon_prot = true;
+
 	/* Return from here for the transmitted profile */
 	if (!bssid_index)
 		return;
@@ -1509,6 +1516,19 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 
 			if (index->data[0] == bssid_index) {
 				*nontx_profile_found = true;
+
+				/* Check if nontx BSS has beacon protection enabled */
+				if (!tx_arvif->beacon_prot) {
+					ext_cap_ie =
+					    cfg80211_find_elem(WLAN_EID_EXT_CAPABILITY,
+							       nontx->data,
+							       nontx->datalen);
+					if (ext_cap_ie && ext_cap_ie->datalen >= 11 &&
+					    (ext_cap_ie->data[10] &
+					     WLAN_EXT_CAPA11_BCN_PROTECT))
+						tx_arvif->beacon_prot = true;
+				}
+
 				if (cfg80211_find_ie(WLAN_EID_RSN,
 						     nontx->data,
 						     nontx->datalen)) {
@@ -1557,11 +1577,11 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
 	}
 
 	if (tx_arvif == arvif)
-		ath12k_mac_set_arvif_ies(arvif, beacons->bcn[0].skb, 0, NULL);
+		ath12k_mac_set_arvif_ies(arvif, tx_arvif, beacons->bcn[0].skb, 0, NULL);
 
 	for (i = 0; i < beacons->cnt; i++) {
 		if (tx_arvif != arvif && !nontx_profile_found)
-			ath12k_mac_set_arvif_ies(arvif, beacons->bcn[i].skb,
+			ath12k_mac_set_arvif_ies(arvif, tx_arvif, beacons->bcn[i].skb,
 						 bssid_index,
 						 &nontx_profile_found);
 
@@ -1630,9 +1650,9 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 	}
 
 	if (tx_arvif == arvif) {
-		ath12k_mac_set_arvif_ies(arvif, bcn, 0, NULL);
+		ath12k_mac_set_arvif_ies(arvif, tx_arvif, bcn, 0, NULL);
 	} else {
-		ath12k_mac_set_arvif_ies(arvif, bcn,
+		ath12k_mac_set_arvif_ies(arvif, tx_arvif, bcn,
 					 link_conf->bssid_index,
 					 &nontx_profile_found);
 		if (!nontx_profile_found)
@@ -4733,6 +4753,16 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 		arg.key_cipher = WMI_CIPHER_AES_GCM;
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV_MGMT;
 		break;
+	case WLAN_CIPHER_SUITE_AES_CMAC:
+		arg.key_cipher = WMI_CIPHER_AES_CMAC;
+		break;
+	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
+	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
+		arg.key_cipher = WMI_CIPHER_AES_GMAC;
+		break;
+	case WLAN_CIPHER_SUITE_BIP_CMAC_256:
+		arg.key_cipher = WMI_CIPHER_AES_CMAC;
+		break;
 	default:
 		ath12k_warn(ar->ab, "cipher %d is not supported\n", key->cipher);
 		return -EOPNOTSUPP;
@@ -4964,14 +4994,6 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	/* BIP needs to be done in software */
-	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
-	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
-	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
-	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
-		return 1;
-	}
-
 	if (key->keyidx > WMI_MAX_KEY_INDEX)
 		return -ENOSPC;
 
@@ -11588,6 +11610,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	}
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_PUNCT);
+	if (test_bit(WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT, ab->wmi_ab.svc_map))
+		wiphy_ext_feature_set(hw->wiphy, NL80211_EXT_FEATURE_BEACON_PROTECTION);
 
 	ath12k_reg_init(hw);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ea303dca38b5..89ed207225e6 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2008,6 +2008,9 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 			u32p_replace_bits(&ema_params, 1, WMI_EMA_BEACON_LAST);
 		cmd->ema_params = cpu_to_le32(ema_params);
 	}
+	cmd->feature_enable_bitmap =
+		cpu_to_le32(u32_encode_bits(arvif->beacon_prot,
+					    WMI_BEACON_PROTECTION_EN_BIT));
 
 	ptr = skb->data + sizeof(*cmd);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 80fdbc566518..7c59fbf5ecff 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2197,6 +2197,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_PER_PEER_HTT_STATS_RESET = 213,
 	WMI_TLV_SERVICE_FREQINFO_IN_METADATA = 219,
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
+	WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT = 244,
 	WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT = 253,
 
 	WMI_MAX_EXT_SERVICE = 256,
@@ -3668,6 +3669,8 @@ struct ath12k_wmi_ftm_event {
 #define WMI_EMA_BEACON_FIRST    GENMASK(23, 16)
 #define WMI_EMA_BEACON_LAST     GENMASK(31, 24)
 
+#define WMI_BEACON_PROTECTION_EN_BIT	BIT(0)
+
 struct ath12k_wmi_bcn_tmpl_ema_arg {
 	u8 bcn_cnt;
 	u8 bcn_index;
@@ -4631,7 +4634,7 @@ enum wmi_ap_ps_peer_param {
 
 #define DISABLE_SIFS_RESPONSE_TRIGGER 0
 
-#define WMI_MAX_KEY_INDEX   3
+#define WMI_MAX_KEY_INDEX   7
 #define WMI_MAX_KEY_LEN     32
 
 enum wmi_key_type {

base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
Depends-on: <20250421111505.3633992-1-karthikeyan.kathirvel@oss.qualcomm.com>
-- 
2.34.1


