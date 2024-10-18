Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18FDD3C54C
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 05:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41D0o/eMfx4L6yjsQPwWCKRCbI3xe//YHkMT9cnpQZg=; b=w7UUIG+3MJLZt32DPAe0KNzoIn
	pjwygaBMZHssDTj9HDXiP5ohgisLh9QVFCKbDSmfeuR+SqrrlkeZf/IC6ezx1+LmjWM2zI5myntUc
	GVBYoTB39GW51YLyEZjRXioIoOo7vrZjF9wrtX+6EB6KB51BtMrBMmKn/C5pujDYgrmzBKfRw/cUJ
	Vc1UTZt5M0oMtD5jwlvwjw/m6KbLQPN6rnoZa8XxgY/xVBV4fEsvOboKNGgQXG8U6ziutwubUTNSr
	/5x0SLkwNctJQfW/utaF16qljDwnSaqZ0EMRRVbaDlF6bFiGxy+/nnoyggecQClFsL8j+FpVCnXKr
	aX3VcQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fyI-0000000H2g2-2Vnp
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 05:56:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fpV-0000000H0Pv-0Sgf
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 05:47:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HJj2se027155;
	Fri, 18 Oct 2024 05:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41D0o/eMfx4L6yjsQPwWCKRCbI3xe//YHkMT9cnpQZg=; b=LzTec7iWyqrPJXo1
	Pd+uchuZYY20LKp8R2iMNkRVYZK9B7ltFjM7Zg80+7xVqq5pUSF9giZfJ7a02e+T
	Zw57QKFhS5/UbxxDJpuE8RR0MlktUBdX+S8PdJojRszXOjeeXgfnsNaLuj/X2V5b
	Xnm0oGAbvOjlUm/ga51kJgPFCV0bN/svd6vP5nIIEyx03Qv4uilEBponzIfbB5iA
	Ll0F5FW7LIiw3nX7t2iZtJrWgS69prX3rMEV+osLWAd/luWXH+dE3MyK1YEnBO48
	3tRB4YePQXS2UwHsvX96uUh6shgRe8NcB9mTswd3m4ybgK4wV0hB60XItzUTSzo0
	W2S9Fg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ay8jb1sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:46:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I5kqG0013249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:46:52 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 22:46:51 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 7/8] wifi: ath12k: use tail MSDU to get MSDU information
Date: Fri, 18 Oct 2024 13:46:19 +0800
Message-ID: <20241018054620.2080-8-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241018054620.2080-1-quic_kangyang@quicinc.com>
References: <20241018054620.2080-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tsJvKRO2rq0RxGJwn_l_Oqqq4C2RL63x
X-Proofpoint-ORIG-GUID: tsJvKRO2rq0RxGJwn_l_Oqqq4C2RL63x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_224717_301617_BD84794A 
X-CRM114-Status: GOOD (  13.80  )
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

When receiving a packet in monitor mode, hardware will fill status
information msdu_end for MSDUs. Then host can use these status
information to get specific information about this packet, such as
l3 offset, bandwidth, mcs, packet type.

If this packet is composed of multiple MSDUs, then hardware will only
fill status information for the last(tail) MSDU. At this time,
MSDU information is uncertain for others MSDUs. But current code use
the first MSDU in monitor mode, so will get the wrong information.

Fix it by getting msdu information from last(tail) msdu.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 41 +++++++++++++-----------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index afc1d5f31643..ceba901592f1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -855,24 +855,26 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 	return HAL_RX_MON_STATUS_PPDU_NOT_DONE;
 }
 
-static void ath12k_dp_mon_rx_msdus_set_payload(struct ath12k *ar, struct sk_buff *msdu)
+static void ath12k_dp_mon_rx_msdus_set_payload(struct ath12k *ar,
+					       struct sk_buff *head_msdu,
+					       struct sk_buff *tail_msdu)
 {
 	u32 rx_pkt_offset, l2_hdr_offset;
 
 	rx_pkt_offset = ar->ab->hal.hal_desc_sz;
-	l2_hdr_offset = ath12k_dp_rx_h_l3pad(ar->ab,
-					     (struct hal_rx_desc *)msdu->data);
-	skb_pull(msdu, rx_pkt_offset + l2_hdr_offset);
+	l2_hdr_offset =
+		ath12k_dp_rx_h_l3pad(ar->ab, (struct hal_rx_desc *)tail_msdu->data);
+	skb_pull(head_msdu, rx_pkt_offset + l2_hdr_offset);
 }
 
 static struct sk_buff *
-ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
-			    u32 mac_id, struct sk_buff *head_msdu,
+ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar, u32 mac_id,
+			    struct sk_buff *head_msdu, struct sk_buff *tail_msdu,
 			    struct ieee80211_rx_status *rxs, bool *fcs_err)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct sk_buff *msdu, *mpdu_buf, *prev_buf;
