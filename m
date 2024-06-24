Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E8FC2D0D1
	for <ath12k@archiver.kernel.org>; Mon, 24 Jun 2024 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=td0jRHyPx46meI7OkySZkk4+hMBStI4wF034R0ZIlIk=; b=0ZUXXmLBb9I2YUfoJiWfCRbzJU
	WxBIJGl4iCGwoDC+7dr+BgggF0P8LH3PlpB/dGRzfOstKRUbFxFQfWXJuPAVGmVWeVP5NpBGOSIqk
	re8bOOm1BexIHfP2f8RWkCGKqIX20RfmFKfqm8CMQ5QPmQHBvY0dUUAWeyMSz3gkFSW2qntMJMwGI
	d/UT1+NCr0c6k60ztnQ/ETLZOjybPRfLu/O12iuSg8us3WaZE7WmaISax6iZRc15Rbhk+PkVqW+Xj
	tZo3PgzG/QIpfszXRPL41BX3SWCjt96uwwGlLR7pE/b1iL0YZKcmCilR8gc9rzUV5H1oAFPOFSoNJ
	AQIRcTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLl5t-0000000HBuf-0EFk
	for ath12k@archiver.kernel.org;
	Mon, 24 Jun 2024 14:54:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLl5p-0000000HBrr-09sr
	for ath12k@lists.infradead.org;
	Mon, 24 Jun 2024 14:54:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O8YdUi018139;
	Mon, 24 Jun 2024 14:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=td0jRHyPx46meI7OkySZkk
	4+hMBStI4wF034R0ZIlIk=; b=h5/EaP7R75rIwtNZHk1lRN1EnHBVYpn5Esu2wW
	2rykvGTJZ1vFcBhQypT84HWHrtT32dSLLo+zbkU81QyRScO0b7OuF6Qf0N4/KZZW
	n6+c02DeTNt0GuVMY1IQp2P9tgPPM0Uvqm+0PnXZpZCH1eOxvwMBEU0BSplishoz
	qsuswvNJE9O76qD/F8XqAAJk+KBBgx/5GxuaALl0hcCU41R9+uGGNqUClpIQuA1I
	gUkmKEph9j5XU1Rb4qXa9g+QrXlkSzQFl5GFznN/yCWfN37yWQ088RBDeE+3S0Md
	4MbNT2a3kcNXtcLZbvqh/HABJr+zQO8d+MifA77a0oS9/WUw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6kxdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 14:54:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45OEsnPS027260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 14:54:49 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Jun 2024 07:54:47 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix peer metadata parsing
Date: Mon, 24 Jun 2024 20:24:18 +0530
Message-ID: <20240624145418.2043461-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _K9H0FmIBnkUzWtI5IHeVUInyiYr4Rzk
X-Proofpoint-ORIG-GUID: _K9H0FmIBnkUzWtI5IHeVUInyiYr4Rzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_11,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406240119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_075453_597122_73C2369D 
X-CRM114-Status: GOOD (  16.65  )
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

