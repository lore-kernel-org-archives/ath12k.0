Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F1EC0219E
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mq+2VhVyKi66Q+OnyxY5pLU22J5Xa5Ohmhz5gu/r5Ds=; b=sTrNwQr1b18G8cEtlqclmynmlX
	GlECt/9H2QTAaO/ebo86it/gQ+atFtkRg5fxaEIrf0ij/Mo54J4trjJ5M6rNbw6SKjzki01gQ4f+0
	LcOwTM0qSRvO76j76nqQwRsvn95MizB1U0TpGWI883JMDuOkzGuUPc+9FYjJC4GYJRVoEFXoy0uWF
	3dN0J1kb0UFsNoZfSGs6z7KW1mlEynseNq+42dqAuzIgdJUBTxnMc8ozhAZO02fcBb2KsvQc6n9HA
	Bk9eVEn8eLaiYgBV0qiBdSV1qHGDqsKfe2Vf5lo1oVNMfcu7aO74ImMsBDR8Fz7hLu5Dc8VRQdMkF
	A+/tavCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSOw-0000000AXVx-1zEQ
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 17:44:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSBq-0000000AUwz-2zxy
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 17:30:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517CYYLn007491;
	Fri, 7 Feb 2025 17:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mq+2VhVyKi66Q+OnyxY5pLU2
	2J5Xa5Ohmhz5gu/r5Ds=; b=KEJWDFdtjQA1R8lLZw96c3UgKDavrirOGsnmR3LV
	D33gSsrukD7DmTjx0Wclu7qd4+wsOZvV/hx6yOi/DsC8tBOIDFSD2PALvSHFWVP8
	hu0PX8UFQAvuVJfpZRY+TMZloUcXZ4IMcvZyFWmKLLF8M2Lfpo7oORdDgP5RP5jb
	XXR7QeKnA34X6IaRkHnkGVCZCUD44z48EEj9rj54VG+W6xAhXjvgr/7kp687uMsj
	YBWQLTUesUoDbfWKLOSvIom5yf7cEXf86c+S3wpygT9rq0I9vBo+FiIhbwox9o1d
	4znL5UcF1B6eGsgZ7ASqXJhvjtbLIcG6vgYc5zbOV9/m2Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nja3rqdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 17:30:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517HUrQW013574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 17:30:53 GMT
Received: from hu-nithp-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 09:30:52 -0800
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Nithyanantham Paramasivam
	<quic_nithp@quicinc.com>
Subject: [PATCH v2 3/3] wifi: ath12k: Enable REO queue lookup table feature on QCN9274
Date: Fri, 7 Feb 2025 23:00:23 +0530
Message-ID: <20250207173023.3856217-4-quic_nithp@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250207173023.3856217-1-quic_nithp@quicinc.com>
References: <20250207173023.3856217-1-quic_nithp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KKHMrT8xs107-rONEVWu0GoM3KGyILiS
X-Proofpoint-ORIG-GUID: KKHMrT8xs107-rONEVWu0GoM3KGyILiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=942 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_093054_763156_EDC2837C 
X-CRM114-Status: GOOD (  12.40  )
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

Enable the REO queue lookup table feature for QCN9274 by setting the
reoq_lut_support flag.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 51c2033cec46..2433ade22e2f 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1057,7 +1057,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.download_calib = true,
 		.supports_suspend = false,
 		.tcl_ring_retry = true,
-		.reoq_lut_support = false,
+		.reoq_lut_support = true,
 		.supports_shadow_regs = false,
 
 		.num_tcl_banks = 48,
-- 
2.17.1


