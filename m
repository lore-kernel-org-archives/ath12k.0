Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE55CC369B2
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+p3ZZ8m+P6MBwg+X0cWHrVyngWhZc3MgIiUJosTjVM=; b=XLlb07dzAxW45Hj7wmaBiv94Fq
	ckMBintRB3V7oqjYVtST+pP8xxKCTGBxwAr+ScAeYnMBG5jyj8aLpnmMLh6+UaqpOcUJiLnqsj7ql
	x6ct98fG7zHD7mdDp9/MAkwz3yTWw8HP4qextsA9iybA+3E6mZDZMd5Uzvmq7eYmr6yhhZo8vM/NU
	4xoQW3dQ/19wDrYUOabnxLNTJomoaCWjdmw1jzSPDj5PjRDZB+fplWjxONTAU+qhFj6qVHqoJvGhX
	f2c8Zq/WVmnmYfvpyhGPjs1/FsSHR59RvKxFhur2nntFpYrjhBNeNxI9FUCZcn29JkeyvQHXSezex
	n/N+ZuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F9J-000000014vo-26TD
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 08:26:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F8z-000000014Te-3QyQ;
	Mon, 14 Apr 2025 08:26:23 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744619175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+p3ZZ8m+P6MBwg+X0cWHrVyngWhZc3MgIiUJosTjVM=;
	b=ofLbcum+e5ES97JZNHgUn4eizYkDbWnLe7xsM+Zdmxa5+24Dx7P2aGHM7z3O141w/4Rr+k
	WRveEv8SYrJCfpnOWdRe0Lrhgax34JsFWwZTghEZ5yEiNmWu6LJq8IoexKOIoS9JwGMj1U
	S4w3rdfc484lB0AX/t1LFVhunaQKaxEszKarS5CJczq3PXzEjlrWASNsfBbYVIl4/NbegK
	ySYcWod+zpWWxlHAn/FkiejzfE4POH5aygMEbC5tcYMs8Peb/Qj9iPW0Q1uyrh/mjAD2S0
	9q0+XyXre1y2vy0I+hqySM0tWoAVSXGqdyLIy8qXEkZlH8mWo+xn53pyczg7DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744619175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+p3ZZ8m+P6MBwg+X0cWHrVyngWhZc3MgIiUJosTjVM=;
	b=R8G1LC3nTq9auZ80K7wKWRdWZ5AzwlgcChsPmwJreInP145Kb0TjPt+6wFT5D5ZCsiLixI
	icD4Mn52YWhoOcBw==
Date: Mon, 14 Apr 2025 10:26:04 +0200
Subject: [PATCH net-next 3/7] wifi: ath12k: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250414-restricted-pointers-net-v1-3-12af0ce46cdd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744619172; l=2012;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Mog1fUxDWxYnW9KpoZ7DzBFzkRO6Ky21p9XzMNb3Vf8=;
 b=b/us2xNbwh8znqfnzh9E4Av2oMff6qZufNEzIm5QnYwVPSQtCv4hVANkyEXwMgwxfZZXMClBq
 TRKDFzK5g7kCqMlmFJDdqt8wzmcZOLvplpYQXCfNLJTM+XlGTzlWrnQ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_012618_000516_63BF14F3 
X-CRM114-Status: UNSURE (   9.68  )
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
 drivers/net/wireless/ath/ath12k/testmode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/testmode.c b/drivers/net/wireless/ath/ath12k/testmode.c
index 18d56a976dc74c4f6eab87e358c14d4faea648e2..fb6af7ccf71f44ae4bd01cde53fba3527eed0d2d 100644
--- a/drivers/net/wireless/ath/ath12k/testmode.c
+++ b/drivers/net/wireless/ath/ath12k/testmode.c
@@ -97,7 +97,7 @@ void ath12k_tm_process_event(struct ath12k_base *ab, u32 cmd_id,
 	u8 const *buf_pos;
 
 	ath12k_dbg(ab, ATH12K_DBG_TESTMODE,
-		   "testmode event wmi cmd_id %d ftm event msg %pK datalen %d\n",
+		   "testmode event wmi cmd_id %d ftm event msg %p datalen %d\n",
 		   cmd_id, ftm_msg, length);
 	ath12k_dbg_dump(ab, ATH12K_DBG_TESTMODE, NULL, "", ftm_msg, length);
 	pdev_id = DP_HW2SW_MACID(le32_to_cpu(ftm_msg->seg_hdr.pdev_id));
@@ -227,7 +227,7 @@ static int ath12k_tm_cmd_process_ftm(struct ath12k *ar, struct nlattr *tb[])
 	buf_len = nla_len(tb[ATH_TM_ATTR_DATA]);
 	cmd_id = WMI_PDEV_UTF_CMDID;
 	ath12k_dbg(ar->ab, ATH12K_DBG_TESTMODE,
-		   "testmode cmd wmi cmd_id %d buf %pK buf_len %d\n",
+		   "testmode cmd wmi cmd_id %d buf %p buf_len %d\n",
 		   cmd_id, buf, buf_len);
 	ath12k_dbg_dump(ar->ab, ATH12K_DBG_TESTMODE, NULL, "", buf, buf_len);
 	bufpos = buf;

-- 
2.49.0


