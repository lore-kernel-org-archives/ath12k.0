Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C74E77189
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=setKTsih72sDG3nkpWqf8oPl5P0wCkwOHniRLGx/SGg=; b=THa45VBUGiQwGQqcKBxINewKDz
	Ldt//plRxvSXFG2GojNuthCbi+zsqy7K9uzsdOzpDw6WyIWJo0kydbTPS0VbvPEiMYiQIxph3nqwC
	w4psJlS+Mn4UzSXRneDf6x3GM76GQ6Ec3lAJWUK4+9oy4GDQBBjTKQ2pUyV7Gr5gYz7qh5VsX6mou
	XxnvBxtB5krky0FkWKwC4HhvV2qe8qjGn9YVLE/Ko5zV8jUAyVLCuLYzteSN3xZ/qQOl+wVpJwlEk
	rmc/mvGiLhUuP+ERdH9XwqK5+wA8RFdSgIaRqQ+eTvnX0wzj2TeajulVtkZgfoPkyFjc3f81Biq5K
	qy523fQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTJ9-0000000CmLB-2dim
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 08:51:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTD7-0000000CknQ-0PzN
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 08:45:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMBhXm019259;
	Tue, 17 Dec 2024 08:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	setKTsih72sDG3nkpWqf8oPl5P0wCkwOHniRLGx/SGg=; b=mCDphq97yn1pyLra
	b5j0YQH9OyPS+xdX8P++mS+NvJHt4BOZ/UCy7LvQI4/iKhV29h0NcoQGqrBo1tOZ
	xXpKOPO7v13orxRUaN00lsrNBfiOYgKPj3MHDH7pUDZM8beXg4EenZlYCkbfTnUr
	SSLXPufPyBhgDJ0VdXPzc89Fd9Z/vYJvK9lueBwYStgWscHv4taAHg+ay0UItEQ9
	rTVBudCo74xQUtUV89lxQzhIGrE6o9ClDmDYwygFJe8+F3RM5c5cGQeIBKWVFWah
	m7g6F3mE6UFdLWGo6/Uev4CtLAEIy2NQQQ8NQO5EOcr7OWruSqmba59OITUCHAYY
	ozH4Ww==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jvs819j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH8jhMK006285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:43 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 00:45:41 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3 8/8] wifi: ath12k: Avoid explicit type cast in monitor status parse handler
Date: Tue, 17 Dec 2024 14:15:11 +0530
Message-ID: <20241217084511.2981515-9-quic_periyasa@quicinc.com>
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
X-Proofpoint-GUID: 5gd8FxlC9qZgEZ2MXqu2I0l38mqJ2Hw1
X-Proofpoint-ORIG-GUID: 5gd8FxlC9qZgEZ2MXqu2I0l38mqJ2Hw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004545_253507_4A4A0C92 
X-CRM114-Status: GOOD (  14.93  )
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

Currently, monitor status parse procedure handles all the supported TLV
tags. Each TLV tag has its own data structure for parsing. Now, this
handler is passed the tlv_data as a u8 pointer, so explicit type cast
conversion happens for every TLV tag parsing. Therefore, avoid the
explicit type conversion by changing the tlv_data type from a u8 pointer
to a const void pointer.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 126 +++++++++--------------
 1 file changed, 47 insertions(+), 79 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 25486917d6b5..784e55b617ad 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -10,11 +10,10 @@
 #include "dp_tx.h"
 #include "peer.h"
 
