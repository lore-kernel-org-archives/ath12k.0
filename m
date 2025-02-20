Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769BDC021B3
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPj/374cD6JfWk/WdSiSF8UqydNdmmzaoGm1OvKrn7E=; b=we6eb60+1Ldv20kY/UjHzd5jm1
	0JfFUt9M3c1RgTdiRuXmxO4Y2ifz9KKvta/ek+X2Q65wCpbZdy84NOuD+fWlu6fWJ6LqR+iFklHWO
	CHXftBOyeLzJUX/8JI7Ht7dbkQsH++nwIlpfxh0wTe8pW0GgAw9zrGFJa8+K6HNO9eE9kBo2nGK1G
	HUHu4XadEn3XjXq/Vd/d0BqO0jV/abppT1DFwvQ1nH4VpGwI01WBDQt0gf5H33h9T5EqV0ZMpENtY
	FW6gByU0L2zl4pp3M/C+nJUkeEMW17KJuMbvFSpGB7IKw0vLZky2Z2o1XQz9Kxh9/GM9xmX+aHZVI
	tlHXxvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEEH-00000002z6C-0tlp
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 21:37:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE81-00000002xXW-0zNj
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 21:30:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KAkChY011837;
	Thu, 20 Feb 2025 21:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPj/374cD6JfWk/WdSiSF8UqydNdmmzaoGm1OvKrn7E=; b=W3H2n65IGM5C8rXO
	m9uVxgOb7YQmXfI7T2wO81IYvRwYfU7caL2WvEJXGuwfr/v+GmGsBdtArJlypobz
	Dddz1uUtDauFaIvMO8wvsGqr9lTrqji6QTIJf20F13uw7+NDbZmsRxkuIEn5ZgV0
	gw6CXlQzPW8lg2Xc97qgKUvTmzrbIBnRfnRq9yW/mRRxjd5JOJ4bnpyFVCFn46ZK
	0CftYO0+XTnZ5ZdjBVQq2rmbzCeBsiAf3NP8+EPEe1cSQz4RtEvHtK/8IfM0rbOF
	SJSzTGB/iW9W6DZ3rsNOtKxrhl5oIQcyY8fht+MZiKoxEETbljH+Al62zvWu09hC
	wv6JNw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xb9ndj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 21:30:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KLUeAu003101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 21:30:40 GMT
Received: from ath12k-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 13:30:39 -0800
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Muna Sinada <quic_msinada@quicinc.com>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
Subject: [PATCH V11 4/9] wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
Date: Thu, 20 Feb 2025 13:30:20 -0800
Message-ID: <20250220213025.2722206-5-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220213025.2722206-1-quic_pradeepc@quicinc.com>
References: <20250220213025.2722206-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JokeofsFIrfNrbVKaWEPs0CBCk23Y-6Q
X-Proofpoint-ORIG-GUID: JokeofsFIrfNrbVKaWEPs0CBCk23Y-6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502200143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_133041_283819_9BB09E65 
X-CRM114-Status: GOOD (  14.62  )
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
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 40 ++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b66d6954430a..6847f33a1dbf 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6838,20 +6838,40 @@ static __le16 ath12k_mac_setup_he_6ghz_cap(struct ath12k_pdev_cap *pcap,
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
@@ -6893,7 +6913,7 @@ static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
 		break;
 	}
 
-	ath12k_mac_set_hemcsmap(band_cap, he_cap);
+	ath12k_mac_set_hemcsmap(ar, &ar->pdev->cap, he_cap);
 	memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
 	if (he_cap_elem->phy_cap_info[6] &
 	    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT)
@@ -7083,7 +7103,7 @@ static int ath12k_mac_copy_sband_iftype_data(struct ath12k *ar,
 
 		data[idx].types_mask = BIT(i);
 
-		ath12k_mac_copy_he_cap(band_cap, i, ar->num_tx_chains, he_cap);
+		ath12k_mac_copy_he_cap(ar, band_cap, i, ar->num_tx_chains, he_cap);
 		if (band == NL80211_BAND_6GHZ) {
 			data[idx].he_6ghz_capa.capa =
 				ath12k_mac_setup_he_6ghz_cap(cap, band_cap);
-- 
2.34.1


