Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0069C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 05:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQ4V0VCj7hMWrM3BocVp6fIFc3eDUH6lzkPJd4TQxUE=; b=P2R21VqnkHhrLkcoRQXKmD4x0X
	JZYJ7dc9dWAYF1Qrnplbnse4IIDaivObZuwMG2DD5TsRZZeUimN/l//GjOWuTQAl1JeGTTLRJMcVH
	9OK6Gsz5QjTJ6feKt2Y2cHCVRGTGmEz3AFrmblskE+SvYyrd0AyUbpnEu/TUN0c21h6dte8zEAMnb
	KnpPSXAJ0sD4BqThMPJB2djyMNETlrJ+HN9/mY35XYeTfvFMggSdDCfLwz/4NHB8gf/om/wfPJJ+8
	pcKFSDiKEq+ferAW3Mq4f4GYl68hVL5Wqk0KGJ8NbfOU37mnu2TonxVtunG3oZV0ml7IEiYxxEpmw
	XJmEkNMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBao-0000000HI4h-330K
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 05:35:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBam-0000000HI45-39x5
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 05:35:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514586o2008404;
	Tue, 4 Feb 2025 05:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bQ4V0VCj7hMWrM3BocVp6f
	IFc3eDUH6lzkPJd4TQxUE=; b=ZFpPJPtnmS2TuNsa5myOZ1RW728LXbjkGbiQbA
	5xknSSN/Zy6ZEzlOBX4BsLefrCqQeVPhrRcH3BQBlE1FtrDZmNYkRL72opmgmzE+
	efwTBDItOnkj+tL+5vAN8pkGQryRTDXyZN/CbO9Jix5vbwfAE8hh4TQUue9626Kg
	m/fguZpp9CDgVUlO6mM9CEgoOB6sEb/lTYxDfV6xWQWHcmzOeT7Ccz+9rKjhkd8o
	bc/b0X6mGRwHVODYj+TWzF8WcM1WqUc3Q4gPcT2KZMCMna7tBH5nPweNSe+we+Qf
	JCKsaeVmQqy8DsnAc+oBQqe+JkIiLGw9fcKtgJLB7rYTeD7A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcfp01rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 05:35:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5145ZMHf026788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 05:35:22 GMT
Received: from hu-surapk-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Feb 2025 21:35:20 -0800
From: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Suraj P Kizhakkethil
	<quic_surapk@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Pass correct channel frequency parameters
Date: Tue, 4 Feb 2025 11:04:49 +0530
Message-ID: <20250204053451.2703834-1-quic_surapk@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z8PBsYUOx8heEifo2CmIPsE_XXQ5tgNR
X-Proofpoint-ORIG-GUID: Z8PBsYUOx8heEifo2CmIPsE_XXQ5tgNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 mlxlogscore=861 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_213524_907031_251B79B1 
X-CRM114-Status: UNSURE (   6.48  )
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

For higher bandwidths, the channel frequency parameters passed to 
the firmware are incorrect. Pass correct values of channel 
frequency parameters.

Sriram R (1):
  wifi: ath12k: Pass correct values of center freq1 and center freq2 for
    320 MHz

Suraj P Kizhakkethil (1):
  wifi: ath12k: Pass correct values of center freq1 and center freq2 for
    160 MHz

 drivers/net/wireless/ath/ath12k/wmi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)


base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9
-- 
2.34.1


