Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22CECD5BD0
	for <ath12k@archiver.kernel.org>; Mon, 25 May 2026 11:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8L+ECEoayOYjnBH4SBislCWz8r+NUnITLEnjWvY7ts=; b=PTMdaSDWa+nn9J5oJ2aYUz/GHV
	rcdaCEIirMQ/z+kAN9IffRwckRo9q7O+LGXq/GhiQbJUl2Apogt2JooxONtct1IjQCh6vMbHESggQ
	ia58/ZN/qC0Tp/Zcu8mUltH3KbaTINUImQcmuFLaK/ugC6Zjs3pgj2Bj6BV9ilyRdoNg52v7a72AJ
	fOZSCEjbGWFbFgIAdNSa3DXhw+H+BeP4VOiPLkrPx6IV2N+cuPi4JeILUCjOeaX2zFBNGhW7i6KSA
	0unMj1nZc1LD9uHAYKqdSruGvjOdzq6rEzjUyEoRoGEES3YsQn5RSWfYjBwRnzzKgqwEMBhQBarKu
	yXXP/Hkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTCN-0000000H26O-2of7;
	Mon, 25 May 2026 11:10:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTCK-0000000H23z-3JDi
	for ath12k@lists.infradead.org;
	Mon, 25 May 2026 11:10:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PApm2S3282561;
	Mon, 25 May 2026 11:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A8L+ECEoayO
	YjnBH4SBislCWz8r+NUnITLEnjWvY7ts=; b=j1z79bNthtCceKOBqF9uLj8Lnno
	lKPymyj9G5691T8AAPP6OgK3j7+ylCt4X5EmsGztaljWYyvnmHmYt+F0RK+6HQQ5
	uZoWvSR6aaH2CXxlB93c8/toe2WZFT2INE40dFnQpCmtUS5WjOd330HX2lrZ1YN6
	lVgkdBIaP4BFy1dgvSZut7Je+kIsGex63xBxOOrp601TOa0Kij/VrxqL0dKrH8tj
	IKElievUUjWhlvCoHY4G+I61O3AoGOk/Iz09Lr1wNjBIAyDzAVOROxQt+KmEaetA
	oBWRtIOEfdxmw6YxRHCiyMDmntXjps8R/2fRFsQJWl+p5dN0KhrL2GZQRcQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3eb7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64PB9vCP025757;
	Mon, 25 May 2026 11:10:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4eb5ajfc4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:12 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64PBACtu026854;
	Mon, 25 May 2026 11:10:12 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-tamizhr-blr.qualcomm.com [10.190.110.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64PBAC8g026852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:12 +0000 (GMT)
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 380741)
	id 9CE0A4195D; Mon, 25 May 2026 16:40:11 +0530 (+0530)
From: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Subject: [PATCH ath-next 6/6] wifi: ath12k: Handle 4-address EAPOL frames from WBM error path
Date: Mon, 25 May 2026 16:39:42 +0530
Message-Id: <20260525110942.2890212-7-tamizh.raja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
References: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: rbHYWjY3z0sWOTSyNsVicfn-X-PI61V6
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a142e18 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=CHvhhog7QKGsEOd0EDMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNCBTYWx0ZWRfX+WXqhXMUfDTh
 gcipkkOULhxym4SsIqACVyDkVfQ1UoIoaNQXS48r8yzz5/YhZ65zfJIe/Xm2IeXsvWsCppys1qy
 pGHvzTZT9Uu0fRM4vFo3OifA9xWNbNLOJsvozzvujbzswDBb4lo2+1mhFGS2ChGTEJnlBLdEKmI
 98InnjqjrtJmF2TYFs2kW9KP5zrKSokeyORJx84R/j+jRxs+u/2ysA/ifai5H3hHNQ5OfQLnOmG
 JX0Pq9mWoQm332oWGCPYwaaDt1cXRInK7/01xYyw7F34LMNCEJMgfuzlp2QsZp21SN/g5ZOJzIW
 nFiG3FygrTPOJ/oHPd5fW+WqGIDfEHHkXba4QlEeuiBnDnc4RKKAOtAj9jnVHXlDF4H11J8rnNR
 w2U/RGClGXLZqUV1FZNwlvfoJrevvBUTpklLC1TsZtZQaIlL1tEC3MvJPfzeotUhv7Jei1RrLeu
 oWUjkGgiCoVbYfTfmAQ==
