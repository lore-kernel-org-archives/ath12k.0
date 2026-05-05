Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24A3FF885A
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 03:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ULgjh7gRzncQqfUkXQITrX2NaPFkwBvkv8KtXTgFj4c=; b=LO+X6pq73jrLFSVBipqcW9yktX
	fXsRzmjWgxfdzI56bUNe6iIFNEiHcrY8sujkq0V7y62dJiQxtgBZFTR8gVeCobi9ZbiBa8o+E0ON+
	IU4Jw4O2pELJX4vouD2/MyYvXZ1h8HV4uN7bhG/DkD4x+joqgV7/8aD5LsB4+bayDg6Gr9v5yavhE
	6ECyeE1L/LRU4P6bg9kAjPg0tdBfIAJ47E8BpfY2jESDMyrpiPg0imatDRCW8iZT25vF6lTHGzDSz
	1vD7dPb0PcU0JINnqVOqvVom6JRvBvCZveCpTqSesgTUV5aE8JZj0wUM73lwqj2l/XYiWovXtOL4N
	xEc3RcCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6oH-0000000F3Kr-25B3;
	Tue, 05 May 2026 03:51:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6oF-0000000F3KB-0ZFY
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 03:51:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8296d553142so3601172b3a.3
        for <ath12k@lists.infradead.org>; Mon, 04 May 2026 20:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777953057; x=1778557857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ULgjh7gRzncQqfUkXQITrX2NaPFkwBvkv8KtXTgFj4c=;
        b=Y97IS5EpjfijDLeOwj40nzqJb98alFtngrxN69WUI4kqdvVEkjHVDyZYBge2eoCYEF
         pMDaed2j4ZXvdgc1kmq1IlJwZWb+AEr04czMeVJjR8b//oOBshPMxN3HAEHSu2Ypu7hq
         05fGbnZRuZyVaHctoLI77ASTHdXp32hNFsGaP6QxDBVIChbs2KD5g0XxI6gAYBBTqQKU
         Bzt5Znswh8qnr3jv4+pD+RMmKnaOlA0kBV0NYsjZ5CAMkH7Ju0S0/Zb1QJi7xSGwRBht
         UGao/ex73TSi6ph4cloHnzR0kNpAmymAwU/vX77YmFPNwkHqA2hDVue2zskRQEkxwGnb
         R+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777953057; x=1778557857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULgjh7gRzncQqfUkXQITrX2NaPFkwBvkv8KtXTgFj4c=;
        b=T1wEc+/al67fjrXaxJHBos5ZdsDT6KBLSFqWDNIFz7brJ9jqqFtSZDeaOCJcsMxkkk
         0fXNMzJzyu3KaOt5BDYwcTrq4WLiSvLluTN4EiUtffnXaULGI++pEFCmoFG/0E88mWfg
         TD3IQa0aoKKcTeDRJK4Loc+xDd8Y+oylmggedzQXv11C4HLSPqZIZltOugdmgyhWVy49
         RLUr1YqM+Y3Pipp0xP2YRdT5hNExc/owzQ4op0coieouxQBvRAVjRnzQTIeMmIX0SDD5
         Nbp9SEI8ZJ/WMpeY9wdI6YcHD61hsTqbDrXdoansF9wg/6hdUMzu1zhjAld6xUvTi2QR
         0rrw==
X-Gm-Message-State: AOJu0YzsNkZnB+8+DbaV3FFrq9GwIZUwyOsBxI+JM7844rZlm1SAO3gf
	RJG/2p9fkF6DBrh1M/hX7X2MnnbJ4JbFcTjn/YvgSGRcUYD1RQzXT1/FEPPJ7Q==
