Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643D7E7719E
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 07:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5oNnFvbYDC964ruS7cbZcrwpa9Cv6vpGbOuCaUK1RHI=; b=mGH2rOmb0J3Iz7Kp5bS2i+M0mG
	7HIwo7Y+ceQhRd6i4Jtd2c1TSlZLr1EpdiI3SDqljxUil4TajqeCxXgQ4rGCUcL6AT6w54u6aYttP
	hjeFFDd1JP+paSmYrn97/JrbYlD5Q87DNKrBKY9yEO4Gsfbq9+FbJF9Hd7BNpRTpfMwxdJpb5Q7ad
	6Xt9tRCyPiZmSes5j7S6mHDqKykd3LsHMzqq3r3ZaIzbzVUucl4EanEEM/IuvZT96b9KiA5HF4a+7
	YoSDTM+RQQrsWUJ9Ee2tIWm9dw3Yb23e1gZLWsqutnXVs5R9M8/X68gJJAKhGph3jCXAf2PzrDjX6
	OWwfRsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEcK-00000004CtX-0lKU
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 07:12:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEcH-00000004Css-1497
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 07:12:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CMj5v8023300;
	Mon, 13 Jan 2025 07:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5oNnFvbYDC964ruS7cbZcr
	wpa9Cv6vpGbOuCaUK1RHI=; b=Imq6CI71QSE/MkEs76GlAgapbrvO1RNBcZbDIL
	vQRe5KrriahkbpJt0KtBNEODbSIPmS+qrQcJfbciY0fxWSkhVMs5R/AoCYp/ZttW
	wj/z3eToG8g0917bkbViyH9b79pOKc0zhqxSNKrJ5lC7og8Tu3ed6mZBlTqoMPU+
	iH3pmHKCPHjDsLpOAm7Evq0XNXp+8m7+TSszS5VoXJVL+hsNyDIWutXNBui0Hhsr
	R1/fRHfHzFpP9ZDDa57cnutNa0MaQBgNBQakbk7gx0gokYe4Jg8LZ2WyBZ+cZnEy
	oLoIRB7vTXzrJBUuROkzp0fqnwuC0gFXAx2hz95gn/IER+uQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444f5bhdjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:12:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D7C46N006260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:12:04 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 23:12:02 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v3 0/6] wifi: ath12k: Support Sounding, Latency, Trigger, FSE stats
Date: Mon, 13 Jan 2025 12:41:38 +0530
Message-ID: <20250113071144.3397293-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VME797TL6Cck81yE-bHg3MnCW4UEuaye
X-Proofpoint-ORIG-GUID: VME797TL6Cck81yE-bHg3MnCW4UEuaye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=837 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_231205_295119_4948CD54 
X-CRM114-Status: UNSURE (   6.40  )
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

Add support to request HTT stats type 22, 25, 26, 27 and 28 from
firmware. These stats give sounding stats, latency stats, trigger stats
for uplink OFDMA and MUMIMO and FSE stats, respectively.

v3:
 - Rebased on ToT.
 - Removed patch dependencies.
v2:
 - Added line breaks where necessary, as pointed out by Kalle.
 - Modified the use of pointer arithmetic print_array_to_buf_s8().
 - Modified commit logs, as suggested by Kalle. 


Dinesh Karthikeyan (5):
  wifi: ath12k: Support Sounding Stats
  wifi: ath12k: Support Latency Stats
  wifi: ath12k: Support Uplink OFDMA Trigger Stats
  wifi: ath12k: Support Uplink MUMIMO Trigger Stats
  wifi: ath12k: Support Received FSE Stats

Roopni Devanathan (1):
  wifi: ath12k: Add API to print s8 arrays in HTT stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 736 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 269 ++++++-
 2 files changed, 970 insertions(+), 35 deletions(-)


base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256
-- 
2.25.1


