Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE7FC54E4A
	for <ath12k@archiver.kernel.org>; Mon, 26 Feb 2024 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/h71+wlEHwsYZEPUlyMmXrPN2hMz8pUG7Chz3Ai/os=; b=lSVpKb0YdxK3fr41Jnb7ZIEeDp
	nrxrfrClZfzaQY+sRKy19A4BhID9x4/dqlcR+zrAlay01p46pMiYDxkU0Rc0hDdsa1T1evAwug17F
	C0/KYnOPbya0iUdrv6W2p+bKAZbswe49jnwqrZZz6XLYOdHoE6S7dlK5GgacX1uu0O25oM4WCjC05
	5VjxTEuEl+MyFEIpQBx8UoNNN/g0Ncozrm+KYojcr59ylmJ4Cm3ghwfprVgNYqKhxse8RvEcrHjXw
	Q6Hkw5NwLLKkDFwhBmef0wVOVm8snfUBrdeN53F2PsoEIqmLuFZYOjuU/OW7uV+Tp4QCFzSBJ+Cmq
	JJh10qNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redlQ-00000001dzD-2YS6
	for ath12k@archiver.kernel.org;
	Mon, 26 Feb 2024 16:23:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redlM-00000001dxQ-0Dpr
	for ath12k@lists.infradead.org;
	Mon, 26 Feb 2024 16:23:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QFvanE014668;
	Mon, 26 Feb 2024 16:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=t/h71+wlEHwsYZEPUlyMmXrPN2hMz8pUG7Chz3Ai/os=; b=ZT
	4TrlSz+R9YdGcwu9IIM8dxYi0RapuLgHyxHg+GDMmG0ltUSmzvmpag50qp23qbiy
	W+HRNS8orxbkTVgfPucxUwqIFnnJHBB+BwACsl3J/uEnQQVzlrdXrBAkt0jkAXwU
	dTL0v7TWY0+FBk3/okyvW5OrSy0GIawFr6+k5ESn/bL5LDfK+gRM4WmkkkTMmWLa
	Ut2t9F2UCz2ZkdN4wXosTD8ZcPitbuYyBHN+pSkXUnc/JdVZi4UfZJATGnZbVwDs
	LYoCrPnDCJ5RdZzWSfUeFzO8/aEfY7rLGzefzGo+TNIrLJSE/3sJnllH9rzCq9UH
	GDCcqlrTkLzNnU5+JCLw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxnhdk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:23:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QGNVjL026881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:23:31 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 26 Feb 2024 08:23:29 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 3/3] wifi: ath12k: Refactor error handler of Rxdma replenish
Date: Mon, 26 Feb 2024 21:53:10 +0530
Message-ID: <20240226162310.629162-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226162310.629162-1-quic_periyasa@quicinc.com>
References: <20240226162310.629162-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LUZfHbLR5D8p2n8u1xIEfAN2cmRMS9tM
X-Proofpoint-GUID: LUZfHbLR5D8p2n8u1xIEfAN2cmRMS9tM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=858 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_082332_125210_DB15AEE0 
X-CRM114-Status: GOOD (  11.10  )
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

The Rxdma replenish handler currently contains redundant code in both the
success and error cases. To avoid the redundant code, implement a
conditional jump mechanism by placing a goto statement to prevent
unnecessary execution of the error handling code when the operation is
successful. This change streamline the code readability and enhance its
efficiency.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 2a0e4faadcf1..a593beecdd12 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -337,7 +337,7 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab,
 	num_remain = req_entries;
 
 	if (!num_remain)
-		goto skip_replenish;
+		goto out;
 
 	/* Get the descriptor from free list */
 	if (list_empty(used_list)) {
@@ -389,22 +389,14 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_base *ab,
 		ath12k_hal_rx_buf_addr_info_set(desc, paddr, cookie, mgr);
 	}
 
-skip_replenish:
-	ath12k_hal_srng_access_end(ab, srng);
-
-	if (!list_empty(used_list))
-		ath12k_dp_rx_enqueue_free(dp, used_list);
-
-	spin_unlock_bh(&srng->lock);
-
-	return req_entries - num_remain;
+	goto out;
 
 fail_dma_unmap:
 	dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
 			 DMA_FROM_DEVICE);
 fail_free_skb:
 	dev_kfree_skb_any(skb);
-
+out:
 	ath12k_hal_srng_access_end(ab, srng);
 
 	if (!list_empty(used_list))
-- 
2.34.1


