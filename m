Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE15C71136
	for <ath12k@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tRlSqXWvhEswQjV14frkTWdUGfsegC+OB/RG0k7MWyE=; b=rLCnQiVfn/VDnG/o8n582dSb7m
	eYIuULWiTNkk85wEzR9hZrce++45j5pSIEzy6yt/t88L7dEoDK2t5XXzpTFLaSOknrweawH5BseNJ
	u+L8WslitNAZd3Eqlpy2fUrY9D8X/1uaglf+MGUWW8tXe08OGxzvGiCzBSVybtwGH9XfUI59Vn2Ze
	3/hr7qAUG6mTYNRlYmdAf2r7yV3v1S+Lpf5EnOrSnJTI7AMAr4tVd1XNDgrGQ/lqYsrLM37/0nvwU
	UBYcyfYVY2kfRb/fVHEQC/eEdzzN99bGLHLiXekd9v5Bbdi+5YkaPEjvDbuD/zGpVSqVHsNBrizKG
	3InzD/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhqO-0000000DO2v-33Z5;
	Thu, 12 Jun 2025 13:19:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPgOQ-0000000DBTD-0xEf
	for ath12k@lists.infradead.org;
	Thu, 12 Jun 2025 11:46:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8DjTr013459;
	Thu, 12 Jun 2025 11:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tRlSqXWvhEswQjV14frkTW
	dUGfsegC+OB/RG0k7MWyE=; b=ALhpjvX00RNejqzOWvMlMB89bActYjXItDzaDv
	Z8IaYEEo3benw5Jqd8H/JpcWlC/eEbxoJNUJmhwY0ygj2IVoZdcmA3YLuzWDek7y
	rl3I/I46ux6x7emQo2RJlwKVI3J9NKUUxzj/R0X1ukCC69M4gjDKh6CgvFUsGov7
	Cf5/X7wbLcmym9LYvaCSjPw5QczlNuZwWvhWDOcZKFLdEigeHL0z+DiYzyLQbsLO
	EPY8Cp7l4ZmCtleUSyxN7CeRBcaN8NPpJ16vHc2O2uWCTdyX7TCiZAZ7lPxrtWKa
	WkmxU90uMgEuSg6usdLxlciD/kUoWGjebT0sRvLMXUUO4Rrw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmng0aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 11:46:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55CBkcOt025976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 11:46:38 GMT
Received: from hu-ssreeela-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Jun 2025 04:46:36 -0700
From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sivashankari Madhavan
	<quic_sivamadh@quicinc.com>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>
Subject: [PATCH ath-next v2] wifi: ath12k: support average ack rssi in station dump
Date: Thu, 12 Jun 2025 17:16:20 +0530
Message-ID: <20250612114620.1055840-1-quic_ssreeela@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -V-jY0sGEMaTeZ4XrwNJf6rSfVNDbVXI
X-Proofpoint-GUID: -V-jY0sGEMaTeZ4XrwNJf6rSfVNDbVXI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4OSBTYWx0ZWRfX3mAOCRiXcQaG
 ZBTxrCw22W7+zhK2LRdfP+dpn8ZHbBfgQ2/HWp9NJHX37XiTiHckCdu5KDkQBD4TKL+FVwMifQU
 Rb3/qiwXcQi+fepvKElY1GKaDwlIFhver1KvSYqix/whvCDGKGyJlGKcU6VSOyFNC6sEWEEyKFG
 iqt6F5nd0Z74RW3/YNnaUbgFQJxULoaawBTG6099uWIdKCdQzg7Qw/0fTUzKaxOImxWrr+4V4WM
 MV2aWA0HPqhuBKhE4Si+j8k2+d7DbFiXiO0kKV8Saol9KVvYFLNH0Zt18uAF/3mkNBHqeD68zRy
 7Pn/RLNDDUYy8zGkZ51FVbQhmuds1LfgWge7MG0JOe9L/jpAjBtlVfKczvTI3frfQqW9Rp4W5Sv
 W5EComm3PQPhaoe2MmZ5kwVyfDVDFBcegKBlI6jC9aB3RwCgqZMsQX+rgXDem5Josua3hZ9Y
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684abe29 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=cKTmG8GoOr_ubyX9ojwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_044650_270551_EC9CE7A5 
X-CRM114-Status: GOOD (  15.38  )
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
v2:- Rebased

