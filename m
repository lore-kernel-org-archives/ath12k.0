Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAF3CD1288
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 01:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F9BZd3t29r0aH146EHm7ypIrvmdNcdcAo23/taNDQNk=; b=4KRGFqnt3Vg5DJUBIbH3rnVdxQ
	Mq/b2peUqBknnN7I0vrl8pJLkNIZRn+IsAdstlFw2ohMAFgASutGBAOw+Ge1FY1II8be/4KZidvag
	/GLT65q4FxTmDvglU9I2nYclO2fce1buoLB1IL8zaSt2zJHcBcBvhO+m5gSWxbbr0nA5vYU7jbc9m
	PV9g3W+wyHx/CPu61UGZq29lwL8ZItgpyjCFfAv/ZgPB85bWhWUKfihRAKlmRUstKtZVQFP3bSAXt
	C6mPzLYfVoEjvgEmhMHvJJaky+lASMcCbp9nhUHE06NhqCaAodd44L5lfKClw3/2POXq+DaQHEfQF
	AGHSOzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq1UG-0000000GRkH-1MA1
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 01:56:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq1UD-0000000GRiv-0TEV
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 01:56:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42T1f3wM022779;
	Fri, 29 Mar 2024 01:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=F9BZd3t
	29r0aH146EHm7ypIrvmdNcdcAo23/taNDQNk=; b=kBFcZ5F4FEq8DArIRnFnRRK
	9S70Gj+vW2HRrZYzRW0BRy4P5jChEVANOys1Vg1SW20Im4rNP5XheMF91alFNOHD
	7HOmI7it2b4xam0tKz7i657CVO0oBBaEm2TS7L8D4KeFZaB3jj1F5I54gxq/X3h/
	ti17qdbB2EryIyNS0uJpld+ELEA3KZDg3/a4Q+kjXtYo+W2bXmD6tUKucLwlCl5+
	4JaORG/gOfkaOKPwSb4o/Uq1904OGpoldi7J7OJoIqjEed4RU4lBsFXR18d7bFkK
	I7lFEpVOKsMhn/aRMLzOz8f5KJsNL1TUcOAU3uNoE6ph5ihTM5huRqI1eP9dTDQ=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5fr7ggth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 01:56:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42T1un2e012861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 01:56:49 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 28 Mar
 2024 18:56:47 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix flush failure in recovery scenarios
Date: Fri, 29 Mar 2024 09:56:30 +0800
Message-ID: <20240329015630.3019-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bzvV04oXi8eKaWWQTntBhMOfwcZNhGpP
X-Proofpoint-ORIG-GUID: bzvV04oXi8eKaWWQTntBhMOfwcZNhGpP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_01,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_185653_309031_474D3143 
X-CRM114-Status: GOOD (  14.70  )
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

Commit eaf9f17b861b ("wifi: ath12k: relocate ath12k_dp_pdev_pre_alloc()
call") moves ath12k_dp_pdev_pre_alloc() from ath12k_core_start() to
ath12k_mac_allocate(), resulting in ath12k_mac_flush() failure in
recovery scenarios:

[ 6849.684104] ath12k_pci 0000:04:00.0: pdev 0 successfully recovered
[ 6854.907320] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
[ 6860.027353] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
[ 6865.143385] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0

This is because, with ath12k_dp_pdev_pre_alloc() moved to ath12k_mac_allocate(),
dp->num_tx_pending is not reset due to ATH12K_FLAG_REGISTERED set in
recovery scenarios.

So a possible fix would be to reset that counter at some proper point,
just like the old design. But considering that the counter tracks number
of packets pending to be freed or returned to mac80211, forcefully reset
it might make it hard to expose some real issues. For example if somehow
ath12k fails to free/return some TX packets, we don't know that because
no warnings any more.

That is to say we should not reset that counter during recovery (which is
already done due to above commit), instead should decrease it each time
a packet is freed/returned. Currently almost each related function has
this logic implemented, except ath12k_dp_cc_cleanup(). So add the same
there to fix this issue.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 1006eef8ff0c..ddfe1eb82d6b 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1150,7 +1150,9 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	struct ath12k_rx_desc_info *desc_info;
 	struct ath12k_tx_desc_info *tx_desc_info, *tmp1;
 	struct ath12k_dp *dp = &ab->dp;
+	struct ath12k_skb_cb *skb_cb;
 	struct sk_buff *skb;
+	struct ath12k *ar;
 	int i, j;
 	u32 pool_id, tx_spt_page;
 
@@ -1201,6 +1203,11 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 			if (!skb)
 				continue;
 
+			skb_cb = ATH12K_SKB_CB(skb);
+			ar = skb_cb->ar;
+			if (atomic_dec_and_test(&ar->dp.num_tx_pending))
+				wake_up(&ar->dp.tx_empty_waitq);
+
 			dma_unmap_single(ab->dev, ATH12K_SKB_CB(skb)->paddr,
 					 skb->len, DMA_TO_DEVICE);
 			dev_kfree_skb_any(skb);

base-commit: fe7e1b830cf3c0272aa4eaf367c4c7b29c169c3d
-- 
2.25.1


