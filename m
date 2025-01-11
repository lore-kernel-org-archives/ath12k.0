Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BCCE7719D
	for <ath12k@archiver.kernel.org>; Sat, 11 Jan 2025 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RklWO5Rk5L8QG6MeLKOQi9uc1TUGy3GbcKVzBO8B++8=; b=VaeXCTflWfewxqwGYYWQ0oWldE
	7CGOo1y88WPWpf1/iY4zys7wdRdouDC7bVeFbNZ8NzorK7iQ1OOY4+JM4K2VScpoaDWndnkyDY3nu
	ZCJ84Mb9sG4YKVtWFPVTYdvDYkJR5fRsmdrioMBPe1qJj34N+VW6vz5YwZsiD7iKJKjitLuEh2Jxu
	WE9tSR8dOs72cQGUX4Deq63QiRMgvGHBUJMlEnITH1NlmJrJbZkrgGsgugrQ7ugxsKHlroKrOCAUu
	haDIocKOLpMgHNpz2CpNMWgL9XoP43s9VWwvSbyzbYiUhVndQVI73xv3JMsjXN+PMwxmhpRfVZh+o
	rfY3nmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWXNX-00000000T5E-3aNn
	for ath12k@archiver.kernel.org;
	Sat, 11 Jan 2025 09:01:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWXNV-00000000T4L-2YjQ
	for ath12k@lists.infradead.org;
	Sat, 11 Jan 2025 09:01:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50B7XaqU022931;
	Sat, 11 Jan 2025 09:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RklWO5Rk5L8QG6MeLKOQi9uc1TUGy3GbcKVzBO8B++8=; b=diL7WCr4AR/kSX/C
	CbT5G5yR4ZIxVsbsBdYzU5IWA8+6NUIesoFJHmqDp4peO1t6zlDjUnUmkW95Ejub
	hDaoLl8Zf6j4c105io7ong1CBB3NB6DC85fSVK4HQDzv52hnItP0jRDjPHACOUbv
	DGqNTqlA22rP5S5U4okxNTpBhtZ9nYibW3w6TaP8ovY5c2Yy7b6E90d99M0HP+XZ
	JmiK32P2rqdmJ5JTa7P+NL3NeNPoYXd3idBEniPHCDnN4+fwyadO9MltnETT2yU0
	/rb3lwOvldY0xvAOO33hTXTAL2eisVjteHePG82L6SaSAnOaqcer7BHLxeoEKean
	L0Jr5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hj2ra4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 09:01:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50B91uj5010852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 09:01:56 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 11 Jan 2025 01:01:54 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH v3 1/4] wifi: ath12k: Refactor ath12k_hw set helper function argument
Date: Sat, 11 Jan 2025 14:31:26 +0530
Message-ID: <20250111090129.2733338-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250111090129.2733338-1-quic_periyasa@quicinc.com>
References: <20250111090129.2733338-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nPGdcMl_MNvekOhy9VkQDeF_6cmR3suR
X-Proofpoint-ORIG-GUID: nPGdcMl_MNvekOhy9VkQDeF_6cmR3suR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 mlxlogscore=838 adultscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501110077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_010157_651065_79C77D45 
X-CRM114-Status: GOOD (  12.83  )
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

Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
ath12k_hw set helper function takes the device handle and the index as
parameters. Here, the index parameter is specific to the group handle.
Therefore, change this helper function argument from the device handle to
the group handle.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 4 ++--
 drivers/net/wireless/ath/ath12k/mac.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3dd01ad100c5..9eb4eb410af2 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1199,10 +1199,10 @@ static inline struct ath12k_hw *ath12k_ab_to_ah(struct ath12k_base *ab, int idx)
 	return ab->ag->ah[idx];
 }
 
-static inline void ath12k_ab_set_ah(struct ath12k_base *ab, int idx,
+static inline void ath12k_ag_set_ah(struct ath12k_hw_group *ag, int idx,
 				    struct ath12k_hw *ah)
 {
-	ab->ag->ah[idx] = ah;
+	ag->ah[idx] = ah;
 }
 
 static inline int ath12k_get_num_hw(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 48d110e2a7de..6a7a01c35f02 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11362,7 +11362,7 @@ void ath12k_mac_destroy(struct ath12k_hw_group *ag)
 			continue;
 
 		ath12k_mac_hw_destroy(ah);
-		ath12k_ab_set_ah(ab, i, NULL);
+		ath12k_ag_set_ah(ag, i, NULL);
 	}
 }
 
@@ -11443,7 +11443,7 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 			continue;
 
 		ath12k_mac_hw_destroy(ah);
-		ath12k_ab_set_ah(ab, i, NULL);
+		ath12k_ag_set_ah(ag, i, NULL);
 	}
 
 	return ret;
-- 
2.34.1


