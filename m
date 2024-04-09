Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FBDC67861
	for <ath12k@archiver.kernel.org>; Tue,  9 Apr 2024 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMoVr4OS8CjyWfHtQ8yP5yFWNLbgdfgMWtKfF3lm2Kk=; b=V0Fsk9iKYdFEQ1AkAgosmMa+91
	iStZN2Q6ykLBdJt6qoJuL7dCzC5mX0Ldix40DW0NeB6+1P6SdhRipxGl2E1R7FzKY6GynubrPxha3
	JSQ7HO6puBK46ld/oov3Qmw45FR314/o3qqsyyRnv10WmLIz9IXXO2ZmFzvfksI/Cck0HegqOtOTv
	T+KCGTE/AjGjlfoTYLnH8doxv6TCo7Jms+TPjrK0MEPB5rBNSWrqOQONzVsHoYwOxAU1lqk8s7WIc
	jHywSxgceUhtCM72oFkJ1jBF5ptzF45B8ZptpDmPzLr46lkYBnKvIQy09nGZWd1tozVSzUBtg4a1a
	Gv/9PVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDBJ-00000002e9i-1bU2
	for ath12k@archiver.kernel.org;
	Tue, 09 Apr 2024 15:14:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDBG-00000002e80-0jIr
	for ath12k@lists.infradead.org;
	Tue, 09 Apr 2024 15:14:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 439BmNvL009235;
	Tue, 9 Apr 2024 15:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=cMoVr4OS8CjyWfHtQ8yP5yFWNLbgdfgMWtKfF3lm2Kk=; b=Cz
	5cHZY609xNifYG7ufHReqC2jMKE4i8runOBSDyIwUy83ZPg6Wu3ry3boA4+OD074
	mD6mnR2tKA4KKmCTYx9kvnO4WeDVNZC/LR6h15Lng6xTTCYrGkyEA0gcGu6Jt1qe
	RkL5ZV1JBgpinlqf57MXWZZuM3LzwMSVbg6Dd9V+YNl0cZJaqtghVq1nvNgCK6Sn
	mutVZEy/Y+w1hZkl7HG8mI6gnRsbZZlKEbX55Fr48smk8LM9XknpgyScK5IIzD+6
	FoqQV6VfOW4i5jPY1sgLz8ISB3046kbThzUtWtzoVSDKwaRFB2BxVoM31z/ug2UM
	7QWWgWMCXTa6+5mxJBEA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xd39q0nng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 15:14:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 439FEaru002977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Apr 2024 15:14:36 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 9 Apr 2024 08:14:34 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v2 3/4] wifi: ath12k: displace the Tx and Rx descriptor in cookie conversion table
Date: Tue, 9 Apr 2024 20:44:14 +0530
Message-ID: <20240409151415.1226109-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409151415.1226109-1-quic_periyasa@quicinc.com>
References: <20240409151415.1226109-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QEct4f4V5wJ60yHwA4c_bEKpPInN1B-d
X-Proofpoint-ORIG-GUID: QEct4f4V5wJ60yHwA4c_bEKpPInN1B-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=602 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_081438_247598_07F449F4 
X-CRM114-Status: GOOD (  11.61  )
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