-	struct hal_rx_desc *rx_desc;
+	struct hal_rx_desc *rx_desc, *tail_rx_desc;
 	u8 *hdr_desc, *dest, decap_format;
 	struct ieee80211_hdr_3addr *wh;
 	u32 err_bitmap;
@@ -883,23 +885,24 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 		goto err_merge_fail;
 
 	rx_desc = (struct hal_rx_desc *)head_msdu->data;
-	err_bitmap = ath12k_dp_rx_h_mpdu_err(ab, rx_desc);
+	tail_rx_desc = (struct hal_rx_desc *)tail_msdu->data;
 
+	err_bitmap = ath12k_dp_rx_h_mpdu_err(ab, tail_rx_desc);
 	if (err_bitmap & HAL_RX_MPDU_ERR_FCS)
 		*fcs_err = true;
 
-	decap_format = ath12k_dp_rx_h_decap_type(ab, rx_desc);
+	decap_format = ath12k_dp_rx_h_decap_type(ab, tail_rx_desc);
 
-	ath12k_dp_rx_h_ppdu(ar, rx_desc, rxs);
+	ath12k_dp_rx_h_ppdu(ar, tail_rx_desc, rxs);
 
 	if (decap_format == DP_RX_DECAP_TYPE_RAW) {
-		ath12k_dp_mon_rx_msdus_set_payload(ar, head_msdu);
+		ath12k_dp_mon_rx_msdus_set_payload(ar, head_msdu, tail_msdu);
 
 		prev_buf = head_msdu;
 		msdu = head_msdu->next;
 
 		while (msdu) {
-			ath12k_dp_mon_rx_msdus_set_payload(ar, msdu);
+			ath12k_dp_mon_rx_msdus_set_payload(ar, msdu, tail_msdu);
 
 			prev_buf = msdu;
 			msdu = msdu->next;
@@ -924,7 +927,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 		msdu = head_msdu;
 
 		while (msdu) {
-			ath12k_dp_mon_rx_msdus_set_payload(ar, msdu);
+			ath12k_dp_mon_rx_msdus_set_payload(ar, msdu, tail_msdu);
 			if (qos_pkt) {
 				dest = skb_push(msdu, sizeof(__le16));
 				if (!dest)
@@ -1130,7 +1133,7 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 }
 
 static int ath12k_dp_mon_rx_deliver(struct ath12k *ar, u32 mac_id,
-				    struct sk_buff *head_msdu,
+				    struct sk_buff *head_msdu, struct sk_buff *tail_msdu,
 				    struct hal_rx_mon_ppdu_info *ppduinfo,
 				    struct napi_struct *napi)
 {
@@ -1139,7 +1142,8 @@ static int ath12k_dp_mon_rx_deliver(struct ath12k *ar, u32 mac_id,
 	struct ieee80211_rx_status *rxs = &dp->rx_status;
 	bool fcs_err = false;
 
-	mon_skb = ath12k_dp_mon_rx_merg_msdus(ar, mac_id, head_msdu,
+	mon_skb = ath12k_dp_mon_rx_merg_msdus(ar, mac_id,
+					      head_msdu, tail_msdu,
 					      rxs, &fcs_err);
 	if (!mon_skb)
 		goto mon_deliver_fail;
@@ -1247,7 +1251,7 @@ ath12k_dp_mon_rx_parse_mon_status(struct ath12k *ar,
 
 		if (head_msdu && tail_msdu) {
 			ath12k_dp_mon_rx_deliver(ar, mac_id, head_msdu,
-						 ppdu_info, napi);
+						 tail_msdu, ppdu_info, napi);
 		}
 
 		kfree(mon_mpdu);
@@ -1943,15 +1947,16 @@ ath12k_dp_mon_tx_process_ppdu_info(struct ath12k *ar, int mac_id,
 				   struct dp_mon_tx_ppdu_info *tx_ppdu_info)
 {
 	struct dp_mon_mpdu *tmp, *mon_mpdu;
-	struct sk_buff *head_msdu;
+	struct sk_buff *head_msdu, *tail_msdu;
 
 	list_for_each_entry_safe(mon_mpdu, tmp,
 				 &tx_ppdu_info->dp_tx_mon_mpdu_list, list) {
 		list_del(&mon_mpdu->list);
 		head_msdu = mon_mpdu->head;
+		tail_msdu = mon_mpdu->tail;
 
 		if (head_msdu)
-			ath12k_dp_mon_rx_deliver(ar, mac_id, head_msdu,
+			ath12k_dp_mon_rx_deliver(ar, mac_id, head_msdu, tail_msdu,
 						 &tx_ppdu_info->rx_status, napi);
 
 		kfree(mon_mpdu);
-- 
2.34.1


