Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D290E7719F
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 07:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AF73mtu5ZyVzqLk8Wa1hbL3EOf94Nk1s1HJHQn8rKyQ=; b=PHEPZjWAmjiAAT8zsv7xGhQbsd
	iyEwteR2S98i2U5KzTeq7O6hehElLaupiZW1i0v++hwG15IOYUW4YjcnvGlSf0Za/79YEimOpwMaQ
	EBVX7EFnZK3y5NqoyA02a54HXRvybHAX+MRxtww/jUPjJVbwX0qA12ZoYf/Lgfi9Tmx26WlisjDx+
	N+V3L/Z2vf67K/nPc8uGTid3MicoP5ILBXr+DVFA1P5JzcI3lbPKjXgARcjeCrJIB8rUYl3JebAX9
	5sjAsqaNgXKuacjcWrlUNA3eaKSDvbDMtV2RoKR4XW32pBKRH/h5hlJXhGe0h3NXNPE12wuec8flL
	HEgL40Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEiI-00000004E2W-0uAO
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 07:18:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEiF-00000004E1W-3dBB
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 07:18:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3rZbn023616;
	Mon, 13 Jan 2025 07:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AF73mtu5ZyVzqLk8Wa1hbL
	3EOf94Nk1s1HJHQn8rKyQ=; b=gARnDFqZ2WfxhmOzOfsxZdiBxb60PdcvbfaUn7
	EUY7AO3lAW1HGT4d40WW5ACzb68SL4F2YHwHOSWcY6qT3hpdepSVi5x0KzfFt14Q
	GlMnRVkIE88ulVcjzJg5ZukxsVAoEutQJLocUcZDAUkbKnFEyk2bdSTVp9WYgjB0
	fMxnlPQbQezAub2qZpkJ8TRyhfi99IosaJVldGPkhjfal0SzSSMuJTbFwFoQbmyD
	arrXwBUCwq9rmCBQ6wa31B/DnOMNoV0RSImQFnESGSWngl/XM0y4Uvv3OC4zq5G8
	GaiiOQW2N8gj4WUQw5jr4goOrH5BBjae5BQjmHF8T0R4T+yw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444uaxgcgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:18:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D7ID8p032414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:18:13 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 23:18:11 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v4 0/3] wifi: ath12k: Support dump PDEV transmit and receive rate HTT stats
Date: Mon, 13 Jan 2025 15:17:55 +0800
Message-ID: <20250113071758.19589-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7QRTNr0EuHi7IqExRJOJVrpA4NLU4sQL
X-Proofpoint-GUID: 7QRTNr0EuHi7IqExRJOJVrpA4NLU4sQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=582
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_231816_025227_BCCC8427 
X-CRM114-Status: UNSURE (   6.54  )
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

v4:
1.used tab(s) to align the = to match the existing code

v3:
1.Rebase again to 48322e474f04

v2:
1.use TAB to be consistent with existing code

Lingbo Kong (3):
  wifi: ath12k: Dump PDEV transmit rate HTT stats
  wifi: ath12k: Dump PDEV receive rate HTT stats
  wifi: ath12k: Dump additional PDEV receive rate HTT stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 500 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 182 +++++++
 2 files changed, 682 insertions(+)


base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256
-- 
2.34.1


