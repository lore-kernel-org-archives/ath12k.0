Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84529C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 22:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHKA8+VqBDzsY8fayU1Q6hNtqjqQoKF8Lqi7tRWllWM=; b=d3ejiyQIZ+YcrWo38rvucpPm1r
	o/erWEMOoInyxMHnZROjFnbYuM2DCn2ZB06B5wgkeGsh/1Ps91dmWMp4Vy8TPaE5eek9XHdd+6X6U
	EBgXUBQh5KZvNQM9o1ZO9oj57T3pX3RV/EWW49lbSm9e0AfydbdFypbb/p45Hw0Bq7nZ7R1cCDnXa
	oXzCRgYiSuZlLl9TltVaVkNKMyVH9dJ6hOOegESxgiRGksfv0GW7db8r2mZnqLoIfLlW+dz7/1ZnE
	88NXP89Ij/xxxlQ/qE/vMsZbqczFFoQobvPbdJzH8e8biUCoI9nXJGALdnppKnn7hboVAwVaj/5Gp
	b2yGesEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07R1-0000000ASIl-0P6T
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 22:19:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07Qx-0000000ASGM-2bzk
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 22:19:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PKoaMY001070;
	Thu, 25 Apr 2024 22:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=oHKA8+VqBDzsY8fayU1Q
	6hNtqjqQoKF8Lqi7tRWllWM=; b=DDZREhtAki8iW4geWfSvjZJ/T1flk41p8jSY
	6fTNBlmZfBjyjfGzknXDASWo44EQgEfgeG/CBIqyBxEo3+ITt3y44j5r32adeDho
	nWAWg/Fm3lhkkD01/3A46SNjA0eR3nLiLQU9eVTE7gxsv3zuMuIYb29OEvJo65/0
	pWSatnD/zu6D1x70L+KZF+HWrlH8aEND8lDMzPkIe+SnRjCexDf9SAqn59buduk5
	2c4A/cS6POouaFO+EGVFUTDKKZIU7ap6CwkoeFsksI4IQtZYXJNLJk93Pqj1hQrf
	9rdNBFeHM3AtN6Hcnjnrxr0SmVeWSphg7wMFWYMpL699wFRgKg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqn0whyxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:19:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PMJEU4009333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:19:14 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 15:19:13 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Avula Sri Charan <quic_asrichar@quicinc.com>
Subject: [PATCH V4 4/6] wifi: ath12k: add 6 GHz params in peer assoc command
Date: Thu, 25 Apr 2024 15:19:00 -0700
Message-ID: <20240425221902.11553-5-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240425221902.11553-1-quic_pradeepc@quicinc.com>
References: <20240425221902.11553-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S576gB03XVZDWxFR2-Bzygv5kL6j6CFh
X-Proofpoint-GUID: S576gB03XVZDWxFR2-Bzygv5kL6j6CFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_151915_842811_BB83013D 
X-CRM114-Status: GOOD (  14.00  )
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

Currently A-MPDU aggregation parameters are not being configured
during peer association for 6 GHz band. Hence, extract these
parameters from station's capabilities received in association
request and send to firmware. Without this, A-MPDU aggregation
is not happening in 6 GHz band.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: Avula Sri Charan <quic_asrichar@quicinc.com>
Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 57 ++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 830f35fb89fe..8836dc67f7e0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2032,6 +2032,60 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 	}
 }
 
+static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
+					struct ieee80211_vif *vif,
+					struct ieee80211_sta *sta,
+					struct ath12k_wmi_peer_assoc_arg *arg)
+{
+	const struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
+	struct cfg80211_chan_def def;
+	enum nl80211_band band;
+	u8 ampdu_factor, mpdu_density;
+
+	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+		return;
+
+	band = def.chan->band;
+
+	if (!arg->he_flag || band != NL80211_BAND_6GHZ || !sta->deflink.he_6ghz_capa.capa)
+		return;
+
+	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_40)
+		arg->bw_40 = true;
+
+	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_80)
+		arg->bw_80 = true;
+
+	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_160)
+		arg->bw_160 = true;
+
+	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_320)
+		arg->bw_320 = true;
+
+	arg->peer_he_caps_6ghz = le16_to_cpu(sta->deflink.he_6ghz_capa.capa);
+
+	mpdu_density = u32_get_bits(arg->peer_he_caps_6ghz,
+				    IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START);
+	arg->peer_mpdu_density = ath12k_parse_mpdudensity(mpdu_density);
+
+	/* From IEEE Std 802.11ax-2021 - Section 10.12.2: An HE STA shall be capable of
+	 * receiving A-MPDU where the A-MPDU pre-EOF padding length is up to the value
+	 * indicated by the Maximum A-MPDU Length Exponent Extension field in the HE
+	 * Capabilities element and the Maximum A-MPDU Length Exponent field in HE 6 GHz
+	 * Band Capabilities element in the 6 GHz band.
+	 *
+	 * Here, we are extracting the Max A-MPDU Exponent Extension from HE caps and
+	 * factor is the Maximum A-MPDU Length Exponent from HE 6 GHZ Band capability.
+	 */
+	ampdu_factor = u8_get_bits(he_cap->he_cap_elem.mac_cap_info[3],
+				   IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_MASK) +
+			u32_get_bits(arg->peer_he_caps_6ghz,
+				     IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP);
+
+	arg->peer_max_mpdu = (1u << (IEEE80211_HE_6GHZ_MAX_AMPDU_FACTOR +
+				     ampdu_factor)) - 1;
+}
+
 static void ath12k_peer_assoc_h_smps(struct ieee80211_sta *sta,
 				     struct ath12k_wmi_peer_assoc_arg *arg)
 {
@@ -2504,6 +2558,7 @@ static void ath12k_peer_assoc_prepare(struct ath12k *ar,
 	ath12k_peer_assoc_h_ht(ar, vif, sta, arg);
 	ath12k_peer_assoc_h_vht(ar, vif, sta, arg);
 	ath12k_peer_assoc_h_he(ar, vif, sta, arg);
+	ath12k_peer_assoc_h_he_6ghz(ar, vif, sta, arg);
 	ath12k_peer_assoc_h_eht(ar, vif, sta, arg);
 	ath12k_peer_assoc_h_qos(ar, vif, sta, arg);
 	ath12k_peer_assoc_h_phymode(ar, vif, sta, arg);
@@ -8690,7 +8745,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
 	ieee80211_hw_set(hw, REPORTS_LOW_ACK);
 
-	if (ht_cap & WMI_HT_CAP_ENABLED) {
+	if ((ht_cap & WMI_HT_CAP_ENABLED) || ar->supports_6ghz) {
 		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
 		ieee80211_hw_set(hw, TX_AMPDU_SETUP_IN_HW);
 		ieee80211_hw_set(hw, SUPPORTS_REORDERING_BUFFER);
-- 
2.17.1


