Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6A0C88E53
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YR3zkKSodlFj8hgq2aLflMTIewm8ssnZybC0wV/5zGI=; b=Afqzlqf2w2XTqMCuxokOda7y7O
	UMVbsP4+swdlaPejMrArP6X1aaXLMI+xYf1KKIBhzEb3J8zrFq/RIv9jJv5WCqpLXWpgjUpWy4IdH
	yoPaBfRjPzboUusvjmYRDUN12yY7j5cgmv/Z2ZIU2wI1Tet+xSVShrnR4s83y6/N+ExdGyV1JHXDV
	dghyMnSBD4skkUH/BWxa2eMMBL7GlSdQvX5DYzf0h/u3vkw5uj/dgY14dAlbWI6XDaMDRS04Z7utG
	tvCUYxkFlWvBCBSYHz711KyHJpbiwNa+zbv7GI1CvyTKUUBVGCT/PAaS7AZvB3TlC6DNZbC+tKbFG
	LmB9o/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T6t-00000006hFJ-23Mp;
	Tue, 15 Sep 2026 13:22:07 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T6r-00000006hDt-2Zo4;
	Tue, 15 Sep 2026 13:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=YR3zkKSodlFj8hgq2aLflMTIewm8ssnZybC0wV/5zGI=; t=1789478525; x=1790688125; 
	b=S/iLm9ugoiZ3cBZwhDAC48oBDOsigOpfWyYjupeekEvUMGV+0j4m8l/lBtmH9R2wYIiZ4/bTEla
	t0x7JZwkSblI5j3lfxzRYTb4/Heuaf/qGgAKR9ZTBLHq27VjEzVPqiRkdFXLO0NTp/grACyZ5jGMN
	YZ0jx4Y+abzo5mTid2KIodSE/41pIdtv7lxovMKY7RxaU+qSZcsFsU4WPtCm+mesFFFsBO5UIjCDT
	EddEj7PyC4s4n3+Z/E6Y0XskRiCfnapDC8w2HeEP7yPzif7GSMhxlhOk9KsJPC4HkuRgWBuUBoUgj
	Ud9xkeKUsf3ofSuYuCWLDSTTYuvQjVTtTUaQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1x6T6e-0000000H08V-0LXu;
	Tue, 15 Sep 2026 15:21:52 +0200
From: Benjamin Berg <benjamin@sipsolutions.net>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH wireless-next v4 0/8] Adding NO_STA flag and reworking RX link resolution
Date: Tue, 15 Sep 2026 15:19:26 +0200
Message-ID: <20260915131925.1780764-10-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_062205_680719_3BCF5ACE 
X-CRM114-Status: GOOD (  12.64  )
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

From: Benjamin Berg <benjamin.berg@intel.com>

Hi,

This patchset refactors the RX link resolution a bit to fix some issues
where mac80211 might accept frames on the wrong link and incorrectly
translate the address. It also adds a new NL80211_ATTR_FRAME_CMD_NO_STA
flag so that userspace can know whether address translation was done by
the kernel on RX and can also prevent address translation for management
frames during TX.

This together should be enough to fix the existing issues in hostapd
where stations that are still associated try to authenticate again but
hostapd for example ends up sending the frame to an old link address.

Benjamin

PS: Sorry, the last mail had various issues, so resending properly now.

v4:
 * Rename flag to NL80211_ATTR_FRAME_NO_STA
 * Fix link_sta assignment in mt76_rx_convert

v3:
 * Fix issues found during review

v2:
 * Remove unused variable in rtw89

Changes in v1:
 * Add NAN_DATA interface handling
 * Handle NO_STA flag correctly for NAN
 * Fixed forwarding of station parameter
 * Rebase and other small fixes

Changes in RFCv2:
 * Port other drivers to new API (untested)
 * Fix a checkpatch warning

Benjamin Berg (8):
  wifi: iwlwifi: use link_sta internally to the driver
  wifi: mac80211: change public RX API to use link stations
  wifi: mac80211: refactor RX link_id and station handling
  wifi: mac80211: rework RX packet handling
  wifi: cfg80211: add attribute for TX/RX denoting there is no station
  wifi: mac80211: report to cfg80211 when no STA is known for a frame
  wifi: mac80211: pass station to ieee80211_tx_skb_tid
  wifi: mac80211: pass error station if non-STA transmit was requested

 drivers/net/wireless/ath/ath11k/dp_rx.c       |   2 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c      |   2 -
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  20 +-
 drivers/net/wireless/ath/ath12k/hw.h          |  20 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  20 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  12 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |   6 +-
 drivers/net/wireless/ath/ath12k/wmi.c         |   6 -
 drivers/net/wireless/intel/iwlwifi/mld/agg.c  |  17 +-
 drivers/net/wireless/intel/iwlwifi/mld/agg.h  |   4 +-
 drivers/net/wireless/intel/iwlwifi/mld/rx.c   |  50 +-
 drivers/net/wireless/intel/iwlwifi/mld/rx.h   |   2 +-
 .../wireless/intel/iwlwifi/mld/tests/agg.c    |   7 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rx.c   |   2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c |   6 +-
 drivers/net/wireless/mediatek/mt76/mac80211.c |  25 +-
 drivers/net/wireless/realtek/rtw89/core.c     |   7 -
 .../wireless/virtual/mac80211_hwsim_main.c    |   3 -
 include/net/cfg80211.h                        |   4 +
 include/net/mac80211.h                        |  25 +-
 include/uapi/linux/nl80211.h                  |   7 +
 net/mac80211/agg-tx.c                         |   4 +-
 net/mac80211/ap.c                             |   3 -
 net/mac80211/ht.c                             |   2 +-
 net/mac80211/ieee80211_i.h                    |  11 +-
 net/mac80211/iface.c                          |   7 +-
 net/mac80211/mlme.c                           |  10 +-
 net/mac80211/offchannel.c                     |  13 +-
 net/mac80211/rx.c                             | 447 ++++++++++--------
 net/mac80211/scan.c                           |  10 +-
 net/mac80211/tdls.c                           |   2 +-
 net/mac80211/tx.c                             |  10 +-
 net/wireless/nl80211.c                        |   8 +-
 33 files changed, 414 insertions(+), 360 deletions(-)

-- 
2.55.0


