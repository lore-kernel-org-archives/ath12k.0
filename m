Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01E4C27C6E
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P9bW8YE3ERqwkPgGvO1IAlC1dNoSvZrIQuSqO0M2FTA=; b=x0d6gJPG8Fjq8GzruAeXaGov+w
	mMITwt9AsQWoCz5nhUzfHg7REl1yacr+zHdh/QspH9uU76p+DP9v/3tMj2Y/5AEycrDE/YGalJWUf
	97k3mWxHHwPqBqlCBDR5Dj7RU+HCmuqh0i9jUUmmhfB6O4WLo5YfpIIiRdSXzatUaDCAKUDy38Hw0
	vvuxvsJku1LwpTo3r/zFsPSgbJVrIL3juaOB7An+SUM9nQZdxQBTtPxfRGPr3aYmyL1OxqSHKnGg7
	VTA8JVjDprs8bHFs+62ntzM2bXOI7rGoKd4Jjqwr+Vt3bB7CqR7mG+sAqdNLmdYz1HZswQSjxR8dv
	ILYpBcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6M-0000000EqlP-26MI
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 16:06:02 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc6H-0000000EqgJ-2FMh
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 16:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=P9bW8YE3ERqwkPgGvO1IAlC1dNoSvZrIQuSqO0M2FTA=; b=nwfhEr9skVuLCLufX+xnVd6cl8
	tnBkUd5tSwIqSmtYy/d2uHRZodT+k0pFSfZeQOSGbI+h5dc5V0jIHsD+YMSHoVTcc7jBfT4oNLRpe
	TdUvcyMiHwiut5mIoLbGjQCyrvS6q2ltpY4eJPjQhWyyDAznsdu0vzFC1cbUab6Gg0N0=;
Received: from p4ff13226.dip0.t-ipconnect.de ([79.241.50.38] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFc69-008xPc-20;
	Fri, 07 Jun 2024 18:05:49 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v4 0/9] cfg80211/mac80211: support defining multiple radios per wiphy
Date: Fri,  7 Jun 2024 18:05:39 +0200
Message-ID: <cover.0af6292ae793f7b9927ab6583791b58daedc9104.1717776325.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_090557_748928_62A2023F 
X-CRM114-Status: GOOD (  12.29  )
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

The prerequisite for MLO support in cfg80211/mac80211 is that all the links
participating in MLO must be from the same wiphy/ieee80211_hw. To meet this
expectation, some drivers may need to group multiple discrete hardware each
acting as a link in MLO under single wiphy.

With this change, supported frequencies and interface combinations of each
individual radio are reported to user space. This allows user space to figure
out the limitations of what combination of channels can be used concurrently.

Each mac80211 channel context is assigned to a radio based on radio specific
frequency ranges and interface combinations.

Even for non-MLO devices, this improves support for devices capable of
running on multiple channels at the same time.

This is loosely based on Karthikeyan Periyasamy's series
"[PATCH 00/13] wifi: Add multi physical hardware iface combination support"
with some differences:

 - a struct wiphy_radio is defined, which holds the frequency ranges and
   a full struct ieee80211_iface_combination array
 - a channel context is explicitly assigned to a radio when created
 - both global and per-radio interface combination limits are checked
   and enforced on channel context assignment
 - improve comments/docs and attributes
 - add cfg80211 helper for checking radio freq range

Changes since RFC v3:
 - fix __ieee80211_get_radio_mask to return per-vif radio mask
 - fix params->radio in ieee80211_check_combinations()
 - fix indentation
 - pass radio_idx in struct iface_combination_params
 - improve get_radio_mask callback

Changes since RFC v2:
 - fix uninitialized variables
 - fix multiple radios with DFS
 - add support for per-radio beacon interval checking

Changes since RFC:
 - replace static per-radio number of channels limit with full ifcomb
   checks
 - remove band bitmask in favor of only using freq ranges

Felix Fietkau (9):
  wifi: nl80211: split helper function from nl80211_put_iface_combinations
  wifi: cfg80211: add support for advertising multiple radios belonging to a wiphy
  wifi: cfg80211: extend interface combination check for multi-radio
  wifi: cfg80211: add helper for checking if a chandef is valid on a radio
  wifi: mac80211: add support for DFS with multiple radios
  wifi: mac80211: add radio index to ieee80211_chanctx_conf
  wifi: mac80211: extend ifcomb check functions for multi-radio
  wifi: mac80211: move code in ieee80211_link_reserve_chanctx to a helper
  wifi: mac80211: add wiphy radio assignment and validation

 include/net/cfg80211.h       |  51 +++++++++-
 include/net/mac80211.h       |   2 +-
 include/uapi/linux/nl80211.h |  51 +++++++++-
 net/mac80211/cfg.c           |   7 +-
 net/mac80211/chan.c          | 210 ++++++++++++++++++++++--------------
 net/mac80211/ibss.c          |   2 +-
 net/mac80211/ieee80211_i.h   |   5 +-
 net/mac80211/iface.c         |   2 +-
 net/mac80211/main.c          |  32 +++--
 net/mac80211/util.c          | 127 +++++++++++++++-------
 net/wireless/nl80211.c       | 190 +++++++++++++++++++++++----------
 net/wireless/rdev-ops.h      |  17 +++-
 net/wireless/trace.h         |   5 +-
 net/wireless/util.c          |  68 ++++++++++--
 14 files changed, 579 insertions(+), 190 deletions(-)

base-commit: 5bcd9a0a59953b5ff55ac226f903397319bf7f40
-- 
git-series 0.9.1

