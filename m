Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C22606A326
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MOsiqAfC;
	dkim=pass (2048-bit key, unprotected) header.d=adriel.eu header.i=@adriel.eu header.a=rsa-sha256 header.s=dkim header.b=bzsZii4L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bxt2nv0f1bKBHkgigvBF7w7wqjjptYdKTh7c/KlEmKo=; b=MOsiqAfCFwn6ml
	MmV+nET9Y32+HPG77nbfJezHthWqTKMRKL28hKOzxa1hrdHW9Igy1TiazEN2fstdumQ0HKEOVOg5a
	M0r9a0dBhb7KZaFJIJVIptmuYeA+L+OId3hp4DN3XPgyZ9oqrbA1ozQSurY9S3Ye/+l2bowoVqGAA
	jsv4Q5G3W0gVLuPKPXW91l2+xbXXVw0cijbIHQKAUGHg1HyU7JAhHmFrgDzvgJMLZcK/sEPfC0lDD
	bzUcOtufFsZ+vIYikyWSlgMqV0fti87PWflzeIdSK0I0h1WQuqx8yzc9tSSOT9csC3BvxqmrmDa/k
	RyoEfgI94nQJvYKDXiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr21-0000000CMTH-3wFU;
	Fri, 30 Oct 2026 18:08:49 +0000
Received: from mail.adriel.eu ([51.75.77.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr1t-0000000CMPj-3SDh;
	Fri, 30 Oct 2026 18:08:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 606F4262204;
	Fri, 30 Oct 2026 14:08:32 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adriel.eu; s=dkim;
	t=1793383713; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bxt2nv0f1bKBHkgigvBF7w7wqjjptYdKTh7c/KlEmKo=;
	b=bzsZii4LmloETK2WHSp7K9tpl5l00mE/4fyJqn7A5PjLaueRvYWIiU7jqYGH6JODlYytHv
	bbLJXD0fda64DOKKh2BI0ZwtT1Z1b7bHWhcGuA4fCelyT1xIAk4NNh0BAM9gQnf0IjxE7k
	psFWvq9fzKPbDjVQQH3JdkdhdRhuDR0akXg2RoF5Dly7LPLwcXF1QyNNHbnCg/kOQ1evlx
	d0BOrjk6ZqQ+Uj+OxtPh8qCCIHBE5R53/2/c1ZN/0k8+6JYpv6O9FNo1Xha3RUVuOmVFaq
	fofAhP5qAYkzkn/10ADHCW6ZZzh9UfKuv+V+5Ks59ND8Lp3AP3kdbEkbvN8cSw==
From: Adriel Santos <adriel@adriel.eu>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 1/2] wifi: ath11k: copy the first fragment's descriptor before queuing it
Date: Fri, 30 Oct 2026 15:07:04 -0300
Message-ID: <20261030180705.1702009-2-adriel@adriel.eu>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030180705.1702009-1-adriel@adriel.eu>
References: <20261030180705.1702009-1-adriel@adriel.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_110842_338640_F51F634B 
X-CRM114-Status: GOOD (  19.93  )
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

ath11k_dp_rx_frag_h_mpdu() queues a received fragment on rx_tid->rx_frags
and sets its bit in rx_frag_bitmap before, for fragment 0, it copies the
REO destination descriptor with kmemdup(GFP_ATOMIC). If that copy fails,
the function returns -ENOMEM and its caller,
ath11k_dp_process_rx_err_buf(), frees the msdu and returns its link
descriptor while the msdu is still on rx_frags:

- the next flush of rx_frags (a new sequence number, the fragment timer,
  peer teardown or a key install) frees the skb a second time;
- if the remaining fragments of the MPDU arrive first, the bitmap is
  complete, ath11k_dp_rx_h_defrag() walks the list with the freed skb,
  and ath11k_dp_rx_h_defrag_reo_reinject() dereferences the NULL
  rx_tid->dst_ring_desc.

This has not been seen in the field; it was reproduced only by forcing
the allocation to fail.

Copy the descriptor before the fragment is queued, so a failure leaves
nothing of this fragment in rx_tid and the caller's free is the only
one. Fragments other than 0 still return their link descriptor after
being queued.

Found during an LLM-assisted review of the RX defragmentation path; the
fix and its testing were LLM-assisted as well.

Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Fixes: 243874c64c81 ("ath11k: handle RX fragments")
Signed-off-by: Adriel Santos <adriel@adriel.eu>
---

Notes:
    How this was tested, and what was not done:
    
    - Found while debugging fragment reception on an IPQ5018 board; the
      failure needs a 64-byte GFP_ATOMIC allocation to fail, so it was never
      seen in normal use. Under Documentation/process/threat-model.rst it is
      a regular bug.
    - To exercise the error path, a test-only module parameter made the
      kmemdup() fail for every Nth first fragment (N = 1 or 3), with a
      client sending 1000-byte pings and TCP uploads fragmented at 256 bytes
      on 2.4 GHz (host data path), over two days:
      - without this patch, the board crashed and rebooted within seconds,
        4 times out of 4; in the two runs that sent one ping at a time, at
        the first forced failure. There is no serial console, so no oops
        trace was captured.
      - with it, 9365 forced failures over 22 minutes: each affected frame
        was dropped, with no warning, SUnreclaim flat, and normal reception
        once the parameter was cleared.
    - The tests ran on OpenWrt's backports of this driver (with downstream
      patches; NSS offload disabled for the radio), not on ath-next. The
      function and its caller are the same there; on ath-next the patch is
      build-tested only (arm64, W=1, no new warnings).
    - That tree also carries a not-yet-submitted change that programs the
      IPQ5018 RX fragment destination in REO1_MISC_CTL, which ath-next does
      not write for this chip. Without it, fragments may not reach this
      function on IPQ5018 at all, so ath-next may not take the tested path
      on that chip.
    - ath12k has the same order in ath12k/wifi7/dp_rx.c; no ath12k hardware
      was available to test a fix.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b34..789a56488 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3674,6 +3674,17 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
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
 	if (!rx_tid->rx_frag_bitmap || (frag_no > __fls(rx_tid->rx_frag_bitmap)))
 		__skb_queue_tail(&rx_tid->rx_frags, msdu);
 	else
@@ -3683,18 +3694,9 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
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
 		ath11k_dp_rx_link_desc_return(ab, ring_desc,
 					      HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
-	}
 
 	if (!rx_tid->last_frag_no ||
 	    rx_tid->rx_frag_bitmap != GENMASK(rx_tid->last_frag_no, 0)) {
-- 
2.47.3


