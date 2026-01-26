Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6133CF65CB
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 09:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnaMaj6mLos6uYLWyXnb0MsnII4/SswrIv2Xu8MbfD0=; b=Ea3L+2ccNwXAZ4qn4oFaUEl3Dc
	xO4T54RkcZeyFxeT8WmWmyEq+nUdF08s+o4+8mVBMz0yjywASc+OEocHpnhlzod2UH9T3R1419PL5
	ZDvRymm6Iu6Fk96i4mrdIWdbTvBd2rt7zv88h/ZkK1QyOrg2v+oVCdYHpAO6auUaKpDNdtjxWYeKm
	vVRAq89BYNQAQ+DewAjyXWfteZxKG3aCPih5eZDhwppGd8aPbaHqSQB7hF5WpW6cyN7GDX3rbBy3/
	Pt/pvhVi4DYAh8gvQJUSS/OtoO0a9pWmrY2PCA7M0ld76CW1vrA5lx6FRPqNjUrCcZN8wGIExJC+6
	xXHvOJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJHN-0000000CEhP-2Lee;
	Mon, 26 Jan 2026 09:53:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJHK-0000000CEfp-1Fxi
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 09:53:03 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-34c3259da34so2441670a91.2
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 01:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769421181; x=1770025981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnaMaj6mLos6uYLWyXnb0MsnII4/SswrIv2Xu8MbfD0=;
        b=BFCM+vDskTsFhE4EdiQvcp+pU3u1/WpuvhEC25LN3T21Q0EsmOoMzr5leau9s0oZhM
         +2Vc4U9OT6BM0spfx1e6dm/700cEE5TroacdO35QphD8cv/kablKp1NG2NsTtCJcNz2p
         RA/gGd0FlVvTqgzxZ50/pUt3DAJYp2u29sEtE5xO78LJHz2UXoIBcHnR4AjxUWb07P4Z
         qzOCo40zoDZ3ZMnCZdfBw0Io/hu+u4GYGBzdqxIz+3WIXGCF3wkOdVRkQj8HvTBXeAql
         VT2ZIRNvMyFcUwgYYGF9Ecym6RylTw+la9KwSc6/hwYpNFOJJPMvs9bzt1eeyK8i2Bye
         lfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421181; x=1770025981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnaMaj6mLos6uYLWyXnb0MsnII4/SswrIv2Xu8MbfD0=;
        b=IqYO1QSVwpvr14HaFjlIoZbst4URURIHjw7pNDn/9qSoV278QmxGT/sZsoDpQ+SGJZ
         lIBevnG1GosErgzZ/yDsQqmzA8fsgOaDddX4ySUEinVzRUO4ldVS7ETnsIvncN91YnyY
         mno0XujMG4Yu627af2sGk2RYtAY9wMvV14slhyDjKrg9dd5X9c7PP4ZZMqVUFvEqO6t/
         T6V5GRmyERHJcR+w2lFCpBuoxLaFHqPHnqoZA65gxFxqAShh95veNT5OkGes/2iB7G+5
         CQpJ29gWV6L5lpnu2DAxOd71QEnelq9vGVg8r6OyCQqEPs/KTUoUdE+bHerYgRdDeZQc
         KXnA==
X-Gm-Message-State: AOJu0Yz20VnOho206ntYffOAjO2H+76RrlqhX0NEPGquIS7gjVcaucV/
	05NRQ78EGAp9w/UUWFPlNq96DH6Nisl6DGIe1p0SBMEg4pddo2yE45WYlDclDaqi
X-Gm-Gg: AZuq6aK4otPqXTKyPWo5J1oTKpucgmHD5fwyKHINHkctdcCJOeQ3Xq8OlbCkpkJ+YIc
	v5TetZrNXJl9T24+iWX3SAGqTIJLJLVYkrlaABPrApGY8+d5aD1Zg4MU9V04ato8clx1h4wheRB
	aTENoqxZqe2MEI97ZXJzTEoKeOTIO0CkkUfBjKoOH6LKOaa+Cskaf09R4c5Ewmhx8SCz8E94Uzc
	AcWPwXdRNfAg+b6lD0Qq/Y6FO2QM0MtztMdezPkmBfI/C85JIBxZW1CJ5TVF1vkz606cM4xqsh2
	U7NUDi3TTGW/txyr9uhfs8YW0xq5e5YsNi+IyMp9DXymlApsXXzyJEnDprI4WYmLhrF+Vf0v7ns
	VdA/YvSWO+gpXCUXKZU2fe2ZeB1dljmQDPAdgI4WmI4AriZCI89vX3ZuXmcAFO6yd5lT3LA8OOm
	pxIY7M5ElijsPCxIuN4rIOrUw+nLYxM0+1ZyHB
X-Received: by 2002:a17:90b:2fd0:b0:32e:3c57:8a9e with SMTP id 98e67ed59e1d1-353c41a6f3dmr3587832a91.35.1769421181044;
        Mon, 26 Jan 2026 01:53:01 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1d59:cd47:36b6:dec7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536f359950sm3187627a91.10.2026.01.26.01.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 01:53:00 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev list is empty
Date: Mon, 26 Jan 2026 15:22:44 +0530
Message-ID: <20260126095244.113301-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126095244.113301-1-bjsaikiran@gmail.com>
References: <20260126095244.113301-1-bjsaikiran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_015302_340538_4EC5F176 
X-CRM114-Status: GOOD (  11.16  )
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

In ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats() succeeds
but the pdev stats list is empty, the function exits without calling
ath12k_fw_stats_reset(). Even though the pdev list is empty, the firmware
may have populated other stats lists (vdevs, beacons, etc.) in the
ar->fw_stats structure.

Without resetting the stats buffer, this data accumulates across multiple
calls, eventually causing the stats buffer to overflow and leading to
firmware communication failures (error -71/EPROTO) during subsequent
operations.

The issue manifests during 5GHz scanning which triggers multiple TX power
queries. Symptoms include:
- "failed to pull fw stats: -71" errors in dmesg
- 5GHz networks not detected despite hardware support
- 2.4GHz networks work normally

Fix by calling ath12k_fw_stats_reset() when the pdev list is empty,
ensuring the stats buffer is properly cleaned up even when only partial
stats data is received from firmware.

Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller-driven")
Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e0e49f782bf8..6e35c3ee9864 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5169,6 +5169,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
 					struct ath12k_fw_stats_pdev, list);
 	if (!pdev) {
 		spin_unlock_bh(&ar->data_lock);
+		ath12k_fw_stats_reset(ar);
 		goto err_fallback;
 	}
 
-- 
2.51.0


