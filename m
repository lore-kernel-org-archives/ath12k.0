Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8102CED275
	for <ath12k@archiver.kernel.org>; Tue,  8 Oct 2024 07:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj2TmsvwY5VAlr11Kigu3B3FpmDV/T9tNtvJbzj9U/A=; b=JRDpzQ/tAoH7YP0lesD8RaVavp
	IXZQAcQmjsfFO7QEWsYVJb5n8uwJJueyr0ipV+GdqgtZthxEhpuH/9Te33HmqD97/pnIJ+YweGHWd
	7/tzbjl99cuGDmmnEqTSwUDmIW1OCnQP4+Ur88YKmi/vVl4TUgqsp5aOqxvfAvSZPK7lPKyu+ZDGH
	JLtZUxlcjJ8P0CKgFPkDR94QNxCOmvZWfJ3wodHC3+KspHftW9I5QW1e5AKR+xvMe+sWw3Pv0cWSr
	Wng1ZyaZxT7k5yFP7M2yQkv1/aU2Vr2buq61oBvPb1WP80L6VdrZAQyZMX0LR4pIMGHBCen8lcfUS
	UptrFZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4yM-00000004ryF-2GRY
	for ath12k@archiver.kernel.org;
	Tue, 08 Oct 2024 07:49:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4lH-00000004ofQ-0rvp
	for ath12k@lists.infradead.org;
	Tue, 08 Oct 2024 07:36:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497JxEZ0028604;
	Tue, 8 Oct 2024 07:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fj2TmsvwY5VAlr11Kigu3B3FpmDV/T9tNtvJbzj9U/A=; b=KjCxxkz8zXxPeqf3
	Ed5X6l3y4pGlwLYVRjUpiZ5GB5+UrQFdW2x0osGYrnzJxH8SJAR8lTpan/aXt5Zc
	giItKBT64yN4n/uJCBRYrI1qjxzuqSyINeuHYVpQ8SF3E93xmC5WZoKxAqGD2mHI
	cj4PQeSFC/IGrR+gPEZOgfFkr0ImcvhkUqhA2VPTWg95zqZLwXHjNDdNZ4BhYe98
	TcoJwuWqMmxtqrz8fInh0dQt9Md/XfQv/rryV4KCjD+9iyRtXheCJY0PAZtSULV2
	PKC9k1Ueq94nH/Fhqi1wK7HZspfWc/pvDFkENdFh+C0NEEC/8WRT22QpYtuFCg/s
	zxz0/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs4ehye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 07:36:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4987a0e4012680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 07:36:00 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Oct 2024 00:35:59 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 01/11] wifi: ath12k: remove unused variable monitor_present
Date: Tue, 8 Oct 2024 15:35:24 +0800
Message-ID: <20241008073534.1195-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241008073534.1195-1-quic_kangyang@quicinc.com>
References: <20241008073534.1195-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5MHF1o1zSGZnhk7KoCpgQUyotp-HNqi4
X-Proofpoint-GUID: 5MHF1o1zSGZnhk7KoCpgQUyotp-HNqi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=802
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410080048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003603_385204_0AE1A87B 
X-CRM114-Status: GOOD (  10.43  )
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

Variable monitor_present is never used. So delete it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7f2e9a9b4097..a048cba83112 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -561,7 +561,6 @@ struct ath12k {
 	u32 chan_tx_pwr;
 	u32 num_stations;
 	u32 max_num_stations;
-	bool monitor_present;
 	/* To synchronize concurrent synchronous mac80211 callback operations,
 	 * concurrent debugfs configuration and concurrent FW statistics events.
 	 */
-- 
2.34.1


