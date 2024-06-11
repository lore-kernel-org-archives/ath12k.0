Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0E4C27C4F
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 03:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxafXVy0xULxTQS2ri4rwhBvND3NL8O7Oa6bvKd4zns=; b=Ycn98nlUDEsspmLYNuprAQj1T4
	LoENq+DdVwM53lI6VZzeLXao04893DjdZLM0jfLmUR0smr5pvhi2X1o4itKletqsbRt1pG++3g0cK
	2ntmONpKTK3lVzIt3nwejJ+NrzDsQxM7tce3MM0XjE7jT/chHpp3ISSmnDuzRv6YeCviyGzRkAITB
	uF0AncNP9q5MOEQqmHsnEyp6HFBK5rDIfUnvvB6VmUAaLzgPXBNbjtpdaXsrk+9tlQ4rxbgopZlXQ
	szSTiu3xXdiEtmCmyeyE3Ij8lO14qgwO7hP44IyHywmyt5QkYWHl+kqOaR2AO3Qhv57GM4Rtys1Aw
	CepOeKnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGruK-00000007ECA-2cPy
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 03:10:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGruG-00000007EAw-2PpV
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 03:10:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B2VNFF006787;
	Tue, 11 Jun 2024 03:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxafXVy0xULxTQS2ri4rwhBvND3NL8O7Oa6bvKd4zns=; b=baClxGrE1NBo9EkD
	z+znY+Iy2yFBWLQ1Hw3Y6Wh/wm6AZHmymOFLjyJQTMSwl27zQVAx6G5Et6kz+obg
	spdKKHfnqtQZ1gARpE1Qd+SHuRwq8OutLkIM/EzuuYQT+M/ALh41A50L7If131z4
	Ezf142FWTB2KZhMGGjdh8cUfBZFzl6e1rEuN6cG1VgSj5uIqcWoKeQXfNU2v9rF0
	mY+FNmF+zdp9fEe1+lws5igkK2tdC1q6mnk4XBEhrC0Qd6CQ8PAGzT9w6BWwm3qo
	Oiqxricxe/Y1npPDF6ShQPWczH8NCxtCjnaUBk3zQoH9p/Eo3Nvtjr6NszbhfYv7
	5eE7zA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfh35w57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 03:10:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B3Ab2q030515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 03:10:37 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Jun 2024 20:10:35 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH 1/2] wifi: ath12k: fix NULL pointer access in ath12k_mac_op_get_survey()
Date: Tue, 11 Jun 2024 08:40:16 +0530
Message-ID: <20240611031017.297927-2-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611031017.297927-1-quic_aarasahu@quicinc.com>
References: <20240611031017.297927-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RtvwAzBidLSv5VaFlUameI8lrYBXDhvn
X-Proofpoint-GUID: RtvwAzBidLSv5VaFlUameI8lrYBXDhvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_08,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_201044_645555_376B4A45 
X-CRM114-Status: GOOD (  11.89  )
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

Smatch throws below error

drivers/net/wireless/ath/ath12k/mac.c:8318 ath12k_mac_op_get_survey() error: we previously assumed 'sband' could be null

Currently, we access sband inside the null check of the sband
in ath12k_mac_op_get_survey().

Fix this issue by removing the entire if block, because decrement
idx is unnecessary since there are no more band to test.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: 70e3be54bbdd ("wifi: ath12k: fix survey dump collection in 6 GHz")
Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 509c02bffdae..4fea411545bc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8314,10 +8314,6 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 
 	if (!sband)
 		sband = hw->wiphy->bands[NL80211_BAND_6GHZ];
-	if (!sband || idx >= sband->n_channels) {
-		idx -= sband->n_channels;
-		sband = NULL;
-	}
 
 	if (!sband || idx >= sband->n_channels)
 		return -ENOENT;
-- 
2.34.1


