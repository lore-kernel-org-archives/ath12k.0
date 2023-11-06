Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A7DC4167D
	for <ath12k@archiver.kernel.org>; Mon,  6 Nov 2023 18:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QiJFzRiR+Mh/MKs0Wi9b7zf+oAoJTRSFjnBDHqHT80=; b=Oe9VmCfGXXEDwP
	AT06NFx4c+Xrv6qRDu98fRdWin11R+7UGgnMUe9rSTjUA3ujiKby5emlM45U2CFk6FVTI0gU61HRp
	AWNNf/jKxCAaDTR/gAU3qv9PHolGAurTItuE9UnJg3M7Lqkf/BMZNpus+PPEOe8UHYrS4G7+W+5Uf
	c3mZ0czf5LpDT0xSCaMvCLdQnkCsUAOLDQCRBeXaHVlf3YMVTTq3PooylbRAnYsBq2bw/QjVgBMiK
	T4Vu0STreGJbenwm0y9u9aRxVuhqhe+5Enml/0UUFsKlo+bpMuvvJ1VL2o6vllgAEBIZAUSarc+dM
	Z1AT1sPeHUNU7l/+Tnrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Dr-00HJBA-25
	for ath12k@archiver.kernel.org;
	Mon, 06 Nov 2023 18:21:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Do-00HJ9L-1N;
	Mon, 06 Nov 2023 18:21:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A6GvrbE026671;
	Mon, 6 Nov 2023 18:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=AA5O2SCvUm9mfQBN4CAXYP/QY4STb+gr3WQyrPEczG8=;
 b=D7MfIvHwOsfJWhGClYEzy+ypr+bbNzgh7lgpg2XAD/TP9tVqupUBqQ5boIpamasdcD2Q
 Lthq/konhgC51RhE4xlthwS6qxLX1OExiuH+DUqx4MrBlHtVNafdAKcmfar4houfMHcS
 6p/R42ybUSkY4ygH3CpnI//xI3T8A1ASCzOt+YCXFrDZzORrDsfLbcVqdzI5NT/ZaUBB
 TIfJpTaG8lbNPsIw03mEpKOa9cR61P7riZGgRfNF9cAFL0ks9BHbdQazfq5ZlWnCBsa7
 stjyOA8l4OdgMWUy0yQlu8jS57B6JjmIsGXL2QsJ5i40qLV4K+x0mY3nL8R6WmreCLoN hw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u5efyn3tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Nov 2023 18:21:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6IL5LB012649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Nov 2023 18:21:05 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 10:21:05 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 6 Nov 2023 10:21:05 -0800
Subject: [PATCH 2/2] wifi: ath12k: Remove struct ath12k::ops
MIME-Version: 1.0
Message-ID: <20231106-ath12k-remove-ieee80211_ops-v1-2-d72cef1a855b@quicinc.com>
References: <20231106-ath12k-remove-ieee80211_ops-v1-0-d72cef1a855b@quicinc.com>
In-Reply-To: <20231106-ath12k-remove-ieee80211_ops-v1-0-d72cef1a855b@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qj7TBQjdYMMaxBubdRIegKMRt751ls1E
X-Proofpoint-ORIG-GUID: Qj7TBQjdYMMaxBubdRIegKMRt751ls1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_13,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=484 priorityscore=1501 malwarescore=0 mlxscore=0 clxscore=1015
 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_102112_468511_649AB755 
X-CRM114-Status: GOOD (  16.12  )
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

Currently struct ath12k defines the following member:
	struct ieee80211_ops *ops;

This is being flagged by checkpatch.pl:
WARNING: struct ieee80211_ops should normally be const

The original plan was to add the const qualifier.  However, it turns
out this is actually unused, so remove it.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 68c42ca44fcb..6dbe817d2ec7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_CORE_H
@@ -467,7 +467,6 @@ struct ath12k {
 	struct ath12k_base *ab;
 	struct ath12k_pdev *pdev;
 	struct ieee80211_hw *hw;
-	struct ieee80211_ops *ops;
 	struct ath12k_wmi_pdev *wmi;
 	struct ath12k_pdev_dp dp;
 	u8 mac_addr[ETH_ALEN];

-- 
2.42.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
