Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF4CC35FF3
	for <ath12k@archiver.kernel.org>; Sat, 15 Mar 2025 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mq+2VhVyKi66Q+OnyxY5pLU22J5Xa5Ohmhz5gu/r5Ds=; b=1twEztwDFxmCEffJV4Pp9V2XQI
	1l+nZqwJsQ0EnlFOAOHZnqQZ1VJiRoKmHkPYHirykSO8VqXtRWt1MlxJkISWOhz4dFJKlHLXlH7oX
	0zc8j+EbP69f2nUxp3jwsVnHr53SYncLfWGMp1FX4keplZBMx9iGiyd/gvJ1Zv26BuhB0L/RRa0B1
	YdKEIOlJ/0Owzd/PCekynMGarUtQtEWlhBpQDbWmNQ9Z9nztVTt5eDPoYDCK2OQA9VYnDe5N+4N1V
	19mcwYWFhxcPldFOTr6S+fCOfxsVpGfyXGKxD+m/FJjbah6RqmPcaXqiog1Shektvd/kKN9ktKiug
	kgWOymnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttU69-0000000Ga2A-2PCE
	for ath12k@archiver.kernel.org;
	Sat, 15 Mar 2025 16:10:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttToN-0000000GYRL-1jmT
	for ath12k@lists.infradead.org;
	Sat, 15 Mar 2025 15:52:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FFhAcC032527;
	Sat, 15 Mar 2025 15:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mq+2VhVyKi66Q+OnyxY5pLU2
	2J5Xa5Ohmhz5gu/r5Ds=; b=aIRgbK7mOwHR4i8AH9kM5VqVPdlTuVVbl+XGzdYu
	lBX7C4DcBJ3VOLv11KWB5yK5J3HI4YvGJl80p4DuG2pUkbuTG5IVfUFbrVAq1lX+
	yZ5ZmIzeD3h5eqgUf+g+QhfOLsk1f6SV4TRGDYN8jvJs+Ym6o4FdNx/rwo4OL69l
	vBpKagroXBmHls7nOKS6RhAo55JfqAmPaPOz+cvcaZ3RdfH2zr3w25QvbgUl7v/N
	y/HQjFeRlxWL0qR1UJduvq1U/qkhspkLEAWnYfd6mPrCl7jiKX+lpOYbSB5ehJtS
	nrAa4qKLIO6UVSgoB18nwQ1wsQbCcQGepITuilLxPmaElA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utrw11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Mar 2025 15:52:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52FFqT7T016307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Mar 2025 15:52:29 GMT
Received: from hu-nithp-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 15 Mar 2025 08:52:27 -0700
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Nithyanantham Paramasivam
	<quic_nithp@quicinc.com>
Subject: [PATCH ath-next v3 3/3] wifi: ath12k: Enable REO queue lookup table feature on QCN9274
Date: Sat, 15 Mar 2025 21:21:59 +0530
Message-ID: <20250315155159.2475885-4-quic_nithp@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250315155159.2475885-1-quic_nithp@quicinc.com>
References: <20250315155159.2475885-1-quic_nithp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d5a23e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=VG1Z7HIe-OYZGDrRaVgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0Pw87wcr0CbvnqrPEblxMfe4tTEn8i1T
X-Proofpoint-ORIG-GUID: 0Pw87wcr0CbvnqrPEblxMfe4tTEn8i1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=955
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_085231_585485_416495FF 
X-CRM114-Status: GOOD (  11.94  )
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


