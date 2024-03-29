Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A5C6FD1F
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kndjoUvO+S39fVLNLNgN6pRol9ZLbYswoaIPNOv63jM=; b=b70+9bNbEc4caP5tW7th1fZYSU
	TySLR8UNXmO/gA/WJrAb6oqLm2RRUilI7h6ZBn91GXHVflIaqcKHzdCsyTKzKQ2AU1FoV10+KkXlp
	VmOJunpALS5KgEbY48DS5fmvX1e06fx360kxbPgSsRYtBsIzrABAsTff/2wN24S433BXjMSMPPnXm
	sXGvkibpXwO4xfJigXsdnwO7LT/F/xBsyWICdI1boEHKlemafMc76O4aEBHL2fsWKgtmpoq6Mspag
	hHzkKXp5PDvGujsbO5plDnGTgmx0AD2cHlJ/v7AyIJTj+0lFx0oQpkanc2n9TA/mXF/u1FrFv6d8E
	b1g6loHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Yj-000000003XJ-0W1O
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 10:34:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8U0-0000000HTZ6-3ieo
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 09:25:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42T90ONd022880;
	Fri, 29 Mar 2024 09:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=kndjoUvO+S39fVLNLNgN6pRol9ZLbYswoaIPNOv63jM=; b=Ds
	BQy/0gvw4ncKTDYTZMK/iWjMfxah2uV2BsvvPWQ3ywsDkh94xI+l8YIQUea5gFPK
	7zTbakU/9Iiofw0WYA/6Fe+0SztAsz0b85Haxwxo03M9X1pkheEFyw1NPwwI3Qad
	7EhrnIAx+C//ouFiEOfWhX8tJbF4cShJR+3JagIbQ4TzKuiok7tn8UnuIYG6wXzm
	wGDU6FejFRo/P9puE2gjpbJXDCU4oFJcfVBfKQDTlVjeZXGk377v7cq450Qs7xES
	oUt6HIXvmgdgPLX9VPX8592EtsVuNh7O14QL7JL2pHF8CvFfKBnlBQrIc/tc5Kbw
	5l4mw/KtY8Ir4XyTKNnQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5qkwgn99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 09:25:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42T9P6S8023727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 09:25:06 GMT
Received: from hu-nithp-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 29 Mar 2024 02:25:04 -0700
From: Nithyanantham P <quic_nithp@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Nithyanantham P <quic_nithp@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: fix mac id extraction when MSDU spillover in rx error path
Date: Fri, 29 Mar 2024 14:54:32 +0530
Message-ID: <20240329092432.873710-1-quic_nithp@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UcRAfJZKDWBypq1mwrw-FYU2AhjL5Xsm
X-Proofpoint-GUID: UcRAfJZKDWBypq1mwrw-FYU2AhjL5Xsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_08,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 mlxlogscore=433 impostorscore=0 clxscore=1015
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_022508_971948_3D0ED6EF 
X-CRM114-Status: GOOD (  17.15  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, in the rx error data path, mac id is extracted from the
last 64bits of MSDU end description tag for each entry received in
the WBM error ring. Then, each entry will be updated into the MSDU
list for further processing. The extracted mac id is valid when a
single MSDU is not fragmented and received in the WBM error ring.

In scenarios where the size of a single MSDU received exceeds the
descriptor buffer size, resulting in fragmented or spillover MSDU
entries into the WBM error ring. In this case, the extracted mac id
from each spillover entry is invalid except the last spillover entry
of the MSDU. This invalid mac id leads to packet rejection.

To address this issue, check if the MSDU continuation flag is set,
then extract the valid mac id from the last spillover entry.
Propagate the valid mac id to all the spillover entries of the single
MSDU in the temporary MSDU list(scatter_msdu_list). Then, update this
into the MSDU list (msdu_list) for further processing.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Nithyanantham P <quic_nithp@quicinc.com>
---
v2:
 - Signed-off name change from Nithyanantham Paramasivam to Nithyanantham P
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 60 +++++++++++++++++++++----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index a593beecdd12..b1b50e14a492 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -239,6 +239,14 @@ static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_base *ab,
 	return ab->hal_rx_ops->rx_desc_get_msdu_src_link_id(desc);
 }
 
