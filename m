Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5119DC5AD4C
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ffU0zHxE2zH9lFMimH7rggQ418BiShFUztEM7uzmOCQ=; b=nToTvnju2k23Zo
	9hei8TwCdsul1PBSRAa2XHiBsUAd9ExtMJPzvWgOZzSf2M0iciEbHI0kpAmkU8Mam8AU8iUIgYnON
	pL2Gm1J4UY+KpiOxPsZkpMmjZ9H3kBMadky9aHJLHUUbhREv89QY1AfZg/eKmF8gG766oz0ShMjSu
	NAhonStSdnSyn4eRViMyLjvQ5sHHOO4p+jxJUho84eiGaC7RZthsLmyamkWu2O1Q1rSAGllFJ/GZ+
	7+NFhj9FXTwGcTTZXYW3Emmb7V03C93l1xVfgYcTCLYsqv5NvuP90//mqhcZSwgGfu3qWYoj5kd7t
	92ikwYyS+XQY0JFSvDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51K9-00BkeT-21
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 10:16:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51Jy-00Bkab-0W
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 10:16:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK7igFm030716;
	Mon, 20 Nov 2023 10:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=uj7mYuruhzmFSeRMTe7qL0xzEeLtaoTcbb2EDHnDZg0=;
 b=mHUUNesxm4pusAWvGtqkwjNSDdnj65hVn3GgPar/kJvMxKwy+qhVA1JvXowwI6Wz4VUY
 QvFnpQV5u9zlmN96XQguPAENIiii5SKHx/nW2Puc5O46heX/LqBjFiUixZwNg0xYBBBU
 mAGEa8UNEt05+ag9cj6fWUYc1rjQN6OngvKiriUYXHaYZGLLoTWxbhl4nxt2RmRpnSM3
 A1lL3x7no4LDlt+5wVTlxHsToXu19XciF03YQ6vd84To9I0HfclSqG7V3jZm3+OENjWg
 IuYrBn4AsqkOcwKOJnJzoM6BFuwyz66Q/HcnhsXmXvsdFXtf31tbptBnma9+Dl6M9VHX wA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uem80kqrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:15:59 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKAFwb0018285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:15:58 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 02:15:57 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 0/7] wifi: ath12k: support one MSI
Date: Mon, 20 Nov 2023 18:15:36 +0800
Message-ID: <20231120101543.4369-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C9v3Z_f2GTP8dPLEif9SdSPb2Q3T_KzE
X-Proofpoint-ORIG-GUID: C9v3Z_f2GTP8dPLEif9SdSPb2Q3T_KzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_07,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=394
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_021602_301792_6F9315F4 
X-CRM114-Status: GOOD (  11.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

This patch set is to support one MSI vector for WCN7850.

Kang Yang (7):
  wifi: ath12k: get msi_data again after request_irq is called
  wifi: ath12k: add CE and ext IRQ flag to indicate irq_handler
  wifi: ath12k: use ATH12K_PCI_IRQ_DP_OFFSET for DP IRQ
  wifi: ath12k: refactor multiple MSI vector implementation
  wifi: ath12k: add support one MSI vector
  wifi: ath12k: do not restore ASPM in case of single MSI vector
  wifi: ath12k: set IRQ affinity to CPU0 in case of one MSI vector

 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/mhi.c  |  16 ++-
 drivers/net/wireless/ath/ath12k/pci.c  | 180 +++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/pci.h  |   2 +
 4 files changed, 172 insertions(+), 28 deletions(-)


base-commit: 9a36440d929d134c56030a8492405708a143f580
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
