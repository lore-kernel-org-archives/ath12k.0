Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3395DC25B75
	for <ath12k@archiver.kernel.org>; Wed, 15 May 2024 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqC3FeI24sHg7U2o2d+qGMB5uiipo9SIF4z4mvlxdFw=; b=DsuRe19iywqD6e9A3caNJvFKx/
	nzyEKWvh70o8IpP1StwUFgyvo9I9O63nyrigtUAY1J+TzDH3HPtfWNFO/lTedMUaeqxyeFYGNDkR3
	OGCaDvkNWLU8pMKxkyGLhAvIWTrYBpxnmU/fBivgQ1kfRkPE5Oz6PBTUlXYRGv091BCn+J9J2MoMU
	gUfg0Ez3GiagncRe+H0KHSM7lwrkKiEoEUSVXEEEq6u5DpvoNdcC9dIl8SDSfKzW4mwiIyVyTCSgM
	k+i7uFe31o8N8tnBkh1P5SygDfBFT1r+P5dbX2t9pfDkgZ+43lg9cv3VJBZgFq58wqY0lIfTe15cF
	MtMelqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7J8h-00000002W5d-3rmt
	for ath12k@archiver.kernel.org;
	Wed, 15 May 2024 18:14:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7J8N-00000002VpQ-1hMy
	for ath12k@lists.infradead.org;
	Wed, 15 May 2024 18:13:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90aZQ012163;
	Wed, 15 May 2024 18:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=JqC3FeI24sHg7U2o2d+q
	GMB5uiipo9SIF4z4mvlxdFw=; b=JZLZS+7WyMd/fz+Wzd+BukwnpWC1yhTHjbhX
	1JjwH+PVP+4A/jzhxGiguo9iRqSJxsadU3xVQ/b11h2eKbhrG+qGUyroSQqY5zL0
	i1ju+kN3OWdIm40SGHPu6HW3tBiUJfn0OHXmiXRLtkj3WqU9bFgINBFyWWa7r/zn
	1PYcG3IKp7q7qJeb/Q9XpRrJYaj0HdhqtHcDl39RieKK8fs2PYrDz3/W4fEXRIXT
	ajtP9WNQgHYVyYusgml5OtKx0mEDwfLk909G2WS9TwUf0i7ARo96BfmtxHUk2+SQ
	UOkgfZT4bbtiqhxdpoNUnqEBB4cppqnsywXiIr4uGJ+Tvo7WDg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28pds8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 18:13:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FIDckc024546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 18:13:38 GMT
Received: from pradeepc-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 11:13:38 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH V6 02/10] wifi: ath12k: push HE MU-MIMO params to hardware
Date: Wed, 15 May 2024 11:13:19 -0700
Message-ID: <20240515181327.12855-3-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240515181327.12855-1-quic_pradeepc@quicinc.com>
References: <20240515181327.12855-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R_skTGGZUepN3lKd5RodJ4ymO96owVhz
X-Proofpoint-GUID: R_skTGGZUepN3lKd5RodJ4ymO96owVhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_11,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_111348_168608_E58FB393 
X-CRM114-Status: GOOD (  21.64  )
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

Currently, only the HE IE in management frames is updated with
respect to MU-MIMO configurations, but this change is not
reflected in the hardware. Add support to propagate MU-MIMO
configurations to the hardware as well.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 215 +++++++++++++++++---------
 drivers/net/wireless/ath/ath12k/mac.h |  15 ++
 drivers/net/wireless/ath/ath12k/wmi.h |  28 +---
 3 files changed, 156 insertions(+), 102 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 96dc5c2e096f..5e3b7894d4f4 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2528,15 +2528,119 @@ static int ath12k_setup_peer_smps(struct ath12k *ar, struct ath12k_vif *arvif,
 					 ath12k_smps_map[smps]);
 }
 
