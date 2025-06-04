Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E55EC5B543
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zojVgYdtyymHQOWW+wijIZvxnRfclQDSOWDAxN8iJ24=; b=ztk5wql7uwTCLX7sPSat4BHqKO
	qFQwNEF4AL9orKz+up2S71TUI4rDGLoYB5c7wpitlnXGCrqgvPMpCfIignCdYMCZYCUcuu8kuXjFG
	JdgE7JTNq2Qn1sPzIoJcMFVq22RFYnHQ4Yy3I4fVewPeqtsNBIahmRV4MMexXme83qzD1Rzqicj3Q
	ojy8FeLvyBZGz1VQBOiY56/sJdOELBdYNyEIhtpS5oR3vsVIEinNqkjyUwn/Qv5EdanQegZWiI24i
	wpXeUKsGx6wkqfgf0S2XfmWQfXaEdyFaVYf+Zuo3k9ZkEtsEBwkp7pKWbBxaLPNQx/sVPEC9PtcdT
	cjWpgn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlBO-0000000D6ta-2nNu;
	Wed, 04 Jun 2025 10:17:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlAf-0000000D6sH-39UH
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 10:16:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55484Ppf006331
	for <ath12k@lists.infradead.org>; Wed, 4 Jun 2025 10:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zojVgYdtyymHQOWW+wijIZvxnRfclQDSOWD
	AxN8iJ24=; b=QiVB3aDAl+rnWx8F3JhQzCzlqMIwinnHydLB6s9ophxX9GGooEi
	mJBoDiCbCiCO7gVENQV4//FY3pAhdmp0IVRFnseejQgsF9NLJ1owXZjp+7rb605o
	78sq9zh4N926XY8l77ciDogaJvSs6emHpmCOSQ6XWss/QnE8NU4l5Hsa3BTIVogg
	0ovzFfC2dHp6F/QgT35SMAc3BUcPyiklkj5xHGk/iMunSAZ3S4kRQCbwORHz1PeJ
	8GVBw6jmVI/6/GWT1wfGHWwGBTaNGKobP3sTju5WKeVi+bD7ickPYKITPipyl3C5
	F/Ur9Gbmq1S5kx4m+x3CIUJWbJtlFs2TLnw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8swpd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 10:16:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747af0bf0ebso4964786b3a.1
        for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 03:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749032192; x=1749636992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zojVgYdtyymHQOWW+wijIZvxnRfclQDSOWDAxN8iJ24=;
        b=LWGLL6cHYvR1xYLYfZQXFn6SAE3327dnFRIRFJnmAieSDrknAXAc0m6Ej/BBbtyQRK
         CJPVJJnju+fPSm0X1agSECn8rwZ2B9IcfSKksFSICNzbGWL2d06dkdKNLP0wx37/Tsrp
         AEzrzYKtilZu4v0MggegCGMl2CXw5LykPnYPsxgWbqNmc6KbVpdMDwycq0OagK/SstNB
         JxrW7d/gq660FQdOF3cz5WTDRnuSfF79dCqmuUPDjgT2hhtwfz+CB3aAKH8VYTMTddTu
         2ljyBnRgqL9DXEkFHEaurlnOs6HRgTNcEmxCPJGpquvxrTlj6g2l/HusLgdGx4nACQZy
         AqvQ==
X-Gm-Message-State: AOJu0YyMAVoAmkMosUqzKxLJ4GlWV7e3EWAfjFu6HQzbjw1B+VqurlZ5
	0vQwKHBoyLcCxg8aW3FeMf5IMfDkZWlqFnSbLat1xyEsAhJ1EkzQUR2Gu4b+BdMWsYD+4ye84D/
	VtqFfzpY1GaVjDNZSJyKzcNcNNBj09jaFKpQJUkqbVwn6q7+gXkoEQwQmuAQiwkpg/Amh7xlz
X-Gm-Gg: ASbGncu0EdEWESkTZ5rcHsopAjFzUyJKRK0o3XE980re5gL+0YVNaro9iqFnD2bimly
	R8+SGAbwxKUAc3hMDXhv9guScszbTI4GFHBU61sqjLhnVm61nV4V4p6bkZEAtaoynMsUgYpsg6J
	fPgaUbdmPZAoZFG5b9i7auyumQ0zly+htOdKAKJU+69i9j2qHkJoThuZQ1gO7SC4gBmQxJDXno9
	zGr2/17lNf6rCjaKhpaRVQWuMZJ7cpw8YYKYUA6gZl2eYcnIXoQN5kgBX7nhbzOgzDbLiwRR3NI
	lXCE3ks1K3tXfTHzp0AEl0XIXga+uykspPc6niVruLWlwMgxUWQxPjnevH8I0j9yn8c=
X-Received: by 2002:a05:6a00:398f:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7480b452f9amr3307472b3a.19.1749032191887;
        Wed, 04 Jun 2025 03:16:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELzsvg1zF4KZg7wEw2FDFrHoqH23ECWsCxPuNuTNOnyESjcGQ3U5AY2XEybLA/RLfXgikDOg==
X-Received: by 2002:a05:6a00:398f:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7480b452f9amr3307439b3a.19.1749032191427;
        Wed, 04 Jun 2025 03:16:31 -0700 (PDT)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb96fa2sm8393528a12.51.2025.06.04.03.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 03:16:30 -0700 (PDT)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: allow beacon protection keys to be installed in hardware
