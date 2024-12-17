Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C353E7716A
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CSMKATEnJDEq+oGOoz53hRSKx54/2Cc0PKj6ZT+MT7E=; b=LwfewlcWLCFg8iwGt0axSmGgyz
	c8dumzgTknD/+SIqgxwamAOhxb7HOrw+yg+7AByAkYJL0kX4+NDAkmji194C5VWJOZ5hXkT+xnR0f
	lRHmN/YWd7BSNTHyZBpiMLewRaUeFxkmH3Dgc2yHcjnIy9DCUqv+2UE2eHgFqmghYqBIZmWkAQrxJ
	BPuN0vh5uL6Smu0W92Ns8/ExPd+73LnLemrmFpJvQjQNq8rAThGBF+VYHX+d5OhbUM74Pk1VnE4OX
	7NDH/9V4gDGpYC07ciEF2QBFAHwPpqOpyTIn5fss+a3no6MxDSa0NgWABnVsbumJeo9Ew/VMUSVWC
	U5zLmCww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUUv-0000000D3ig-3feF
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 10:08:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUEc-0000000D02O-2bJK
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 09:51:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH82RAa002824;
	Tue, 17 Dec 2024 09:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CSMKATEnJDEq+oGOoz53hR
	SKx54/2Cc0PKj6ZT+MT7E=; b=L2w1spie2OmPsbbSwKAqxTinNo2PS8tLqZFNLv
	AeJ3Jf+Ph0dmzqc/V4DxrDedsiZ9hxACg0opMPd1NFIF7S4yjZv6XB/HWrWTPSjS
	Py2btRXjN6Rl97YNht5+Hir8v/pwZ0dxlAu+wzmVJ/SpvmHjitgeysTnD17GOgbC
	X1ahDy9nZmeWQtkrOq96EVsABjoDOOUYeHHs4aegqaClLKEtal+8pJ6MvsfvW/LR
	8l/ZDiN1yKrMXw5TL6u/aZsl4mgAUmB8vUKFz+cGFiZpFRJLn4jIZ63dtYR4Bq4q
	bdI595jibjAAjMmn8pqdL9Wss5cx+NyecTLh/5++wH/atd8g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k5ek09sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:51:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9pLNj020421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:51:21 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:51:19 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: Add support for parsing 64-bit TLVs
Date: Tue, 17 Dec 2024 15:20:58 +0530
Message-ID: <20241217095058.2725755-1-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3QHy-VFDk_cSNGt3Tf9o-5OI0LLAVmGo
X-Proofpoint-ORIG-GUID: 3QHy-VFDk_cSNGt3Tf9o-5OI0LLAVmGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_015122_662192_865831C4 
X-CRM114-Status: GOOD (  13.53  )
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

There is mismatch between the format of monitor destination TLVs received
and the expected format by the current implementation. The received TLVs
are in 64-bit format, while the implementation is designed to handle
32-bit TLVs. This leads to incorrect parsing. Fix it by adding support
for parsing 64-bit TLVs.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
v2:
	- Updated Tested-on tag for WCN7850.
	- Rebased to the TOT.
---
 drivers/net/wireless/ath/ath12k/dp_mon.c   | 14 +++++++-------
 drivers/net/wireless/ath/ath12k/hal_desc.h |  2 ++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 2d53404095d6..c6cc4a1a5230 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1205,19 +1205,19 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k_base *ab, struct ath12k_mon_data *pmon
 			    struct sk_buff *skb)
 {
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
-	struct hal_tlv_hdr *tlv;
+	struct hal_tlv_64_hdr *tlv;
 	enum hal_rx_mon_status hal_status;
-	u32 tlv_userid = 0;
+	u32 tlv_userid;
 	u16 tlv_tag, tlv_len;
 	u8 *ptr = skb->data;
 
 	memset(ppdu_info, 0, sizeof(struct hal_rx_mon_ppdu_info));
 
 	do {
-		tlv = (struct hal_tlv_hdr *)ptr;
-		tlv_tag = le32_get_bits(tlv->tl, HAL_TLV_HDR_TAG);
-		tlv_len = le32_get_bits(tlv->tl, HAL_TLV_HDR_LEN);
-		tlv_userid = le32_get_bits(tlv->tl, HAL_TLV_USR_ID);
+		tlv = (struct hal_tlv_64_hdr *)ptr;
+		tlv_tag = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_TAG);
+		tlv_len = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_LEN);
+		tlv_userid = le64_get_bits(tlv->tl, HAL_TLV_64_USR_ID);
 		ptr += sizeof(*tlv);
 
 		/* The actual length of PPDU_END is the combined length of many PHY
@@ -1232,7 +1232,7 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k_base *ab, struct ath12k_mon_data *pmon
 		hal_status = ath12k_dp_mon_rx_parse_status_tlv(ab, pmon,
 							       tlv_tag, ptr, tlv_userid);
 		ptr += tlv_len;
-		ptr = PTR_ALIGN(ptr, HAL_TLV_ALIGN);
+		ptr = PTR_ALIGN(ptr, HAL_TLV_64_ALIGN);
 
 		if ((ptr - skb->data) >= DP_RX_BUFFER_SIZE)
 			break;
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index a460d432288f..b90a6da72e29 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -579,6 +579,8 @@ struct hal_tlv_hdr {
 
 #define HAL_TLV_64_HDR_TAG		GENMASK(9, 1)
 #define HAL_TLV_64_HDR_LEN		GENMASK(21, 10)
+#define HAL_TLV_64_USR_ID		GENMASK(31, 26)
+#define HAL_TLV_64_ALIGN		8
 
 struct hal_tlv_64_hdr {
 	__le64 tl;

base-commit: 9a448415ed0c46edeb9170091a03b620986ca0b2
-- 
2.34.1


