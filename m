Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133E606A328
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 18:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yTwvWcJA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fRz82+d1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+VXh5wNmEMtDJf22hNJBMQBn0m2NV1zkl2tOQQX0J8U=; b=yTwvWcJA8MS2cEZQUE5HTozFze
	YarEkd8UeKyGwsGpS5I4uOp/cJV25q10XYjrqez6j47UMm77yWuhC/RlPCRwxqIK7N8GuUHeN5CCJ
	9jxS3bsJ/SWIeRO3a8JWNMxgYkKQkjnJKL5cggrs9LYOt0dOOjuS71n6sk+QyqrC18tVAuG73+1Pk
	RYx7HIBGErlhTojjjG3VAAc26gDnMtkm1XfHl5ePDHWPM5jgQaURINnFQdyw7dJRgW/FSREBkyQcV
	4Vc5MsUhcHbVjqKh6NACERGMuR8jBZvD17jdWc1RaqGC+AFB5iHgzNibR/V79ZpmIosOJE/ZQzbQq
	62Vb/kDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1xg-0000000A5oy-2IkO;
	Thu, 05 Nov 2026 18:13:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1wp-0000000A5QP-3Nm7;
	Thu, 05 Nov 2026 18:12:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D55841B1C;
	Thu,  5 Nov 2026 18:12:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793902347;
	b=jeQGh6vZ/wnXt951fWbVCPhuSCR/Hi6KyU4UFngqyo8SntalDxqNegI65ex46B4t2FLH
	 eHb8gT/luMxF/fCje63Ngr7I+LRmrA41l8ig0WEztDd1WhAHJ6kSYhpp0ffv42DWiOYHK
	 eBvXFh9Lo6QZLtgx7njq36WJGTUBgRe8mIlikjeqc1H7t45Amc1lqsP198HtTf0O+n7/i
	 G8cxoHYejaBL9CxojSvdKGVXwfWNIsqBfIpkuLvM0fZCGBy563rXqeQMOfktXofplfsli
	 jUDxdhVbcQPUK9+xlHRrvbWwjvnYlzXU8LcOvwM+s2vVxFXnyBRd4U69VrVFQRzCvyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793902347;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+VXh5wNmEMtDJf22hNJBMQBn0m2NV1zkl2tOQQX0J8U=;
	b=sJBrddYaYR5CAjG58Oqxyu+oG99PXJzvLu9a3MYyOFinjd9i6/ydcBEd+VxO1MbJEWtC
	 TDz2bZmoI8R53S9uKP31LP5W2svsg8L4DniU+oo8njwepxKuHKREAb+rPTgelpDb47FXk
	 sFTAdhCZ+Znn9brdNJsdzs8vzv5ZHtz7VNwYzU9n9Xewu21DYLDYvXj1gBzw7qinlbBpk
	 xodgZDSCyTiBMG+pcZZgT+GK+6gKsUhyGSewHHLJmi4WSBZlOSO4iDU05FhNY117QvCpk
	 0ZNS8c1Wi0VK02YJY6mZpI++GyWOi8RhJxhoRHJWJ29n52SQYJmZMGdH3S8PMxEKHPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44BD61F00919;
	Thu,  5 Nov 2026 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902347;
	bh=+VXh5wNmEMtDJf22hNJBMQBn0m2NV1zkl2tOQQX0J8U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fRz82+d1S0T995/t22eUM5vljIQ7eg7fPCSXqprJd49dY3UwSRutsEJO9qlzyiY2X
	 n1Bo7TedAAc3TlkKMNoDi+48hDHxorRr1UflsHgiel/Ab32wdK3O3eP3ueAcRv3ZsO
	 f4bq0bh/lL32uXlQYMoVGpbcwPmY3urHMLf9U8bPTd9thAN5xYi1oZkc0wODncK2oy
	 JtpHuA2rLOE3+9WSaHmTyiEYx9dbwJK+GBCzHRh2GqqJ+Cd4plxuqxA5833P4yJgBM
	 bo7LjnsZScYW8O4iG2Dy8A/4OECjeZAi7TSS24mG9514yN11W1x6m9GAFa4UpbKKMa
	 ptM/9iNOLNfkw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CD1F6473BD;
	Thu,  5 Nov 2026 18:12:24 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 12:12:22 -0600
Subject: [PATCH 1/2] wifi: ath11k: don't leave a monitor vif started when
 its stop fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-ath-monitor-unassign-v1-1-277f0fbadb91@gmail.com>
References: <20261105-ath-monitor-unassign-v1-0-277f0fbadb91@gmail.com>
In-Reply-To: <20261105-ath-monitor-unassign-v1-0-277f0fbadb91@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>, 
 Jouni Malinen <quic_jouni@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 P Praneesh <quic_ppranees@quicinc.com>, 
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>, 
 Wen Gong <quic_wgong@quicinc.com>, 
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 ath12k@lists.infradead.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793902344; l=2565;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=1R7oAGbBN78/oVWlhCPSGL7JqxfEoXYdSJISg6BkmUs=;
 b=TPfNd1rwEb1IAORwzaVwKydgTWq9y85ofF0dnxUxsONH+KfMDevRtnzxDbtsB6PGwVN6ME/y0
 jYIA7dJ3kDFAneU9+97YW99sbcrvw1DOYHUKbEhDvc7OksKHkKLF0b/
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

ath11k_mac_op_unassign_vif_chanctx() returns early, with
arvif->is_started still set, when ath11k_mac_monitor_stop() fails for a
monitor vif. mac80211 can't fail an unassignment and considers the
channel context released, so the vif's next assignment, e.g. the next
channel change of the monitor interface, hits WARN_ON(arvif->is_started)
in ath11k_mac_op_assign_vif_chanctx() and fails with -EBUSY.

A firmware crash during a monitor channel change does it. On a QCN9074
with a monitor interface that changes channel every few hundred
milliseconds, after simulate_fw_crash:

  failed to stop monitor vdev: -110
  failed to stop monitor during vif channel context unassignment: -110
  WARNING: CPU: 2 PID: 15367 at drivers/net/wireless/ath/ath11k/mac.c:8499 ath11k_mac_op_assign_vif_chanctx+0x304/0x3e0 [ath11k]
  Call trace:
   ath11k_mac_op_assign_vif_chanctx+0x304/0x3e0 [ath11k] (P)
   drv_assign_vif_chanctx+0xac/0x144 [mac80211]
   ieee80211_recalc_smps_chanctx+0x278/0x940 [mac80211]
   _ieee80211_link_use_channel+0x158/0x210 [mac80211]
   ieee80211_set_monitor_channel+0xa4/0x860 [mac80211]
   cfg80211_set_monitor_channel+0x3c/0x60 [cfg80211]
   nl80211_set_wiphy+0x2cc/0x7d8 [cfg80211]

Recovery resets the vif afterwards, but without a crash the vif would
refuse every later channel context, with a warning each time.

Clear is_started even when the stop fails, as the non-monitor path in
the same function does.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1

Fixes: 689a5e6fff75 ("ath11k: monitor mode clean up to use separate APIs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..fc6c374c787fd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8514,12 +8514,10 @@ ath11k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath11k_mac_monitor_stop(ar);
-		if (ret) {
+		if (ret)
+			/* continue: mac80211 has unassigned the context anyway */
 			ath11k_warn(ar->ab, "failed to stop monitor during vif channel context unassignment: %d",
 				    ret);
-			mutex_unlock(&ar->conf_mutex);
-			return;
-		}
 
 		arvif->is_started = false;
 		mutex_unlock(&ar->conf_mutex);

-- 
2.43.0



