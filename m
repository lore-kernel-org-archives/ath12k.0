Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7E4C47079
	for <ath12k@archiver.kernel.org>; Thu,  4 Jan 2024 03:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lb/1qL14BiS+R8qpRGB8+xSiMJ5VsRz+DVwB4q4XeOY=; b=qANi+GEthdz0EfO0YIqU9AyDuh
	jXuVTMbP2iLybxDUTk+KfzCnXr3GOY+XnQUltPjfrEfx8Ro9KFpEEfVGpCgavYfZcgZCcZVeGYWAB
	XmuTyqPvnj5dAySMhxqd8n+fd1QmXv7XOUGw+qzycsGhE5kPc17bGqC4+djvd7oQG0cpre0tr5Gbc
	HeeEy28ygXgN0F08np+kLxcvUbcFvW2Ezu1xy5vG7GGHa6As15sOIC1oSVzxnx8WLlo9sw04QdxRY
	jzOF0WNdJ7abM/MBKuUBLpxlkhjjH6mk499AD8FY7/fAkGmHEz6OGtitbWbsTV2Y4QqS3M9vZqpg1
	bebqn+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLECg-00CiDZ-23
	for ath12k@archiver.kernel.org;
	Thu, 04 Jan 2024 03:15:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLECd-00CiCF-21;
	Thu, 04 Jan 2024 03:15:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4042dTaw028914;
	Thu, 4 Jan 2024 03:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=Lb/1qL1
	4BiS+R8qpRGB8+xSiMJ5VsRz+DVwB4q4XeOY=; b=PVDWKsbXqEqVLIwR1lKi+7+
	1dGMjPAxichaQ+RHSLbqQgjEKZYRb4HrHlJYIB9ht4VXgYq0/WAmwVl9hXoiKGk6
	x/NRn7p4BRfs/4x7WfL9fOov24o9kYShiWhKfqEpvESM3fnYuksFJViMD7cba4af
	9uS3QS+UgHvic/3P81G42D/8yyJGD5Yyn3M7yW/0pulKY4OSDp4XGiH9niDMZ+P9
	2j6fihNQpsg6K2vQ2Je72utdkujavJyD14v2fiINewZTx5vpHJRix+JlFAdtyQ8g
	IxLEJnlOY7QBC2LuHGSn2YtpB+bnZ06HvNIJIA10PHxDVjobkgFo0PMLvUSAhPA=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd84csnha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jan 2024 03:15:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4043FO2i012701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jan 2024 03:15:24 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 3 Jan 2024 19:15:22 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/3] wifi: ath: replace ENOTSUPP with EOPNOTSUPP
Date: Thu, 4 Jan 2024 08:45:06 +0530
Message-ID: <20240104031509.366302-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BW_cPZK-JfMBLRehYSgFavldMTc33sbO
X-Proofpoint-GUID: BW_cPZK-JfMBLRehYSgFavldMTc33sbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=433 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401040020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_191527_788530_6237EBCC 
X-CRM114-Status: UNSURE (   9.22  )
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

ENOTSUPP is not a standard error code, don't use it. Replace with
EOPNOTSUPP instead.

No functional changes, compile tested only.

Karthikeyan Periyasamy (3):
  wifi: ath12k: replace ENOTSUPP with EOPNOTSUPP
  wifi: ath11k: replace ENOTSUPP with EOPNOTSUPP
  wifi: ath10k: replace ENOTSUPP with EOPNOTSUPP

 drivers/net/wireless/ath/ath10k/core.c    |  4 ++--
 drivers/net/wireless/ath/ath10k/htt.c     |  3 ++-
 drivers/net/wireless/ath/ath10k/mac.c     |  6 +++---
 drivers/net/wireless/ath/ath10k/pci.c     | 10 +++++-----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  7 ++++---
 drivers/net/wireless/ath/ath10k/wmi.c     | 12 ++++++------
 drivers/net/wireless/ath/ath11k/dp_tx.c   |  6 +++---
 drivers/net/wireless/ath/ath11k/hal_rx.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/dp_tx.c   |  6 +++---
 drivers/net/wireless/ath/ath12k/hal_rx.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/mac.c     | 10 +++++-----
 11 files changed, 37 insertions(+), 35 deletions(-)


base-commit: 2cd4e3f91f264926a6b11df948417b74d52ca9b9
-- 
2.34.1


