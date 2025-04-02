Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9635DC36017
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89zaCiJrmkdhsLCDqbYzQpiCR18eP3Figf1EHbgLRS4=; b=Kvhh1nv/9pY+hrBHi+1vhqz/He
	VojgvechmAZuBZQ8vLP8Mf02JQ3x5oGFg5j9AjvT+XI/asCv4KTEb1bD+v+2mcB1QXrZ880jhSxhV
	ISUG75uD3LwJ9zAF6q1nPPWyb44tccJeGGHaHgriIljN9nwyGSnobO3JIxTy405MsU7v7YaFPulPA
	kXkqe+6JKR1Hb9JzkuB476xq5BQmQmWUO7Ce9xH0wqHdpdkDyHo7XlMpgVrZ3NaOwMBLp/TFmX5LV
	Og5kUXt/itD035UtGBpYpGUauah8+EDy8y/RzBarw9dIM3sMkpVLiUDb069qIBUfIB94KC1jCwI5o
	stvos/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02qG-00000006v9D-1T43
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 18:29:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02qD-00000006v7k-1R2U
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 18:29:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532D2mtw024546
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 18:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=89zaCiJrmkd
	hsLCDqbYzQpiCR18eP3Figf1EHbgLRS4=; b=nuUSSc37k1W9AgOUQHvwFCKKfMX
	pCZzQAjOvUXbgECMUhlqlwWhKTQCPTtYIuvhQIbXcETno4lH9C48RCyKd84TAgzf
	KrXpJFjYUCTiX1axO+WEHsNQdMBtUgxkxFLE6qiI7VyL1iWe+8X6vuGVZAwZi/z0
	YWkkcvObuAOzGjl5EXjvPTpJqePMmF41uyFjNHY+AH+ililH6B9x4ohFj3/uCIF7
	XHo6XH5m8fGvuDfcG8lZfneFZO/PcSk2QcWVSmocRt35ArOIHXwZElV63VSlEjGH
	u1Peworb/ajdpgwPYlT2ASbn1fRClIeqxHuSxFEtFK2fIfqpP8qIpPhL/RQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyweyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 18:29:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2255ae39f8fso19053695ad.0
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 11:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743618572; x=1744223372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89zaCiJrmkdhsLCDqbYzQpiCR18eP3Figf1EHbgLRS4=;
        b=cvc2+MP5xNXBex0eOdW29GCt3uRttJnzYktX+fIgyCpjNI+vTNWlS6ONuZsTDnEloU
         KWlkYiEOPZHABDySDbHEAW4WyRyz4L0FSOJ2+E+VvDqc0S6sFVNo7BBT1W7Mgv9lmte6
         L8TS8EPeqon4yfMqPgrckKDM34G30R4jLgPB6mBnbbOVe/dq/4qXzaOgdWEzeOPFYuvs
         9K5ZlRFcA1OO/qRczuj+2hoDKK/E9eRs+W/DjUbuS6Wl3dWs1YbkxuxH+G8aPOjKSlwf
         hhGbDh3t9rpbMxrBTyUZKGp+EuQL8vQLTzqcx3KcqwWnGdga3bO0CBVqGETvSoJhO8ZN
         lr/Q==
X-Gm-Message-State: AOJu0YwVzt8r+n4tIayh4bOmGfYMzKhYWIVrMlusWhKzmsuI1RzfApxy
	vJazv7DbppNUJx+nhkU/b/Cc3slJZi53AiYAnxvSy95NWE1G5ti/SZjhQa0JeCAmCzf1TYn17K3
	s/wY00d3hgHfi8psc74mIcpluG/CTQuz2AS4HxEJubSkwj2+la9KTtBV8QmAP1Ld8H+Oo
