Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A161ECD5BB1
	for <ath12k@archiver.kernel.org>; Mon, 25 May 2026 11:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJ/Xksj7c4wdpADXBCPISx/XQ8iXKAk8hf4Myg0NPK4=; b=bZ9xF8W85rmbmsU605XdGxNium
	RwOYTwlF0Zexq+fF0l+Mgmyr7I9VRaspLdN3nbHc29NuAZ88QmbtENraXNIGzF6ByavYwrzHG76JK
	U5luIwbJriUWM3UxNvhsnllvW4BkP9/8vtf0LQwvIKMoS86gQTXv32bGQdnUrJtLOYtNaiAKKuMQA
	S52kYecMtQWxvkk38mA6AT6YUB4Mr76K2AFyKc/8jdmz6V9ELUGzEDseXEkSS5vaWPDB+4q95ZGMS
	zo3NBv3cTPXxNmslM9/7AaOMLgwcMUX0IazU40qlKfopBlXlSaCELXwYQSRT2RkcdiGV0suzCI+OB
	hmblt7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTCK-0000000H23d-1hNt;
	Mon, 25 May 2026 11:10:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTCH-0000000H21P-3DsX
	for ath12k@lists.infradead.org;
	Mon, 25 May 2026 11:10:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P88dvU3267799;
	Mon, 25 May 2026 11:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FJ/Xksj7c4w
	dpADXBCPISx/XQ8iXKAk8hf4Myg0NPK4=; b=Vmw+7ZYQrCQHVSt0bAXK3Vfv8YM
	0IMxjgJ5/ZAtpSL3XAjHcthKsdrVDA8J7WUsGinBsdbyJ/UBM285+hz30fzb95VT
	ruqfJh6tpaALH0FCNCk/A//IMroS5jLLYDqKmA0+9TbKZpcKcp1VxoKBJ9o78uov
	lTziSK4No9wLD27vSIAhCbwUVd5MvQiJ/yHeAE4wsByFyR4yDRI5fhQIJ//mYj93
	bs8sU6w6wN/mbVqYsE+fUGBkdk5cIRLfcqVp5EOR7TIIezYk14vQnLJokfluSX4z
	TPRfr3ttq8PCwErNj7RT2HDXoa6tfPOjZKvKpCG5rTjEowt4BIsO3LNKrmA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmpsch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64PBA7uN026268;
	Mon, 25 May 2026 11:10:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4eb5ajfc3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:09 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64PBA9BJ026292;
	Mon, 25 May 2026 11:10:09 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-tamizhr-blr.qualcomm.com [10.190.110.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64PBA9qZ026291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:09 +0000 (GMT)
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 380741)
	id 444134195D; Mon, 25 May 2026 16:40:08 +0530 (+0530)
From: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Subject: [PATCH ath-next 4/6] wifi: ath12k: Add support for 4-address NULL frame handling
Date: Mon, 25 May 2026 16:39:40 +0530
Message-Id: <20260525110942.2890212-5-tamizh.raja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
References: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfX267utIm7Wkux
 t7Sg+3GRC5I3NKKKAX8anv+e81xqE/OjCq2Sfw0gRDUZwohePJD72+iBgBbs09PQiV9EUJGTI5I
 GWw3E+NZcgfr6RCLdrHd/bvuctaCICx5Q18A6caLQLPUB+IV2YVRpy2JpAWInGKdbmBl+O5Elxj
 NQOBT1TGRGNgEYEdkkkDI7Bi9viPXxCIpeogz+lCJ++M811zMOhaYTiE2F84YwVwYjLrLOO2QZS
 /Ofwu8orhwiFdVKI2XKEYcEHhYUZFTJANDRWgC8vgyD6tnXApHkJqtwamtzUSmaY/ZJM/cuDWPG
 r0V0cJPzedmyn+ZPpv1TGhT5pZF0sGgTVePbI2peKdSzNbJuYjGh2Qfwg0ZGvoHYwNtR/v2N4My
 p/CyRlZmhW7guvzW1v/WZPZjJoXDk59U8LZVOm79+oMGC4SYgJgaMEOMTVpuSQlcey+uAhA0wCp
 QhH/+4IycvPPnKn7vbw==
