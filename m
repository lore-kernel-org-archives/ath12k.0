Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5172CCD193
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 00:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l69cvvDCLbApAP5vEn7BonPxlr+l+ab0iiEcIRXse3o=; b=QQWMWi7voeAvuvkZUuYaNCL1tn
	/D/1W9fsUvkg6GaIrZneyPFI9dCGuz4o/xfk8ijMiQs14prl58Hxa7t/t+GcpGkxbh3p9MYK9oc2Y
	+xaj1DXE5a8yxq51yFCY9ZwneYp23Yu5h4fGIlwdNZg4uy3WWDmmPnUbs+gIxGYwDLxTa+ERTOph+
	++8lthYwHgNRJ2mjHDWQk18KnHogc87MbTyeC60YuumxpGKi8sJ4l1cjE3H0GtF3iSJdm6L1rN/rG
	mGf/N3o40w6rMV+XOyK43IDsBFGh1pnhKsvZZL4cAT3RLMbTx5TZiBjOIHtq2zEh4z/nJkjdqprSv
	epFzXqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wv-00000007tRI-1xib;
	Fri, 24 Oct 2025 00:19:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wt-00000007tQL-0iPe
	for ath12k@lists.infradead.org;
	Fri, 24 Oct 2025 00:19:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEe6GM005702
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l69cvvDCLbA
	pAP5vEn7BonPxlr+l+ab0iiEcIRXse3o=; b=LBUKed2zsi4IwJ0y2IymPiygs3K
	NJbC3MIQiavcOw/6s9Mu496R++EGGY3aLdVN6j0bAzUoTa+CY0Bj8chF8jUsSUnG
	MVqEI8gTFq6YDkdXbDNFqc9UUcMNdLzzt/0DdfUigiuf+lOCUQbHrHAI936Q6XgP
	BCExzCf8B3ahqqGOqWKprdD4I2UMcBCN2gez3VoCF1WqRqP8W3ho07qoTyDRAk2F
	7OJgiOHkBV2yK1F+L9sXisrhEf5a9W3xz93H3GVR4M3rdTcc9M1LKzsE194c9/tx
	3o76DszJiaqM7rVuH3Ig2KoaybioSDUbE0ONCgNQ7VODdu2OWmPyNaYjklg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27ja74d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-798920399a6so2369526b3a.0
        for <ath12k@lists.infradead.org>; Thu, 23 Oct 2025 17:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265177; x=1761869977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l69cvvDCLbApAP5vEn7BonPxlr+l+ab0iiEcIRXse3o=;
        b=QZeGhR6n4/1lA1P4cAVqBNvdblKteyk/3k8pgiBC1b62a+SbpM/daKs95IiA7LmK09
         EO7B760sHnwC9sbZQuk4pfEMaCFJtaWrSxTVQdTESREuGy2IvsgJbaEK8hLWEsSnOoVN
         SzAn6Yttpft8BiZOkAl5jfRzg9fC5mYbdeBSGUS1lAlnD0gF8EwZIBA96bbBkkGb3i8c
         yXpD6FqPktogtkewqFg9bV56erodtx6HtdBOn2AR+2gIw4q7gJAI1BUel715UbrDvnJb
         5KjY84NACMn+e+nSajxalFRRe8UIJSaoZwj3U2EPR7S4Hksvu4a7XQJV5o1YJ2b1YEv/
         X7ew==
X-Gm-Message-State: AOJu0YzxBQZ5Fsw9Mske2/AfFyG+IfCaCArybLSCYhMtImRGTFL7Mmr5
	f9AujpvWWUm/bGAXyWRMoQwafND9/v+Godm3AkDDc4k+3Jt3i/JBptn+oYyFwbbjmx/tWqp/Gy4
	9Rki5tjstOqRyy2qGPnZXSy/j6DefxCnumcg3Sabniyl5fL97zZXTP+2Oua2gBYBvb4aqodTn
X-Gm-Gg: ASbGncu/W3tJspLG/op5Es6nP1VuQL/CtQ+bIDW1TTldoR/XBPWmJLzidD9qFhNMIdv
	gjG8mDexx2PwYYJSaipOm58eg5VSSqIyQ4a5vxgmKwJ/y2jS0TrAm47tAxJX4yMKg/6SfeKFOnI
	SyQZ5N+buchVwstx5QTOAKMQ7Wh0u56ESw5wfBtMf5FcxetzXHHyKW+VP9IhA9rf1z/sL/JTAH2
	EnRM+S7dgpI2jA03g5qGWRkOUDtZ8u0GOpQztbskUZ8uwVnVxTIRV9ZFHDrT0dRIAcXX7sabqRK
	4gL1+GZsC46ejuaR32YAbQGmoJ8EGdsCQoqbSjs+2VoYi2B5RDGXX9PuvyUPqQvc/XOIdd9kBHj
	K6bC2kgycjUGXMTMrwkklO6XaJUfhRt5okSW5vlHnUhMUQzCVbz1/4dU=
