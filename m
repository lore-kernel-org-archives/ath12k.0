Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83CBCFA74C
	for <ath12k@archiver.kernel.org>; Fri,  4 Oct 2024 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mzh6kz/KWGWfNWdITdmzgk3TpZK3p7YKVC7+ZSoshW4=; b=bJjW5T61hVSRVNpootAm22sUZp
	LzdtS74cjhJF/eBBtm++EICHwM4TUYad9voK4TBL4hif7WYXqzrOET01NeUAUUlqmb0akewRGJfcW
	7UCLSb4caWRlUucpaKY0NZGTI5sXWGmCFP4WoyMxlUDGe/ZJrS/1gYqmPZP4C12ERxvtbyhyFtDgd
	jCv6R0O6Bb1/LKVwbVXRLVH/sWcgXxAotlR1DUFauReEqprGV5+V4pYHtfkljstDT3ODt4jiOQ66N
	3ZmqW+WEQwfPy59xAhAbecPkBA1ylnXAsaHlLX+RuxL3DQ5uxcCb7rmOnDsaheLSF4N5Q75w+Y2zB
	WUGIlHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swf14-0000000BjPN-2oeT
	for ath12k@archiver.kernel.org;
	Fri, 04 Oct 2024 09:54:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swf12-0000000BjOR-01wx
	for ath12k@lists.infradead.org;
	Fri, 04 Oct 2024 09:54:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 412CFA4453B;
	Fri,  4 Oct 2024 09:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E3BC4CEC6;
	Fri,  4 Oct 2024 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728035666;
	bh=GIekdLf920VjYQWuOHpXecODWknJgd0TvVRyo6zOyWg=;
	h=From:To:Cc:Subject:Date:From;
	b=pbS5LmLayz5YFv3aDX7vOrXQyUBdS7od4SGqy6tjKZ8S+S0jXLM+Gswg2DiB1IGIj
	 G0XybEDl9mWsXkTS86ZIQgZq3tU4ydLowy3nR9ZpGd03HT5uUap6mqnvpgk2+8Z+nS
	 tZbj77btt5Qu4x4x91TJJlUFlt+snn56vaNaSaHLSN0opWQ2JEcw1mAvS+zVQsZ2bA
	 kGmv3Qn73t7/mODTJe5Yo9KyDWHIntnvtDY2IYXM3RSlzJqrRr34O6Z+vNCYbh3sBW
	 gGsrpc5ocZeBwnM+XHE9EFpDnVSFMA6rLXMOKCeXrUebvHwRo4d89saTIyF6mobC9O
	 zyFaBbbZbpj3w==
From: Arnd Bergmann <arnd@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix one more memcpy size error
Date: Fri,  4 Oct 2024 09:54:13 +0000
Message-Id: <20241004095420.637091-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_025428_136584_796FFE5A 
X-CRM114-Status: GOOD (  11.01  )
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

From: Arnd Bergmann <arnd@arndb.de>

A previous patch addressed a fortified-memcpy warning on older compilers,
but there is still a warning on gcc-14 in some configurations:

In file included from include/linux/string.h:390,
                 from drivers/net/wireless/ath/ath12k/wow.c:7:
drivers/net/wireless/ath/ath12k/wow.c: In function 'ath12k_wow_convert_8023_to_80211.isra':
include/linux/fortify-string.h:114:33: error: '__builtin_memcpy' accessing 18446744073709551610 or more bytes at offsets 0 and 0 overlaps 9223372036854775797 bytes at offset -9223372036854775803 [-Werror=restrict]
include/linux/fortify-string.h:679:26: note: in expansion of macro '__fortify_memcpy_chk'
  679 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
      |                          ^~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/wow.c:199:25: note: in expansion of macro 'memcpy'
  199 |                         memcpy(pat + a3_ofs - pkt_ofs,
      |                         ^~~~~~

Address this the same way as the other two, using size_add().

Fixes: b49991d83bba ("wifi: ath12k: fix build vs old compiler")
Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath12k/wow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
index 9b8684abbe40..3624180b25b9 100644
--- a/drivers/net/wireless/ath/ath12k/wow.c
+++ b/drivers/net/wireless/ath/ath12k/wow.c
@@ -191,7 +191,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
 			memcpy(bytemask, eth_bytemask, eth_pat_len);
 
 			pat_len = eth_pat_len;
-		} else if (eth_pkt_ofs + eth_pat_len < prot_ofs) {
+		} else if (size_add(eth_pkt_ofs, eth_pat_len) < prot_ofs) {
 			memcpy(pat, eth_pat, ETH_ALEN - eth_pkt_ofs);
 			memcpy(bytemask, eth_bytemask, ETH_ALEN - eth_pkt_ofs);
 
-- 
2.39.2


