Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88E5CDB465
	for <ath12k@archiver.kernel.org>; Thu, 19 Oct 2023 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxVoaCTPoIpx62+gZDg+tVLjdwl8yHZWAh68OIcvSpk=; b=JCK944vcD/qOx/
	gF5fEncAaNVaSQ3QGiAQqn7AdyF2fDWEnMPDwCVnjJSnanjw+FL9gj0+wXnh1JDHklWIlbhNivEmw
	dMsoX9l/07ewaDO8fi/Igkknr8Fy8Hv5PW3tR1xi0kKFPnRHDvKpbmN6OElGOgqboGC7x3fg3XXro
	tE0OSLc+hS8jObxrAGeDPRPtgRdb1aZ5Hr6FSf205o08zZL7wXwtZ06JUeKsoMNGX87m47sS5DU/x
	WpbCLcazZZAiSE1+mpE6xP8pQEAvHzs6+kCKCbZNnsHMWW6oRd8NsXSSGaUeJVZscn7eWGJ1vEMmk
	RyktglcfsHfqaWwza7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRLE-00HBOO-1x
	for ath12k@archiver.kernel.org;
	Thu, 19 Oct 2023 11:37:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRLA-00HBLJ-1t
	for ath12k@lists.infradead.org;
	Thu, 19 Oct 2023 11:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 38A30B8287A;
	Thu, 19 Oct 2023 11:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AC8C433CC;
	Thu, 19 Oct 2023 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697715441;
	bh=AlrEZPik1jxL6sdyw6sk2fh7vSfCW6AGj33Rbxfwiss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oxUv1OUW44Gy2DI6jjcgUUKlurn88h9liKBHyTR8b2U+XPsosnOfQ+S3t8uh9jOlZ
	 +cFpbWANwm8rsYP5on73ULXaczg4UxnvN1vLyIaJpUKen2unUKqGEt45X1dBD2MBWk
	 znEzlvO0qjoPpDuQj/l+i8JM6medNMFkAjWadX6EopLqSOv0jSqnqTmcyOWoZ8gS0X
	 r1s5u/ZkvhlWc0qXoHPNr11M24QGsLsyxpnEj/tl/FTd6hVFb72CHLrYFfdt0lua4R
	 4VwiXJ+yTNAxO30U52+xcqRAseMeIMeZgn6CiZ8nOSKssNstHLskSIZNEcBpAK3IQC
	 gdXEE5ZZHUjeQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtRLB-0002Mi-0N;
	Thu, 19 Oct 2023 13:37:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath12k: fix htt mlo-offset event locking
Date: Thu, 19 Oct 2023 13:36:50 +0200
Message-ID: <20231019113650.9060-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019113650.9060-1-johan+linaro@kernel.org>
References: <20231019113650.9060-1-johan+linaro@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_043724_775671_82D7616C 
X-CRM114-Status: UNSURE (   8.94  )
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

The ath12k active pdevs are protected by RCU but the htt mlo-offset
event handling code calling ath12k_mac_get_ar_by_pdev_id() was not
marked as a read-side critical section.

Mark the code in question as an RCU read-side critical section to avoid
any potential use-after-free issues.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org      # v6.2
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index e6e64d437c47..3294625650dc 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1641,11 +1641,12 @@ static void ath12k_htt_mlo_offset_event_handler(struct ath12k_base *ab,
 	msg = (struct ath12k_htt_mlo_offset_msg *)skb->data;
 	pdev_id = u32_get_bits(__le32_to_cpu(msg->info),
 			       HTT_T2H_MLO_OFFSET_INFO_PDEV_ID);
-	ar = ath12k_mac_get_ar_by_pdev_id(ab, pdev_id);
 
+	rcu_read_lock();
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, pdev_id);
 	if (!ar) {
 		ath12k_warn(ab, "invalid pdev id %d on htt mlo offset\n", pdev_id);
-		return;
+		goto exit;
 	}
 
 	spin_lock_bh(&ar->data_lock);
@@ -1661,6 +1662,8 @@ static void ath12k_htt_mlo_offset_event_handler(struct ath12k_base *ab,
 	pdev->timestamp.mlo_comp_timer = __le32_to_cpu(msg->mlo_comp_timer);
 
 	spin_unlock_bh(&ar->data_lock);
+exit:
+	rcu_read_unlock();
 }
 
 void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
-- 
2.41.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
