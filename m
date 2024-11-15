Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB8CD6DDD7
	for <ath12k@archiver.kernel.org>; Fri, 15 Nov 2024 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SKJoxIxucaaQHQua0dYeGhH5ESi0MFNYje7jvzXg6J4=; b=IFtz/L6a5LN/cGZu5KTLmlNzAu
	8o78mBNFCFSHyxKvmyMGYj2oRRqCPHnAdvv5J4BqHB7Xx8ShgZkd07sk3Ju7Z/BfPE0cTBfvAf0jP
	Jbe8W3wgYOW1ncNXdRQA/D25AMzdAz9V1ZxohY9606bcHulojW/+E8cD0u2ButP9Q1li2ISMnASvc
	mPnoMvngILrIozVJwpDD/IeHa+pegQns5CTqnF3oPxd2qWf13G6G88L/6tn1E+NuMfIr85OHlXa4C
	w006Vs4d21bgkEIGqY1bLb/aY3zk4Or2tTQWonAShnLGp6qnl67TcjoBOJuw638tTkk8hqZaxyGtr
	tuFrUGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBppW-00000001n43-0NEN
	for ath12k@archiver.kernel.org;
	Fri, 15 Nov 2024 06:29:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBppT-00000001n2e-0AV3
	for ath12k@lists.infradead.org;
	Fri, 15 Nov 2024 06:29:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHI0LF023810;
	Fri, 15 Nov 2024 06:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SKJoxIxucaaQHQua0dYeGh
	H5ESi0MFNYje7jvzXg6J4=; b=k+Q+K6D36hWYYL8PFGg8vojUEc+tS3IzOchuUf
	IbB7k/QWPo9zBMDeqmUodRxsLINLLJNzQy/3yf1mVpaREo+SK7g6sHpZY/wtS+ye
	kEd+xETbliTICgQXAKweLN1CLk6jAOVUTrdVC1cYBGF6OHuK45Unlu+1gSugQJ46
	jz2VXmXeuO00kBt8R9SQggz0K9s3chgo2z36wzOmrKed0RX+Ann0miUeHaCHDcju
	7KvvfgKzfj9zWVuC9ieK+AbQVXc29b3CpUK5f/fA9CtPTcyeWhR+iQt+lbTtE2Bp
	iY/TtD7weBVFxOl2AwVY6apGvV6mI1s+7uPGH7tK+3WSVavg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w66gwat6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 06:29:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF6TC07015823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 06:29:12 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 14 Nov 2024 22:29:10 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v6 0/4] wifi: ath12k: Support Pager, Counter, SoC, Transmit Rate Stats
Date: Fri, 15 Nov 2024 11:58:50 +0530
Message-ID: <20241115062854.1919672-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FYBUEu4F0tjCHEPVDwunZDWkafP54n7k
X-Proofpoint-ORIG-GUID: FYBUEu4F0tjCHEPVDwunZDWkafP54n7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_222915_282091_E39C3874 
X-CRM114-Status: UNSURE (   6.86  )
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

Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
These stat types give downlink pager stats, counter and TPC stats, SoC
common stats and Transmit PER rate stats, respectively.

v6:
 - Removed unused variables.
 - Used le32_get_bits() instead of u32_get_bits().
v5:
 - Addressed Kalle's comments pertaining to variable declaration order.
v4:
 - Addressed Jeff's comments pertaining to data type conversions.
v3:
 - Added macros to fix compilation issues.
v2:
 - Removed dependencies. No change in code.

Dinesh Karthikeyan (4):
  wifi: ath12k: Support Downlink Pager Stats
  wifi: ath12k: Support phy counter and TPC stats
  wifi: ath12k: Support SoC Common Stats
  wifi: ath12k: Support Transmit PER Rate Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 627 +++++++++++++++++-
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 204 +++++-
 2 files changed, 827 insertions(+), 4 deletions(-)


base-commit: 0ea161de5e5afa1323e982adc8f59bf4af99a84b
-- 
2.25.1


