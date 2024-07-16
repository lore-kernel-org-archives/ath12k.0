Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F9FC3DA59
	for <ath12k@archiver.kernel.org>; Tue, 16 Jul 2024 11:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hvvnj1XLuLsMaLUuoqgaQm4hXgNbSPKG0xi9JLjL1II=; b=ZBHe4Krm/AV4w77rCyW0xIPPrk
	Anf1xRuVdfziLs5iAETk5NvegGa9uq9pgjGtPaNrI1bIjTHm8mFy42nhDphUyvKSe7YcB5I+1rv9E
	Cb1q5rNmOvR+Kxy6QHMasKWm4uXYI7PR4a9LxWrATcK82xktde4wC4AdBdsy7gEWgyBg/2Vl96h51
	+NURRH8jxzY20qI+QcnB9sCGef0p23nQXfhtJayUsNXcxJTwpagE0NqPbw4fFciUdciBiXHdfv9nV
	abOmpf33aKoD7FzKgA89i9dh0I8vb8j4tS5iU6F2jFIA9kmfI9jOVsTJPsl404QEwBGZW4QNmb/O1
	DQZdot7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTg1t-0000000A8gb-0jrS
	for ath12k@archiver.kernel.org;
	Tue, 16 Jul 2024 11:07:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTg1q-0000000A8fo-0RAR
	for ath12k@lists.infradead.org;
	Tue, 16 Jul 2024 11:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721128047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hvvnj1XLuLsMaLUuoqgaQm4hXgNbSPKG0xi9JLjL1II=;
	b=gzqVIB874ZFJ2dVy9ba0a3pTYnBGiMYm/VELiuxpeyWdTwj9BUrgpOOWf5WPzACvG7vgui
	t3crXIjHiECOcc0EjpnMaKLz2uh8JE70mYhkfdYFGhsIUdJu6jfKyVg1PdfFZjOtyeSg/h
	iq75jXuif/ohAREWbGPZPPcUpG5FdK0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-njBfylUNN9GjlMHzilKnrg-1; Tue,
 16 Jul 2024 07:07:23 -0400
X-MC-Unique: njBfylUNN9GjlMHzilKnrg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 657B01955BF2;
	Tue, 16 Jul 2024 11:07:20 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.225.70])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ACA591955D47;
	Tue, 16 Jul 2024 11:07:16 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: netdev@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH net] wifi: ath12k: fix build vs old compiler
Date: Tue, 16 Jul 2024 13:06:39 +0200
Message-ID: <3175f87d7227e395b330fd88fb840c1645084ea7.1721127979.git.pabeni@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_040730_240226_4516FBBF 
X-CRM114-Status: GOOD (  12.00  )
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

gcc 11.4.1-3 warns about memcpy() with overlapping pointers:

drivers/net/wireless/ath/ath12k/wow.c: In function ‘ath12k_wow_convert_8023_to_80211.constprop’:
./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551611 or more bytes at offsets 0 and 0 overlaps 9223372036854775799 bytes at offset -9223372036854775804 [-Werror=restrict]
  114 | #define __underlying_memcpy     __builtin_memcpy
      |                                 ^
./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
  637 |         __underlying_##op(p, q, __fortify_size);                        \
      |         ^~~~~~~~~~~~~
./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
  682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
      |                          ^~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/wow.c:190:25: note: in expansion of macro ‘memcpy’
  190 |                         memcpy(pat, eth_pat, eth_pat_len);
      |                         ^~~~~~
./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551605 or more bytes at offsets 0 and 0 overlaps 9223372036854775787 bytes at offset -9223372036854775798 [-Werror=restrict]
  114 | #define __underlying_memcpy     __builtin_memcpy
      |                                 ^
./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
  637 |         __underlying_##op(p, q, __fortify_size);                        \
      |         ^~~~~~~~~~~~~
./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
  682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
      |                          ^~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/wow.c:232:25: note: in expansion of macro ‘memcpy’
  232 |                         memcpy(pat, eth_pat, eth_pat_len);
      |                         ^~~~~~

The sum of size_t operands can overflow SIZE_MAX, triggering the
warning.
Address the issue using the suitable helper.

Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
Only built tested. Sending directly to net to reduce the RTT, but no
objections to go through the WiFi tree first
---
 drivers/net/wireless/ath/ath12k/wow.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
index c5cba825a84a..bead19db2c9a 100644
--- a/drivers/net/wireless/ath/ath12k/wow.c
+++ b/drivers/net/wireless/ath/ath12k/wow.c
@@ -186,7 +186,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
 	if (eth_pkt_ofs < ETH_ALEN) {
 		pkt_ofs = eth_pkt_ofs + a1_ofs;
 
-		if (eth_pkt_ofs + eth_pat_len < ETH_ALEN) {
+		if (size_add(eth_pkt_ofs, eth_pat_len) < ETH_ALEN) {
 			memcpy(pat, eth_pat, eth_pat_len);
 			memcpy(bytemask, eth_bytemask, eth_pat_len);
 
@@ -228,7 +228,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
 	} else if (eth_pkt_ofs < prot_ofs) {
 		pkt_ofs = eth_pkt_ofs - ETH_ALEN + a3_ofs;
 
-		if (eth_pkt_ofs + eth_pat_len < prot_ofs) {
+		if (size_add(eth_pkt_ofs, eth_pat_len) < prot_ofs) {
 			memcpy(pat, eth_pat, eth_pat_len);
 			memcpy(bytemask, eth_bytemask, eth_pat_len);
 
-- 
2.45.2