Date: Wed,  4 Jun 2025 15:46:20 +0530
Message-Id: <20250604101620.2948103-1-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7IsDl4H4CwlJjkPdKM7JZ2VMMMbPhAND
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68401d01 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=N4hopNKjJsku8qVRZDMA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 7IsDl4H4CwlJjkPdKM7JZ2VMMMbPhAND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA3NyBTYWx0ZWRfXy9dF2iF7cHL8
 ptsmO+Z8HajyTTgW7/dVFQdHJ0SMbl62BNRjEqiNH58+Hn4Kf6o2Vm1/gCjUynRLpy11AMMr+XZ
 Vt6cPSmiS1T8MScy+kEOKDjU1bIyqw3Ddh6dKEjYDY2iNi6ZitTxWY0O+/oEW0dL+nenty0hPYa
 0DJE0WPQS9dMDl9YgsSK4DGic0R+X7tFjvoIvhgS1MfAijkYRtZi/oTKbwC2L50d8SzkVQi8tpb
 vSsneMQWTCgEj7ZJRDFmS8IJplRTo/8si/+/XtBBL5v4tWoUQozmGmwDDneRoq9e2/G/2i8rBb/
 aSoaWxAs8MWEX5KD6evAAXH59M4isQpyKnx5Aj9D4Cx8VgoAhe6kMfWxWASPYmVlHzaRjainOVS
 FBujKbrLiCbjUcNP8q/m6XNQoIVvQnHSQ7nvZirmAS8TRps6Im8b/SBb6Uo72QppWWmXWdGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_031633_795994_00D7D926 
X-CRM114-Status: GOOD (  23.07  )
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

v2:
- IGTK hardware offload is not working because a firmware bug that gets
  triggered during IGTK key installation, which leads to corruption of
  the GTK keys in firmware. So as of now relying on software crypto till
  firmware fixes available in uptream

- Made alignment fix

---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 52 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.c  |  3 ++
 drivers/net/wireless/ath/ath12k/wmi.h  |  5 ++-
 4 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 941db6e49d6e..697bad921d82 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -316,6 +316,7 @@ struct ath12k_link_vif {
 
 	int bank_id;
 	u8 vdev_id_check_en;
+	bool beacon_prot;
 
 	struct wmi_wmm_params_all_arg wmm_params;
 	struct list_head list;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88b59f3ff87a..58392484dbb5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1454,11 +1454,13 @@ static int ath12k_mac_remove_vendor_ie(struct sk_buff *skb, unsigned int oui,
 	return 0;
 }
 
-static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_buff *bcn,
+static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif,
+				     struct ath12k_link_vif *tx_arvif,
+				     struct sk_buff *bcn,
 				     u8 bssid_index, bool *nontx_profile_found)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)bcn->data;
-	const struct element *elem, *nontx, *index, *nie;
+	const struct element *elem, *nontx, *index, *nie, *ext_cap_ie;
 	const u8 *start, *tail;
 	u16 rem_len;
 	u8 i;
@@ -1476,6 +1478,11 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
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
@@ -1518,6 +1525,19 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 
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
@@ -1566,11 +1586,11 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
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
 
@@ -1639,9 +1659,9 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
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
@@ -4766,6 +4786,16 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
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
@@ -4997,13 +5027,9 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	/* BIP needs to be done in software */
-	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
-	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
-	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
-	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
+	/* IGTK needs to be done in host software */
+	if (key->keyidx == 4 || key->keyidx == 5)
 		return 1;
-	}
 
 	if (key->keyidx > WMI_MAX_KEY_INDEX)
 		return -ENOSPC;
@@ -12089,6 +12115,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	}
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_PUNCT);
+	if (test_bit(WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT, ab->wmi_ab.svc_map))
+		wiphy_ext_feature_set(hw->wiphy, NL80211_EXT_FEATURE_BEACON_PROTECTION);
 
 	ath12k_reg_init(hw);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 60e2444fe08c..bd16d41d42ec 100644
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
index ac18f75e0449..cf42c1b402ea 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2216,6 +2216,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_PER_PEER_HTT_STATS_RESET = 213,
 	WMI_TLV_SERVICE_FREQINFO_IN_METADATA = 219,
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
+	WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT = 244,
 	WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT = 253,
 
 	WMI_MAX_EXT_SERVICE = 256,
@@ -3689,6 +3690,8 @@ struct ath12k_wmi_ftm_event {
 #define WMI_EMA_BEACON_FIRST    GENMASK(23, 16)
 #define WMI_EMA_BEACON_LAST     GENMASK(31, 24)
 
+#define WMI_BEACON_PROTECTION_EN_BIT	BIT(0)
+
 struct ath12k_wmi_bcn_tmpl_ema_arg {
 	u8 bcn_cnt;
 	u8 bcn_index;
@@ -4656,7 +4659,7 @@ enum wmi_ap_ps_peer_param {
 
 #define DISABLE_SIFS_RESPONSE_TRIGGER 0
 
-#define WMI_MAX_KEY_INDEX   3
+#define WMI_MAX_KEY_INDEX   7
 #define WMI_MAX_KEY_LEN     32
 
 enum wmi_key_type {

base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
-- 
2.34.1


