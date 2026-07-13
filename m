Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B877BC44501
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0az8tsVR7zS2GhqdLGHW1f/gmLg6FxiIQXtaw3jsQc=; b=cV7mhccPXXw1LcXtd/SHMOzEMo
	63NGFxliuRlGzF73A2oUmYAYv3W1XaIgGRnIL+bh30gJzdQVCGTEeg8qBFFj7EEgAzN8pqTNnSPCx
	7+typaNjRy8N9USz/8XMWq5NVV/4lCCkzHO5n1tPXw7NjYM0ZS9h9SlBIHgOfTvRhBVz+TjMB9E2n
	Xhdcn+f5RAC2/qsJOj+UtRtByjAQepk46V+gVXmQAGpceegdc6IZp7pJnT949/Aq2smHZHAq7zNPV
	sNvunJK77p2qzG+exqLL70nMdooktoH6TSM+vYgzhS3/zL1XD86mT3qyFJoxo9zV3vtgbQPmnHw+S
	Vbq3DKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7y-00000008Q0L-28k9;
	Mon, 13 Jul 2026 07:30:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7s-00000008Pti-1MhS
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:30:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nvuk472799
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o0az8tsVR7zS2GhqdLGHW1f/gmLg6FxiIQXtaw3jsQc=; b=SP0N4RKD6joAVp5L
	YsLx0jShhYaHixiDFHLJdwDkl/aWSDuP0aYNCGRj01yrNhwYtvLCCCVPDAI/CNYH
	puw2wGuhDX7GAPKoC+lTJjj3ud3R3+L//h7v5HnZJQ2amjdtQV3r+7rFd3bz2et0
	QfeBWgo/EQMTgLaWQkAFFWbb/N9VmyJumbujrJC3oia/WTUOuHrq4Gk//CNxbbpO
	usoY9s+jPeFBxrYTQfYPAufKxUgM+l62tR+VAwRkkY0hs9A4c/icD7txbo6+lMDG
	VzHGgCBALm9llPvGPoxR8TD6zIEK83P5aNdqtP/JezJzGENEZb+aWPGcduTaAPfr
	SxjYlg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9n1p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso4226123a91.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927850; x=1784532650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0az8tsVR7zS2GhqdLGHW1f/gmLg6FxiIQXtaw3jsQc=;
        b=bGPZ5n/JrfBkpYJKlPxcTv9Fyz6uXfAO99MXEeSM3arZeDlhEbi2bQ1bbjztp0re9O
         HQNf1dFVAOKKaWmDrEfGMjgWBdYQuAE80rJITwJfsqXtzSVQY6gPvGVkd7GGkAkSE9Ys
         CPo1IAGX/QOJtFIlgw2RKLL/4z73vJwCSyUQK6Fw9SDw09RxE8TMT1eRMulw8ZtR9npe
         UUSDbcx3+XBAkDfZl0E4z81tBjTCFwTJpnGhwpx9N9LWko4Z4c1bjij+TBcYHvxCo7rn
         NA37mGf9mFdAiAghWx2k2lIuF+C4dVhk55SF4qw3R81I644jzzcnB859R8q1z0zoLT22
         9nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927850; x=1784532650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0az8tsVR7zS2GhqdLGHW1f/gmLg6FxiIQXtaw3jsQc=;
        b=TdxgFxGsCYOZsl+zumVf7FYmQZsx2+nkhRfBkqyXdiuOA/KhbY0fuve7WcT4QcLrEE
         aBKcDY0uy8946Rr3CM2SYK8yz9d4j7N6kaWtVAInLEDdvRAf5O4Lwhp2sYQMjUtrWbko
         MbsGyWDGfS6ziJLVWRGKsyCfRDEuGGM2pMDWqsfzR11QsUawnD8kqTuEH+XP37F7fVKr
         2Y1EfppEmKgY6coBjlKqee/m9pnnFDAbkVZdVam/pE/9Y8OlF/vN6utXOU3LOpVj2pOu
         xPnGB0jHlreS1NRnyKxeBU8btpqUP3zU3ltN1dZst4ikWhzao90s62zl0dsMvY1e5zuu
         BmTg==
X-Forwarded-Encrypted: i=1; AHgh+RosivgYFzJ4Reb85mJ7buq7naBLoRdsIMTUYBhFiEGPnP/Wmz88ucc8dIITriDAJXSs+nKdHdM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkRFPppyO2VzA8IcZshr3mlQXMFUcpd0acnTb3FdwVU6wt7Lox
	BIlJzwL1P+g+p5iIya2AjzJHLyS0LP6DKMAjvK/0D1yksd1hKA86GPPrHJBuSSxUzLsgq5CmWp1
	PBCUUXgmrNiMf/F0lJ07Eu2LvDL8J2ApBJftnzUAxBVTOWtxVUpeI+TrFKXGdrIJq
