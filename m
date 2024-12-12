Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BB0E7717D
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 00:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f+pKBFcvnNf7Yk68ACy5WPK5b/pzWqG3PCSE7wSBthg=; b=D6e91c7bs1npqzjT2tA/Yj5sx/
	4ontg/FY5lqdUI+oCU//7EYMU0PF+u0ZlEs58nAxKPJZHPWF3n1QF9woI2h+H9Hk7S3jBjCw809bQ
	sdKE94bn/FWm0+ImqRgBWXMOGrECOiP8OUDXnAHwjP7NUw36IChJQRD7ORUR3+KuSiGeTH7gf3eHo
	JcCZyP89hy34v1XdDwMLh9qK/QrXH9lZvbnySXjjd4nH5TsVZALMqxZHzAYjWOigzvvS1mk8x1pZd
	Dgo7QBf75ETHjyNQN+stBIJSoUee4OJks7reKJf7Dddv908IUSzeKIeOPSd7zOFIfSVlyIXUi9dmS
	FHr2eBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXOS-0000000Gd0H-34ob
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 00:49:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXOQ-0000000Gcx3-18zK
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 00:49:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD1mq028278;
	Thu, 12 Dec 2024 00:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f+pKBFcvnNf7Yk68ACy5WP
	K5b/pzWqG3PCSE7wSBthg=; b=aBBtGqHPvArrOM5j8kWSPEJk0ZB93HzfcC5VI8
	Bq1F+CFZY9/bR4odkaTetHUledqkqxrxbihKavBimsXoDaPDZmWxWVSc2gxgBlAJ
	Hm/5fMAEbhkFuZRS/wXsvrmvYZN641O4K+w1tCNcwPd3a+dcHDXebgJ8/bcvez6j
	btL8tab1WdFmuBNVg1a1sB2QGXDtHWd8+AmwkdIHPz51CaiLNdHlgwA2UulQA/4f
	9O7HC4hskhHo3yeoEIfVv4rmASJaAmeyrYzXlCyEcPRvEZQzrHL4YfwjpM8Nc0DT
	syvCQebkzDiZS/Y69gSDyYWpELS8XaH9KHECVkXN06tgpr5w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xs9ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 00:49:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC0nMj1021383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 00:49:22 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 16:49:20 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: Fix the static checker warning
Date: Thu, 12 Dec 2024 06:19:02 +0530
Message-ID: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fXAQTSjukuBRL-0uCvwouO8cl_0Ofikm
X-Proofpoint-GUID: fXAQTSjukuBRL-0uCvwouO8cl_0Ofikm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=498 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_164926_443320_0D620D46 
X-CRM114-Status: UNSURE (   7.63  )
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

This patch series fix the below Smatch static checker warnings

Warnings:
mac.c:10941 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 10930)
mac.c:11007 ath12k_mac_allocate() error: uninitialized symbol 'ab'.
mac.c:11013 ath12k_mac_allocate() error: uninitialized symbol 'ab'.

Karthikeyan Periyasamy (4):
  wifi: ath12k: Refactor ath12k_hw set helper function argument
  wifi: ath12k: Refactor the ath12k_hw get helper function argument
  wifi: ath12k: Refactor ath12k_get_num_hw() helper function argument
  wifi: ath12k: Fix uninitialized variable access in
    ath12k_mac_allocate() function

 drivers/net/wireless/ath/ath12k/core.c | 16 ++++-----
 drivers/net/wireless/ath/ath12k/core.h | 12 +++----
 drivers/net/wireless/ath/ath12k/mac.c  | 47 +++++++++++++++++---------
 3 files changed, 45 insertions(+), 30 deletions(-)


base-commit: 4d762e0043789e3608ad28c102131b232bd04377
-- 
2.34.1


