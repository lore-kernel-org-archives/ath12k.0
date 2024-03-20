Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5F1C54E71
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 01:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/h71+wlEHwsYZEPUlyMmXrPN2hMz8pUG7Chz3Ai/os=; b=wSGNsUWS147+m9YgmSV6d7E4Xo
	sVD9DEoAKUvnPNbf1c1z9W9b0dBfJvojpxhpBqHvmVFGFjtirwwbKDheWkWSruODGQYgn78IzmN/w
	ppTLWRBnC2Kl/3uWVgPlCTyG2TZMsXYnys1O/c0Nz4IgJgIOZg7GMbxR7dykzgCpYd9qmPCPz/144
	CRPq8yBbwfknwWzHq2LBWc4dExXApWdnNU91iRwgH2jLKy3Qxgr/EK7nB1h7U5+pnYlOUfUTQA/wl
	u6CnC4CvHQLNTIq9476xUoxhHlgsSl962/kDCKdSIIMSKAMKdYYki8SRKcT6y1ZvRHa8cKcuPG7JH
	OqzcUGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmkPi-0000000Er7D-3cyX
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 01:06:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmkPf-0000000Er5e-3byR
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 01:06:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42K0wwE0024144;
	Wed, 20 Mar 2024 01:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=t/h71+wlEHwsYZEPUlyMmXrPN2hMz8pUG7Chz3Ai/os=; b=Ik
	hg9kGpyhLOHYUXchOX87MI0ULCB9LsM2XWa3SB3tPXXhY7P9HKayyOQytMgsQ6H+
	allAsskeBHG2ZAp6stKth64rA3SeVvmyzdqTHIYcBEHO1LUaRKrmbHoFVKNy2pMl
	NTFkG5YGiMNvvJTBSwoPseEVtv4s5gNDY8Y02oxrNveOMYAop1SKrThuvG60gMkA
	X4PCLcHtbhRToL4DInwVWt0IfKymnw/dRZj8q2u9VhKk/JDZ3usTWgd4TuAPnZGS
	3USVU1xROHpOfWmKco2migH5cMibRGd7ME/XtZcR4jPGJO9BL2C7HiGqWhV+JmCe
	nej5F8Q+D2r4oegEBNig==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy9ee9u4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 01:06:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42K16bQ1013151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 01:06:37 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 19 Mar 2024 18:06:36 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 3/3] wifi: ath12k: Refactor error handler of Rxdma replenish
Date: Wed, 20 Mar 2024 06:36:15 +0530
Message-ID: <20240320010615.91331-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240320010615.91331-1-quic_periyasa@quicinc.com>
References: <20240320010615.91331-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c7EhqJqvGPmcKRB0I08AceHAHZ5PcGCB
X-Proofpoint-ORIG-GUID: c7EhqJqvGPmcKRB0I08AceHAHZ5PcGCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=874 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_180640_064315_D3C2ACEC 
X-CRM114-Status: GOOD (  11.33  )
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


