Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13907E77184
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A1OuzeUHgw7uQYxOY3V3alx3IBiDlkl4xbKGT5nGnvs=; b=PxUuqevNjjl6iY9c34xrWRhv+I
	bTXl292Bb0Ii/Qx7jNA62qkkor3NKYBPfobhKYrEZrtUCm7Wr9uUQEoMkYQkTii8NpA0VENc8xRh5
	QyKTYPwtYJsvK5PlfwLc+8/bDWgPDIGeHu3otcQmX0rPcPz3tFsAbPfV3PKDJU8PwWfpYGpCmnTj9
	mLs9gu9crY78fTQt+nlubuucDv+OLHV37V6q4cmgpbw7Z3vHsHD6iLdpIXSrs5x4BtQLkYm+JEts4
	agQPqpfjA/acGckMwKLJFtLev/k3liBImWgYc9NsN7+9tYlvbyOpsmyQx1XFdrg7swySeu65lutVg
	XGPvyWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUVz-0000000D43t-3Oin
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 10:09:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUFs-0000000D0DC-3ivb
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 09:52:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH623O3005884;
	Tue, 17 Dec 2024 09:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A1OuzeUHgw7uQYxOY3V3al
	x3IBiDlkl4xbKGT5nGnvs=; b=fOAPX8/ztVJCjZm3VwZH9BaxNJtM7dBluEMGzB
	3YhBF+cCUUs8wWTAjjdVWnkfNx+2YriKw+bR3IgMq0768aNoVxU8EtVUkOCX/NtG
	mo1NXx0ecUEuTJ0vMD0ODaoWOqcEoHsKqKis3+0/VKD/VDsJ405Iav+VQb436uum
	vG+yyiKKssTbSGraVy3Klpjs0yM099VctMpketwXEpwCX+GpZjJ0Zh8LFmvjOEEn
	w+BYzx8G95muM3LBHi/uanpc1JiXrnoUPPnRs5KD+aJ2u9pjYylUrAvatIINvCMz
	75JX+d7yW/O/rSL9YB5I9AHaQmwpSm/QlEqyU7GzMo4NxJoQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3p48m4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:52:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9qcL0022187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:52:38 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:52:36 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH 0/6] wifi: ath12k: Support Sounding, Latency, Trigger, FSE stats
Date: Tue, 17 Dec 2024 15:22:10 +0530
Message-ID: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Luq5STtVjVzvWNx23zBidsMhnduim1mL
X-Proofpoint-GUID: Luq5STtVjVzvWNx23zBidsMhnduim1mL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=786 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_015241_049773_00E0A28E 
X-CRM114-Status: UNSURE (   6.35  )
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

Depends-on:
[PATCH 0/2] wifi: ath12k: Support Rate and OFDMA Stats
Link: https://lore.kernel.org/all/20241128110949.3672364-1-quic_rdevanat@quicinc.com/

[PATCH v4 0/2] wifi: ath12k: Support AST and Puncture Stats
Link: https://lore.kernel.org/all/20241217055408.1293764-1-quic_rdevanat@quicinc.com/

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


base-commit: 9a448415ed0c46edeb9170091a03b620986ca0b2
prerequisite-patch-id: c30df5e4af6f5773ed942d8f78de88c05ce2b18b
prerequisite-patch-id: f2181eee4bce2e3487db9bd81ed962f477759e7e
prerequisite-patch-id: 41559c25fc0c9344e0a5f2495148cc81663db90c
prerequisite-patch-id: 5da7298eb2c4a6794914dcc09ec3044e49283a29
-- 
2.25.1


