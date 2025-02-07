Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E13C02192
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 05:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FsadaE/ss3PMP/OsdyT7bVlZLChuHO9tl87MCpHq/ok=; b=kz0+KIzXmXqgkELZMWtP9bm+5p
	EHnYedRNAOKdRuFwsfBMSnJdMaXE9l3RK91LR18KJ8S3n+MHU+normM4UAqizv4I4KizY9Z6kGxvM
	zQVJLFyqhe7kHgKwNRxSPlrnMyuKBw0ZOayre124VWqmgdDP18m5klpZjjPcDDJf6OSJRIbhc8eZz
	Rq46AewooAsRu6dTXyOC0XMjh/Vu7Qw6Jzy/+KZWiUkzF3yY+MLcjP4xX/pUvchFOZvi9jHaRk09/
	jDTQFQaFzRiNYQb4er6YQ25NvmaQOJ+kCB0x/CmhRbzebH3o71a0qistFCNEOir643BG9exUb66Md
	sHftYDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGWw-00000008L3P-0eAV
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 05:03:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGWs-00000008L1p-2KZW
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 05:03:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5172xlXi014297;
	Fri, 7 Feb 2025 05:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FsadaE/ss3PMP/OsdyT7bV
	lZLChuHO9tl87MCpHq/ok=; b=Uabcbop9wvwA+GmLfSIQewjQdRbTrfl954DDg0
	Tll18VuTjNyYGAr0QhUlIOxL3GvofeqyIsTXakKLTiVqO4A8CbdlTKYxsBHH+T7z
	SuM6OIpFOKTawi/BlOt4Of3ghanKu04ivzRleLqJDMJ+VCWVOwgZp73xdBns1pXG
	ex4pMfjFLTVvNSpNrQWkRDBDg/DQyqulu2+yxHTkRCODACf1NYwMpS5SEi8c5rWX
	nQ1sn2/p/GzAKjj+wqRI6JM1r9ru3t4XofgIQCGLY6Z/4X/7M73dxtoCbAcY3N2B
	6UQ2/8dW3vd+H4UeJTzkxxi58JDKWx/74MXaKb9ZuQwWueDg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n9vq08b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 05:03:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51753lvA009501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 05:03:47 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 21:03:45 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: MLO setup for single split-phy PCI device
Date: Fri, 7 Feb 2025 10:33:24 +0530
Message-ID: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Af6hsPy0w2z2B7lURiUPWi9ljRdEKzqF
X-Proofpoint-ORIG-GUID: Af6hsPy0w2z2B7lURiUPWi9ljRdEKzqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_02,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=466 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_210350_731821_6B0C56C0 
X-CRM114-Status: UNSURE (   6.86  )
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

The single split-phy PCI device can establish multi-link operation(MLO)
within its own radios.

Therefore, enables MLO for single split-phy PCI device.

Aaradhana Sahu (3):
  wifi: ath12k: Enable MLO setup ready and teardown commands for single
    split-phy device
  wifi: ath12k: Remove dependency on single_chip_mlo_support for
    mlo_capable flag
  wifi: ath12k: Enable MLO for single split-phy PCI device

 drivers/net/wireless/ath/ath12k/core.c | 46 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/core.h |  4 +--
 drivers/net/wireless/ath/ath12k/mac.c  |  9 +++++
 drivers/net/wireless/ath/ath12k/qmi.c  | 12 ++-----
 4 files changed, 49 insertions(+), 22 deletions(-)


base-commit: d132a72d768bae74d10e6539fcf6522dfdbd1115
-- 
2.34.1


