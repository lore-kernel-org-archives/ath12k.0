Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFBDCD13D2
	for <ath12k@archiver.kernel.org>; Mon, 10 Nov 2025 10:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvczxTIzliT5R3AmX0AZOvzDtFXzBSSEmI/yQqck32c=; b=aZEvP0EWK/v4vTdXn2io8M9JfM
	eD8W+vq6Yl63UBzOf7+THxhPpA0qiAhJ0/vE7ye09R/iHaamLJVzZ/qWd0gynxS1Hxx+HYRwV6jsn
	vSEIvW3wM2tQoC4OuRBWAyYBzSBSK2zCU0ZyuiGfIGeoNwIsXPYshPsQESWOHM7O8bSRSnsiF993v
	r7ISGHJyFjaoov8fFouqfgo9AYKa8+BsuzW/xZBngnJFDhaLCEgKlH+RJgTgltn9dRwpCjhX/huFr
	rHyYWw6MCExzQP68rHNZ8LeD5rXq55ioJSB1YwVPFvlPFV00VP5yleAHXd2p2i/hvcSqJuXZZQ2Xs
	sv4Fs11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPH7-00000005Bu3-3qbU;
	Mon, 10 Nov 2025 10:37:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPH1-00000005Boa-1L3R
	for ath12k@lists.infradead.org;
	Mon, 10 Nov 2025 10:37:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9BsBa2867934;
	Mon, 10 Nov 2025 10:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TvczxTIzliT
	5R3AmX0AZOvzDtFXzBSSEmI/yQqck32c=; b=YFqmnv4WXYPMAOT0K48LFIJT18l
	iL48dpVcE288KLQPeUt6hEB2cxht5fSbwFbEOpt/pRh15STz0c0sN+p0rJuMxWpz
	cDQjslBC+bSyIe9WxOjJku1DRSd2l9w4ZPu5qlbmS0I76MjruQLEg9rg4kJp+vAk
	aByq6M/RonXuSQdhPfbRV4ItB7VEI9GRqGfbp0+TylE6xZNEC0TS+9ssAOpYJKpt
	Wn4z3EQUIcHXUEwI/B7NEO2oTM8Cp3KyESpYlpyYodVWeZamfMkEf+RydR8LPERy
	qO9d7k61r/MYMZveYlbLQ8a9Xixc9RGh73+FhrC9924tUm0f7a9TWpOObcg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd760a20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 10:37:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAAbIKY008143;
	Mon, 10 Nov 2025 10:37:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxkq1gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 10:37:18 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AAAbH0e008043;
	Mon, 10 Nov 2025 10:37:18 GMT
Received: from hu-devc-blr-u22-c.qualcomm.com (hu-aloksing-blr.qualcomm.com [10.190.111.138])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AAAbIXH008092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 10:37:18 +0000
Received: by hu-devc-blr-u22-c.qualcomm.com (Postfix, from userid 2272527)
	id A1BBFB75; Mon, 10 Nov 2025 16:07:16 +0530 (+0530)
From: Alok Singh <quic_aloksing@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Alok Singh <quic_aloksing@quicinc.com>
Subject: [PATCH ath12k-ng 11/12] wifi: ath12k: Move MSDU END TLV processing to Wi-Fi 7 module
Date: Mon, 10 Nov 2025 16:07:12 +0530
Message-Id: <20251110103713.3484779-12-quic_aloksing@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
References: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uzTRWSTWaEz31wSm0XDR-Tq6lqhp0-eJ
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=6911c062 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=5LKVVmEjblsydpYdd7MA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5MiBTYWx0ZWRfXwu07l+KU+8gN
 +JIqupWT3VnLcb2IcdofcjIteaK7uXSeJrTXTbSmZhKu5Buk9G7NvrFFGQEM41OEh5FD/uMRWCP
 msbnZgmi64O4TFh3fvz3IuWAwXXWkGlgzQUnIKfsPonnVJHM25xNBa8YmoG9Cl9xuFQUPC0Sk/q
 hBvF4dR0ty9DY1fDXB+CaNsbnUNVxDPxXQT8B+8TxUK3iHcpUUBDYm1UghbyD2SNMYbB1LTZGYt
 iYJhs4lhJRpjSiAF7+MkKQA/XqVjIYAYW9ERbq9462rywEHeiW45hEHMOLdX9mt118huFIziees
 XcWThxCsYaEUZT6hUGhuIJ16wGiUEntMpmBIAWtzN24a4PyILoI5Sx2p56hNaq3PWOKNqyqnkg3
 OBn/I95+EdRuqWdEY/31hvTa18DvWw==
X-Proofpoint-GUID: uzTRWSTWaEz31wSm0XDR-Tq6lqhp0-eJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_023723_389256_C19723A5 
X-CRM114-Status: GOOD (  12.35  )
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

