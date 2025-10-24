Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61707CCF9E6
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLRqqQFx4FdldyN44zg/ySSFA4KDzMjdSY/d4qgS6TE=; b=VrwTwt6O5FOF4l3fT5cUUhRRc7
	b1Arv/xR0k6TM9DyttjdFTeQZNNt8xzPNLD6yA2qbl4fo1JBFjS/vBKvtCPl3wAdjV0Qoa6UT2Nyu
	yKNtpUiKn8fGTi0Wqph0iqmKI4UQ3RyEZIkN8Yr38IMdWMGi0kxb6nZcMispUlwjhXINq6heDiS6j
	GDg5an8N7gL45TohZnoUqY3UKEUahSIvk+IfFVjK+pwmRlSkOnhvSeGtoivpSYOvQVSD5n2LleTXj
	CaH3l5VWl3iVJ8DL0QiopZ7HfxtxLTyV/CbEwm0Mjt6Cg1QTkeLb/7TH4n6Y8lF32sjrXZkYxu67D
	Jut+hJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5X2-00000007tVv-0CYj;
	Fri, 24 Oct 2025 00:19:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wz-00000007tTp-2DKA
	for ath12k@bombadil.infradead.org;
	Fri, 24 Oct 2025 00:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sLRqqQFx4FdldyN44zg/ySSFA4KDzMjdSY/d4qgS6TE=; b=dVEN9W15kiYYvqu7ML0eEZzpfC
	MRV5rY9gh9O9IMl2MD657gcVrDRBnMw0KZHBZOO3L2ugHbBJtaq0ArV5ggF/NR0KOK4P8H2gl7ezP
	+kYUXBnaPbTkwDtWrgZnomjvWuCZW7bqkSL7HAuR7sfYXJ7uFrXH/DrpZy33X/XQlc1FFVvbGrUqG
	ENbssXmtz5C90RLmGWZh1Ful7Qas77QNskFHdmh7EEtjaRmGb6I1z+W24iS3WfBMt2X36FfgaRobF
	G5aN18+wijHJ/BkhPxaZcmRe2z5twlGPoumFRvUTURHvKbBgr4bOX8L0xxq1i4bCQw6YI9eyfzKeX
	6U2J2VGA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC4fI-00000001sdi-05DV
	for ath12k@lists.infradead.org;
	Thu, 23 Oct 2025 23:24:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEQPr1014650
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sLRqqQFx4Fd
	ldyN44zg/ySSFA4KDzMjdSY/d4qgS6TE=; b=RJ735jNKGziVU+G5k+PdDLXt1Oi
	hofY8f9fjcY69g73kn+CKuGi6ABzGJTuTi4hSKDHycV+DMiY8kN7Yg6+Iq40mUoq
	xoUcvG4Ur0bOZ1kY4qBYKgkOAEJw7JlDMzMJHfIDJD6dsH0eDq0XkJ7vMc8jEDtl
	i7Rnb1QGV4yW5HcGzljctkQeOOm4kveR9/bWOu2IiPKO0Sv/snVIGpxzdY9nYTwV
	ZeiTWvu3W0U1dIqzijKpeRouWeXCPtkXruTs9Ivsqr9flE6rE1uw7Tymnp4ah3yc
	7Dg/SPF3cRzkCinpQLGM5etVWtYr6wmAPbseTcoXZQO5rxL9+MbS8WI6/7Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0r8r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62f9247dd1so1193062a12.0
        for <ath12k@lists.infradead.org>; Thu, 23 Oct 2025 17:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265177; x=1761869977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLRqqQFx4FdldyN44zg/ySSFA4KDzMjdSY/d4qgS6TE=;
        b=fOoqDXwjEKBpWsubjR/XharrXtj9/XKY/2tdMQHg+lkLg916r282FEoGO7BdL1vloh
         6SsziwcDVQvPSP9hLo83wSEjyZEcJPQAWtAHA+k8j0i1P22r8B5AJgW26dGP/RpSyP2P
         aWvF1AXJwGockNmFV++N5Zv6bJdIjj+Lno/fb7m2GJrEBl0PDEFLCQ6PPKUAz7UOxbS5
         +Kut4JDHSMPwSRG4t6DSVaHAUhrnln9KsOeCNPZfYoz8Gu4Q8Ngb5gyBGHMdFqw7XDEP
         h1pk1QYwic68+Fa4vhOqPkq9nGmduphzqEmtyVYtrWaVkZFPn2QEf6beizZhF9CfaCoC
         /KGg==
