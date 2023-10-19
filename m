Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F11CCDB485
	for <ath12k@archiver.kernel.org>; Thu, 19 Oct 2023 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZacyG+6bm+6gVUrhoQ0HWo1iAqnPWNXd7L+9ONgCHA=; b=Slg0FKqdSFAoWp
	291jTioYvR8xhy+FFFPciA0ixC7ifnszZTyk8G21jCzARne/0kcfhnut0XZDSyIdSpjyq9RGOWiIc
	z3S5J7E7RZnDJ2TAugBT5U2T/qDU691+RRBdSaduJZCAmTngOnvavcLhd2ZPbOaB57G7Hay6ICbkJ
	7QAAVEfrLlWsyKChSdVtWI8kTzGE8f5ZkRrPbejiUFpwhTkf6+GRc/wn9BXmT6y1qDWKUX1VhlT2p
	vzfjVlkvzyJ6JInL8P5HIM5rbMQ1WZSQR1fHtHNCWnvPrzAKthZJeRHm+QYVg3OOVrAUk8ws0xkRM
	4ocwU1OHaU8SbzWrfTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRLC-00HBMn-34
	for ath12k@archiver.kernel.org;
	Thu, 19 Oct 2023 11:37:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRLA-00HBLF-07
	for ath12k@lists.infradead.org;
	Thu, 19 Oct 2023 11:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6BE76B82878;
	Thu, 19 Oct 2023 11:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28DEC433C8;
	Thu, 19 Oct 2023 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697715441;
	bh=Fl3AWQhRpM38FD8RxKjmnV0l3qxACyYQ/7kTZ5GaoTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QHLwYH8IyxMBa7gIp3HRiTFnlCMEWvzafAS97eM+kJu2uAfpF5pO+X4jo/yFxSzjj
	 6TUvRsAAtVX9ClOg2wiXBI2Iv0fQE85XmtzjGqlR3Eon3SNbZJGkmlxQ0ss4eEtFgq
	 mdp4Iew5tgDMMzZSHijCxWhATPJ+3qvTnD/lsfy89a2g2eBckQg9xfJYKODEhVQc+5
	 SOH30zBw/W5Qe7f0MpHPP8JfCtbGQnmMesZJMSm4sMKE4J30syVf1/HPic4Hh0hZ0s
	 PqTJG3l4Mdd8cbhUvsXlaymPHJZSbeq1nSnKsl3SIupX2Uj+fi/HnNmQ6B/cCwECgX
	 sNeAkiBiRiy1w==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtRLB-0002Mg-07;
	Thu, 19 Oct 2023 13:37:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath12k: fix dfs-radar and temperature event locking
Date: Thu, 19 Oct 2023 13:36:49 +0200
Message-ID: <20231019113650.9060-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019113650.9060-1-johan+linaro@kernel.org>
References: <20231019113650.9060-1-johan+linaro@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_043724_246532_9843DF66 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

The ath12k active pdevs are protected by RCU but the DFS-radar and
temperature event handling code calling ath12k_mac_get_ar_by_pdev_id()
was not marked as a read-side critical section.

Mark the code in question as RCU read-side critical sections to avoid
any potential use-after-free issues.

Note that the temperature event handler looks like a place holder
currently but would still trigger an RCU lockdep splat.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org	# v6.2
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ef0f3cf35cfd..1a1f57c7ac7e 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6476,6 +6476,7 @@ ath12k_wmi_pdev_dfs_radar_detected_event(struct ath12k_base *ab, struct sk_buff
 		   ev->detector_id, ev->segment_id, ev->timestamp, ev->is_chirp,
 		   ev->freq_offset, ev->sidx);
 
+	rcu_read_lock();
 	ar = ath12k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev->pdev_id));
 
 	if (!ar) {
@@ -6493,6 +6494,8 @@ ath12k_wmi_pdev_dfs_radar_detected_event(struct ath12k_base *ab, struct sk_buff
 		ieee80211_radar_detected(ar->hw);
 
 exit:
+	rcu_read_unlock();
+
 	kfree(tb);
 }
 
@@ -6511,11 +6514,14 @@ ath12k_wmi_pdev_temperature_event(struct ath12k_base *ab,
 	ath12k_dbg(ab, ATH12K_DBG_WMI,
 		   "pdev temperature ev temp %d pdev_id %d\n", ev.temp, ev.pdev_id);
 
+	rcu_read_lock();
 	ar = ath12k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev.pdev_id));
 	if (!ar) {
 		ath12k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev.pdev_id);
-		return;
+		goto exit;
 	}
+exit:
+	rcu_read_unlock();
 }
 
 static void ath12k_fils_discovery_event(struct ath12k_base *ab,
-- 
2.41.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
