Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1225C001B0
	for <ath12k@archiver.kernel.org>; Mon, 14 Aug 2023 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f47wSdXfM3A4EqY+lvnnkto9l8thLwZYx9fN/NFNBuw=; b=YQ1Jgyhf7ram0E
	A+/i8LB74UK3N95T3XCcGB5OoyqR7oAbcqZcYR7ewn3GDS+k6XhOFLck9SnGI5YB9jJdVdQtbhh/S
	+F3dzNWTKkHLg5a+fD6BWNm9SonmW48GqijsTmyzakgVOIzxzvczmhEje16QOjVok2QmXPiTjUr+8
	+triNCv/49v6d8FKoCwgIjcbu5USF5yN7Z7hvIid9cF2Dn5LqMNpQfdugbUbGcd+mU+1EQ2DmVDZs
	d4oTs3Qd15uM57AtO0aLYF0yLRBGTTo4ZKOf/wgXMwTt62oeh6AG7zqVlEPYyZhpi+eWNeb59LmfE
	EMz+W2fmUet9Evu7wsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS4c-00GNXo-1V
	for ath12k@archiver.kernel.org;
	Mon, 14 Aug 2023 07:33:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS4Z-00GNWW-2t
	for ath12k@lists.infradead.org;
	Mon, 14 Aug 2023 07:33:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E86BC62FD7;
	Mon, 14 Aug 2023 07:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FDCC433C9;
	Mon, 14 Aug 2023 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691998386;
	bh=oMrRrOgkXSkt1HkEn3EB2rPFU8IDxpcIDKwVgYNNvdw=;
	h=From:To:Cc:Subject:Date:From;
	b=VTgGRjUyjEGGy0kmNfgMxIoTWJq+BK4NPhgHFu/yvZy8c5xaZE3zpFYkVzmUXCDyN
	 WDxf5vFDX/nQ1fLfar3q0tRT5WlSsYDKxJ/0iBGOXWpL+ES8e6We5G3cvhEJje6YA9
	 gZ+81x9QbuwKGYQgTP2wBm0E1yJ5N3+l26ArtBBkBjop4PPk7as3IcTxGC8jScuS7+
	 0fmXKVMXbyZHg0//zUjHz4IaTEnLcpKKX0cL1PHiWc5JXVHAAg4r0zDaxt027FzFfR
	 NYEd0ObVyUAOV0BldiJ1uzeZcFNnLGHJHicSd2Xl6gdaJ0gOgKpx5F0tBjID8Hp610
	 huK5qhIA5P2XQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Aloka Dixit <quic_alokad@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Karthik M <quic_karm@quicinc.com>,
	Aditya Kumar Singh <quic_adisi@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Johannes Berg <johannes.berg@intel.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] wireless: ath: remove unused-but-set parameter
Date: Mon, 14 Aug 2023 09:32:23 +0200
Message-Id: <20230814073255.1065242-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_003308_044785_FF6142CE 
X-CRM114-Status: GOOD (  11.79  )
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

From: Arnd Bergmann <arnd@arndb.de>

This has never been used since the driver was merged, but it now causes
a W=1 warning in recent clang versions

drivers/net/wireless/ath/ath9k/main.c:1566:21: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
drivers/net/wireless/ath/ath9k/htc_drv_main.c:1258:25: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
drivers/net/wireless/ath/ath5k/mac80211-ops.c:367:62: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]

Remove the bit manipulation on the otherwise unused parameter.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath12k/mac.c         | 5 ++---
 drivers/net/wireless/ath/ath5k/mac80211-ops.c | 1 -
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 1 -
 drivers/net/wireless/ath/ath9k/main.c         | 1 -
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 91453624fd842..354ed66e6d13b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5666,7 +5666,6 @@ static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
-	changed_flags &= SUPPORTED_FILTERS;
 	*total_flags &= SUPPORTED_FILTERS;
 	ar->filter_flags = *total_flags;
 
@@ -5684,8 +5683,8 @@ static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
 			    "fail to set monitor filter: %d\n", ret);
 	}
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
-		   "changed_flags:0x%x, total_flags:0x%x, reset_flag:%d\n",
-		   changed_flags, *total_flags, reset_flag);
+		   "total_flags:0x%x, reset_flag:%d\n",
+		   *total_flags, reset_flag);
 
 	mutex_unlock(&ar->conf_mutex);
 }
diff --git a/drivers/net/wireless/ath/ath5k/mac80211-ops.c b/drivers/net/wireless/ath/ath5k/mac80211-ops.c
index 11ed30d6b595a..c630343ca4f9b 100644
--- a/drivers/net/wireless/ath/ath5k/mac80211-ops.c
+++ b/drivers/net/wireless/ath/ath5k/mac80211-ops.c
@@ -382,7 +382,6 @@ ath5k_configure_filter(struct ieee80211_hw *hw, unsigned int changed_flags,
 	mfilt[1] = multicast >> 32;
 
 	/* Only deal with supported flags */
-	changed_flags &= SUPPORTED_FIF_FLAGS;
 	*new_flags &= SUPPORTED_FIF_FLAGS;
 
 	/* If HW detects any phy or radar errors, leave those filters on.
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index 51766de5ec3b6..6eeaa9011a168 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -1264,7 +1264,6 @@ static void ath9k_htc_configure_filter(struct ieee80211_hw *hw,
 	u32 rfilt;
 
 	mutex_lock(&priv->mutex);
-	changed_flags &= SUPPORTED_FILTERS;
 	*total_flags &= SUPPORTED_FILTERS;
 
 	if (test_bit(ATH_OP_INVALID, &common->op_flags)) {
diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
index 6360d3356e256..1494feedb27db 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -1571,7 +1571,6 @@ static void ath9k_configure_filter(struct ieee80211_hw *hw,
 	struct ath_chanctx *ctx;
 	u32 rfilt;
 
-	changed_flags &= SUPPORTED_FILTERS;
 	*total_flags &= SUPPORTED_FILTERS;
 
 	spin_lock_bh(&sc->chan_lock);
-- 
2.39.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