X-Gm-Gg: AfdE7clDQatYpxdk8bETdgVZ8eG28Nfc43zbGDgvd19Del8TKJM+M3ntENde06cxWyo
	JMS6mf779xITzDJXpy8Hl3IyUlZlJkGbsJcRRGcl1OolSb50xYT5kklVhlw3HNbTQN0F8/FSlxp
	bw5i9Iivlq4X8P4TZTdBifUWkgpsyv4LCXlyTdaxmzLn6fBU5QUSeAsKN2SRh59ofNhV/zlgeR1
	aNE2L2gpuA4k4rwBkaY/Xd3zgORtJNr+CwBGZMFFrwUedDxzLWyNi8RMM9UK5m4LDIjyw59nhfg
	Rzft1KKyPsEGx7rnaYEuGIhiEQv8GeZJBVu9rjG7UkkDs3cuo6OkqqjcKF15ijkVcKjBQi1h3XB
	aLt7aTaXLEkMXWH82mZds7rlqC3nEETcBeP+tgqH85/tv6TcKrXNGvNNEoAzxgxCn
X-Received: by 2002:a05:6a20:a10b:b0:3c0:9c1b:d0bd with SMTP id adf61e73a8af0-3c110a18f83mr8622546637.72.1783927850252;
        Mon, 13 Jul 2026 00:30:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10b:b0:3c0:9c1b:d0bd with SMTP id adf61e73a8af0-3c110a18f83mr8622506637.72.1783927849779;
        Mon, 13 Jul 2026 00:30:49 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm7947252a12.19.2026.07.13.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:30:48 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:29:59 +0800
Subject: [PATCH ath-current v6 7/8] wifi: ath12k: defer dp_peer
 registration when firmware allocates MLD peer ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v6-7-20f6f212e413@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX89G5oWb74GCE
 2+BlPIayWOvrh5vIkXCAKBAErSsp3sqH1J0H3e9mi4Mx3DX7zrcX/zTdty8/39L/aZsu4OmnsUt
 m12jTEYAE11RSbgZZQvkEE+CdKvE+MY=
X-Proofpoint-GUID: kffF0l-Lp9BRtxzRiPGBTk3O8RMkA_TK
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a54942b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DmUR2gHJotVURrrF6hgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX0QNPT5hUY/B3
 hV0+ukVf1Gb5lKoT8l9lepLHOLldjBfDv+Vps1h66zF9RLKDEM/8xMv8L4NVZN7CjVPZWxvQ1K+
 WwG12XCiD9ERaZxAZ6DHpRmY4xy0gh+UeTH/KcoByx5Q/x+fAi61QkAf0HGnz7B8FbOBQXhWlJp
 sRYaujjTv5IbXx4dz2qkw1JydyQWdl6ymVWywAC0diPEgB8w41FzjaSVH3m12YoeyS9gL8xh+gX
 KrC4T5jf5aq9NUnuRtEn77O3bSZbd6vthAJGITMnG0syDYy0FoA1+l29q+eI2eLphOzViwO7Pxh
 RB23vK7DXjot3lYF/CCKt0Ab78aAbi9aluWm8ryASWVHLAZM0rH/79ODx5/iOQWnNoxnC+cgIKf
 8rO1Tn6OKEuDEcxTKr+/W2mRQMQCu1Kzdsr8VpHl3VWyCAnVF0h36le8NoyuHoOwR5n6wNhdeQ+
 YS7jaVq8ERXPUQKTthg==
X-Proofpoint-ORIG-GUID: kffF0l-Lp9BRtxzRiPGBTk3O8RMkA_TK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003052_536801_CEBAC8B0 
X-CRM114-Status: GOOD (  25.31  )
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

For chips with host_alloc_ml_id=true (QCN9274 etc.), the host allocates
the MLD peer ID up front; ath12k_dp_peer_create() publishes the dp_peer
into dp_hw->dp_peers[] using that ID immediately. WCN7850/QCC2072 does
not work that way: the firmware picks the ID and only tells the host
afterwards via HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP, so the publication has
to be delayed until the event arrives.

Introduce ATH12K_MLO_PEER_ID_PENDING (0xFFFE) as a sentinel for "is_mlo,
but ID not yet known". On the firmware-allocates path:

  - ath12k_mac_op_sta_state(NOTEXIST->NONE) skips ath12k_peer_ml_alloc()
    and stores PENDING in ahsta->ml_peer_id and dp_params.peer_id;
  - ath12k_dp_peer_create() skips dp_peer registration until a real ID is
    known;
  - ath12k_peer_create() leaves peer->ml_id at INVALID so consumer sites
    do not treat PENDING as a real ID;
  - ath12k_peer_ml_free() and ath12k_mac_dp_peer_cleanup() skip the
    dp_peers[] write and the free_ml_peer_id_map clear when
    host_alloc_ml_id is false or the ID is still PENDING.

The HTT handler change that resolves the PENDING ID is added in a
follow-up patch.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_peer.c | 23 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.c     | 22 ++++++++++++++++------
 drivers/net/wireless/ath/ath12k/peer.c    | 20 +++++++++++++++++---
 4 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 1f56474efbea..8769b41f5db5 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -72,6 +72,7 @@
 
 #define ATH12K_MAX_MLO_PEERS            256
 #define ATH12K_MLO_PEER_ID_INVALID      0xFFFF
