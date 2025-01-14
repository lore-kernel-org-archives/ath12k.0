Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F115E77188
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dFXykKR2iCChhSox2k80yNg20P864q10As0u6DjZjdM=; b=gfZj7YYklWEkJEWRb4G9vr6ri4
	A+VtgExcr3OFPFzCfj1ymmGVg7CaVjCaql6+e9Cr4fhF4SpaMa2zyJVVUH0RfqW2DsBM/sUbgRsDw
	76dVEWq0fwTl8V3FGTOYxDVhocEH09FGnssTq8qjmHfFaIYohhBHC8s/0Wg7TVYuBfmXJr4izFxw8
	L1woQj+HOrLZP0oKBDmmn2gIC3Rysk2HtrrKW97qvaU2SIyXMDDRCSFZg/k73qqsRPr0F2zbCdn4z
	+aiD6oyLuOZtm/h5W+Fiq0mn/FHwEpmk6qQpev7RV1e2dIsYLEY8G/4hPFrRtHMr+MI7FnQj/YOqH
	DEx8F+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgCt-00000008QOZ-3vRZ
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 12:39:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgCI-00000008QIO-14KC
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 12:39:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E99Grh017465;
	Tue, 14 Jan 2025 12:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dFXykKR2iCChhSox2k80yN
	g20P864q10As0u6DjZjdM=; b=Nu97r6RucOt9Q7lJJO+Spw38tIVi2mBmC6MPyN
	GmlBRkUTmiDlWrXcTQhBv/reX/8B744GnJu/AExCD+f2syeubSaCHpWNvuOyAsnU
	WwgaHz672wScufZ4EHKbs0dqbkv5cP2wcAsGlySz8aXap4bRNqM6o+fpl6G1CLfD
	Tx8/tPgXB1aVE3MnJVwNZ3GvCLW0JfuAltysnE4AGKdtFQVoe2+oBrIPgKGqukkq
	Rmydm2hnnN5vnyD+LhqTROkr1W95V8S/caIJUQL3w71HnqSKfb5JT5Fw01BbgILn
	87jt7WGLqV1JGPLuvNJR+MuzWhcLRNW/tJsBaVZkCx/7f2Cw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445n1j0dtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 12:39:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50ECd3dE029440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 12:39:03 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 Jan 2025 04:39:01 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v4 0/5] wifi: ath12k: Support Sounding, Latency, Trigger, FSE stats
Date: Tue, 14 Jan 2025 18:08:30 +0530
Message-ID: <20250114123835.882926-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AzFF4Pk2tRtQtbRleVMhF4cOYfxyeg_H
X-Proofpoint-GUID: AzFF4Pk2tRtQtbRleVMhF4cOYfxyeg_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=857 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_043906_306588_C269CBB6 
X-CRM114-Status: UNSURE (   6.60  )
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

v4:
 - Squashed patches to avoid build warning.
v3:
 - Rebased on ToT.
 - Removed patch dependencies.
v2:
 - Added line breaks where necessary, as pointed out by Kalle.
 - Modified the use of pointer arithmetic print_array_to_buf_s8().
 - Modified commit logs, as suggested by Kalle. 

Dinesh Karthikeyan (4):
  wifi: ath12k: Support Sounding Stats
  wifi: ath12k: Support Latency Stats
  wifi: ath12k: Support Uplink OFDMA Trigger Stats
  wifi: ath12k: Support Received FSE Stats

Roopni Devanathan (1):
  wifi: ath12k: Support Uplink MUMIMO Trigger Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 736 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 269 ++++++-
 2 files changed, 970 insertions(+), 35 deletions(-)


base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256
-- 
2.25.1


