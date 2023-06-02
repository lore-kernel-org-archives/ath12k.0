Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CCCC7EE2F
	for <ath12k@archiver.kernel.org>; Fri,  2 Jun 2023 23:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgUFFXIgL0Oq6rSi1j5hXR1IMOrNlWmdn3D9+3lFgB8=; b=Nu0WUK7GA4qWc3
	09rWWwm9IPpHkvBXsI9Oliy3QLkStGeyhpe8nZRmqEJTgDZWcPGUGkyIRY0uAoUW1TD6mfs6IPcPo
	yC4lXnlqc3BYwWYWuyCOlg7cVt07IcyPYcbGVu/th/FG9u1XqrWSG3W9eCWAHuWQ91l6C6nRGGhuD
	vyHuM+hzunUB1wKlzho71meCPjjcaYWlQGtQoa/EzrfNXi0LE/5e9sGZKvyRs2ZXeQam3fibWq3/7
	dnGUxSpsqgdFui+1x9zuddTpQJhs0lQDrQVxGD+BFrFulTzQN0f9CmQOQDMcomojBOaLcGSRIh2nW
	K/ZZuK3UU3+CHKzYdQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EfL-008DTb-1n
	for ath12k@archiver.kernel.org;
	Fri, 02 Jun 2023 23:58:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EfG-008DPI-1H
	for ath12k@lists.infradead.org;
	Fri, 02 Jun 2023 23:58:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352NvInG004540;
	Fri, 2 Jun 2023 23:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=HH2ykZGmZ9UM4SXqbLYyE+IdCaHHAOPLFyRbaBg7S3E=;
 b=YNfTl1gqLUgRhGVvbxmRPu2xYt2R9AFWyw9kayhBXAZK8+hG93pT6UlvmIsgzVMv2aJM
 rF0Js6oE2CD2pVq7FHqbbrBjSS6LXOWU3Z1tsUVacqbtsq9eyEoU0VWj3COjJ5JUtY/C
 6Fj18caf9IcOH9LDlZzAxUFRTbiWj+h/4wzhAZnD+6pzur0Y3X4e1nKa4wCP7hq+/56k
 G+2GCMzYY4c460+Yn9JvxkT1k26xUJXC3A/GtsGGcGh4KwmC4t/RFoih4e3/fzZOUVjK
 CXp2eoohxeHoYb8R6usYLDiQb+d77Q1cAzUOSzlFn60UutaEfdsf2tL5Dzsh5lxWDYpk /w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qyb6f20pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 23:58:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352Nwapg003799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Jun 2023 23:58:36 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 2 Jun 2023 16:58:36 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH v4 04/11] wifi: ath12k: propagate EHT capabilities to userspace
Date: Fri, 2 Jun 2023 16:58:13 -0700
Message-ID: <20230602235820.23912-5-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230602235820.23912-1-quic_alokad@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RmDN8YeSmW5ysnsz5CTAoezAGmiwQfWg
X-Proofpoint-ORIG-GUID: RmDN8YeSmW5ysnsz5CTAoezAGmiwQfWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_18,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_165838_436916_C7F00E86 
X-CRM114-Status: GOOD (  19.77  )
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

Propagate EHT capabilities to the userspace using a new member
'eht_cap' in structure ieee80211_sband_iftype_data.

MCS-NSS capabilities are copied depending on the supported bandwidths
for the given band.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu<quic_pradeepc@quicinc.com>
---
v4: No change from v3.
v3: No change from v2.
v2: No change from v1.

 drivers/net/wireless/ath/ath12k/mac.c | 128 ++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2eec7e114196..d4e97424dbc1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4262,6 +4262,132 @@ static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
 		ath12k_gen_ppe_thresh(&band_cap->he_ppet, he_cap->ppe_thres);
 }
 