X-Proofpoint-ORIG-GUID: c6txzqfXMKJKjal1I2NAK_5zCmVPby81
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a142e14 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=brp57BZpdt5iAIzBU8AA:9
X-Proofpoint-GUID: c6txzqfXMKJKjal1I2NAK_5zCmVPby81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041013_927383_7DF89204 
X-CRM114-Status: GOOD (  18.07  )
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

Currently, the firmware processes all NULL frames internally and
does not forward them to the host. As a result, the host never
receives 4-address NULL frames sent by a 4-address station.
These 4-address NULL frames are sent by the station to indicate
to the AP that it is operating in 4-address mode.

Enable WMI_RSRC_CFG_FLAGS2_WDS_NULL_FRAME_SUPPORT flag during WMI
initialization after verifying the WMI_SERVICE_WDS_NULL_FRAME_SUPPORT
service capability. This enables the firmware to forward all NULL frames
to the host. Add host-side handling to parse 4-address NULL frames and
forward them to mac80211 to support proper AP_VLAN interface creation.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/peer.c |  7 ++--
 drivers/net/wireless/ath/ath12k/wmi.c  | 44 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  |  3 ++
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index f7f0f613b393..b5a0ba149a28 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -220,10 +220,9 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 					  ahsta->link[link_id]);
 		/* TODO: Split DP related field usage to DP peer structure */
 		arsta->tcl_metadata = u16_encode_bits(0, HTT_TCL_META_DATA_TYPE) |
-				       u16_encode_bits(peer->peer_id,
-						       HTT_TCL_META_DATA_PEER_ID) |
-				       u16_encode_bits(0,
-						       HTT_TCL_META_DATA_VALID_HTT);
+				      u16_encode_bits(peer->peer_id,
+						      HTT_TCL_META_DATA_PEER_ID) |
+				      u16_encode_bits(0, HTT_TCL_META_DATA_VALID_HTT);
 		arsta->ast_hash = peer->ast_hash;
 		arsta->ast_idx = peer->hw_peer_id;
 		peer->link_id = arsta->link_id;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index eaed1c4ddd55..ffe51adcd12c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4194,6 +4194,10 @@ ath12k_wmi_copy_resource_config(struct ath12k_base *ab,
 	wmi_cfg->ema_max_profile_period = cpu_to_le32(tg_cfg->ema_max_profile_period);
 	wmi_cfg->flags2 |= cpu_to_le32(WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET |
 				       WMI_RSRC_CFG_FLAGS2_FW_AST_INDICATION_DISABLE);
+
+	if (tg_cfg->is_wds_null_frame_supported)
+		wmi_cfg->flags2 |=
+			cpu_to_le32(WMI_RSRC_CFG_FLAGS2_WDS_NULL_FRAME_SUPPORT);
 }
 
 static int ath12k_init_cmd_send(struct ath12k_wmi_pdev *wmi,
@@ -4403,6 +4407,9 @@ int ath12k_wmi_cmd_init(struct ath12k_base *ab)
 		     ab->wmi_ab.svc_map))
 		arg.res_cfg.is_reg_cc_ext_event_supported = true;
 
+	if (test_bit(WMI_TLV_SERVICE_WDS_NULL_FRAME_SUPPORT, ab->wmi_ab.svc_map))
+		arg.res_cfg.is_wds_null_frame_supported = true;
+
 	ab->hw_params->wmi_init(ab, &arg.res_cfg);
 	ab->wow.wmi_conf_rx_decap_mode = arg.res_cfg.rx_decap_mode;
 
@@ -7224,7 +7231,11 @@ static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
 	struct ath12k_wmi_mgmt_rx_arg rx_ev = {};
 	struct ath12k *ar;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
