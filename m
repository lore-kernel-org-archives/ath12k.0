Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD8BEB64DA
	for <ath12k@archiver.kernel.org>; Wed, 19 Jul 2023 06:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yzEhBfOViPpHyKq2NJySQS1cuI7ANzfEtt1gqeA/4dQ=; b=OfLEh6PnVQeek7
	HwepHqytpF3095JeDOAOfM4mzzIAxxlLR6KDjWCMa7oViOo9Ec9jmXcEwitNbA6y6quWOCnejnWpU
	lb0jzRhjYqYiDDTo1EEGw3mJy6JMZSjxi/Z5SckfHaov2xu2IwMpyRyba5cwKO/1SHReFu/RbYPLC
	W7mbG3iVDeClLBlKZJAq7Fbpv2XFaRamWYVQieBnkHLdHiEzW094i+vV2dRt/XxPxiEXWnAGeDHHv
	/2GzYF0NArW/UbU+kMEcylRg1BxKgCL452g+wegJN5QNe4LUFrD9HgCA6iGb2xJtvySnZ3QzW//4S
	ALTGzNXM0KuwpICVa0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14y-005xe2-1o
	for ath12k@archiver.kernel.org;
	Wed, 19 Jul 2023 06:54:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14w-005xby-2t
	for ath12k@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Y4LVSotgpj1rOBsiuRlk9VRWl4eBVM6YTEqbq3VQpK8=; b=Sj/XAiOmKV9ov5ZjoWrjYmFM4J
	pjNquk5xEIxUrzUGGRXFRfRzzPut5F3UIOGOA2eyX7wjyoY+aY8Sa4XXubsOEF+dLJ1rZ+aHwBHay
	2Q5dUntI0F4+nRfyvzN5Czy/u33g03qKRrSW3g4Iq1coZLbLeVnA0GAwyXA8IKzxTXbtlgSeWLS9M
	Oazg7/Th+QrE3WvidxDNVxlryrEdTDHf3FY46fHOqo2+s7ffsWxT5C2/FtJftxs95y5gm0fy7fB4p
	qKHiOELAze0teRwL8zHNpZMHpJUhYSmM6MaSyG4SYJw2ULLEKWby4swxRMLqbPk/g7nDNmnX2lkbG
	dlg7XRPQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLala-009aaC-0f
	for ath12k@lists.infradead.org;
	Tue, 18 Jul 2023 02:48:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2VrZP010945;
	Tue, 18 Jul 2023 02:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Y4LVSotgpj1rOBsiuRlk9VRWl4eBVM6YTEqbq3VQpK8=;
 b=ShpHvMSFHx7WqRkLdOp4UAdWPBMwmZqVly2+2FeFzHTAcYVNOE4H2CfAZ08o86AZ8sNW
 Su9ULJwHBOpQL5Z9UdhTO1OCVnOCU7O/Gx6bfsnkoshWevwwlUcxPq504t5IXQEshbFV
 eaEjcxq3hSFksrijPntxlRmTfbQIuiomBKK/C3izBaewnG4+PhW79LxodoTStZawe4Z1
 0ZJK81D1s2WlPbzrTrvoe453BgnIeUAbIHfJLPdCh+9T4U5ZNyM4UZZHNb7ZudpQY4S9
 cwtZeKWBKb7LRyPFn7g2vXG4UQD/cdJ7LManDKqPY7HIH+9XDWksBFLozFCdBtpMz7jC Uw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run1jcxw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:47:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36I2lc1x019488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:47:38 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 17 Jul 2023 19:47:37 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath12k: avoid deadlock by change ieee80211_queue_work for regd_update_work
Date: Mon, 17 Jul 2023 22:47:24 -0400
Message-ID: <20230718024724.29120-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dfmhe5738vx9ZAhRJyImvME62JUrLzQd
X-Proofpoint-ORIG-GUID: dfmhe5738vx9ZAhRJyImvME62JUrLzQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=770
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_034848_801956_60EB2D92 
X-CRM114-Status: GOOD (  16.54  )
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

Deadlock is easily happened while shutdown wlan interface such as run
"ifconfig wlan0 down".

The reason is because when ar->regd_update_work is ran, it will
call wiphy_lock(ar->hw->wiphy) in function ath12k_regd_update() which
is running in workqueue of ieee80211_local queued by ieee80211_queue_work().
Another thread from "ifconfig wlan0 down" will also accuqire the lock
by wiphy_lock(sdata->local->hw.wiphy) in function ieee80211_stop(), and
then it call ieee80211_stop_device() to flush_workqueue(local->workqueue),
this will wait the workqueue of ieee80211_local finished. Then deadlock
will happen easily if the two thread run meanwhile.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 7ae0bb78b2b5..ea6de84bf5cd 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5213,7 +5213,7 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 		ar = ab->pdevs[pdev_idx].ar;
 		kfree(ab->new_regd[pdev_idx]);
 		ab->new_regd[pdev_idx] = regd;
-		ieee80211_queue_work(ar->hw, &ar->regd_update_work);
+		queue_work(ab->workqueue, &ar->regd_update_work);
 	} else {
 		/* Multiple events for the same *ar is not expected. But we
 		 * can still clear any previously stored default_regd if we

base-commit: 0a00db612b6df1fad80485e3642529d1f28ea084
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
