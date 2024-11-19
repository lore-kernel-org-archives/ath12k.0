Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A18D60D03
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 00:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SRWvw5/ph/RzPFvkOTfbCXZUVWA6GS6nyUnGFKn/pU=; b=KeGiyGl1hyCYkwgPMQRtvN9k4Y
	RmjMGfRpfZxo13oMs7OQDpbfcFYIJYZr6o+ATUSuPtw9o6HAHULZlDVVu/rQgwhqVklX4VomELahG
	jkfIXZ1BiBz/gZDDpPg1u+TJMEJ4eBValdX4gJnQkgnxaSv1a2bDlNKhvoXI3wzA5vpmd8LkFykb6
	ars/ujhUPr6hX2Q+owJHB8ZWH4HqIwl01Jmt8qzdg3prTi0LaKB+VqycwvMYeZhOw7J0DfoWQe9SV
	OEH40xiYvtJIxXXFCgVIfjcabOwUMtSD+gwHh2zCJoOWAVkGolRzEYBQ28W31sgZyroSCt3XAzr2Y
	meyW+Bgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCBB-0000000AxI1-17Yu
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 00:33:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCB7-0000000AxGl-2Dij
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 00:33:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGHW31031135;
	Tue, 19 Nov 2024 00:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SRWvw5/ph/RzPFvkOTfbCXZUVWA6GS6nyUnGFKn/pU=; b=L6B3jOl/T3fihkOk
	dFZpd3Y2KZCf/9/0H7QZR3QvMP5A7oF4EYS94tMQbV6iAbg+iwI1Fv6df8fyBVn5
	1uNTZMXfT/SYmcqqtfT0IQNPMKl7dP4NdgM70fTx3Qe4QqzXvr2f+Ue/iHYMEu6b
	DsP4WWBRCpO4ieAv7rfxBRXTS7vwwQlH9XoQuekCe8Q1LS8eWd7pNcHnS3oAuJml
	weP6MxpOwf+tkMrYcXYRtLnj3jlIksGku1+WPvbiH5FYzvmTC0FMa9HzQUFb136W
	s4hw+N+rNDpHBsS7Ht2yL740IZRfsr4awj0S4UFJofFAGPK4ofBzzxDKFgLxoau0
	famKRw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y68y7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 00:33:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ0XCxg020655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 00:33:12 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 16:33:10 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 4/8] wifi: ath12k: Fix the misspelled of hal TLV tag HAL_PHYRX_GENERICHT_SIG
Date: Tue, 19 Nov 2024 06:02:44 +0530
Message-ID: <20241119003248.1579567-5-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
References: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hgw7ASeJKAqkoj1LYkS_xlye2ZK4LVr1
X-Proofpoint-GUID: hgw7ASeJKAqkoj1LYkS_xlye2ZK4LVr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=901 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_163313_567832_E7053C0C 
X-CRM114-Status: GOOD (  11.44  )
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
---
 drivers/net/wireless/ath/ath12k/hal_desc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 739f73370015..76d4bb8690ea 100644
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