X-Gm-Message-State: AOJu0YzgyrlZdeY/e3kt5FeqL3NrjjXmxBZ7Qd8ElJItZljiE+xrCIi4
	js2y93Mbqi1Ioo9qljE23GNZ3gX43+KTYDq6lQKT4lOdM97NRpirWEuf3PokVOmjEyjqPwHyaKK
	nn64AVnFbCGlFL9ytM8zVshSJpdUdi+4wt3Xiz6nsGjTMufJD22iLBV5bf5Dos6Uulr34QvyS
X-Gm-Gg: ASbGnct2Rv8vxv0xZef6v565OiHldRgI+Wgf17O26iuVwAV531NAYOeH9vflh+VN6CJ
	TRjbRqq6l2EqQr2roB1HvnWhc0z+sUOuHPkgOsHXq65A0+07t9060HxitI7Nc4PpnzCiUrWvir9
	rgJD+7C+yGwM+pk2byESOdALI7BGR14eyY/EEIE5ZAMYNcXFYNu7mBrHi1/bzy/iwLlakiENTDN
	WD5TQoOnxhYRc1Qt+EgFvrG7sqhf/NMyWSb7S+Ph2cK2Ti9515tqoIU1g9NXglkayCThHYZ1d+C
	Pzd8X2TtxiDpAlV/UK4C5O6Tc8V9z5cmZfmod1uBTlr4nnlXTCFF+Xy+aI5sELa0ntvtqj1pLJ8
	gMMwgQleOmCABwfkp5+7J4SGXIzL+ejPUIaxPh4JlRHtaNOjKvpWhTOc=
X-Received: by 2002:a05:6a20:9f47:b0:334:9e81:4e5b with SMTP id adf61e73a8af0-33c5fbaadf0mr5191233637.5.1761265177450;
        Thu, 23 Oct 2025 17:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+ozWpKhtNHnU8aRqoMMcfQd69f2qBcbKL7PkB4h+kIQHfxDof3+r3sCOaEE6ZMpZ4wE97tQ==
X-Received: by 2002:a05:6a20:9f47:b0:334:9e81:4e5b with SMTP id adf61e73a8af0-33c5fbaadf0mr5191215637.5.1761265176986;
        Thu, 23 Oct 2025 17:19:36 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb65b3sm3296264a12.8.2025.10.23.17.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:19:36 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>,
        Vishal Kumar <quic_visk@quicinc.com>,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH ath-next 3/6] wifi: ath12k: Add EHT MCS/NSS rates to Peer Assoc
Date: Thu, 23 Oct 2025 17:19:25 -0700
Message-Id: <20251024001928.257356-4-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
References: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX5oohOXrbot+r
 pILnCRb2/OFZPf6pfngiC87Hs8NuGC+Kt3L7/pxpb27hgvQ8eqO8DJLQSmW8PIS8Pf/wyIwzU4J
 fWiwcuNfcOXf9FKTuYRaWTllYsCZ7v+UqKLawfiwPiczDynkKRxaFrXiBOOCnt+VXA1wzmIWPeB
 wjafFBXEi2dZFsOSskTURrfUkdAz5sBO9ZIRPl+9gR/Es9ADLIQEs2hTwPrb4qG8RGiRgtHgiTk
 /0PItCJvi8OZuxS/lhkpxei67Iv+4OfdqYKaZIaglvF2cKEaTbC11NToG+vNoGeZM+5yOXK90DY
 36tLLmETGvrJIHXyRjtAMM/OfBqbhyeHKUvhLoVyonV+60BX2nQ+qm4L1D0XnhiPeamuOrRty7T
 9ZuM8wTQk0SHBukaqt/xjma0OBr6YA==
X-Proofpoint-ORIG-GUID: 7G_GgII-6mhignzuD3I34C80Cv-gUTOM
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fac61a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DPe7GoXiTccg4i4ia6cA:9 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7G_GgII-6mhignzuD3I34C80Cv-gUTOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_002416_331233_3B5A094A 
X-CRM114-Status: GOOD (  16.83  )
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

Add EHT MCS/NSS rate functionality to peer association. As part of
ath12k_peer_assoc_h_eht() add the calculation of EHT MCS/NSS using
intersection of link_sta and phy capability.

ath12k_mac_max_eht_mcs_nss() function is utilized when comparing the
max NSS of link STA and phy capability since in split phy case, phy
supports max NSS of 2 for 5G band.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Co-developed-by: Vishal Kumar <quic_visk@quicinc.com>
Signed-off-by: Vishal Kumar <quic_visk@quicinc.com>
Co-developed-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 110 ++++++++++++++++++++++++--
 1 file changed, 103 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 397fe320e558..eff1ec1eb4e0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -545,6 +545,18 @@ ath12k_mac_max_eht_nss(const u16 eht_mcs_mask[NL80211_EHT_NSS_MAX])
 	return 1;
 }
 