Currently, the Rx data path only supports parsing peer metadata of version
zero. However, the QCN9274 platform configures the peer metadata version
as V1B. When V1B peer metadata is parsed using the version zero logic,
invalid data is populated, causing valid packets to be dropped. To address
this issue, refactor the peer metadata version and add the version based
parsing to populate the data from peer metadata correctly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: 287033810990 ("wifi: ath12k: add support for peer meta data version")
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h       |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c    | 39 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/hal_desc.h | 26 +++++++++++++--
 drivers/net/wireless/ath/ath12k/hw.h       |  2 --
 drivers/net/wireless/ath/ath12k/wmi.c      |  6 ++--
 drivers/net/wireless/ath/ath12k/wmi.h      | 11 ++++--
 6 files changed, 71 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 742094545089..b77497c14ac4 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -333,6 +333,7 @@ struct ath12k_dp {
 	struct dp_srng reo_except_ring;
 	struct dp_srng reo_cmd_ring;
 	struct dp_srng reo_status_ring;
+	enum ath12k_peer_metadata_version peer_metadata_ver;
 	struct dp_srng reo_dst_ring[DP_REO_DST_RING_MAX];
 	struct dp_tx_ring tx_ring[DP_TCL_NUM_RING_MAX];
 	struct hal_wbm_idle_scatter_list scatter_list[DP_IDLE_SCATTER_BUFS_MAX];
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 54aea3c22311..2df50814d83a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2583,6 +2583,28 @@ static void ath12k_dp_rx_process_received_packets(struct ath12k_base *ab,
 	rcu_read_unlock();
 }
 
+static u16 ath12k_dp_rx_get_peer_id(enum ath12k_peer_metadata_version ver,
+				    __le32 peer_metadata)
+{
+	switch (ver) {
+	default:
+		WARN_ON(1);
+		fallthrough;
+	case ATH12K_PEER_METADATA_V0:
+		return le32_get_bits(peer_metadata,
+				     RX_MPDU_DESC_META_DATA_V0_PEER_ID);
+	case ATH12K_PEER_METADATA_V1:
+		return le32_get_bits(peer_metadata,
+				     RX_MPDU_DESC_META_DATA_V1_PEER_ID);
+	case ATH12K_PEER_METADATA_V1A:
+		return le32_get_bits(peer_metadata,
+				     RX_MPDU_DESC_META_DATA_V1A_PEER_ID);
+	case ATH12K_PEER_METADATA_V1B:
+		return le32_get_bits(peer_metadata,
+				     RX_MPDU_DESC_META_DATA_V1B_PEER_ID);
+	}
+}
+
 int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 			 struct napi_struct *napi, int budget)
 {
@@ -2611,6 +2633,8 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 	ath12k_hal_srng_access_begin(ab, srng);
 
 	while ((desc = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
+		struct rx_mpdu_desc *mpdu_info;
+		struct rx_msdu_desc *msdu_info;
 		enum hal_reo_dest_ring_push_reason push_reason;
 		u32 cookie;
 
@@ -2658,16 +2682,19 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 			continue;
 		}
 
-		rxcb->is_first_msdu = !!(le32_to_cpu(desc->rx_msdu_info.info0) &
+		msdu_info = &desc->rx_msdu_info;
+		mpdu_info = &desc->rx_mpdu_info;
+
+		rxcb->is_first_msdu = !!(le32_to_cpu(msdu_info->info0) &
 					 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
-		rxcb->is_last_msdu = !!(le32_to_cpu(desc->rx_msdu_info.info0) &
+		rxcb->is_last_msdu = !!(le32_to_cpu(msdu_info->info0) &
 					RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
-		rxcb->is_continuation = !!(le32_to_cpu(desc->rx_msdu_info.info0) &
+		rxcb->is_continuation = !!(le32_to_cpu(msdu_info->info0) &
 					   RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
 		rxcb->mac_id = mac_id;
-		rxcb->peer_id = le32_get_bits(desc->rx_mpdu_info.peer_meta_data,
-					      RX_MPDU_DESC_META_DATA_PEER_ID);
-		rxcb->tid = le32_get_bits(desc->rx_mpdu_info.info0,
+		rxcb->peer_id = ath12k_dp_rx_get_peer_id(dp->peer_metadata_ver,
+							 mpdu_info->peer_meta_data);
+		rxcb->tid = le32_get_bits(mpdu_info->info0,
 					  RX_MPDU_DESC_INFO0_TID);
 
 		__skb_queue_tail(&msdu_list, msdu);
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 02b7db06b24e..739f73370015 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -597,8 +597,30 @@ struct hal_tlv_64_hdr {
 #define RX_MPDU_DESC_INFO0_MPDU_QOS_CTRL_VALID	BIT(27)
 #define RX_MPDU_DESC_INFO0_TID			GENMASK(31, 28)
 
-/* TODO revisit after meta data is concluded */
-#define RX_MPDU_DESC_META_DATA_PEER_ID		GENMASK(15, 0)
+/* Peer Metadata classification */
+
+/* Version 0 */
+#define RX_MPDU_DESC_META_DATA_V0_PEER_ID	GENMASK(15, 0)
+#define RX_MPDU_DESC_META_DATA_V0_VDEV_ID	GENMASK(23, 16)
+
+/* Version 1 */
+#define RX_MPDU_DESC_META_DATA_V1_PEER_ID		GENMASK(13, 0)
+#define RX_MPDU_DESC_META_DATA_V1_LOGICAL_LINK_ID	GENMASK(15, 14)
+#define RX_MPDU_DESC_META_DATA_V1_VDEV_ID		GENMASK(23, 16)
+#define RX_MPDU_DESC_META_DATA_V1_LMAC_ID		GENMASK(25, 24)
+#define RX_MPDU_DESC_META_DATA_V1_DEVICE_ID		GENMASK(28, 26)
+
+/* Version 1A */
+#define RX_MPDU_DESC_META_DATA_V1A_PEER_ID		GENMASK(13, 0)
+#define RX_MPDU_DESC_META_DATA_V1A_VDEV_ID		GENMASK(21, 14)
+#define RX_MPDU_DESC_META_DATA_V1A_LOGICAL_LINK_ID	GENMASK(25, 22)
+#define RX_MPDU_DESC_META_DATA_V1A_DEVICE_ID		GENMASK(28, 26)
+
+/* Version 1B */
+#define RX_MPDU_DESC_META_DATA_V1B_PEER_ID	GENMASK(13, 0)
+#define RX_MPDU_DESC_META_DATA_V1B_VDEV_ID	GENMASK(21, 14)
+#define RX_MPDU_DESC_META_DATA_V1B_HW_LINK_ID	GENMASK(25, 22)
+#define RX_MPDU_DESC_META_DATA_V1B_DEVICE_ID	GENMASK(28, 26)
 
 struct rx_mpdu_desc {
 	__le32 info0; /* %RX_MPDU_DESC_INFO */
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index af33bf11416b..e792eb6b249b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -78,8 +78,6 @@
 #define TARGET_NUM_WDS_ENTRIES		32
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
-#define TARGET_RX_PEER_METADATA_VER_V1A	2
-#define TARGET_RX_PEER_METADATA_VER_V1B	3
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d6e1d1398cdb..7d420757d516 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -233,7 +233,7 @@ void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
 
 	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
-		config->dp_peer_meta_data_ver = TARGET_RX_PEER_METADATA_VER_V1B;
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
 }
 
 void ath12k_wmi_init_wcn7850(struct ath12k_base *ab,
@@ -3498,7 +3498,7 @@ ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cf
 	wmi_cfg->sched_params = cpu_to_le32(tg_cfg->sched_params);
 	wmi_cfg->twt_ap_pdev_count = cpu_to_le32(tg_cfg->twt_ap_pdev_count);
 	wmi_cfg->twt_ap_sta_count = cpu_to_le32(tg_cfg->twt_ap_sta_count);
-	wmi_cfg->flags2 = le32_encode_bits(tg_cfg->dp_peer_meta_data_ver,
+	wmi_cfg->flags2 = le32_encode_bits(tg_cfg->peer_metadata_ver,
 					   WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION);
 	wmi_cfg->host_service_flags = cpu_to_le32(tg_cfg->is_reg_cc_ext_event_supported <<
 				WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT);
@@ -3728,6 +3728,8 @@ int ath12k_wmi_cmd_init(struct ath12k_base *ab)
 	arg.num_band_to_mac = ab->num_radios;
 	ath12k_fill_band_to_mac_param(ab, arg.band_to_mac);
 
+	ab->dp.peer_metadata_ver = arg.res_cfg.peer_metadata_ver;
+
 	return ath12k_init_cmd_send(&wmi_ab->wmi[0], &arg);
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index c2b86e187a03..6db3c3e00e63 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2293,6 +2293,13 @@ struct ath12k_wmi_host_mem_chunk_arg {
 	u32 req_id;
 };
 
+enum ath12k_peer_metadata_version {
+	ATH12K_PEER_METADATA_V0,
+	ATH12K_PEER_METADATA_V1,
+	ATH12K_PEER_METADATA_V1A,
+	ATH12K_PEER_METADATA_V1B
+};
+
 struct ath12k_wmi_resource_config_arg {
 	u32 num_vdevs;
 	u32 num_peers;
@@ -2355,10 +2362,10 @@ struct ath12k_wmi_resource_config_arg {
 	u32 sched_params;
 	u32 twt_ap_pdev_count;
 	u32 twt_ap_sta_count;
-	bool is_reg_cc_ext_event_supported;
-	u8  dp_peer_meta_data_ver;
+	enum ath12k_peer_metadata_version peer_metadata_ver;
 	u32 ema_max_vap_cnt;
 	u32 ema_max_profile_period;
+	bool is_reg_cc_ext_event_supported;
 };
 
 struct ath12k_wmi_init_cmd_arg {

base-commit: cac9bfd02678adbcca9a7dce770609b9f7434d37
-- 
2.34.1


