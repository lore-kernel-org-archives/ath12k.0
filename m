Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06626C48BC3
	for <ath12k@archiver.kernel.org>; Sat, 17 Feb 2024 20:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1WFd0LHuEi2e/SEIZlIsATNy6sjm5jjQTrP9WubCNk=; b=Rv2OQeEzpkwl44nB77Bc8GL6iY
	IOA8lezcfC1itTJYBoDduZAbDcmUp7EE2Ld6K+xHoQ7yJodqsU3XlWT2mFK1ogyK/ZN0bqCMN+JYv
	qJFcwuPk/QHNE8PNOjJBmjGfBN6+5NsBpTJdo7Bf8/D6oWn4tXj3lEnj4d5WklboIJlOpTvBP2OtL
	PYh1w/ll+q+zioTwxvlc9067grioCEiGMxwuTc7jyhuczrhwtSZ5LMdx2bHbjRRVZKnF0KPN66kXa
	uSKcfkYYo8M79KbXdHx2KYnqJ2at+sgTpvSKjXaKjAFLgSxrXknKhEZ6/XYlqoQ6hSZRyiABN0HEl
	79T60Z2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbRb8-00000006NK3-2g10
	for ath12k@archiver.kernel.org;
	Sat, 17 Feb 2024 20:47:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbRb4-00000006NGv-0I1o;
	Sat, 17 Feb 2024 20:47:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41HKgPYf027382;
	Sat, 17 Feb 2024 20:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=P1WFd0LHuEi2e/SEIZlIsATNy6sjm5jjQTrP9WubCNk
	=; b=oHuqvvdxlM3VpuD7FmPV2WxqaFcE/SplujPqE1e6HK7VJce0JmX4nhAoBMH
	X9+UVvm0Khtwxqq6hYXpBSDuN247hqg+r3yi0bc9i6seWzTbmn0bX4miLMwtv7eo
	DO3PZClcEzF74znx/E5i9YrOtwjW1DZ8kmr3kQD25UbTuQEvZp6gVId9ZUBAxi9X
	iJkwk0EW6VNae2RSSajROuiapYaz63RnR6JN3KlELS0sYLj4zi5waZgSWwHWtxv3
	kIuknl8NMSVTb3+kpmERAoh8TZEBOVXC5CC7UsKkUhHmAi/QRvGbMprfg5MAs3F8
	OxHv7rhHMRPBSmud1a4E/8HB/XQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wam4q10vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 20:47:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41HKlWZY005295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 20:47:32 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 17 Feb
 2024 12:47:31 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 17 Feb 2024 12:47:02 -0800
Subject: [PATCH 2/2] MAINTAINERS: Add N: ath1*k entries to match .yaml
 files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240217-update-maintainer-v1-2-1426cf7a8bb1@quicinc.com>
References: <20240217-update-maintainer-v1-0-1426cf7a8bb1@quicinc.com>
In-Reply-To: <20240217-update-maintainer-v1-0-1426cf7a8bb1@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1Fl0euag_v_5XPuQ4aR0WUgb7Zv-ZDAG
X-Proofpoint-GUID: 1Fl0euag_v_5XPuQ4aR0WUgb7Zv-ZDAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_19,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=485 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402170172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_124742_250536_B34E61E9 
X-CRM114-Status: GOOD (  12.05  )
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

In [1] it was observed that the ath12k maintainers were not added to
the review of a new ath12k YAML file. Bartosz suggested "adding an N:
ath12k entry to MAINTAINERS" to prevent this in the future. In the
process it was noticed that one of the ath11k YAML files was also not
explicitly referenced, so add N: entries to ath10k, ath11k, and
ath12k, and remove the explicit F: entries.

Link: https://lore.kernel.org/linux-wireless/20240216203215.40870-7-brgl@bgdev.pl/ [1]
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77289fef78d9..b96c991252ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17980,6 +17980,7 @@ S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath12k
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
 F:	drivers/net/wireless/ath/ath12k/
+N:	ath12k
 
 QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
 M:	Kalle Valo <kvalo@kernel.org>
@@ -17988,8 +17989,8 @@ L:	ath10k@lists.infradead.org
 S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath10k
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
-F:	Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
 F:	drivers/net/wireless/ath/ath10k/
+N:	ath10k
 
 QUALCOMM ATHEROS ATH11K WIRELESS DRIVER
 M:	Kalle Valo <kvalo@kernel.org>
@@ -17999,8 +18000,8 @@ S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k
 B:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k/bugreport
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
-F:	Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
 F:	drivers/net/wireless/ath/ath11k/
+N:	ath11k
 
 QUALCOMM ATHEROS ATH9K WIRELESS DRIVER
 M:	Toke Høiland-Jørgensen <toke@toke.dk>

-- 
2.42.0


