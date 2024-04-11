Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D796CD128A
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMoVr4OS8CjyWfHtQ8yP5yFWNLbgdfgMWtKfF3lm2Kk=; b=ATUdt+Uaw/uP/76/VTJvPG4ReT
	10zIwDR/9PpcpiuMV2J3CybuaVtaEQ9h3zoSjOUrWCjQ5fHONOcEencDPXrptu0Iu4Hd5gKUnU/55
	8feecQgqZy0bKHFY4a/NuzYzjNVOupgR7zJMg/CGN0nfEEodMkcImfySqPtNSbY8miDoJdE1gpL1H
	KvHXFbjpbNnOxrheaIELvfB9HOuHDyog+2L9WEDiXgfyLAd7yz2UWQfyxk0yEk44UUagMSV7UqS04
	sNMiFgVUoSfoLXSCAr3of2aqqggq6quycTQMKjxTWXXI1Jvx1kCZXrwLCrhq6XCeSbdADCwVAmm+z
	YU6XuUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rura0-0000000BV14-3lLB
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 10:22:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurZx-0000000BUz3-1G1w
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 10:22:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43B8Eu1T032424;
	Thu, 11 Apr 2024 10:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=cMoVr4OS8CjyWfHtQ8yP5yFWNLbgdfgMWtKfF3lm2Kk=; b=eF
	b3agbuhEYEZu3N4MN8LDJbQlp59RD7zPbCzXG6pSDI6FMbnz6+nWFxhZDC5U3PKZ
	HbI9dr9+jz98WxzoJCqgaHL8YgR9dyxzO4D+mcaQYbM/X3JOBD5jqlgDmCU2EY9Y
	aRx4Kl5SRB4IDpRt/ktOZW9VvJ5gFUNyG7vpeonamG994uKKFKmIP6KivPo81TFs
	VBun6Y6EiW3oXhdtCQFUVgtP2liJGz+bEiaj3i92sVO7SL6OUyNckxoVniRZsq+i
	GxJLrWOYqMVoG6GcPOPp/Zm+Tsj+QvsyHtjxmP5WnOMXpvK3YV/4jR4xeWbQGWz+
	LAcDz/jWw/s2FUnZIA+Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xec6dgjgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:22:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BAMmqH029372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:22:48 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 03:22:46 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3 3/4] wifi: ath12k: displace the Tx and Rx descriptor in cookie conversion table
Date: Thu, 11 Apr 2024 15:52:25 +0530
Message-ID: <20240411102226.4045323-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411102226.4045323-1-quic_periyasa@quicinc.com>
References: <20240411102226.4045323-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ayPaBopddfeqJL4BBGKlMCXoZ9hNkvck
X-Proofpoint-ORIG-GUID: ayPaBopddfeqJL4BBGKlMCXoZ9hNkvck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=602 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_032249_483320_D288FAAF 
X-CRM114-Status: GOOD (  12.84  )
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

In the hardware cookie conversion table configuration, place the Rx
descriptor at the end. This will allow for easier addition of partner
device Rx descriptors in the future to support multi-device MLO.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 57aba97cbdce..5cf0d21ef184 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -223,8 +223,8 @@ struct ath12k_pdev_dp {
 #define ATH12K_NUM_TX_SPT_PAGES	(ATH12K_TX_SPT_PAGES_PER_POOL * ATH12K_HW_MAX_QUEUES)
 #define ATH12K_NUM_SPT_PAGES	(ATH12K_NUM_RX_SPT_PAGES + ATH12K_NUM_TX_SPT_PAGES)
 
-#define ATH12K_TX_SPT_PAGE_OFFSET ATH12K_NUM_RX_SPT_PAGES
-#define ATH12K_RX_SPT_PAGE_OFFSET 0
+#define ATH12K_TX_SPT_PAGE_OFFSET 0
+#define ATH12K_RX_SPT_PAGE_OFFSET ATH12K_NUM_TX_SPT_PAGES
 
 /* The SPT pages are divided for RX and TX, first block for RX
  * and remaining for TX
-- 
2.34.1


