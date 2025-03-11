Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4BEC282DE
	for <ath12k@archiver.kernel.org>; Tue, 11 Mar 2025 01:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YZH3qwfFp8869Aluwq8zUWcYDjAL5YsNNVYaukr1iOc=; b=R5bxP0d/4o90s95IZXjIYsY30/
	U27p69ya6ivrOeUBTONnvamG5k6TEgV/szy1zv0hPTZp9AhOTLs+5vRhqblb89j9Z3ORafb7iwObm
	eQQhzXkgvSlSUMLRkvwdkI26X86ilCRxwIfuwkdGRh0goUWDK9D+zlMtiVy00zRAu7p1FUHJsPws+
	+iTq8wm/FiEWx80c8FNUpetKfRanU5SZDebGWAM0IbLI1nQnbV8ODvLfJVJ/eQneGDfMBUhLUDiNj
	dCQ4EJrJoxlbTnp4wrql4+qua42pdXIEzz2wvlUqB+BQtj67cbLwOzDrRrmEcnxnXii/3Bk+1mpU9
	AE9eSmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troTh-00000004LoR-1rg4
	for ath12k@archiver.kernel.org;
	Tue, 11 Mar 2025 01:32:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1troTe-00000004Lo2-3MnS
	for ath12k@lists.infradead.org;
	Tue, 11 Mar 2025 01:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86319A40FBE;
	Tue, 11 Mar 2025 01:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF150C4CEE5;
	Tue, 11 Mar 2025 01:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741656733;
	bh=Cz/8z4ogsB2e4LZuFVFwDmgAExkUr/0BAjvdTwGLBSc=;
	h=Date:From:To:Cc:Subject:From;
	b=NGevNZVhCBAzAZdPxfwRXUp4qN2wF2NFBlwriw4EhwJaTEIq22tch3HJ3vvHzS+FL
	 sUmcNnshcN0+uPMz12AXaL5lQmI5i3iuV0z6yi7cqijt/+ITKnyvFj83dINEoMVHpB
	 7gZQrGs/fX7GXnL3+XLHXL+PBVZza4f4iPtFly6TdTNuZsKt+AQ/X9evhbHNy+xG1p
	 OmVzfGhvyNXcNGee6xRCfOvBsi1rjoPAuYIN5JYhwGClA5x+BxPa4swBrZdoSyEoM+
	 4UC7+33P2VZUgRdgya0KP9tpPVtR/Uil631qChEyj/OlOsMQVrizq8PL33YXbFluyU
	 b/O0oLa7B4kXg==
Date: Tue, 11 Mar 2025 12:02:15 +1030
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] wifi: ath12k: core.h: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <Z8-Snz86Xfwdlyd7@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_183214_916223_AA614A4F 
X-CRM114-Status: UNSURE (   9.27  )
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Move the conflicting declaration to the end of the structure. Notice
that `struct ieee80211_chanctx_conf` is a flexible structure --a
structure that contains a flexible-array member.

Fix 30 of the following warnings:

drivers/net/wireless/ath/ath12k/core.h:298:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/ath/ath12k/core.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3fac4f00d383..d6b4c4d2c400 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -295,7 +295,6 @@ struct ath12k_link_vif {
 	int txpower;
 	bool rsnie_present;
 	bool wpaie_present;
-	struct ieee80211_chanctx_conf chanctx;
 	u8 vdev_stats_id;
 	u32 punct_bitmap;
 	u8 link_id;
@@ -303,6 +302,13 @@ struct ath12k_link_vif {
 	struct ath12k_rekey_data rekey_data;
 
 	u8 current_cntdown_counter;
+
+	/* Must be last - ends in a flexible-array member.
+	 *
+	 * FIXME: Driver should not copy struct ieee80211_chanctx_conf,
+	 * especially because it has a flexible array. Find a better way.
+	 */
+	struct ieee80211_chanctx_conf chanctx;
 };
 
 struct ath12k_vif {
-- 
2.43.0