Separate Wi-Fi 7-specific monitor handling from ath12k common code to
improve modularity.

Move the following MSDU END TLV processing functions into wifi7/dp_mon.c
and rename them with the ath12k_wifi7_ prefix:
- ath12k_dp_mon_parse_rx_msdu_end_err()
- ath12k_dp_mon_parse_status_msdu_end()
- ath12k_dp_mon_next_link_desc_get()

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Alok Singh <quic_aloksing@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c      | 50 ----------------
 drivers/net/wireless/ath/ath12k/dp_mon.h      |  9 ---
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 58 +++++++++++++++++--
 3 files changed, 54 insertions(+), 63 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index db67d81d557f..4f7c7748be6c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -11,41 +11,6 @@
 #include "dp_tx.h"
 #include "peer.h"
 
-static void ath12k_dp_mon_parse_rx_msdu_end_err(u32 info, u32 *errmap)
-{
-	if (info & RX_MSDU_END_INFO13_FCS_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_FCS;
-
-	if (info & RX_MSDU_END_INFO13_DECRYPT_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_DECRYPT;
-
-	if (info & RX_MSDU_END_INFO13_TKIP_MIC_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_TKIP_MIC;
-
-	if (info & RX_MSDU_END_INFO13_A_MSDU_ERROR)
-		*errmap |= HAL_RX_MPDU_ERR_AMSDU_ERR;
-
-	if (info & RX_MSDU_END_INFO13_OVERFLOW_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_OVERFLOW;
-
-	if (info & RX_MSDU_END_INFO13_MSDU_LEN_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_MSDU_LEN;
-
-	if (info & RX_MSDU_END_INFO13_MPDU_LEN_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_MPDU_LEN;
-}
-
-void
-ath12k_dp_mon_parse_status_msdu_end(struct ath12k_mon_data *pmon,
-				    const struct hal_rx_msdu_end *msdu_end)
-{
-	ath12k_dp_mon_parse_rx_msdu_end_err(__le32_to_cpu(msdu_end->info2),
-					    &pmon->err_bitmap);
-	pmon->decap_format = le32_get_bits(msdu_end->info1,
-					   RX_MSDU_END_INFO11_DECAP_FORMAT);
-}
-EXPORT_SYMBOL(ath12k_dp_mon_parse_status_msdu_end);
-
 static void
 ath12k_dp_mon_fill_rx_stats_info(struct hal_rx_mon_ppdu_info *ppdu_info,
 				 struct ieee80211_rx_status *rx_status)
@@ -139,21 +104,6 @@ u32 ath12k_dp_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id)
 }
 EXPORT_SYMBOL(ath12k_dp_mon_comp_ppduid);
 
-void ath12k_dp_mon_next_link_desc_get(struct ath12k_base *ab,
-				      struct hal_rx_msdu_link *msdu_link,
-				      dma_addr_t *paddr, u32 *sw_cookie, u8 *rbm,
-				      struct ath12k_buffer_addr **pp_buf_addr_info)
-{
-	struct ath12k_buffer_addr *buf_addr_info;
-
-	buf_addr_info = &msdu_link->buf_addr_info;
-
-	ath12k_hal_rx_buf_addr_info_get(&ab->hal, buf_addr_info, paddr, sw_cookie, rbm);
-
-	*pp_buf_addr_info = buf_addr_info;
-}
-EXPORT_SYMBOL(ath12k_dp_mon_next_link_desc_get);
-
 static void
 ath12k_dp_mon_fill_rx_rate(struct ath12k_pdev_dp *dp_pdev,
 			   struct hal_rx_mon_ppdu_info *ppdu_info,
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.h b/drivers/net/wireless/ath/ath12k/dp_mon.h
index 6dac4e9569b6..f5debe947ad6 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.h
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.h
@@ -8,8 +8,6 @@
 #define ATH12K_DP_MON_H
 
 #include "core.h"
-#include "wifi7/hal_desc.h"
-#include "wifi7/hal_rx.h"
 
 #define ATH12K_MON_RX_DOT11_OFFSET	5
 #define ATH12K_MON_RX_PKT_OFFSET	8
@@ -110,16 +108,9 @@ void
 ath12k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 			  bool *is_frag, u32 *total_len,
 			  u32 *frag_len, u32 *msdu_cnt);
-void ath12k_dp_mon_next_link_desc_get(struct ath12k_base *ab,
-				      struct hal_rx_msdu_link *msdu_link,
-				      dma_addr_t *paddr, u32 *sw_cookie, u8 *rbm,
-				      struct ath12k_buffer_addr **pp_buf_addr_info);
 u32 ath12k_dp_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id);
 int
 ath12k_dp_mon_parse_status_buf(struct ath12k_pdev_dp *dp_pdev,
 			       struct ath12k_mon_data *pmon,
 			       const struct dp_mon_packet_info *packet_info);
-void
-ath12k_dp_mon_parse_status_msdu_end(struct ath12k_mon_data *pmon,
-				    const struct hal_rx_msdu_end *msdu_end);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 8d913d09f882..6d829d3e1b0c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -1425,6 +1425,40 @@ ath12k_wifi7_dp_mon_parse_eht_sig_hdr(struct hal_rx_mon_ppdu_info *ppdu_info,
 		ath12k_wifi7_dp_mon_hal_rx_parse_eht_sig_ofdma(tlv_data, ppdu_info);
 }
 
+static void ath12k_wifi7_dp_mon_parse_rx_msdu_end_err(u32 info, u32 *errmap)
+{
+	if (info & RX_MSDU_END_INFO13_FCS_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_FCS;
+
+	if (info & RX_MSDU_END_INFO13_DECRYPT_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_DECRYPT;
+
+	if (info & RX_MSDU_END_INFO13_TKIP_MIC_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_TKIP_MIC;
+
+	if (info & RX_MSDU_END_INFO13_A_MSDU_ERROR)
+		*errmap |= HAL_RX_MPDU_ERR_AMSDU_ERR;
+
+	if (info & RX_MSDU_END_INFO13_OVERFLOW_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_OVERFLOW;
+
+	if (info & RX_MSDU_END_INFO13_MSDU_LEN_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_MSDU_LEN;
+
+	if (info & RX_MSDU_END_INFO13_MPDU_LEN_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_MPDU_LEN;
+}
+
+static void
+ath12k_wifi7_dp_mon_parse_status_msdu_end(struct ath12k_mon_data *pmon,
+					  const struct hal_rx_msdu_end *msdu_end)
+{
+	ath12k_wifi7_dp_mon_parse_rx_msdu_end_err(__le32_to_cpu(msdu_end->info2),
+						  &pmon->err_bitmap);
+	pmon->decap_format = le32_get_bits(msdu_end->info1,
+					   RX_MSDU_END_INFO11_DECAP_FORMAT);
+}
+
 static enum hal_rx_mon_status
 ath12k_wifi7_dp_mon_rx_parse_status_tlv(struct ath12k_pdev_dp *dp_pdev,
 					struct ath12k_mon_data *pmon,
@@ -1665,7 +1699,7 @@ ath12k_wifi7_dp_mon_rx_parse_status_tlv(struct ath12k_pdev_dp *dp_pdev,
 	case HAL_MON_BUF_ADDR:
 		return HAL_RX_MON_STATUS_BUF_ADDR;
 	case HAL_RX_MSDU_END:
-		ath12k_dp_mon_parse_status_msdu_end(pmon, tlv_data);
+		ath12k_wifi7_dp_mon_parse_status_msdu_end(pmon, tlv_data);
 		return HAL_RX_MON_STATUS_MSDU_END;
 	case HAL_RX_MPDU_END:
 		return HAL_RX_MON_STATUS_MPDU_END;
@@ -2417,6 +2451,21 @@ ath12k_wifi7_dp_mon_tx_parse_mon_status(struct ath12k_pdev_dp *dp_pdev,
 	return tlv_status;
 }
 
+static void
+ath12k_wifi7_dp_mon_next_link_desc_get(struct ath12k_base *ab,
+				       struct hal_rx_msdu_link *msdu_link,
+				       dma_addr_t *paddr, u32 *sw_cookie, u8 *rbm,
+				       struct ath12k_buffer_addr **pp_buf_addr_info)
+{
+	struct ath12k_buffer_addr *buf_addr_info;
+
+	buf_addr_info = &msdu_link->buf_addr_info;
+
+	ath12k_wifi7_hal_rx_buf_addr_info_get(buf_addr_info, paddr, sw_cookie, rbm);
+
+	*pp_buf_addr_info = buf_addr_info;
+}
+
 static u32
 ath12k_wifi7_dp_rx_mon_mpdu_pop(struct ath12k *ar, int mac_id,
 				void *ring_entry, struct sk_buff **head_msdu,
@@ -2583,9 +2632,10 @@ ath12k_wifi7_dp_rx_mon_mpdu_pop(struct ath12k *ar, int mac_id,
 		ath12k_wifi7_hal_rx_buf_addr_info_set(&buf_info, paddr,
 						      sw_cookie, rbm);
 
-		ath12k_dp_mon_next_link_desc_get(ab, msdu_link_desc, &paddr,
-						 &sw_cookie, &rbm,
-						 &p_buf_addr_info);
+		ath12k_wifi7_dp_mon_next_link_desc_get(ab,
+						       msdu_link_desc, &paddr,
+						       &sw_cookie, &rbm,
+						       &p_buf_addr_info);
 
 		ath12k_dp_arch_rx_link_desc_return(ar->ab->dp, &buf_info,
 						   HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
-- 
2.34.1


