Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AECC369CB
	for <ath12k@archiver.kernel.org>; Wed, 23 Apr 2025 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZayO2npPrLIKzEJcdh2Sgjg7QLhr5K62lf8kubZI4Qc=; b=jZbMDA7Q/kGXo/RI5W76w/mjox
	9z0r4jeDGvyUdWY87P8AYn0DPhac7NOi5XKnHuuk6NbSJFgYLw7GXeG0CwL+XWjbBKlCKUBjdgRAv
	DIpAQgKhbnucN/OBeDXbPK4Too4V3nP83lOvUuREMXpF/yMHdYkIXgi2TAkiW7RJ57HPpPs8wanux
	sXS+7OX9kSBgJFFr1HA9LXpjpdB/v4dcpU3rMCjdXJGmK/fz2ieXvPcLZ9ew9HMj5sf7EPjjnDjwC
	o5Ukdh3TKTEmt8m5YajtdhmUk2Bess7C8TmFrZsduRS420Vs7cIO7acTPj1nFjhBxZZH/kBHvvqHr
	fkKI+SQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7T6c-00000009H9R-1kXE;
	Wed, 23 Apr 2025 05:57:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7T6a-00000009H82-2YVg
	for ath12k@lists.infradead.org;
	Wed, 23 Apr 2025 05:57:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i8kA011379;
	Wed, 23 Apr 2025 05:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZayO2npPrLIKzEJcdh2Sgj
	g7QLhr5K62lf8kubZI4Qc=; b=fZa8e2ST4/e86G817sF2gCIMzoV6ep9W4bdBEt
	TLS2YpT8rZ1SadfF4aVsnG3ZoI3Vk4WNZgpSDPsEpoyJvsQX5fPPhdX9dwVLdN3v
	CkW7kmgBBqfcV0ZJ2vjU6r15UwrWLM4Vd+GSCWzmqO/yeqvPhl6rR9thXjZA2tGy
	+jk10RUdMwVd3m0HiDFMvnKsDILbWmvB9Hac1YbcYZf9g9OA8pzXqUqrVpdcLnEi
	UdV4JaYDSnPtLNORpJfJVZ5AqVqoLoVebvC1/lasYQCaUJcH8/f3WoX0qTGq/7nb
	oUeNGclqiyk9+DEd1TJppxzTvcbbxvh6Sb8cKo7ahoClwwOA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1h0xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:57:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N5v50Q016937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:57:06 GMT
Received: from hu-yintang-sha.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 22:57:04 -0700
From: Yingying Tang <quic_yintang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_yintang@quicinc.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Fix asymmetry between ath12k_core_init() and ath12k_core_deinit() 
Date: Wed, 23 Apr 2025 11:26:48 +0530
Message-ID: <20250423055650.16230-1-quic_yintang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i13Cv_0alZeD99U_qj1Gs4hLxsNLioXJ
X-Proofpoint-ORIG-GUID: i13Cv_0alZeD99U_qj1Gs4hLxsNLioXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzOCBTYWx0ZWRfX3wf18AXpP8oE wywssE1gT1te/EkBLzoIDB32wGIlMQrbtx94Rwyib0mUp2loLKP1JXJljyZMWIXrYiDTxFSk5mV 0rAOH0dia4rk7V/BQPuOWzBD1wHwVtZwDbIh1YrMLpm6SPm3XzzblUaxJfVBxkJRqjzfMmZL3Zn
 vk22ABm7A5Lq6gk09gX3A5SV5K0zGC6BZTXNDIQlQTxNUTgpEgGJ/JfPzs4/Tw3t9hVNd9P0FR4 S2MY8iZFj8p8AFakCNz+V9WFUvadN0GMwrfa5VJuzzVSQ3zeGpc91TxGX5niE/0XqvhI5MBQR1Q wF8zZSH8jHMTqnPooW/M/JhL/L/JnsOZIP24/f3zDBQ+NSvGSZPlv1N8EfByq/Xbuh7cS1JhVS2
 LrVUyFCD6I2pD+2xfvlOKkPQZ1Dz6P/lk2sdYp9ggX91z1yQ0H7MLD0DmRE7oDz98GX7t9bM
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=68088132 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=U4ZuKsGhK-j8A0JmtxUA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_03,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 mlxlogscore=293 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_225708_651118_60709228 
X-CRM114-Status: UNSURE (   7.78  )
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

There is asymmetry between ath12k_core_init and() ath12k_core_deinit(). 
It will cause page fault in some case. Reorder and relocate the release of
resources in ath12k_core_deinit() to avoid this asymmetry issue.

Yingying Tang (2):
  wifi: ath12k: Reorder and relocate the release of resources in
    ath12k_core_deinit()
  wifi: ath12k: Adjust the process of resource release for ahb bus

 drivers/net/wireless/ath/ath12k/ahb.c  | 5 ++---
 drivers/net/wireless/ath/ath12k/core.c | 5 ++---
 drivers/net/wireless/ath/ath12k/core.h | 1 +
 drivers/net/wireless/ath/ath12k/pci.c  | 5 ++---
 4 files changed, 7 insertions(+), 9 deletions(-)
---
base-commit: 89ac53e96217bd5525ee56eaa1b8ef2b398a9ad6



