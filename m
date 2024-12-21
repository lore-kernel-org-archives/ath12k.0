Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01816E7718B
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 04:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3ZiofJ2dnGX7tvQTk3m4WNnc2CRugeREMSa4Wb6MGc=; b=enNyHYD3XkrPYO67GKntEzl1kq
	3oqCX655mC0c8Ce2nACcY6wlsGNfgxh3aYONy7oW3r79RyntDUkwaKuORjIzWjJ6/5M7e5WtwUDU4
	FQHZtkDz6jyC4Yi5WkDqsEvuhYBv50C/FUvxIf8cjDtTuDPp3j7oJ+6idH+3zW8xXsCuZI7pMVhPY
	uGActCWRD2zTAbwqzdLQ6N6tIc99qG4V6n9ZcQ8EM+E/8o6rXW/MZxErrCddQ4x/MzNEKsEBRLkVF
	QORHhvSCEopGGIR12Bf+M451sqv6NJJdkiwxJPe+FrTOl8Ma0bUTUFmbux2nuCqOM768sy4peLSym
	YY4XrZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr9C-00000006XZ7-334K
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 04:31:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr99-00000006XXM-3d8V
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 04:31:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLh7M5012513;
	Sat, 21 Dec 2024 04:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3ZiofJ2dnGX7tvQTk3m4WNnc2CRugeREMSa4Wb6MGc=; b=P6b6uHG5H/oh44+0
	EV5tmiH8I8gGnL+uzJ0b7WayDQmz6bbDdsEw3+k5EPsCTKv8+JRsrnzr8zWyAl2K
	6r2yrOufKg5xNq/2J61hHZDe1tYr1t7/mzFviUB3OjwITOv8yfBR01cf+Fi2a5Mz
	tqgZUEUB6edr5LnMKqbUaVwKpS6uUlcfPHqV0eirNs2WYHaA4KKg7DnSl098DQDM
	Kva85han9ks4j4zUQdGlxNEEtVFenKG/fLpJtCABo5MiXjfWeqgPAmKn1yWsWRR8
	R3d80lxvDlb5ryqxJcR5sO4x4kt1UaZan98jl+ij7uOxmIGVQ51uGDHZLJd4Tm0i
	9kEE7g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ngr08nmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL4VMeK016820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:22 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 20:31:21 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 08/14] wifi: ath12k: Add drop descriptor handling for monitor ring
Date: Sat, 21 Dec 2024 10:00:08 +0530
Message-ID: <20241221043014.1252841-9-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
References: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oJX0eqnn8bRk6Ozmkti0bBxPfeNxArIY
X-Proofpoint-GUID: oJX0eqnn8bRk6Ozmkti0bBxPfeNxArIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412210035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_203123_917693_72B66FD2 
X-CRM114-Status: GOOD (  11.10  )
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

When monitor block in Hardware experiences internal backpressure, a ring
entry with the EMPTY_DESC reason is received in the monitor destination
ring descriptor. The cookie field for this corresponding entry is invalid.
Currently driver attempts to process this cookie resulting in invalid
buf_id warning logs flooding the console. To fix this, skip processing the
destination descriptor when the EMPTY_DESCRIPTOR bit is set to true in ring
descriptor, thereby avoiding the processing of junk cookies.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 236456b02198..bf43ef2b6b39 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2347,6 +2347,14 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 		if (unlikely(!mon_dst_desc))
 			break;
 
+		/* In case of empty descriptor, the cookie in the ring descriptor
+		 * is invalid. Therefore, this entry is skipped, and ring processing
+		 * continues.
+		 */
+		info0 = le32_to_cpu(mon_dst_desc->info0);
+		if (u32_get_bits(info0, HAL_MON_DEST_INFO0_EMPTY_DESC))
+			goto move_next;
+
 		cookie = le32_to_cpu(mon_dst_desc->cookie);
 		buf_id = u32_get_bits(cookie, DP_RXDMA_BUF_COOKIE_BUF_ID);
 
-- 
2.34.1


