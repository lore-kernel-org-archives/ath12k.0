Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664EBC369B8
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJzaMCUEmfS88/pHV7S6utRVF0OcgJooEZ6khtDSVo8=; b=XWu73hZBI243WLuHqvNOsaLyun
	mnBigYsWbv86jCM4Awp4HA9yNL7zh5pyn7CES1TOO1cuoBZyVlSQ6I1eMXjxD6dTGza/0TyZEO8Yk
	32XCxQV0As/ZWfOUp11vTjxrz6aPCcjYhKH7qYRqbLA8zSXXrJLl4J6GNAnUumkLzc9ECH7PDlLIT
	ZZ5TN0nxKB5WQfBeM8a290/njml+S2+ztNQ5fTxgHo+bwhvYdTTGbGdZfmrB1K+n7KjcQFjj0RO82
	CdAYlf1evZgJUVlceZGogplkP1sTKEI0tbPInoBhAVoHrS6tQ0zznErMDEJlHN9kJtkbvrzlQC9Sk
	ZPdpakYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F9C-000000014jn-0SWr
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 08:26:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F8z-000000014Ta-1QG5;
	Mon, 14 Apr 2025 08:26:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744619174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJzaMCUEmfS88/pHV7S6utRVF0OcgJooEZ6khtDSVo8=;
	b=o1zujVLG2sQaTvMO6OACsI/499VzUxoEJUGqHj+qgv3E4KUgw4ysdGF3KRplnLfOHRVvHh
	C8sMrwd65T7vZGfCJrREE+bUEk9LL2vMgS0X0+RuJbIQeppjCp8fGV/UwnIp45VWxKazpm
	pPUUZ850J9Mwl2W2mFfVm4DBXwfC/tD/dqp1qpRBLw0A35yogM53wwW0qStrpoRhr/vxLu
	kWaPzO4nQZn6I8DkAoQHZ4cRPwtJiEENp07/CeSdtns4W9KJPsrCtCUM3iEx6YXuDwiAir
	0PyhOOCI6wQTQJQxGFU6nSJUCkG9l5cY6q/N9EpiaJdVTZ1mnhZtHJj1EeXsvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744619174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJzaMCUEmfS88/pHV7S6utRVF0OcgJooEZ6khtDSVo8=;
	b=2f0ZORhwJPNdlz9bEPHxT6ecUDp77xU2Mn7EJRnJRcfM4eIVe9A8P3Zm0rUrsQn+we0g90
	o6gNm/VzeLWiueAA==
Date: Mon, 14 Apr 2025 10:26:03 +0200
Subject: [PATCH net-next 2/7] wifi: ath11k: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250414-restricted-pointers-net-v1-2-12af0ce46cdd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744619172; l=1527;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wCL19/j4oZD9OXQEwiK4h5ZQlR+8JRFqjWaTwz3M1O0=;
 b=Mll02AJLlxEAfIM3sBZFqErnG63AQHi+l+lIgSrBUXhRrD8igpMkDkzAgCyX/kNgfweVtnVzf
 eq1XA46Yw0ZD7+inGUGlFx1MAdV8znRd+XlcYbJtcFA4dVo7Ec8CwHn
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_012617_513064_611866BC 
X-CRM114-Status: UNSURE (   9.49  )
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
 drivers/net/wireless/ath/ath11k/testmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
index 9be1cd742339c95ffa74c09bee924f4eff15134a..a9751ea2a0b73009bfb600d51c3978200ce99114 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.c
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -107,7 +107,7 @@ static int ath11k_tm_process_event(struct ath11k_base *ab, u32 cmd_id,
 	u32 pdev_id;
 
 	ath11k_dbg(ab, ATH11K_DBG_TESTMODE,
-		   "event wmi cmd_id %d ftm event msg %pK datalen %d\n",
+		   "event wmi cmd_id %d ftm event msg %p datalen %d\n",
 		   cmd_id, ftm_msg, length);
 	ath11k_dbg_dump(ab, ATH11K_DBG_TESTMODE, NULL, "", ftm_msg, length);
 	pdev_id = DP_HW2SW_MACID(ftm_msg->seg_hdr.pdev_id);

-- 
2.49.0


