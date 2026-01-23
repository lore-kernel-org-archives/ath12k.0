Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32568D74EEC
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2XUvQ9fPlmnJTRW1nC83FwDh2lFtjD96GKLl3MPPGM=; b=uaQegPGRvoxkAGxYRDBFb+7LeF
	Pdwo3Vq7Z1r+oioyaOq4o6Y3X54ZBm4HpTi54MHciOoew/MIG99OCqWXi487cy4wEMnNa7xhuUNci
	IQ5oMotI6N8Dg2CzvlpRH5YjY1JhU931Th9t6+9qU+S22929aPV74Iv6u+g+I6a1s75PTxBKNDa/r
	KAwf9ckxEx4DLsVE+VI4+34XAWxw1ykZa4lAr3RnsfvZSDiK4CE0ZiJ9FKiyxG51a86RcDwnxfJyM
	y7K1bnT+gyqYNRuTHJeNCOCgApIr+hhYUW6RuISgbm2CIqFF7N1emGWLekj1i/W11J9t4OLMfrgLT
	64n9JbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJXw-000000097vZ-3s32;
	Fri, 23 Jan 2026 15:58:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJXt-000000097u9-2DPf
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 15:58:02 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso1682900a91.0
        for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183880; x=1769788680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2XUvQ9fPlmnJTRW1nC83FwDh2lFtjD96GKLl3MPPGM=;
        b=bZPw0bDMmj6uTpfBuxnQNtI9v2/AK+eXj3xYZtVjkiOcnHUt5q6Gk1EDBohpSoaclY
         Vf7bvX6I9ijMCEQsYFFj+0+km20hbipoVUC0Q4pUJEWseB6Hu/tKdfMpOlo+WXUbUgio
         7yBeKcV0B3cRwHz5e5fUrtI3QTBHLkfuJdfYaXyh2OuZzOaPtI5yXQ2DiG4x+T562Brj
         1pF+yOg3XTuQZfffS+18jwLhFmEp9VxOU6IO+JGuXW41dqWawA9DB1mkWIQMf4GgD9L8
         sZBn8sl5HGJnNuZ4d6xr8JcqdIxi77wgyn+dtuAHBv0OluXD5IJKVqzE6TqysLBrcPJf
         ayXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183880; x=1769788680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M2XUvQ9fPlmnJTRW1nC83FwDh2lFtjD96GKLl3MPPGM=;
        b=dR/slPH97fwDntarkO9a58F0njwjWAcsNbq8rUnWNtGEA0bOY/xiwZaXD+Mrb81uWl
         GS3Mnma2q/yCYLJKcG71Cu746S1FYB9hVuA/bqj0bESQcrYyPVkaiZtR4q5lXSZMd/ar
         YqUHKn1ZFgw62Pffc0zYfKo0HIzDyxgsyRsFj2yb/8lIcVz92GAQyTJ4SqKvB0qRMgfd
         gixuW0yNgaGmypSLjdk9e0m7btjSdocpz9wVlJMNhF/GMuWhpOjagZzqXkkLiAARfPQ5
         XICtNMZIno3YrxEMyp2DpdCoGrD2MAv3WGYRltIPZ7F+9SP4zDmzy/iuGmt1bIVkwB1F
         5y8g==
X-Gm-Message-State: AOJu0Yzem/X46CSVP8ysWBkPhCkvrSKfoIfiIC0WORjdDR9qx6BSXJF4
	Z0QWyVlcTd4LtOH7sCj6ANgXlajSmPhcFOmeAtstlLCKNT/PhpSZCeLurnfFzCdO
X-Gm-Gg: AZuq6aLkxj+Jqan0T6Fgclg5NrXQ1J3Mz30hlQUA/uuzRLz6EmaSEHkQxShZnyu8WRc
	krGVc7m0UHyTEidu3oM+AeDkDSqUh4qfVl2ZOTiOq//KEwYf+jvs53zkUjOsEgi8MZ1vsOkKExh
	gwKuUcktwBQVWO/vLDXJbC/wKuk9AWeOoWa2LprvarLAbklMw9N3xAZbNL1KSls/lvXG/FHd5wp
	ysbxtVe1qyAnklzAJynhMRCtluDAUqkiieS1ZFzN1JIlL3LMnYywmK1tOeRCZXn6wM+nLzy/olJ
	bq5MmuwYIWD/4jiVFaYA+Eqp5SYXRe5OXULrsZbkZkIa3r+GVgm304TmqPas9JyW7ap0oQsHaIh
	e5eVsGCnOS8vUQKzjdWxJmcfQ0m8jVLvgp2wixgLF5ss0q8B0aK/sK2NErEOtfFz6OJKdrErKJP
	qefp942er9mgvI/Rx9JHGYJQgrnWmxjqpSLJxx
X-Received: by 2002:a17:90a:e7d2:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-3536700d6d2mr2748627a91.8.1769183880193;
        Fri, 23 Jan 2026 07:58:00 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:dfb6:6b31:aa17:2446])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335206b23sm5489305a91.3.2026.01.23.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:57:59 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] wifi: ath12k: Fix firmware stats leak on get_txpower error paths
Date: Fri, 23 Jan 2026 21:27:46 +0530
Message-ID: <20260123155750.6007-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123155750.6007-1-bjsaikiran@gmail.com>
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_075801_569189_B0D30DB7 
X-CRM114-Status: GOOD (  10.82  )
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

The commits bd6ec8111e65 and 2977567b244f changed firmware stats handling
to be caller-driven, requiring explicit ath12k_fw_stats_reset() calls
after using ath12k_mac_get_fw_stats().

However, in ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats()
succeeds but the pdev stats list is empty, or when the stats request
fails, the function exits via err_fallback without resetting the stats
buffer.

This causes the stats buffer to accumulate data, eventually leading to
firmware communication failures (error -71/EPROTO) during subsequent
operations, particularly during 5GHz scanning which requires additional
TX power queries.

Symptoms:
- "failed to pull fw stats: -71" errors in dmesg  - 5GHz networks not detected despite hardware support
- 2.4GHz networks work normally

Fix this by calling ath12k_fw_stats_reset() on all error paths after
ath12k_mac_get_fw_stats() is called, ensuring the stats buffer is
always freed regardless of the execution path.

Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller-driven")
Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f7a2a544bef2..4195364cb6e3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5161,6 +5161,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
 	ret = ath12k_mac_get_fw_stats(ar, &params);
 	if (ret) {
 		ath12k_warn(ab, "failed to request fw pdev stats: %d\n", ret);
+		ath12k_fw_stats_reset(ar);
 		goto err_fallback;
 	}
 
@@ -5169,6 +5170,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
 					struct ath12k_fw_stats_pdev, list);
 	if (!pdev) {
 		spin_unlock_bh(&ar->data_lock);
+		ath12k_fw_stats_reset(ar);
 		goto err_fallback;
 	}
 
-- 
2.51.0


