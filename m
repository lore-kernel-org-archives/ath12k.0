Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5844C52D7C
	for <ath12k@archiver.kernel.org>; Fri,  9 Aug 2024 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0etz1c5A4g9H9LRU+n89+yRH606s0o64B0AWDHueRVc=; b=QZ6r7hEB1SV76AOqQdDKEJRedd
	0AXy/T4P/KEPOcempU/5WpnIGFetqVUu1F67CjzMv5BVjuUvirY2MQ+jN4X7MfgcDkowQkrhGay34
	QS9baqTO6QIm9Qh2xXYUSZhhaaJrYz1JCCQlLL3UE+9wDNowEHJJS2L8n/AaFf0v8J1YfeGxj5+aY
	mklkWl/fAqUEwn2SGcMXw8uNqDShmg5S0heybQ37w7HzJWPcZHgsokJds586kdb/cl7SYsmQwn3rL
	Zo19+gJUsxoESGyKEHTEZdiFVfP3hmQuIJ42jJtjXjmmU3dnyNiDfGC95Y+AeUMJKnK8p2LEl1OKZ
	CO2VWEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSYS-0000000BwX8-2m0Q
	for ath12k@archiver.kernel.org;
	Fri, 09 Aug 2024 16:33:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSY5-0000000BwQq-1oBT
	for ath12k@lists.infradead.org;
	Fri, 09 Aug 2024 16:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 92B05CE1383
	for <ath12k@lists.infradead.org>; Fri,  9 Aug 2024 16:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157E4C32782;
	Fri,  9 Aug 2024 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723221182;
	bh=1ubKv9iYakEVw8NVhxMtu+IrpAtVCtKDNpr+xRZOhk0=;
	h=Date:From:To:Cc:Subject:From;
	b=ELvcMjOXSJvDg/yRqQsKVs5fRAWH5zGBZFk0nlPxRcA77KkbM/SHsxp1nHo535Nt0
	 POTyM8nnCT6j6X4yirmfIJsEJHWPPXMEhIA3J/WMdGRyhoocp3MYiJI12L3sE86sd9
	 A2t2gW1ulbaCjiLGP1DHGHEw93SBw388iY63R11uWdUTTP/G0+tLkUDroqOzMYWQJ0
	 rAX3bR+5z6sDVVDwLa28Q5KbP2+8rco4l5a6LL9WABl+3Czl9Ze6LV+QFemFEnsnnq
	 VyccyiZfPqLnd5exLpJfxDskDJXIv0NXfzWQ8ciYF0/ufiLhub+K6Nt5Qoc+gYlCpQ
	 iNoOGIOWvX1mA==
Date: Fri, 9 Aug 2024 10:32:59 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] wifi: ath12k: Avoid -Wflex-array-member-not-at-end
 warnings
Message-ID: <ZrZEuxJihMzAaTVh@cute>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_093305_672926_828609E4 
X-CRM114-Status: GOOD (  10.48  )
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

Also, remove an unused structure.

Fix the following warnings:
drivers/net/wireless/ath/ath12k/core.h:290:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/net/wireless/ath/ath12k/dp.h:1499:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/ath/ath12k/core.h |  4 +++-
 drivers/net/wireless/ath/ath12k/dp.h   | 12 ------------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index cdfd43a7321a..bd23c7401637 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -287,7 +287,6 @@ struct ath12k_vif {
 	int txpower;
 	bool rsnie_present;
 	bool wpaie_present;
-	struct ieee80211_chanctx_conf chanctx;
 	u32 key_cipher;
 	u8 tx_encap_type;
 	u8 vdev_stats_id;
@@ -295,6 +294,9 @@ struct ath12k_vif {
 	bool ps;
 	struct ath12k_vif_cache *cache;
 	struct ath12k_rekey_data rekey_data;
+
+	/* Must be last - ends in a flexible-array member. */
+	struct ieee80211_chanctx_conf chanctx;
 };
 
 struct ath12k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index b77497c14ac4..2fb18b83b3ee 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1495,18 +1495,6 @@ struct htt_ppdu_stats_user_rate {
 #define HTT_TX_INFO_PEERID(_flags) \
 			u32_get_bits(_flags, HTT_PPDU_STATS_TX_INFO_FLAGS_PEERID_M)
 
-struct htt_tx_ppdu_stats_info {
-	struct htt_tlv tlv_hdr;
-	__le32 tx_success_bytes;
-	__le32 tx_retry_bytes;
-	__le32 tx_failed_bytes;
-	__le32 flags; /* %HTT_PPDU_STATS_TX_INFO_FLAGS_ */
-	__le16 tx_success_msdus;
-	__le16 tx_retry_msdus;
-	__le16 tx_failed_msdus;
-	__le16 tx_duration; /* united in us */
-} __packed;
-
 enum  htt_ppdu_stats_usr_compln_status {
 	HTT_PPDU_STATS_USER_STATUS_OK,
 	HTT_PPDU_STATS_USER_STATUS_FILTERED,
-- 
2.34.1


