Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B45E77183
	for <ath12k@archiver.kernel.org>; Wed, 18 Dec 2024 03:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amDLeLQXviEK4puuNnUcWE1UC/rAJmwwEy5/+Aq3G+s=; b=i09q7sKpYogucSCa6VRgOPTdfh
	4ffmnCNwRhhl/bxJkE5vNrYWqur8pGKdu1QKe//Ls+OwazGqunCnBN5AaFX3qr3k9VhMvCUUmELKN
	a6BonxKznQA2Whqtni7NnyyTEru1Lc6NtEY1mr9HquWc6QopfB4BqUafwgaxAkiE1V2C4SKjvDwvB
	Z/2vlL00z4c0weWWVUKsyqdd+UBlcn4vfIgvKo8KhufDo2+OQxsGE/o9JaQsMctPYpS2WU+oJXwe/
	R3eDzmeXSJio+/n25EuVNQ61TEO/OY7CaQlIRo1knWlKjiztBXBV6VF4bl5dJ3Qtn2AngjhDoOhAM
	DEVzi6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlBm-0000000FW62-2lZH
	for ath12k@archiver.kernel.org;
	Wed, 18 Dec 2024 03:57:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlBj-0000000FW5N-0EZf
	for ath12k@lists.infradead.org;
	Wed, 18 Dec 2024 03:57:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI0npw9011571;
	Wed, 18 Dec 2024 03:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=amDLeLQXviEK4puuNnUcWE
	1UC/rAJmwwEy5/+Aq3G+s=; b=MOi+fj2qxCK3lgzQfwnz880tUZIPoH1ZNkiY95
	opL+RZwfbtj9po27AedB9OMnFZm4qb5oXZ9JZkJP7xClFwA7NlaZLI6HbXiDt+Zs
	KYxMm6Cz/DzEO7s3O7CrSaxienas6qYEDJKTDlcwmN4YrCAsA74Yr2iM2TYemkVB
	077J0eqI+D979UDvxhNqw75ADD3rek1q4H9TNOSXAU2HwA5zQvgLghMrYzJQjJWt
	Cw8AtdOtTU6NLAUUIsu3p53JKQKolFuXjzIUEKvS2B6Q1/evY+mXCm82vOyilhpu
	JZh9aT0gf1SgTkAhn3uEXY1Lex/+Mf4O2Htt/h6dMvp2PFyg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43km6r8buk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:57:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI3vS7f027192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:57:28 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 19:57:27 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v5 0/2] wifi: ath12k: Support AST and Puncture Stats
Date: Wed, 18 Dec 2024 09:27:09 +0530
Message-ID: <20241218035711.2573584-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K3QjocC_-sbFH3aTBpQa1Bn1Pd1cyeWb
X-Proofpoint-GUID: K3QjocC_-sbFH3aTBpQa1Bn1Pd1cyeWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=665 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_195731_212750_C5A8D14B 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
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

Add support to request HTT stats type 41 and 46 from firmware. These
stats give Address Search Table(AST) entries stats and pdev puncture
stats, respectively.

Depends-on:
[PATCH 0/2] wifi: ath12k: Support Rate and OFDMA Stats
Link: https://lore.kernel.org/all/20241128110949.3672364-1-quic_rdevanat@quicinc.com/

Rajat Soni (1):
  wifi: ath12k: Support pdev Puncture Stats

Roopni Devanathan (1):
  wifi: ath12k: Support AST Entry Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 157 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  56 +++++++
 drivers/net/wireless/ath/ath12k/dp.h          |  12 ++
 3 files changed, 225 insertions(+)


base-commit: 9a448415ed0c46edeb9170091a03b620986ca0b2
prerequisite-patch-id: c30df5e4af6f5773ed942d8f78de88c05ce2b18b
prerequisite-patch-id: f2181eee4bce2e3487db9bd81ed962f477759e7e
-- 
2.25.1


