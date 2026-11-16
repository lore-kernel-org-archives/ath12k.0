Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37723606A889
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N4CuJeGV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QvP4nuOP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nRFumCG1IZk3fjsdmZSVriNashmE07r3bdlI4W9+YCE=; b=N4CuJeGVuggffV7awrJDe7roRf
	AOaNmZcqDjp89aaDgbupmtoH+t5H6TCBaQGrl0M/0c/cd17zdMiSsHAPmxwiNFw622ymibmnMGzJw
	vzsBanJkqwI4t2/3BqJPYBzLQY7soPfA4xsFFdlYaSXDTLXiKq2HxX4GuNr7vbPwIHgkYF2W8Xo/Q
	vPFArKyjaHKVzsGMjD0oglr46t1sto0q7lfpONhO7obyWuqdUiDilE59vGNYunS4OIxnZWTUaVn8q
	rGUwh3gD1i5HkngsNxox1a0QMI6dGF/JHw/w3pc0izo6Ip+nCd+I/jSElyGSyThvnmw40OKz305Mj
	40tpIQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5j5-0000000468d-1yRr;
	Mon, 16 Nov 2026 23:03:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5j3-00000004686-0rh3
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 23:03:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so15025955e9.3
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 15:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794870179; x=1795474979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRFumCG1IZk3fjsdmZSVriNashmE07r3bdlI4W9+YCE=;
        b=QvP4nuOP6lNhkcr+Y1JuJocQiajgY3PY3wSgMQD5tJtBvlGMSSGyn5bbgcsANzpiQz
         rN7kgILa0Ia/yiNmruslBB+hLkyltCD+VH2f4LsmAiskLhFpFMoB9p+gExtj1E9jwD6P
         +CYY64DO2kAGPU3ftcG9CUSnb0iXdFfoGhyvpcxcDI+FRXf9aKUjbKBOG2eJ3XIVTYHz
         OVSZA5xT2ihLI/jMVZrl1HljIae8OhMGFlQ6dNO5pymRuLNsK/6sQJzEr0xD42NZ5aLp
         31Fw67R64lvcBthjbZSpgok2lQ0wCcfrhY9hsCfpt8nWkQss6Z7L8glEgjxv/nhCCauw
         4o1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870179; x=1795474979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRFumCG1IZk3fjsdmZSVriNashmE07r3bdlI4W9+YCE=;
        b=Spdf6+5YGaFZjCnHfncX+5XYmQuTFgDwhzRcPygwc57MebnXSFtIwDBDflPaXVkqGD
         6Qylr+Opav8H2Myh0PHcibVLF+6lhDGlV3GcnzeDi5ERHQe8X/6ziUeCD1QnfEMPrp7x
         hWizGplF4+cVPAV5UyYaamkav7RMZosiFLx1yGKvcDdb49QmE/VwgSpHn7QX0pSrEdvu
         mZRwSr80wkDWlCr8ZaXvB0HVO1vjqwgP4QJCIg4UAGB7O5gg4++sdAbyTBMITGf1bUCr
         UsvxVRjsF2ej2B+qh11AA8ZyZuQcuTdTuFhoALi/aetKK1aVascPX85gbPtGMzBe165y
         IGIA==
X-Forwarded-Encrypted: i=1; AL+hErGLJDi3iDZM1/pyJ1THiyc/7j5soPsPnzA0bUysqncxqNHQaYpiodj5FoFF9QuxFJfGErxwEx0=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Fdu3XHM/4d10CsHFgx/Omg47R2Z1/A8ZwpDwbX0Cdj6VePt0b
	f2ED1gcPaV8H09Br+gskr76/3fHoCGIaTHX0huKUMJb07X68EHO2FLJP
X-Gm-Gg: AYBFou2wD6fJJxB3LHmQNMumC35lt8xMFXR3gyCpSOb0jvXTHYELZRJ5kIThoNTKULA
	iTfpNSl/zi7WKJXjCJcU3unG5X0A98BWLtKIKdfPrYc/foVlCPHK87iYZiv8UEKD7dYVCACBYqm
	q2dgVGujUilw8fkqKQ+sr3hBofQ/dgV0my4He7vExA362w7zH4JPVLS866IDFZef7fHdV1mc1YN
	BB+eg0SnJb3SvtBg1ahEcj7op6UHwKmhQfaCi8KPyskzEyYHWG/W7HkEVxdjRU2ufPN3vouocoR
	dUA2w64M9PhjTLmjGYRZS585DJFUyXxJpLnueJL2/s0aJx4iTkV1RlCU7FJqUT4TWgqSWMiGitL
	LvAKMk1/SJeKykit74zNLp31ucrupvcxBkZ1cInpfZ3P2CZsNLhqgqrbyTmSy71ZDNJ2JUNoATT
	aMRj8K/4pDKUJIjAvH9krLtFvPVnYEX7P3RozUWub8H4G31Rw5GlX8tQjazi/dvqD6vQ+JpsqXj
	jFY1JFPF2EuXSWVnn8b0EBa0yqld+MEtVoQ1rKH62HgKaKqcCaMaA/Bi8tOKKWvqvWnsQHi63q+
	hxQhd++nyoZp6QeqnNkye6AdYYN4PRWKbw==
X-Received: by 2002:a05:600c:8b34:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4bb55a25c0fmr239411275e9.3.1794870179190;
        Mon, 16 Nov 2026 15:02:59 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:dd63:7222:aab1:aecd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78344ddbsm24680955e9.0.2026.11.16.15.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:02:58 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath12k: report TX status for broadcast and multicast frames
Date: Mon, 16 Nov 2026 23:02:49 +0000
Message-ID: <20261116230250.369383-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150301_470438_F2AD4625 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
when the peer is not found, and log that case at debug level, as the
HTT completion path does.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 981050b918fc ("wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
This conflicts with c752394249f8 ("wifi: ath12k: store station pointer
only in dp_peer") in ath-next; the resolution uses
ath12k_dp_link_peer_get_sta(peer) in place of peer->sta.

 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 41abf1865702..794d85d9dbaf 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -856,24 +856,27 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 	ath12k_wifi7_dp_tx_update_txcompl(dp_pdev, ts);
 
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
-	if (!peer || !peer->sta) {
-		ath12k_err(ab,
+	if (!peer) {
+		ath12k_dbg(ab, ATH12K_DBG_DATA,
 			   "dp_tx: failed to find the peer with peer_id %d\n",
 			   ts->peer_id);
 		ieee80211_free_txskb(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
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


