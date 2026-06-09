Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AFDCD8C85
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrTWWy2gG28t4Kh5K/N0VTFu6lYaDG0TdIa1hgvBAEM=; b=PIof8CVSIKFtyAYt9sm0qI0o79
	u8V5N0iH97RunCgE0/MCbD5Lsi0Z3wSyFjyvAWq+d3m0TVP86H7QYc1k8+zDCSBvomUSZFn6gbcFb
	xTLlrzZXGIRqlMxghGpW7zo+vEIs//OYJOiU3FG+t82RwN+qE87kLHeKx+u1/ZqrBHvEsq/L0HkEn
	vyyBlUNAGDbfaRvWoXIVZpQ+xXzcEhu9AdadvduAGBva9ovDP6SeBt2GY/cX3ye0IHto3PJh7RCnf
	cdMIctk9uwdtwXRhb+diUF1uTm7ukvX9ALAcR0RBaXML2kGkvFKbYutVC0di4kd0cc0AaQALd5Wub
	0goKX0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqGp-00000004uP7-10d4;
	Tue, 09 Jun 2026 06:49:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqGm-00000004uNp-2ISz
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 06:49:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wkpL1515318;
	Tue, 9 Jun 2026 06:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VrTWWy2gG28
	t4Kh5K/N0VTFu6lYaDG0TdIa1hgvBAEM=; b=Y578UAD9G0uBxITolpDZ/hukTax
	fX6FrUntOD2Wl/WwzGxomLgaABoY88CWz4zKPK1QhKEuLtO4w7fTiGVpDYY8Uhml
	pAWHW/Ffzyn1Nc9x8vvwBXLS0BtM4ysHqkjfS5UKVWUu05US1Eh3Ga5q6gVCy4f9
	yOJoxSDPMZbuJQ6s3Es4PvDYTbPPETuvgt+hSaqugOez+C7vZPLdKda/IIGT87p4
	PAUnuCzf7mLsNco3L+4QDJW8I4DpyFJ0OqIKyto6YQu/1sfFok5pdfUXLsMj28xE
	HbeUqHtOqKRmz2CEzlRHbGvIErKROrIkd9hEidC9GPnnMpgqb0hYdffggbw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvccym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 06:49:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6596mxNF031244;
	Tue, 9 Jun 2026 06:48:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4emcmj9c10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 06:48:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6596mxDj031228;
	Tue, 9 Jun 2026 06:48:59 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-sbutta-blr.qualcomm.com [10.190.109.146])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6596mxqB031226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 06:48:59 +0000 (GMT)
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4181700)
	id 5F38B4103D; Tue,  9 Jun 2026 12:18:58 +0530 (+0530)
From: Sushant Butta <sushant.butta@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sushant Butta <sushant.butta@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: Skip setting RX_FLAG_8023 for Ethernet-II (DIX) frames in monitor mode
Date: Tue,  9 Jun 2026 12:18:55 +0530
Message-Id: <20260609064856.547032-2-sushant.butta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
References: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: _WiYMg-vUMFWdp6xHqTb9QINpVPpbHrY
X-Proofpoint-ORIG-GUID: _WiYMg-vUMFWdp6xHqTb9QINpVPpbHrY
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a27b75f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=psqe5MOC7dZ9d78gfmcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MiBTYWx0ZWRfX1hrzVno4OBUV
 rTGIQixCgH1drY1DcZAz+KPWEWBVNILxzklin44JBzziIlFK53uXXkgmYZIgUeObYFPoN9R56ra
 iL2vET3pevhV4448E5PGQYqywZmTDjbY4h8cPrKym7PgZ2HS+o6UMwe4TXzIUaJfavgMe9+lxu6
 JdpWZwGQxUim0gSc5yh7oUorW8idJEDJ2KNS+gI4EnCCi99NzATif3kdZCfp+lPMQ27helNQLrX
 2qN6ZzVDT/OQIuKsj9RW79bCSpJJds3SqbRJPgbtAQCn1BJYhhJMCcL6ml+DPeWGbA4BARtqW0s
 WyO1oLWtv5tVXilV2Cm+o9wP0Away/ignm3J41aDavBG0O22WQgRqfLKLJO2TVTNA7/7q4KsNRn
 0HNqnRnmxEeelQ742y0q8V2X67kdoSy/6x72bYvuPpOd8wMtdM4+coFVcwLo9ZswDTEvcftb7w9
 AnpOBA7J3frrcJAHPRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_234904_706301_41B5CA58 
X-CRM114-Status: GOOD (  15.16  )
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

Monitor mode delivers raw 802.11 frames, not 802.3/Ethernet frames. Setting
RX_FLAG_8023 for monitor RX is incorrect and can break userspace capture and
analysis. Do not update this flag in the monitor path to ensure correct
handling of captured frames.