+static void ath12k_dp_clean_up_skb_list(struct sk_buff_head *skb_list)
+{
+	struct sk_buff *skb;
+
+	while ((skb = __skb_dequeue(skb_list)))
+		dev_kfree_skb_any(skb);
+}
+
 static int ath12k_dp_purge_mon_ring(struct ath12k_base *ab)
 {
 	int i, reaped = 0;
@@ -3742,19 +3750,20 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 	struct hal_rx_wbm_rel_info err_info;
 	struct hal_srng *srng;
 	struct sk_buff *msdu;
-	struct sk_buff_head msdu_list;
+	struct sk_buff_head msdu_list, scatter_msdu_list;
 	struct ath12k_skb_rxcb *rxcb;
 	void *rx_desc;
 	u8 mac_id;
 	int num_buffs_reaped = 0;
 	struct ath12k_rx_desc_info *desc_info;
 	int ret, pdev_id;
+	struct hal_rx_desc *msdu_data;
 
 	__skb_queue_head_init(&msdu_list);
+	__skb_queue_head_init(&scatter_msdu_list);
 
 	srng = &ab->hal.srng_list[dp->rx_rel_ring.ring_id];
 	rx_ring = &dp->rx_refill_buf_ring;
-
 	spin_lock_bh(&srng->lock);
 
 	ath12k_hal_srng_access_begin(ab, srng);
@@ -3807,16 +3816,50 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 			continue;
 		}
 
+		msdu_data = (struct hal_rx_desc *)msdu->data;
 		rxcb->err_rel_src = err_info.err_rel_src;
 		rxcb->err_code = err_info.err_code;
-		rxcb->rx_desc = (struct hal_rx_desc *)msdu->data;
-
-		__skb_queue_tail(&msdu_list, msdu);
-
 		rxcb->is_first_msdu = err_info.first_msdu;
 		rxcb->is_last_msdu = err_info.last_msdu;
 		rxcb->is_continuation = err_info.continuation;
+		rxcb->rx_desc = msdu_data;
+
+		if (err_info.continuation) {
+			__skb_queue_tail(&scatter_msdu_list, msdu);
+		} else {
+			mac_id = ath12k_dp_rx_get_msdu_src_link(ab,
+								msdu_data);
+			if (mac_id >= MAX_RADIOS) {
+				dev_kfree_skb_any(msdu);
+
+				/* In any case continuation bit is set
+				 * in the previous record, cleanup scatter_msdu_list
+				 */
+				ath12k_dp_clean_up_skb_list(&scatter_msdu_list);
+				continue;
+			}
+
+			if (!skb_queue_empty(&scatter_msdu_list)) {
+				struct sk_buff *msdu;
+
+				skb_queue_walk(&scatter_msdu_list, msdu) {
+					rxcb = ATH12K_SKB_RXCB(msdu);
+					rxcb->mac_id = mac_id;
+				}
+
+				skb_queue_splice_tail_init(&scatter_msdu_list,
+							   &msdu_list);
+			}
+
+			rxcb = ATH12K_SKB_RXCB(msdu);
+			rxcb->mac_id = mac_id;
+			__skb_queue_tail(&msdu_list, msdu);
+		}
 	}
+	/* In any case continuation bit is set in the
+	 * last record, cleanup scatter_msdu_list
+	 */
+	ath12k_dp_clean_up_skb_list(&scatter_msdu_list);
 
 	ath12k_hal_srng_access_end(ab, srng);
 
@@ -3830,8 +3873,9 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 
 	rcu_read_lock();
 	while ((msdu = __skb_dequeue(&msdu_list))) {
-		mac_id = ath12k_dp_rx_get_msdu_src_link(ab,
-							(struct hal_rx_desc *)msdu->data);
+		rxcb = ATH12K_SKB_RXCB(msdu);
+		mac_id = rxcb->mac_id;
+
 		pdev_id = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, mac_id);
 		ar = ab->pdevs[pdev_id].ar;
 

base-commit: fe7e1b830cf3c0272aa4eaf367c4c7b29c169c3d
-- 
2.17.1


