Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3564C76196
	for <ath12k@archiver.kernel.org>; Mon,  3 Apr 2023 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Az6O9FBVOYHe3wXNBfmoPCSvvGudvp3QkDdxk8jxWHg=; b=qFeYf5b+VV4PgF
	p3zvUR9Yv+KN1JPqZ6Uv6rbqUde+FmDgvz3c+RHDSkAHfljnolhsEKVbweccg6tLxxaXUH+ROg53D
	QeEOWGg3rVbO34I8gI02iTeeh4urgVmdf30XauCTwN8cUSPaPfOorayfHE6Ya+IR3nPMuMLebCSo3
	NH3PDEJ10m/tOSNoFazKMG6rhPo6LWCnXCFYM4vADVrOU4omPne2vv6U03ntMHd20bO8GgAXl5LaH
	LKWC/jsBl7ENFn0PSLGuVXEEVgi3249/p5WcWpPRJh3XAbttVLEJNaBLUPcDvUazq3oX9jNzYqS3o
	PyT49matvTLhVIMkiwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNp0-00G3k4-0y
	for ath12k@archiver.kernel.org;
	Mon, 03 Apr 2023 17:18:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNox-00G3jA-1I
	for ath12k@lists.infradead.org;
	Mon, 03 Apr 2023 17:18:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333GrwjJ031148;
	Mon, 3 Apr 2023 17:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=2IKGJSGRDgCTFOID39/BQnrOwlJxEKuvnOW895Mwc6o=;
 b=V5HrSkEZttrgo5qim/cWEOdVLdlsEH6bvvEto5eHBvx+QTRjovom7QIuQr7jwZO/OoAg
 foRhlr/lg2uv2MBLuesnyzu5oK1tYUZ/BNUlNmvF0uM9pYa6RCTlKb6a4XKXE7/5JzlE
 4W6PIO83b94ZMm7DmtGvzrtvnI/64xQQpdieRh+TKr/A8oDqm8n6y282xmYSKBxWXGHa
 k5tZUOYiJvaGD3Y1DP0Ltxsry+gskk7DCs8YkkEr+1qMg+gdJAvb+yP9ITWkxCNSndMg
 BVh61WpR8bvn3HXwf/kLfm4w3Xh6ZV2oyL64BhTSiA61Dh0zmgCaiax6m3lM7qmL/M6x pA== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pquxth69k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 17:18:16 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 333HIBpO030158;
	Mon, 3 Apr 2023 17:18:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3ppdpkepnh-1;
	Mon, 03 Apr 2023 17:18:11 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 333HIBr6030153;
	Mon, 3 Apr 2023 17:18:11 GMT
Received: from rgnanase-linux.qualcomm.com (rgnanase-linux.qualcomm.com [10.201.162.135])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 333HIBPE030152;
	Mon, 03 Apr 2023 17:18:11 +0000
Received: by rgnanase-linux.qualcomm.com (Postfix, from userid 2378837)
	id 355871100076; Mon,  3 Apr 2023 22:48:10 +0530 (IST)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix potential wmi_mgmt_tx_queue race condition
Date: Mon,  3 Apr 2023 22:48:06 +0530
Message-Id: <20230403171806.12805-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -WCGk4UhNoM6I7k5SnsvjfDeATYi9HEE
X-Proofpoint-ORIG-GUID: -WCGk4UhNoM6I7k5SnsvjfDeATYi9HEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_14,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=718 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_101819_445471_1788080C 
X-CRM114-Status: GOOD (  10.75  )
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
