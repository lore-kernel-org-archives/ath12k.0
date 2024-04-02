Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F72C6FD1F
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 21:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxH9CqC68TT0FwT6CSXPvi8wPDubWnhBvphdimulvgQ=; b=QfAkqZ8TZwVV8yzc+p6xl+uBdv
	dWM6Li9WszJDisSpJkIAkzeJ3ghsO2wplE0nopDuWZ9ePSOm13U3LCqCvwIYiANfsL1wuaYFWPMlX
	f5F6fButXi4YCrnV1TmH1fNviwapUc0tIiOREYOUErtz3R+Pc9AIXa9etHeuZNXQTgkrsxP03Vza0
	Z+KXYadqOd/iKpbW8W7HJx4ZnGdmSA0736PoSwUOBoQITpi8DVMAaJw0gjxJE//6pzcnUiMKtNPOp
	s7kMFTDGsuP2wwc8b0AGJ5YshWBnUuRq4y87EK+lE2diRgACyq0dur5Ds/f5PQy7WTeEkkIc4dokJ
	6oFqQGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlKQ-0000000Colp-480W
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 21:05:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlKK-0000000Coh6-1dtc
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 21:05:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432KSZ5c007997;
	Tue, 2 Apr 2024 21:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=ZxH9CqC68TT0FwT6CSXPvi8wPDubWnhBvphdimulvgQ=; b=aq
	waeFPUPK5+MsHBGzog7OVJplIQ0Q+FC5ctodzV49PsVsIuWPaHnirP5kuSFmOhm8
	aKu+LpKFKF1m1ARsAOYtOnhif9BLCa+rQjV0AlPS8ieMGrOsFhoYJpNtGBW1Yq4e
	reJ3JaL3bYiWq5LJpgvFMW3f4pAUsxTPn3HVWVnjbmHsUh/JWT/H2C9PUvo4m6Py
	MEdkXzCciEAVtzFtmkxPFXqx3gZKmqtxpaScHgOzPGn7Hz0iSYPx+fbJKhjtgVQk
	XbBxe/r25qFiE8JmkY8KF1SVtJKgC3Qfa+nM00a4pvP9oVREO0KzzRaDomS7pelJ
	fYvUTT4C2DcMV4mm/P0Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8gn5hk62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 21:05:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432L5mTL000698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 21:05:48 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 14:05:48 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH 1/9] wifi: ath12k: advertise driver capabilities for MBSSID and EMA
Date: Tue, 2 Apr 2024 14:05:30 -0700
Message-ID: <20240402210538.7308-2-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240402210538.7308-1-quic_alokad@quicinc.com>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FFX7Gn5_Pr6I6wPOhfA01ReTvYZtLn_k
X-Proofpoint-ORIG-GUID: FFX7Gn5_Pr6I6wPOhfA01ReTvYZtLn_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_140552_925297_57B2AE4B 
X-CRM114-Status: GOOD (  15.50  )
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

Advertise the driver support for multiple BSSID (MBSSID) and
enhanced multi-BSSID advertisements (EMA) by setting extended
capabilities.

Configure mbssid_max_interfaces and ema_max_profile_periodicity
fields in structure wiphy which are used to advertise maximum number
of interfaces and profile periodicity supported by the driver.

Add new WMI fields to configure maximum vdev count supported for
MBSSID and profile periodicity in case of EMA.

Set WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET flag to allow
firmware to track and update the DTIM counts for each nontransmitted
profile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.h  | 1 +
 drivers/net/wireless/ath/ath12k/mac.c | 7 +++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 7 ++++++-
 drivers/net/wireless/ath/ath12k/wmi.h | 3 +++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 87965980b938..3ad365fc8254 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -79,6 +79,7 @@
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_RX_PEER_METADATA_VER_V1A	2
 #define TARGET_RX_PEER_METADATA_VER_V1B	3
+#define TARGET_EMA_MAX_PROFILE_PERIOD   8
 
 #define ATH12K_HW_MAX_QUEUES		4
 #define ATH12K_QUEUE_LEN		4096
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 52a5fb8b03e9..1600e6861881 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7857,19 +7857,23 @@ static int ath12k_mac_setup_iface_combinations(struct ath12k_hw *ah)
 
 static const u8 ath12k_if_types_ext_capa[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 };
 
 static const u8 ath12k_if_types_ext_capa_sta[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_REQUESTER_SUPPORT,
 };
 
 static const u8 ath12k_if_types_ext_capa_ap[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_RESPONDER_SUPPORT,
+	[10] = WLAN_EXT_CAPA11_EMA_SUPPORT,
 };
 
 static const struct wiphy_iftype_ext_capab ath12k_iftypes_ext_capa[] = {
@@ -8067,6 +8071,9 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->iftype_ext_capab = ath12k_iftypes_ext_capa;
 	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ath12k_iftypes_ext_capa);
 
+	wiphy->mbssid_max_interfaces = TARGET_NUM_VDEVS;
+	wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
+
 	if (ar->supports_6ghz) {
 		wiphy_ext_feature_set(wiphy,
 				      NL80211_EXT_FEATURE_FILS_DISCOVERY);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 34de3d16efc0..4ae7e16ca042 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -228,6 +228,9 @@ void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 	config->peer_map_unmap_version = 0x32;
 	config->twt_ap_pdev_count = ab->num_radios;
 	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
 
 	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
 		config->dp_peer_meta_data_ver = TARGET_RX_PEER_METADATA_VER_V1B;
@@ -3331,9 +3334,11 @@ ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cf
 	wmi_cfg->twt_ap_sta_count = cpu_to_le32(tg_cfg->twt_ap_sta_count);
 	wmi_cfg->flags2 = le32_encode_bits(tg_cfg->dp_peer_meta_data_ver,
 					   WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION);
-
 	wmi_cfg->host_service_flags = cpu_to_le32(tg_cfg->is_reg_cc_ext_event_supported <<
 				WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT);
+	wmi_cfg->ema_max_vap_cnt = cpu_to_le32(tg_cfg->ema_max_vap_cnt);
+	wmi_cfg->ema_max_profile_period = cpu_to_le32(tg_cfg->ema_max_profile_period);
+	wmi_cfg->flags2 |= cpu_to_le32(WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET);
 }
 
 static int ath12k_init_cmd_send(struct ath12k_wmi_pdev *wmi,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 6a2da0739ac8..f70a00f2a587 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2347,6 +2347,8 @@ struct ath12k_wmi_resource_config_arg {
 	u32 twt_ap_sta_count;
 	bool is_reg_cc_ext_event_supported;
 	u8  dp_peer_meta_data_ver;
+	u32 ema_max_vap_cnt;
+	u32 ema_max_profile_period;
 };
 
 struct ath12k_wmi_init_cmd_arg {
@@ -2400,6 +2402,7 @@ struct wmi_init_cmd {
 
 #define WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT 4
 #define WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION		GENMASK(5, 4)
+#define WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET      BIT(9)
 
 struct ath12k_wmi_resource_config_params {
 	__le32 tlv_header;
-- 
2.39.0


