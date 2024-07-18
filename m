Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1380BC3DA49
	for <ath12k@archiver.kernel.org>; Thu, 18 Jul 2024 06:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hWf1U7WxD5RKM7M0fAzr2yCmdj2ZDXLgAGSgeg86RhE=; b=EPUZJ310hYs6PLuLHEo8RLwuP9
	W8XVzS454wzby0N6fPMmi4t/ousMFBn2zjYuI0r6p8FSRQ22S4zeBptQThdLM9T1XOrlBUxRYmQQD
	2Vw9XpY6K7L9TPF7jt0akMBDpptI54c6VZWKZ1+Ah2TJMRlKZeTcj+81JPlWpJ1iBB/2eBPl6ZY15
	M3sazJD4WRyXfwgWZ6dOpMT0EP0cyu3fm6mJFHpMT9Bl0Ze+F96vNsV3ZQHVADg+HNZv6Qvt6WjqC
	UhWT8h5uqTf+xmcqCT59D2jxuaMI47YpRI/GAmAqhVI4scWEkzX88JG/mlgwJQO6zHZaXe/47J6zW
	oQ9sUnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUKvC-0000000G1ja-2x8a
	for ath12k@archiver.kernel.org;
	Thu, 18 Jul 2024 06:47:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUKv9-0000000G1iC-3Hae
	for ath12k@lists.infradead.org;
	Thu, 18 Jul 2024 06:47:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I2fF5Y023029;
	Thu, 18 Jul 2024 06:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hWf1U7WxD5RKM7M0fAzr2y
	Cmdj2ZDXLgAGSgeg86RhE=; b=gN0FJ094OhjJwXoagmBOBD3Da4ytxsoscKOUEP
	1GfxiSCrPBCw7n8p3WdBJ4hIGRN5BR7tq1SBxrMjrET6GKgSyqwawaeJ0pkZN7Dj
	3x4q2uUxDM/wSHisqtQ2Esh8IKw8/XHTCNMlhYSMc7lrn9R92JodzT+iFd0w2j6c
	lXbAcAoUc33P+8vD6i4um0soyjvvaNnSqZIu5Gs14e17o7P00AC4Cx3iT30rWRqk
	7Qqo13GQhvTUJaGqwabUrRyE/ITvzS6Q7y+i+Ggz4u5qIrbnneFVIcSuw4ZjgLtp
	dozhw4H/jm2bG0XJXR5/Dh1V/K7OC6unxdtNTZgZ3iAyfoJw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfnmnpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:47:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I6lGmU006353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:47:16 GMT
Received: from lingbok-Birman-PHX.lan (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 23:47:15 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v2 0/3] wifi: ath12k: Support dump PDEV transmit and receive rate HTT stats
Date: Thu, 18 Jul 2024 14:46:56 +0800
Message-ID: <20240718064659.109893-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dwR7_pj8DAy6zLZksY_wqMOxdnOzbYrY
X-Proofpoint-ORIG-GUID: dwR7_pj8DAy6zLZksY_wqMOxdnOzbYrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=598 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407180045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_234720_064450_C595645A 
X-CRM114-Status: UNSURE (   5.78  )
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

Support to dump PDEV transmit rate stats through HTT debugfs stats type 9.
Support to dump PDEV receive rate stats through HTT debugfs stats type 10.
Support to dump additional PDEV receive rate stats through HTT debugfs stats type 30.

v2:
1.use TAB to be consistent with existing code

Lingbo Kong (3):
  wifi: ath12k: Dump PDEV transmit rate HTT stats
  wifi: ath12k: Dump PDEV receive rate HTT stats
  wifi: ath12k: Dump additional PDEV receive rate HTT stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 500 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 182 +++++++
 2 files changed, 682 insertions(+)


base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45
-- 
2.34.1


