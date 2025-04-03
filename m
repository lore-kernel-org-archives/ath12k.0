Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C07FC3600C
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 19:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bp0RHBYrodI2aWaiYYQ54UBApmeQSQqecAUY1harybc=; b=zTJn0VAJdJydxhcbXugs8KVEaI
	gu2dhJ/MHAVb0BYYnZRmVANDNehA0Ej2/pBtf17hLwxQJiTPnaKYRyq4EGSJosBQA2yCvdxqaMKCM
	Deu4NH34fGZmo7P3wZc1Th/kkoiAQgoHRXTfv0RKaddtke8sPr+aiUvbH/CJbmh0TNta9ZxV2bw0C
	+C31oiJizeILDOyUOBp1PLlg3SvwTLyn+e+Smfs7R9Vd+CAsPYD0CWdscJ92HdUdCOwPN/8uiqWQr
	8RjPCjcE/G2FI9AtFOpgriGRdODAu2jZDeJ9gKlKidin7RNOsylTVHfubSheg8yOkgeRGNMaksDeF
	m5eucnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q3S-00000009hJh-15LT
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 19:16:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PvI-00000009er4-46YV
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 19:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 573A9A44D86;
	Thu,  3 Apr 2025 19:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BCAC4CEE3;
	Thu,  3 Apr 2025 19:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707299;
	bh=/Yub4lT7aD2xIVcZqeAHU83N1ZmhwzTtby6qqIoLDC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jWtIdoku/BhdgucHJt3XDJuSWCwOrMC/NzkwRQEXPNDSBcS1T+pxH7U4ZDBlSmAlz
	 PPIUNBtYTiS+IJ9jo+stVFXibQgArW7soAW7gW10ysAcG2IRzv1oH83rp4iaDuu2/m
	 LaR/YxJXaKMy3SdWlxjilFmeZ9f0SJJ+FfPtrIiQdDp9yfOLhQ7pMIRLDBkD2XKVEl
	 qovzvRDO/zvH47S7vfwPIYGWICl36/eJLDR/0yqsVlNORVbVkOGX/LJQ+gWbUWQ04y
	 X29vEnYhWlcMdAO3YPfizDqe2MmC3yFaptXfgHyvXmeP8gsVGLk8HgdBFW1ngH/bN9
	 KibK3+T7FEsbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Manish Dharanenthiran <quic_mdharane@quicinc.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 14/26] wifi: ath12k: Fix invalid data access in ath12k_dp_rx_h_undecap_nwifi
Date: Thu,  3 Apr 2025 15:07:33 -0400
Message-Id: <20250403190745.2677620-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190745.2677620-1-sashal@kernel.org>
References: <20250403190745.2677620-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_120821_143799_9D526419 
X-CRM114-Status: GOOD (  12.13  )
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

From: Manish Dharanenthiran <quic_mdharane@quicinc.com>

[ Upstream commit 9a0dddfb30f120db3851627935851d262e4e7acb ]

In certain cases, hardware might provide packets with a
length greater than the maximum native Wi-Fi header length.
This can lead to accessing and modifying fields in the header
within the ath12k_dp_rx_h_undecap_nwifi function for
DP_RX_DECAP_TYPE_NATIVE_WIFI decap type and
potentially resulting in invalid data access and memory corruption.

Add a sanity check before processing the SKB to prevent invalid
data access in the undecap native Wi-Fi function for the
DP_RX_DECAP_TYPE_NATIVE_WIFI decap type.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manish Dharanenthiran <quic_mdharane@quicinc.com>
Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Link: https://patch.msgid.link/20250211090302.4105141-1-tamizh.raja@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 42 +++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 70ad035acac75..8d9315038a75e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2484,6 +2484,29 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 	ieee80211_rx_napi(ar->hw, pubsta, msdu, napi);
 }
 
