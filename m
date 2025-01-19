Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E72C02188
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 15:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1od6MgBdDkaW8R0wzzq3iwjZrDMf1tfX6CYz1zvHsk=; b=VjjQ5ECRW9Bq95kM2tsP0Xgmw1
	1Cq8yR60J6yoycXy8PPgtWcrNvNdc8V5frRL1oetNKx3tXHCywm+Kz1TzZ0t1i35MTN0WFTGfkSAw
	MVQAW8UwvnklrrpvWl+fh0OaRhWvUGYpWIArghaBzcCxZTxEakMCZHgAqVjksgJHgbES5TxkuepVd
	QcirMK6V2pB2/txN3lDfZNdMWuAiZvCGFoKwjiB5VpemBb036a2DyfnfsEaZdo2OghaO2K7bEQHvR
	w0bsd8GmyKMM4fJcTPiUG1SjZrzOz4ouZOWP4ZRT54p155djJrJOrOlhBC+SeYe1Mzdc67z4fO5ZS
	NGyMyINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZXFH-000000043Ri-0yk4
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 15:29:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZXFF-000000043QM-0jqX
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 15:29:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JDTnUi019259;
	Sun, 19 Jan 2025 15:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d1od6MgBdDkaW8R0wzzq3iwjZrDMf1tfX6CYz1zvHsk=; b=Z3kFc75kRIUPac7L
	DzUOxMchsdqOhfvk65GwrJUSUNUjNmHUX53h3IuwpOikTP3DgUlVRmiE9RW9q8by
	K82/AyZvEULZz4xN2ylR6Ok5L/9jMWOwqACaR//oIrgDUpUuqIeBf4ft14rqCnZ3
	NzAYVX2musN3gWRODIh1u4hcU6XkaLHFbx6ljsXA8pAkUyIrGir2B4BiSjc6jz4y
	mmeUmqcfAxzCCwP560KBG3r8sjclYx0BJqmjk+FChv9kkwFAAtXMcgOz8gTgmQ4H
	dyIGPrxtCAP5lA+vutbgR2gzE8/S4BoKkxzBOwUDpfZEl3ky0hvGCDSNJ4wmZBo8
	bBIEMA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448ky4h1x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 15:29:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JFTlO7030786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 15:29:47 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 07:29:45 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: [PATCH v2 6/7] wifi: ath12k: Avoid packet offset and FCS length from Rx TLV
Date: Sun, 19 Jan 2025 20:59:16 +0530
Message-ID: <20250119152917.2316514-7-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119152917.2316514-1-quic_periyasa@quicinc.com>
References: <20250119152917.2316514-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iVu1mvi1MqJngCLwL66i5p8D3CHNNT7o
X-Proofpoint-ORIG-GUID: iVu1mvi1MqJngCLwL66i5p8D3CHNNT7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_02,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=745
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_072949_341185_4E4465BB 
X-CRM114-Status: GOOD (  13.82  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

Currently, the packet offset and FCS length are fetched from the MSDU Rx
TLV data, a logic inherited from ath11k. However, for ath12k 802.11be
hardware, the Rx TLV will not be present in the MSDU data. Instead, this
information is constant. Therefore, remove the existing FCS trim and the
packet offset fetch code. Handle the packet offset with the constant in
the merge MSDU procedure.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 23 +++++------------------
 drivers/net/wireless/ath/ath12k/dp_mon.h |  1 +
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 778866628a8d..b92de0f9aeda 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1719,18 +1719,6 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 	return HAL_RX_MON_STATUS_PPDU_NOT_DONE;
 }
 
-static void ath12k_dp_mon_rx_msdus_set_payload(struct ath12k *ar,
-					       struct sk_buff *head_msdu,
-					       struct sk_buff *tail_msdu)
-{
-	u32 rx_pkt_offset, l2_hdr_offset;
-
-	rx_pkt_offset = ar->ab->hal.hal_desc_sz;
-	l2_hdr_offset =
-		ath12k_dp_rx_h_l3pad(ar->ab, (struct hal_rx_desc *)tail_msdu->data);
-	skb_pull(head_msdu, rx_pkt_offset + l2_hdr_offset);
-}
-
 static void
 ath12k_dp_mon_fill_rx_stats_info(struct ath12k *ar,
 				 struct hal_rx_mon_ppdu_info *ppdu_info,
@@ -1846,7 +1834,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 {
 	struct ath12k_base *ab = ar->ab;
 	struct sk_buff *msdu, *mpdu_buf, *prev_buf, *head_frag_list;
-	struct sk_buff *head_msdu, *tail_msdu;
+	struct sk_buff *head_msdu;
 	struct hal_rx_desc *rx_desc;
 	u8 *hdr_desc, *dest, decap_format = mon_mpdu->decap_format;
 	struct ieee80211_hdr_3addr *wh;
@@ -1856,7 +1844,6 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 
 	mpdu_buf = NULL;
 	head_msdu = mon_mpdu->head;
-	tail_msdu = mon_mpdu->tail;
 
 	if (!head_msdu)
 		goto err_merge_fail;
@@ -1886,14 +1873,14 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 	ath12k_dp_mon_fill_rx_rate(ar, ppdu_info, rxs);
 
 	if (decap_format == DP_RX_DECAP_TYPE_RAW) {
-		ath12k_dp_mon_rx_msdus_set_payload(ar, head_msdu, tail_msdu);
+		skb_pull(head_msdu, ATH12K_MON_RX_PKT_OFFSET);
 
 		prev_buf = head_msdu;
 		msdu = head_msdu->next;
 		head_frag_list = NULL;
 
 		while (msdu) {
-			ath12k_dp_mon_rx_msdus_set_payload(ar, msdu, tail_msdu);
+			skb_pull(msdu, ATH12K_MON_RX_PKT_OFFSET);
 
 			if (!head_frag_list)
 				head_frag_list = msdu;
@@ -1905,7 +1892,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 
 		prev_buf->next = NULL;
 
-		skb_trim(prev_buf, prev_buf->len - HAL_RX_FCS_LEN);
+		skb_trim(prev_buf, prev_buf->len);
 		if (head_frag_list) {
 			skb_shinfo(head_msdu)->frag_list = head_frag_list;
 			head_msdu->data_len = frag_list_sum_len;
@@ -1928,7 +1915,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 		msdu = head_msdu;
 
 		while (msdu) {
-			ath12k_dp_mon_rx_msdus_set_payload(ar, msdu, tail_msdu);
+			skb_pull(msdu, ATH12K_MON_RX_PKT_OFFSET);
 			if (qos_pkt) {
 				dest = skb_push(msdu, sizeof(__le16));
 				if (!dest)
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.h b/drivers/net/wireless/ath/ath12k/dp_mon.h
index b039f6b9277c..9f3adee51cb2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.h
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.h
@@ -10,6 +10,7 @@
 #include "core.h"
 
 #define ATH12K_MON_RX_DOT11_OFFSET	5
+#define ATH12K_MON_RX_PKT_OFFSET	8
 
 enum dp_monitor_mode {
 	ATH12K_DP_TX_MONITOR_MODE,
-- 
2.34.1


