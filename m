Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3170AEB4914
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bdN8UGuyDuSz8FZy7c2p7fmMONXAeWNjoIt2IOUIftY=; b=vqxyneJdwq1j2cSjSLYKko9l++
	B/DCdKoI1oN2zlYOdkHapFR0s/hTFIhzT5jmZxY7NZxfu7pZb07b+GtDOBQIX+5H4V47IdbtBIEIH
	GDW2dUopSIwdcNGYeTduhJMoE66vLxqWVps2pRuVfg2F/rt88NRUUnt5pQAueWYXWE4lk94FJTL72
	uDOwoauaQjvZp6spNXSbE+FxeHZvrKV+dbwuOCEPzDt+c//rkpUBcGHSYk7LfSqFPGXwWsKHAcqgX
	gIUGc329Pl1/5lsaS395p2Bd4qYHr9Da7aXfXT5FgKyhXjarsZ9zoVAITY/jAfLCnz3gKtOIeODUI
	i1VWPJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVe0-000000024RU-3WFR;
	Thu, 12 Feb 2026 12:18:04 +0000
Received: from forward101b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVdx-000000024QZ-3HhO
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 12:18:03 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id B1841C00AD;
	Thu, 12 Feb 2026 15:17:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id pHTFRX8GA8c0-kZaQgNJw;
	Thu, 12 Feb 2026 15:17:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1770898673; bh=bdN8UGuyDuSz8FZy7c2p7fmMONXAeWNjoIt2IOUIftY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=XlNguKAEVD2P9CBLdtliAV4ghXsSbTMyuBICURjVr2Uo0qBxbliOkxCAYtqxNhk6E
	 y4fk4WzMdWI8i5eQCEcEDWTWCG3CQ+MOMqe94PhEo6SIDQM+g2ftpmxXyzxu+kynb2
	 Fuv+gKosLr6YLybvlVwcRrReQDwD5H4OFgJFhHbU=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: m.limarencko@yandex.ru
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Limarenko <m.limarencko@yandex.ru>
Subject: [PATCH ath-next v2 0/4] wifi: ath12k: harden stats/rate handling for WCN785x stability
Date: Thu, 12 Feb 2026 15:17:42 +0300
Message-ID: <20260212121746.329619-1-m.limarencko@yandex.ru>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_041802_010711_B895B503 
X-CRM114-Status: UNSURE (   7.01  )
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
1. returning an explicit error from freq_to_idx() when no channel
   matches, and rejecting negative indexes in callers;
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

v2:
- patch 1/4 commit message no longer claims OOB in chan-info paths
- patch 1/4 keeps matched-frequency index progression unchanged
- patch 1/4 returns -ENOENT on no-match and callers reject negative idx

Thanks,
Mikhail Limarenko

Mikhail Limarenko (4):
  wifi: ath12k: return error when survey frequency is not found
  wifi: ath12k: avoid long fw_stats waits on vdev stats hot path
  wifi: ath12k: sanitize invalid MCS metadata in rx path
  wifi: ath12k: sanitize invalid MCS metadata in monitor rx path

 drivers/net/wireless/ath/ath12k/dp_mon.c | 38 ++++++++++++++---------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 39 ++++++++++++++----------
 drivers/net/wireless/ath/ath12k/mac.c    | 22 +++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.c    |  9 +++------
 4 files changed, 70 insertions(+), 38 deletions(-)

-- 
2.47.3

