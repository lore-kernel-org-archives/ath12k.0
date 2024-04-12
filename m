Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E0FC4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7+lJDeTDhzV1P3jkpR9O9a061M/d5sCBruKa5KRzX8=; b=C28puI7ykEWQgXh5w3ILA3nVAP
	6tTPtQN8P1L48X8Tz72BxquTIp+L5x2n0ntm8ppVObtrBHehYEtFsMKBMaMhvMdvnyUW/lGyLzsrp
	jtzeACZXxRmGo7sMMKIFrS0Ur0G/m/sTAXOl2ezwyDS8fd9OBbRM4OhTdnZqYjdL71Rt7C7w9H+z1
	k4Kz7rFp0orkENZoJgGSZU1SsLF4G4MwjmcvvPKnlM0hQAWJXlErjYXLW8ASmNn0jB5N/Q2J2TllP
	S2naWjznIgGtF0xGTs3+xCAb1SocUTwXMBWBQ777QH9mD0dh58oEr1v1k92Gdune96m9SSazsruel
	XzqmhwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3t-0000000FVBH-2dA2
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 06:06:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3n-0000000FV76-2NPr
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 06:06:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C4E209021323;
	Fri, 12 Apr 2024 06:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Q7+lJDeTDhzV1P3jkpR9O9a061M/d5sCBruKa5KRzX8=; b=Kh
	HpxbddNy35iGmLFJWl/4rcyuYSnoVTxyknsQRUXM9JzeevVUkrs3/QzgUo20i5CP
	dCU9qrVRYlk0nXXbs5eci6j4L04VNkFOciFSYU3uA+awMnu3je6114HwDE/rOdc5
	gsh0MlM7zjyC/ixULDjn8K9OlO6euJUx+FDxTBNXOCtwxNtOonBB8H6wET75G//z
	eiv95E+goEKBZfxzTiyf3s8FM502KCkW6kiPNAFbeVzIUinOGkSiiecMq5WDJ2E/
	j+D/o2kORwsdxmwijTRUeAc5FjZIQmgdcKqiZr6P5pqRwtKDEIDWEutjyZltvjOa
	P/dBylVtHar3Jng1tUww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xewr38788-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C66ohf007216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:50 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 23:06:49 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 10/10] wifi: ath12k: change supports_suspend to true for WCN7850
Date: Fri, 12 Apr 2024 14:06:20 +0800
Message-ID: <20240412060620.27519-11-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412060620.27519-1-quic_bqiang@quicinc.com>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WLFMKQ5afMciG6IdHHX7CFCsPj6tNCk4
X-Proofpoint-GUID: WLFMKQ5afMciG6IdHHX7CFCsPj6tNCk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 adultscore=0 mlxlogscore=931 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_230651_648399_144FAB9E 
X-CRM114-Status: GOOD (  12.13  )
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

Now that all things are ready, enable supports_suspend to
make suspend/resume work for WCN7850. Don't touch other
chips because they don't support suspend.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 0b17dfd47856..613c2a9c0056 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -964,7 +964,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.idle_ps = true,
 		.download_calib = false,
-		.supports_suspend = false,
+		.supports_suspend = true,
 		.tcl_ring_retry = false,
 		.reoq_lut_support = false,
 		.supports_shadow_regs = true,
-- 
2.25.1


