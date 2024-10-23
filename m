Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89343D2E008
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 02:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TARusI4IDj/kdMHvGCC6LYkTuP3tlp9cBoAfUt+RrHk=; b=mI3WrHeQkFpS6DSuzC+DOyuZh3
	U7xhlQcG9A9nsywrC+vrTis0IOvpfcVjRsOC45nn9hbBkVii7GHeb1jjTQHGdLOtGaLZzR39NAzN2
	QdeWpmR8aW6zUrj5rQ3LbeMqC24b5+d1NmMnjjLDfycBlZDjeDDwM4TpTztKFz0R06X3jvP1EJFbg
	CbBw4k7XOTDCAl8byeNvFRz0kWyYAX9hi86tj57k4mLNoOvJJT3/VtfKC23EVrPL4oFqktRTn11wv
	22KkDUSC0TNfJD3bbCZc1ABDU9EpYKkY/BgXsyguQGQqT1pO8VPIeHq8JWahyFzPze8jUKk8YswiK
	t4kOTEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3RQD-0000000CkQL-0KfG
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 02:48:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ROt-0000000Ck8Y-2FN7
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 02:47:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLa3ZI032158;
	Wed, 23 Oct 2024 02:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TARusI4IDj/kdMHvGCC6LY
	kTuP3tlp9cBoAfUt+RrHk=; b=aCcS57sgR46xOdaIQxig20nyHb306NTUmpg0qp
	wLJ37eVnx8ChMYBCl4dCWHHeNcbXnoBk2cIru3CAY0jq3O/I3805F4zqKb0VyLcd
	enB/t+HsVnGjRnhh0lRjpJP9VNcXvDF/B0FZ+RvpsH9E/oyG0DNnRn6DQ9VZL5qw
	wTqAFmmwYYuW3o67FVhvlHJzU2HSF4milAC8to7KOqyvVWq3rbg/aytHrbSBCKI8
	h2IJBD+CVyt7Ief9Ij22yrP9h7b9ZD9fkkQYhQtKaSh99z+Y8QXK0rPZeeuaJS7o
	xIeNjS7tTFWhDp6mR0SaUycBls22l/secmtkbnSG4wYXTk/w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3vrktx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 02:47:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N2l55Y019197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 02:47:05 GMT
Received: from lingbok-Birman-PHX.lan (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 19:47:04 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v3 0/4] wifi: ath12k: Add new features to ACPI
Date: Wed, 23 Oct 2024 10:45:47 +0800
Message-ID: <20241023024551.18966-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Jc0fMD49_sRi_jXFzu5zSvA01UAL3Tjr
X-Proofpoint-ORIG-GUID: Jc0fMD49_sRi_jXFzu5zSvA01UAL3Tjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 mlxlogscore=831 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_194707_621992_E97B33BF 
X-CRM114-Status: UNSURE (   9.68  )
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

By reading ACPI tables, implement a method to obtain the ACPI functions
Bitmap, enable or disable specific features based on ACPI Bitflags and
download board data files based on ACPI board data filename extensions.

v3:
1.change some function name.

v2:
1.support functions for cases where CONFIG_ACPI is disabled

Lingbo Kong (4):
  wifi: ath12k: Add support for obtaining the buffer type ACPI function
    bitmap
  wifi: ath12k: Add Support for enabling or disabling specific features
    based on ACPI bitflag
  wifi: ath12k: Adjust the timing to access ACPI table
  wifi: ath12k: Add support for reading variant from ACPI to download
    board data file

 drivers/net/wireless/ath/ath12k/acpi.c | 200 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/acpi.h |  38 +++++
 drivers/net/wireless/ath/ath12k/core.c |   8 +-
 drivers/net/wireless/ath/ath12k/core.h |   7 +
 drivers/net/wireless/ath/ath12k/mac.c  |   3 +-
 drivers/net/wireless/ath/ath12k/qmi.c  |   9 ++
 6 files changed, 217 insertions(+), 48 deletions(-)


base-commit: cd8aa3af7491a1f7a5b81e53dbe62a38433c2d4b
-- 
2.34.1


