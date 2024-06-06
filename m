Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931CCC27C6D
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CqwUBAgIy/bF068vQeu7eSci844EoGdF2SscwS3MCvs=; b=1ayEdKu9j4bOGvGlVoFpf5Dx0w
	EEwQXwF+BS8ZNhBCnpbI69ZzBnMw8zDhCyI69lgtRJU6n6qmIbBcphql4sJoPtBMfhmQ2bf0sAqdF
	kXi9uy1XC5XwEL0ZOnpwH85F4V0NXdKPX1NtfC44//lk77XWj88YtE7xLMpk6wIdalJqbMApqgvQP
	07eZB3Vk+XrgX8ZrByRbbh0R8aHW7W6vh0qV575kNLS8x2m11l56hLmZQ5f4g7ObeulOTfh3YeAZs
	v6UZcKEF33qCh/LU6Z2Giidq5kUJYoK02zxQGkT/1Xj+xLI9Ufrb6Lh4p6LVsr41Zqr1pCORhy6X+
	oAQRr/cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHWJ-0000000As5D-08L1
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 18:07:27 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHWD-0000000As1R-3EHv
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 18:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CqwUBAgIy/bF068vQeu7eSci844EoGdF2SscwS3MCvs=; b=K04SaZHNg9fE2Pg0a3GDLStAjS
	5z5ItaJ1IgYqpvrTT+l/bxtbiZ6r2tQtS7qRNdAbYxtqwFXAvDTWESnR966ljWE2yQmztTNdsaqxN
	LVfTnD0xPtqL8mL1VZkV/FIAMiNSg7+azZjPCazr2rHeC4EczRWy26FRiKi1Qa90mmoM=;
Received: from p4ff130d0.dip0.t-ipconnect.de ([79.241.48.208] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFHW5-008aic-32;
	Thu, 06 Jun 2024 20:07:14 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v3 0/8] cfg80211/mac80211: support defining multiple radios per wiphy
Date: Thu,  6 Jun 2024 20:07:05 +0200
Message-ID: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_110721_972254_66696FA3 
X-CRM114-Status: GOOD (  10.61  )
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

With this series, the bands and supported frequencies of each individual
radio are reported to user space. This allows user space to figure out the
limitations of what combination of channels can be used concurrently.

Each mac80211 channel context is assigned to a radio based on radio specific
frequency ranges and interface combinations.

This is loosely based on Karthikeyan Periyasamy's series
"[PATCH 00/13] wifi: Add multi physical hardware iface combination support"
with some differences:

 - a struct wiphy_radio is defined, which holds the frequency ranges and
   a full struct ieee80211_iface_combination array
 - a channel context is explicitly assigned to a radio when created
 - both global and per-radio interface combination limits are checked
   and enforced on channel context assignment

Changes since RFC v2:
 - fix uninitialized variables
 - fix multiple radios with DFS
 - add support for per-radio beacon interval checking

Changes since RFC:
 - replace static per-radio number of channels limit with full ifcomb
   checks
 - remove band bitmask in favor of only using freq ranges

Felix Fietkau (8):
  wifi: nl80211: split helper function from nl80211_put_iface_combinations
  wifi: cfg80211: add support for advertising multiple radios belonging to a wiphy
  wifi: cfg80211: extend interface combination check for multi-radio
  wifi: mac80211: add support for DFS with multiple radios
  wifi: mac80211: add radio index to ieee80211_chanctx_conf
  wifi: mac80211: extend ifcomb check functions for multi-radio
  wifi: mac80211: move code in ieee80211_link_reserve_chanctx to a helper
  wifi: mac80211: add wiphy radio assignment and validation

 include/net/cfg80211.h       |  43 +++++++-
 include/net/mac80211.h       |   2 +-
 include/uapi/linux/nl80211.h |  48 ++++++++-
 net/mac80211/cfg.c           |   7 +-
 net/mac80211/chan.c          | 228 +++++++++++++++++++++++-------------
 net/mac80211/ibss.c          |   2 +-
 net/mac80211/ieee80211_i.h   |   6 +-
 net/mac80211/iface.c         |   2 +-
 net/mac80211/main.c          |  32 +++--
 net/mac80211/util.c          | 131 +++++++++++++++------
 net/wireless/nl80211.c       | 190 +++++++++++++++++++++---------
 net/wireless/rdev-ops.h      |  17 +++-
 net/wireless/trace.h         |   5 +-
 net/wireless/util.c          |  36 ++++--
 14 files changed, 560 insertions(+), 189 deletions(-)

base-commit: 5bcd9a0a59953b5ff55ac226f903397319bf7f40
-- 
git-series 0.9.1

