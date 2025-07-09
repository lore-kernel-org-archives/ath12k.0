Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973D1C83F03
	for <ath12k@archiver.kernel.org>; Wed,  9 Jul 2025 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MUfNwVZItN2GyYUK9C6rO6Cz/TaYoHSFIUWGINdNC44=; b=mstqqqUdS+VoWFOp56KID68k31
	/yo5vQYjbkd298SK3Fox7Nu16zD3J6cEkzw0djh685qDRwphME1vyE1B8x/h+PUQDpBD5NNppvG8r
	MDzTkaDiky7W5tfwU8M+E37O7WY1ZBn9vQCgShkK8t4KBvlAWRNzcDtI8L933dPbpV9mDLdaVHnTk
	HAlVFxrBBniUngc4xOBYcizvZJJni2u57DWcD6E+fvetN77R8t9YBslKjQUUeCBTMZk1aaaaJ+LSi
	Z/sswygd4VRFz6kFF7DqLXjkHPueF/TMBvEROK7ZRGhliCWfSZatdYsa2ZJ3c3kvfwe5bjPKrNvgP
	Px893abA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZX7e-00000009DnM-0Xv8;
	Wed, 09 Jul 2025 15:54:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUyv-00000008nyG-2lOK
	for ath12k@lists.infradead.org;
	Wed, 09 Jul 2025 13:37:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Com7B002907;
	Wed, 9 Jul 2025 13:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MUfNwVZItN2GyYUK9C6rO6
	Cz/TaYoHSFIUWGINdNC44=; b=GWgEXZwzwCkZlWH/beGnh6g2VAFE44rVNQ54Io
	toWkp/q8lUo1NIUD8QXrGclVUeWbm84dGFhecOOOlA0pvw8RoqXbSzItDNj8jIkT
	4UmsCxZ2JWKBheuRTQ3XPEbPj43DHqhPTNkZo2xfni3B3MBWDlv5lFHeVH+96Ie7
	5DROv8HIu6XamxQaTxAIs+MvJg6WbbYOEZQv4lLElwp97Aw7VFStfHqwvW5cO4e5
	IeNh/aSzUnH4q1eE3rrrtnhkQ7gZAyYHmNp5UK9msi2tBTzQzJvql4FOO3O66la5
	JX3l1vms4oCsTnUvgUxoccLBmQnQFnY/E3BQZsxbvYQT8qAw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bchkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 13:37:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 569Db2Df018768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 13:37:02 GMT
Received: from hu-ssreeela-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 06:37:00 -0700
From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sivashankari Madhavan
	<quic_sivamadh@quicinc.com>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>
Subject: [PATCH ath-next v3] wifi: ath12k: support average ack rssi in station dump
Date: Wed, 9 Jul 2025 19:05:54 +0530
Message-ID: <20250709133554.622463-1-quic_ssreeela@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyMiBTYWx0ZWRfXzsg7shENI57k
 w5/oNGRkveT8xc2oT9s8hQJUZ+o3LfJyo2/syylefPV5Us9eUjPPC21JsQeui2BPsxzXXJCAUuD
 75Nne7VvCSkYCUrAUu+rUQcc7dOlYQ9uwAbhh6PT6axTIpXBQOF+FsS+EwlUS8O8a5Cu3HnJAqN
 Opz17qWdMm4y5hBQ5HGjpIMkHwLhMpYhFQ0NCZOKhi82+aU/DI6YrOqPN1dgWaYfpeiljD4t3mJ
 H8HKWXDDPOSUQ8i9lOrr/K5v8e1s6YflYQ+ExnFnBUbwuafIQgw6RD2sCPolkjiDDNreLcYxW9Z
 8JCa+6staLBJqE4yAbxjEEs5iEHxksMnTvbz9sVJebJgXMaRuNRKPTOkLsxT4FBxidNV4/z+1i6
 +VHwb4biTLDPQ/5IvR3320xZuOWF3HDIATN8B8Zfbu72bGpMSggQ344VeRMS+mL3s3YDl4TR
X-Proofpoint-ORIG-GUID: mxUO6TQSuCUdazOCTKJtl-3jZOLxXKJ1
X-Proofpoint-GUID: mxUO6TQSuCUdazOCTKJtl-3jZOLxXKJ1
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686e707f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EAzjnaRIrpkg74q0i-0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_063705_836089_7573C906 
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

From: Sivashankari Madhavan <quic_sivamadh@quicinc.com>

Currently, the ACK RSSI value is not shown in station dump. Enable WMI
resource flag for ACK RSSI in WMI INIT command to add ACK RSSI value in
management TX completion event from WMI. Update ACK RSSI value obtained
in management and data frame completion path to ieee80211_tx_info. Also
advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag during hardware
register to mac80211 layer so that ACK RSSI is added to station dump
message.

