Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E5F606A327
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MOoxJwiI;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIR2i/zC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnswPEPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7F7gp94QtePHTIoc/MUKRs/RoI1a1gYUlINvzEJjLkU=; b=MOoxJwiIHPLLzb
	Wg22XFQOyXd2hwMTkYQyuPY7wb/raazwDHyOVIl9UVZTeUMHXeolgL4Z4MADA1bZxMG+8TgXw6LcP
	tJfJxArC16o8YtWQHkoNm6xs3SEPwPGmaDlc3af5RhATZRelvnJXREDamFFfe6f2V2DkMZ/HzaJ5z
	UxBkxTytAp8LQTTgWazL1ucRzv+EqC4k7CDveDQjJW02juZtEIirAvk0xC6wgqtQKQyvXgNBZeIgI
	gs4/gsoLseWQzTNW+toCNo4JaBz1DJF4EbhzLk4OkNc2lOlLNClp0yEPbpzPzCnzJmAzh04q3QcZG
	KdOfSEzgW+1UksbSl2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh7-0000000FeuB-2ksM;
	Mon, 02 Nov 2026 06:39:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh4-0000000FerY-1bYE
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:38:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DEbn2433260
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7F7gp94QtePHTIoc/MUKRs/RoI1a1gYUlINvzEJjLkU=; b=YIR2i/zCq3JnPLM1
	mb2X7yXbk2LB9uQo4nIIq2X92xe755z7DfeI0/dH3tIc9biFBVD1qlQnnJOFC9ve
	yMSMjSwvSxu0EdfSQ1+lr7PXUwf2bCT0NabA9n2ZpAj7YIuz9bTw0j53gc8tBGEj
	JBJ63K69TEBeU85ggYBePiGP+DpOFG2l+6A2X2DFx+HIcamgfDeJkx6YMeT3hOmn
	tjAo24z/GZewrIK6QO5EQwPiCV1ATKxqHt3hzuVyGo6PTu9ltuevRFHcuiGYHe4/
	29BQH3s8kjWQLfpjtsRq87P9Gz0mtw2/gRHhzX+KivrZyxkTBdz70daO10SRxOYZ
	4n1FYg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60dh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:38:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so2290921a91.1
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601536; x=1794206336; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F7gp94QtePHTIoc/MUKRs/RoI1a1gYUlINvzEJjLkU=;
        b=YnswPEPQgyceDYzIfTcxLS+lewlFuXCbczcC6FurAblxMEH3AqqUV7zV/nNBXOYwbW
         I4Hviz59JEHxsxN/IvbxaxpvwPPYO8ZIjdePsDxQjo/9Cif1Dl3HKyQbx+0jlDDbNfjb
         gy8qYFe3RQ7X0P2nhErVwgPivbrZ9XtAGvMdxWZ7BwdIyM5bdmOsVhtwOWosrHl0QyQs
         HpwlrmlaiJ+UPWNmNgzBKOCh8DRsCPU7u4XikpT1CXv87z8DCsQpGVt16irXt22S7w1T
         I9tT199bBLtybWL1fM0GW3vtsfkD97VdKsj+f++3KzuhyPYhCSqR4iUKq5mI5jyVBWq7
         UddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601536; x=1794206336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7F7gp94QtePHTIoc/MUKRs/RoI1a1gYUlINvzEJjLkU=;
        b=RUb7nJ37MbzE0Pta7r/5Lw43lLQH2veeoMhG0LY61FpDoZAhXBAlVm2dTLfDKL5BmA
         s9NgU9UcVA5UC8S/glGBn1nE9+oym5ShvXqwgoLuWR82C4ci7WfimXcvfc2uzF7zre7k
         +LJZKklkF1E6fD87BnthbNlsJz0RVVgGzmhZGoddnvkjv9GIJWvfJ82TkNso+16bDNNz
         enmO8Ne0mIN+gnlWDl3kkWRgTHjEvdKN7+f28ARZ8zysvguDh37R4+u9U3mBbKr5FNf9
         9eaBgcjVvNZSh3I2N2m76sjzKsQc4R9IaNZBDomF7M11JxQpCrrsBc7MYS13ZJhpZYrZ
         zkSg==
X-Forwarded-Encrypted: i=1; AKwUvBz+T4di307TQ+e8xf9wJ8+lYVHIr0qxysWNGH6UqS803QSq4xdThxGFsIfIHSVZ1cTLJyrZjFQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z/mZP5BMO8bpWpx2OKij1Z3OrIW8i57XQJ9msSayZ4yCmzdebzi
	5mKPb1jRj9uWAQmr4+2ChWsTTqEcSHht/JiOeRr+UAByLCcMdG2lpYLpn231iyOD7bUCQsPkhcs
	sZi0CSUWfWI+r6p0d0V5aA9TxsHLBlMzkJERmY445jQTvw3PT2mxhz7Igl6h26b4M
X-Gm-Gg: AYBFou2HC+yrS5qEGXH/oaym5WQKybNYFVWkv1cvLCY19I1B0O5M3Mm+Mjam5gBC4ZC
	ipO2yNQcNM/jma17tALwMes2phtvricfyYJEEVI/jl/XSoOo24J6OKUGKUyN4NiqYp79H9Jzhyo
	M1lgBQvcYNijSZTQf8r9EAiujugx0EaTvkdGwpz9kIGjEtYPlaEVsIZKV52TPxkbvr9QJ99sE8j
	FxtSrBCaSqZ+TGy45fzbvi5GTXpR2Aap2gwjwzAbaL1ui0gIbyP/mJqc+6PVfWJITJTST6EgcDn
	7ObJhKETdXIZZunAfd3rexEiz4C3vkb+UYCPUfODibfWUHt+8aDYcZ1xWakB0DPPxxbhTL9L6wK
	KPIJg7xONNKQJjKW1XcVRY3GSmA+mGe/XagKGsknsFFqDnYhhCaKBbyLitwyENSCZrflU+UGh4e
	EmhzE4Ws5APMRpSWzFDXFkiGkWILRv