In the monitor path, RX_FLAG_ONLY_MONITOR is always set before decap
is evaluated, which forces decap to remain DP_RX_DECAP_TYPE_RAW.
As a result, the condition to set RX_FLAG_8023 can never be satisfied.
Hence, drop this unreachable code.

Also remove the unused hal_rx_mon_ppdu_info parameter from
ath12k_dp_mon_rx_deliver_msdu(), as it was passed but never used.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sushant Butta <sushant.butta@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c       | 16 +---------------
 drivers/net/wireless/ath/ath12k/dp_mon.h       |  4 +---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c |  7 +------
 3 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 44c5cff75f16..cfcfa93eeb44 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -493,9 +493,7 @@ EXPORT_SYMBOL(ath12k_dp_mon_update_radiotap);
 void ath12k_dp_mon_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev,
 				   struct napi_struct *napi,
 				   struct sk_buff *msdu,
-				   const struct hal_rx_mon_ppdu_info *ppduinfo,
-				   struct ieee80211_rx_status *status,
-				   u8 decap)
+				   struct ieee80211_rx_status *status)
 {
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_base *ab = dp->ab;
@@ -511,7 +509,6 @@ void ath12k_dp_mon_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
 	struct hal_rx_desc_data rx_info;
 	bool is_mcbc = rxcb->is_mcbc;
-	bool is_eapol_tkip = rxcb->is_eapol;
 	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)msdu->data;
 	u8 addr[ETH_ALEN] = {};
 
@@ -570,17 +567,6 @@ void ath12k_dp_mon_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev,
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
 
-	/* TODO: trace rx packet */
-
-	/* PN for multicast packets are not validate in HW,
-	 * so skip 802.3 rx path
-	 * Also, fast_rx expects the STA to be authorized, hence
-	 * eapol packets are sent in slow path.
-	 */
-	if (decap == DP_RX_DECAP_TYPE_ETHERNET2_DIX && !is_eapol_tkip &&
-	    !(is_mcbc && rx_status->flag & RX_FLAG_DECRYPTED))
-		rx_status->flag |= RX_FLAG_8023;
-
 	ieee80211_rx_napi(ath12k_pdev_dp_to_hw(dp_pdev), pubsta, msdu, napi);
 }
 EXPORT_SYMBOL(ath12k_dp_mon_rx_deliver_msdu);
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.h b/drivers/net/wireless/ath/ath12k/dp_mon.h
index 167028d27513..162cdcaa57a7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.h
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.h
@@ -112,9 +112,7 @@ void ath12k_dp_mon_update_radiotap(struct ath12k_pdev_dp *dp_pdev,
 void ath12k_dp_mon_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev,
 				   struct napi_struct *napi,
 				   struct sk_buff *msdu,
-				   const struct hal_rx_mon_ppdu_info *ppduinfo,
-				   struct ieee80211_rx_status *status,
-				   u8 decap);
+				   struct ieee80211_rx_status *status);
 struct sk_buff *
 ath12k_dp_mon_rx_merg_msdus(struct ath12k_pdev_dp *dp_pdev,
 			    struct dp_mon_mpdu *mon_mpdu,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 7dd4a49d64d5..67acaebdc605 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -2480,7 +2480,6 @@ ath12k_wifi7_dp_mon_rx_deliver(struct ath12k_pdev_dp *dp_pdev,
 {
 	struct sk_buff *mon_skb, *skb_next, *header;
 	struct ieee80211_rx_status *rxs = &dp_pdev->rx_status;
-	u8 decap = DP_RX_DECAP_TYPE_RAW;
 
 	mon_skb = ath12k_dp_mon_rx_merg_msdus(dp_pdev, mon_mpdu, ppduinfo, rxs);
 	if (!mon_skb)
@@ -2507,12 +2506,8 @@ ath12k_wifi7_dp_mon_rx_deliver(struct ath12k_pdev_dp *dp_pdev,
 		}
 		rxs->flag |= RX_FLAG_ONLY_MONITOR;
 
-		if (!(rxs->flag & RX_FLAG_ONLY_MONITOR))
-			decap = mon_mpdu->decap_format;
-
 		ath12k_dp_mon_update_radiotap(dp_pdev, ppduinfo, mon_skb, rxs);
-		ath12k_dp_mon_rx_deliver_msdu(dp_pdev, napi, mon_skb, ppduinfo,
-					      rxs, decap);
+		ath12k_dp_mon_rx_deliver_msdu(dp_pdev, napi, mon_skb, rxs);
 		mon_skb = skb_next;
 	} while (mon_skb);
 	rxs->flag = 0;
-- 
2.34.1


