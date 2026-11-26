Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D7606A31E
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 17:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AGSaYzpc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmLL18aC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0pQ9GEAcc8EGQNOQeS3VNOfksRTSnbgTKVbMBryXtAQ=; b=AGSaYzpck/KPAZ59VfiN7sW8yQ
	7zHSZImib1Y4VO0a4W0y9PWRkiiDrzxziRPTyOQP/uHhSRcTEkNAYGk2MczIkpSBGMUn1fmuLzueW
	JvNZpPuOYcrb+zcYZyHhlKDL/AER2JXWIEy6gfzsQ61F/3/88Xwq9ZmLDa6ptAar1bFAKEcH837It
	S/hV1KbIXkMVql3KNuQrUtwloHmIWtsChrOZSELmFoYGzD9bobEyaSkl94OPnDU6As891R/Hbvi6n
	QGIwK6beJoMuR1FJ0RntpN7tXDp9rM0d7kHeAFL8QbNhtsWGZTRL0j0yTLLaHf6QmiHuTIwttxOlU
	PkZv+gBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdfA-0000000E6UW-28PM;
	Thu, 26 Nov 2026 17:53:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdf5-0000000E6Tw-1uit
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 17:53:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso73496185e9.1
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795715613; x=1796320413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0pQ9GEAcc8EGQNOQeS3VNOfksRTSnbgTKVbMBryXtAQ=;
        b=gmLL18aCztLj1pOe4njHZpA4eL1ihnVm519fZ57zByEM71MXt8bThtNkP4sI9NTuXT
         nApQHWjlWa2j76OoCG9UQGsmfYH8GgWdZiPb41VFE0enmrKLGgUWLr6mpHMQmo3TAKNT
         UJFHOsUXK38gzh9QnRqx0GSPua8zlqWTwOE6f8wN1f//8iNxSePzqK5na68WF6h/WGt+
         MTeC963rTxnSkbmLigK/jQ5n2nfGuOpQBv0PDK+GK8x686wcX3jbsz4l6h8RMm7Fzt6j
         VnoETrm+ss3YfyYN9d8JkIKVDyZ7X7dvpJO/WgO07odjApft32zztGAChSOO8IM5Pb3E
         /evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715613; x=1796320413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pQ9GEAcc8EGQNOQeS3VNOfksRTSnbgTKVbMBryXtAQ=;
        b=gaCIMfrRj4497s5F/z1eQXysBarvl62RznQ1USxLr5T6LwbYzR756DBbCckZLpdCwB
         guGWGCsnJ+nh6bs+s/PKa+wc5PG6e9ETos4BvUTI1C7d1bSRnx3K+DWlmAwPp+MitAu9
         qaeovhNJwzWizKIN8yKlbyTZInN3BNxCz7ps+Nt9VH1cVzRk9ua+qa1p9jm3FwccEXT3
         wTkVrxVjcAeLdENYRzZeXcB2hvuXHVI3QQ7K25sh0lENamuVLtf5zcDalKtQZ8W5kDmr
         klIJRVVTVlPFpCDwet8D3tDz1EYQig1pXs5ilWgLs07lCEsMbIos10yvQWaudDOqg78u
         0EtA==
X-Forwarded-Encrypted: i=1; AL+hErHHx4kGb8TOgjLLYK5zCSal5HnpM/Sr/1Z5l+kvE/SysEZty6HSZY3kPrns1jTBmhIshfvSG0U=@lists.infradead.org
X-Gm-Message-State: APuU4Z8Ada1A//ld623bsUbpUtzhnF4Wyi+CL7tFAQsAUHb1xdY3aFSK
	F6Eo2J4ZkQhvJRuDynQoMgpmLqSQaZqkyJT9Tdm3j7SQ5UpnJvh9SRgx
