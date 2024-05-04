Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE8DC4345F
	for <ath12k@archiver.kernel.org>; Sat,  4 May 2024 18:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQ3tnX+75vTgmYSyUjYSSaDUcN+jsqorsHs+cJ8ibME=; b=HMyquxvzEjGUtdD8Fg3EVAeNA8
	OMPJy1mBt8MvcswDLro7UUssQhOkpfHLwMt1WBzPgaEpKnzz2XJxiUzAYeEMYqNvHYEHGWOH16d58
	T2Qf1CajNxG+i7OAo2LGq/MKrNCQz0RtQ85nZ1llb8/ZLssf09mzRFNKroBFD84qK4/GnSrncFMMI
	ZY+00aJdYSy009UHJIcJ4WssWZECJI5Mh5uLme5GLjKjkPoSlpAvHelzO5/V+2Ltok9c1uOkYLjSH
	Ze84FO2vLdYlIM6V0TNzBYAFHqf6CMDNhl1rEARrIcSEjXiYYI0fQDLswf0jGGtMbkPXXTzrVFanp
	eKOjJK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3KUl-00000002faT-1Cld
	for ath12k@archiver.kernel.org;
	Sat, 04 May 2024 18:52:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3KUh-00000002fYs-4BDf;
	Sat, 04 May 2024 18:52:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 444I6OQ3030618;
	Sat, 4 May 2024 18:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=aQ3tnX+75vTgmYSyUjYSSaDUcN+jsqorsHs+cJ8ibME
	=; b=FL16nOVewSvofFsDbWp0oyqmFeKw9iuVA+iby8HY9kSo9PVc8TR+8ccYz3Q
	SogMZ1XTIIVLu2ahnTxiFBGqjA/kEvUWN8cd+644pOnjj+ec0p/1kqpBLrgfocMG
	dNZl/IzM9kMHgn/4ycCJqlTpnFm6VW/aQjHnaJgqRmatLniKSetWBi57cFq7gvyw
	zG/WhU8XupFg5eBpgGz83xBnQaxCqpHj9oHxm7wbmwK2d+/VPaCHcvQnGttir1os
	SCj43CFDJd3/4oLfhsTk7OX6ZvlXM+/8PsaNx+/xcegGT0jL/PfhSacaQjTboIUu
	ar68Z/lyi7me3X39enHAI/7Q93g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xwacsh3v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 May 2024 18:52:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 444Iq9ri016627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 May 2024 18:52:09 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 4 May 2024
 11:52:09 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 4 May 2024 11:52:08 -0700
Subject: [PATCH 1/2] wifi: ath12k: initialize 'ret' in
 ath12k_qmi_load_file_target_mem()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240504-qmi_load_file_target_mem-v1-1-069fc44c45eb@quicinc.com>
References: <20240504-qmi_load_file_target_mem-v1-0-069fc44c45eb@quicinc.com>
In-Reply-To: <20240504-qmi_load_file_target_mem-v1-0-069fc44c45eb@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9VDva7YNRO1XcAmbziOHrFRxh8suAnLm
X-Proofpoint-ORIG-GUID: 9VDva7YNRO1XcAmbziOHrFRxh8suAnLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-04_15,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405040127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_115224_263270_BD5A8AD8 
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

smatch flagged the following issue:

drivers/net/wireless/ath/ath12k/qmi.c:2619 ath12k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.

The reality is that 'ret' is initialized in every path through
ath12k_qmi_load_file_target_mem() except one, the case where the input
'len' is 0, and hence the "while (remaining)" loop is never entered.
But to make sure this case is also handled, add an initializer to the
declaration of 'ret'.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 3bb730326a02..f273cb93dedb 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2538,7 +2538,7 @@ static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
 	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
 	const u8 *temp = data;
-	int ret;
+	int ret = 0;
 	u32 remaining = len;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);

-- 
2.42.0


