Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4187CD129A
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 04:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHBV247EuHATE0zFQjuvlztrdxonKSO4FBN2eFp4Wmo=; b=3Yu1LRGYV9c4zT/kUGymUV5RoK
	t0Be0j5dp2U3IjLrUoHzGOVVyBXEnqvWj1GM7A0a2W1qB7fTdpVxWGxneXLvAhkkoGNVoOZjEph4c
	GBibsHFK6XrKg5iZzKP78rfluhq1/QKkxJKhxs416QNN5jkU+h3r67h61KCYOD9ROp9juKEzSP8j9
	XsiqzD2ZUywLHItTttAuYNO67qvoO34hDAkFrx0N/126OtkkgkEsKpLEY3SeLjZRUw4EVFkZ5eEWX
	Nyx94y1jIw6zHRqYkFhgedz2XYpkJ92dmT1ujO+m7rQ5tQQ9dGO+eLpZhnoqypkvSE/NNSDBqUg/s
	TGFeGSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtgGr-0000000EGDH-2gPX
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 04:06:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtgGn-0000000EGAd-1Cbc
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 04:06:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4381urCE011166;
	Mon, 8 Apr 2024 04:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=rHBV247EuHATE0zFQjuvlztrdxonKSO4FBN2eFp4Wmo=; b=Q+
	Vn4h+nIqGcVtrvc6Qpk3SGEgh586FOOgFC0+1t9gpQveHN1dC+7ji6fXpqi9FY0J
	fNzHmFYS/LoAuyVJDwb67mxKDWfgrEOtWvoqzXiGyPQD2v7EYDgkovsK0eDzo6pk
	SzVSgdBZAXOEyIQxO1woCIIF5nddlimRZqp/E6RFUDRor6RBUSP5V24zLjaz8lxW
	wZ+F5BXSkoRFI9PzuOAACw5BMWB4e0VHDJxNk4Yww9TP+0QG/zjg//cZOn7NRam6
	My39DgrP6qN/Cj5VcSG5EfT5qKoZrxGo6tfbz3aWZeSK1oJvMLkn+1T66PbDuQpK
	d8vMsNf0CtgNj90Xm7Aw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xaypdajuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 04:06:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438468AW025115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 04:06:08 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 7 Apr 2024 21:06:06 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 3/4] wifi: ath12k: displace the Tx and Rx descriptor in cookie conversion table
Date: Mon, 8 Apr 2024 09:35:46 +0530
Message-ID: <20240408040547.837639-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240408040547.837639-1-quic_periyasa@quicinc.com>
References: <20240408040547.837639-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tSStcAqYig14nK4a7OzE57CEna6qygQQ
X-Proofpoint-ORIG-GUID: tSStcAqYig14nK4a7OzE57CEna6qygQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_02,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=579
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404080029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_210609_349833_C4A11238 
X-CRM114-Status: GOOD (  12.36  )
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

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
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


