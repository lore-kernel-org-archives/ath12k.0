Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6205C43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 06:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gImCEmtMsWutE6Xcg5AbO+j7S75qhJcqK6Q0eqEnk5c=; b=a6KHN6fQT3/HkjC+rRgPJwzZVI
	/GhtvRsGJFLGjIymzcEc1zM8mNN85XF1LIkKfqv+NbCLPItC/yXKHqzv7De79gksAbYG7n6sJg53q
	ew0UVVB07SOeHKPlEyFx/2xJzzTkIFHgmbTQX2J4chBwZJQvNJ4a3Y0fhHOdboq2+zSf5q63ygufo
	FHMgkHnmqduRUuZ34+R35JVe0PYJhm0GmjLH+t1sJ8iVQIHJ0uM7U7Btj/gWHD4mik+R0GlNUlo4A
	fQ+LXUOWCJz3WjbSW4+4/gVLtFsDvoFVVewZsriiZ1O1zuuZEgbPgOArQBb+dRWbqCAkLp9rTQly1
	HMyoJEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWzB-000000067ia-2JhC;
	Fri, 03 Jul 2026 06:02:49 +0000
Received: from mail-m103131191171.xmail.ntesmail.com ([103.131.191.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWz8-000000067gf-1B0s
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 06:02:48 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 44c2aee32;
	Fri, 3 Jul 2026 14:02:32 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2 ath-current] wifi: ath12k: avoid flushing scan timeout under the wiphy lock
Date: Fri,  3 Jul 2026 14:02:19 +0800
Message-Id: <20260703060219.2998148-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f2692561303a1kunm8b79284b267b6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEwfVhoeT0tCSB9LS0tLGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=PA6+wwddAlFfYNDLvDiyuDnCF83FhOsXPDZo5caFThSqJOK2VVZCNfC7RS5cKXl9mEYJodTKIET2Jyn8pCAL08JGiCVhlVv5/Xrg58ahLQ3qT9kXYoNzXGtAiInoC58olsElJQrm0idUvNhVWinpBs6z7Pk+AmZ+uAEQidcM/ms=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=gImCEmtMsWutE6Xcg5AbO+j7S75qhJcqK6Q0eqEnk5c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_230247_023062_DB450763 
X-CRM114-Status: UNSURE (   9.44  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

ath12k_mac_op_stop() is called with the wiphy lock held. It then takes
ah->hw_mutex and calls ath12k_mac_stop(), which synchronously cancels
ar->scan.timeout.

That can deadlock if the delayed work has started. The timeout worker
ath12k_scan_timeout_work() takes the same wiphy lock before aborting the
scan, so stop waits for a worker that cannot make progress until the
wiphy lock is released.

Drain ar->scan.timeout before entering the locked stop teardown, and
remove the synchronous cancel from ath12k_mac_stop(). This preserves the
stop-time drain while avoiding the wait-under-wiphy lock ordering.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
Changes in v2:
  - Rebase on ath.git ath-current.
  - Use ath-current subject tag as requested.
  - Move the synchronous scan timeout drain out of the locked stop path
    instead of adding it in the wrong start-path context.
  - Update Fixes to the ath12k commit that introduced the stop-time
    scan.timeout drain.

 drivers/net/wireless/ath/ath12k/mac.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index af354bef5c0d..6da9a2bda9fe 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9931,7 +9931,6 @@ static void ath12k_mac_stop(struct ath12k *ar)
 
 	clear_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags);
 
-	cancel_delayed_work_sync(&ar->scan.timeout);
 	wiphy_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &ar->scan.vdev_clean_wk);
 	cancel_work_sync(&ar->regd_channel_update_work);
 	cancel_work_sync(&ar->regd_update_work);
@@ -9975,6 +9974,15 @@ void ath12k_mac_op_stop(struct ieee80211_hw *hw, bool suspend)
 
 	lockdep_assert_wiphy(hw->wiphy);
 
+	/*
+	 * scan.timeout takes the wiphy lock before aborting the scan, so do
+	 * not wait for it from the locked stop path below.
+	 */
+	wiphy_unlock(hw->wiphy);
+	for_each_ar(ah, ar, i)
+		cancel_delayed_work_sync(&ar->scan.timeout);
+	wiphy_lock(hw->wiphy);
+
 	ath12k_drain_tx(ah);
 
 	mutex_lock(&ah->hw_mutex);
-- 
2.34.1

