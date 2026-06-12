Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9255ACD98C7
	for <ath12k@archiver.kernel.org>; Fri, 12 Jun 2026 03:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OYG8FF1qte1dFzNbSJ7ZjAMN0gyC4DSDMnQ2biEA2Z4=; b=TsMZHN2757VEjpDmC/E/0TO8CS
	q1D0mgZ0NjNQsXS5FSuMVybBQ5XLeTArPup6d4KxrobCh0iwuwyz9fYSemjSCJmOQBegMKJof1+zC
	vpKHtXwXIhvx5U7PBOR/awUGKBMEL0EBU5bGb2EUcCCEl5RCTKb2M8Pnlh7kn8mcbxGZoZgwb5Jd9
	yyeV8NLFLO2kvkpS99kS2gTa3GsNo962ipko6elgqCbZKNnVef2j9DNfHu7bUBMQFvOJ7mei+HJ4F
	Q77STQ/2NvOFiUT2MYyF9LtpYAWWKgQbyBtP6LzJ2Yx33CF30mNmgT+8CoQPw+Qsx+XhjQze2zJMB
	x2mRoOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXsYQ-0000000AJgN-0Y0r;
	Fri, 12 Jun 2026 03:27:34 +0000
Received: from mail-m6040.netease.com ([210.79.60.40])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXsYL-0000000AJg0-2sYD
	for ath12k@lists.infradead.org;
	Fri, 12 Jun 2026 03:27:32 +0000
Received: from PC-202605011814.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4217b11a3;
	Fri, 12 Jun 2026 11:27:22 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: jjohnson@kernel.org
Cc: kvalo@kernel.org,
	quic_kangyang@quicinc.com,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: ath12k: avoid flushing scan work under the wiphy lock
Date: Fri, 12 Jun 2026 11:27:01 +0800
Message-Id: <20260612032701.1619188-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eb9debbea03a1kunma64aae04181256
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTU8dVhlLHR4fGE0fGUhOTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=U/wBGcrXfmxiUJTXDGpQPoyDXab+N9lE5yaEVcYf68EUjSrTUvQalq4fxwwd+ITCRkw/lBFTQA8//+dkkyaHdKVDevzBWD9gI4+S0Dcf5lXPyLJSBqB6pAdQByAyO24LhYQVcg5c6DPBPbzV3YWy4pvcp8cvFZlmfayFr360Loc=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=OYG8FF1qte1dFzNbSJ7ZjAMN0gyC4DSDMnQ2biEA2Z4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_202730_435423_9A78158B 
X-CRM114-Status: UNSURE (   7.77  )
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

ath12k_mac_op_stop() is entered with the wiphy mutex already held.  It
then takes ah->hw_mutex and ath12k_mac_stop() synchronously cancels the
scan.timeout delayed work.  The timeout worker grabs the same wiphy lock
before it aborts the scan, so stop can deadlock against the pending
worker.

This issue was found by our static analysis tool and then manually
reviewed against the current tree.

The grounded PoC kept the ath12k_mac_op_stop() -> ath12k_mac_stop() ->
cancel_delayed_work_sync(&ar->scan.timeout) path and the
ath12k_scan_timeout_work() -> wiphy_lock() edge.  Lockdep reported:

  WARNING: possible circular locking dependency detected
  ath12k_scan_timeout_work+0x25/0x42 [vuln_msv]
  __cancel_work_timer
  *** DEADLOCK ***

Drain scan.timeout before re-entering the stop path under the wiphy lock
and leave the rest of ath12k_mac_stop() unchanged.

Fixes: 2830bc9e784f ("wifi: ath12k: implement remain on channel for P2P mode")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
Notes:
  - Validated with a grounded Lockdep PoC that preserves the
    ath12k_mac_op_stop() -> ath12k_mac_stop() ->
    cancel_delayed_work_sync(&ar->scan.timeout) path and the
    ath12k_scan_timeout_work() -> wiphy_lock() edge.
  - checkpatch.pl --strict: clean.
  - Not tested on ath12k hardware.

 drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b97469dca046..cc9e8331513d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5263,8 +5263,6 @@ static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
 		ar = arvif->ar;
 
 		ath12k_scan_abort(ar);
-
-		cancel_delayed_work_sync(&ar->scan.timeout);
 	}
 }
 
@@ -9164,6 +9162,15 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 
 	lockdep_assert_wiphy(hw->wiphy);
 
+	/*
+	 * scan.timeout grabs the wiphy lock before aborting the scan, so
+	 * drain it before re-entering the stop path under the wiphy lock.
+	 */
+	wiphy_unlock(hw->wiphy);
+	for_each_ar(ah, ar, i)
+		cancel_delayed_work_sync(&ar->scan.timeout);
+	wiphy_lock(hw->wiphy);
+
 	ath12k_drain_tx(ah);
 
 	guard(mutex)(&ah->hw_mutex);
-- 
2.34.1

