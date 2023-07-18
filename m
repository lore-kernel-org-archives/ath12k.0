Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AF8EB64DA
	for <ath12k@archiver.kernel.org>; Wed, 19 Jul 2023 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aZTSjkDcYYHKm3OAbSSFBCIjZF2rSP02MDBkGiaVmsU=; b=SCfGvOy7axOB3V
	08oyK6tMi6IQyL2wSqZZ0g/amJ2CukF9kHJQXlfWEFVtZrqtR6yFyQGMbQsSpNzPrYumFE023LGOc
	LqG+y8n+2yWDGxGrNUcijI2Q6iKXbacmIP8QJ4m8uZLD3RVFKKe8PeJszFlxI0BPsttDcXHzKLFzl
	s7gGsTEKKPOoaq72aXhlEpxd0GVbrV4agG/iZlBC6JkMmsX1vG07RlRVSEDpT7u6oiWZpFQASsnA1
	37MtUoCXklIh6DY/775S7P5hEQwlz0nRZ0qgMuKXUkGfj06L7sMeANP/ZjIwPvmJmNU/oodqNiZRH
	Kf0svylazTUKNOBNmw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0gv-005kWO-2H
	for ath12k@archiver.kernel.org;
	Wed, 19 Jul 2023 06:29:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0gt-005kUd-1E
	for ath12k@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wI2pBkxpLUpAB3X5rfTIAH0MJvDD2NlcQekkg1nEGUk=; b=IrG5Z6GW+N2iosWV2Ac/muTcCR
	PljBBcYb7o1RIlzD3Sayog6DoR7GriGlGHqZIKnO8uY8raqVsYwmUzTXEjzdu175jJMH6AXBi1pJB
	BRzvmUHcPpEeQAQHPrO/2TlC2i9o2KgCMms4NiWluTmxsfRh3xVLMr4ftUYtdryP4/DVVCiYpebYc
	Ea2f4zl0MaPP513Gys3joXyDCgIMDLM1nW2qPqwQA4HICUrBAWbi/923cTnLQuyy6be8B9CZHtugZ
	J6LyY2ek2JRE+ikFCD5HIM0qox695zycR2eoGXHh/qzy4LiB4P/Jy3VD6NTVDxhJbJLM02tv+Sahe
	nA9skNBQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLdNM-00BBgi-30
	for ath12k@lists.infradead.org;
	Tue, 18 Jul 2023 05:35:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I5Y5sQ005063;
	Tue, 18 Jul 2023 05:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=wI2pBkxpLUpAB3X5rfTIAH0MJvDD2NlcQekkg1nEGUk=;
 b=e2KcgLyqFebnOHTXEKc9GWCRGHM4aGemEcYZo3TGYpZLROmKqPmtqzd3F3J+LKJlrg+J
 21y1SCUNwRWdw+ekp6dnUI+EQKX/mGKfuq5mDqoK2NL0huvRFFOAdEaZGAVJKdwXCvue
 4kd49xGBbENrn2+FT13vQ4a1zU+fukvyQISeLY/8Wa4XiGhRvzaFtbDbpijIghH6kgJ0
 2SclE+TbTdo2QLEQ2eC9HZh5mOp/GsZTpwAztC6MRH6hAQqpdEpRn+Zowk2MhnEUPIpe
 Yk72SQAaAyfBtEz+0S+AMa0m4IfQ8Fdp9J8LNPdMMIcS/364AjlUP53MPEN7Rlm6TnC1 ng== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rw4af21j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 05:35:45 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36I5ZiDt020303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 05:35:44 GMT
Received: from rajson-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 17 Jul 2023 22:35:42 -0700
From: Rajat Soni <quic_rajson@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
Subject: [PATCH] wifi: ath12k: Fix memory leak in rx_desc and tx_desc
Date: Tue, 18 Jul 2023 11:05:10 +0530
Message-ID: <20230718053510.30894-1-quic_rajson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HMJ4rck0Vtq5ttlW12fJjs_ZM5UHm0ZD
X-Proofpoint-ORIG-GUID: HMJ4rck0Vtq5ttlW12fJjs_ZM5UHm0ZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=882 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 clxscore=1011 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_063557_670142_CCC34A87 
X-CRM114-Status: GOOD (  19.89  )
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

Currently when ath12k_dp_cc_desc_init api is triggered we allocate
memory to rx_descs and tx_descs. In ath12k_dp_cc_cleanup, during
descriptor cleanup rx_descs and tx_descs memory is not freed.

This is cause of memory leak. These allocated memory should be
freed in ath12k_dp_cc_cleanup.

In ath12k_dp_cc_desc_init, we can save base address of rx_descs
and tx_descs. In ath12k_dp_cc_cleanup, we can free rx_descs and
tx_descs memory using their base address.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 30 +++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp.h |  2 ++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index ae1645d0f42a..db6ac0e0be2c 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1129,6 +1129,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	struct ath12k_dp *dp = &ab->dp;
 	struct sk_buff *skb;
 	int i;
+	u32  pool_id, tx_spt_page;
 
 	if (!dp->spt_info)
 		return;
@@ -1148,6 +1149,14 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 		dev_kfree_skb_any(skb);
 	}
 
+	for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
+		if (!dp->spt_info->rxbaddr[i])
+			continue;
+
+		kfree(dp->spt_info->rxbaddr[i]);
+		dp->spt_info->rxbaddr[i] = NULL;
+	}
+
 	spin_unlock_bh(&dp->rx_desc_lock);
 
 	/* TX Descriptor cleanup */
@@ -1170,6 +1179,21 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 		spin_unlock_bh(&dp->tx_desc_lock[i]);
 	}
 
+	for (pool_id = 0; pool_id < ATH12K_HW_MAX_QUEUES; pool_id++) {
+		spin_lock_bh(&dp->tx_desc_lock[pool_id]);
+
+		for (i = 0; i < ATH12K_TX_SPT_PAGES_PER_POOL; i++) {
+			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
+			if (!dp->spt_info->txbaddr[tx_spt_page])
+				continue;
+
+			kfree(dp->spt_info->txbaddr[tx_spt_page]);
+			dp->spt_info->txbaddr[tx_spt_page] = NULL;
+		}
+
+		spin_unlock_bh(&dp->tx_desc_lock[pool_id]);
+	}
+
 	/* unmap SPT pages */
 	for (i = 0; i < dp->num_spt_pages; i++) {
 		if (!dp->spt_info[i].vaddr)
@@ -1343,6 +1367,8 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 			return -ENOMEM;
 		}
 
+		dp->spt_info->rxbaddr[i] = &rx_descs[0];
+
 		for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
 			rx_descs[j].cookie = ath12k_dp_cc_cookie_gen(i, j);
 			rx_descs[j].magic = ATH12K_DP_RX_DESC_MAGIC;
@@ -1368,8 +1394,10 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 				return -ENOMEM;
 			}
 
+			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
+			dp->spt_info->txbaddr[tx_spt_page] = &tx_descs[0];
+
 			for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
-				tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
 				ppt_idx = ATH12K_NUM_RX_SPT_PAGES + tx_spt_page;
 				tx_descs[j].desc_id = ath12k_dp_cc_cookie_gen(ppt_idx, j);
 				tx_descs[j].pool_id = pool_id;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 7c5dafce5a68..9aeda0321cd7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -289,6 +289,8 @@ struct ath12k_tx_desc_info {
 struct ath12k_spt_info {
 	dma_addr_t paddr;
 	u64 *vaddr;
+	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
+	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
 };
 
 struct ath12k_reo_queue_ref {
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
