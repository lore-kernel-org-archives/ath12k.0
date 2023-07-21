Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0E0C001DF
	for <ath12k@archiver.kernel.org>; Fri, 21 Jul 2023 02:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIGPm5h3Lj5qNNEg9TcEoOBA8W8+YNSSnN7NrohYqA4=; b=tcQqkzdgjEKPLC
	9OXSnZ7X7h5BUsopB9m94LOCoW0OOLzGkSBn0GOQlt6UCwlns26aaQdU6yvnq7BH2ZVeDPt7SJqB5
	uv+5dqird2pSjMYgp54BLMCW4q1a5w/o6rVtrXG9FSjc++4Z8YjMVFUhComqleGmheGcZARd9xrqj
	xgzwxVNs7n4VnaodViUwBxkG7MxPdGXpmWKdAFf2X0IASa7npQwWeIWjgBSRqODAElOqa5zG7BW5D
	//3WQ/KqzRpRXBna5KBDiTBPwvMbMCgu6vcEdrL0nu/7YsYmHA839hYqsFnFiy+cI1q6mqqnksn/R
	yVjTXfbX1l3kl4kzKVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfz6-00CdWd-1X
	for ath12k@archiver.kernel.org;
	Fri, 21 Jul 2023 02:35:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfz0-00CdUE-31
	for ath12k@lists.infradead.org;
	Fri, 21 Jul 2023 02:35:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36L2NJhI010077;
	Fri, 21 Jul 2023 02:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=sV5mVQTFSBAoKndgZvN2bZw+Ayay3SN5ehEHo7rCePQ=;
 b=l4kPyJwNd3sTtYcY+XAZjS/+k+/aN54bcItVCJy4H62z8S+sSeqL1eNXxo4t/sIDXBmK
 7OyiBeiMM0bJ1B+TrJHGySt4NoXpmw1CnPuFqlhZX4JWXmSz2wdWNWedN2vNrdEbBp5R
 uRxgHdmj4e8cot0lzeKrjJSbYKHajH5j/0GFH1UrsBnWrYVjjpNqeJuDxwxhhYGLdJsD
 0xGhBllwnWzBQJZhaStrBLCoZrhF4mB2RjOaqUigCDlmb1GmopQuK6XFI/I7OF6/QFGN
 lGKdELpbbRh9F6yasBmDq/6EYn2UVYJkNUsGzOB6oHuDfBzD4AKmhBHUo0TpCsJJoQiW yQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rxt18b1yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 02:35:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36L2Z1v0003017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 02:35:01 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 20 Jul 2023 19:35:00 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [RFC 1/3] wifi: ath12k: Flush all packets before suspend
Date: Fri, 21 Jul 2023 10:34:44 +0800
Message-ID: <20230721023446.3706-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230721023446.3706-1-quic_bqiang@quicinc.com>
References: <20230721023446.3706-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3AkhWk55wVC5jCBLOSvFyFelOGe_V5td
X-Proofpoint-GUID: 3AkhWk55wVC5jCBLOSvFyFelOGe_V5td
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_12,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_193506_981099_18F865AB 
X-CRM114-Status: GOOD (  21.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

In order to send out all packets before going to suspend, current code
adds a 500ms delay as a workaround. It is a rough estimate and may not
work.

The logic of the fix is to check packet counters, if counters become
zero, then all packets are sent out or dropped.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 17 +++++++---
 drivers/net/wireless/ath/ath12k/mac.c  | 44 +++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/mac.h  |  1 +
 3 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 3df8059d5512..73065d38be2d 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -21,15 +21,22 @@ MODULE_PARM_DESC(debug_mask, "Debugging mask");
 
 int ath12k_core_suspend(struct ath12k_base *ab)
 {
-	int ret;
+	struct ath12k *ar;
+	int ret, i;
 
 	if (!ab->hw_params->supports_suspend)
 		return -EOPNOTSUPP;
 
-	/* TODO: there can frames in queues so for now add delay as a hack.
-	 * Need to implement to handle and remove this delay.
-	 */
-	msleep(500);
+	for (i = 0; i < ab->num_radios; i++) {
+		ar = ab->pdevs[i].ar;
+		if (!ar)
+			continue;
+		ret = ath12k_mac_wait_tx_complete(ar);
+		if (ret) {
+			ath12k_warn(ab, "failed to wait tx complete: %d\n", ret);
+			return ret;
+		}
+	}
 
 	ret = ath12k_dp_rx_pktlog_stop(ab, true);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1bb9802ef569..3e472afe09b1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6017,27 +6017,49 @@ static int ath12k_mac_op_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 	return -EOPNOTSUPP;
 }
 
-static void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-				u32 queues, bool drop)
+static int ath12k_mac_flush_tx_complete(struct ath12k *ar)
 {
-	struct ath12k *ar = hw->priv;
 	long time_left;
-
-	if (drop)
-		return;
+	int ret = 0;
 
 	time_left = wait_event_timeout(ar->dp.tx_empty_waitq,
 				       (atomic_read(&ar->dp.num_tx_pending) == 0),
 				       ATH12K_FLUSH_TIMEOUT);
-	if (time_left == 0)
-		ath12k_warn(ar->ab, "failed to flush transmit queue %ld\n", time_left);
+	if (time_left == 0) {
+		ath12k_warn(ar->ab,
+			    "failed to flush transmit queue, data pkts pending %d\n",
+			    atomic_read(&ar->dp.num_tx_pending));
+		ret = -ETIMEDOUT;
+	}
 
 	time_left = wait_event_timeout(ar->txmgmt_empty_waitq,
 				       (atomic_read(&ar->num_pending_mgmt_tx) == 0),
 				       ATH12K_FLUSH_TIMEOUT);
-	if (time_left == 0)
-		ath12k_warn(ar->ab, "failed to flush mgmt transmit queue %ld\n",
-			    time_left);
+	if (time_left == 0) {
+		ath12k_warn(ar->ab,
+			    "failed to flush mgmt transmit queue, mgmt pkts pending %d\n",
+			    atomic_read(&ar->num_pending_mgmt_tx));
+		ret = -ETIMEDOUT;
+	}
+
+	return ret;
+}
+
+int ath12k_mac_wait_tx_complete(struct ath12k *ar)
+{
+	ath12k_mac_drain_tx(ar);
+	return ath12k_mac_flush_tx_complete(ar);
+}
+
+static void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+				u32 queues, bool drop)
+{
+	struct ath12k *ar = hw->priv;
+
+	if (drop)
+		return;
+
+	ath12k_mac_flush_tx_complete(ar);
 }
 
 static int
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 57f4295420bb..d0d48133e926 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -73,4 +73,5 @@ int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
 enum rate_info_bw ath12k_mac_bw_to_mac80211_bw(enum ath12k_supported_bw bw);
 enum ath12k_supported_bw ath12k_mac_mac80211_bw_to_ath12k_bw(enum rate_info_bw bw);
 enum hal_encrypt_type ath12k_dp_tx_get_encrypt_type(u32 cipher);
+int ath12k_mac_wait_tx_complete(struct ath12k *ar);
 #endif
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
