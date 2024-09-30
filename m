Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A099CE835D
	for <ath12k@archiver.kernel.org>; Mon, 30 Sep 2024 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UQkpw8wl8PMhl5l0x8gdmytVTNmheeG3TMV0WW4kSSU=; b=qC/A7TnDDpeZBxGqZNk1Sp8u/M
	p66iC5D3v9C+9i4rILrvzwom+QuI9jni8lXglMcjyYQ1f9BoTGSZ1mnPIvZz/UmrcukUf5hN8dtPd
	rjcxuiw4WpXE0PLaTi3eDZyn8ktxAKi6ISwJ+SZWF/nVAIUxxt2ZM6Z54qs+ZV7yOK3vyw59tffKF
	5wx5jn6rKFKEedBE/5nWh6nPuhMgIN9ZBPNz2lOg6KoyWH2x2b9F5JRtiYWtplicMAX5zY1WH8Mre
	8vHLOYgSyVKr+Jd53Y+UgiPs0CEatJ2DMbBCKN5UMEiLOIqeRZz7HU0gfQp+HkODFLlFk+8ksAGBy
	+gd4XccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svK2p-00000000Mr6-0jnY
	for ath12k@archiver.kernel.org;
	Mon, 30 Sep 2024 17:18:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svK1W-00000000MfC-1GhD
	for ath12k@lists.infradead.org;
	Mon, 30 Sep 2024 17:17:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UBLli3005873;
	Mon, 30 Sep 2024 17:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UQkpw8wl8PMhl5l0x8gdmy
	tVTNmheeG3TMV0WW4kSSU=; b=QKju5DgvIWjALYGB9Svkqwo4cXX9e+7tx7EBxN
	mlU4otuK6UW6wl9lfchpPdsd18HmSSGDwNSFbbxEA7lD/1zROGwhjpU9BFXIjHfj
	SeTsEiFIU42fRYazvPn9atGvNLt0RQOSRrPHvUt9awsqf/UosifrFH/7+sdiLZwQ
	yfnqReN+StHdKRWt6G8/MBOyKLW5d+rrWDSBxYbT8LJZl4QH/ZmASJ3KtxjMFWlu
	YKvabdsPwHsYw7EIvkuRtDXNP4aH8YC+/7S5Nz1vtgcLzKdt5Cie+JFVN218ouRm
	UAlq8QAZgffGdP6JeOLNdC+ZZz2PvnD5ihM7pOu2tKRsam5w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x94hdh3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 17:17:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UHHMd2015810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 17:17:22 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Sep 2024 10:17:20 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Support pdev Rate, Scheduled Algorithm Stats
Date: Mon, 30 Sep 2024 22:47:03 +0530
Message-ID: <20240930171705.596703-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 52cmEs87gT4FetidLk-uYNjD22lMmGtH
X-Proofpoint-ORIG-GUID: 52cmEs87gT4FetidLk-uYNjD22lMmGtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=615 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_101726_484390_B3BD5525 
X-CRM114-Status: UNSURE (   5.64  )
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

Add support to request HTT stats type 49 and 51 from firmware. These
stats give scheduled algorithm stats and BE OFDMA rate of pdev, respectively.

Depends-on:
[PATCH] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
Link: https://lore.kernel.org/linux-wireless/20240730035154.3723773-1-quic_rdevanat@quicinc.com/

[PATCH 0/4] wifi: ath12k: Support Ring, SFM, Transmit MU, SelfGen stats, CCA stats
Link: https://lore.kernel.org/linux-wireless/20240913082949.573482-4-quic_rdevanat@quicinc.com/T/

[PATCH] wifi: ath12k: Support Pdev OBSS Stats
Link: https://lore.kernel.org/linux-wireless/20240919101812.941145-1-quic_rdevanat@quicinc.com/

[PATCH] wifi: ath12k: Support DMAC Reset Stats
Link: https://lore.kernel.org/linux-wireless/20240926051110.2477814-1-quic_rdevanat@quicinc.com/

Pradeep Kumar Chitrapu (1):
  wifi: ath12k: Support BE OFDMA Pdev Rate Stats

Sidhanta Sahu (1):
  wifi: ath12k: Support Pdev Scheduled Algorithm Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 161 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  59 +++++++
 2 files changed, 220 insertions(+)


base-commit: ced1f8bd64cda4e0c1df0890d1041cc6b18d5c77
prerequisite-patch-id: 970109034faa25a7630720c0da29c875e821f9ec
prerequisite-patch-id: 0bda913781a634c055869a033aa9b34d10825a20
prerequisite-patch-id: 4d37990775694f110ce3e87096231fe8855f09f5
prerequisite-patch-id: 121409543edef60c5f6144dd7ae3a615a78520f7
prerequisite-patch-id: ecac67f6fce1dd4d5089dbc3da840e311f6a7218
prerequisite-patch-id: 0537ae604d2617e42bef13bfb791aad4d11bf6e1
prerequisite-patch-id: da5a4e5cc3097994bfcba4b37680c90b0675ccf9
-- 
2.25.1


