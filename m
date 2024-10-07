Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000D4CFB451
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FH/X5VaLxYpkDObjqTi7dP5uZ6QqQAIsJJjbaz6Wr5E=; b=d8wwYRAQ6ByvtdaDeUrkXW7+Eb
	K98M62Loo4HpaHMMqYQ14IPINhel7E1vJixh9psmrMcGmOeXJ+Lpkyttnglwog+vLYZS5v6FW4gdf
	K0kLmQbjXco/3OdNG5diIwsc0ipcnA/eBnSQQOvAn4HkadBzRBIBq/Uv99UhzQEMDn7UNgMHzQxiN
	VPyQVee2+4c3qgf5jSKEECo02DbSit//f5UFFfbr0zFunVjWHTQAKNUUzsSDmMwcX0WQuiv6YNjP6
	GcTl9fEmMzt2IWk/NCQHZpDwxhRTMwR78wYV/fuKZQ5s3L4Yw4vR0NSo/Pkibvc3TFRHNARLdVM7r
	HApAWs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5q-00000003GSe-2OmO
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 17:00:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5F-00000003GLs-28Mk
	for ath12k@bombadil.infradead.org;
	Mon, 07 Oct 2024 16:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FH/X5VaLxYpkDObjqTi7dP5uZ6QqQAIsJJjbaz6Wr5E=; b=rgngNIIKGNXWF4dvRyGRHqfki6
	zoIQS9lIu+Te3/Fo6sW42R9mf4bsG6Jl58GJ57KFXUBuVuzkzD9esppCoj2iS2htyVAMJZFnX3lW6
	oykgBNp3q5+INkGjBnMLwiwvHArwMD4fv3MWdHcUCil0cWKhwU5eyz/6U/Pkk6JEcfoTc5ClFaCJQ
	abcfHFMzcPGPKU9dyh9SFNP9BvsR2N2dUrij1VKfqTdLC9HrRDwbvuu6EhMjoHLWBUkw21VvRSYZZ
	frX+IP1K+VgPR6DS9UQkq3P0XGRSIAjr5LmAsdmiGZ8QOc74KqXQbXBHgBxtz8Xt8ubEaoX2KBIZ+
	BAzMMlWA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5C-00000004Slh-2TvP
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 16:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5C56A41D23
	for <ath12k@lists.infradead.org>; Mon,  7 Oct 2024 16:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99315C4CEC6;
	Mon,  7 Oct 2024 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728320381;
	bh=jPJ/21LqA9O61yqJ1UBZq2g0LOb8JB8UNOMYpSsGj98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W/QoooBTq+DESIh4UgBrnfClQ6OQ0zmZGp3aN+lGFW1BSoiQgVpCioKcrLGgTO12G
	 kJCFhvbrHSHpsNL80MtfzBKY3szfevj4L73NWPyAgxUjz5RPDDGIM3kAJPqttTNCHx
	 ydWFbL38YSZ4Gw2rpJoIcGxwB4ksWd68f1oPz39NzkRWE1+V8gVzCn7v2bQw3ZsTyJ
	 sRlqOpTdrU4feMNoa0tR62pLhT3ZZplQZSrfopIbGSmgISkrkobJHSGRIsmZF3etuh
	 DBn19igDAwh20wOYHyRe09YEOnaDu27qpBEsKkFhHeGsAp7ewiitcOS2YQfySp097b
	 JzER2qzXlp8FQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v4 6/6] wifi: ath12k: ath12k_mac_op_sta_state(): clean up update_wk cancellation
Date: Mon,  7 Oct 2024 19:59:32 +0300
Message-Id: <20241007165932.78081-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241007165932.78081-1-kvalo@kernel.org>
References: <20241007165932.78081-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_175942_840175_77814972 
X-CRM114-Status: GOOD (  11.14  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Now that we have switched to using wiphy_lock() there's no need to have
update_wk cancel call separately, for consistency move it to the rest of code
handling IEEE80211_STA_NONE state.

No functional changes.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0c0b87a6e9fa..d4b438e4b7bf 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4569,11 +4569,6 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	struct ath12k_peer *peer;
 	int ret = 0;
 
-	/* cancel must be done outside the mutex to avoid deadlock */
-	if ((old_state == IEEE80211_STA_NONE &&
-	     new_state == IEEE80211_STA_NOTEXIST))
-		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
-
 	ar = ath12k_get_ar_by_vif(hw, vif);
 	if (!ar) {
 		WARN_ON_ONCE(1);
@@ -4594,6 +4589,8 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr, arvif->vdev_id);
 	} else if ((old_state == IEEE80211_STA_NONE &&
 		    new_state == IEEE80211_STA_NOTEXIST)) {
+		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
+
 		if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
 			ath12k_bss_disassoc(ar, arvif);
 			ret = ath12k_mac_vdev_stop(arvif);
-- 
2.39.5