X-Received: by 2002:a05:6a21:4508:b0:331:fcd9:b3c1 with SMTP id adf61e73a8af0-33db48e8382mr1042965637.18.1761265176500;
        Thu, 23 Oct 2025 17:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFSA1c2umulesR4kxVCNn6/jNfNkV/xqlufdqol5DEU4AcMs/DEeXvPZr1Nq/PEhYseIN3Bg==
X-Received: by 2002:a05:6a21:4508:b0:331:fcd9:b3c1 with SMTP id adf61e73a8af0-33db48e8382mr1042939637.18.1761265175965;
        Thu, 23 Oct 2025 17:19:35 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb65b3sm3296264a12.8.2025.10.23.17.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:19:35 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH ath-next 2/6] wifi: ath12k: add EHT rate handling to existing set rate functions
Date: Thu, 23 Oct 2025 17:19:24 -0700
Message-Id: <20251024001928.257356-3-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
References: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX11h1oViHLHOO
 kmW59KlgstvEFcBFDG3im95q1JbwYJbxQFcVqFj89DNdq+p2R5uJX+QaTBw1UkNfLQUI7GnVa5M
 29GJqEqCDC5s7O+bNXL/jRzeuPxEtwuVdLx5B8dtdC3jODqaZYfFFlf/gaFJHojs25oeZMfQOs6
 0ncqlCl8J8hvlGoNA0OvoMQiXJRZKpoA1s+o6Xkksn91L6mOFnFwwcj62/lqWQgQKdaLfGtgZuc
 +7fL1PDDbtGNQPvewDXHJlKKZnNoLF+MSLHEdnJvKc4yNOxDMLZM9Rxr5iSeZkhWrxh4VoEd2cj
 dATIBzjpJxcFQK+Jr9oWyiJPDDg/mMsBR+xAJU6NqsOgR/maTLiyy83fDwQkRgFg20f/mFzTFXg
 g2U5V+YbskSWuhhf3GXXOXolniG7CA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fac61a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=HBFIOfVPvcCZsO4ajaQA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 09Ux2GR9_J0UT-3umKAKZM6ClYRNCwmZ
X-Proofpoint-ORIG-GUID: 09Ux2GR9_J0UT-3umKAKZM6ClYRNCwmZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_171939_332296_356FBF11 
X-CRM114-Status: GOOD (  18.52  )
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

Add EHT rate handling to the existing rate functions that validate,
prepare and set rates.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Co-developed-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 215 +++++++++++++++++++++-----
 1 file changed, 173 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fd49a0953470..397fe320e558 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -533,6 +533,18 @@ ath12k_mac_max_he_nss(const u16 he_mcs_mask[NL80211_HE_NSS_MAX])
 	return 1;
 }
 
