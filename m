Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA1BEF06EF
	for <ath12k@archiver.kernel.org>; Mon,  9 Feb 2026 03:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QNjMDvA4GT5+5r95oykDTLOoWhHZCwrCD9d6iDvQ+PY=; b=YR6HuH45wXaJ+DAwRebjOctJq5
	6tH//m6e4dd6lUbtolALKE9ltgmsgn6QXI3ytkFiodjT5xkuhB3EKM9S+3+Bfgf2JPhnRR5KoSbdj
	Pr/RidvmFrviyMjTyAC7DIP08a2LXpq/EwlwyQFnQzapoWTTICSD3gFCMnRU6l93Jm/YY5pMV3nv2
	Tf26QztVQ8AT7IYgX5BlIxkTPN53hRfWR/t04oxTXNLMJrzU69BIBTWscXBFUZQ0J9U+d2+Z3uk1C
	5/roczj3sc9NnKjlO0gJtgCKQ45v3kb+u1P5yp48bLPdae4/NXknncvaaQLPsVDSxkHtP0SpgV4IX
	BdhHRo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHYN-0000000EkAH-1Hlr;
	Mon, 09 Feb 2026 03:03:11 +0000
Received: from forward100b.mail.yandex.net ([178.154.239.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHYJ-0000000Ek8A-1CnK
	for ath12k@lists.infradead.org;
	Mon, 09 Feb 2026 03:03:09 +0000
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:190d:0:640:bab5:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 4B884806BC;
	Mon, 09 Feb 2026 06:02:56 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id s2H8uoNGO0U0-ERonRnP4;
	Mon, 09 Feb 2026 06:02:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1770606175; bh=QNjMDvA4GT5+5r95oykDTLOoWhHZCwrCD9d6iDvQ+PY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=K7LrDtnGkN0aJhXpHF14YuuLznNSEbxd8M/wE8oWiVZCDbIhFySXUbfzQ33KSc+q5
	 ho2dOdgZTqeXCsDqYm44A35s655MdStwvwec0VB68OS6VXG014FjFMeolMVp7N4bqy
	 4qIPd3kbtIplTsVixnPMd9MKmDqKOWUAyaYfq4Ek=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: m.limarencko@yandex.ru
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Limarenko <m.limarencko@yandex.ru>
Subject: [PATCH ath-next 0/4] wifi: ath12k: harden stats/rate handling for WCN785x stability
Date: Mon,  9 Feb 2026 06:02:39 +0300
Message-ID: <20260209030243.1530075-1-m.limarencko@yandex.ru>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_190307_586664_0558E38C 
X-CRM114-Status: UNSURE (   6.37  )
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

From: Mikhail Limarenko <m.limarencko@yandex.ru>

Hi Jeff, all,

On QCNFA765/WCN785x (PCI, kernel 6.18.5) we observed three recurring
issues:

- chan info events with frequency not present in local survey range,
  producing invalid idx warnings;
- frequent VDEV_STAT polling can block for 3 seconds on fw_stats_done
  timeouts and cause visible hitches;
- occasional invalid MCS metadata (for example HE MCS=12) propagates
  into mac80211 status handling and correlates with ieee80211_rx_list
  warnings.

This series addresses those cases by:
1. returning -EINVAL from freq_to_idx() when no channel matches, and
   rejecting negative indexes in callers;
2. reducing the wait on VDEV_STAT fw_stats completion and skipping
   unnecessary waits for stats types that do not require it;
3. sanitizing invalid MCS metadata in both dp_rx and dp_mon paths by
   falling back to legacy metadata with ratelimited diagnostics.

Tested on:
- hardware: QCNFA765 (WCN785x)
- kernel: 6.18.5+deb13-amd64
- AP mode: 5 GHz (802.11ac)

Observed after applying this series:
- station dump polling no longer shows multi-second stalls in test runs;
- no fresh ieee80211_rx_list WARN was observed in the same windows.

If patch 1/4 is already present in ath-next or stable trees, please drop
it and keep the remaining fixes.

Thanks,
Mikhail Limarenko

Mikhail Limarenko (4):
  wifi: ath12k: validate survey index when frequency is not found
  wifi: ath12k: avoid long fw_stats waits on vdev stats hot path
  wifi: ath12k: sanitize invalid MCS metadata in rx path
  wifi: ath12k: sanitize invalid MCS metadata in monitor rx path

 drivers/net/wireless/ath/ath12k/dp_mon.c | 38 ++++++++++++++---------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 39 ++++++++++++++----------
 drivers/net/wireless/ath/ath12k/mac.c    | 22 +++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.c    | 13 ++++----
 4 files changed, 73 insertions(+), 39 deletions(-)

-- 
2.47.3

