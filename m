Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1C9CD1283
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrUU9BCiNa7NM7K22CRyMozni1xVGLJA1h8jFoSXQDc=; b=uVkXg2qs9q3lN8GrffketAYRKg
	1iC5bR3QjtDI6G/FLJ+H0wkzsYVuiNRq9LS8Q7gptMZNd+AnRjSBAr8rIDhu1rtW76IQRGtob/FJ2
	BeLnUTZCEJI8u92wMFsMW5vPf4gTtriX4y+VzC0Zd1mtHZ8aryadZr6bqRZiQC5nNg6hkEXni1Vu6
	UWqUnn9HPLsgoUmSozze0Nh3jHKZFjrvbpF5aDILXkGf1tp2kYWMWfSdOVx7OSn5+BdmivQ7VWb3p
	8ODeERSfsxD9cPxrlx5Coi0C75RvZPw8x8nYIxKiqFbJXYMTJrs7UC2Wq2OltBq0eyqI0Bj1D2JIi
	9CB2uV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGCf-00000001VsP-3c0e
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 17:39:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGCc-00000001Vrh-3QUY
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 17:39:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42TGnusL024839;
	Fri, 29 Mar 2024 17:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=BrUU9BCiNa7NM7K22CRy
	Mozni1xVGLJA1h8jFoSXQDc=; b=mFL3VBHdBVdrleSq9QUfMQDtJ1TVLGEmaVJw
	mky1JJZ2mcI4jH6eAqD5/xPpzQ6YBOXisB/EltdwvTECkIbfW7f8GLKpLb4S/f0M
	z0NI15PcfMOlyx8oSvLE0ODvgJSKKiUdZStmLnGFvFwqtE+cW9wqwjZBnO8Aw9Tb
	QQYzdcTFcCO1LKFHQiMhhyuZiiVrTLEfO/mg3tVTnaj4IsT2IiCxLG991anbxfhW
	hKtEAgV+xfbohCh5psI24PUeuWbMkTo1lO7raJVZatVG68KKeinM+2ZgAT5++6Iz
	z9QzBws5NNss13foJF/Je/YPJoJmC72A/JqLAXYZbxVkDL5UAw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5sm6hdpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:39:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42THddZc028224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:39:39 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 29 Mar 2024 10:39:39 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH v2 6/6] wifi: ath12k: support SMPS configuration for 6 GHz
Date: Fri, 29 Mar 2024 10:39:26 -0700
Message-ID: <20240329173926.17741-7-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240329173926.17741-1-quic_pradeepc@quicinc.com>
References: <20240329173926.17741-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mKRqJP80vjABezQ0DuO9qt3Ljbak-d8m
X-Proofpoint-GUID: mKRqJP80vjABezQ0DuO9qt3Ljbak-d8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_103943_000124_F66296A6 
X-CRM114-Status: GOOD (  19.88  )
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

Parse SMPS configuration from IEs and configure. Without this,
SMPS is not enabled for 6 GHz band. This is disabled for
WCN7850 as hardware does not support it.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c  |  3 +++
 drivers/net/wireless/ath/ath12k/hw.h  |  1 +
 drivers/net/wireless/ath/ath12k/mac.c | 26 ++++++++++++++++++--------
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 0b17dfd47856..3321d78575eb 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -920,6 +920,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
 
 		.supports_sta_ps = false,
+		.supports_dynamic_smps_6ghz = true,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -993,6 +994,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = true,
+		.supports_dynamic_smps_6ghz = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1061,6 +1063,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
 
 		.supports_sta_ps = false,
+		.supports_dynamic_smps_6ghz = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 87965980b938..263efa077611 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -211,6 +211,7 @@ struct ath12k_hw_params {
 	u32 otp_board_id_register;
 
 	bool supports_sta_ps;
+	bool supports_dynamic_smps_6ghz;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b4114dd22bf0..2f1e5e249ef3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1964,12 +1964,17 @@ static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
 }
 
 static inline int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *ht_cap,
+					    const struct ieee80211_he_6ghz_capa *he_6ghz_capa,
 					    int *smps)
 {
-	if (!ht_cap->ht_supported)
+	if (!ht_cap->ht_supported && !he_6ghz_capa->capa)
 		return -EOPNOTSUPP;
 
-	*smps = u16_get_bits(ht_cap->cap, IEEE80211_HT_CAP_SM_PS);
+	if (ht_cap->ht_supported)
+		*smps = u16_get_bits(ht_cap->cap, IEEE80211_HT_CAP_SM_PS);
+	else
+		*smps = le16_get_bits(he_6ghz_capa->capa,
+				      IEEE80211_HE_6GHZ_CAP_SM_PS);
 
 	if (*smps >= ARRAY_SIZE(ath12k_smps_map))
 		return -EINVAL;
@@ -1980,10 +1985,11 @@ static inline int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *h
 static void ath12k_peer_assoc_h_smps(struct ieee80211_sta *sta,
 				     struct ath12k_wmi_peer_assoc_arg *arg)
 {
+	const struct ieee80211_he_6ghz_capa *he_6ghz_capa = &sta->deflink.he_6ghz_capa;
 	const struct ieee80211_sta_ht_cap *ht_cap = &sta->deflink.ht_cap;
 	int smps;
 
-	if (ath12k_get_smps_from_capa(ht_cap, &smps))
+	if (ath12k_get_smps_from_capa(ht_cap, he_6ghz_capa, &smps))
 		return;
 
 	switch (smps) {
@@ -2457,11 +2463,12 @@ static void ath12k_peer_assoc_prepare(struct ath12k *ar,
 
 static int ath12k_setup_peer_smps(struct ath12k *ar, struct ath12k_vif *arvif,
 				  const u8 *addr,
-				  const struct ieee80211_sta_ht_cap *ht_cap)
+				  const struct ieee80211_sta_ht_cap *ht_cap,
+				  const struct ieee80211_he_6ghz_capa *he_6ghz_capa)
 {
 	int smps, ret = 0;
 
-	ret = ath12k_get_smps_from_capa(ht_cap, &smps);
+	ret = ath12k_get_smps_from_capa(ht_cap, he_6ghz_capa, &smps);
 	if (ret < 0)
 		return ret;
 
@@ -2514,7 +2521,8 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	}
 
 	ret = ath12k_setup_peer_smps(ar, arvif, bss_conf->bssid,
-				     &ap_sta->deflink.ht_cap);
+				     &ap_sta->deflink.ht_cap,
+				     &ap_sta->deflink.he_6ghz_capa);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to setup peer SMPS for vdev %d: %d\n",
 			    arvif->vdev_id, ret);
@@ -3677,7 +3685,8 @@ static int ath12k_station_assoc(struct ath12k *ar,
 		return 0;
 
 	ret = ath12k_setup_peer_smps(ar, arvif, sta->addr,
-				     &sta->deflink.ht_cap);
+				     &sta->deflink.ht_cap,
+				     &sta->deflink.he_6ghz_capa);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to setup peer SMPS for vdev %d: %d\n",
 			    arvif->vdev_id, ret);
@@ -8104,7 +8113,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	 * for each band for a dual band capable radio. It will be tricky to
 	 * handle it when the ht capability different for each band.
 	 */
-	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS)
+	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS ||
+	    (ar->supports_6ghz && ab->hw_params->supports_dynamic_smps_6ghz))
 		wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
 
 	wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
-- 
2.17.1