+static int ath12k_mac_set_he_txbf_conf(struct ath12k_vif *arvif)
+{
+	struct ath12k *ar = arvif->ar;
+	u32 param = WMI_VDEV_PARAM_SET_HEMU_MODE;
+	u32 value = 0;
+	int ret;
+
+	if (!arvif->vif->bss_conf.he_support)
+		return 0;
+
+	if (arvif->vif->bss_conf.he_su_beamformer) {
+		value |= u32_encode_bits(HE_SU_BFER_ENABLE, HE_MODE_SU_TX_BFER);
+		if (arvif->vif->bss_conf.he_mu_beamformer &&
+		    arvif->vdev_type == WMI_VDEV_TYPE_AP)
+			value |= u32_encode_bits(HE_MU_BFER_ENABLE, HE_MODE_MU_TX_BFER);
+	}
+
+	if (arvif->vif->type != NL80211_IFTYPE_MESH_POINT) {
+		value |= u32_encode_bits(HE_DL_MUOFDMA_ENABLE, HE_MODE_DL_OFDMA) |
+			 u32_encode_bits(HE_UL_MUOFDMA_ENABLE, HE_MODE_UL_OFDMA);
+
+		if (arvif->vif->bss_conf.he_full_ul_mumimo)
+			value |= u32_encode_bits(HE_UL_MUMIMO_ENABLE, HE_MODE_UL_MUMIMO);
+
+		if (arvif->vif->bss_conf.he_su_beamformee)
+			value |= u32_encode_bits(HE_SU_BFEE_ENABLE, HE_MODE_SU_TX_BFEE);
+	}
+
+	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id, param, value);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to set vdev %d HE MU mode: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	param = WMI_VDEV_PARAM_SET_HE_SOUNDING_MODE;
+	value =	u32_encode_bits(HE_VHT_SOUNDING_MODE_ENABLE, HE_VHT_SOUNDING_MODE) |
+		u32_encode_bits(HE_TRIG_NONTRIG_SOUNDING_MODE_ENABLE,
+				HE_TRIG_NONTRIG_SOUNDING_MODE);
+	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+					    param, value);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to set vdev %d sounding mode: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ath12k_mac_vif_recalc_sta_he_txbf(struct ath12k *ar,
+					     struct ieee80211_vif *vif,
+					     struct ieee80211_sta_he_cap *he_cap,
+					     int *hemode)
+{
+	struct ieee80211_he_cap_elem he_cap_elem = {};
+	struct ieee80211_sta_he_cap *cap_band;
+	struct cfg80211_chan_def def;
+
+	if (!vif->bss_conf.he_support)
+		return 0;
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return -EINVAL;
+
+	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+		return -EINVAL;
+
+	if (def.chan->band == NL80211_BAND_2GHZ)
+		cap_band = &ar->mac.iftype[NL80211_BAND_2GHZ][vif->type].he_cap;
+	else
+		cap_band = &ar->mac.iftype[NL80211_BAND_5GHZ][vif->type].he_cap;
+
+	memcpy(&he_cap_elem, &cap_band->he_cap_elem, sizeof(he_cap_elem));
+
+	*hemode = 0;
+	if (HECAP_PHY_SUBFME_GET(he_cap_elem.phy_cap_info)) {
+		if (HECAP_PHY_SUBFMR_GET(he_cap->he_cap_elem.phy_cap_info))
+			*hemode |= u32_encode_bits(HE_SU_BFEE_ENABLE, HE_MODE_SU_TX_BFEE);
+		if (HECAP_PHY_MUBFMR_GET(he_cap->he_cap_elem.phy_cap_info))
+			*hemode |= u32_encode_bits(HE_MU_BFEE_ENABLE, HE_MODE_MU_TX_BFEE);
+	}
+
+	if (vif->type != NL80211_IFTYPE_MESH_POINT) {
+		*hemode |= u32_encode_bits(HE_DL_MUOFDMA_ENABLE, HE_MODE_DL_OFDMA) |
+			  u32_encode_bits(HE_UL_MUOFDMA_ENABLE, HE_MODE_UL_OFDMA);
+
+		if (HECAP_PHY_ULMUMIMO_GET(he_cap_elem.phy_cap_info))
+			if (HECAP_PHY_ULMUMIMO_GET(he_cap->he_cap_elem.phy_cap_info))
+				*hemode |= u32_encode_bits(HE_UL_MUMIMO_ENABLE,
+							  HE_MODE_UL_MUMIMO);
+
+		if (u32_get_bits(*hemode, HE_MODE_MU_TX_BFEE))
+			*hemode |= u32_encode_bits(HE_SU_BFEE_ENABLE, HE_MODE_SU_TX_BFEE);
+
+		if (u32_get_bits(*hemode, HE_MODE_MU_TX_BFER))
+			*hemode |= u32_encode_bits(HE_SU_BFER_ENABLE, HE_MODE_SU_TX_BFER);
+	}
+
+	return 0;
+}
+
 static void ath12k_bss_assoc(struct ath12k *ar,
 			     struct ath12k_vif *arvif,
 			     struct ieee80211_bss_conf *bss_conf)
 {
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ath12k_wmi_peer_assoc_arg peer_arg;
+	struct ieee80211_sta_he_cap he_cap;
 	struct ieee80211_sta *ap_sta;
 	struct ath12k_peer *peer;
 	bool is_auth = false;
+	u32 hemode = 0;
 	int ret;
 
 	lockdep_assert_held(&ar->conf_mutex);
@@ -2556,8 +2660,29 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 
 	ath12k_peer_assoc_prepare(ar, vif, ap_sta, &peer_arg, false);
 
+	/* he_cap here is updated at assoc success for sta mode only */
+	he_cap = ap_sta->deflink.he_cap;
+
+	/* ap_sta->deflink.he_cap must be protected by rcu_read_lock */
+	ret = ath12k_mac_vif_recalc_sta_he_txbf(ar, vif, &he_cap, &hemode);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to recalc he txbf for vdev %i on bss %pM: %d\n",
+			    arvif->vdev_id, bss_conf->bssid, ret);
+		rcu_read_unlock();
+		return;
+	}
+
 	rcu_read_unlock();
 
