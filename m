Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DBAE7716A
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NIxDNc4Wrn88RCBafG/4q2FFhZHyLbdO/ik3ovJBTho=; b=sBWly+V1X7hYeDt0mvLvYrxu+s
	EbO3QJtz8a6LRyoQTwHdHnY8loUGQfbk+nXqDC8Ri7DSzoAiVFO55q7o5ZJfjuSDfZ9xUO6T62joJ
	hdDzmiJgPK3nylC0od+AahuvjSquAYUynd6oRYssKkUcZpb+8Zlk8vR8cHH0aLcFfwbqbl8XyiMvt
	n1VFnVbfIbXX/HTaSFa/aIdxHDeyi9nqEql3wu5iWm/yxBDjLrgPxLbvr89JKpvKBjSt1B/POtW69
	ocaxi+JKfp3s5N2DM4q1UtUl5O4L/p14dvybR5LdT4gMWDtFWvtiq58cbhP1CE3acIYZ1jaHz6gGr
	SuHRR4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQXP-0000000CM47-3E5v
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 05:54:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQXM-0000000CM3Q-3Ed0
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 05:54:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNuaic006608;
	Tue, 17 Dec 2024 05:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NIxDNc4Wrn88RCBafG/4q2
	FFhZHyLbdO/ik3ovJBTho=; b=ln2cqmwtO9FVnZSRW6cuccZ1/eHWePjvL9UjYI
	Udp4gh/zq8g5H+rNHD9f763C48hiyyO9ekUybtseSfS+OZqgQUrtSfNiMkcIsr+T
	RJSS3SzQe8mOgN0KGzOj1zf7twxdxgmeWE2cy93qeVG6HTh+NCXS08vXqxgL9FzV
	o1fUap3gSkZbYYJvdnkM5TwXRqGW0xE0z5iPODXji2KpK6zkAamA3l8sAYvyWQNr
	v3XVdu9VxJT3cAITAt09v9XHcZTyGFrzEu51xq19cQB33S+7OvIBtuLFKmWmU35C
	54lLI9LoWSKDAOoRC3tXSC9XZVZeAtRNPR+FXk8FeMB4u/ZQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jx9ygpa8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 05:54:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH5sPhV005322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 05:54:25 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 21:54:23 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v4 0/2] wifi: ath12k: Support AST and Puncture Stats
Date: Tue, 17 Dec 2024 11:24:06 +0530
Message-ID: <20241217055408.1293764-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fh88B6Gl5St1d2W3NPYph8ARujRfcSUO
X-Proofpoint-ORIG-GUID: fh88B6Gl5St1d2W3NPYph8ARujRfcSUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=665
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_215428_930369_583A260B 
X-CRM114-Status: UNSURE (   6.23  )
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

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 194 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  56 +++++
 drivers/net/wireless/ath/ath12k/dp.h          |  12 ++
 3 files changed, 262 insertions(+)


base-commit: 9a448415ed0c46edeb9170091a03b620986ca0b2
prerequisite-patch-id: c30df5e4af6f5773ed942d8f78de88c05ce2b18b
prerequisite-patch-id: f2181eee4bce2e3487db9bd81ed962f477759e7e
-- 
2.25.1