X-Gm-Gg: ASbGncuC/GljN2n3irL4UPatrfQ8aerO01OqIyp/0DBm+bYcLTZXtr7+AC2Ybm9uPvP
	lC2AzhwQb9i9/JKcvOrA/9RshjW8WsXSBF4bKvokDsATXta+L5bmDqtovNiH262i+5+JdWcEICr
	RHxT4iCbUgmFM17gyAOL9NuXCp0kOGVi+fZ6tLcojmxZpE3Fv+aMaMAo7V+lFzoon5ZMhTVBx2u
	YgynrN4c2ZPpp7hX3d2QDEsnE0LtClewcAjGvtAQ1X8HP8ILkxNxbHKu64pDrK2mWvwCqKo6r+6
	vU6iE3LJqr9tiT2tNPl17ES/4ifBsV6O9BDDmZsryR+UnvWpLy3Vgm3CJdLHZUCuoLVA1TVlkfY
	7mgkmumcfJwszKECHUS1XV9YJgm8rrmi06Q==
X-Received: by 2002:a17:903:1c4:b0:221:751f:cfbe with SMTP id d9443c01a7336-229766029f8mr5548695ad.19.1743618571428;
        Wed, 02 Apr 2025 11:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1nKYcQoEGVnKcd9AuoNv/7E1ihlL7aN9gABZ6D2VBvhJw9eMux1oZvu74pVvn/FHkLoyEvg==
X-Received: by 2002:a17:903:1c4:b0:221:751f:cfbe with SMTP id d9443c01a7336-229766029f8mr5548455ad.19.1743618570864;
        Wed, 02 Apr 2025 11:29:30 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf860sm111978885ad.115.2025.04.02.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:29:30 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 2/2] wifi: ath12k: replace the usage of rx desc with rx_info
Date: Wed,  2 Apr 2025 23:59:17 +0530
Message-Id: <20250402182917.2715596-3-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402182917.2715596-1-praneesh.p@oss.qualcomm.com>
References: <20250402182917.2715596-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: koxoHpWDX3lCZmvsIJ1ebKxVom1k-uay
X-Proofpoint-ORIG-GUID: koxoHpWDX3lCZmvsIJ1ebKxVom1k-uay
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed820c cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=nCWi5yUcUyrMkYL_efIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_08,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_112933_393659_DDF87312 
X-CRM114-Status: GOOD (  20.11  )
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

In ath12k_dp_rx_h_mpdu(), during the undecap to native wifi mode, the rx
descriptor memory is overwritten. After this function call, any subsequent
accesses to rx descriptor related memory yield invalid values. Fix this by
replacing instances where rx_desc was used with the pre-cached information
in rx_info. This ensures that the values populated from the rx descriptor
are accurate and prevents invalid memory access.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
Signed-off-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 107 ++++++++++-------------
 drivers/net/wireless/ath/ath12k/dp_rx.h  |   8 +-
 3 files changed, 52 insertions(+), 67 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 6df04920a0c6..210fda4af5d0 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2080,6 +2080,7 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 	struct ieee80211_sta *pubsta = NULL;
 	struct ath12k_peer *peer;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
+	struct ath12k_dp_rx_info rx_info;
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol_tkip = rxcb->is_eapol;
 
@@ -2093,7 +2094,8 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 	}
 
 	spin_lock_bh(&ar->ab->base_lock);