X-Gm-Gg: AZFdTZc+qIcyf0Djdy1djajU1hmoGPJF3pRPnZdksRytlYA03vUxr2Ys4p14vHqXDZk
	BUMEDEE+1z2NeGATiRejaap8a/Gw/du/T74vmCa8eQG3j2qqQgs0leyObaw7tUv3qBCeKxmG59U
	Dg9MnRc3bqniJuWC8ss3DEHT2XIpZACw3lvC6MYUCYUkxW02iEYLawczP8VyqbNereyuDTqmbI+
	T+AOOq3snupVfKM/BNX5y4o93KSC0O0WkXNbLQiQPPZ5pue5j/QM5ktwSkp4nKppS2Hz98Qtje5
	umclD354GizGGqV3Li7vhDGFknZD8iE0spgpgXaoXJZWusPol/OOcdoHO5C21YRwhd7zZ5K23F4
	JPh+2f8Yz5qP3XXjS5JbD9rxF1gqLoODQyxQDy5xui/HeF7CqiWsZKAdNnDd52AZAQOgO4DJIg3
	2t8hij71BcDxwQsewRroQouzC/HSfZn70PjGm8ahRtM6/vHSW8hqCmBkhMLutEJtedloJWE0D7z
	UkD39hIAictun0fEPibv3kYiF77o4rtb1eLmmkHHb2F8syxR09V+SGuaY9zof/nhYIewd0cIf0U
	21hQsGIBewR1AkwaXYMlzpVRMdw4E+9909NFVp3rRRosmn8k/IFzG2uXLA==
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr414371695e9.6.1795715613194;
        Thu, 26 Nov 2026 09:53:33 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm564366045e9.9.2026.11.26.09.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:53:32 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH ath-current v2] wifi: ath12k: report TX status for broadcast and multicast frames
Date: Thu, 26 Nov 2026 17:53:23 +0000
Message-ID: <20261126175323.2390231-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_095335_513503_D6301510 
X-CRM114-Status: GOOD (  10.89  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitor Soares <vitor.soares@toradex.com>

In AP mode, once a station is associated, broadcast and multicast frames
sent by the AP log:

  ath12k_wifi7_pci 0003:01:00.0: dp_tx: failed to find the peer with peer_id 2

These frames complete against the AP's own peer. That peer has no
station, and since commit 981050b918fc ("wifi: ath12k: Fix TX status
reporting to mac80211 when offload is enabled") a missing station is
treated as a missing peer: the frame is dropped and an error is logged.
Before that commit, the TX status of these frames was reported without a
station.

Report the TX status without a station when the peer has none, and add
rate information only when a station is present. Only drop the frame
when the peer is not found.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 981050b918fc ("wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled")
Cc: stable@vger.kernel.org
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Keep ath12k_err() for the peer-not-found case (Rameshkumar)
- Link to v1: https://lore.kernel.org/all/20261116230250.369383-2-ivitro@gmail.com/

This conflicts with c752394249f8 ("wifi: ath12k: store station pointer
only in dp_peer") in ath-next; the resolution uses
ath12k_dp_link_peer_get_sta(peer) in place of peer->sta.
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 41abf1865702..3c2a008ba185 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -856,7 +856,7 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 	ath12k_wifi7_dp_tx_update_txcompl(dp_pdev, ts);
 
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
-	if (!peer || !peer->sta) {
+	if (!peer) {
 		ath12k_err(ab,
 			   "dp_tx: failed to find the peer with peer_id %d\n",
 			   ts->peer_id);
@@ -864,16 +864,19 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 		goto exit;
 	}
 
-	status.sta = peer->sta;
-	status.info = info;
-	status.skb = msdu;
-	rate = peer->last_txrate;
+	if (peer->sta) {
+		status.sta = peer->sta;
+		rate = peer->last_txrate;
 
-	status_rate.rate_idx = rate;
-	status_rate.try_count = 1;
+		status_rate.rate_idx = rate;
+		status_rate.try_count = 1;
 
-	status.rates = &status_rate;
-	status.n_rates = 1;
+		status.rates = &status_rate;
+		status.n_rates = 1;
+	}
+
+	status.info = info;
+	status.skb = msdu;
 	ieee80211_tx_status_ext(ath12k_pdev_dp_to_hw(dp_pdev), &status);
 
 exit:
-- 
2.53.0


