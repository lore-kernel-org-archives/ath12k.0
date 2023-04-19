Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E97C6FD18
	for <ath12k@archiver.kernel.org>; Wed, 19 Apr 2023 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PRvly20e8jp81485ciNqvztzMorYsf4nAvXde5adNYE=; b=UNPuJWO2xMPdOG
	GnYfAT4BDYPR6pEg18EaQmLHH1A+2wN84t1oLLt7/t6sqWWe3OQ3NrfNuwiovSw7wKyxPm7uDMKHi
	ar312q9/uSAHJTFBWqyBff5b0/UaT2gVI1QECqnyxq5MX/+RqukOpoy4fdQGv0ppxKdgVIKHJMEUD
	mHGB8obnsbVJRKvUTRqu8Ik+j9OP1jbWK28DQ/yKL4Ke+x7W1A3ypHNNWgUZV/gL+5RRNp5173N3G
	b/tfd5B7ClOJ6a75aq88qys5YeH6LVmWlbUYCAUCFakb09pXioC2MomZU0LxmXtSRe0ZB2PFl6Ka9
	jU8LMssmnoOlNVTO7cPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4Zk-004pht-2D
	for ath12k@archiver.kernel.org;
	Wed, 19 Apr 2023 09:58:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4Zi-004pgs-13
	for ath12k@lists.infradead.org;
	Wed, 19 Apr 2023 09:58:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J9WIfE032428;
	Wed, 19 Apr 2023 09:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=nraxzcYXsGeNLGsYi+VqecXFFW2kNnGQ85j73xb3WM8=;
 b=I3Vs45kiuC0M/ioBq5SixBuCR6+stWyNfVQ5N6ZH5tjZ1DkXldpHb4q3fPyCMsCIkFNw
 8tmR5s0Pzpw3pjQKGFsNix7O52wwUNc5sgFecHi8g+HReLLJLEDCKQi+aQ3FMCApAmY8
 swQBOzhTOOl5QZNZ6XKdNAsjvzzyrhYSJbZRM8mAjQ9+GGcn/YK+cd36Wj0rubOh6qrv
 Uzm9HKd8D9HruOD1KrEsOJR8CXWc7OGBQFqC2AjTZyRnmJ3yCg/F91WrlA/6juS2O+hT
 6kgZ/T8b7jxqLEko7CvfJ/Sxrzxy9MXTmDbCff+4O0ezJhPp5qa5aYJjakKZoPa7/Cz+ YQ== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q292h8mdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Apr 2023 09:58:04 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33J9w1fE016973;
	Wed, 19 Apr 2023 09:58:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3pyn0kf1pq-1;
	Wed, 19 Apr 2023 09:58:01 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33J9w0Qc016964;
	Wed, 19 Apr 2023 09:58:00 GMT
Received: from rgnanase-linux.qualcomm.com (rgnanase-linux.qualcomm.com [10.201.162.135])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 33J9w0tD016960;
	Wed, 19 Apr 2023 09:58:00 +0000
Received: by rgnanase-linux.qualcomm.com (Postfix, from userid 2378837)
	id D8AFD1100068; Wed, 19 Apr 2023 15:27:59 +0530 (IST)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: fix potential wmi_mgmt_tx_queue race condition
Date: Wed, 19 Apr 2023 15:27:58 +0530
Message-Id: <20230419095758.19998-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EoJPcOCfLn77mnG_llHgkue4PlI0t1X0
X-Proofpoint-GUID: EoJPcOCfLn77mnG_llHgkue4PlI0t1X0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_05,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=708 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_025806_501382_9BD4EB6A 
X-CRM114-Status: GOOD (  14.10  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Karthik M <quic_karm@quicinc.com>

During stress test with maximum VAPs and peer connected, below warning
is seen:

[ 1079.110967] ath12k_pci 0004:01:00.0: mgmt tx queue is full
[ 1079.117708] ath12k_pci 0004:01:00.0: failed to queue management frame -28
[ 1079.123191] ath12k_pci 0004:01:00.0: mgmt tx queue is full
[ 1079.129960] ath12k_pci 0004:01:00.0: failed to queue management frame -28
[ 1079.135641] ath12k_pci 0004:01:00.0: mgmt tx queue is full

This is caused by potential race condition while accessing skb_queue_len().
When ath12k_mgmt_over_wmi_tx_work() and ath12k_mac_mgmt_tx() is called concurrently,
then skb_queue_len() might fetch list length which is modified by skb_queue_tail()
or skb_dequeue().

Replace skb_queue_len() with skb_queue_len_lockless() which will
prevent concurrent modified access using READ_ONCE(). And also use '>=',
in case we queue a few SKBs simultaneously.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthik M <quic_karm@quicinc.com>
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
v2:
    - Corrected patch format
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0e5cc477ba56..cc458fed5e78 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4489,7 +4489,7 @@ static int ath12k_mac_mgmt_tx(struct ath12k *ar, struct sk_buff *skb,
 		return -ENOSPC;
 	}
 
-	if (skb_queue_len(q) == ATH12K_TX_MGMT_NUM_PENDING_MAX) {
+	if (skb_queue_len_lockless(q) >= ATH12K_TX_MGMT_NUM_PENDING_MAX) {
 		ath12k_warn(ar->ab, "mgmt tx queue is full\n");
 		return -ENOSPC;
 	}
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
