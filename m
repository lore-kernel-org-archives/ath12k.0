Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4B606A325
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XKEnlFTE;
	dkim=pass (2048-bit key, unprotected) header.d=adriel.eu header.i=@adriel.eu header.a=rsa-sha256 header.s=dkim header.b=b7/OrD70
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qHLOZ3eazynpKs4MwOyw7uyzuUk6W5PCYG4t6E8R0nI=; b=XKEnlFTEc/JPs2
	dGaSxnwP/PbpoMWBEpDNOcxQGl26C6ApwsmNZkfz31XarCbILWblNRjdNLJy8PPq0pX5q9gHmZTGy
	QsCsH58Zgq8hNJSwV9iTKwGMAmHB8TDgXmnjAeFH0mATJjgjxB+u1m9nxK1BY6TwTiSLVFBYl4t4I
	wj7O56I2KTXb15HMPR9MsClBy33ii6LvdWwYqQZvrRWYw/miDgv6omZXLxd1TzEqhwHkQ1YO8MeOu
	JhljNxMV9NchYIHbb+5OLikiC7xZJ7LEGZ9O4oYHF1O14CVFX5pnrr/kafNs9YWr3D83IP2FYZ7dx
	dUhowpNdNbOcNUZap72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr22-0000000CMTX-0qid;
	Fri, 30 Oct 2026 18:08:50 +0000
Received: from mail.adriel.eu ([51.75.77.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr1v-0000000CMPq-0CnG;
	Fri, 30 Oct 2026 18:08:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98C3426224B;
	Fri, 30 Oct 2026 14:08:34 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adriel.eu; s=dkim;
	t=1793383716; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qHLOZ3eazynpKs4MwOyw7uyzuUk6W5PCYG4t6E8R0nI=;
	b=b7/OrD70rGhRxJoMv/jB3Sqiko0OtFaMlIpr22TzsagyeceoMdWfpEAZLutI/zBeXJEs0v
	f0yy0xbtoVN1BGzgL/x1HcOojyQVLPUHi+3tCkW39SSYybppiK+Bw/16NE3DncyDpGWND2
	hL/ptZIvWmYhbNtbqm8gCZIIIW7TMGmk271k3fqgnpSyuSvkoHQ9fbSvuJHGkgUJ6tEv/5
	x2S7EE92OGyHbowHbKyXlvtbsTPczIk10GR5GPfOKDJufWXqxa2A9GUHzrOp3nIiLhAay1
	SbNhCqEAdYEGkCIqCU6lnCJpJ0Hy/5t9Vi2xFojv6I2myCbqQViCV4zIK9DW+A==
From: Adriel Santos <adriel@adriel.eu>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 2/2] wifi: ath12k: copy the first fragment's descriptor before queuing it
Date: Fri, 30 Oct 2026 15:07:05 -0300
Message-ID: <20261030180705.1702009-3-adriel@adriel.eu>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030180705.1702009-1-adriel@adriel.eu>
References: <20261030180705.1702009-1-adriel@adriel.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_110843_248986_9D1B37FC 
X-CRM114-Status: GOOD (  15.20  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_wifi7_dp_rx_frag_h_mpdu() queues a received fragment on
rx_tid->rx_frags and sets its bit in rx_frag_bitmap before, for fragment
0, it copies the REO destination descriptor with kmemdup(GFP_ATOMIC). If
that copy fails, the function returns -ENOMEM and its caller,
ath12k_wifi7_dp_process_rx_err_buf(), frees the msdu and returns its link
descriptor while the msdu is still on rx_frags:

- the next flush of rx_frags (a new sequence number, the fragment timer
  or peer teardown) frees the skb a second time;
- if the remaining fragments of the MPDU arrive first, the bitmap is
  complete, ath12k_wifi7_dp_rx_h_defrag() walks the list with the freed
  skb, and ath12k_wifi7_dp_rx_h_defrag_reo_reinject() dereferences the
  NULL rx_tid->dst_ring_desc.

This has not been seen in the field; it was reproduced, on ath11k only,
by forcing the allocation to fail.

Copy the descriptor before the fragment is queued, so a failure leaves
nothing of this fragment in rx_tid and the caller's free is the only
one. Fragments other than 0 still return their link descriptor after
being queued.

ath11k has the same code and gets the same fix.

Found during an LLM-assisted review of the RX defragmentation path; the
fix was LLM-assisted as well.

Compile tested only.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Adriel Santos <adriel@adriel.eu>
---

Notes:
    Found while fixing the same bug in ath11k (previous patch), which was
    tested on IPQ5018 with forced kmemdup() failures. No ath12k hardware was
    available: this patch is build-tested only (arm64, W=1, no new
    warnings), and no reproducer was run on ath12k.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c80440..d84cbb8df 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1227,6 +1227,17 @@ static int ath12k_wifi7_dp_rx_frag_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 		goto out_unlock;
 	}
 
+	/* On failure the caller frees msdu, so it must not be queued yet */
+	if (frag_no == 0) {
+		rx_tid->dst_ring_desc = kmemdup(ring_desc,
+						sizeof(*rx_tid->dst_ring_desc),
+						GFP_ATOMIC);
+		if (!rx_tid->dst_ring_desc) {
+			ret = -ENOMEM;
+			goto out_unlock;
+		}
+	}
+
 	if ((!rx_tid->rx_frag_bitmap || frag_no > __fls(rx_tid->rx_frag_bitmap)))
 		__skb_queue_tail(&rx_tid->rx_frags, msdu);
 	else
@@ -1236,18 +1247,9 @@ static int ath12k_wifi7_dp_rx_frag_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	if (!more_frags)
 		rx_tid->last_frag_no = frag_no;
 
-	if (frag_no == 0) {
-		rx_tid->dst_ring_desc = kmemdup(ring_desc,
-						sizeof(*rx_tid->dst_ring_desc),
-						GFP_ATOMIC);
-		if (!rx_tid->dst_ring_desc) {
-			ret = -ENOMEM;
-			goto out_unlock;
-		}
-	} else {
+	if (frag_no != 0)
 		ath12k_wifi7_dp_rx_link_desc_return(dp, &ring_desc->buf_addr_info,
 						    HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
-	}
 
 	if (!rx_tid->last_frag_no ||
 	    rx_tid->rx_frag_bitmap != GENMASK(rx_tid->last_frag_no, 0)) {
-- 
2.47.3


