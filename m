Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29920C3601E
	for <ath12k@archiver.kernel.org>; Sun,  6 Apr 2025 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0tM2DPre0Ldp0/ZIlfrbOSXjpI6KyDpurJ2ZSWcWfE=; b=ObdAz3nY8Lq7/mXz64/0WyHNP5
	pWZNtuxnt1CK7ryRm5W/achT1rViBDrf1h0bIhT1fp5x8BICt8qkh46BEiWec6LFykoXKoKvzUIvd
	GkP5MXYdyBg8/eO61xuKpQytk307dQMgXg7+hGkdyRCvvL68Pdb92u/ZyP50ZtES1vcN2ElfhOT2L
	qMn5JQkfgdKqZC8P8ywJHhvwjAZnn8NRSk1VRgx3w1uuVII5tgd8higmZcxuNcv1cV72MyTCMdq70
	MsRU2J7MNRq09HMJXZ3a/y3N8itWsizBP8xtIZuOS2TeyleC3ZA+U1zuUE/ap+A+n5eFSUj3UXJlo
	RTaVzeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1MCz-0000000F79v-3qPd
	for ath12k@archiver.kernel.org;
	Sun, 06 Apr 2025 09:22:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1MCw-0000000F78N-00Rk
	for ath12k@lists.infradead.org;
	Sun, 06 Apr 2025 09:22:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5369LeE8019200
	for <ath12k@lists.infradead.org>; Sun, 6 Apr 2025 09:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0tM2DPre0L
	dp0/ZIlfrbOSXjpI6KyDpurJ2ZSWcWfE=; b=fAiyKyc85lwJ50mLjiStx46rkvT
	uWTpq+O4iF+xratR3s3/bv1bmHDBVt7hUXzL7f3440UY2qKcmtKtx5BQty0Q/AmZ
	u4N14q8Tgmmax/NylXQXcQw6AT0ZPdC4Xd0nNyTlE/dKLmjbovBoMb9ay7kpa5Lv
	FCGiLbctHIqD9pbWxKBH1j68uQ+xfoguc2BB6ZrPjPLod8C2I+0yNpQzAQwz9BR4
	aglNjFNhwNLJ9eFQeTgUFbkM5JsGJAb7oPQW2b7UjNOPckWwbKvQHSz/QrN/MPj0
	aHj6qnsN1vdg4qRE0YoBNqi0W8/vT8EWrLnnHcLWXQXHQXGbvZZJerFAG0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twft9nha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 06 Apr 2025 09:22:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-306b590faaeso551766a91.3
        for <ath12k@lists.infradead.org>; Sun, 06 Apr 2025 02:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743931344; x=1744536144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0tM2DPre0Ldp0/ZIlfrbOSXjpI6KyDpurJ2ZSWcWfE=;
        b=tXMSIGfomwLRQ8I8597sExscM/KPp4UysScgiCvGjzRaGhVnpvyYBC1omG7mllM8nP
         RmeyfywS9B+ixDBP2iJ1RcKDAcWlZloYevEgsSby0nUoQ3Ktv+Y7pKakYNT0JQYeiXQ3
         +6H6D16jwxvwjzuRNXKHcfZWF6QBbyOSW9rcojeH/gK7ztHeMceCGM9225AZXDvZ6cRO
         wJbZBRPNFI9Z0ojgSQ+ROCrrajh2EnFSRm7pfHFFCBlUil/1oNGU/zdxA9tVCam/2gcv
         G0HmQ7ZzBh9sUIJco80VzZ5YmOW1p4X7wEzvmtJvJ2+CMhardjQgLHZcVTUuw9CghSEb
         yk1g==
X-Gm-Message-State: AOJu0YwAob3cDHcYNMG9SW+uYRTIq6x0WZIahTFK0/nb14Gl7fo0ezwT
	gbEfoKwkIKIrOfzocblQwRlVRfVvozcQGEvuXMAfaKN8/9SH11b39kE4VNgWNvKjlj6Q92SIW+u
	bIoVff6iYRuNIJU/78r9wiFjPeB1mGMQY2UIrzxGaZ9J4Fyyj5XugGwzX57tCZAb0CiAX
