Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A71FC3DA4B
	for <ath12k@archiver.kernel.org>; Tue, 16 Jul 2024 02:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HlrV/8Y+FygII4Yt4prBFDMaBpV8EmhROCNCe5CMc+Y=; b=Azj9LQjSbmTTVF8omfQ3IWRcB8
	y2TUEoWhGaJ7o74K8q/gpLEb1SyYYXk/e4HR7+IBJYTjUNr/yupGSdNWRq7nNcY7+NxaatExGuQ36
	QNR5VhVougGAF12CftQA4M7L4oJ3Mp+jdgIY2JuMZXbM6QH4qXImfa0XJdh47K6OxihUY/s2i2Z8S
	XsqSj2cPfleYP4zxoE0KUO09GI86lUmMu9qge3ckcDh3cEFQanDfUw4ppz+mlK+e5VenxrlqUjTaS
	V3QBTTZFyQlnLpL+LH17hQZ9wyAB0+FaMEBQt7n5vOg2nuux1yiv9eXX3H+fHe1RvynDCWyhg7jY6
	lh/pMY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTYCX-00000009609-0Q7J
	for ath12k@archiver.kernel.org;
	Tue, 16 Jul 2024 02:46:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTYCT-000000095yq-49wc
	for ath12k@lists.infradead.org;
	Tue, 16 Jul 2024 02:45:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FH97Bq015665;
	Tue, 16 Jul 2024 02:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HlrV/8Y+FygII4Yt4prBFD
	MaBpV8EmhROCNCe5CMc+Y=; b=fQ4+b6DBC4wYog55MTnCjzMYqOTc7h85fm3U0O
	pGB5YAiYAMRsViDnGFGA07K+5Nojyj3Vckm/vyuJ8f1w/l8M8C6dHRXX80MDFfwO
	XPCW14Lfcel2VTs5ighBn8DsA2wmcJHS4DzIreKesNq8shIiLG42NpDmdz2UlDy6
	eio3HxeiUA1ts5zexdG2b/pUmFuwmHkY6kQC8j0+LlBPLUXKbD9QZZyr+YleDZmu
	sCmOFAZ+OZim566wuHHX7yS71m+EMPDy9IshNNTsC1tG8zSRgy9Rs1vtUa3spPRu
	2qT1+NoLHp4i1NhufkImOYwlSt3T2orcltUCeERn5nr8kmlw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bhnunux7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 02:45:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46G2jscj027593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 02:45:54 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Jul 2024 19:45:52 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: Support dump PDEV transmit and receive rate HTT stats
Date: Tue, 16 Jul 2024 10:45:39 +0800
Message-ID: <20240716024542.30339-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G9swQc6K0iJB_NKP1QFmGRGTRoY3fkDt
X-Proofpoint-GUID: G9swQc6K0iJB_NKP1QFmGRGTRoY3fkDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=595
 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_194558_170563_4961584C 
X-CRM114-Status: UNSURE (   6.15  )
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