-	peer = ath12k_dp_rx_h_find_peer(ar->ab, msdu);
+	rx_info.addr2_present = false;
+	peer = ath12k_dp_rx_h_find_peer(ar->ab, msdu, &rx_info);
 	if (peer && peer->sta) {
 		pubsta = peer->sta;
 		if (pubsta->valid_links) {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 27ac907789e5..be4bb71f2480 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1914,17 +1914,11 @@ static struct sk_buff *ath12k_dp_rx_get_msdu_last_buf(struct sk_buff_head *msdu_
 	return NULL;
 }
 
-static void ath12k_dp_rx_h_csum_offload(struct ath12k *ar, struct sk_buff *msdu)
+static void ath12k_dp_rx_h_csum_offload(struct sk_buff *msdu,
+					struct ath12k_dp_rx_info *rx_info)
 {
-	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
-	struct ath12k_base *ab = ar->ab;
-	bool ip_csum_fail, l4_csum_fail;
-
-	ip_csum_fail = ath12k_dp_rx_h_ip_cksum_fail(ab, rxcb->rx_desc);
-	l4_csum_fail = ath12k_dp_rx_h_l4_cksum_fail(ab, rxcb->rx_desc);
-
-	msdu->ip_summed = (ip_csum_fail || l4_csum_fail) ?
-			  CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
+	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail) ?
+			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
 static int ath12k_dp_rx_crypto_mic_len(struct ath12k *ar,
@@ -2229,10 +2223,10 @@ static void ath12k_dp_rx_h_undecap(struct ath12k *ar, struct sk_buff *msdu,
 }
 
 struct ath12k_peer *
-ath12k_dp_rx_h_find_peer(struct ath12k_base *ab, struct sk_buff *msdu)
+ath12k_dp_rx_h_find_peer(struct ath12k_base *ab, struct sk_buff *msdu,
+			 struct ath12k_dp_rx_info *rx_info)
 {
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
-	struct hal_rx_desc *rx_desc = rxcb->rx_desc;
 	struct ath12k_peer *peer = NULL;
 
 	lockdep_assert_held(&ab->base_lock);
@@ -2243,39 +2237,35 @@ ath12k_dp_rx_h_find_peer(struct ath12k_base *ab, struct sk_buff *msdu)
 	if (peer)
 		return peer;
 
-	if (!rx_desc || !(ath12k_dp_rxdesc_mac_addr2_valid(ab, rx_desc)))
-		return NULL;
+	if (rx_info->addr2_present)
+		peer = ath12k_peer_find_by_addr(ab, rx_info->addr2);
 
-	peer = ath12k_peer_find_by_addr(ab,
-					ath12k_dp_rxdesc_get_mpdu_start_addr2(ab,
-									      rx_desc));
 	return peer;
 }
 
 static void ath12k_dp_rx_h_mpdu(struct ath12k *ar,
 				struct sk_buff *msdu,
 				struct hal_rx_desc *rx_desc,
-				struct ieee80211_rx_status *rx_status)
+				struct ath12k_dp_rx_info *rx_info)
 {
-	bool  fill_crypto_hdr;
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_skb_rxcb *rxcb;
 	enum hal_encrypt_type enctype;
 	bool is_decrypted = false;
 	struct ieee80211_hdr *hdr;
 	struct ath12k_peer *peer;
+	struct ieee80211_rx_status *rx_status = rx_info->rx_status;
 	u32 err_bitmap;
 
 	/* PN for multicast packets will be checked in mac80211 */
 	rxcb = ATH12K_SKB_RXCB(msdu);
-	fill_crypto_hdr = ath12k_dp_rx_h_is_da_mcbc(ar->ab, rx_desc);
-	rxcb->is_mcbc = fill_crypto_hdr;
+	rxcb->is_mcbc = rx_info->is_mcbc;
 
 	if (rxcb->is_mcbc)
-		rxcb->peer_id = ath12k_dp_rx_h_peer_id(ar->ab, rx_desc);
+		rxcb->peer_id = rx_info->peer_id;
 
 	spin_lock_bh(&ar->ab->base_lock);
-	peer = ath12k_dp_rx_h_find_peer(ar->ab, msdu);
+	peer = ath12k_dp_rx_h_find_peer(ar->ab, msdu, rx_info);
 	if (peer) {
 		if (rxcb->is_mcbc)
 			enctype = peer->sec_type_grp;
@@ -2305,7 +2295,7 @@ static void ath12k_dp_rx_h_mpdu(struct ath12k *ar,
 	if (is_decrypted) {
 		rx_status->flag |= RX_FLAG_DECRYPTED | RX_FLAG_MMIC_STRIPPED;
 
-		if (fill_crypto_hdr)
+		if (rx_info->is_mcbc)
 			rx_status->flag |= RX_FLAG_MIC_STRIPPED |
 					RX_FLAG_ICV_STRIPPED;
 		else
@@ -2313,37 +2303,28 @@ static void ath12k_dp_rx_h_mpdu(struct ath12k *ar,
 					   RX_FLAG_PN_VALIDATED;
 	}
 
-	ath12k_dp_rx_h_csum_offload(ar, msdu);
+	ath12k_dp_rx_h_csum_offload(msdu, rx_info);
 	ath12k_dp_rx_h_undecap(ar, msdu, rx_desc,
 			       enctype, rx_status, is_decrypted);
 
-	if (!is_decrypted || fill_crypto_hdr)
+	if (!is_decrypted || rx_info->is_mcbc)
 		return;
 
-	if (ath12k_dp_rx_h_decap_type(ar->ab, rx_desc) !=
-	    DP_RX_DECAP_TYPE_ETHERNET2_DIX) {
+	if (rx_info->decap_type != DP_RX_DECAP_TYPE_ETHERNET2_DIX) {
 		hdr = (void *)msdu->data;
 		hdr->frame_control &= ~__cpu_to_le16(IEEE80211_FCTL_PROTECTED);
 	}
 }
 
-static void ath12k_dp_rx_h_rate(struct ath12k *ar, struct hal_rx_desc *rx_desc,
-				struct ieee80211_rx_status *rx_status)
+static void ath12k_dp_rx_h_rate(struct ath12k *ar, struct ath12k_dp_rx_info *rx_info)
 {
-	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_supported_band *sband;
-	enum rx_msdu_start_pkt_type pkt_type;
-	u8 bw;
-	u8 rate_mcs, nss;
-	u8 sgi;
+	struct ieee80211_rx_status *rx_status = rx_info->rx_status;
+	enum rx_msdu_start_pkt_type pkt_type = rx_info->pkt_type;
+	u8 bw = rx_info->bw, sgi = rx_info->sgi;
+	u8 rate_mcs = rx_info->rate_mcs, nss = rx_info->nss;
 	bool is_cck;
 
-	pkt_type = ath12k_dp_rx_h_pkt_type(ab, rx_desc);
-	bw = ath12k_dp_rx_h_rx_bw(ab, rx_desc);
-	rate_mcs = ath12k_dp_rx_h_rate_mcs(ab, rx_desc);
-	nss = ath12k_dp_rx_h_nss(ab, rx_desc);
-	sgi = ath12k_dp_rx_h_sgi(ab, rx_desc);
-
 	switch (pkt_type) {
 	case RX_MSDU_START_PKT_TYPE_11A:
 	case RX_MSDU_START_PKT_TYPE_11B:
@@ -2412,9 +2393,8 @@ static void ath12k_dp_rx_h_rate(struct ath12k *ar, struct hal_rx_desc *rx_desc,
 	}
 }
 
-static void ath12k_dp_rx_h_fetch_info(struct ath12k_base *ab,
-				      struct hal_rx_desc *rx_desc,
-				      struct ath12k_dp_rx_info *rx_info)
+void ath12k_dp_rx_h_fetch_info(struct ath12k_base *ab, struct hal_rx_desc *rx_desc,
+			       struct ath12k_dp_rx_info *rx_info)
 {
 	rx_info->ip_csum_fail = ath12k_dp_rx_h_ip_cksum_fail(ab, rx_desc);
 	rx_info->l4_csum_fail = ath12k_dp_rx_h_l4_cksum_fail(ab, rx_desc);
@@ -2434,12 +2414,14 @@ static void ath12k_dp_rx_h_fetch_info(struct ath12k_base *ab,
 				ath12k_dp_rxdesc_get_mpdu_start_addr2(ab, rx_desc));
 		rx_info->addr2_present = true;
 	}
+
+	ath12k_dbg_dump(ab, ATH12K_DBG_DATA, NULL, "rx_desc: ",
+			rx_desc, sizeof(*rx_desc));
 }
 
-void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct hal_rx_desc *rx_desc,
-			 struct ieee80211_rx_status *rx_status)
+void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct ath12k_dp_rx_info *rx_info)
 {
-	struct ath12k_base *ab = ar->ab;
+	struct ieee80211_rx_status *rx_status = rx_info->rx_status;
 	u8 channel_num;
 	u32 center_freq, meta_data;
 	struct ieee80211_channel *channel;
@@ -2453,7 +2435,7 @@ void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct hal_rx_desc *rx_desc,
 
 	rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 
-	meta_data = ath12k_dp_rx_h_freq(ab, rx_desc);
+	meta_data = rx_info->phy_meta_data;
 	channel_num = meta_data;
 	center_freq = meta_data >> 16;
 
@@ -2474,20 +2456,18 @@ void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct hal_rx_desc *rx_desc,
 				ieee80211_frequency_to_channel(channel->center_freq);
 		}
 		spin_unlock_bh(&ar->data_lock);
-		ath12k_dbg_dump(ar->ab, ATH12K_DBG_DATA, NULL, "rx_desc: ",
-				rx_desc, sizeof(*rx_desc));
 	}
 
 	if (rx_status->band != NL80211_BAND_6GHZ)
 		rx_status->freq = ieee80211_channel_to_frequency(channel_num,
 								 rx_status->band);
 
-	ath12k_dp_rx_h_rate(ar, rx_desc, rx_status);
+	ath12k_dp_rx_h_rate(ar, rx_info);
 }
 
 static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *napi,
 				      struct sk_buff *msdu,
-				      struct ieee80211_rx_status *status)
+				      struct ath12k_dp_rx_info *rx_info)
 {
 	struct ath12k_base *ab = ar->ab;
 	static const struct ieee80211_radiotap_he known = {
@@ -2500,6 +2480,7 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 	struct ieee80211_sta *pubsta;
 	struct ath12k_peer *peer;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
+	struct ieee80211_rx_status *status = rx_info->rx_status;
 	u8 decap = DP_RX_DECAP_TYPE_RAW;
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol = rxcb->is_eapol;
@@ -2512,10 +2493,10 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 	}
 
 	if (!(status->flag & RX_FLAG_ONLY_MONITOR))
-		decap = ath12k_dp_rx_h_decap_type(ab, rxcb->rx_desc);
+		decap = rx_info->decap_type;
 
 	spin_lock_bh(&ab->base_lock);
-	peer = ath12k_dp_rx_h_find_peer(ab, msdu);
+	peer = ath12k_dp_rx_h_find_peer(ab, msdu, rx_info);
 
 	pubsta = peer ? peer->sta : NULL;
 
@@ -2659,8 +2640,8 @@ static int ath12k_dp_rx_process_msdu(struct ath12k *ar,
 	}
 
 	ath12k_dp_rx_h_fetch_info(ab, rx_desc, rx_info);
-	ath12k_dp_rx_h_ppdu(ar, rx_desc, rx_info->rx_status);
-	ath12k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_info->rx_status);
+	ath12k_dp_rx_h_ppdu(ar, rx_info);
+	ath12k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_info);
 
 	rx_info->rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
 
