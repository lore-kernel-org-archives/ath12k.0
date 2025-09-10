Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC58CAC58E
	for <ath12k@archiver.kernel.org>; Wed, 10 Sep 2025 18:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L47GoqT7nAWiSjpo/IwoS8icnrBtMuxNW61JhSkxnjw=; b=0yuHrcF5POR9LqxBHLSDX8KibS
	q6q4FHGRTZVCvIoAL0lixTUdqpr1VoU99hPd17i51V0UcA4Aja8AXPXBZ4x4XHEZc+n2WjPvDz85V
	rHUzWF/X+BoeT5zcve4CSpiXZkUl5mBF6VvxGIl6EdX6LzSXTImU5phaOgSvBupRZKn44BuqHIyR2
	G8LdEeBp987ufWBfJzP6zcz3kfQ/i4rMd6yXeZLM3TTXmoWsDi6CA1RoYpSW01ctAtmp7DmmYBLxL
	oQD7pHl3Gps0g794w5VXYwFsOLG7MDajuPNDcPZsqNDQhS3RJCZhxSZmrBFNdVVhXQ/dFS1QLWWY+
	zWaAz1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwPL8-0000000FzYX-1KYY;
	Wed, 10 Sep 2025 18:14:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwPL5-0000000FzVK-203D
	for ath12k@lists.infradead.org;
	Wed, 10 Sep 2025 18:14:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgR64023834;
	Wed, 10 Sep 2025 18:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L47GoqT7nAWiSjpo/IwoS8icnrBtMuxNW61JhSkxnjw=; b=Q/tycNauAbbql/Uv
	jJryLVXubm1ZNAN+4GXXWFsCJB5suWS9L+IiTpQlQzLOeHjZiySMd9NiZgoS+Wrb
	TU6paCGPo4aMgBrHo09hAtZ7gH2ZKicdLYUl8gIoUh+PxjG7Nw5nJVWw1bm2K5e1
	oGbLgpQi8jB2WyonNpfaGM08JU7fy24BT0+MxrDXSaPKHB6PqFoT6AE036sz0nEe
	Ss7cinVa8/BQXTRwHACcmeW1rNbcy4FiTQyIFSnyqHwY3s5/v8pmh4VCPRDMHGJS
	Fr2fPM9JHGDCv5EiDq60dIEtcGnuLchwTbfX36AAXDjS5zrmN4QUfj+1NWVd45TS
	DoPvGQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m4rjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 18:14:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58AIEc0R019806
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 18:14:38 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 10 Sep 2025 11:14:37 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng v2 5/8] wifi: ath12k: Move hal_rx_ops callbacks to hal_ops
Date: Wed, 10 Sep 2025 23:44:11 +0530
Message-ID: <20250910181414.2062280-6-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
References: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX+jMcNRypa/bz
 opbKRuxEQJLwIYNIs2C/dC/l6xGFATaQDcfXLwlENgr9zys3kjGY44JJ0sKGOR+XYt+48gneS1F
 cFHdwi243ceLoROGtuiDt67uoafuKiUTxFNwUI8aXZ60ajQEigkful2/eN0RQWBt+XQ64rFKKPv
 JKVZAxPCvub69BI8EK5IRB6dZQX21u4+Wl+mniBOLSEI0W8iJMMYLGK9KAtwZBcrxgRR1QgNPfN
 DTcKBAJ6ktgqGkEONJWD7qdwpfv8GcpmIEG8aS2ZotOM+b7BF6aveo1KKurasetscUm23+XOAyK
 KArjBLg9h6nN9aQAwyqNzMnKEzVh4Xo00QwHwavaVuA4954x12gEGYqb68Wgu3zfLjAQQxV+Mny
 BUX96DND
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c1c00f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=uGfbuUcNw5SBLKsPKdUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QZHckUb9MYRmhtcV1P8Z6phEMpnVQmfN
X-Proofpoint-ORIG-GUID: QZHckUb9MYRmhtcV1P8Z6phEMpnVQmfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_111439_529216_4A97EA2B 
X-CRM114-Status: GOOD (  16.90  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

Move the following callbacks from hal_rx_ops to hal_ops for use in
non-performance-critical paths:

rx_desc_set_msdu_len
rx_desc_get_dot11_hdr
rx_desc_get_crypto_header
rx_desc_copy_end_tlv
rx_desc_get_msdu_src_link_id
rx_desc_get_desc_size

hal_rx_ops currently includes callbacks used in both critical and
non-critical Rx paths. To reduce function pointer indirection in hot
path, performance-critical ops will be consolidated into a single
extraction API in a follow-up patch.

Begin cleanup by migrating non-performance-critical callbacks from
hal_rx_ops to hal_ops. Once the extraction API is in place, remove
hal_rx_ops entirely to simplify the HAL interface.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c    |  2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h | 10 +++++-----
 drivers/net/wireless/ath/ath12k/hal.c   | 25 ++++++++++++-------------
 drivers/net/wireless/ath/ath12k/hal.h   | 20 ++++++++++----------
 4 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83d41154c115..9dd602311433 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -897,7 +897,7 @@ void ath12k_dp_pdev_pre_alloc(struct ath12k *ar)
 
 void ath12k_dp_hal_rx_desc_init(struct ath12k_base *ab)
 {
-	ab->hal.hal_desc_sz = ab->hal_rx_ops->rx_desc_get_desc_size();
+	ab->hal.hal_desc_sz = ab->hw_params->hal_ops->rx_desc_get_desc_size();
 }
 
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 6f56a56db097..150f4b1dbfbb 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -269,14 +269,14 @@ static inline void ath12k_dp_rx_desc_end_tlv_copy(struct ath12k_base *ab,
 						  struct hal_rx_desc *fdesc,
 						  struct hal_rx_desc *ldesc)
 {
-	ab->hal_rx_ops->rx_desc_copy_end_tlv(fdesc, ldesc);
+	ab->hw_params->hal_ops->rx_desc_copy_end_tlv(fdesc, ldesc);
 }
 
 static inline void ath12k_dp_rxdesc_set_msdu_len(struct ath12k_base *ab,
 						 struct hal_rx_desc *desc,
 						 u16 len)
 {
-	ab->hal_rx_ops->rx_desc_set_msdu_len(desc, len);
+	ab->hw_params->hal_ops->rx_desc_set_msdu_len(desc, len);
 }
 
 static inline u32 ath12k_dp_rxdesc_get_ppduid(struct ath12k_base *ab,
@@ -318,7 +318,7 @@ static inline void ath12k_dp_rx_desc_get_dot11_hdr(struct ath12k_base *ab,
 						   struct hal_rx_desc *desc,
 						   struct ieee80211_hdr *hdr)
 {
-	ab->hal_rx_ops->rx_desc_get_dot11_hdr(desc, hdr);
+	ab->hw_params->hal_ops->rx_desc_get_dot11_hdr(desc, hdr);
 }
 
 static inline void ath12k_dp_rx_desc_get_crypto_header(struct ath12k_base *ab,
@@ -326,13 +326,13 @@ static inline void ath12k_dp_rx_desc_get_crypto_header(struct ath12k_base *ab,
 						       u8 *crypto_hdr,
 						       enum hal_encrypt_type enctype)
 {
-	ab->hal_rx_ops->rx_desc_get_crypto_header(desc, crypto_hdr, enctype);
+	ab->hw_params->hal_ops->rx_desc_get_crypto_header(desc, crypto_hdr, enctype);
 }
 
 static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_base *ab,
 						struct hal_rx_desc *desc)
 {
-	return ab->hal_rx_ops->rx_desc_get_msdu_src_link_id(desc);
+	return ab->hw_params->hal_ops->rx_desc_get_msdu_src_link_id(desc);
 }
 
 static inline void ath12k_dp_clean_up_skb_list(struct sk_buff_head *skb_list)
diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 329c458d1fe2..60a4e5766f51 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -428,29 +428,28 @@ const struct hal_rx_ops hal_rx_qcn9274_compact_ops = {
 	.rx_desc_get_msdu_nss = ath12k_hal_rx_desc_get_msdu_nss_qcn9274,
 	.rx_desc_get_mpdu_tid = ath12k_hal_rx_desc_get_mpdu_tid_qcn9274,
 	.rx_desc_get_mpdu_peer_id = ath12k_hal_rx_desc_get_mpdu_peer_id_qcn9274,
-	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcn9274,
 	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_qcn9274,
-	.rx_desc_set_msdu_len = ath12k_hal_rx_desc_set_msdu_len_qcn9274,
 	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_qcn9274,
 	.rx_desc_mac_addr2_valid = ath12k_hal_rx_desc_mac_addr2_valid_qcn9274,
 	.rx_desc_mpdu_start_addr2 = ath12k_hal_rx_desc_mpdu_start_addr2_qcn9274,
 	.rx_desc_is_da_mcbc = ath12k_hal_rx_desc_is_da_mcbc_qcn9274,
-	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcn9274,
-	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcn9274,
 	.dp_rx_h_msdu_done = ath12k_hal_rx_h_msdu_done_qcn9274,
 	.dp_rx_h_l4_cksum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274,
 	.dp_rx_h_ip_cksum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274,
 	.dp_rx_h_is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274,
 	.dp_rx_h_mpdu_err = ath12k_hal_rx_h_mpdu_err_qcn9274,
-	.rx_desc_get_desc_size = ath12k_hal_get_rx_desc_size_qcn9274,
-	.rx_desc_get_msdu_src_link_id =
-		ath12k_hal_rx_desc_get_msdu_src_link_qcn9274,
 };
 EXPORT_SYMBOL(hal_rx_qcn9274_compact_ops);
 
 const struct hal_ops hal_qcn9274_ops = {
 	.create_srng_config = ath12k_hal_srng_create_config_qcn9274,
 	.tcl_to_wbm_rbm_map = ath12k_hal_qcn9274_tcl_to_wbm_rbm_map,
+	.rx_desc_set_msdu_len = ath12k_hal_rx_desc_set_msdu_len_qcn9274,
+	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcn9274,
+	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcn9274,
+	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcn9274,
+	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcn9274,
+	.rx_desc_get_desc_size = ath12k_hal_get_rx_desc_size_qcn9274,
 };
 EXPORT_SYMBOL(hal_qcn9274_ops);
 
@@ -598,29 +597,29 @@ const struct hal_rx_ops hal_rx_wcn7850_ops = {
 	.rx_desc_get_msdu_nss = ath12k_hal_rx_desc_get_msdu_nss_wcn7850,
 	.rx_desc_get_mpdu_tid = ath12k_hal_rx_desc_get_mpdu_tid_wcn7850,
 	.rx_desc_get_mpdu_peer_id = ath12k_hal_rx_desc_get_mpdu_peer_id_wcn7850,
-	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_wcn7850,
 	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_wcn7850,
 	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_wcn7850,
-	.rx_desc_set_msdu_len = ath12k_hal_rx_desc_set_msdu_len_wcn7850,
 	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_wcn7850,
 	.rx_desc_mac_addr2_valid = ath12k_hal_rx_desc_mac_addr2_valid_wcn7850,
 	.rx_desc_mpdu_start_addr2 = ath12k_hal_rx_desc_mpdu_start_addr2_wcn7850,
 	.rx_desc_is_da_mcbc = ath12k_hal_rx_desc_is_da_mcbc_wcn7850,
-	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_wcn7850,
-	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_wcn7850,
 	.dp_rx_h_msdu_done = ath12k_hal_rx_h_msdu_done_wcn7850,
 	.dp_rx_h_l4_cksum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850,
 	.dp_rx_h_ip_cksum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850,
 	.dp_rx_h_is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850,
 	.dp_rx_h_mpdu_err = ath12k_hal_rx_h_mpdu_err_wcn7850,
-	.rx_desc_get_desc_size = ath12k_hal_get_rx_desc_size_wcn7850,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_wcn7850,
 };
 EXPORT_SYMBOL(hal_rx_wcn7850_ops);
 
 const struct hal_ops hal_wcn7850_ops = {
 	.create_srng_config = ath12k_hal_srng_create_config_wcn7850,
 	.tcl_to_wbm_rbm_map = ath12k_hal_wcn7850_tcl_to_wbm_rbm_map,
+	.rx_desc_set_msdu_len = ath12k_hal_rx_desc_set_msdu_len_wcn7850,
+	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_wcn7850,
+	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_wcn7850,
+	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_wcn7850,
+	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_wcn7850,
+	.rx_desc_get_desc_size = ath12k_hal_get_rx_desc_size_wcn7850,
 };
 EXPORT_SYMBOL(hal_wcn7850_ops);
 
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index ee0c22d65d2c..553d93dcc268 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1569,33 +1569,33 @@ struct hal_rx_ops {
 	u8 (*rx_desc_get_msdu_nss)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_mpdu_tid)(struct hal_rx_desc *desc);
 	u16 (*rx_desc_get_mpdu_peer_id)(struct hal_rx_desc *desc);
-	void (*rx_desc_copy_end_tlv)(struct hal_rx_desc *fdesc,
-				     struct hal_rx_desc *ldesc);
 	u32 (*rx_desc_get_mpdu_start_tag)(struct hal_rx_desc *desc);
 	u32 (*rx_desc_get_mpdu_ppdu_id)(struct hal_rx_desc *desc);
-	void (*rx_desc_set_msdu_len)(struct hal_rx_desc *desc, u16 len);
 	struct rx_attention *(*rx_desc_get_attention)(struct hal_rx_desc *desc);
 	u8 *(*rx_desc_get_msdu_payload)(struct hal_rx_desc *desc);
 	bool (*rx_desc_mac_addr2_valid)(struct hal_rx_desc *desc);
 	u8* (*rx_desc_mpdu_start_addr2)(struct hal_rx_desc *desc);
 	bool (*rx_desc_is_da_mcbc)(struct hal_rx_desc *desc);
-	void (*rx_desc_get_dot11_hdr)(struct hal_rx_desc *desc,
-				      struct ieee80211_hdr *hdr);
-	void (*rx_desc_get_crypto_header)(struct hal_rx_desc *desc,
-					  u8 *crypto_hdr,
-					  enum hal_encrypt_type enctype);
 	bool (*dp_rx_h_msdu_done)(struct hal_rx_desc *desc);
 	bool (*dp_rx_h_l4_cksum_fail)(struct hal_rx_desc *desc);
 	bool (*dp_rx_h_ip_cksum_fail)(struct hal_rx_desc *desc);
 	bool (*dp_rx_h_is_decrypted)(struct hal_rx_desc *desc);
 	u32 (*dp_rx_h_mpdu_err)(struct hal_rx_desc *desc);
-	u32 (*rx_desc_get_desc_size)(void);
-	u8 (*rx_desc_get_msdu_src_link_id)(struct hal_rx_desc *desc);
 };
 
 struct hal_ops {
 	int (*create_srng_config)(struct ath12k_base *ab);
 	const struct ath12k_hal_tcl_to_wbm_rbm_map *tcl_to_wbm_rbm_map;
+	void (*rx_desc_set_msdu_len)(struct hal_rx_desc *desc, u16 len);
+	void (*rx_desc_get_dot11_hdr)(struct hal_rx_desc *desc,
+				      struct ieee80211_hdr *hdr);
+	void (*rx_desc_get_crypto_header)(struct hal_rx_desc *desc,
+					  u8 *crypto_hdr,
+					  enum hal_encrypt_type enctype);
+	void (*rx_desc_copy_end_tlv)(struct hal_rx_desc *fdesc,
+				     struct hal_rx_desc *ldesc);
+	u8 (*rx_desc_get_msdu_src_link_id)(struct hal_rx_desc *desc);
+	u32 (*rx_desc_get_desc_size)(void);
 };
 
 extern const struct hal_ops hal_qcn9274_ops;
-- 
2.34.1