+static void
+ath12k_mac_copy_eht_mcs_nss(struct ath12k_band_cap *band_cap,
+			    struct ieee80211_eht_mcs_nss_supp *mcs_nss,
+			    const struct ieee80211_he_cap_elem *he_cap,
+			    const struct ieee80211_eht_cap_elem_fixed *eht_cap)
+{
+	if ((he_cap->phy_cap_info[0] &
+	     (IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
+	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
+	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G |
+	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)) == 0)
+		memcpy(&mcs_nss->only_20mhz, &band_cap->eht_mcs_20_only,
+		       sizeof(struct ieee80211_eht_mcs_nss_supp_20mhz_only));
+
+	if (he_cap->phy_cap_info[0] &
+	    (IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
+	     IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G))
+		memcpy(&mcs_nss->bw._80, &band_cap->eht_mcs_80,
+		       sizeof(struct ieee80211_eht_mcs_nss_supp_bw));
+
+	if (he_cap->phy_cap_info[0] &
+	    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G)
+		memcpy(&mcs_nss->bw._160, &band_cap->eht_mcs_160,
+		       sizeof(struct ieee80211_eht_mcs_nss_supp_bw));
+
+	if (eht_cap->phy_cap_info[0] & IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ)
+		memcpy(&mcs_nss->bw._320, &band_cap->eht_mcs_320,
+		       sizeof(struct ieee80211_eht_mcs_nss_supp_bw));
+}
+
+static void ath12k_mac_copy_eht_ppet_ru(u32 ppet, u8 ppe_thres[], int ru)
+{
+	int i;
+	u32 val = 0;
+	u8 ppet_size_ru = IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE * 2;
+	u8 bit = IEEE80211_EHT_PPE_THRES_INFO_HEADER_SIZE;
+
+	u32p_replace_bits(&val, ppet >> (ru * ppet_size_ru),
+			  GENMASK(ppet_size_ru - 1, 0));
+
+	val = ((val >> IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE) & GENMASK(2, 0)) |
+	      ((val & GENMASK(2, 0)) << IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE);
+
+	for (i = ppet_size_ru - 1; i >= 0; i--) {
+		ppe_thres[bit / 8] |= (((val >> i) & 0x1) << ((bit % 8)));
+		bit++;
+	}
+}
+
+static void ath12k_mac_copy_eht_ppe_thresh(struct ath12k_wmi_ppe_threshold_arg *fw_ppet,
+					   struct ieee80211_sta_eht_cap *cap)
+{
+	int nss, ru;
+	u8 len = 0;
+
+	len = hweight8(fw_ppet->ru_bit_mask);
+	len *= (1 + fw_ppet->numss_m1);
+
+	len = (len * IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE) +
+	      IEEE80211_EHT_PPE_THRES_INFO_HEADER_SIZE;
+	len = DIV_ROUND_UP(len, 8);
+
+	u8p_replace_bits(&cap->eht_ppe_thres[0], fw_ppet->numss_m1,
+			 IEEE80211_EHT_PPE_THRES_NSS_MASK);
+
+	u16p_replace_bits((u16 *)&cap->eht_ppe_thres[0], fw_ppet->ru_bit_mask,
+			  IEEE80211_EHT_PPE_THRES_RU_INDEX_BITMASK_MASK);
+
+	for (nss = 0; nss <= fw_ppet->numss_m1; nss++) {
+		for (ru = 0;
+		     ru < hweight8(IEEE80211_EHT_PPE_THRES_RU_INDEX_BITMASK_MASK);
+		     ru++) {
+			if ((fw_ppet->ru_bit_mask & BIT(ru)) == 0)
+				continue;
+
+			ath12k_mac_copy_eht_ppet_ru(fw_ppet->ppet16_ppet8_ru3_ru0[nss],
+						    cap->eht_ppe_thres, ru);
+		}
+	}
+}
+
+static void ath12k_mac_copy_eht_cap(struct ath12k_band_cap *band_cap,
+				    struct ieee80211_he_cap_elem *he_cap_elem,
+				    int iftype,
+				    struct ieee80211_sta_eht_cap *eht_cap)
+{
+	struct ieee80211_eht_cap_elem_fixed *eht_cap_elem = &eht_cap->eht_cap_elem;
+
+	memset(eht_cap, 0, sizeof(struct ieee80211_sta_eht_cap));
+	eht_cap->has_eht = true;
+	memcpy(eht_cap_elem->mac_cap_info, band_cap->eht_cap_mac_info,
+	       sizeof(eht_cap_elem->mac_cap_info));
+	memcpy(eht_cap_elem->phy_cap_info, band_cap->eht_cap_phy_info,
+	       sizeof(eht_cap_elem->phy_cap_info));
+
+	switch (iftype) {
+	case NL80211_IFTYPE_AP:
+		eht_cap_elem->phy_cap_info[0] &=
+			~IEEE80211_EHT_PHY_CAP0_242_TONE_RU_GT20MHZ;
+		eht_cap_elem->phy_cap_info[4] &=
+			~IEEE80211_EHT_PHY_CAP4_PART_BW_DL_MU_MIMO;
+		eht_cap_elem->phy_cap_info[5] &=
+			~IEEE80211_EHT_PHY_CAP5_TX_LESS_242_TONE_RU_SUPP;
+		break;
+	case NL80211_IFTYPE_STATION:
+		eht_cap_elem->phy_cap_info[7] &=
+			~(IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_80MHZ |
+			  IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_160MHZ |
+			  IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ);
+		eht_cap_elem->phy_cap_info[7] &=
+			~(IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ |
+			  IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ |
+			  IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ);
+		break;
+	default:
+		break;
+	}
+
+	ath12k_mac_copy_eht_mcs_nss(band_cap, &eht_cap->eht_mcs_nss_supp,
+				    he_cap_elem, eht_cap_elem);
+
+	if (eht_cap_elem->phy_cap_info[5] &
+	    IEEE80211_EHT_PHY_CAP5_PPE_THRESHOLD_PRESENT)
+		ath12k_mac_copy_eht_ppe_thresh(&band_cap->eht_ppet, eht_cap);
+}
+
 static int ath12k_mac_copy_sband_iftype_data(struct ath12k *ar,
 					     struct ath12k_pdev_cap *cap,
 					     struct ieee80211_sband_iftype_data *data,
@@ -4290,6 +4416,8 @@ static int ath12k_mac_copy_sband_iftype_data(struct ath12k *ar,
 			data[idx].he_6ghz_capa.capa =
 				ath12k_mac_setup_he_6ghz_cap(cap, band_cap);
 		}
+		ath12k_mac_copy_eht_cap(band_cap, &he_cap->he_cap_elem, i,
+					&data[idx].eht_cap);
 		idx++;
 	}
 
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