Example output :
Station 00:03:7f:01:5c:4b (on wlp88s0)
        inactive time:  46584 ms
        rx bytes:       955
        rx packets:     10
        tx bytes:       769
        tx packets:     6
        tx retries:     81
        tx failed:      0
        rx drop misc:   0
        signal:         -39 dBm
        signal avg:     -40 dBm
        tx bitrate:     6.0 MBit/s
        tx duration:    1185 us
        rx bitrate:     309.7 MBit/s 40MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
        rx duration:    0 us
        last ack signal:-41 dBm
        avg ack signal: -40 dBm
        authorized:     yes
        authenticated:  yes
        .......

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
---
v3:- Rebased
v2:- Rebased
---
 drivers/net/wireless/ath/ath12k/dp_tx.c |  3 +++
 drivers/net/wireless/ath/ath12k/mac.c   |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c   | 15 +++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.h   |  3 +++
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 1fa37cda1046..56c08199c79f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -901,6 +901,9 @@ static void ath12k_dp_tx_status_parse(struct ath12k_base *ab,
 
 	ts->peer_id = le32_get_bits(desc->info3, HAL_WBM_COMPL_TX_INFO3_PEER_ID);
 
+	ts->ack_rssi = le32_get_bits(desc->info2,
+				     HAL_WBM_COMPL_TX_INFO2_ACK_FRAME_RSSI);
+
 	if (info0 & HAL_TX_RATE_STATS_INFO0_VALID) {
 		ts->pkt_type = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_PKT_TYPE);
 		ts->mcs = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_MCS);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 42eb9e8e14d1..fd655017bea9 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -13790,6 +13790,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 
 	wiphy->cipher_suites = cipher_suites;
 	wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index b34f2c183312..83fb1d847dbd 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3883,7 +3883,8 @@ ath12k_wmi_copy_resource_config(struct ath12k_base *ab,
 	wmi_cfg->max_bssid_rx_filters = cpu_to_le32(tg_cfg->max_bssid_rx_filters);
 	wmi_cfg->use_pdev_id = cpu_to_le32(tg_cfg->use_pdev_id);
 	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config |
-				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64);
+				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 |
+				     WMI_RSRC_CFG_FLAG1_ACK_RSSI);
 	wmi_cfg->peer_map_unmap_version = cpu_to_le32(tg_cfg->peer_map_unmap_version);
 	wmi_cfg->sched_params = cpu_to_le32(tg_cfg->sched_params);
 	wmi_cfg->twt_ap_pdev_count = cpu_to_le32(tg_cfg->twt_ap_pdev_count);
@@ -6119,7 +6120,7 @@ static int ath12k_pull_mgmt_rx_params_tlv(struct ath12k_base *ab,
 }
 
 static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
-				    u32 status)
+				    u32 status, u32 ack_rssi)
 {
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
@@ -6148,8 +6149,11 @@ static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
 	/* skip tx rate update from ieee80211_status*/
 	info->status.rates[0].idx = -1;
 
-	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) && !status)
+	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) && !status) {
 		info->flags |= IEEE80211_TX_STAT_ACK;
+		info->status.ack_signal = ack_rssi;
+		info->status.flags |= IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
+	}
 
 	if ((info->flags & IEEE80211_TX_CTL_NO_ACK) && !status)
 		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
@@ -6193,6 +6197,8 @@ static int ath12k_pull_mgmt_tx_compl_param_tlv(struct ath12k_base *ab,
 	param->pdev_id = ev->pdev_id;
 	param->desc_id = ev->desc_id;
 	param->status = ev->status;
+	param->ppdu_id = ev->ppdu_id;
+	param->ack_rssi = ev->ack_rssi;
 
 	kfree(tb);
 	return 0;
@@ -7119,7 +7125,8 @@ static void ath12k_mgmt_tx_compl_event(struct ath12k_base *ab, struct sk_buff *s
 	}
 
 	wmi_process_mgmt_tx_comp(ar, le32_to_cpu(tx_compl_param.desc_id),
-				 le32_to_cpu(tx_compl_param.status));
+				 le32_to_cpu(tx_compl_param.status),
+				 le32_to_cpu(tx_compl_param.ack_rssi));
 
 	ath12k_dbg(ab, ATH12K_DBG_MGMT,
 		   "mgmt tx compl ev pdev_id %d, desc_id %d, status %d",
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index ed9b4324a7b8..dba8964246c8 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2526,6 +2526,7 @@ struct wmi_init_cmd {
 #define WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION		GENMASK(5, 4)
 #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64	BIT(5)
 #define WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET      BIT(9)
+#define WMI_RSRC_CFG_FLAG1_ACK_RSSI	BIT(18)
 
 struct ath12k_wmi_resource_config_params {
 	__le32 tlv_header;
@@ -4512,6 +4513,8 @@ struct wmi_mgmt_tx_compl_event {
 	__le32 desc_id;
 	__le32 status;
 	__le32 pdev_id;
+	__le32 ppdu_id;
+	__le32 ack_rssi;
 } __packed;
 
 struct wmi_scan_event {

base-commit: 45bbd91fc41b7cb6319e45e6fd732c5c8a0c44e3
-- 
2.25.1


