Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A26D2F7E1
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 03:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2GHgVg/3zq8bX7NDyb+J1q4oiSCPQ9ILV8FM+pjKgw=; b=Rjfjjtg76jHx8QmE+kumpOQpu3
	d3JoZwUbhD72zduYyJ1Vi1ya+oucAxdVQxS72o230JTgXDcjeezQ6CVjC1ClMn+m+MvxKv6RbXE82
	Xm3tF8zJEP4nEdAHkxlrMNDb3/FGEzYZHa3lvvoSFNFElWnVYZwYP1qU9F4uvcDz2LUy9hA3UF9wT
	ygHFVqmEP7UdRk+S3rF0tFBt7Ndx10fUWIVJeuuCJoxzANpREXZWUaMPurjWIVvygzaD0drM5Q02w
	HWa5/8yu4NmfJhYS3hdYjtH8xatKI/BtllxP8AN4dQkcqCct167j0tvRby+4WBuCB1bVQrnKjJt60
	vssZdrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GvY-0000000DdOZ-2QeI
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 03:11:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GvT-0000000DdL7-2cd6
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 03:11:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GJUTtF011294;
	Thu, 17 Oct 2024 03:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2GHgVg/3zq8bX7NDyb+J1q4oiSCPQ9ILV8FM+pjKgw=; b=oMPQXKRtlZHnZ8Kh
	SZsQa2nAZYlyB2Jzh3snQ5SciVv5u/L58k0mrjDIyYQd1CIdQJ1P03p5X9ESiyD0
	oY5Pd8E8mNnSHnB1yjJXQqjgDb3C7f9S61vYHn6Shr9iYTWPADj56TiW57tJhmhW
	uSwwky4DyNzRClbO7bITIE6gRQkqY+BPqsX1eaIyIti6zi/IAu6XqgNa+Tl+BmR1
	Ax5r39YPMXoU3k50N3fW4wy/UUZG/IDIbDAfYke5GEHF5tEDF2vToqUYfA5vMMTb
	aiCZnj5+ofPyKo+8Q2xxKl8ukDCAJoZRCm+ZTkAC+C4z/KK0gLpscyDqeTITyo36
	aDDseA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5jje9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 03:11:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H3BUM0025706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 03:11:30 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 20:11:29 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 05/11] wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
Date: Thu, 17 Oct 2024 11:10:50 +0800
Message-ID: <20241017031056.1714-6-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241017031056.1714-1-quic_kangyang@quicinc.com>
References: <20241017031056.1714-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LJ9EBdnRi4A-2DXq7lkva3HC2RWeSZTn
X-Proofpoint-GUID: LJ9EBdnRi4A-2DXq7lkva3HC2RWeSZTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=811 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_201147_870189_F549E18A 
X-CRM114-Status: GOOD (  11.16  )
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

Current struct hal_rx_phyrx_rssi_legacy_info in hal_rx.h is not matched
with hardware descriptor definition.

So update this structure and related code.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 25 ++++++------------------
 drivers/net/wireless/ath/ath12k/hal_rx.h |  9 ++++++---
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 86796efe5acd..0232fe49764c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -734,33 +734,20 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 	case HAL_PHYRX_RSSI_LEGACY: {
 		struct hal_rx_phyrx_rssi_legacy_info *rssi =
 			(struct hal_rx_phyrx_rssi_legacy_info *)tlv_data;
-		u32 reception_type = 0;
-		u32 rssi_legacy_info = __le32_to_cpu(rssi->rsvd[0]);
 
 		info[0] = __le32_to_cpu(rssi->info0);
+		info[1] = __le32_to_cpu(rssi->info1);
 
 		/* TODO: Please note that the combined rssi will not be accurate
 		 * in MU case. Rssi in MU needs to be retrieved from
 		 * PHYRX_OTHER_RECEIVE_INFO TLV.
 		 */
 		ppdu_info->rssi_comb =
-			u32_get_bits(info[0],
-				     HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RSSI_COMB);
-		reception_type =
-			u32_get_bits(rssi_legacy_info,
-				     HAL_RX_PHYRX_RSSI_LEGACY_INFO_RSVD1_RECEPTION);
-
-		switch (reception_type) {
-		case HAL_RECEPTION_TYPE_ULOFMDA:
-			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_OFDMA;
-			break;
-		case HAL_RECEPTION_TYPE_ULMIMO:
-			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_MIMO;
-			break;
-		default:
-			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
-			break;
-		}
+			u32_get_bits(info[1],
+				     HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB);
+
+		ppdu_info->bw = u32_get_bits(info[0],
+					     HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RX_BW);
 		break;
 	}
 	case HAL_RXPCU_PPDU_END_INFO: {
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 6ab33d5f1b2a..c69df852ae69 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -441,12 +441,15 @@ enum hal_rx_ul_reception_type {
 	HAL_RECEPTION_TYPE_FRAMELESS
 };
 
-#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RSSI_COMB	GENMASK(15, 8)
-#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_RSVD1_RECEPTION   GENMASK(3, 0)
+#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RECEPTION	GENMASK(3, 0)
+#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RX_BW	GENMASK(7, 5)
+#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB	GENMASK(15, 8)
 
 struct hal_rx_phyrx_rssi_legacy_info {
-	__le32 rsvd[35];
 	__le32 info0;
+	__le32 rsvd0[39];
+	__le32 info1;
+	__le32 rsvd1;
 } __packed;
 
 #define HAL_RX_MPDU_START_INFO0_PPDU_ID	GENMASK(31, 16)
-- 
2.34.1


