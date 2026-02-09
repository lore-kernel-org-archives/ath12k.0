Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07118EF0704
	for <ath12k@archiver.kernel.org>; Mon,  9 Feb 2026 03:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RQwyoKmfRyBBXSU6RgQl8En3RjfT4P9NFlE8zO5JL0=; b=kCjf8fEkPmiajPc74tRyfT3zuA
	Y2O7B5+W/gJxwWAIxh0CVggUzmHI8GsrIXFL6odPHF96EbCvQPRSI+VetHXSghjukwhq6l/rbC/KM
	PeME6QI2WetkKPfu2qg0RArzGTNVHMUreP0QcAXATXSsbWKLgTQ3LWVH1jA87N9hnV1k3gVzR91rA
	BhMl1DemgTDzcPx81/K2kNQusif94TMs+7xyOC1bDuMsfKrzB8eyGHefvyoCTP+bkhtKBEXUnGjsa
	weUT2irt6JOFQ17mQRHhi0cpOTPfg4HIPxOG4i9KODCFiJwXOnTH3bDDagIEn3+KM8Qv2gtXe+cY5
	D+C0UPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHYN-0000000EkAW-36Wn;
	Mon, 09 Feb 2026 03:03:11 +0000
Received: from forward100d.mail.yandex.net ([2a02:6b8:c41:1300:1:45:d181:d100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHYJ-0000000Ek87-19N9
	for ath12k@lists.infradead.org;
	Mon, 09 Feb 2026 03:03:10 +0000
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:190d:0:640:bab5:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id E2C82C005B;
	Mon, 09 Feb 2026 06:02:56 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id s2H8uoNGO0U0-duZv1Cca;
	Mon, 09 Feb 2026 06:02:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1770606176; bh=+RQwyoKmfRyBBXSU6RgQl8En3RjfT4P9NFlE8zO5JL0=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=LqtkhmxFJf95LWbUkQIgbDTbPu1pziIZ8zwzLm/2yLF+cG1MNEOoqlMRlsp6AJEKS
	 NoGkb1JqZgdcHk5f8UNPqZTicLbfuW74g1uPH4gPvwkwlCNdJuE7GPLcPsBkB6upmL
	 IfU53r7FbweOKWTVh59uiC6Qwrl8W06x0yaK8KZ4=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: m.limarencko@yandex.ru
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Limarenko <m.limarencko@yandex.ru>
Subject: [PATCH ath-next 1/4] wifi: ath12k: validate survey index when frequency is not found
Date: Mon,  9 Feb 2026 06:02:40 +0300
Message-ID: <20260209030243.1530075-2-m.limarencko@yandex.ru>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260209030243.1530075-1-m.limarencko@yandex.ru>
References: <20260209030243.1530075-1-m.limarencko@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_190307_588449_BF13FE1E 
X-CRM114-Status: GOOD (  11.32  )
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

freq_to_idx() currently returns a monotonic index even when the

frequency was never matched.

In chan info paths this can lead to out-of-bounds survey indexing

for unexpected frequency events.

Return -EINVAL on no match and make callers reject negative

indexes.

Tested-on: QCNFA765 (WCN785x), kernel 6.18.5+deb13-amd64
Signed-off-by: Mikhail Limarenko <m.limarencko@yandex.ru>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index e647b84..422e3f8 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6520,7 +6520,7 @@ static int freq_to_idx(struct ath12k *ar, int freq)
 		if (!sband)
 			continue;
 
-		for (ch = 0; ch < sband->n_channels; ch++, idx++) {
+		for (ch = 0; ch < sband->n_channels; ch++) {
 			if (sband->channels[ch].center_freq <
 			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
 			    sband->channels[ch].center_freq >
@@ -6528,12 +6528,13 @@ static int freq_to_idx(struct ath12k *ar, int freq)
 				continue;
 
 			if (sband->channels[ch].center_freq == freq)
-				goto exit;
+				return idx;
+
+			idx++;
 		}
 	}
 
-exit:
-	return idx;
+	return -EINVAL;
 }
 
 static int ath12k_pull_chan_info_ev(struct ath12k_base *ab, struct sk_buff *skb,
@@ -7475,7 +7476,7 @@ static void ath12k_chan_info_event(struct ath12k_base *ab, struct sk_buff *skb)
 	}
 
 	idx = freq_to_idx(ar, le32_to_cpu(ch_info_ev.freq));
-	if (idx >= ARRAY_SIZE(ar->survey)) {
+	if (idx < 0 || idx >= ARRAY_SIZE(ar->survey)) {
 		ath12k_warn(ab, "chan info: invalid frequency %d (idx %d out of bounds)\n",
 			    ch_info_ev.freq, idx);
 		goto exit;
@@ -7550,7 +7551,7 @@ ath12k_pdev_bss_chan_info_event(struct ath12k_base *ab, struct sk_buff *skb)
 
 	spin_lock_bh(&ar->data_lock);
 	idx = freq_to_idx(ar, le32_to_cpu(bss_ch_info_ev.freq));
-	if (idx >= ARRAY_SIZE(ar->survey)) {
+	if (idx < 0 || idx >= ARRAY_SIZE(ar->survey)) {
 		ath12k_warn(ab, "bss chan info: invalid frequency %d (idx %d out of bounds)\n",
 			    bss_ch_info_ev.freq, idx);
 		goto exit;
-- 
2.47.3