X-Gm-Gg: ASbGncv4vnY/T8wrl7oeQjGzrcWObnPvBvb7fuLCCmFNf7Yr/TsOAmgxJNjDwSrYYP1
	4g7ke1vp3Z/Ko3774Z/ho8XOZyM8hQXeWkrUGkkHsSa8ZFU4quq5Q4pmVYIRY/JnBKFzau7ojEC
	Hz8HWrmvarUMZjhLkJ9BSoX9CoVLxWFEB0C4AtzcCak/FMhfS2C15NGyOBZ9qgx50MbqSfXWE43
	hab/fO4UTb99auwH7qxvLPT8+wDGgmNvLUBprMKQlKXmLO6pEByyDflTx8E1aAuOvcG1vspzV/0
	nrEXi18FV5QQibr68irNuNkQUyhDyKqfXB378IYhNIXIaUGRxdeeTtLnqcAnDvjReY3L/KnWRH0
	PEPBH9xpdYCr1lCbLkNltcnLHnLGw4TW1FhAujiB8JH5S
X-Received: by 2002:a17:90b:2d88:b0:2fe:7f40:420a with SMTP id 98e67ed59e1d1-306a61769e1mr14157797a91.17.1743931343765;
        Sun, 06 Apr 2025 02:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlO0hQvfZ/61O4+pLoAYz1LDgM30pfG851yk88I3n5V6Qq+28gqJ4KJIKZIbiMfGkiOWn1gw==
X-Received: by 2002:a17:90b:2d88:b0:2fe:7f40:420a with SMTP id 98e67ed59e1d1-306a61769e1mr14157772a91.17.1743931343422;
        Sun, 06 Apr 2025 02:22:23 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5e75asm6857311a91.37.2025.04.06.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 02:22:23 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: avoid multiple skb_cb fetch in ath12k_mac_mgmt_tx_wmi()
Date: Sun,  6 Apr 2025 14:52:14 +0530
Message-Id: <20250406092214.3602182-3-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250406092214.3602182-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250406092214.3602182-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f247d1 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Lpz1UfvgpueRW3gVfIYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7WZbwkrPED7O-wCkelcTObnSVDVC3bwO
X-Proofpoint-ORIG-GUID: 7WZbwkrPED7O-wCkelcTObnSVDVC3bwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=915
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_022226_043750_A6B76115 
X-CRM114-Status: GOOD (  13.36  )
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

ath12k_mac_mgmt_tx_wmi() fetches ath12k's skb_cb space multiple times from
TX skb which is redundant operation. Save the skb_cb in a local pointer
and use the same instead.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a1e5d94b400d..0fa5c9df19b2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7095,6 +7095,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
 	struct ieee80211_tx_info *info;
 	enum hal_encrypt_type enctype;
 	unsigned int mic_len;
@@ -7104,7 +7105,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	ATH12K_SKB_CB(skb)->ar = ar;
+	skb_cb->ar = ar;
 	spin_lock_bh(&ar->txmgmt_idr_lock);
 	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
 			   ATH12K_TX_MGMT_NUM_PENDING_MAX, GFP_ATOMIC);
@@ -7113,14 +7114,13 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 		return -ENOSPC;
 
 	info = IEEE80211_SKB_CB(skb);
-	if ((ATH12K_SKB_CB(skb)->flags & ATH12K_SKB_CIPHER_SET) &&
+	if ((skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
 	    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)) {
 		if ((ieee80211_is_action(hdr->frame_control) ||
 		     ieee80211_is_deauth(hdr->frame_control) ||
 		     ieee80211_is_disassoc(hdr->frame_control)) &&
 		     ieee80211_has_protected(hdr->frame_control)) {
-			enctype =
-			    ath12k_dp_tx_get_encrypt_type(ATH12K_SKB_CB(skb)->cipher);
+			enctype = ath12k_dp_tx_get_encrypt_type(skb_cb->cipher);
 			mic_len = ath12k_dp_rx_crypto_mic_len(ar, enctype);
 			skb_put(skb, mic_len);
 		}
@@ -7133,7 +7133,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 		goto err_free_idr;
 	}
 
-	ATH12K_SKB_CB(skb)->paddr = paddr;
+	skb_cb->paddr = paddr;
 
 	ret = ath12k_wmi_mgmt_send(ar, arvif->vdev_id, buf_id, skb);
 	if (ret) {
@@ -7144,7 +7144,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 	return 0;
 
 err_unmap_buf:
-	dma_unmap_single(ab->dev, ATH12K_SKB_CB(skb)->paddr,
+	dma_unmap_single(ab->dev, skb_cb->paddr,
 			 skb->len, DMA_TO_DEVICE);
 err_free_idr:
 	spin_lock_bh(&ar->txmgmt_idr_lock);
-- 
2.34.1