+static bool ath12k_dp_rx_check_nwifi_hdr_len_valid(struct ath12k_base *ab,
+						   struct hal_rx_desc *rx_desc,
+						   struct sk_buff *msdu)
+{
+	struct ieee80211_hdr *hdr;
+	u8 decap_type;
+	u32 hdr_len;
+
+	decap_type = ath12k_dp_rx_h_decap_type(ab, rx_desc);
+	if (decap_type != DP_RX_DECAP_TYPE_NATIVE_WIFI)
+		return true;
+
+	hdr = (struct ieee80211_hdr *)msdu->data;
+	hdr_len = ieee80211_hdrlen(hdr->frame_control);
+
+	if ((likely(hdr_len <= DP_MAX_NWIFI_HDR_LEN)))
+		return true;
+
+	ab->soc_stats.invalid_rbm++;
+	WARN_ON_ONCE(1);
+	return false;
+}
+
 static int ath12k_dp_rx_process_msdu(struct ath12k *ar,
 				     struct sk_buff *msdu,
 				     struct sk_buff_head *msdu_list,
@@ -2542,6 +2565,11 @@ static int ath12k_dp_rx_process_msdu(struct ath12k *ar,
 		}
 	}
 
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(ab, rx_desc, msdu))) {
+		ret = -EINVAL;
+		goto free_out;
+	}
+
 	ath12k_dp_rx_h_ppdu(ar, rx_desc, rx_status);
 	ath12k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
 
@@ -2867,6 +2895,9 @@ static int ath12k_dp_rx_h_verify_tkip_mic(struct ath12k *ar, struct ath12k_peer
 		    RX_FLAG_IV_STRIPPED | RX_FLAG_DECRYPTED;
 	skb_pull(msdu, hal_rx_desc_sz);
 
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(ab, rx_desc, msdu)))
+		return -EINVAL;
+
 	ath12k_dp_rx_h_ppdu(ar, rx_desc, rxs);
 	ath12k_dp_rx_h_undecap(ar, msdu, rx_desc,
 			       HAL_ENCRYPT_TYPE_TKIP_MIC, rxs, true);
@@ -3590,6 +3621,9 @@ static int ath12k_dp_rx_h_null_q_desc(struct ath12k *ar, struct sk_buff *msdu,
 		skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 		skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 	}
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(ab, desc, msdu)))
+		return -EINVAL;
+
 	ath12k_dp_rx_h_ppdu(ar, desc, status);
 
 	ath12k_dp_rx_h_mpdu(ar, msdu, desc, status);
@@ -3634,7 +3668,7 @@ static bool ath12k_dp_rx_h_reo_err(struct ath12k *ar, struct sk_buff *msdu,
 	return drop;
 }
 
-static void ath12k_dp_rx_h_tkip_mic_err(struct ath12k *ar, struct sk_buff *msdu,
+static bool ath12k_dp_rx_h_tkip_mic_err(struct ath12k *ar, struct sk_buff *msdu,
 					struct ieee80211_rx_status *status)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -3652,6 +3686,9 @@ static void ath12k_dp_rx_h_tkip_mic_err(struct ath12k *ar, struct sk_buff *msdu,
 	skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 	skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(ab, desc, msdu)))
+		return true;
+
 	ath12k_dp_rx_h_ppdu(ar, desc, status);
 
 	status->flag |= (RX_FLAG_MMIC_STRIPPED | RX_FLAG_MMIC_ERROR |
@@ -3659,6 +3696,7 @@ static void ath12k_dp_rx_h_tkip_mic_err(struct ath12k *ar, struct sk_buff *msdu,
 
 	ath12k_dp_rx_h_undecap(ar, msdu, desc,
 			       HAL_ENCRYPT_TYPE_TKIP_MIC, status, false);
+	return false;
 }
 
 static bool ath12k_dp_rx_h_rxdma_err(struct ath12k *ar,  struct sk_buff *msdu,
@@ -3677,7 +3715,7 @@ static bool ath12k_dp_rx_h_rxdma_err(struct ath12k *ar,  struct sk_buff *msdu,
 	case HAL_REO_ENTR_RING_RXDMA_ECODE_TKIP_MIC_ERR:
 		err_bitmap = ath12k_dp_rx_h_mpdu_err(ab, rx_desc);
 		if (err_bitmap & HAL_RX_MPDU_ERR_TKIP_MIC) {
-			ath12k_dp_rx_h_tkip_mic_err(ar, msdu, status);
+			drop = ath12k_dp_rx_h_tkip_mic_err(ar, msdu, status);
 			break;
 		}
 		fallthrough;
-- 
2.39.5