X-Gm-Gg: AeBDieuzdI8FE5KnrXAAyykLWpmtP9e54I8jFTv6nbIBvy7YyNEd8WhOUhfcL/yf/Re
	3Se+ce7IlMVCVtkAnzFDjPM8pFlrFB+FFkS9+QJgvLsdGSiL7Gm9IHTQ/CkhjLdmUM7y/xeQYUg
	1GoqBBhxXGIsr3wkkOev6yI+qHQ3zZ6fzRdDXNDlhE2LoQr/dwkT9GIsWMxZGlNYH4bva1NUCwV
	w7MDvI5QY+nvcLGdauiQdN9MkzBeDGb7a5lM/KxJr/3Xwye3Z8Otip7WF4CjEAprvtKhXVXqbmM
	npe0zm799DGHi2KWnGfbIwMVST44V3a/CzRnA2h2BS0Ispl7NBUjdiZMkKIx1lIUkQzQ2KTEZVA
	Z7Mjb+iiY5NLdxmwo0ZZNMJOesypR3f1KeL6SWZ0IIFjdiuO+zX9SHksQV63brP1najkrT4ILmA
	Ulcx/gLNWv6AzFEKqFhJ1+BXfxeArKmVk8RHEp7CZLUYrh1Pg=
X-Received: by 2002:a05:6a00:a87:b0:837:8b75:a5a7 with SMTP id d2e1a72fcca58-8378b75afc4mr6382375b3a.48.1777953056954;
        Mon, 04 May 2026 20:50:56 -0700 (PDT)
Received: from kwan-H610MHP.. ([180.75.11.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c86b3sm513508b3a.28.2026.05.04.20.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 20:50:56 -0700 (PDT)
From: kwan1996 <laicheehou9@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kwan1996 <laicheehou9@gmail.com>
Subject: [PATCH] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS reporting in monitor mode
Date: Tue,  5 May 2026 11:50:00 +0800
Message-Id: <20260505035000.55379-1-laicheehou9@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_205059_178316_E65866BA 
X-CRM114-Status: GOOD (  10.14  )
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

In monitor mode, the driver incorrectly assigns the legacy rate
to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
frames, ignoring the actual MCS value parsed from the hardware.

This causes packet analyzers (like Wireshark) to display incorrect
MCS values (e.g., legacy base rates instead of the true MCS).

Fix this by assigning ppdu_info->mcs instead of ppdu_info->rate
for HT/VHT/HE/EHT frame types in ath12k_dp_mon_fill_rx_rate()
and ath12k_dp_mon_update_radiotap().

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220864

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ

Signed-off-by: kwan1996 <laicheehou9@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 39d1967..729b390 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1925,6 +1925,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 		}
 		break;
 	case RX_MSDU_START_PKT_TYPE_11N:
+	  rate_mcs = ppdu_info->mcs;
 		rx_status->encoding = RX_ENC_HT;
 		if (rate_mcs > ATH12K_HT_MCS_MAX) {
 			ath12k_warn(ar->ab,
@@ -1937,6 +1938,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AC:
+	  rate_mcs = ppdu_info->mcs;
 		rx_status->encoding = RX_ENC_VHT;
 		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_VHT_MCS_MAX) {
@@ -1949,6 +1951,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AX:
+	  rate_mcs = ppdu_info->mcs;
 		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_HE_MCS_MAX) {
 			ath12k_warn(ar->ab,
@@ -1960,6 +1963,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 		rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11BE:
+	  rate_mcs = ppdu_info->mcs;
 		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH12K_EHT_MCS_MAX) {
 			ath12k_warn(ar->ab,
@@ -2259,13 +2263,13 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 		rxs->encoding = RX_ENC_HE;
 		ptr = skb_push(mon_skb, sizeof(struct ieee80211_radiotap_he));
 		ath12k_dp_mon_rx_update_radiotap_he(ppduinfo, ptr);
-		rxs->rate_idx = ppduinfo->rate;
+		rxs->rate_idx = ppduinfo->mcs;
 	} else if (ppduinfo->vht_flags) {
 		rxs->encoding = RX_ENC_VHT;
-		rxs->rate_idx = ppduinfo->rate;
+		rxs->rate_idx = ppduinfo->mcs;
 	} else if (ppduinfo->ht_flags) {
 		rxs->encoding = RX_ENC_HT;
-		rxs->rate_idx = ppduinfo->rate;
+		rxs->rate_idx = ppduinfo->mcs;
 	} else {
 		rxs->encoding = RX_ENC_LEGACY;
 		sband = &ar->mac.sbands[rxs->band];
-- 
2.34.1


