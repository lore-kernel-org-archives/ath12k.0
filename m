Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E204FFA372E
	for <ath12k@archiver.kernel.org>; Fri, 13 Sep 2024 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=enEnoqkwj/uhXq6KcUYRmvo3Ws4fgV1hwcxaFTYTl2g=; b=Mx1bucicBEsJCtw6GEDHeT9Kky
	VkgvjIiTlTWQLDGtp80dvMOCFOAxSEUZ3x0IrryuxYSymJID5pckkk699MUaBJ+6ebxMqhmYiA3Ev
	pBIbqhlZrgpuqlAVmvwQFojJW3kUbNamWTZBSaJoUvd1lFQDKwW8Puojo47qwSjknb4R1+SRjseIc
	jRvri3q2i5CKh2HFuH4vdOR5aA2WtIvMKlVXaRjA7KQoh1mVeMJXFFS104eeMPotpgFsrc3Slhjr3
	IbitJO0povvmrghkpltn8Rp93gsEZcx9nUORJBI2dZ/CrJWDFB4G9o/bGJfwrpBtGt3M+WOzfSk7r
	dxirXAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1h1-0000000FLAw-2FHQ
	for ath12k@archiver.kernel.org;
	Fri, 13 Sep 2024 08:30:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1gy-0000000FLAR-3iI2
	for ath12k@lists.infradead.org;
	Fri, 13 Sep 2024 08:30:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMBugr013065;
	Fri, 13 Sep 2024 08:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=enEnoqkwj/uhXq6KcUYRmv
	o3Ws4fgV1hwcxaFTYTl2g=; b=T/CEPvspYrP4lPnt+MmeJidgWt3juHTf1EWG7a
	d77l5yE7S5X51ge0QliqSIancXQBi9vXgNGTTFHZQtYyJjbRGWqVX3TzLSZ76Tnb
	UvjI+KRSbrwtmApjNCL2QSurk1zUm6C6cnaePf4zmBef61I3ssATFwmwdCn2cRJA
	BeboSfvV96v//UYKMvAJcB87CwntvsGL+JrtnHPm2Q+NpKOGSfftkK6oscj3/rHP
	EljX2dVDdta9FJ/JV3sWVaseXOSt4+fWV+RGfcrL97htUWuQYesVM8wi9w+iiDUT
	xmp39NQ5C8GA3SFIKJeEmTl7MDOdVhX0+FPZe+/cBqH6omyA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy51fxt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 08:30:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D8U9Vx004721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 08:30:09 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 01:30:07 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: Support Ring, SFM, Transmit MU, SelfGen stats, CCA stats
Date: Fri, 13 Sep 2024 13:59:45 +0530
Message-ID: <20240913082949.573482-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DmFJEIf0VAopO4fSBglLUdoEhsprIvDY
X-Proofpoint-GUID: DmFJEIf0VAopO4fSBglLUdoEhsprIvDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=504 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1011 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409130058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_013013_144174_274E069D 
X-CRM114-Status: UNSURE (   6.93  )
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

Add support to request HTT stats type 12, 15, 16, 17 and 19 from
firmware. These stats give self-generated transmit stats, ring stats,
SFM stats, transmit multi-user stats and CCA stats, respectively.

Depends-on:
[PATCH] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
Link: https://lore.kernel.org/linux-wireless/20240730035154.3723773-1-quic_rdevanat@quicinc.com/

Dinesh Karthikeyan (4):
  wifi: ath12k: Support Self-Generated Transmit stats
  wifi: ath12k: Support Ring and SFM stats
  wifi: ath12k: Support pdev Transmit Multi-user stats
  wifi: ath12k: Support pdev CCA Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 1042 +++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  346 +++++-
 2 files changed, 1382 insertions(+), 6 deletions(-)


base-commit: b1365224b7bd30454b0a0cfebc65ee7b41ed0a6c
prerequisite-patch-id: 970109034faa25a7630720c0da29c875e821f9ec
-- 
2.25.1


