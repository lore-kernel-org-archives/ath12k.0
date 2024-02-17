Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97010C54766
	for <ath12k@archiver.kernel.org>; Sat, 17 Feb 2024 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uQJLlCZzY6JP7PobQj8G3jZIyuyBP1oXAdYdvWkLZk=; b=qHkra6Pppss/3y0FwwEDPiCMd7
	QRiHXw50vNtWLOT3gwxVFWQWZjukYnp5RSnGXI18JUKfju7OJrEVt5QhVP7EqIESvK960w/2Q9qZL
	zZuqR3e/jyYSwU7C8rf+FjWbEPwK4m38gulBy+RfZu4CDX6NPzZS+ZcaAAgGI26FRAb0dhnHm1T2e
	jTM6H9rrFVVk/Zx/ZEbKLQ01fctdggiW3mtDrsN+14z0dPeHafskAKFQgQ49qTGtEjoYWC8LDDFxt
	FOgMKJX0I/2orZsst8huH+G08hvYPJJ+gcDdkZBa4bS0i4cxpB9Mw6dGz49bWkkmBzgNIoV96cov6
	DfG8vmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbRb4-00000006NHD-130w
	for ath12k@archiver.kernel.org;
	Sat, 17 Feb 2024 20:47:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbRay-00000006NFK-113K;
	Sat, 17 Feb 2024 20:47:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41HKfqdI008951;
	Sat, 17 Feb 2024 20:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=4uQJLlCZzY6JP7PobQj8G3jZIyuyBP1oXAdYdvWkLZk
	=; b=VeSQMZdaPe8JMKldDyVCYaRSv01N2couLH8DkCI6dckDCP1C7eA3OsK8oGj
	M0jTCEmDftBWAQLVRtrtJvwvblLk9yVrhD+eUiATTsVoJnPc7Vqnubfr/jC/Jzww
	tfl+jH/XZ02d+fb/nBlRTC/2gAuAvImZ1HD3WBfn1ATPcAiQXiZDFHfpsCofifXX
	/O0iCYARx+YSGorLNS6kBcGlSDc20ocJeoI3VIZYBwtY5z5ubDjkvrHDrp+Rp611
	89cytHMvZ13JiI/DQu82bVPp6VY45gZzc/c7z8MjBzdQkgZt8lCcJVVGh9V2pJc4
	T3G7OjIgvZl/daseEAfu0h0m0ew==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3waj5s963v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 20:47:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41HKlVG3014329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 20:47:31 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 17 Feb
 2024 12:47:31 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 17 Feb 2024 12:47:01 -0800
Subject: [PATCH 1/2] MAINTAINERS: update Jeff Johnson e-mail address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240217-update-maintainer-v1-1-1426cf7a8bb1@quicinc.com>
References: <20240217-update-maintainer-v1-0-1426cf7a8bb1@quicinc.com>
In-Reply-To: <20240217-update-maintainer-v1-0-1426cf7a8bb1@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KaLcL7MSXEXejgbXwDYTJWt2hxdbSIrL
X-Proofpoint-ORIG-GUID: KaLcL7MSXEXejgbXwDYTJWt2hxdbSIrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_19,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=539 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402170172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_124736_430776_20F339C6 
X-CRM114-Status: UNSURE (   9.77  )
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

I now have a @kernel.org e-mail address, so use that for my
maintenance activities.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92152ac346c8..77289fef78d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17974,7 +17974,7 @@ F:	drivers/media/tuners/qt1010*
 
 QUALCOMM ATH12K WIRELESS DRIVER
 M:	Kalle Valo <kvalo@kernel.org>
-M:	Jeff Johnson <quic_jjohnson@quicinc.com>
+M:	Jeff Johnson <jjohnson@kernel.org>
 L:	ath12k@lists.infradead.org
 S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath12k
@@ -17983,7 +17983,7 @@ F:	drivers/net/wireless/ath/ath12k/
 
 QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
 M:	Kalle Valo <kvalo@kernel.org>
-M:	Jeff Johnson <quic_jjohnson@quicinc.com>
+M:	Jeff Johnson <jjohnson@kernel.org>
 L:	ath10k@lists.infradead.org
 S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath10k
@@ -17993,7 +17993,7 @@ F:	drivers/net/wireless/ath/ath10k/
 
 QUALCOMM ATHEROS ATH11K WIRELESS DRIVER
 M:	Kalle Valo <kvalo@kernel.org>
-M:	Jeff Johnson <quic_jjohnson@quicinc.com>
+M:	Jeff Johnson <jjohnson@kernel.org>
 L:	ath11k@lists.infradead.org
 S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k

-- 
2.42.0


