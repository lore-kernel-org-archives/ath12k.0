Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C84C369B5
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/VnYhVD1SCgZYyfaXiiv1axKyoVwiXgocwEv4oE1Ko=; b=vG+K+E65VXTo5VwxPr/jr/SJg8
	+J4Sv4yTiKoP40xQ6l5/H29u84iMg9Gpfun3P3aVpqCzlKVyzA9zyHZ7E8NoHZqtfMYf5eHlzh/NL
	+06Jtg3GhlhtKnqdst6fhZcjOaOCBh9bT74U7i7laZiBX786amvEcepzJ7hlzGqo1wJu8MFDH+lf0
	OQVIA72cf/5dY6gnzbkkja05qESnpXCmWCI7k1HrD+CqmgBKabC7nNjR5PZKnfChOSQOtKq/Ax0Nw
	1IC635bs6DWvirOQ/FcFA9oILbKqgxoKVk2bD4cUkE7no3PTohcL24uOsLVPhm6EyVZrbROmWLBjm
	+YxbGRcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F93-000000014Y6-1X0m
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 08:26:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F8y-000000014Th-46yw;
	Mon, 14 Apr 2025 08:26:18 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744619175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/VnYhVD1SCgZYyfaXiiv1axKyoVwiXgocwEv4oE1Ko=;
	b=oXHvZS2XoGF1OUDHETEpesHyXLq7OFuBkAoXwt+6oCKMZrrFFF7uAwyKIDqzJqoXyqoqMx
	YfMGx/Wq/+MNteZfIoJ/sv1izi7t6HJy44wVg2hqGx0ck5MT8UTT10/XExG98CKxAN//+G
	OusqYZlGizraLiAQZfjQ1cDm7BhQ2SwbOYT7Ir2X/9itY/sZWkuig3cgmYDSu9N5UAd2we
	4DXfe2USWh11pvXMgy16WHeMjzegIHTAOIk2/I6NBfxU/jAKvND/ARkjDKzYATCwovn5na
	lAdIxHxyggXJgXvs29oqrL2p0PIPjlmvFObHVwm+/ndrprruazh3PRaU8SKhHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744619175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/VnYhVD1SCgZYyfaXiiv1axKyoVwiXgocwEv4oE1Ko=;
	b=BW7eyc5nmNTm4BrUjTKiQcxtNBwCiX+GSkj3s651FAkykMV6ELiCFt5lY/bvAC3YEtdm8y
	c90pAWGVmstytfDg==
Date: Mon, 14 Apr 2025 10:26:05 +0200
Subject: [PATCH net-next 4/7] wifi: wcn36xx: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250414-restricted-pointers-net-v1-4-12af0ce46cdd@linutronix.de>
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
In-Reply-To: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>
Cc: ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
 linux-rdma@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744619172; l=1466;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=61F6yS3SeLiDBJeFobz+nPKysOXCT5pH1Ry4x0mEWwk=;
 b=x/NwFZLAfuFMn6Tuwkaaozs8DHU3CODeWCFL2e9Z5eSwidQOwOcFXmSdTvN9+ChrWvdguO2cn
 UysC7tAl9ggC5QE/fMdSdsC5X2A9PqW1zeBD1+dBhqDiAkkT9kN1N/c
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_012617_156594_319BEE83 
X-CRM114-Status: UNSURE (   9.69  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping looks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.
There are still a few users of %pK left, but these use it through seq_file,
for which its usage is safe.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/net/wireless/ath/wcn36xx/testmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/testmode.c b/drivers/net/wireless/ath/wcn36xx/testmode.c
index e5142c052985ddf629b93d7b9687e6ba63a48e8b..d7a2a483cbc486308032709a99bba9a52ed0ff59 100644
--- a/drivers/net/wireless/ath/wcn36xx/testmode.c
+++ b/drivers/net/wireless/ath/wcn36xx/testmode.c
@@ -56,7 +56,7 @@ static int wcn36xx_tm_cmd_ptt(struct wcn36xx *wcn, struct ieee80211_vif *vif,
 	msg = buf;
 
 	wcn36xx_dbg(WCN36XX_DBG_TESTMODE,
-		    "testmode cmd wmi msg_id 0x%04X msg_len %d buf %pK buf_len %d\n",
+		    "testmode cmd wmi msg_id 0x%04X msg_len %d buf %p buf_len %d\n",
 		   msg->msg_id, msg->msg_body_length,
 		   buf, buf_len);
 

-- 
2.49.0