+static u32
+ath12k_mac_max_eht_nss(const u16 eht_mcs_mask[NL80211_EHT_NSS_MAX])
+{
+	int nss;
+
+	for (nss = NL80211_EHT_NSS_MAX - 1; nss >= 0; nss--)
+		if (eht_mcs_mask[nss])
+			return nss + 1;
+
+	return 1;
+}
+
 static u8 ath12k_parse_mpdudensity(u8 mpdudensity)
 {
 /*  From IEEE Std 802.11-2020 defined values for "Minimum MPDU Start Spacing":
@@ -3102,37 +3114,50 @@ static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 	WARN_ON(phymode == MODE_UNKNOWN);
 }
 
+#define ATH12K_EHT_MCS_7_ENABLED	0x00FF
+#define ATH12K_EHT_MCS_9_ENABLED	0x0300
+#define ATH12K_EHT_MCS_11_ENABLED	0x0C00
+#define ATH12K_EHT_MCS_13_ENABLED	0x3000
+
 static void ath12k_mac_set_eht_mcs(u8 rx_tx_mcs7, u8 rx_tx_mcs9,
 				   u8 rx_tx_mcs11, u8 rx_tx_mcs13,
-				   u32 *rx_mcs, u32 *tx_mcs)
-{
-	*rx_mcs = 0;
-	u32p_replace_bits(rx_mcs,
-			  u8_get_bits(rx_tx_mcs7, IEEE80211_EHT_MCS_NSS_RX),
-			  WMI_EHT_MCS_NSS_0_7);
-	u32p_replace_bits(rx_mcs,
-			  u8_get_bits(rx_tx_mcs9, IEEE80211_EHT_MCS_NSS_RX),
-			  WMI_EHT_MCS_NSS_8_9);
-	u32p_replace_bits(rx_mcs,
-			  u8_get_bits(rx_tx_mcs11, IEEE80211_EHT_MCS_NSS_RX),
-			  WMI_EHT_MCS_NSS_10_11);
-	u32p_replace_bits(rx_mcs,
-			  u8_get_bits(rx_tx_mcs13, IEEE80211_EHT_MCS_NSS_RX),
-			  WMI_EHT_MCS_NSS_12_13);
-
-	*tx_mcs = 0;
-	u32p_replace_bits(tx_mcs,
-			  u8_get_bits(rx_tx_mcs7, IEEE80211_EHT_MCS_NSS_TX),
-			  WMI_EHT_MCS_NSS_0_7);
-	u32p_replace_bits(tx_mcs,
-			  u8_get_bits(rx_tx_mcs9, IEEE80211_EHT_MCS_NSS_TX),
-			  WMI_EHT_MCS_NSS_8_9);
-	u32p_replace_bits(tx_mcs,
-			  u8_get_bits(rx_tx_mcs11, IEEE80211_EHT_MCS_NSS_TX),
-			  WMI_EHT_MCS_NSS_10_11);
-	u32p_replace_bits(tx_mcs,
-			  u8_get_bits(rx_tx_mcs13, IEEE80211_EHT_MCS_NSS_TX),
-			  WMI_EHT_MCS_NSS_12_13);
+				   u32 *rx_mcs, u32 *tx_mcs,
+				   const u16 eht_mcs_limit[NL80211_EHT_NSS_MAX])
+{
+	int nss;
+	u8 mcs_7 = 0, mcs_9 = 0, mcs_11 = 0, mcs_13 = 0;
+	u8 peer_mcs_7, peer_mcs_9, peer_mcs_11, peer_mcs_13;
+
+	for (nss = 0; nss < NL80211_EHT_NSS_MAX; nss++) {
+		if (eht_mcs_limit[nss] & ATH12K_EHT_MCS_7_ENABLED)
+			mcs_7++;
+		if (eht_mcs_limit[nss] & ATH12K_EHT_MCS_9_ENABLED)
+			mcs_9++;
+		if (eht_mcs_limit[nss] & ATH12K_EHT_MCS_11_ENABLED)
+			mcs_11++;
+		if (eht_mcs_limit[nss] & ATH12K_EHT_MCS_13_ENABLED)
+			mcs_13++;
+	}
+
+	peer_mcs_7 = u8_get_bits(rx_tx_mcs7, IEEE80211_EHT_MCS_NSS_RX);
+	peer_mcs_9 = u8_get_bits(rx_tx_mcs9, IEEE80211_EHT_MCS_NSS_RX);
+	peer_mcs_11 = u8_get_bits(rx_tx_mcs11, IEEE80211_EHT_MCS_NSS_RX);
+	peer_mcs_13 = u8_get_bits(rx_tx_mcs13, IEEE80211_EHT_MCS_NSS_RX);
+
+	*rx_mcs = u32_encode_bits(min(peer_mcs_7, mcs_7), WMI_EHT_MCS_NSS_0_7) |
+		  u32_encode_bits(min(peer_mcs_9, mcs_9), WMI_EHT_MCS_NSS_8_9) |
+		  u32_encode_bits(min(peer_mcs_11, mcs_11), WMI_EHT_MCS_NSS_10_11) |
+		  u32_encode_bits(min(peer_mcs_13, mcs_13), WMI_EHT_MCS_NSS_12_13);
+
+	peer_mcs_7 = u8_get_bits(rx_tx_mcs7, IEEE80211_EHT_MCS_NSS_TX);
+	peer_mcs_9 = u8_get_bits(rx_tx_mcs9, IEEE80211_EHT_MCS_NSS_TX);
+	peer_mcs_11 = u8_get_bits(rx_tx_mcs11, IEEE80211_EHT_MCS_NSS_TX);
+	peer_mcs_13 = u8_get_bits(rx_tx_mcs13, IEEE80211_EHT_MCS_NSS_TX);
+
+	*tx_mcs = u32_encode_bits(min(peer_mcs_7, mcs_7), WMI_EHT_MCS_NSS_0_7) |
+		  u32_encode_bits(min(peer_mcs_9, mcs_9), WMI_EHT_MCS_NSS_8_9) |
+		  u32_encode_bits(min(peer_mcs_11, mcs_11), WMI_EHT_MCS_NSS_10_11) |
+		  u32_encode_bits(min(peer_mcs_13, mcs_13), WMI_EHT_MCS_NSS_12_13);
 }
 
 static void ath12k_mac_set_eht_ppe_threshold(const u8 *ppe_thres,
@@ -3171,13 +3196,17 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 				    struct ath12k_wmi_peer_assoc_arg *arg)
 {
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	const struct ieee80211_eht_mcs_nss_supp_20mhz_only *bw_20;
 	const struct ieee80211_eht_mcs_nss_supp_bw *bw;
 	const struct ieee80211_sta_eht_cap *eht_cap;
 	const struct ieee80211_sta_he_cap *he_cap;
 	struct ieee80211_link_sta *link_sta;
 	struct ieee80211_bss_conf *link_conf;
+	struct cfg80211_chan_def def;
+	enum nl80211_band band;
 	u32 *rx_mcs, *tx_mcs;
+	u16 *eht_mcs_mask;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -3199,6 +3228,12 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 	if (!he_cap->has_he || !eht_cap->has_eht)
 		return;
 
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
+		return;
+
+	band = def.chan->band;
+	eht_mcs_mask = arvif->bitrate_mask.control[band].eht_mcs;
+
 	arg->eht_flag = true;
 
 	if ((eht_cap->eht_cap_elem.phy_cap_info[5] &
@@ -3223,7 +3258,8 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 				       bw->rx_tx_mcs11_max_nss,
 				       bw->rx_tx_mcs13_max_nss,
 				       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_320],
-				       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_320]);
+				       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_320],
+				       eht_mcs_mask);
 		arg->peer_eht_mcs_count++;
 		fallthrough;
 	case IEEE80211_STA_RX_BW_160:
@@ -3233,7 +3269,8 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 				       bw->rx_tx_mcs11_max_nss,
 				       bw->rx_tx_mcs13_max_nss,
 				       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_160],
-				       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_160]);
+				       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_160],
+				       eht_mcs_mask);
 		arg->peer_eht_mcs_count++;
 		fallthrough;
 	default:
@@ -3249,7 +3286,8 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 					       bw_20->rx_tx_mcs11_max_nss,
 					       bw_20->rx_tx_mcs13_max_nss,
 					       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80],
-					       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80]);
+					       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80],
+					       eht_mcs_mask);
 		} else {
 			bw = &eht_cap->eht_mcs_nss_supp.bw._80;
 			ath12k_mac_set_eht_mcs(bw->rx_tx_mcs9_max_nss,
@@ -3257,7 +3295,8 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 					       bw->rx_tx_mcs11_max_nss,
 					       bw->rx_tx_mcs13_max_nss,
 					       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80],
-					       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80]);
+					       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80],
+					       eht_mcs_mask);
 		}
 
 		arg->peer_eht_mcs_count++;
@@ -3875,6 +3914,8 @@ static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
 		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
 		memset(arvif->bitrate_mask.control[i].he_mcs, 0xff,
 		       sizeof(arvif->bitrate_mask.control[i].he_mcs));
+		memset(arvif->bitrate_mask.control[i].eht_mcs, 0xff,
+		       sizeof(arvif->bitrate_mask.control[i].eht_mcs));
 	}
 
 	/* Handle MLO related assignments */
@@ -5784,6 +5825,20 @@ ath12k_mac_bitrate_mask_num_he_rates(struct ath12k *ar,
 	return num_rates;
 }
 
+static int
+ath12k_mac_bitrate_mask_num_eht_rates(struct ath12k *ar,
+				      enum nl80211_band band,
+				      const struct cfg80211_bitrate_mask *mask)
+{
+	int num_rates = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mask->control[band].eht_mcs); i++)
+		num_rates += hweight16(mask->control[band].eht_mcs[i]);
+
+	return num_rates;
+}
+
 static int
 ath12k_mac_set_peer_vht_fixed_rate(struct ath12k_link_vif *arvif,
 				   struct ath12k_link_sta *arsta,
@@ -11925,6 +11980,9 @@ ath12k_mac_has_single_legacy_rate(struct ath12k *ar,
 	if (ath12k_mac_bitrate_mask_num_he_rates(ar, band, mask))
 		return false;
 
+	if (ath12k_mac_bitrate_mask_num_eht_rates(ar, band, mask))
+		return false;
+
 	return num_rates == 1;
 }
 
@@ -11947,11 +12005,15 @@ ath12k_mac_bitrate_mask_get_single_nss(struct ath12k *ar,
 {
 	struct ieee80211_supported_band *sband = &ar->mac.sbands[band];
 	u16 vht_mcs_map = le16_to_cpu(sband->vht_cap.vht_mcs.tx_mcs_map);
+	const struct ieee80211_sband_iftype_data *data;
 	const struct ieee80211_sta_he_cap *he_cap;
 	u16 he_mcs_map = 0;
+	u16 eht_mcs_map = 0;
 	u8 ht_nss_mask = 0;
 	u8 vht_nss_mask = 0;
 	u8 he_nss_mask = 0;
+	u8 eht_nss_mask = 0;
+	u8 mcs_nss_len;
 	int i;
 
 	/* No need to consider legacy here. Basic rates are always present
@@ -11995,7 +12057,60 @@ ath12k_mac_bitrate_mask_get_single_nss(struct ath12k *ar,
 			return false;
 	}
 
-	if (ht_nss_mask != vht_nss_mask || ht_nss_mask != he_nss_mask)
+	data = ieee80211_get_sband_iftype_data(sband, vif->type);
+
+	mcs_nss_len = ieee80211_eht_mcs_nss_size(&data->he_cap.he_cap_elem,
+						 &data->eht_cap.eht_cap_elem,
+						 false);
+	if (mcs_nss_len == 4) {
+		/* 20 MHz only STA case */
+		const struct ieee80211_eht_mcs_nss_supp_20mhz_only *eht_mcs_nss =
+			&data->eht_cap.eht_mcs_nss_supp.only_20mhz;
+		if (eht_mcs_nss->rx_tx_mcs13_max_nss)
+			eht_mcs_map = 0x1fff;
+		else if (eht_mcs_nss->rx_tx_mcs11_max_nss)
+			eht_mcs_map = 0x07ff;
+		else if (eht_mcs_nss->rx_tx_mcs9_max_nss)
+			eht_mcs_map = 0x01ff;
+		else
+			eht_mcs_map = 0x007f;
+	} else {
+		const struct ieee80211_eht_mcs_nss_supp_bw *eht_mcs_nss;
+
+		switch (mcs_nss_len) {
+		case 9:
+			eht_mcs_nss = &data->eht_cap.eht_mcs_nss_supp.bw._320;
+			break;
+		case 6:
+			eht_mcs_nss = &data->eht_cap.eht_mcs_nss_supp.bw._160;
+			break;
+		case 3:
+			eht_mcs_nss = &data->eht_cap.eht_mcs_nss_supp.bw._80;
+			break;
+		default:
+			return false;
+		}
+
+		if (eht_mcs_nss->rx_tx_mcs13_max_nss)
+			eht_mcs_map = 0x1fff;
+		else if (eht_mcs_nss->rx_tx_mcs11_max_nss)
+			eht_mcs_map = 0x7ff;
+		else
+			eht_mcs_map = 0x1ff;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mask->control[band].eht_mcs); i++) {
+		if (mask->control[band].eht_mcs[i] == 0)
+			continue;
+
+		if (mask->control[band].eht_mcs[i] < eht_mcs_map)
+			eht_nss_mask |= BIT(i);
+		else
+			return false;
+	}
+
+	if (ht_nss_mask != vht_nss_mask || ht_nss_mask != he_nss_mask ||
+	    ht_nss_mask != eht_nss_mask)
 		return false;
 
 	if (ht_nss_mask == 0)
@@ -12147,11 +12262,12 @@ static u32 ath12k_mac_nlgi_to_wmigi(enum nl80211_txrate_gi gi)
 
 static int ath12k_mac_set_rate_params(struct ath12k_link_vif *arvif,
 				      u32 rate, u8 nss, u8 sgi, u8 ldpc,
-				      u8 he_gi, u8 he_ltf, bool he_fixed_rate)
+				      u8 he_gi, u8 he_ltf, bool he_fixed_rate,
+				      bool eht_fixed_rate)
 {
 	struct ieee80211_bss_conf *link_conf;
 	struct ath12k *ar = arvif->ar;
-	bool he_support, gi_ltf_set = false;
+	bool he_support, eht_support, gi_ltf_set = false;
 	u32 vdev_param;
 	u32 param_value;
 	int ret;
@@ -12163,6 +12279,7 @@ static int ath12k_mac_set_rate_params(struct ath12k_link_vif *arvif,
 		return -EINVAL;
 
 	he_support = link_conf->he_support;
+	eht_support = link_conf->eht_support;
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
 		   "mac set rate params vdev %i rate 0x%02x nss 0x%02x sgi 0x%02x ldpc 0x%02x\n",
@@ -12172,7 +12289,10 @@ static int ath12k_mac_set_rate_params(struct ath12k_link_vif *arvif,
 		   "he_gi 0x%02x he_ltf 0x%02x he_fixed_rate %d\n", he_gi,
 		   he_ltf, he_fixed_rate);
 
-	if (!he_support) {
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "eht_fixed_rate %d\n",
+		   eht_fixed_rate);
+
+	if (!he_support && !eht_support) {
 		vdev_param = WMI_VDEV_PARAM_FIXED_RATE;
 		ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
 						    vdev_param, rate);
@@ -12330,15 +12450,16 @@ ath12k_mac_validate_fixed_rate_settings(struct ath12k *ar, enum nl80211_band ban
 					const struct cfg80211_bitrate_mask *mask,
 					unsigned int link_id)
 {
-	bool he_fixed_rate = false, vht_fixed_rate = false;
-	const u16 *vht_mcs_mask, *he_mcs_mask;
+	bool eht_fixed_rate = false, he_fixed_rate = false, vht_fixed_rate = false;
+	const u16 *vht_mcs_mask, *he_mcs_mask, *eht_mcs_mask;
 	struct ieee80211_link_sta *link_sta;
 	struct ath12k_peer *peer, *tmp;
-	u8 vht_nss, he_nss;
+	u8 vht_nss, he_nss, eht_nss;
 	int ret = true;
 
 	vht_mcs_mask = mask->control[band].vht_mcs;
 	he_mcs_mask = mask->control[band].he_mcs;
+	eht_mcs_mask = mask->control[band].eht_mcs;
 
 	if (ath12k_mac_bitrate_mask_num_vht_rates(ar, band, mask) == 1)
 		vht_fixed_rate = true;
@@ -12346,11 +12467,15 @@ ath12k_mac_validate_fixed_rate_settings(struct ath12k *ar, enum nl80211_band ban
 	if (ath12k_mac_bitrate_mask_num_he_rates(ar, band, mask) == 1)
 		he_fixed_rate = true;
 
-	if (!vht_fixed_rate && !he_fixed_rate)
+	if (ath12k_mac_bitrate_mask_num_eht_rates(ar, band, mask) == 1)
+		eht_fixed_rate = true;
+
+	if (!vht_fixed_rate && !he_fixed_rate && !eht_fixed_rate)
 		return true;
 
 	vht_nss = ath12k_mac_max_vht_nss(vht_mcs_mask);
 	he_nss =  ath12k_mac_max_he_nss(he_mcs_mask);
+	eht_nss = ath12k_mac_max_eht_nss(eht_mcs_mask);
 
 	rcu_read_lock();
 	spin_lock_bh(&ar->ab->base_lock);
@@ -12372,6 +12497,11 @@ ath12k_mac_validate_fixed_rate_settings(struct ath12k *ar, enum nl80211_band ban
 				ret = false;
 				goto exit;
 			}
+			if (eht_fixed_rate && (!link_sta->eht_cap.has_eht ||
+					       link_sta->rx_nss < eht_nss)) {
+				ret = false;
+				goto exit;
+			}
 		}
 	}
 exit:
@@ -12403,6 +12533,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	int ret;
 	int num_rates;
 	bool he_fixed_rate = false;
+	bool eht_fixed_rate = false;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
@@ -12527,7 +12658,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	}
 
 	ret = ath12k_mac_set_rate_params(arvif, rate, nss, sgi, ldpc, he_gi,
-					 he_ltf, he_fixed_rate);
+					 he_ltf, he_fixed_rate, eht_fixed_rate);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to set rate params on vdev %i: %d\n",
 			    arvif->vdev_id, ret);
-- 
2.34.1


