Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A741D65536
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qUdyjuHWbBsyPg/0eSRd36/FbjOCy1Y4yTWiwKzt70=; b=IJQQ6nRUE09kBP+F6l+X2Gfglp
	BKijZHpjw2YowAUySF0xQVmaUhbOaWSjHDuEsEBYgjjIyIj49NJv5y8Q9H6BFGu3SvJWlGnckmerV
	OlZEUQLsSFq6/g67FvosvPlG6SIBLnXcK3fAm7/zyg9fQMJnAzoLikqPhsN1G/O5lEhxDOBXhCYY0
	Nm1UIRQP+Pn2yOE4ZgofFJqhZliOOXeixcWiWEg1vVVYQGZ7QhBwydrSSIJ3CMbWi/7v3vLyvTdBT
	IG+mvUD95dV2yGosx4NPYbJoQD++oc42b5s6URjlyQBWr2UvxBT/B5O7xJrm0vyLCPcaFZr4AE/pT
	LJ1Uwdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6S-0000000BGKg-3o16
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6N-0000000BGEm-2gQF
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11C2DA41000
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208A3C4CECF;
	Tue, 26 Nov 2024 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641110;
	bh=QXKNn6DEEbGV9PpSiHhKXFby5Khi/rrcLUVwoxW4ylw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvbutyJ6elbTPxLkxB9r/r0S1We5A4TKYQsL/p95Pg02A/dz9H9gjZ180S0hMXh1o
	 14cg7SyBxvWQcNYpFeOk2LRPnFZpYDL2feXzCrfVmOZfx6HhLuqyQz0lrq/exco0n5
	 dVLMVCgX+qpE7mod7vaQ0Vte1CQJ0r5Qlo6gkKwDAcZf4pSE42xDtvyMbvqCoGdC7v
	 byggfvcHj9FJ0XA4fLR9VEo3CMl/OgPN6jTfm3BjvM57lY0Uceyc/4EBQHTtU39/Z4
	 iKpntKfAP1Wk7diJ2+ClDahQDID1uqvbiZGSjianlrR4NNI1Abs/QMNOvHIcHe9q/h
	 wLjoRoe4wYL5g==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 08/10] wifi: ath12k: defer vdev creation for MLO
Date: Tue, 26 Nov 2024 19:11:37 +0200
Message-Id: <20241126171139.2350704-9-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126171139.2350704-1-kvalo@kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091151_746150_90569791 
X-CRM114-Status: GOOD (  11.83  )
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

From: Rameshkumar Sundaram <quic_ramess@quicinc.com>

Currently for single radio devices (ah->num_radio == 1)
ath12k_mac_op_add_interface() creates vdev and later hw scan and
assign_vif_chanctx uses the same. For MLO, vdev create request should carry ML
address which will not be known during ath12k_mac_op_add_interface() as vif
will be marked as ML only after links are added to it.

If hw scan is requested, the vdev will be deleted post hw scan and subsequent
assign_vif_chanctx call will create new vdev with ML address. But in certain
cases assign_vif_chanctx could be called without any prior hw scan request and
reusing the previously created vdev causes a non-ML vdev to be used for an ML
vif and firmware operates the vdev in non-ML mode.

Fix this by deferring vdev creation for interface until hw scan or
assign_vif_chanctx request is received from mac80211.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 364e9c6adc73..f85661534d9e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8131,14 +8131,9 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 		vif->hw_queue[i] = ATH12K_HW_DEFAULT_QUEUE;
 
 	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
-	/* For non-ml vifs, vif->addr is the actual vdev address but for
-	 * ML vif link(link BSSID) address is the vdev address and it can be a
-	 * different one from vif->addr (i.e ML address).
-	 * Defer vdev creation until assign_chanctx or hw_scan is initiated as driver
+	/* Defer vdev creation until assign_chanctx or hw_scan is initiated as driver
 	 * will not know if this interface is an ML vif at this point.
 	 */
-	ath12k_mac_assign_vif_to_vdev(hw, arvif, NULL);
-
 	return 0;
 }
 
-- 
2.39.5


