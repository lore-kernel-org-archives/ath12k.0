Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9F6E77187
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlOridicIQSadBz6wvX5B6TsvxBXtK6+n6R4OEhmlE8=; b=LGwgkmPc1xhA5zUsIvS1r75bw+
	70PZAQaYeJDQ7BEOXjFn0WoWsd2uaqxy87K+cH89a+myeD1elMoea44zq4MGecrgl8jPn5599dbmZ
	hcxZdh/df1UPhw1gOvy5mT5pDyGy9TWtORRhOPuoVMioL+HUHizi5kiGqtk05dsrHlWFC6Mp/gSXQ
	CKZtwR2YOKPAl3irs2kAYkyekbcSTkMDXWkny+vLovHYPVSe6Rh6NOJe7Tdp05ifnU6v5GPaOiDEH
	s6cQGBHw1Sv3AsDImLbanL+LQha8Rp1JkRiyHyBjI1YdWssErfZmpsGWfs2AmW4toCJb6PRrQeUdK
	deQewCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTJ7-0000000CmIg-3MUe
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 08:51:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTCx-0000000CkkC-2BXE
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 08:45:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH57eUt016391;
	Tue, 17 Dec 2024 08:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlOridicIQSadBz6wvX5B6TsvxBXtK6+n6R4OEhmlE8=; b=RyptWDFce31j8Sxu
	yCN6N5u/FbjBsYWsd+LcDdJCx1klcjG6YiyOrg3OU5x6XfZWKZaeTZ60VYS1my5X
	/Rvm9gPhOvAFdau074X0fFJy1WO0+kMd6d2FbuBfb4cEwNu9FCDoVE6Qim8Gve3Y
	oiJikdG8wqUEdK2HLNPpgmtuRpL2FwurPJeLuHHudPJk6Gkl1wSYZ5NdB7s7xCLB
	cx5HvJMmZlXS9661yAo7wWo7qZMhdO3YXaHzMTu1YN1J7jTfkwfOTed6E6SKBuKM
	3FaFhIE9iQrjpuQIZMuvv34Kc8+x9Tf2eiROPauwhT1rMMFyRlHg2QHanjsQKY8Z
	IhCC8A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2vnggu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH8jYGT024970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:34 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 00:45:32 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3 4/8] wifi: ath12k: Fix the misspelled of hal TLV tag HAL_PHYRX_GENERICHT_SIG
Date: Tue, 17 Dec 2024 14:15:07 +0530
Message-ID: <20241217084511.2981515-5-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bTYmDgKqef8Rt4XKZfj1dyOFfiYzfjkA
X-Proofpoint-ORIG-GUID: bTYmDgKqef8Rt4XKZfj1dyOFfiYzfjkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=903 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004535_560963_72D87471 
X-CRM114-Status: GOOD (  11.19  )
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

There is "HAL_PHYRX_GENERICHT_SIG" misspelled as
"HAL_PHYRX_GENERIC_EHT_SIG" in the comments. Fix the spelling.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal_desc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index a460d432288f..51c145ea8161 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -522,7 +522,7 @@ enum hal_tlv_tag {
 	HAL_PHYRXHT_SIG_USR_SU					= 468 /* 0x1d4 */,
 	HAL_PHYRXHT_SIG_USR_MU_MIMO				= 469 /* 0x1d5 */,
 	HAL_PHYRX_GENERIC_U_SIG					= 470 /* 0x1d6 */,
-	HAL_PHYRX_GENERICHT_SIG					= 471 /* 0x1d7 */,
+	HAL_PHYRX_GENERIC_EHT_SIG				= 471 /* 0x1d7 */,
 	HAL_OVERWRITE_RESP_START				= 472 /* 0x1d8 */,
 	HAL_OVERWRITE_RESP_PREAMBLE_INFO			= 473 /* 0x1d9 */,
 	HAL_OVERWRITE_RESP_FRAME_INFO				= 474 /* 0x1da */,
-- 
2.34.1


