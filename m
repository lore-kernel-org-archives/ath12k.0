Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649ECC25B78
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 07:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qbBM8cQ1qwtSFHCz6eBqi5qLQGoBprKLjDhtJbw5nM=; b=XCuZSVhPTu+RxSadXg+s+k0ES2
	8ijrpTmyerq3NYHt3gOgXIL94X827zmALu8+Ex0BbRo28M4n8xxvxXQFxdN9y9c4P3sZQqQ8WDfUo
	p1yqGg4mPuMULmcnUpPXhn/ja2HuuFim7oDvl0o59Bk4oR8bAFH6ZsDkobMaYc8TPXcLXdXwZ/fy/
	V/gcO7pd9Nk05lvPGG/IfLn+nEEcfrMjZL5aoZwwiWL2RpWoo7zQmjv1tvPxWy7+IUMYzGaPugE4U
	TqyRWudqz8doWY8+3PNm8kCJ8h/ms4uobR6D7Poo7DJc/pZZf88BPK3pE/X4/QICug8NvsGPD4hyk
	FroFlR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x1R-0000000DiOd-0R8e
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 07:01:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x1O-0000000DiNd-2oaH
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 07:01:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K0FLTO012012;
	Mon, 20 May 2024 07:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+qbBM8cQ1qwtSFHCz6eBqi5qLQGoBprKLjDhtJbw5nM=; b=SK
	rTHdqcGnvhoGFdB5JnRJSowFS7kaEzpf4e24wLO28Nrl0IQ3Rytgd16AjSs7U2oD
	6NAq5K6ggvpHwn6JllFHIF9YP2ydBzHfYH2KpkJdTqh4qWajyRJji3uPyju9kMO3
	QoFNWQr9VJPFnwd2wt1qL1lT6KMrnUuUt8Y1futbFoTlU6WVTWtqrpmLHttmrkhy
	0Pu4Y8YuZEB7oOmvFtdQwf+bE4vMdCm5FbcE3xbiEuk3v7JZaEwgQVxAH+zqglwQ
	TldS/Z03or8S1ZOVWfyC5QpnO7JC2lTMdPxh3ZYcjdq17a8WzTh9jBGxsMjxXVps
	cCYqgaSHDnpUuCMB0Niw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psatkxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 07:01:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44K71JxA023377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 07:01:19 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 May 2024 00:01:18 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 3/3] wifi: ath12k: fix firmware crash during reo reinject
Date: Mon, 20 May 2024 12:30:45 +0530
Message-ID: <20240520070045.631029-4-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520070045.631029-1-quic_ppranees@quicinc.com>
References: <20240520070045.631029-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S1aTmnDNOrvELhJ4WJkB1nkZ_jKnHGrv
X-Proofpoint-ORIG-GUID: S1aTmnDNOrvELhJ4WJkB1nkZ_jKnHGrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_000122_870345_9149AF1A 
X-CRM114-Status: GOOD (  11.21  )
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

When handling fragmented packets, the ath12k driver reassembles each
fragment into a normal packet and then reinjects it into the HW ring.
However, a firmware crash occurs during this reinjection process.
The issue arises because the driver populates peer metadata in
reo_ent_ring->queue_addr_lo, while the firmware expects the physical
address obtained from the corresponding peer’s queue descriptor. Fix it
by filling peer's queue descriptor's physical address in queue_addr_lo.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 2bfcc19d15ea..2adb6c7d4a42 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2967,7 +2967,7 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struct ath12k *ar,
 	struct hal_srng *srng;
 	dma_addr_t link_paddr, buf_paddr;
 	u32 desc_bank, msdu_info, msdu_ext_info, mpdu_info;
-	u32 cookie, hal_rx_desc_sz, dest_ring_info0;
+	u32 cookie, hal_rx_desc_sz, dest_ring_info0, queue_addr_hi;
 	int ret;
 	struct ath12k_rx_desc_info *desc_info;
 	enum hal_rx_buf_return_buf_manager idle_link_rbm = dp->idle_link_rbm;
@@ -3060,13 +3060,11 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struct ath12k *ar,
 	reo_ent_ring->rx_mpdu_info.peer_meta_data =
 		reo_dest_ring->rx_mpdu_info.peer_meta_data;
 
-	/* Firmware expects physical address to be filled in queue_addr_lo in
-	 * the MLO scenario and in case of non MLO peer meta data needs to be
-	 * filled.
-	 * TODO: Need to handle for MLO scenario.
-	 */
-	reo_ent_ring->queue_addr_lo = reo_dest_ring->rx_mpdu_info.peer_meta_data;
-	reo_ent_ring->info0 = le32_encode_bits(dst_ind,
+	reo_ent_ring->queue_addr_lo = cpu_to_le32(lower_32_bits(rx_tid->paddr));
+	queue_addr_hi = upper_32_bits(rx_tid->paddr);
+	reo_ent_ring->info0 = le32_encode_bits(queue_addr_hi,
+					       HAL_REO_ENTR_RING_INFO0_QUEUE_ADDR_HI) |
+			      le32_encode_bits(dst_ind,
 					       HAL_REO_ENTR_RING_INFO0_DEST_IND);
 
 	reo_ent_ring->info1 = le32_encode_bits(rx_tid->cur_sn,
-- 
2.25.1


