Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F4EB4913
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58gkicXTfl/yMiEWBrqSzSMvFG/0h6/5ysLXoi5qXWA=; b=hNKHNpWNmRjX9pzwDItZxMQDDL
	5pgWwEsP35c4HRexqeJKPCIErMWbSaawQRsJr6UJhGXMRRwpT0Kg7rrs80iBL4XgYXxP8D7aRIJWt
	5BPOOiUAevW9Rtu6pr4ZSbPqGhFyJscEfAb/QpuS36nC/nfty4BuvHTXhQ/k0OvdQKO3qMzAKH5hr
	uNzgFEhd7YrgG+rPqAZM3p6Lp2ZypeVvgJfeJc3bg+cZPDtQcUnggC3yLGKK3CUOiqOlgYfya0218
	NJP+SzdD9B7MD6ARP/a5O9pkQKN0A5Rk/b2CrXfbezmrVwjSIhi3/cKhYYlTEsWmvU4JM5gFVm51m
	xM0dlvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVeH-000000024Uh-0VWc;
	Thu, 12 Feb 2026 12:18:21 +0000
Received: from forward103b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVeD-000000024Su-0UAf
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 12:18:19 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id 4D0A2C007E;
	Thu, 12 Feb 2026 15:18:12 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id pHTFRX8GA8c0-h1HwsZxp;
	Thu, 12 Feb 2026 15:18:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1770898691; bh=58gkicXTfl/yMiEWBrqSzSMvFG/0h6/5ysLXoi5qXWA=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=TvdTRXAcO1PmjczGP7Wx2IZiO19UB5rrORIqm4Pj7yOEebGnKLSKWB+kfDVW805zL
	 39Dbm/LjkpDPqhQCoqGNHudwaGf/LB5MeBoIS3akIBO/tmBFJ5MwLLqvJTyLnd6Oji
	 MICvpjVlq67xpkxZoCswzQqstZjSi7ZYPEkNf9pc=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: m.limarencko@yandex.ru
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Limarenko <m.limarencko@yandex.ru>
Subject: [PATCH ath-next v2 2/4] wifi: ath12k: avoid long fw_stats waits on vdev stats hot path
Date: Thu, 12 Feb 2026 15:17:44 +0300
Message-ID: <20260212121746.329619-3-m.limarencko@yandex.ru>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212121746.329619-1-m.limarencko@yandex.ru>
References: <20260212121746.329619-1-m.limarencko@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_041817_903539_4D17D6A1 
X-CRM114-Status: GOOD (  11.18  )
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

Station info requests can trigger frequent VDEV stat pulls from

user space (iw/NM polling).

On affected firmware, waiting 3 seconds for fw_stats_done causes

repeated stalls and visible hitches.

Use a short timeout for VDEV_STAT requests and skip unnecessary

waits for stats types that do not need completion

synchronization.

Tested-on: QCNFA765 (WCN785x), kernel 6.18.5+deb13-amd64
Signed-off-by: Mikhail Limarenko <m.limarencko@yandex.ru>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 095b49a..1b550e9 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4829,6 +4829,7 @@ int ath12k_mac_get_fw_stats(struct ath12k *ar,
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
+	unsigned long done_timeout = 3 * HZ;
 	unsigned long time_left;
 	int ret;
 
@@ -4859,15 +4860,32 @@ int ath12k_mac_get_fw_stats(struct ath12k *ar,
 		return -ETIMEDOUT;
 	}
 
+	/* VDEV stats are queried frequently from station info paths (e.g. iw/NM).
+	 * On buggy firmware this path can timeout repeatedly and block callers for
+	 * multiple seconds; keep the hot path responsive while preserving behavior
+	 * for other stats types.
+	 */
+	if (param->stats_id & WMI_REQUEST_VDEV_STAT)
+		done_timeout = msecs_to_jiffies(200);
+
+	/* Non-vdev/bcn stats are handled in a single event. */
+	if (!(param->stats_id & (WMI_REQUEST_VDEV_STAT | WMI_REQUEST_BCN_STAT)))
+		return 0;
+
 	/* Firmware sends WMI_UPDATE_STATS_EVENTID back-to-back
 	 * when stats data buffer limit is reached. fw_stats_complete
 	 * is completed once host receives first event from firmware, but
 	 * still there could be more events following. Below is to wait
 	 * until firmware completes sending all the events.
 	 */
-	time_left = wait_for_completion_timeout(&ar->fw_stats_done, 3 * HZ);
+	time_left = wait_for_completion_timeout(&ar->fw_stats_done, done_timeout);
 	if (!time_left) {
-		ath12k_warn(ab, "time out while waiting for fw stats done\n");
+		if (param->stats_id & WMI_REQUEST_VDEV_STAT)
+			ath12k_dbg(ab, ATH12K_DBG_WMI,
+				   "time out while waiting for fw stats done (stats_id 0x%x)\n",
+				   param->stats_id);
+		else
+			ath12k_warn(ab, "time out while waiting for fw stats done\n");
 		return -ETIMEDOUT;
 	}
 
-- 
2.47.3