+	/* keep this before ath12k_wmi_send_peer_assoc_cmd() */
+	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+					    WMI_VDEV_PARAM_SET_HEMU_MODE, hemode);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to submit vdev param txbf 0x%x: %d\n",
+			    hemode, ret);
+		return;
+	}
+
 	ret = ath12k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to run peer assoc for %pM vdev %i: %d\n",
@@ -2884,6 +3009,13 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 		ether_addr_copy(arvif->bssid, info->bssid);
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
+		if (info->enable_beacon) {
+			ret = ath12k_mac_set_he_txbf_conf(arvif);
+			if (ret)
+				ath12k_warn(ar->ab,
+					    "failed to set HE TXBF config for vdev: %d\n",
+					    arvif->vdev_id);
+		}
 		ath12k_control_beaconing(arvif, info);
 
 		if (arvif->is_up && vif->bss_conf.he_support &&
@@ -4995,11 +5127,14 @@ static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
 
 	he_cap_elem->mac_cap_info[1] &=
 		IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_MASK;
-
+	he_cap_elem->phy_cap_info[0] &=
+		IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
+		IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
+		IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
+	he_cap_elem->phy_cap_info[0] &=
+		~IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
 	he_cap_elem->phy_cap_info[5] &=
 		~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK;
-	he_cap_elem->phy_cap_info[5] &=
-		~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK;
 	he_cap_elem->phy_cap_info[5] |= num_tx_chains - 1;
 
 	switch (iftype) {
@@ -5938,71 +6073,6 @@ static void ath12k_mac_setup_vdev_create_arg(struct ath12k_vif *arvif,
 	arg->if_stats_id = ath12k_mac_get_vdev_stats_id(arvif);
 }
 
-static u32
-ath12k_mac_prepare_he_mode(struct ath12k_pdev *pdev, u32 viftype)
-{
-	struct ath12k_pdev_cap *pdev_cap = &pdev->cap;
-	struct ath12k_band_cap *cap_band = NULL;
-	u32 *hecap_phy_ptr = NULL;
-	u32 hemode;
-
-	if (pdev->cap.supported_bands & WMI_HOST_WLAN_2G_CAP)
-		cap_band = &pdev_cap->band[NL80211_BAND_2GHZ];
-	else
-		cap_band = &pdev_cap->band[NL80211_BAND_5GHZ];
-
-	hecap_phy_ptr = &cap_band->he_cap_phy_info[0];
-
-	hemode = u32_encode_bits(HE_SU_BFEE_ENABLE, HE_MODE_SU_TX_BFEE) |
-		 u32_encode_bits(HECAP_PHY_SUBFMR_GET(hecap_phy_ptr),
-				 HE_MODE_SU_TX_BFER) |
-		 u32_encode_bits(HECAP_PHY_ULMUMIMO_GET(hecap_phy_ptr),
-				 HE_MODE_UL_MUMIMO);
-
-	/* TODO: WDS and other modes */
-	if (viftype == NL80211_IFTYPE_AP) {
-		hemode |= u32_encode_bits(HECAP_PHY_MUBFMR_GET(hecap_phy_ptr),
-					  HE_MODE_MU_TX_BFER) |
-			  u32_encode_bits(HE_DL_MUOFDMA_ENABLE, HE_MODE_DL_OFDMA) |
-			  u32_encode_bits(HE_UL_MUOFDMA_ENABLE, HE_MODE_UL_OFDMA);
-	} else {
-		hemode |= u32_encode_bits(HE_MU_BFEE_ENABLE, HE_MODE_MU_TX_BFEE);
-	}
-
-	return hemode;
-}
-
-static int ath12k_set_he_mu_sounding_mode(struct ath12k *ar,
-					  struct ath12k_vif *arvif)
-{
-	u32 param_id, param_value;
-	struct ath12k_base *ab = ar->ab;
-	int ret;
-
-	param_id = WMI_VDEV_PARAM_SET_HEMU_MODE;
-	param_value = ath12k_mac_prepare_he_mode(ar->pdev, arvif->vif->type);
-	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-					    param_id, param_value);
-	if (ret) {
-		ath12k_warn(ab, "failed to set vdev %d HE MU mode: %d param_value %x\n",
-			    arvif->vdev_id, ret, param_value);
-		return ret;
-	}
-	param_id = WMI_VDEV_PARAM_SET_HE_SOUNDING_MODE;
-	param_value =
-		u32_encode_bits(HE_VHT_SOUNDING_MODE_ENABLE, HE_VHT_SOUNDING_MODE) |
-		u32_encode_bits(HE_TRIG_NONTRIG_SOUNDING_MODE_ENABLE,
-				HE_TRIG_NONTRIG_SOUNDING_MODE);
-	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-					    param_id, param_value);
-	if (ret) {
-		ath12k_warn(ab, "failed to set vdev %d HE MU mode: %d\n",
-			    arvif->vdev_id, ret);
-		return ret;
-	}
-	return ret;
-}
-
 static void ath12k_mac_update_vif_offload(struct ath12k_vif *arvif)
 {
 	struct ieee80211_vif *vif = arvif->vif;
@@ -6831,7 +6901,6 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
 	struct ath12k_base *ab = ar->ab;
 	struct wmi_vdev_start_req_arg arg = {};
 	const struct cfg80211_chan_def *chandef = &ctx->def;
-	int he_support = arvif->vif->bss_conf.he_support;
 	int ret;
 
 	lockdep_assert_held(&ar->conf_mutex);
@@ -6881,14 +6950,6 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
 		spin_unlock_bh(&ab->base_lock);
 
 		/* TODO: Notify if secondary 80Mhz also needs radar detection */
-		if (he_support) {
-			ret = ath12k_set_he_mu_sounding_mode(ar, arvif);
-			if (ret) {
-				ath12k_warn(ar->ab, "failed to set he mode vdev %i\n",
-					    arg.vdev_id);
-				return ret;
-			}
-		}
 	}
 
 	arg.passive |= !!(chandef->chan->flags & IEEE80211_CHAN_NO_IR);
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 69fd282b9dd3..e5193a44f344 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -40,6 +40,21 @@ struct ath12k_generic_iter {
 #define ATH12K_TX_POWER_MAX_VAL	70
 #define ATH12K_TX_POWER_MIN_VAL	0
 
+#define HECAP_PHY_SUBFMR_GET(hecap_phy) \
+	u8_get_bits(hecap_phy[3], IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER)
+
+#define HECAP_PHY_SUBFME_GET(hecap_phy) \
+	u8_get_bits(hecap_phy[4], IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE)
+
+#define HECAP_PHY_MUBFMR_GET(hecap_phy) \
+	u8_get_bits(hecap_phy[4], IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER)
+
+#define HECAP_PHY_ULMUMIMO_GET(hecap_phy) \
+	u8_get_bits(hecap_phy[2], IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO)
+
+#define HECAP_PHY_ULOFDMA_GET(hecap_phy) \
+	u8_get_bits(hecap_phy[2], IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO)
+
 enum ath12k_supported_bw {
 	ATH12K_BW_20    = 0,
 	ATH12K_BW_40    = 1,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 496866673aea..03aab0531aa4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2968,31 +2968,6 @@ struct ath12k_wmi_rx_reorder_queue_remove_arg {
 #define WMI_VDEV_PARAM_TXBF_SU_TX_BFER BIT(2)
 #define WMI_VDEV_PARAM_TXBF_MU_TX_BFER BIT(3)
 
-#define HECAP_PHYDWORD_0	0
-#define HECAP_PHYDWORD_1	1
-#define HECAP_PHYDWORD_2	2
-
-#define HECAP_PHY_SU_BFER		BIT(31)
-#define HECAP_PHY_SU_BFEE		BIT(0)
-#define HECAP_PHY_MU_BFER		BIT(1)
-#define HECAP_PHY_UL_MUMIMO		BIT(22)
-#define HECAP_PHY_UL_MUOFDMA		BIT(23)
-
-#define HECAP_PHY_SUBFMR_GET(hecap_phy) \
-	u32_get_bits(hecap_phy[HECAP_PHYDWORD_0], HECAP_PHY_SU_BFER)
-
-#define HECAP_PHY_SUBFME_GET(hecap_phy) \
-	u32_get_bits(hecap_phy[HECAP_PHYDWORD_1], HECAP_PHY_SU_BFEE)
-
-#define HECAP_PHY_MUBFMR_GET(hecap_phy) \
-	u32_get_bits(hecap_phy[HECAP_PHYDWORD_1], HECAP_PHY_MU_BFER)
-
-#define HECAP_PHY_ULMUMIMO_GET(hecap_phy) \
-	u32_get_bits(hecap_phy[HECAP_PHYDWORD_0], HECAP_PHY_UL_MUMIMO)
-
-#define HECAP_PHY_ULOFDMA_GET(hecap_phy) \
-	u32_get_bits(hecap_phy[HECAP_PHYDWORD_0], HECAP_PHY_UL_MUOFDMA)
-
 #define HE_MODE_SU_TX_BFEE	BIT(0)
 #define HE_MODE_SU_TX_BFER	BIT(1)
 #define HE_MODE_MU_TX_BFEE	BIT(2)
@@ -3004,8 +2979,11 @@ struct ath12k_wmi_rx_reorder_queue_remove_arg {
 #define HE_DL_MUOFDMA_ENABLE	1
 #define HE_UL_MUOFDMA_ENABLE	1
 #define HE_DL_MUMIMO_ENABLE	1
+#define HE_UL_MUMIMO_ENABLE	1
 #define HE_MU_BFEE_ENABLE	1
 #define HE_SU_BFEE_ENABLE	1
+#define HE_MU_BFER_ENABLE	1
+#define HE_SU_BFER_ENABLE	1
 
 #define HE_VHT_SOUNDING_MODE_ENABLE		1
 #define HE_SU_MU_SOUNDING_MODE_ENABLE		1
-- 
2.17.1