X-Received: by 2002:a17:90b:1cc5:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae8917bf84mr5450050a91.0.1793601536324;
        Sun, 01 Nov 2026 22:38:56 -0800 (PST)
X-Received: by 2002:a17:90b:1cc5:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae8917bf84mr5450044a91.0.1793601535616;
        Sun, 01 Nov 2026 22:38:55 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:38:55 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:14 +0800
Subject: [PATCH ath-next v4 05/11] wifi: ath12k: rename
 ath12k_skb_rxcb::hw_link_id to drv_link_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-5-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Axi8TphMQKi-kttAYNx2L4PFOSDe31Rw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX23pYNJcdxeX1
 3w2rqsA3XJqYixWW3VIS7GMRujK2zgARmVEfYif8z1FO+0eDZDPHfi4BAP9pW0zdRJQu9e6uv6y
 HayNE0eRrKxyEafaGSWjKyXzq6G9U6g=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae83001 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NxgKQpyHIDudPh6FZjkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX1hnocdxoWbFt
 H5uam7qBaKFwCVEjuQ5KU2rBaS9UMmtmxRDI7+4hmnVVBKPSNMCmw9oKmfAgHHT4oYy/l+2GbCa
 UioVg/UgGvpU84HjGG+O0J1FiBcqN7/6DAdQpWiyyyjtkua0+7iTOQppV3cgUkc53EBiFWPYkyD
 H+/44YEn9lyZbGHnmPj/BDFtzu77YoYwt8LFOG9Ey3gy+k+qbxZyU8FPPBaWXYyPguwU6Mrw/NW
 tQ9hrq1H7bdfkoQWOJaSQJt1VIaFeLZFrQytcZa8UhKHiR5rQWUf9ahwZVZKJvqM48ODBHyF1Rk
 qtQMKNqdLDxF3LXjakgP4TiiJ/OwjBmoOQIXIEFzc3tI6xmU+ekVTnavxYiuXJCFn40FuLTIoGy
 aw/r6dAAoiudZ3yBQSgfdNyolmHwT4JEQZ8zHqEe+S7mHJ8D/DW6pJ/zpwA6B4U51iFHdHD8i8+
 dvco28wFXmXYiWWyWiw==
X-Proofpoint-GUID: Axi8TphMQKi-kttAYNx2L4PFOSDe31Rw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223858_548622_0C0365C9 
X-CRM114-Status: GOOD (  15.38  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hw_link_id field of ath12k_skb_rxcb holds the driver link id of the
RX frame. This is the hw_link_id for QCN9274, but for WCN7850/QCC2072 it
is the logical_link_id instead. The hw_link_id name is therefore
misleading for the latter.

Rename it to drv_link_id to reflect that it is the driver link id
regardless of how the underlying value is derived. No functional change
intended.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h        |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index b0e28d0a152a..f1929997a35a 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -143,7 +143,7 @@ struct ath12k_skb_rxcb {
 	struct hal_rx_desc *rx_desc;
 	u8 err_rel_src;
 	u8 err_code;
-	u8 hw_link_id;
+	u8 drv_link_id;
 	u8 unmapped;
 	u8 is_frag;
 	u8 tid;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 2a0141157426..a59adbb78c76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -621,7 +621,7 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 
 	while ((msdu = __skb_dequeue(msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->hw_link_id;
+		hw_link_id = rxcb->drv_link_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp,
 						    hw_links[hw_link_id].device_id);
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
@@ -776,7 +776,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 					RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
 		rxcb->is_continuation = !!(le32_to_cpu(msdu_info->info0) &
 					   RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
-		rxcb->hw_link_id = hw_link_id;
+		rxcb->drv_link_id = hw_link_id;
 		rxcb->peer_id = ath12k_wifi7_dp_rx_get_peer_id(dp, dp->peer_metadata_ver,
 							       mpdu_info->peer_meta_data);
 		rxcb->tid = le32_get_bits(mpdu_info->info0,
@@ -2063,7 +2063,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 			skb_queue_walk(&scatter_msdu_list, msdu) {
 				rxcb = ATH12K_SKB_RXCB(msdu);
-				rxcb->hw_link_id = hw_link_id;
+				rxcb->drv_link_id = hw_link_id;
 			}
 
 			skb_queue_splice_tail_init(&scatter_msdu_list,
@@ -2071,7 +2071,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		rxcb->hw_link_id = hw_link_id;
+		rxcb->drv_link_id = hw_link_id;
 		__skb_queue_tail(&msdu_list, msdu);
 	}
 
@@ -2102,7 +2102,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 	rcu_read_lock();
 	while ((msdu = __skb_dequeue(&msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->hw_link_id;
+		hw_link_id = rxcb->drv_link_id;
 
 		device_id = hw_links[hw_link_id].device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
@@ -2368,7 +2368,7 @@ ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
 				       struct ath12k_skb_rxcb *rxcb,
 				       struct ieee80211_rx_status *status)
 {
-	return dp_peer->link_id_map[rxcb->hw_link_id];
+	return dp_peer->link_id_map[rxcb->drv_link_id];
 }
 
 int

-- 
2.25.1


