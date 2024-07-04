Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728E6C30653
	for <ath12k@archiver.kernel.org>; Thu,  4 Jul 2024 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VR08W8mi1r0CCjvsQbo7Kky/lbrfDeBjftHp2wcnS9A=; b=Vp/cEhFsWBzKD8lPt+1513xKrD
	Y/spqEjhtNv0IuXYHpEequnMTBhI17Rf9Rp8mYEyQQvvkVHyiyv+AdrIovgFQb88PnWsvqg4c3ALL
	DoOtKFwuF0u6iG/72zpny+jGieseTQ4jU0LhsIpd+21jqMf6fB2tenx5vi+mzwX7Qjm6QBYJsklqP
	9I7KInoeVUsNG+wVS9Ave7lwTMsvxnmf+DIoC4TnOva4aUK+Ogd43QAX4nLOqkLKMhZOxGEZyJceu
	LIbePyxotSHhLoX9QYT2ZmCIzrqkH7Eogbnr4sUq90fG/Ndq+X/R2S07AWWtxWAkqDPt/ZDmNUasN
	rC0bBNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNgc-0000000DYMU-0gya
	for ath12k@archiver.kernel.org;
	Thu, 04 Jul 2024 14:43:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNgZ-0000000DYKP-0AW3
	for ath12k@lists.infradead.org;
	Thu, 04 Jul 2024 14:43:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EA643CE2F8F
	for <ath12k@lists.infradead.org>; Thu,  4 Jul 2024 14:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71342C3277B;
	Thu,  4 Jul 2024 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720104224;
	bh=N4s8/6qi1oS7xwW+tUh9JmEIMhJuYSSvDJCC4R27pZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=t01v59JHn7anfObFn/MYPWZJI/OI5dDIqXq1kKUjFGvIckN34GoV9ksB4mYJYDdIk
	 9Zq1XrD9dI9k9DtWgic9hdmiiH6DdM6z9+chSMkUEWXZT7Ij/FW/jFQMOXdUddcGmI
	 s/u991P6GWjquaJNslbS8NdwdJ9P8fI9n7yHgJB2isTuCN5iw4GIVzTvzkddh9dc1e
	 5hSPQVFqCS+MNiXUklVd4a1XrjaUfmMlI0w5Dm+7KCY5OqlZArBX53V2GwMwIEoqDR
	 ZIjik7e+W8fJkhZWT6fLnywmEPH2nMJCDhH+AY51dg8v1hxPEzFZh5F7R85CEQgM7r
	 Z1sHuVHrUQU5w==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kees@kernel.org
Subject: [PATCH RFC] wifi: ath12k: workaround fortify warnings in ath12k_wow_convert_8023_to_80211()
Date: Thu,  4 Jul 2024 17:43:41 +0300
Message-Id: <20240704144341.207317-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_074347_450591_F3B2AEA3 
X-CRM114-Status: GOOD (  13.08  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Johannes reported with GCC 11.4 there's a fortify warning below. The warning is
not seen with GCC 12.1 nor 13.2. Weirdly moving the other operand of sum to the
other side the warning goes away. This is safe to do as the value of the
operand is check earlier. But the code looks worse with this so I'm not sure
what to do.

In file included from ./include/linux/string.h:374,
                 from ./include/linux/bitmap.h:13,
                 from ./include/linux/cpumask.h:13,
                 from ./include/linux/sched.h:16,
                 from ./include/linux/delay.h:23,
                 from drivers/net/wireless/ath/ath12k/wow.c:7:
drivers/net/wireless/ath/ath12k/wow.c: In function ‘ath12k_wow_convert_8023_to_80211.constprop’:
./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551611 or more bytes at offsets 0 and 0 overlaps 9223372036854775799 bytes at offset -9223372036854775804 [-Werror=restrict]
  114 | #define __underlying_memcpy     __builtin_memcpy
      |                                 ^
./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
  637 |         __underlying_##op(p, q, __fortify_size);                              |         ^~~~~~~~~~~~~
./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
  682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                        |                          ^~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/wow.c:190:25: note: in expansion of macro ‘memcpy’
  190 |                         memcpy(pat, eth_pat, eth_pat_len);
      |                         ^~~~~~
./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551605 or more bytes at offsets 0 and 0 overlaps 9223372036854775787 bytes at offset -9223372036854775798 [-Werror=restrict]
  114 | #define __underlying_memcpy     __builtin_memcpy
      |                                 ^
./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
  637 |         __underlying_##op(p, q, __fortify_size);                              |         ^~~~~~~~~~~~~
./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
  682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                        |                          ^~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/wow.c:232:25: note: in expansion of macro ‘memcpy’
  232 |                         memcpy(pat, eth_pat, eth_pat_len);
      |                         ^~~~~~

Compile tested only.

Reported-by: Johannes Berg <johannes@sipsolutions.net>
Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wow.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
index c5cba825a84a..e9588bb7561c 100644
--- a/drivers/net/wireless/ath/ath12k/wow.c
+++ b/drivers/net/wireless/ath/ath12k/wow.c
@@ -186,7 +186,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
 	if (eth_pkt_ofs < ETH_ALEN) {
 		pkt_ofs = eth_pkt_ofs + a1_ofs;
 
-		if (eth_pkt_ofs + eth_pat_len < ETH_ALEN) {
+		if (eth_pat_len < ETH_ALEN - eth_pkt_ofs) {
 			memcpy(pat, eth_pat, eth_pat_len);
 			memcpy(bytemask, eth_bytemask, eth_pat_len);
 
@@ -228,7 +228,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
 	} else if (eth_pkt_ofs < prot_ofs) {
 		pkt_ofs = eth_pkt_ofs - ETH_ALEN + a3_ofs;
 
-		if (eth_pkt_ofs + eth_pat_len < prot_ofs) {
+		if (eth_pat_len < prot_ofs - eth_pkt_ofs) {
 			memcpy(pat, eth_pat, eth_pat_len);
 			memcpy(bytemask, eth_bytemask, eth_pat_len);
 

base-commit: c1cacb01f35589bd41360cdb7535afc792c08a7c
-- 
2.39.2