X-Proofpoint-GUID: rbHYWjY3z0sWOTSyNsVicfn-X-PI61V6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041016_836507_A0E35EE4 
X-CRM114-Status: GOOD (  12.81  )
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

Whenever hardware receives 4-address EAPOL frames from an unauthorized
station it is routed through WBM/RXDMA error path with the
HAL_REO_ENTR_RING_RXDMA_ECODE_UNAUTH_WDS_ERR error code. But, the
current driver does not handle the 4-address EAPOL frames
in the WBM error path. As a result, these frames are dropped,
causing authentication failures and connectivity issues for 4-address
stations.

Add support to correctly process these frames and forward them to mac80211
for proper handling. This prevents the loss of 4-address EAPOL frames and
ensures reliable connectivity for WDS/4-address clients.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 43bb8631827f..d1d63c49d014 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1702,6 +1702,56 @@ static bool ath12k_wifi7_dp_rx_h_tkip_mic_err(struct ath12k_pdev_dp *dp_pdev,
 	return false;
 }
 
+static bool ath12k_wifi7_dp_rx_h_unauth_wds_err(struct ath12k_pdev_dp *dp_pdev,
+						struct sk_buff *msdu,
+						struct hal_rx_desc_data *rx_info)
+{
+	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
+	struct ath12k_dp *dp = dp_pdev->dp;
+	u32 hdr_len, hal_rx_desc_sz = dp->ab->hal.hal_desc_sz;
+	u8 l3pad_bytes = rx_info->l3_pad_bytes;
+	struct ath12k_dp_rx_rfc1042_hdr *llc;
+	u16 msdu_len = rx_info->msdu_len;
+	struct ath12k_dp_peer *peer;
+	struct ieee80211_hdr *hdr;
+	int ret;
+
+	guard(rcu)();
+	peer = ath12k_dp_peer_find_by_peerid(dp_pdev, rxcb->peer_id);
+	if (!peer) {
+		ath12k_dbg(dp->ab, ATH12K_DBG_DATA,
+			   "failed to find the peer to process unauth wds err handling peer_id %d\n",
+			   rxcb->peer_id);
+		return true;
+	}
+
+	if ((hal_rx_desc_sz + l3pad_bytes + msdu_len) > DP_RX_BUFFER_SIZE)
+		return true;
+
+	skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
+	skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
+
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu,
+							     rx_info)))
+		return true;
+
+	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
+
+	ret = ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_info);
+	if (ret)
+		return true;
+
+	rxcb->tid = rx_info->tid;
+
+	hdr = (struct ieee80211_hdr *)msdu->data;
+	hdr_len = ieee80211_hdrlen(hdr->frame_control);
+	llc = (struct ath12k_dp_rx_rfc1042_hdr *)(msdu->data + hdr_len);
+	if (llc->snap_type != cpu_to_be16(ETH_P_PAE))
+		return true;
+
+	return false;
+}
+
 static bool ath12k_wifi7_dp_rx_h_rxdma_err(struct ath12k_pdev_dp *dp_pdev,
 					   struct sk_buff *msdu,
 					   struct hal_rx_desc_data *rx_info)
@@ -1713,6 +1763,9 @@ static bool ath12k_wifi7_dp_rx_h_rxdma_err(struct ath12k_pdev_dp *dp_pdev,
 	dp->device_stats.rxdma_error[rxcb->err_code]++;
 
 	switch (rxcb->err_code) {
+	case HAL_REO_ENTR_RING_RXDMA_ECODE_UNAUTH_WDS_ERR:
+		drop = ath12k_wifi7_dp_rx_h_unauth_wds_err(dp_pdev, msdu, rx_info);
+		break;
 	case HAL_REO_ENTR_RING_RXDMA_ECODE_DECRYPT_ERR:
 	case HAL_REO_ENTR_RING_RXDMA_ECODE_TKIP_MIC_ERR:
 		if (rx_info->err_bitmap & HAL_RX_MPDU_ERR_TKIP_MIC) {
-- 
2.34.1


