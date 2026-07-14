Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E13C44501
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QgPtgLnsf8qvRaDX9lHTjdZhI5SOrPpagXLEfKGMxTM=; b=jPHmXIK9CMhTFwhlEZTt3/5qsT
	4d9hR6WbEQ8nRXGwCr3cPIk09FQ6yFklR3mDWoYKYjzCaE6qzubvBqTTBAXxET3T6qgReBrg6OTRA
	FFLFjRXsIk/5YpyF2K2kT0pUBdoQxeaPNnrTwlOXsBv/+DkP3rEm/tNUb7NFTNuuorOroFFGW678u
	gIbxSJ5av/Z2XGeUp4AQzA2i0s0OV1HoyMb3juAwh1/OeZ11s+p8Bg4oOQ72cdcL4h61/Lwe/Jcb6
	9jIg7FNhnFcHvSP6usqtvGlMcEUL5ltYs+88v+oO59bP0GwiRPOJWQptHvanmxKnsNFJ2xMJqoxQK
	IiqFY0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYog-0000000BM6c-0KMc;
	Tue, 14 Jul 2026 08:48:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYof-0000000BM63-0IOf
	for ath12k@bombadil.infradead.org;
	Tue, 14 Jul 2026 08:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QgPtgLnsf8qvRaDX9lHTjdZhI5SOrPpagXLEfKGMxTM=; b=qaKQjvU54ltbmj+p9MqMqeLYT7
	DmablPrKcNq5HusZSbQCePFx7tI+fSumCOalkxtO8MUzM67zY7n4KXjSSXMw66hf5n0/t+lKFCvCS
	k/WIA/gUmK2rlOdFLMOtEEtaeT9DJgqWxWcTJ/1c7ZdCYNaWce1rqJjt21/3VvZ8JJNNb6i1qBuPI
	qFLWXT5aWVtaJkKtJvuHiyW7g5trKCu1FG0V27HORCq/s6v7M/Ez8B7MHTffVUKEFQuPNSVI7CvS3
	jP4k7MJtrltLPsTUkHjRkN40/p7WN3j9uPp0iv+cFvfZo9P8uJ4QJ4O8e2IoMv/Rsb3sjsQbWR1Mq
	90y8lZLg==;
Received: from smtp-67.smtpout.orange.fr ([80.12.242.67] helo=smtp.smtpout.orange.fr)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYob-0000000EbLg-0nDQ
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 08:48:35 +0000
Received: from device-97.home ([10.65.86.66])
	by smtp.orange.fr with ESMTP
	id jYfhwNkWUstezjYfhwaWtL; Tue, 14 Jul 2026 10:39:21 +0200
Received: from device-97.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id jYfgwv96VDc2NjYfgwPCKB; Tue, 14 Jul 2026 10:39:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1784018361;
	bh=QgPtgLnsf8qvRaDX9lHTjdZhI5SOrPpagXLEfKGMxTM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gRpPUzyVFJ7IN1ZMiIuiUrY4DxYS+BmXLoy+qESTd3mhCKxiBX62etJWlTQsaFFhH
	 +hlJuYlmV8LbWRbHV5zatiSSl46bkRdY1QWp71diR+/6M7TIamrLZdFZvlxqsNPU/4
	 KBESBNgoa8kWk/q0LKT75K/C6SkvUD8UGOMGiYQ89FLUfnTRS1ParEWn/7qOyVCVhG
	 +DVi92IX087ztsVo8PzQtMcLy8rWNkGWZW5zO+AH7SNs5rznJevS8kHx9IGP9C7MHt
	 +cF6N3S+ARexkpAxO+4CH+BrNP4zzKPIm+9uDENf0lhVu4mbdcTdBE6h6dxtP+O8GF
	 Vrh4lKmhoUDOg==
X-ME-Helo: device-97.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 14 Jul 2026 10:39:21 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH v2] wifi: ath12k: Constify struct ath12k_dp_arch_ops
Date: Tue, 14 Jul 2026 10:39:14 +0200
Message-ID: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_094833_310207_2124FFDD 
X-CRM114-Status: GOOD (  14.64  )
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

Changes in v2:
  - Add the missing const!   [Ping-Ke Shih]

v1: https://lore.kernel.org/all/469d732e2c6f159e1a05e89c7e417c3a10db5fdf.1784010931.git.christophe.jaillet@wanadoo.fr/
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
+static const struct ath12k_dp_arch_ops ath12k_wifi7_dp_arch_ops = {
 	.service_srng = ath12k_wifi7_dp_service_srng,
 	.tx_get_vdev_bank_config = ath12k_wifi7_dp_tx_get_vdev_bank_config,
 	.reo_cmd_send = ath12k_wifi7_dp_reo_cmd_send,
-- 
2.55.0


