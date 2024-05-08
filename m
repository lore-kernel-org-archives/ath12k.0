Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA98CC25B4F
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 00:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSJLoPr7CB+wfss1wrta30jordtDmhFz7Eqrk+IgNJ4=; b=vAJWoDOW4OnVvOJXW5cmknmh4q
	Ag5LClzTV3UVifIpWbAT9DuslWeFo4usIl2lLy4WhaVAlvOtAt92irgP8F79nfdCKBAXfPscUnI5i
	3859coDJSk3JAdFW/uRVIpkNaXKO94EOZAXWMsKqAcVMA1N4us/eTQzscBiehaKAFHVSPBQDKQ/Gg
	RQYz2x45AC7zskjLV8cqXVOrBLMuviU+2kcrhJFev1Rd8FSwkRTaXhmCJ2HsTKM7LWvum5fdqaTo5
	XJ7Af/VljT2AyE88Z4/07VMF/OrEkfrXTHDhp3nY3k4WzdE4W1p7adlpbI5kYH+OCzdAY6ToxhR3n
	4JM5WO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4V3f-0000000DWFY-14Y2
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 00:21:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4V3W-0000000DW63-0WuW
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 00:21:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447Np21J004785;
	Wed, 8 May 2024 00:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=YSJLoPr7CB+wfss1wrta
	30jordtDmhFz7Eqrk+IgNJ4=; b=YsjEZpxw/SJ21ChoWvDCylB6CGUOL2fLJHVF
	nA08Nb0DnWJ6cmf9yQWjBXP6y3tooCdXNnY3avkOl7Dq8iZagGvRkrF/w1HcPlt4
	60gBaNyQ0ktgGisJk21xOj1k0siJ2radWNIfA8Ww7uEcEjkZzBEN36fHD2SwW5lh
	mcPDL9TwP8sYM/nAphmn3Wpj+3suhdf4dJwp4J493q0mdx99JsO6ucWbu0M9rNUu
	X6tC9x3965C2YwTEXQ4Xtf7t5O2xM4EETewY1RQB+P6iPMD3gwKQ4IHsHF3FD1Tb
	Ic68NwGUYOnqUKmT1duGXrGmz+EW7N/L74i24EI4ufRU9zAATA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyspr0jfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 00:21:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4480L7Bd015594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 00:21:07 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 17:21:06 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH V4 05/10] wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
Date: Tue, 7 May 2024 17:20:50 -0700
Message-ID: <20240508002055.17705-6-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TM2JLIOXNUfupsOSFYJmhxQ8w6In6pU0
X-Proofpoint-GUID: TM2JLIOXNUfupsOSFYJmhxQ8w6In6pU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_16,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405070171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_172110_335587_1719EDF2 
X-CRM114-Status: GOOD (  13.84  )
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

Generate rx and tx mcs maps in ath12k_mac_set_hemcsmap() based
on number of supported tx/rx chains and set them in supported
mcs/nss for HE capabilities.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 40 ++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e60da45b9c7f..2f99a1c97b85 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5162,20 +5162,40 @@ static __le16 ath12k_mac_setup_he_6ghz_cap(struct ath12k_pdev_cap *pcap,
 	return cpu_to_le16(bcap->he_6ghz_capa);
 }
 
-static void ath12k_mac_set_hemcsmap(struct ath12k_band_cap *band_cap,
+static void ath12k_mac_set_hemcsmap(struct ath12k *ar,
+				    struct ath12k_pdev_cap *cap,
 				    struct ieee80211_sta_he_cap *he_cap)
 {
 	struct ieee80211_he_mcs_nss_supp *mcs_nss = &he_cap->he_mcs_nss_supp;
+	u16 txmcs_map, rxmcs_map;
+	u32 i;
+
+	rxmcs_map = 0;
+	txmcs_map = 0;
+	for (i = 0; i < 8; i++) {
+		if (i < ar->num_tx_chains &&
+		    (ar->cfg_tx_chainmask >> cap->tx_chain_mask_shift) & BIT(i))
+			txmcs_map |= IEEE80211_HE_MCS_SUPPORT_0_11 << (i * 2);
+		else
+			txmcs_map |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+
+		if (i < ar->num_rx_chains &&
+		    (ar->cfg_rx_chainmask >> cap->tx_chain_mask_shift) & BIT(i))
+			rxmcs_map |= IEEE80211_HE_MCS_SUPPORT_0_11 << (i * 2);
+		else
+			rxmcs_map |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+	}
 
-	mcs_nss->rx_mcs_80 = cpu_to_le16(band_cap->he_mcs & 0xffff);
-	mcs_nss->tx_mcs_80 = cpu_to_le16(band_cap->he_mcs & 0xffff);
-	mcs_nss->rx_mcs_160 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-	mcs_nss->tx_mcs_160 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-	mcs_nss->rx_mcs_80p80 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-	mcs_nss->tx_mcs_80p80 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	mcs_nss->rx_mcs_80 = cpu_to_le16(rxmcs_map & 0xffff);
+	mcs_nss->tx_mcs_80 = cpu_to_le16(txmcs_map & 0xffff);
+	mcs_nss->rx_mcs_160 = cpu_to_le16(rxmcs_map & 0xffff);
+	mcs_nss->tx_mcs_160 = cpu_to_le16(txmcs_map & 0xffff);
+	mcs_nss->rx_mcs_80p80 = cpu_to_le16(rxmcs_map & 0xffff);
+	mcs_nss->tx_mcs_80p80 = cpu_to_le16(txmcs_map & 0xffff);
 }
 
-static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
+static void ath12k_mac_copy_he_cap(struct ath12k *ar,
+				   struct ath12k_band_cap *band_cap,
 				   int iftype, u8 num_tx_chains,
 				   struct ieee80211_sta_he_cap *he_cap)
 {
@@ -5217,7 +5237,7 @@ static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
 		break;
 	}
 
-	ath12k_mac_set_hemcsmap(band_cap, he_cap);
+	ath12k_mac_set_hemcsmap(ar, &ar->pdev->cap, he_cap);
 	memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
 	if (he_cap_elem->phy_cap_info[6] &
 	    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT)
@@ -5406,7 +5426,7 @@ static int ath12k_mac_copy_sband_iftype_data(struct ath12k *ar,
 
 		data[idx].types_mask = BIT(i);
 
-		ath12k_mac_copy_he_cap(band_cap, i, ar->num_tx_chains, he_cap);
+		ath12k_mac_copy_he_cap(ar, band_cap, i, ar->num_tx_chains, he_cap);
 		if (band == NL80211_BAND_6GHZ) {
 			data[idx].he_6ghz_capa.capa =
 				ath12k_mac_setup_he_6ghz_cap(cap, band_cap);
-- 
2.17.1


