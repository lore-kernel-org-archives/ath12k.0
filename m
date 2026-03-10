Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9C8FCC9AE
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 02:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WOboup7oLRUcKhmnSCiuT0y1k3/298+wfQJlrTpRp68=; b=tLVS5nGA7ZU+HpD6FSjCUXt7zd
	0FdDj0fQzSS+xUKEuXeGAI6VyHE54pSMBgWc4kPYIgmRQsj4I2BcfeEeFAtOQQ1FZFUBY8FQcbuUn
	+dDJd0Zq80/IKgfttvKmwCv8Vp3JPDWQvkTtPPoJdH4zLFalCUq1dPUEaruCw6vsp1iudnpCCWeYy
	05uXLY9Z5ww1Wmo/PnMZ9+9FxDa2hpZiM9pe8fdYRr4Wnswwto8nmZiZ8cxehOcozOAsIE4ZCIqH7
	a6ooZhYAElHWjPZTMu/gsaQKpvHU6lp2Kvl/tAgFPKZXXCT6c+GP1fUkNQaTVAcKF5SSq1CJEkgE+
	tFkePkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzn5l-00000008aL0-0WVe;
	Tue, 10 Mar 2026 02:45:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzn5i-00000008aKf-2jIV
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 02:45:03 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so7071711a91.0
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 19:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773110702; x=1773715502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WOboup7oLRUcKhmnSCiuT0y1k3/298+wfQJlrTpRp68=;
        b=bMpR/4JAX+geylwsDJDeGZXlCXeHFTAVrhWEIlUqCIzSCU9hKzYMC5w8IgdYnCQirb
         9Q/voR0WPPs3KzZe2KlTpPLbYlXbrXJlx3gx09spyge7NZ2/6pFf7tgRDwLyUry1tpAW
         QFgkgChLZIW5r8jXzNqSjKITCeo4IxvnWNrBb8hHgt2A80iMDXoKE+dvIfp/4e2lux/9
         QExHyzDz4WEeIlAb5/QHjhei3Ei7atMD3SrmFwBRdqlYWLu+j1E1d5ueb/T7HAyefVV9
         s1PTHYxdinH9HIoh6QUAItJNWgMqbYjJqlmq/WCwqFaRFaLrzKwlvrdl9of15VfJjSn5
         A2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773110702; x=1773715502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOboup7oLRUcKhmnSCiuT0y1k3/298+wfQJlrTpRp68=;
        b=eNDAlhnZzwyG/HZUiexWqcKUzRyuVX/oGCA7v6mr1OIzr2EXwYtrknBODrsl/cTEd+
         AaKAi9XKKGaHdWrzN+R2SjolJ4PTmO1YCv7uAU2WdijTNZvmn6o+BOtWdz5jQyfwc8aw
         0oWOFpcZJrEzyjkvLwEcUMu2mVE0/TnDqJbY+jbEHo20MF4avBv0sX75QYjG+rga4pxN
         l9KmhIDTEJ8T1DUWFhiREr3cNR9buY8W17Lxg2ShtHzTAj+ZnIAXw//j3K2RhWXr8YER
         9GJ4jyHmo8Qu891hQowEKrGTP0dfyVMEgRhMWaLzdJrpZcYrj+MehX+FeL3cIzdEaKwJ
         L6nw==
X-Forwarded-Encrypted: i=1; AJvYcCWEBLUsxr//nyKRW+AQspvxQ/ot9t+QPh1YLJaTkgmoUKkT3dJZZRFAbXZovnzC/hkORWoUg4Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKCzeBNX3ODv0XgQBYixHEGtbCgdHq2HkKcbXNUC6ctEP8qsx9
	kJo6IcAAt+iP5dis2MZHcYlVFkBeFDYb/uhW188opD+Hv0E+Q8Zsu4QR
X-Gm-Gg: ATEYQzwzDdftaHwe/kFGTr0MDVFIyIYPTPImpjPd+ruaQ6ocy8TB5RPaS3VWxGoUKBb
	+NfunxIVgBsp8vE3QYh2fXRua4ViEzDaaykmd9vrPbEuIxGPp8vVtayTqLlupQgakvAJQ8CifS1
	k+BXKUnaip/fnngLcWMRdhFboIpQ0gR2AmAubC7Uni4I9KZCZXK2uxXqZUmMoA9lI8rCjMvXdbD
	d5RC/K/3r4D5C2JcyrsW0qlSK6ciBBwVe1UpUWcKiHoMK+H+DO8kvDqHlW+FjkAcZBCA8+PFUoW
	ENa6vrUuXwq77jKpKBfr3kGsOXh9TFSl5b185md6EXlLaZTxuCQbB8Ebr9Zy6Ipl8Is1yp1I6GB
	rCgJkBwfd66FXx6X8sdMxHGOEtJOYYy2gkqXYtAzhZOYMHbid3r4/lTF7DSxIloKA1s9KYr0q7O
	LNyyVBIqUfkSf+kFQq0yReOGSpkU9dHtS82NZMNPJt7tc38bvbg3gQBh4=
X-Received: by 2002:a17:90b:1848:b0:359:7a1f:1b83 with SMTP id 98e67ed59e1d1-359be34da3dmr12193517a91.26.1773110701749;
        Mon, 09 Mar 2026 19:45:01 -0700 (PDT)
Received: from localhost.localdomain ([119.204.109.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcbc6fe9sm4781365a91.12.2026.03.09.19.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 19:45:01 -0700 (PDT)
From: James Kim <james010kim@gmail.com>
To: jjohnson@kernel.org
Cc: quic_srirrama@quicinc.com,
	quic_ramess@quicinc.com,
	kvalo@kernel.org,
	stable@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	James Kim <james010kim@gmail.com>
Subject: [PATCH] wifi: ath12k: fix use-after-free of arvif in assign_vif_chanctx()
Date: Tue, 10 Mar 2026 11:43:05 +0900
Message-ID: <20260310024305.555408-1-james010kim@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_194502_692991_FCF3638A 
X-CRM114-Status: GOOD (  12.16  )
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

In ath12k_mac_op_assign_vif_chanctx(), arvif is obtained from
ath12k_mac_assign_link_vif() and then passed to
ath12k_mac_assign_vif_to_vdev(). Inside that function, when the
target radio (ar) differs from arvif->ar (multi-radio configuration),
the old arvif is freed via ath12k_mac_unassign_link_vif() -> kfree()
and a new one is allocated internally. However, only the ar pointer
is returned to the caller — the caller's arvif still points to the
freed memory.

The caller then continues to dereference this stale arvif pointer
at multiple locations (arvif->vdev_id, arvif->punct_bitmap,
arvif->is_started, etc.), resulting in a use-after-free.

Fix this by re-fetching arvif from ahvif->link[link_id] after
ath12k_mac_assign_vif_to_vdev() returns, since the link pointer
is always updated when a new arvif is assigned.

Fixes: 477cabfdb776 ("wifi: ath12k: modify link arvif creation and removal for MLO")
Cc: stable@vger.kernel.org
Signed-off-by: James Kim <james010kim@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b253d1e3f405..ee44a8b59e9b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12069,6 +12069,17 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		return -EINVAL;
 	}
 
+	/* ath12k_mac_assign_vif_to_vdev() may free and reassign arvif
+	 * internally when switching radios (ar != arvif->ar). Refresh
+	 * arvif from ahvif->link[].
+	 */
+	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+	if (!arvif) {
+		ath12k_hw_warn(ah, "failed to get arvif for link %u after vdev assignment",
+			       link_id);
+		return -ENOENT;
+	}
+
 	ab = ar->ab;
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
-- 
2.43.0