-static void ath12k_dp_mon_rx_handle_ofdma_info(void *rx_tlv,
-					       struct hal_rx_user_status *rx_user_status)
+static void
+ath12k_dp_mon_rx_handle_ofdma_info(const struct hal_rx_ppdu_end_user_stats *ppdu_end_user,
+				   struct hal_rx_user_status *rx_user_status)
 {
-	struct hal_rx_ppdu_end_user_stats *ppdu_end_user = rx_tlv;
-
 	rx_user_status->ul_ofdma_user_v0_word0 =
 		__le32_to_cpu(ppdu_end_user->usr_resp_ref);
 	rx_user_status->ul_ofdma_user_v0_word1 =
@@ -35,7 +34,7 @@ ath12k_dp_mon_rx_populate_byte_count(const struct hal_rx_ppdu_end_user_stats *st
 }
 
 static void
-ath12k_dp_mon_rx_populate_mu_user_info(void *rx_tlv,
+ath12k_dp_mon_rx_populate_mu_user_info(const struct hal_rx_ppdu_end_user_stats *rx_tlv,
 				       struct hal_rx_mon_ppdu_info *ppdu_info,
 				       struct hal_rx_user_status *rx_user_status)
 {
@@ -73,11 +72,9 @@ ath12k_dp_mon_rx_populate_mu_user_info(void *rx_tlv,
 	ath12k_dp_mon_rx_populate_byte_count(rx_tlv, ppdu_info, rx_user_status);
 }
 
-static void ath12k_dp_mon_parse_vht_sig_a(u8 *tlv_data,
+static void ath12k_dp_mon_parse_vht_sig_a(const struct hal_rx_vht_sig_a_info *vht_sig,
 					  struct hal_rx_mon_ppdu_info *ppdu_info)
 {
-	struct hal_rx_vht_sig_a_info *vht_sig =
-			(struct hal_rx_vht_sig_a_info *)tlv_data;
 	u32 nsts, group_id, info0, info1;
 	u8 gi_setting;
 
@@ -119,11 +116,9 @@ static void ath12k_dp_mon_parse_vht_sig_a(u8 *tlv_data,
 		u32_get_bits(info1, HAL_RX_VHT_SIG_A_INFO_INFO1_SU_MU_CODING);
 }
 
-static void ath12k_dp_mon_parse_ht_sig(u8 *tlv_data,
+static void ath12k_dp_mon_parse_ht_sig(const struct hal_rx_ht_sig_info *ht_sig,
 				       struct hal_rx_mon_ppdu_info *ppdu_info)
 {
-	struct hal_rx_ht_sig_info *ht_sig =
-			(struct hal_rx_ht_sig_info *)tlv_data;
 	u32 info0 = __le32_to_cpu(ht_sig->info0);
 	u32 info1 = __le32_to_cpu(ht_sig->info1);
 
@@ -136,11 +131,9 @@ static void ath12k_dp_mon_parse_ht_sig(u8 *tlv_data,
 	ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
 }
 
-static void ath12k_dp_mon_parse_l_sig_b(u8 *tlv_data,
+static void ath12k_dp_mon_parse_l_sig_b(const struct hal_rx_lsig_b_info *lsigb,
 					struct hal_rx_mon_ppdu_info *ppdu_info)
 {
-	struct hal_rx_lsig_b_info *lsigb =
-			(struct hal_rx_lsig_b_info *)tlv_data;
 	u32 info0 = __le32_to_cpu(lsigb->info0);
 	u8 rate;
 
@@ -170,11 +163,9 @@ static void ath12k_dp_mon_parse_l_sig_b(u8 *tlv_data,
 	ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
 }
 
-static void ath12k_dp_mon_parse_l_sig_a(u8 *tlv_data,
+static void ath12k_dp_mon_parse_l_sig_a(const struct hal_rx_lsig_a_info *lsiga,
 					struct hal_rx_mon_ppdu_info *ppdu_info)
 {
-	struct hal_rx_lsig_a_info *lsiga =
-			(struct hal_rx_lsig_a_info *)tlv_data;
 	u32 info0 = __le32_to_cpu(lsiga->info0);
 	u8 rate;
 
@@ -212,14 +203,13 @@ static void ath12k_dp_mon_parse_l_sig_a(u8 *tlv_data,
 	ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
 }
 
-static void ath12k_dp_mon_parse_he_sig_b2_ofdma(u8 *tlv_data,
-						struct hal_rx_mon_ppdu_info *ppdu_info)
+static void
+ath12k_dp_mon_parse_he_sig_b2_ofdma(const struct hal_rx_he_sig_b2_ofdma_info *ofdma,
+				    struct hal_rx_mon_ppdu_info *ppdu_info)
 {
-	struct hal_rx_he_sig_b2_ofdma_info *he_sig_b2_ofdma =
-			(struct hal_rx_he_sig_b2_ofdma_info *)tlv_data;
 	u32 info0, value;
 
-	info0 = __le32_to_cpu(he_sig_b2_ofdma->info0);
+	info0 = __le32_to_cpu(ofdma->info0);
 
 	ppdu_info->he_data1 |= HE_MCS_KNOWN | HE_DCM_KNOWN | HE_CODING_KNOWN;
 
@@ -250,11 +240,10 @@ static void ath12k_dp_mon_parse_he_sig_b2_ofdma(u8 *tlv_data,
 	ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_OFDMA;
 }
 
-static void ath12k_dp_mon_parse_he_sig_b2_mu(u8 *tlv_data,
-					     struct hal_rx_mon_ppdu_info *ppdu_info)
+static void
+ath12k_dp_mon_parse_he_sig_b2_mu(const struct hal_rx_he_sig_b2_mu_info *he_sig_b2_mu,
+				 struct hal_rx_mon_ppdu_info *ppdu_info)
 {
-	struct hal_rx_he_sig_b2_mu_info *he_sig_b2_mu =
-			(struct hal_rx_he_sig_b2_mu_info *)tlv_data;
 	u32 info0, value;
 
 	info0 = __le32_to_cpu(he_sig_b2_mu->info0);
@@ -277,11 +266,10 @@ static void ath12k_dp_mon_parse_he_sig_b2_mu(u8 *tlv_data,
 	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS);
 }
 
-static void ath12k_dp_mon_parse_he_sig_b1_mu(u8 *tlv_data,
-					     struct hal_rx_mon_ppdu_info *ppdu_info)
+static void
+ath12k_dp_mon_parse_he_sig_b1_mu(const struct hal_rx_he_sig_b1_mu_info *he_sig_b1_mu,
+				 struct hal_rx_mon_ppdu_info *ppdu_info)
 {
-	struct hal_rx_he_sig_b1_mu_info *he_sig_b1_mu =
-			(struct hal_rx_he_sig_b1_mu_info *)tlv_data;
 	u32 info0 = __le32_to_cpu(he_sig_b1_mu->info0);
 	u16 ru_tones;
 
@@ -292,11 +280,10 @@ static void ath12k_dp_mon_parse_he_sig_b1_mu(u8 *tlv_data,
 	ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_MIMO;
 }
 
-static void ath12k_dp_mon_parse_he_sig_mu(u8 *tlv_data,
-					  struct hal_rx_mon_ppdu_info *ppdu_info)
+static void
+ath12k_dp_mon_parse_he_sig_mu(const struct hal_rx_he_sig_a_mu_dl_info *he_sig_a_mu_dl,
+			      struct hal_rx_mon_ppdu_info *ppdu_info)
 {
-	struct hal_rx_he_sig_a_mu_dl_info *he_sig_a_mu_dl =
-			(struct hal_rx_he_sig_a_mu_dl_info *)tlv_data;
 	u32 info0, info1, value;
 	u16 he_gi = 0, he_ltf = 0;
 
@@ -427,11 +414,9 @@ static void ath12k_dp_mon_parse_he_sig_mu(u8 *tlv_data,
 	ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_MIMO;
 }
 
-static void ath12k_dp_mon_parse_he_sig_su(u8 *tlv_data,
+static void ath12k_dp_mon_parse_he_sig_su(const struct hal_rx_he_sig_a_su_info *he_sig_a,
 					  struct hal_rx_mon_ppdu_info *ppdu_info)
 {
-	struct hal_rx_he_sig_a_su_info *he_sig_a =
-			(struct hal_rx_he_sig_a_su_info *)tlv_data;
 	u32 info0, info1, value;
 	u32 dcm;
 	u8 he_dcm = 0, he_stbc = 0;
@@ -580,15 +565,15 @@ static void ath12k_dp_mon_parse_he_sig_su(u8 *tlv_data,
 static enum hal_rx_mon_status
 ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 				  struct ath12k_mon_data *pmon,
-				  u32 tlv_tag, u8 *tlv_data, u32 userid)
+				  u32 tlv_tag, const void *tlv_data,
+				  u32 userid)
 {
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
 	u32 info[7];
 
 	switch (tlv_tag) {
 	case HAL_RX_PPDU_START: {
-		struct hal_rx_ppdu_start *ppdu_start =
-			(struct hal_rx_ppdu_start *)tlv_data;
+		const struct hal_rx_ppdu_start *ppdu_start = tlv_data;
 
 		u64 ppdu_ts = ath12k_le32hilo_to_u64(ppdu_start->ppdu_start_ts_63_32,
 						     ppdu_start->ppdu_start_ts_31_0);
@@ -615,8 +600,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		break;
 	}
 	case HAL_RX_PPDU_END_USER_STATS: {
-		struct hal_rx_ppdu_end_user_stats *eu_stats =
-			(struct hal_rx_ppdu_end_user_stats *)tlv_data;
+		const struct hal_rx_ppdu_end_user_stats *eu_stats = tlv_data;
 		u32 tid_bitmap;
 
 		info[0] = __le32_to_cpu(eu_stats->info0);
@@ -673,8 +657,8 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 				&ppdu_info->userstats[userid];
 			ppdu_info->num_users += 1;
 
-			ath12k_dp_mon_rx_handle_ofdma_info(tlv_data, rxuser_stats);
-			ath12k_dp_mon_rx_populate_mu_user_info(tlv_data, ppdu_info,
+			ath12k_dp_mon_rx_handle_ofdma_info(eu_stats, rxuser_stats);
+			ath12k_dp_mon_rx_populate_mu_user_info(eu_stats, ppdu_info,
 							       rxuser_stats);
 		}
 		ppdu_info->mpdu_fcs_ok_bitmap[0] = __le32_to_cpu(eu_stats->rsvd1[0]);
@@ -682,8 +666,8 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		break;
 	}
 	case HAL_RX_PPDU_END_USER_STATS_EXT: {
-		struct hal_rx_ppdu_end_user_stats_ext *eu_stats =
-			(struct hal_rx_ppdu_end_user_stats_ext *)tlv_data;
+		const struct hal_rx_ppdu_end_user_stats_ext *eu_stats = tlv_data;
+
 		ppdu_info->mpdu_fcs_ok_bitmap[2] = __le32_to_cpu(eu_stats->info1);
 		ppdu_info->mpdu_fcs_ok_bitmap[3] = __le32_to_cpu(eu_stats->info2);
 		ppdu_info->mpdu_fcs_ok_bitmap[4] = __le32_to_cpu(eu_stats->info3);
@@ -729,8 +713,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		break;
 
 	case HAL_PHYRX_RSSI_LEGACY: {
-		struct hal_rx_phyrx_rssi_legacy_info *rssi =
-			(struct hal_rx_phyrx_rssi_legacy_info *)tlv_data;
+		const struct hal_rx_phyrx_rssi_legacy_info *rssi = tlv_data;
 
 		info[0] = __le32_to_cpu(rssi->info0);
 		info[1] = __le32_to_cpu(rssi->info1);
@@ -748,8 +731,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		break;
 	}
 	case HAL_RXPCU_PPDU_END_INFO: {
-		struct hal_rx_ppdu_end_duration *ppdu_rx_duration =
-			(struct hal_rx_ppdu_end_duration *)tlv_data;
+		const struct hal_rx_ppdu_end_duration *ppdu_rx_duration = tlv_data;
 
 		info[0] = __le32_to_cpu(ppdu_rx_duration->info0);
 		ppdu_info->rx_duration =
@@ -760,8 +742,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		break;
 	}
 	case HAL_RX_MPDU_START: {
-		struct hal_rx_mpdu_start *mpdu_start =
-			(struct hal_rx_mpdu_start *)tlv_data;
+		const struct hal_rx_mpdu_start *mpdu_start = tlv_data;
 		struct dp_mon_mpdu *mon_mpdu = pmon->mon_mpdu;
 		u16 peer_id;
 
@@ -790,8 +771,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		break;
 	case HAL_MON_BUF_ADDR: {
 		struct dp_rxdma_mon_ring *buf_ring = &ab->dp.rxdma_mon_buf_ring;
-		struct dp_mon_packet_info *packet_info =
-			(struct dp_mon_packet_info *)tlv_data;
+		const struct dp_mon_packet_info *packet_info = tlv_data;
 		int buf_id = u32_get_bits(packet_info->cookie,
 					  DP_RXDMA_BUF_COOKIE_BUF_ID);
 		struct sk_buff *msdu;
@@ -823,8 +803,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		break;
 	}
 	case HAL_RX_MSDU_END: {
-		struct rx_msdu_end_qcn9274 *msdu_end =
-			(struct rx_msdu_end_qcn9274 *)tlv_data;
+		const struct rx_msdu_end_qcn9274 *msdu_end = tlv_data;
 		bool is_first_msdu_in_mpdu;
 		u16 msdu_end_info;
 
@@ -1609,7 +1588,7 @@ ath12k_dp_mon_tx_gen_prot_frame(struct dp_mon_tx_ppdu_info *tx_ppdu_info)
 static enum dp_mon_tx_tlv_status
 ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 				  struct ath12k_mon_data *pmon,
-				  u16 tlv_tag, u8 *tlv_data, u32 userid)
+				  u16 tlv_tag, const void *tlv_data, u32 userid)
 {
 	struct dp_mon_tx_ppdu_info *tx_ppdu_info;
 	enum dp_mon_tx_tlv_status status = DP_MON_TX_STATUS_PPDU_NOT_DONE;
@@ -1619,8 +1598,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 
 	switch (tlv_tag) {
 	case HAL_TX_FES_SETUP: {
-		struct hal_tx_fes_setup *tx_fes_setup =
-					(struct hal_tx_fes_setup *)tlv_data;
+		const struct hal_tx_fes_setup *tx_fes_setup = tlv_data;
 
 		info[0] = __le32_to_cpu(tx_fes_setup->info0);
 		tx_ppdu_info->ppdu_id = __le32_to_cpu(tx_fes_setup->schedule_id);
@@ -1631,8 +1609,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_TX_FES_STATUS_END: {
-		struct hal_tx_fes_status_end *tx_fes_status_end =
-			(struct hal_tx_fes_status_end *)tlv_data;
+		const struct hal_tx_fes_status_end *tx_fes_status_end = tlv_data;
 		u32 tst_15_0, tst_31_16;
 
 		info[0] = __le32_to_cpu(tx_fes_status_end->info0);
@@ -1649,8 +1626,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_RX_RESPONSE_REQUIRED_INFO: {
-		struct hal_rx_resp_req_info *rx_resp_req_info =
-			(struct hal_rx_resp_req_info *)tlv_data;
+		const struct hal_rx_resp_req_info *rx_resp_req_info = tlv_data;
 		u32 addr_32;
 		u16 addr_16;
 
@@ -1695,8 +1671,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_PCU_PPDU_SETUP_INIT: {
-		struct hal_tx_pcu_ppdu_setup_init *ppdu_setup =
-			(struct hal_tx_pcu_ppdu_setup_init *)tlv_data;
+		const struct hal_tx_pcu_ppdu_setup_init *ppdu_setup = tlv_data;
 		u32 addr_32;
 		u16 addr_16;
 
@@ -1742,8 +1717,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_TX_QUEUE_EXTENSION: {
-		struct hal_tx_queue_exten *tx_q_exten =
-			(struct hal_tx_queue_exten *)tlv_data;
+		const struct hal_tx_queue_exten *tx_q_exten = tlv_data;
 
 		info[0] = __le32_to_cpu(tx_q_exten->info0);
 
@@ -1755,8 +1729,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_TX_FES_STATUS_START: {
-		struct hal_tx_fes_status_start *tx_fes_start =
-			(struct hal_tx_fes_status_start *)tlv_data;
+		const struct hal_tx_fes_status_start *tx_fes_start = tlv_data;
 
 		info[0] = __le32_to_cpu(tx_fes_start->info0);
 
@@ -1767,8 +1740,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_TX_FES_STATUS_PROT: {
-		struct hal_tx_fes_status_prot *tx_fes_status =
-			(struct hal_tx_fes_status_prot *)tlv_data;
+		const struct hal_tx_fes_status_prot *tx_fes_status = tlv_data;
 		u32 start_timestamp;
 		u32 end_timestamp;
 
@@ -1795,8 +1767,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 
 	case HAL_TX_FES_STATUS_START_PPDU:
 	case HAL_TX_FES_STATUS_START_PROT: {
-		struct hal_tx_fes_status_start_prot *tx_fes_stat_start =
-			(struct hal_tx_fes_status_start_prot *)tlv_data;
+		const struct hal_tx_fes_status_start_prot *tx_fes_stat_start = tlv_data;
 		u64 ppdu_ts;
 
 		info[0] = __le32_to_cpu(tx_fes_stat_start->info0);
@@ -1811,8 +1782,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_TX_FES_STATUS_USER_PPDU: {
-		struct hal_tx_fes_status_user_ppdu *tx_fes_usr_ppdu =
-			(struct hal_tx_fes_status_user_ppdu *)tlv_data;
+		const struct hal_tx_fes_status_user_ppdu *tx_fes_usr_ppdu = tlv_data;
 
 		info[0] = __le32_to_cpu(tx_fes_usr_ppdu->info0);
 
@@ -1855,8 +1825,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 		break;
 
 	case HAL_RX_FRAME_BITMAP_ACK: {
-		struct hal_rx_frame_bitmap_ack *fbm_ack =
-			(struct hal_rx_frame_bitmap_ack *)tlv_data;
+		const struct hal_rx_frame_bitmap_ack *fbm_ack = tlv_data;
 		u32 addr_32;
 		u16 addr_16;
 
@@ -1874,8 +1843,7 @@ ath12k_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_MACTX_PHY_DESC: {
-		struct hal_tx_phy_desc *tx_phy_desc =
-			(struct hal_tx_phy_desc *)tlv_data;
+		const struct hal_tx_phy_desc *tx_phy_desc = tlv_data;
 
 		info[0] = __le32_to_cpu(tx_phy_desc->info0);
 		info[1] = __le32_to_cpu(tx_phy_desc->info1);
-- 
2.34.1