+#define ATH12K_MLO_PEER_ID_PENDING      0xFFFE
 
 #define ATH12K_INVALID_RSSI_FULL -1
 #define ATH12K_INVALID_RSSI_EMPTY -128
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 47d009a0d61f..2a2eae194007 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -472,7 +472,9 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	dp_peer->is_mlo = params->is_mlo;
 
 	/*
-	 * For MLO client, the host assigns the ML peer ID, so set peer_id in dp_peer
+	 * For MLO client, the ML peer ID, either known or PENDING, needs to be
+	 * initialized here since the following logic depends on it.
+	 *
 	 * For non-MLO client, host gets link peer ID from firmware and will be
 	 * assigned at the time of link peer creation
 	 */
@@ -488,13 +490,17 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
 
 	/*
-	 * For MLO client, the peer_id for ath12k_dp_peer is allocated by host
-	 * and that peer_id is known at this point, and hence this ath12k_dp_peer
-	 * can be added to the RCU table using the peer_id.
-	 * For non-MLO client, this addition to RCU table shall be done at the
-	 * time of assignment of ath12k_dp_link_peer to ath12k_dp_peer.
+	 * For an MLO client whose ML peer ID is allocated by the host, the
+	 * peer_id is known here and the dp_peer can be added to the RCU
+	 * table using it. For an MLO client on chips where the firmware
+	 * allocates the ID, peer_id is ATH12K_MLO_PEER_ID_PENDING and the
+	 * RCU table publish is deferred to the
+	 * HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP handler. For a non-MLO client
+	 * the publish happens later, at the time of assignment of
+	 * ath12k_dp_link_peer to ath12k_dp_peer.
 	 */
-	if (dp_peer->is_mlo)
+	if (dp_peer->is_mlo &&
+	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], dp_peer);
 
 	spin_unlock_bh(&dp_hw->peer_lock);
@@ -515,7 +521,8 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
 		return;
 	}
 
-	if (dp_peer->is_mlo)
+	if (dp_peer->is_mlo &&
+	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
 
 	list_del(&dp_peer->list);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8cd5e9b15db5..818eb3aa919e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1285,7 +1285,9 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 	spin_lock_bh(&dp_hw->peer_lock);
 	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
 		if (dp_peer->is_mlo) {
-			rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
+			if (dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
+				rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id],
+						   NULL);
 			ath12k_peer_ml_free(ah, ath12k_sta_to_ahsta(dp_peer->sta));
 		}
 
@@ -7746,11 +7748,19 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 		/* ML sta */
 		if (sta->mlo && !ahsta->links_map &&
 		    (hweight16(sta->valid_links) == 1)) {
-			ahsta->ml_peer_id = ath12k_peer_ml_alloc(ah);
-			if (ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID) {
-				ath12k_hw_warn(ah, "unable to allocate ML peer id for sta %pM",
-					       sta->addr);
-				goto exit;
+			if (ah->host_alloc_ml_id) {
+				ahsta->ml_peer_id = ath12k_peer_ml_alloc(ah);
+				if (ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID) {
+					ath12k_hw_warn(ah, "unable to allocate ML peer id for sta %pM",
+						       sta->addr);
+					goto exit;
+				}
+			} else {
+				/*
+				 * firmware allocates the ML peer ID and notifies
+				 * the host via HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
+				 */
+				ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_PENDING;
 			}
 
 			dp_params.is_mlo = true;
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index ae93731b4177..25e4b79f11d6 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -230,7 +230,16 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		/* Fill ML info into created peer */
 		if (sta->mlo) {
 			ml_peer_id = ahsta->ml_peer_id;
-			peer->ml_id = ml_peer_id;
+			/*
+			 * For chips where firmware allocates the ML peer ID,
+			 * ml_peer_id is ATH12K_MLO_PEER_ID_PENDING here. The
+			 * MLO_RX_PEER_MAP HTT event handler fixes up
+			 * peer->ml_id once the ID is known.
+			 */
+			if (ml_peer_id == ATH12K_MLO_PEER_ID_PENDING)
+				peer->ml_id = ATH12K_MLO_PEER_ID_INVALID;
+			else
+				peer->ml_id = ml_peer_id;
 			ether_addr_copy(peer->ml_addr, sta->addr);
 
 			/* the assoc link is considered primary for now */
@@ -285,8 +294,13 @@ void ath12k_peer_ml_free(struct ath12k_hw *ah, struct ath12k_sta *ahsta)
 {
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
-	if (ahsta->ml_peer_id <
-	    (ATH12K_MAX_MLO_PEERS | ATH12K_PEER_ML_ID_VALID))
+	/*
+	 * Only devices that allocate the ID on the host own a slot in
+	 * free_ml_peer_id_map.
+	 */
+	if (ah->host_alloc_ml_id &&
+	    (ahsta->ml_peer_id <
+	     (ATH12K_MAX_MLO_PEERS | ATH12K_PEER_ML_ID_VALID)))
 		clear_bit(ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID,
 			  ah->free_ml_peer_id_map);
 	ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;

-- 
2.25.1


