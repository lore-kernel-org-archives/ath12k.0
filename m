Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E186FEB4917
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrz4g1phh87EGonmqHIlMvyC8hpNoCLcKt+puwxL+DI=; b=lkq9P8Ddng0AKfBm/FB0QO/oc8
	keCa9Wt8o5erduoz8sVAYSKO73BF8Cd9rFUoYxQ4Y4iGAQLRAEc52Fh3PVbbnTQevyqKT4q+5UXIK
	Gbmb7JQnuU42ubb1H6C0Os1b3Z+mvKSB3s/D8Y+XDleL0RxxZJ9It0r+UEItnao6vRF2PA+jgPI6h
	stX0Oh15V491Rcx8staPtOBVz3cevV8G5dv5K1gc38W0P7VacwgGODS/5HfhoGbtLpmRrZeivkOEi
	YvoNV03SBIl9nTlw7FpWQ/psvCN4GGltTwobQNjgrMQbzQ5wWCJ5LSU4O9Pr/KoQmOe2S1XrCdj4N
	myy/jGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVeH-000000024VA-2nX3;
	Thu, 12 Feb 2026 12:18:21 +0000
Received: from forward103a.mail.yandex.net ([178.154.239.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVeE-000000024T4-1C3G
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 12:18:20 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id A7CB380BFE;
	Thu, 12 Feb 2026 15:18:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id pHTFRX8GA8c0-aRdntUwY;
	Thu, 12 Feb 2026 15:18:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1770898691; bh=jrz4g1phh87EGonmqHIlMvyC8hpNoCLcKt+puwxL+DI=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=DODzoQRID1zaSfJjJi1VYb2/uQrmgOAN6zh5ELqXJnft6rpu1/eslJqrUbhGBRdDD
	 tWVYxRzhVkmMydciWoffGJNP0Ssj+Ncf0IltWtUgwrbVAw6Uw1H6x7XWKucwogx0Pc
	 AYt8o/W2vhDbAltMQQDzGvpL/UrMHMKAaGruh3ck=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: m.limarencko@yandex.ru
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Limarenko <m.limarencko@yandex.ru>
Subject: [PATCH ath-next v2 1/4] wifi: ath12k: return error when survey frequency is not found
Date: Thu, 12 Feb 2026 15:17:43 +0300
Message-ID: <20260212121746.329619-2-m.limarencko@yandex.ru>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212121746.329619-1-m.limarencko@yandex.ru>
References: <20260212121746.329619-1-m.limarencko@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_041818_492897_4E5A3C82 
X-CRM114-Status: GOOD (  11.50  )
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

From: Mikhail Limarenko <m.limarencko@yandex.ru>

freq_to_idx() currently returns a trailing synthetic index when the
requested channel frequency is not found.

chan-info handlers already bound-check survey index, but an explicit
error on no-match keeps semantics clear and avoids propagating a fake
index value.

Keep matched-frequency index progression unchanged, return -ENOENT on
no match, and make callers reject negative indexes.

Tested-on: QCNFA765 (WCN785x), kernel 6.18.5+deb13-amd64
Signed-off-by: Mikhail Limarenko <m.limarencko@yandex.ru>
---
v2:
- drop out-of-bounds claim from commit message
- keep original index progression for matched frequencies
- return explicit -ENOENT on no-match and reject negative idx in callers

 drivers/net/wireless/ath/ath12k/wmi.c | 9 +++------
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index e647b84..a2f8a7c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6528,12 +6528,11 @@ static int freq_to_idx(struct ath12k *ar, int freq)
 				continue;
 
 			if (sband->channels[ch].center_freq == freq)
-				goto exit;
+				return idx;
 		}
 	}
 
-exit:
-	return idx;
+	return -ENOENT;
 }
 
 static int ath12k_pull_chan_info_ev(struct ath12k_base *ab, struct sk_buff *skb,
@@ -7475,7 +7474,7 @@ static void ath12k_chan_info_event(struct ath12k_base *ab, struct sk_buff *skb)
 	}
 
 	idx = freq_to_idx(ar, le32_to_cpu(ch_info_ev.freq));
-	if (idx >= ARRAY_SIZE(ar->survey)) {
+	if (idx < 0 || idx >= ARRAY_SIZE(ar->survey)) {
 		ath12k_warn(ab, "chan info: invalid frequency %d (idx %d out of bounds)\n",
 			    ch_info_ev.freq, idx);
 		goto exit;
@@ -7550,7 +7549,7 @@ ath12k_pdev_bss_chan_info_event(struct ath12k_base *ab, struct sk_buff *skb)
 
 	spin_lock_bh(&ar->data_lock);
 	idx = freq_to_idx(ar, le32_to_cpu(bss_ch_info_ev.freq));
-	if (idx >= ARRAY_SIZE(ar->survey)) {
+	if (idx < 0 || idx >= ARRAY_SIZE(ar->survey)) {
 		ath12k_warn(ab, "bss chan info: invalid frequency %d (idx %d out of bounds)\n",
 			    bss_ch_info_ev.freq, idx);
 		goto exit;
-- 
2.47.3