@@ -2720,7 +2701,7 @@ static void ath12k_dp_rx_process_received_packets(struct ath12k_base *ab,
 			continue;
 		}
 
-		ath12k_dp_rx_deliver_msdu(ar, napi, msdu, &rx_status);
+		ath12k_dp_rx_deliver_msdu(ar, napi, msdu, &rx_info);
 	}
 
 	rcu_read_unlock();
@@ -3062,7 +3043,7 @@ static int ath12k_dp_rx_h_verify_tkip_mic(struct ath12k *ar, struct ath12k_peer
 	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(ab, rx_desc, msdu)))
 		return -EINVAL;
 
-	ath12k_dp_rx_h_ppdu(ar, rx_desc, rxs);
+	ath12k_dp_rx_h_ppdu(ar, &rx_info);
 	ath12k_dp_rx_h_undecap(ar, msdu, rx_desc,
 			       HAL_ENCRYPT_TYPE_TKIP_MIC, rxs, true);
 	ieee80211_rx(ath12k_ar_to_hw(ar), msdu);
@@ -3808,10 +3789,10 @@ static int ath12k_dp_rx_h_null_q_desc(struct ath12k *ar, struct sk_buff *msdu,
 		return -EINVAL;
 
 	ath12k_dp_rx_h_fetch_info(ab, desc, rx_info);
-	ath12k_dp_rx_h_ppdu(ar, desc, rx_info->rx_status);
-	ath12k_dp_rx_h_mpdu(ar, msdu, desc, rx_info->rx_status);
+	ath12k_dp_rx_h_ppdu(ar, rx_info);
+	ath12k_dp_rx_h_mpdu(ar, msdu, desc, rx_info);
 
-	rxcb->tid = ath12k_dp_rx_h_tid(ab, desc);
+	rxcb->tid = rx_info->tid;
 
 	/* Please note that caller will having the access to msdu and completing
 	 * rx with mac80211. Need not worry about cleaning up amsdu_list.
@@ -3872,7 +3853,7 @@ static bool ath12k_dp_rx_h_tkip_mic_err(struct ath12k *ar, struct sk_buff *msdu,
 	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(ab, desc, msdu)))
 		return true;
 
-	ath12k_dp_rx_h_ppdu(ar, desc, rx_info->rx_status);
+	ath12k_dp_rx_h_ppdu(ar, rx_info);
 
 	rx_info->rx_status->flag |= (RX_FLAG_MMIC_STRIPPED | RX_FLAG_MMIC_ERROR |
 				     RX_FLAG_DECRYPTED);
@@ -3944,7 +3925,7 @@ static void ath12k_dp_rx_wbm_err(struct ath12k *ar,
 		return;
 	}
 
-	ath12k_dp_rx_deliver_msdu(ar, napi, msdu, &rxs);
+	ath12k_dp_rx_deliver_msdu(ar, napi, msdu, &rx_info);
 }
 
 int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 0e7cec42a8d1..eb4d2b60a035 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -149,13 +149,13 @@ int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev
 u8 ath12k_dp_rx_h_l3pad(struct ath12k_base *ab,
 			struct hal_rx_desc *desc);
 struct ath12k_peer *
-ath12k_dp_rx_h_find_peer(struct ath12k_base *ab, struct sk_buff *msdu);
+ath12k_dp_rx_h_find_peer(struct ath12k_base *ab, struct sk_buff *msdu,
+			 struct ath12k_dp_rx_info *rx_info);
 u8 ath12k_dp_rx_h_decap_type(struct ath12k_base *ab,
 			     struct hal_rx_desc *desc);
 u32 ath12k_dp_rx_h_mpdu_err(struct ath12k_base *ab,
 			    struct hal_rx_desc *desc);
-void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct hal_rx_desc *rx_desc,
-			 struct ieee80211_rx_status *rx_status);
+void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct ath12k_dp_rx_info *rx_info);
 int ath12k_dp_rxdma_ring_sel_config_qcn9274(struct ath12k_base *ab);
 int ath12k_dp_rxdma_ring_sel_config_wcn7850(struct ath12k_base *ab);
 
@@ -163,4 +163,6 @@ int ath12k_dp_htt_tlv_iter(struct ath12k_base *ab, const void *ptr, size_t len,
 			   int (*iter)(struct ath12k_base *ar, u16 tag, u16 len,
 				       const void *ptr, void *data),
 			   void *data);
+void ath12k_dp_rx_h_fetch_info(struct ath12k_base *ab,  struct hal_rx_desc *rx_desc,
+			       struct ath12k_dp_rx_info *rx_info);
 #endif /* ATH12K_DP_RX_H */
-- 
2.34.1


