Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E79C369D1
	for <ath12k@archiver.kernel.org>; Wed, 23 Apr 2025 05:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRM+Z/EK1rqU6wyhdduU5NunSfGdw/9opteX32RcVtA=; b=hFThbePQB78rIqIuHK7PD6XTnK
	tqd5HqnLqQMd5CHTKfOdFoudWR45S+XIhRl8guy4rW9oaC78OdQKQnMFmegKtBAkgnwXlFAIALheV
	1XRXM15C1QyUi8C8teoizWGe7FouvwRfgcj/cPaR2GQ+eDj9h46sqnMT+WQMdR+LvM+WN+UJE0bGm
	T1q3PXKzmcpovZD8P1KBdTKrQ7tZwOy6G15Q+1C2hZXl8yRjSy2lBlhi06rqKH2LS57FHBTHXBWwk
	ESzTmuPc3EU/IYYo7EnRWC+TOaaVrnq0GHjdNChunbLQz0aFtt9+QUT2VPvHl8bvHOzVFit3UVYJu
	zJU04myA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7T6e-00000009HAQ-29rL;
	Wed, 23 Apr 2025 05:57:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7T6b-00000009H93-2mZ0
	for ath12k@lists.infradead.org;
	Wed, 23 Apr 2025 05:57:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0ioHD021819;
	Wed, 23 Apr 2025 05:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pRM+Z/EK1rqU6wyhdduU5NunSfGdw/9opteX32RcVtA=; b=fgLaTyTbc0Y2kFCj
	FGYc6nY90Eu7u7QiVtSNFMghDnuMNZOK6cPtq3yopQu+Ok0A9CXXak65qwgeI0Ql
	B30Qnqz1s3QGTWLOx81YltiRsE7aO0g+OZFcOw+ZIkr0S89s2ekkEXI0fOpToqTi
	sBA/mLHQiltxkWFOgrjuodH+xEQOhCETZfeLjsPQGz9+3IlRaVvoZgZZjzAQyEBR
	mT2sODmTlJbvFvlb/OtaP2nd1ITeOQkJWHNOnqaXOUOhw+RZioym9wR4Qt/0CbBQ
	esFQR1MzSrhwXBaXJ+xkfJ8lv3/XrqoVNnSTwX0HeanxecIoZljNv/Zuvo0a0Oq0
	a4Jf8A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh210mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:57:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N5v8Wt006030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:57:08 GMT
Received: from hu-yintang-sha.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 22:57:07 -0700
From: Yingying Tang <quic_yintang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_yintang@quicinc.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: Adjust the process of resource release for ahb bus
Date: Wed, 23 Apr 2025 11:26:50 +0530
Message-ID: <20250423055650.16230-3-quic_yintang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423055650.16230-1-quic_yintang@quicinc.com>
References: <20250423055650.16230-1-quic_yintang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=68088135 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=1WRsYH4MBVgdcUebPgoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f88dhpjLS_LM2yHAkV9qkbnpfWRJZqf1
X-Proofpoint-ORIG-GUID: f88dhpjLS_LM2yHAkV9qkbnpfWRJZqf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzOCBTYWx0ZWRfX/y5rIZnJdB80 1XYipJHn0dcY0OTuWqY4eTYTyS6SsI5qI8wZfj82QyUl8qkuSJVi+d5/atOGIAU8N/7Eg3lp/NC zCMF/YMXzoUjGyKV5SgcS0dvsNHt6nOjjKD/ZjHaccHasrGDE+KbPyyYUsABmJA7zhneIewSgg/
 dQk15jZxfTPFz3kIqNKJQ7CMHWZD5RtbVaXAZ692I5932DDqP0d+1Kc/ut873qrNVCDygApClZM U2Umq6dpATaSKpHZKnYSiij6V1INEI39B3ZtNyIEq5oFDRaa5aGt2LMyAibfEUduj7wVBK/gNRg N3VTjHQjKsqZeu7OQ/WI/xvEFkZVhcsnDxp8z+YceuhHTr0i7I0ByAseS3CPmYTHATc3p0KsY42
 2CWWnPR4VXY1QJv/bwrzU7jdoRh2y5YJSQg2kYzX/t/D8ekr7EuV7K9T2YSrIetPD1GtnDEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_03,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=842
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_225709_710828_AAFAE2B8 
X-CRM114-Status: GOOD (  10.63  )
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

Due to the change in the resource release order in ath12k_core_deinit(),
the resource release order in the AHB bus removal process needs to be
adjusted accordingly.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1

Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: Yingying Tang <quic_yintang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 1c2171e2bb73..dc5dba4658cd 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -1125,14 +1125,13 @@ static void ath12k_ahb_remove(struct platform_device *pdev)
 
 	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
 		ath12k_ahb_power_down(ab, false);
-		ath12k_qmi_deinit_service(ab);
 		goto qmi_fail;
 	}
 
 	ath12k_ahb_remove_prepare(ab);
-	ath12k_core_deinit(ab);
-
+	ath12k_core_hw_group_cleanup(ab->ag);
 qmi_fail:
+	ath12k_core_deinit(ab);
 	ath12k_ahb_free_resources(ab);
 }
 
-- 
2.25.1


