Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA47D60D03
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 00:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDIDFaY7KExs1xLk46mn4am6YM0P7GmV6uJeS1m6MI4=; b=MZ91Ue6FZrmpP2xnQWZ8AUz3Lk
	CR+wt4b9PuXCOAObTeWTSSRP8lawbDIzLVg8l9ehqnKE2wIEsxE52Zy205tWHKsvTe3Jb6FHVqpha
	2yl+rCPdWsURgTnMMnnMD9kM9mHsJyDfp7QXZH+rUSY2XXjav1dJgjfdFSqk1ThzSN+T3AML3kzu+
	Ye6mv2rxoGX/dLtKSuoAT6G+gy4P+X5GWTA5zfZiWqrTZeitbiUqkVzWqh6x0MyprrqgrLHuePEgm
	95Sd0qkywlJxEUiL2woI0moxXP2121uRSjQA2kU7FBMzVu5t10lGcOsb5/qY8DTPddPocEJOVWqik
	ANPLFNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCBD-0000000AxKc-3hMs
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 00:33:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCBA-0000000AxHl-0wzY
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 00:33:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGe5E004702;
	Tue, 19 Nov 2024 00:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UDIDFaY7KExs1xLk46mn4am6YM0P7GmV6uJeS1m6MI4=; b=dojkb6UhELbv8o5t
	cUr2vSpD/ccAfd9CyJR4zqMvc+kNqpgIOQTPfUsG1i4Vh9Rh44R202G9cJWL4R4y
	eSjeayJWX15tQV7yJxUp17MsxnpISD2Y+9/jEcOUOxDGYGvdMEGSMj2zOI1shI9K
	aCCLa1Z2q3GFa9KpEAPOHJWy2+aC8z1MIEgRLZEnF6Z+vcPOKyZzgjsD6/fQtbd0
	7tC0JU7n510XoPw+QpfH2Sa08RZAXC6fTjJeMZ982R4dxFbtPEa5vy1hVxzI1U0G
	1bX7qjmClue840R4MCCIfTjfkEGZxS9F/m+/dglR2Y6HkKw4tQSgCufPI+ILY65Y
	rK3oeA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7rxjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 00:33:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ0XE3H012746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 00:33:14 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 16:33:12 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 5/8] wifi: ath12k: fix incorrect TID updation in DP monitor status path
Date: Tue, 19 Nov 2024 06:02:45 +0530
Message-ID: <20241119003248.1579567-6-quic_periyasa@quicinc.com>
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
X-Proofpoint-GUID: qAQQMNozFAVYqIG1gJ4_GtaHqHxYMFhC
X-Proofpoint-ORIG-GUID: qAQQMNozFAVYqIG1gJ4_GtaHqHxYMFhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=629 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_163317_303028_18CC1695 
X-CRM114-Status: GOOD (  11.14  )
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

Currently, an incorrect TID value gets populated in the monitor status Rx
path due to an incorrect bitmap value given to the ffs() built-in helper
function. Therefore, avoid the decrement and directly provide the TID
bitmap to the ffs() built-in helper function for the correct TID update
in the monitor status Rx path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 494984133a91..37127771291f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -617,6 +617,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 	case HAL_RX_PPDU_END_USER_STATS: {
 		struct hal_rx_ppdu_end_user_stats *eu_stats =
 			(struct hal_rx_ppdu_end_user_stats *)tlv_data;
+		u32 tid_bitmap;
 
 		info[0] = __le32_to_cpu(eu_stats->info0);
 		info[1] = __le32_to_cpu(eu_stats->info1);
@@ -629,10 +630,9 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 			u32_get_bits(info[2], HAL_RX_PPDU_END_USER_STATS_INFO2_AST_INDEX);
 		ppdu_info->fc_valid =
 			u32_get_bits(info[1], HAL_RX_PPDU_END_USER_STATS_INFO1_FC_VALID);
-		ppdu_info->tid =
-			ffs(u32_get_bits(info[6],
-					 HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP)
-					 - 1);
+		tid_bitmap = u32_get_bits(info[6],
+					  HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP);
+		ppdu_info->tid = ffs(tid_bitmap) - 1;
 		ppdu_info->tcp_msdu_count =
 			u32_get_bits(info[4],
 				     HAL_RX_PPDU_END_USER_STATS_INFO4_TCP_MSDU_CNT);
-- 
2.34.1