+static u32
+ath12k_mac_max_eht_mcs_nss(const u8 *eht_mcs, int eht_mcs_set_size)
+{
+	int i;
+	u8 nss = 0;
+
+	for (i = 0; i < eht_mcs_set_size; i++)
+		nss = max(nss, u8_get_bits(eht_mcs[i], IEEE80211_EHT_MCS_NSS_RX));
+
+	return nss;
+}
+
 static u8 ath12k_parse_mpdudensity(u8 mpdudensity)
 {
 /*  From IEEE Std 802.11-2020 defined values for "Minimum MPDU Start Spacing":
@@ -3016,6 +3028,18 @@ static enum wmi_phy_mode ath12k_mac_get_phymode_eht(struct ath12k *ar,
 	return MODE_UNKNOWN;
 }
 
+static bool
+ath12k_peer_assoc_h_eht_masked(const u16 eht_mcs_mask[NL80211_EHT_NSS_MAX])
+{
+	int nss;
+
+	for (nss = 0; nss < NL80211_EHT_NSS_MAX; nss++)
+		if (eht_mcs_mask[nss])
+			return false;
+
+	return true;
+}
+
 static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 					struct ath12k_link_vif *arvif,
 					struct ath12k_link_sta *arsta,
@@ -3027,6 +3051,7 @@ static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 	const u8 *ht_mcs_mask;
 	const u16 *vht_mcs_mask;
 	const u16 *he_mcs_mask;
+	const u16 *eht_mcs_mask;
 	enum wmi_phy_mode phymode = MODE_UNKNOWN;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -3041,6 +3066,7 @@ static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 	ht_mcs_mask = arvif->bitrate_mask.control[band].ht_mcs;
 	vht_mcs_mask = arvif->bitrate_mask.control[band].vht_mcs;
 	he_mcs_mask = arvif->bitrate_mask.control[band].he_mcs;
+	eht_mcs_mask = arvif->bitrate_mask.control[band].eht_mcs;
 
 	link_sta = ath12k_mac_get_link_sta(arsta);
 	if (!link_sta) {
@@ -3051,7 +3077,8 @@ static void ath12k_peer_assoc_h_phymode(struct ath12k *ar,
 
 	switch (band) {
 	case NL80211_BAND_2GHZ:
-		if (link_sta->eht_cap.has_eht) {
+		if (link_sta->eht_cap.has_eht &&
+		    !ath12k_peer_assoc_h_eht_masked(eht_mcs_mask)) {
 			if (link_sta->bandwidth == IEEE80211_STA_RX_BW_40)
 				phymode = MODE_11BE_EHT40_2G;
 			else
@@ -3197,16 +3224,21 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 {
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
+	const struct ieee80211_eht_mcs_nss_supp *own_eht_mcs_nss_supp;
 	const struct ieee80211_eht_mcs_nss_supp_20mhz_only *bw_20;
+	const struct ieee80211_sta_eht_cap *eht_cap, *own_eht_cap;
+	const struct ieee80211_sband_iftype_data *iftd;
 	const struct ieee80211_eht_mcs_nss_supp_bw *bw;
-	const struct ieee80211_sta_eht_cap *eht_cap;
 	const struct ieee80211_sta_he_cap *he_cap;
 	struct ieee80211_link_sta *link_sta;
 	struct ieee80211_bss_conf *link_conf;
 	struct cfg80211_chan_def def;
+	bool user_rate_valid = true;
 	enum nl80211_band band;
+	int eht_nss, nss_idx;
 	u32 *rx_mcs, *tx_mcs;
 	u16 *eht_mcs_mask;
+	u8 max_nss = 0;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -3234,6 +3266,16 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 	band = def.chan->band;
 	eht_mcs_mask = arvif->bitrate_mask.control[band].eht_mcs;
 
+	iftd = ieee80211_get_sband_iftype_data(&ar->mac.sbands[band], vif->type);
+	if (!iftd) {
+		ath12k_warn(ar->ab,
+			    "unable to access iftype_data in struct ieee80211_supported_band\n");
+		return;
+	}
+
+	own_eht_cap = &iftd->eht_cap;
+	own_eht_mcs_nss_supp = &own_eht_cap->eht_mcs_nss_supp;
+
 	arg->eht_flag = true;
 
 	if ((eht_cap->eht_cap_elem.phy_cap_info[5] &
@@ -3250,6 +3292,28 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 	rx_mcs = arg->peer_eht_rx_mcs_set;
 	tx_mcs = arg->peer_eht_tx_mcs_set;
 
+	eht_nss = ath12k_mac_max_eht_mcs_nss((void *)own_eht_mcs_nss_supp,
+					     sizeof(*own_eht_mcs_nss_supp));
+	if (eht_nss > link_sta->rx_nss) {
+		user_rate_valid = false;
+		for (nss_idx = (link_sta->rx_nss - 1); nss_idx >= 0; nss_idx--) {
+			if (eht_mcs_mask[nss_idx]) {
+				user_rate_valid = true;
+				break;
+			}
+		}
+	}
+
+	if (!user_rate_valid) {
+		ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+			   "Setting eht range MCS value to peer supported nss %d for peer %pM\n",
+			   link_sta->rx_nss, arsta->addr);
+		eht_mcs_mask[link_sta->rx_nss - 1] = eht_mcs_mask[eht_nss - 1];
+	}
+
+	bw_20 = &eht_cap->eht_mcs_nss_supp.only_20mhz;
+	bw = &eht_cap->eht_mcs_nss_supp.bw._80;
+
 	switch (link_sta->bandwidth) {
 	case IEEE80211_STA_RX_BW_320:
 		bw = &eht_cap->eht_mcs_nss_supp.bw._320;
@@ -3274,11 +3338,8 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 		arg->peer_eht_mcs_count++;
 		fallthrough;
 	default:
-		if ((he_cap->he_cap_elem.phy_cap_info[0] &
-		     (IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
-		      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
-		      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G |
-		      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)) == 0) {
+		if (!(link_sta->he_cap.he_cap_elem.phy_cap_info[0] &
+		      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_MASK_ALL)) {
 			bw_20 = &eht_cap->eht_mcs_nss_supp.only_20mhz;
 
 			ath12k_mac_set_eht_mcs(bw_20->rx_tx_mcs7_max_nss,
@@ -3305,6 +3366,41 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 
 	arg->punct_bitmap = ~arvif->punct_bitmap;
 	arg->eht_disable_mcs15 = link_conf->eht_disable_mcs15;
+
+	if (!(link_sta->he_cap.he_cap_elem.phy_cap_info[0] &
+	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_MASK_ALL)) {
+		if (bw_20->rx_tx_mcs13_max_nss)
+			max_nss = max(max_nss, u8_get_bits(bw_20->rx_tx_mcs13_max_nss,
+							   IEEE80211_EHT_MCS_NSS_RX));
+		if (bw_20->rx_tx_mcs11_max_nss)
+			max_nss = max(max_nss, u8_get_bits(bw_20->rx_tx_mcs11_max_nss,
+							   IEEE80211_EHT_MCS_NSS_RX));
+		if (bw_20->rx_tx_mcs9_max_nss)
+			max_nss = max(max_nss, u8_get_bits(bw_20->rx_tx_mcs9_max_nss,
+							   IEEE80211_EHT_MCS_NSS_RX));
+		if (bw_20->rx_tx_mcs7_max_nss)
+			max_nss = max(max_nss, u8_get_bits(bw_20->rx_tx_mcs7_max_nss,
+							   IEEE80211_EHT_MCS_NSS_RX));
+	} else {
+		if (bw->rx_tx_mcs13_max_nss)
+			max_nss = max(max_nss, u8_get_bits(bw->rx_tx_mcs13_max_nss,
+							   IEEE80211_EHT_MCS_NSS_RX));
+		if (bw->rx_tx_mcs11_max_nss)
+			max_nss = max(max_nss, u8_get_bits(bw->rx_tx_mcs11_max_nss,
+							   IEEE80211_EHT_MCS_NSS_RX));
+		if (bw->rx_tx_mcs9_max_nss)
+			max_nss = max(max_nss, u8_get_bits(bw->rx_tx_mcs9_max_nss,
+							   IEEE80211_EHT_MCS_NSS_RX));
+	}
+
+	max_nss = min(max_nss, (uint8_t)eht_nss);
+
+	arg->peer_nss = min(link_sta->rx_nss, max_nss);
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+		   "mac eht peer %pM nss %d mcs cnt %d ru_punct_bitmap 0x%x\n",
+		   arsta->addr, arg->peer_nss, arg->peer_eht_mcs_count,
+		   arg->punct_bitmap);
 }
 
 static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
-- 
2.34.1