---
 drivers/net/wireless/ath/ath12k/dp_tx.c |  3 +++
 drivers/net/wireless/ath/ath12k/mac.c   |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c   | 15 +++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.h   |  3 +++
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index b6816b6c2c04..f65814deebf7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -890,6 +890,9 @@ static void ath12k_dp_tx_status_parse(struct ath12k_base *ab,
 
 	ts->peer_id = le32_get_bits(desc->info3, HAL_WBM_COMPL_TX_INFO3_PEER_ID);
 
+	ts->ack_rssi = le32_get_bits(desc->info2,
+				     HAL_WBM_COMPL_TX_INFO2_ACK_FRAME_RSSI);
+
 	if (info0 & HAL_TX_RATE_STATS_INFO0_VALID) {
 		ts->pkt_type = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_PKT_TYPE);
 		ts->mcs = u32_get_bits(info0, HAL_TX_RATE_STATS_INFO0_MCS);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88b59f3ff87a..c307d6fe5e80 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12071,6 +12071,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 
 	wiphy->cipher_suites = cipher_suites;
 	wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 60e2444fe08c..1a238ef36a72 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3875,7 +3875,8 @@ ath12k_wmi_copy_resource_config(struct ath12k_base *ab,
 	wmi_cfg->max_bssid_rx_filters = cpu_to_le32(tg_cfg->max_bssid_rx_filters);
 	wmi_cfg->use_pdev_id = cpu_to_le32(tg_cfg->use_pdev_id);
 	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config |
-				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64);
+				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 |
+				     WMI_RSRC_CFG_FLAG1_ACK_RSSI);
 	wmi_cfg->peer_map_unmap_version = cpu_to_le32(tg_cfg->peer_map_unmap_version);
 	wmi_cfg->sched_params = cpu_to_le32(tg_cfg->sched_params);
 	wmi_cfg->twt_ap_pdev_count = cpu_to_le32(tg_cfg->twt_ap_pdev_count);
@@ -5582,7 +5583,7 @@ static int ath12k_pull_mgmt_rx_params_tlv(struct ath12k_base *ab,
 }
 
 static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
-				    u32 status)
+				    u32 status, u32 ack_rssi)
 {
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
@@ -5606,8 +5607,11 @@ static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
 	dma_unmap_single(ar->ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	info = IEEE80211_SKB_CB(msdu);
-	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) && !status)
+	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) && !status) {
 		info->flags |= IEEE80211_TX_STAT_ACK;
+		info->status.ack_signal = ack_rssi;
+		info->status.flags |= IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
+	}
 
 	if ((info->flags & IEEE80211_TX_CTL_NO_ACK) && !status)
 		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
@@ -5651,6 +5655,8 @@ static int ath12k_pull_mgmt_tx_compl_param_tlv(struct ath12k_base *ab,
 	param->pdev_id = ev->pdev_id;
 	param->desc_id = ev->desc_id;
 	param->status = ev->status;
+	param->ppdu_id = ev->ppdu_id;
+	param->ack_rssi = ev->ack_rssi;
 
 	kfree(tb);
 	return 0;
@@ -6552,7 +6558,8 @@ static void ath12k_mgmt_tx_compl_event(struct ath12k_base *ab, struct sk_buff *s
 	}
 
 	wmi_process_mgmt_tx_comp(ar, le32_to_cpu(tx_compl_param.desc_id),
-				 le32_to_cpu(tx_compl_param.status));
+				 le32_to_cpu(tx_compl_param.status),
+				 le32_to_cpu(tx_compl_param.ack_rssi));
 
 	ath12k_dbg(ab, ATH12K_DBG_MGMT,
 		   "mgmt tx compl ev pdev_id %d, desc_id %d, status %d",
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index ac18f75e0449..49010367dc06 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2486,6 +2486,7 @@ struct wmi_init_cmd {
 #define WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION		GENMASK(5, 4)
 #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64	BIT(5)
 #define WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET      BIT(9)
+#define WMI_RSRC_CFG_FLAG1_ACK_RSSI	BIT(18)
 
 struct ath12k_wmi_resource_config_params {
 	__le32 tlv_header;
@@ -4445,6 +4446,8 @@ struct wmi_mgmt_tx_compl_event {
 	__le32 desc_id;
 	__le32 status;
 	__le32 pdev_id;
+	__le32 ppdu_id;
+	__le32 ack_rssi;
 } __packed;
 
 struct wmi_scan_event {

base-commit: 9f92c4a01c5268f57fa19dd7cbcb1f59b0e66da6
-- 
2.25.1


