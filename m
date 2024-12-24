Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB1FE77188
	for <ath12k@archiver.kernel.org>; Tue, 24 Dec 2024 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kv77XmD56FGU7G/OfWMLcgx4uBOoNZT0/YHSyvX78A=; b=GsbBElU51VyY3NZgp9gpcP2H34
	i6Q+eRkJ3PALwcZu57sKivmE8og67SDKOMkU6yYUavLXZMNzct8VA2/1Krlq12/gTBZrLZl7YINMX
	R75bGR3oZtTsjcbfsKN2bkcCrEkLQSW1jZJe1Ugkv9ZbpIifv8nnkxhXkkWDGN3lktJQcYHQR5ceR
	Mp3f0813DoP8cEqdn3KtA6D7O3ZlefdHnNgmFWZJKsIedNPPhnyTb0InHXsDvqANKzpjPAJvlOb9C
	m2LVtWfVQu2k07wr8jm7Fp1VIvmNEUNnfyYsB1YAMBsde/8yTu59jvdkCCJJUESwmKORmbBCpUKK/
	pFDfrwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5lR-0000000C8Au-2zda
	for ath12k@archiver.kernel.org;
	Tue, 24 Dec 2024 14:20:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5lO-0000000C89P-3Ivb
	for ath12k@lists.infradead.org;
	Tue, 24 Dec 2024 14:20:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BOD3hGL021102;
	Tue, 24 Dec 2024 14:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3kv77XmD56FGU7G/OfWMLcgx4uBOoNZT0/YHSyvX78A=; b=bWlZ5qRMuLXhWpUD
	mqjIcLFuymmGCtWBOo+4AMIy71Yl44NcSLBMISGxmudwZPwJo1Er/19nysGiJCll
	6H3ukAQZf3h2NcKgxJMxCGj+KESd5hAAciX7v0yLwf67JaTuB0UMmv4QirDARmil
	fa67Bsc2cxdDX6bcnpM86VwgwpQk7iDPxcl7765rdozCic2WHW6tvbiUjLp34yXg
	cUebBoQ+ZYUbDsmBBenIwO/g1JX8zihBT3VNuBcz+U4pxKaWRaIudqTs29cWIdwd
	hhaDb7D8Xkf2o0i/LdomPkPaql1JbGxktkQEkr8VBgaLhn/aw9PymGMSYa3jl0qu
	KBvFSg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qwgt8cav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 14:19:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOEJsnX007267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 14:19:54 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Dec 2024 06:19:52 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>
Subject: [PATCH v2 1/3] wifi: ath12k: Refactor the monitor Rx parser handler argument
Date: Tue, 24 Dec 2024 19:49:18 +0530
Message-ID: <20241224141920.129339-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224141920.129339-1-quic_periyasa@quicinc.com>
References: <20241224141920.129339-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _CtjeCYP3xQYIQS9lLgHLzF-8jzHCItC
X-Proofpoint-ORIG-GUID: _CtjeCYP3xQYIQS9lLgHLzF-8jzHCItC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_061958_958993_95A31931 
X-CRM114-Status: GOOD (  13.84  )
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

Currently, the monitor Rx parser handlers
ath12k_dp_mon_rx_parse_status_tlv() and ath12k_dp_mon_parse_rx_dest()
take the device handle from the caller. However, these handlers
functionality is technically pdev specific. Additionally, the device handle
can be retrieved from the pdev handle. Therefore, for better code
understanding, change the monitor Rx parser handlers argument from the
device handle to the pdev handle.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Kalle Valo <kvalo@kernel.org>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 5a21961cfd46..85ff89b91624 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -563,11 +563,12 @@ static void ath12k_dp_mon_parse_he_sig_su(const struct hal_rx_he_sig_a_su_info *
 }
 
 static enum hal_rx_mon_status
-ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
+ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 				  struct ath12k_mon_data *pmon,
 				  u32 tlv_tag, const void *tlv_data,
 				  u32 userid)
 {
+	struct ath12k_base *ab = ar->ab;
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
 	u32 info[7];
 
@@ -1180,7 +1181,7 @@ static int ath12k_dp_mon_rx_deliver(struct ath12k *ar, u32 mac_id,
 }
 
 static enum hal_rx_mon_status
-ath12k_dp_mon_parse_rx_dest(struct ath12k_base *ab, struct ath12k_mon_data *pmon,
+ath12k_dp_mon_parse_rx_dest(struct ath12k *ar, struct ath12k_mon_data *pmon,
 			    struct sk_buff *skb)
 {
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
@@ -1208,7 +1209,7 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k_base *ab, struct ath12k_mon_data *pmon
 		if (tlv_tag == HAL_RX_PPDU_END)
 			tlv_len = sizeof(struct hal_rx_rxpcu_classification_overview);
 
-		hal_status = ath12k_dp_mon_rx_parse_status_tlv(ab, pmon,
+		hal_status = ath12k_dp_mon_rx_parse_status_tlv(ar, pmon,
 							       tlv_tag, ptr, tlv_userid);
 		ptr += tlv_len;
 		ptr = PTR_ALIGN(ptr, HAL_TLV_64_ALIGN);
@@ -1228,14 +1229,13 @@ ath12k_dp_mon_rx_parse_mon_status(struct ath12k *ar,
 				  struct sk_buff *skb,
 				  struct napi_struct *napi)
 {
-	struct ath12k_base *ab = ar->ab;
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
 	struct dp_mon_mpdu *tmp;
 	struct dp_mon_mpdu *mon_mpdu = pmon->mon_mpdu;
 	struct sk_buff *head_msdu, *tail_msdu;
 	enum hal_rx_mon_status hal_status = HAL_RX_MON_STATUS_BUF_DONE;
 
-	ath12k_dp_mon_parse_rx_dest(ab, pmon, skb);
+	ath12k_dp_mon_parse_rx_dest(ar, pmon, skb);
 
 	list_for_each_entry_safe(mon_mpdu, tmp, &pmon->dp_rx_mon_mpdu_list, list) {
 		list_del(&mon_mpdu->list);
@@ -2477,7 +2477,7 @@ int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
 
 		for (i = 0; i < dest_idx; i++) {
 			skb = pmon->dest_skb_q[i];
-			hal_status = ath12k_dp_mon_parse_rx_dest(ab, pmon, skb);
+			hal_status = ath12k_dp_mon_parse_rx_dest(ar, pmon, skb);
 
 			if (ppdu_info->peer_id == HAL_INVALID_PEERID ||
 			    hal_status != HAL_RX_MON_STATUS_PPDU_DONE) {
-- 
2.34.1


