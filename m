Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC38EC02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 18:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j99v4ycCMTPt9FwctWp2BIMoa9AN4TefBR78xhGNeRg=; b=v4+87Nw58ogRY/sUIEWmX9e1Av
	fPWkLPdn4EGUOrrx+73NHfKQPPQEus4PkjzXIgKukK4HCJGRfinHt6GiOjJdt+vitRrpNnI1Vj8gW
	2yLbAiht5NGy5bJlTp2hChRSZqnOUB0fCHcn7pWFONg2ZWDPubyk5kKs0mGbGckJJF5xBehQC51U2
	v7zbYoEQejZ8qZ06o1shb7I42QSdlndIKu/17aX4ORK7VM5eg9eBZPZci3U7PKR2EAHfmYmtg8Gfe
	hVHnoqXeIbflGwdiTyI021Oq2zCcreUvRRaQPGelYEKQZcihBFsdmoGIhWjP6gy8xNLfUJBBpzC2B
	C5q/547Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbOoH-0000000FKz3-2fVL
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 18:53:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbOoF-0000000FKxs-2GA0
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 18:53:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAh17K015702;
	Fri, 24 Jan 2025 18:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j99v4ycCMTPt9FwctWp2BIMoa9AN4TefBR7
	8xhGNeRg=; b=knywJOkZsTx/kjT0srArESQcLg2gWACW32HA2sPjGaY/3fsA4P6
	6e87X0sYE+rOlmlmYptTvaXt7vg+a+Ru5nMo+H+sb8BR13gzAdKObXDKrRv1eeRt
	bNfRco1iLqOVOTGVWP51mRqhRIBvC6s8aFXV0HVsJ42j0xXosk+hexJXN+tZdoZ/
	JL8c81uOtTdXgxHwnK7Np7IKTUr2o+RTyGAfuHLDT30mSLxOQbMtezJCH0warhc7
	o8U1bDhVb5tv4byuhiywN5jexvXYOvYXcQdhqnih/o1VB8PlLNIabcH9VXMq0yFz
	A/YhyJzHk+ERi+r5mfejM8uUCiqmOxHdhcw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c9bt164e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 18:53:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50OIrYWn013024;
	Fri, 24 Jan 2025 18:53:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485cmbfnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 18:53:34 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50OIrXVM013018;
	Fri, 24 Jan 2025 18:53:33 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 50OIrXf1013017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 18:53:33 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id E3A984116F; Sat, 25 Jan 2025 00:23:32 +0530 (+0530)
From: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Subject: [PATCH ath-pending 0/3] Support to request pdev, vdev and beacon stats
Date: Sat, 25 Jan 2025 00:23:27 +0530
Message-Id: <20250124185330.1244585-1-ramya.gnanasekar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _6wmV9uQFQV22TFPP4qAcxdmaTmXNHga
X-Proofpoint-GUID: _6wmV9uQFQV22TFPP4qAcxdmaTmXNHga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=867 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_105339_694628_77339D31 
X-CRM114-Status: UNSURE (   8.61  )
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

PDEV, VDEV and beacon stats will be maintained in firmware by
stats module. These stats can be requested by host through
WMI cmd on demand and can be used for debugging.

This patch creates debugfs file for each stats which sends
request to firmware upon read and print the corresponding information.

ath12k
`-- pci-0000:06:00.0
    |-- mac0
        `-- fw_stats
            |-- beacon_stats
            `-- pdev_stats
            `-- vdev_stats

Ramya Gnanasekar (3):
  wifi: ath12k: Request vdev stats from firmware
  wifi: ath12k: Request beacon stats from firmware
  wifi: ath12k: Request pdev stats from firmware

 drivers/net/wireless/ath/ath12k/core.h    |  89 ++++
 drivers/net/wireless/ath/ath12k/debugfs.c | 380 ++++++++++++++++-
 drivers/net/wireless/ath/ath12k/debugfs.h |  13 +-
 drivers/net/wireless/ath/ath12k/wmi.c     | 482 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  77 ++++
 5 files changed, 1039 insertions(+), 2 deletions(-)


base-commit: 74557cbe44f8186f8e97443be258293479eddc8e
-- 
2.34.1


