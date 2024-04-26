Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34771C4345F
	for <ath12k@archiver.kernel.org>; Fri, 26 Apr 2024 01:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dsjdCHVqQIcdlUkuZKOpdgqwATTtl9UjvPBH/m6i0GI=; b=PhlNpvBZhtFgWXl9Iu9wfUrOAu
	RMJlcVyKXUXlVSjrXn1ki5v5FXlcVvHxJI7Y9Kh3Xz9RbAoTbDhtzCtaTmH/GE89l+nLc+1YBxOQp
	CnQi6YoxqeTvc2IxNy+nRa1iYYIexTh/ltOgz5b1LawOGuzVigfBOgQb/bo5FXxvAThWyZHpYZdl/
	pxM0jGU9xy66FxuOGAqHgx82qu3xCnyAR9fWPVyw1/qWvtRnRUBj06KxACKvY9wJHBrJZwFocR9ZH
	AcX/jMzVSeSu/QYb8101TnBayIeWkXO1AwMmuSYPZT1sAk6KONlSHgZ7jw1saTLs3Jd5N37YUKP0e
	DGsVhVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Ang-0000000Apql-1xTO
	for ath12k@archiver.kernel.org;
	Fri, 26 Apr 2024 01:54:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0And-0000000ApqJ-0R7b
	for ath12k@lists.infradead.org;
	Fri, 26 Apr 2024 01:54:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q0k25d011116;
	Fri, 26 Apr 2024 01:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=dsjdCHV
	qQIcdlUkuZKOpdgqwATTtl9UjvPBH/m6i0GI=; b=hZgdUDbw+M3NuCbGglRlUaO
	LWl+lOdb85CyAFj0aMojtCparX6KIaq5hI5oH1ttgs2IvGIBxvCnFh90yuvX5jXJ
	VFzWA6prNzWtfbDD0nizxmhiJHYumdt2Y+4kNX37+X1Yel3RyT80oXWs13NXQs/i
	NLeo3aiSkGE3aTaUw2rwbn1C6eG2YZUVyML9fRX+KOgchtrOD4ykrGe56Ii3pnGi
	UjKiBpT8X8c+FUQlgc4E3uKDvd/n0O4nojEsn3ziZNDHP0EWS0I1UPuv+YXN3GiC
	9uIDNX8dkYEIBo6gVBwLOaDH4znWsX0avHik75gRxL0gpsrZbDn22q5kVCGLKVg=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqx038fy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 01:54:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43Q1smP8001401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 01:54:48 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 18:54:47 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: fix flush failure in recovery scenarios
Date: Fri, 26 Apr 2024 09:54:34 +0800
Message-ID: <20240426015434.94840-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v0lr0kkODGFazu0rgdHuiEy7uoKe7zZi
X-Proofpoint-ORIG-GUID: v0lr0kkODGFazu0rgdHuiEy7uoKe7zZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_23,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404260010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_185453_355781_0447735B 
X-CRM114-Status: GOOD (  14.73  )
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
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v2:
 - add 'Tested-on' for QCN9274

 drivers/net/wireless/ath/ath12k/dp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 963b9ad4dc82..7843c76a82c1 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1155,7 +1155,9 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	struct ath12k_rx_desc_info *desc_info;
 	struct ath12k_tx_desc_info *tx_desc_info, *tmp1;
 	struct ath12k_dp *dp = &ab->dp;
+	struct ath12k_skb_cb *skb_cb;
 	struct sk_buff *skb;
+	struct ath12k *ar;
 	int i, j;
 	u32 pool_id, tx_spt_page;
 
@@ -1206,6 +1208,11 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
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

base-commit: bf99bc7423e18aa3475ef00a7a6fb773c31ce6df
-- 
2.25.1