+	struct ieee80211_sta *pubsta = NULL;
+	struct ath12k_dp_link_peer *peer;
 	struct ieee80211_hdr *hdr;
+	bool is_4addr_null_pkt;
+	struct ath12k_dp *dp;
 	u16 fc;
 	struct ieee80211_supported_band *sband;
 	s32 noise_floor;
@@ -7299,6 +7310,38 @@ static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
 	hdr = (struct ieee80211_hdr *)skb->data;
 	fc = le16_to_cpu(hdr->frame_control);
 
+	is_4addr_null_pkt = (ieee80211_is_nullfunc(hdr->frame_control) ||
+			     ieee80211_is_qos_nullfunc(hdr->frame_control)) &&
+			    ieee80211_has_a4(hdr->frame_control);
+
+	/*
+	 * Add check to drop frames other than 4-address NULL frame. Since
+	 * firmware sends all NULL frames in this path (3-address and 4-address)
+	 */
+	if (ieee80211_is_data(hdr->frame_control) && !is_4addr_null_pkt) {
+		dev_kfree_skb(skb);
+		goto exit;
+	}
+
+	if (is_4addr_null_pkt) {
+		dp = ath12k_ab_to_dp(ar->ab);
+		spin_lock_bh(&dp->dp_lock);
+		peer = ath12k_dp_link_peer_find_by_pdev_and_addr(dp, ar->pdev_idx,
+								 hdr->addr2);
+		if (!peer) {
+			spin_unlock_bh(&dp->dp_lock);
+			dev_kfree_skb(skb);
+			goto exit;
+		}
+		pubsta = peer->sta;
+		if (pubsta && pubsta->valid_links) {
+			status->link_valid = 1;
+			status->link_id = peer->link_id;
+		}
+		spin_unlock_bh(&dp->dp_lock);
+		goto send_rx;
+	}
+
 	/* Firmware is guaranteed to report all essential management frames via
 	 * WMI while it can deliver some extra via HTT. Since there can be
 	 * duplicates split the reporting wrt monitor/sniffing.
@@ -7322,6 +7365,7 @@ static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
 	if (ieee80211_is_beacon(hdr->frame_control))
 		ath12k_mac_handle_beacon(ar, skb);
 
+send_rx:
 	ath12k_dbg(ab, ATH12K_DBG_MGMT,
 		   "event mgmt rx skb %p len %d ftype %02x stype %02x\n",
 		   skb, skb->len,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 13d82f706d79..c452e3d57a29 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2278,6 +2278,7 @@ enum wmi_tlv_service {
 
 	WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT = 365,
 	WMI_TLV_SERVICE_THERM_THROT_POUT_REDUCTION = 410,
+	WMI_TLV_SERVICE_WDS_NULL_FRAME_SUPPORT = 421,
 	WMI_TLV_SERVICE_IS_TARGET_IPA = 425,
 	WMI_TLV_SERVICE_THERM_THROT_TX_CHAIN_MASK = 426,
 	WMI_TLV_SERVICE_THERM_THROT_5_LEVELS = 429,
@@ -2511,6 +2512,7 @@ struct ath12k_wmi_resource_config_arg {
 	u32 ema_max_vap_cnt;
 	u32 ema_max_profile_period;
 	bool is_reg_cc_ext_event_supported;
+	bool is_wds_null_frame_supported;
 };
 
 struct ath12k_wmi_init_cmd_arg {
@@ -2568,6 +2570,7 @@ struct wmi_init_cmd {
 #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64	BIT(5)
 #define WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET      BIT(9)
 #define WMI_RSRC_CFG_FLAGS2_FW_AST_INDICATION_DISABLE	BIT(18)
+#define WMI_RSRC_CFG_FLAGS2_WDS_NULL_FRAME_SUPPORT		BIT(22)
 #define WMI_RSRC_CFG_FLAG1_ACK_RSSI	BIT(18)
 
 struct ath12k_wmi_resource_config_params {
-- 
2.34.1


