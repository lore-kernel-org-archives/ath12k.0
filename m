Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1602FC10F15
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNR5ZG45cMIWRKNGu0U/QMwlCmdiO6btpuWlJSoBvKI=; b=xgMmkDBzt3AKT4HrJ0jOnTVNbf
	/0+vLOuXL5/2eYM73hAukqZF4vg1orKgteTZFDkpXkbwVxO4sacWBvnrsmxUIiNXkJ9rRI5HkwohG
	6DyqQewPlsSkrq/cAPlZqfGBgjOdAneB/TDWbOJzL9VcavUND18sLiD160FL9IQ1SosDOkSuaMmUz
	TEOCkCuofGC84utXh1jt0CBqNxdtWwUoq76Dh+o7D6/yMsqecNqNvYDsugDCbtTIsimDMbKEEWUT4
	NMzVBvitq3Ikh9vZ6hsRdEKoeXCNCHQiSEMjB2ERqBoGr6OlJ3fYc7N8qgy808YzeGmRvs0IJiNbn
	/tfCmskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzi2u-00000005bEU-2wUa
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 19:12:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzi2s-00000005bCU-0PBJ
	for ath12k@bombadil.infradead.org;
	Wed, 24 Apr 2024 19:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GNR5ZG45cMIWRKNGu0U/QMwlCmdiO6btpuWlJSoBvKI=; b=G0JvFQaFZn3NNQ645OhWglIJM5
	0UG3Wapp7b41gAe8//9a551PmDy2JKY6B0e0O/tsAreeo0t1FaU3edJyWws0jxWPbvhPnBRYJsMOG
	OGUzaf51DhfjYoAw9TpQKjPTguvwYCaG33n5l98J1LUdSlm+k5h7tHPn28VA3lYQb0wfjvLPxGGL/
	Q7s1YOZ1Mvj8ANsildJjD1gnNuYVWPAmCJrCc4RuilB3PnaKOua9aimu08sELqLkzgRGz11sapMun
	ecZB0PARypjzCPmKxECD5hMF6JjkEK5flRpAGZJhRqh9cRbhYNLXW4dlHd7PPHxxzCQatybakyVPO
	fRGQZ/pA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzi2Z-0000000EWB1-0CPP
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 19:12:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OJB7P4004079;
	Wed, 24 Apr 2024 19:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=GNR5ZG45cMIWRKNGu0U/
	QMwlCmdiO6btpuWlJSoBvKI=; b=AWNuxc9Mwpub/P9UrjRaVgdUrICLnTlnJNwV
	0XpDNpQpm3ebadrYbbSnJdxnOHWpbIaPe8W9uhAlmacmCflM+nKq97sJCzGuBMFi
	9xV+WflhLonXdR4xW1i3TuBvLIjKjakBSE0KybafR6MiP9ZIJloZqgu4bZoo32nt
	2RJDXB5aRKgLnGDfnlyiBKYs5aUvSmVqjmZSHLy7ei04OTcU/QDDA2p9D17n10Es
	f5h3zFozI1GCWc9mW0cVZqPAHFIgvcHrQ9H41KlWErxnun6Qj9WPPVPPQgbKTDpv
	JwXC9kdpbmH4nySlK7Gpnb0WAc7GyANJ+0CDJJiPHb1NFITiQw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpv9dhyt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 19:11:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43OJBrlL015981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 19:11:53 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 24 Apr 2024 12:11:53 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH V3 6/6] wifi: ath12k: support SMPS configuration for 6 GHz
Date: Wed, 24 Apr 2024 12:11:41 -0700
Message-ID: <20240424191141.32549-7-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
References: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CozjNFerZD4feJH4BPnyINx0mQdFSqCM
X-Proofpoint-ORIG-GUID: CozjNFerZD4feJH4BPnyINx0mQdFSqCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_16,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404240091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_201226_336741_58B7B4C0 
X-CRM114-Status: GOOD (  15.21  )
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
SMPS is not enabled for 6 GHz band.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 29 ++++++++++++++++++---------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 65688e55c285..44e853893ec5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2086,13 +2086,18 @@ static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
 				     ampdu_factor)) - 1;
 }
 
-static inline int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *ht_cap,
-					    int *smps)
+static int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *ht_cap,
+				     const struct ieee80211_he_6ghz_capa *he_6ghz_capa,
+				     int *smps)
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
@@ -2103,10 +2108,11 @@ static inline int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *h
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
@@ -2580,11 +2586,12 @@ static void ath12k_peer_assoc_prepare(struct ath12k *ar,
 
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
 
@@ -2637,7 +2644,8 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	}
 
 	ret = ath12k_setup_peer_smps(ar, arvif, bss_conf->bssid,
-				     &ap_sta->deflink.ht_cap);
+				     &ap_sta->deflink.ht_cap,
+				     &ap_sta->deflink.he_6ghz_capa);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to setup peer SMPS for vdev %d: %d\n",
 			    arvif->vdev_id, ret);
@@ -3944,7 +3952,8 @@ static int ath12k_station_assoc(struct ath12k *ar,
 		return 0;
 
 	ret = ath12k_setup_peer_smps(ar, arvif, sta->addr,
-				     &sta->deflink.ht_cap);
+				     &sta->deflink.ht_cap,
+				     &sta->deflink.he_6ghz_capa);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to setup peer SMPS for vdev %d: %d\n",
 			    arvif->vdev_id, ret);
@@ -8766,7 +8775,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	 * for each band for a dual band capable radio. It will be tricky to
 	 * handle it when the ht capability different for each band.
 	 */
-	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS)
+	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS || ar->supports_6ghz)
 		wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
 
 	wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
-- 
2.17.1


