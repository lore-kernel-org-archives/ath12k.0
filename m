Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15598C7EE24
	for <ath12k@archiver.kernel.org>; Mon,  5 Jun 2023 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdSYWsxvaCGjpJqhkvFbz4VQ1nu4dxg3BwIZEGbEEjI=; b=BqplaLLPTz3Ote
	CxqDeZ3Zb57Cd9G2KVEsv6cQvANj5+i/u0pktGfydDG7okP6dOQTdYUFwkqmj5G5lD4uBvv2/+Vcp
	GX1mZrBKxUTx7YYQFE/WhxJfY5UlPNNn+7Yyq3UWkI/ExlgOyUeL4VQH9KhveBNmfsog6akE6RwzA
	6Dan65HftRqX2P9u1WczCv2OgBYvzFnkYJc3KvT+DB02NiboZhWERbFxFJ9ZdT59b8nT0mzhkD/qO
	Or/z05/m2wJ9pvUSkeqsnLjN9QyKieXZxxDvPDAfChvgVuDSR2i9BvV0AbCNLiZe5XfxgZGdf4eZm
	Z1NL0uA8B/QcXQwfb7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q699k-00FP5V-1x
	for ath12k@archiver.kernel.org;
	Mon, 05 Jun 2023 12:17:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q699h-00FP3k-0c
	for ath12k@lists.infradead.org;
	Mon, 05 Jun 2023 12:17:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 355AWF6I002952;
	Mon, 5 Jun 2023 12:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=etSRraY+YlwDG1Jy9nTdUcmr3fLuE/bD49cuaIRm+Xo=;
 b=gq4m0dcnEt/h1xGeNbGMP19inDV6PKmcCXv78yooMMShTm9ZQEwX0ktL1Aw0nNcckT+U
 0rVQhb216LXDePoDvFa5UIeuqu+MUzs0NjlrD1PxpdiPDbJpMwZWsxLpWkQ9FEBch7y3
 s7Si496QwCrsAgQDlR0eJzoHGSMcepWRR0SdeSXzMYH5ZEaU+w5PWw1y7M0+HzVd05lT
 /HH0Ov7jHwMMcP4JbfWiJ9H0a8JLhtRim1Bxt+0KkJEqaWRuVMkOInuUQ5oBgJVyMvUb
 3Z5z2mtvDW3NY4EpfDCtM9q/pQA0uebmPPoVPIRMnyZYFVPXyfDF96jSrci7jeiFdzTY rQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qyw46bjrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 12:17:47 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 355CHk42015706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Jun 2023 12:17:46 GMT
Received: from aarasahu-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 5 Jun 2023 05:17:44 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>,
        Aaradhana Sahu <quic_aarasahu@quicinc.com>
Subject: [PATCH 2/3] wifi: ath11k: Fix tkip encryption traffic failure
Date: Mon, 5 Jun 2023 17:47:21 +0530
Message-ID: <20230605121722.20797-3-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605121722.20797-1-quic_aarasahu@quicinc.com>
References: <20230605121722.20797-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eDz2ibQvLeqanXmnCfzSHXZ3nIgJmxA8
X-Proofpoint-GUID: eDz2ibQvLeqanXmnCfzSHXZ3nIgJmxA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_051749_368682_054DB26A 
X-CRM114-Status: GOOD (  19.42  )
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

From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>

Currently, we are getting NULL value for fast_rx because
fast_rx is not assigned in case of TKIP cipher and hence
packets are dropped in fast path.

Fix this issue by handling the rx decap for TKIP so frames
will be handled in normal rx path.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.h  |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 15 ++++++++++-----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 0830276e5028..bb9acdda5aa8 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -122,7 +122,7 @@ struct ath11k_skb_rxcb {
 	bool is_last_msdu;
 	bool is_continuation;
 	bool is_mcbc;
-	bool is_eapol;
+	bool skip_decap;
 	struct hal_rx_desc *rx_desc;
 	u8 err_rel_src;
 	u8 err_code;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 99859b59138e..03eeb3dfbb15 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2168,9 +2168,14 @@ static void ath11k_dp_rx_h_undecap(struct ath11k *ar, struct sk_buff *msdu,
 	case DP_RX_DECAP_TYPE_ETHERNET2_DIX:
 		ehdr = (struct ethhdr *)msdu->data;
 
-		/* mac80211 allows fast path only for authorized STA */
-		if (ehdr->h_proto == cpu_to_be16(ETH_P_PAE)) {
-			ATH11K_SKB_RXCB(msdu)->is_eapol = true;
+		/* Fast_rx expects the STA to be authorized and
+		 * its not assigned for TKIP cipher. Hence, set
+		 * this flag to handle the EAPOL and TKIP packets
+		 * in the normal path.
+		 */
+		if (ehdr->h_proto == cpu_to_be16(ETH_P_PAE) ||
+		    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
+			ATH11K_SKB_RXCB(msdu)->skip_decap = true;
 			ath11k_dp_rx_h_undecap_eth(ar, msdu, first_hdr,
 						   enctype, status);
 			break;
@@ -2423,7 +2428,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
 	u8 decap = DP_RX_DECAP_TYPE_RAW;
 	bool is_mcbc = rxcb->is_mcbc;
-	bool is_eapol = rxcb->is_eapol;
+	bool skip_decap = rxcb->skip_decap;
 
 	if (status->encoding == RX_ENC_HE &&
 	    !(status->flag & RX_FLAG_RADIOTAP_HE) &&
@@ -2479,7 +2484,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	 * Also, fast_rx expects the STA to be authorized, hence
 	 * eapol packets are sent in slow path.
 	 */
-	if (decap == DP_RX_DECAP_TYPE_ETHERNET2_DIX && !is_eapol &&
+	if (decap == DP_RX_DECAP_TYPE_ETHERNET2_DIX && !skip_decap &&
 	    !(is_mcbc && rx_status->flag & RX_FLAG_DECRYPTED))
 		rx_status->flag |= RX_FLAG_8023;
 
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
