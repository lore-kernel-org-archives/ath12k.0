Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A014CD3442
	for <ath12k@archiver.kernel.org>; Tue,  3 Sep 2024 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GTtRFXUdKiuqNiu7gVBEbg8Hx8FJe/fi91/4XyGN214=; b=NUzMU0mZtVrkIuuJAc5E56b4NX
	kv2h6Hz4KmAIWz1STwGpyb26ymPmQaTuyuW7cFOddCpJkaq2uVXxjt97oBtOHUAQaZmZ/+41bm7nm
	pIr+spWt9ft9zvhhkY2siBRpVg7EhcpP29QeiiXB50mAN8OExWse5aKdeNT8NibnIAUwhsxwod+iC
	rPNPZ3LvzZqAqX/62cwcn6CqOs5AwaHGVbQ0EqZ2cXqGCkfoAQ5kCUa+7CYdPEN2NX59SR7p4dNrT
	6IbfWZeJY9GTRwZ152U8KdeHfma2XHUnktq2Uyibyqeopcb7+tqtqLQwRGS4rAodId+nxwsnDNtOE
	gm4Zu/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slVdS-00000000usV-1E5z
	for ath12k@archiver.kernel.org;
	Tue, 03 Sep 2024 15:40:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slVZA-00000000tWx-36Ka;
	Tue, 03 Sep 2024 15:35:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483BWBIP028129;
	Tue, 3 Sep 2024 15:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GTtRFXUdKiuqNiu7gVBEbg
	8Hx8FJe/fi91/4XyGN214=; b=SYqheX2h726YAT8/SqnchmJElBmtRBpnA3gVom
	2pXr6KT4Kdia2hYx00LyO4zTp3m7ArFALcd6NyNXyzQTOAk7kkAd2CwHoFR/M9BC
	DjubjMvaBqTK20aYPjdf2XybxT9hxKqnKbCa7IIZgGFEo3N3DVt7PB36hzs3KB5O
	MDlzfKog4+YMzRvaaScHbWQBXE2ToPo6rAm7AlnfdwSrip9avXIoA3LWeFZBjE8C
	u2BCUmWCwyfA2O7pJIiRW9roKRiXXS2Br7nRtOE21DQMFknLxRJqMARkmtp5OmWc
	Jbke3HhCvGvMCrGMVzrF68uqagj+3XB7gaND9RQcTNtiPmow==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bvbkfqq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 15:35:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483FZ7Ex005357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 15:35:07 GMT
Received: from [10.111.180.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 08:35:07 -0700
Message-ID: <8a9375eb-3205-4a78-a8c1-bd85df106ec9@quicinc.com>
Date: Tue, 3 Sep 2024 08:35:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <linux-wireless@vger.kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
        <quic_kvalo@quicinc.com>
Subject: pull-request: ath-current-20240903
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1Q3TZxKd_18OmTZB7ZXE6qbn8s5oQl1u
X-Proofpoint-GUID: 1Q3TZxKd_18OmTZB7ZXE6qbn8s5oQl1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_03,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 mlxlogscore=557 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_083536_844232_8AA51174 
X-CRM114-Status: GOOD (  12.42  )
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

The following changes since commit 38055789d15155109b41602ad719d770af507030:

  wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850 (2024-08-05 12:28:07 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20240903

for you to fetch changes up to 2f833e8948d6c88a3a257d4e426c9897b4907d5a:

  Revert "wifi: ath11k: support hibernation" (2024-09-02 19:33:00 +0300)

----------------------------------------------------------------
ath.git patches for v6.11-rc7

We have three patch which address two issues in the ath11k driver
which should be addressed for 6.11-rc7:

One patch fixes a NULL pointer dereference while parsing transmit
power envelope (TPE) information, and the other two patches revert the
hibernation support since it is interfering with suspend on some
platforms. Note the cause of the suspend wakeups is still being
investigated, and it is hoped this can be addressed and hibernation
support can be restored in the near future.

----------------------------------------------------------------
Baochen Qiang (3):
      wifi: ath11k: fix NULL pointer dereference in ath11k_mac_get_eirp_power()
      Revert "wifi: ath11k: restore country code during resume"
      Revert "wifi: ath11k: support hibernation"

 drivers/net/wireless/ath/ath11k/ahb.c  |   4 +-
 drivers/net/wireless/ath/ath11k/core.c | 115 +++++++++------------------------
 drivers/net/wireless/ath/ath11k/core.h |   4 --
 drivers/net/wireless/ath/ath11k/hif.h  |  12 +---
 drivers/net/wireless/ath/ath11k/mac.c  |   1 +
 drivers/net/wireless/ath/ath11k/mhi.c  |  12 +---
 drivers/net/wireless/ath/ath11k/mhi.h  |   3 +-
 drivers/net/wireless/ath/ath11k/pci.c  |  44 ++-----------
 drivers/net/wireless/ath/ath11k/qmi.c  |   2 +-
 9 files changed, 49 insertions(+), 148 deletions(-)

