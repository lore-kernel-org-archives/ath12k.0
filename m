Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45059C61DA4
	for <ath12k@archiver.kernel.org>; Wed, 15 Feb 2023 01:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x9OEn8tlIRbjMv8cmq8rI5Wq+tUS7hY9wnI1RHCVRsU=; b=kQthw0TN6k0wjA
	g3xaYdE5NNYk91lYKU/Chl1NlQ86KTtoBjhe4gJaT1WnLi5NvG1Vj4ha3vPe1hMyupmiU4dRyj0dT
	uRcrDlyxHXu1MRxmQcCy4L1rrOs90OQbE/D0EbFr++rpQldNHDir3n5c5eaHRnUrgvWxVXF/cAH9U
	NekoRyXF9bjBxlRPu5UH2xV+YQh51epYbVpMcx1GXNO4GhJiHh8Fylsl5ILZnkqnrExAeYUk6kRks
	Nr8HzfcKxRuH5xQa78NzzxNiL28Ce/J2sdmWydIJGPC+7agXhPjuMu/vG2yEi2psRrSMAp+/svgqm
	FX1GNV5WGjBuLW4A3Y6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6O2-004C5j-MM
	for ath12k@archiver.kernel.org; Wed, 15 Feb 2023 01:15:06 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6Nz-004C2r-OM
	for ath12k@lists.infradead.org; Wed, 15 Feb 2023 01:15:05 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R921e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VbhhwbR_1676423695;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VbhhwbR_1676423695)
          by smtp.aliyun-inc.com;
          Wed, 15 Feb 2023 09:14:56 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	kvalo@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] wifi: ath12k: dp_mon: Fix unsigned comparison with less than zero
Date: Wed, 15 Feb 2023 09:14:53 +0800
Message-Id: <20230215011453.73466-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_171503_976560_3E87B85F 
X-CRM114-Status: UNSURE (   6.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

The return value from the call to idr_alloc() is int.
However, the return value is being assigned to an unsigned
int variable 'buf_id', so making 'buf_id' an int.

Eliminate the following warning:
./drivers/net/wireless/ath/ath12k/dp_mon.c:1300:15-21: WARNING: Unsigned expression compared with zero: buf_id < 0

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4060
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index a214797c96a2..8b3f0769dd58 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1268,7 +1268,8 @@ int ath12k_dp_mon_buf_replenish(struct ath12k_base *ab,
 	struct sk_buff *skb;
 	struct hal_srng *srng;
 	dma_addr_t paddr;
-	u32 cookie, buf_id;
+	u32 cookie;
+	int buf_id;
 
 	srng = &ab->hal.srng_list[buf_ring->refill_buf_ring.ring_id];
 	spin_lock_bh(&srng->lock);
-- 
2.20.1.7.g153144c


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
