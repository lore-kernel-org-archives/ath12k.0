Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAB3C43458
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 20:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s7dq0hK5vSS4LjpG7VM2pGMjoaS2RCGYKJDzNBOXpDc=; b=1qIP6HQ39uLjhrdTG4J73VW8fy
	CVpwxlNp6GxfbAD+JRn9GRYGfXNq4bmnODHExkFSjqhq53mvoEo6qnhKcTX2IM2fe0R1SEoDBv2G+
	F02uMVB+TezSojygx7sqy4+gM7SvC89/41aCg0utZoSdaGkyrH0nsyzNv2FCm3G3hy3ifwqiMb5mJ
	GZMDJIW54tY59stGvueNEkvQJksNH9fQq1JxWi9K6N+2FZ6FnyXwHbkm767TWF3LggA7mctgO2caf
	uo2269PGk9X24il001lyk6B+DHmcpOC6RksQq5dq2rcKlu5pirraA+ttO3DDs+UtYGTuHS4cQ5TPn
	Rm6r/S1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjk6c-0000000DGdh-46Ac;
	Tue, 14 Jul 2026 20:51:54 +0000
Received: from smtp-14.smtpout.orange.fr ([80.12.242.14] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjk6Y-0000000DGcj-1Gxy
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 20:51:53 +0000
Received: from device-97.home ([10.64.95.101])
	by smtp.orange.fr with ESMTP
	id jWkRwAKm5rl80jWkRwUkJ9; Tue, 14 Jul 2026 08:36:07 +0200
Received: from device-97.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id jWkPwSgdjLgO9jWkQwhwg5; Tue, 14 Jul 2026 08:36:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1784010967;
	bh=s7dq0hK5vSS4LjpG7VM2pGMjoaS2RCGYKJDzNBOXpDc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Mshau6pMTQgZcvDkQ7CxS77/E5zwAMEQjfMF1vuWNtuVylovOSJaAHBN73A0O3ulU
	 ideZXz63XUnNFMhZqBtLnQe1Z3lxThYWf1CXSLLrYVd7P+WxuYDHCYKmhzIsWU20He
	 DIW03Smj5SM4BQPduJjDQW0R44XV0NcSVrKA0j+FZXde9JrZy9w+tZXG7QbAHS/vGC
	 EtCu4Yc90kgo9GH7Ot92H3Ccrdo0AXcZV83W03MuHjqaOxNwkDW8w4hWUCq1GJq+Rz
	 yXSNI1lEu7wWsct0HBXW3vghmfKnIFHrQkLN4W7bFBhWGXUGNldY/QRacsCEWKEjLM
	 SDa3MeCHTnbEw==
X-ME-Helo: device-97.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 14 Jul 2026 08:36:07 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH] wifi: ath12k: Constify struct ath12k_dp_arch_ops
Date: Tue, 14 Jul 2026 08:35:56 +0200
Message-ID: <469d732e2c6f159e1a05e89c7e417c3a10db5fdf.1784010931.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135150_779645_4EF19EF6 
X-CRM114-Status: GOOD (  12.87  )
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

'struct ath12k_dp_arch_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   6318	   3384	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   6478	   3224	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/net/wireless/ath/ath12k/dp.h       | 2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 64f79e43341e..a94bbc337df4 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -538,7 +538,7 @@ struct ath12k_dp {
 	/* Lock for protection of peers and rhead_peer_addr */
 	spinlock_t dp_lock;
 
-	struct ath12k_dp_arch_ops *ops;
+	const struct ath12k_dp_arch_ops *ops;
 
 	/* Linked list of struct ath12k_dp_link_peer */
 	struct list_head peers;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.c b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
index c72f604661ce..01a45f428990 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
@@ -139,7 +139,7 @@ static int ath12k_wifi7_dp_service_srng(struct ath12k_dp *dp,
 	return tot_work_done;
 }
 
-static struct ath12k_dp_arch_ops ath12k_wifi7_dp_arch_ops = {
+static  struct ath12k_dp_arch_ops ath12k_wifi7_dp_arch_ops = {
 	.service_srng = ath12k_wifi7_dp_service_srng,
 	.tx_get_vdev_bank_config = ath12k_wifi7_dp_tx_get_vdev_bank_config,
 	.reo_cmd_send = ath12k_wifi7_dp_reo_cmd_send,
-- 
2.55.0


