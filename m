Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36C6C27C52
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 18:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N8ysX8u8qfjL06FnkJCkxCDGjxY6B9IlU3WUADMIhyU=; b=iiVU3NxPgVPd2rzdROh9ElIWH8
	JHBlyTJ7Wime5CEy79RAW4ng+qs1ktPUvkyq7wW6mVBtMCYY+05CWQanQ4EmA36KVBUipqZf09yLw
	p0r44Ajkp7pB+xpmQtx9pCnAQklFc0NFWhicjXOBIyQo37Gq7W6RIwbHPMAYZaZ2syzmG8ubMFVRS
	I6XDQE5RYgZRiS/ho9AGN8yOS0lJ0dkafGz74pVtNba56WPHTydTbhsDNh2um4Mt394SfWUWrljBO
	iKhhFFGcmUPuECSEJNnwrcR2MdezwHRWR/kFgSSN+4OIcsjTvibczUZl1YKYof0bDFKQB4IQyFf84
	IvW7rcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvQQ-00000007Aaj-0qAZ
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 18:31:54 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvQI-00000007AUt-3pBR
	for ath12k@lists.infradead.org;
	Wed, 05 Jun 2024 18:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=N8ysX8u8qfjL06FnkJCkxCDGjxY6B9IlU3WUADMIhyU=; b=gejp5XcErJUphH1wVAgVWoQUf4
	CzH3Vqiya1hKNiMy6cqFLyBwZDqc0fMXYO1hq0oHaV3btE2rkMUpKyKlEEC+IWinIfukCTIQYZtJI
	iGvODkoOfacbs+MoJOsNuEuknb/ZvNfbpsvwqdBeWzeZSL6dy97QczGGMJbIkqAU2hmQ=;
Received: from p4ff130d0.dip0.t-ipconnect.de ([79.241.48.208] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sEvQ9-008Gwq-0a;
	Wed, 05 Jun 2024 20:31:37 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v2 0/7] cfg80211/mac80211: support defining multiple radios per wiphy
Date: Wed,  5 Jun 2024 20:31:23 +0200
Message-ID: <cover.c104c0bb3a14f4ac26aee71f4979846f6ad87742.1717611760.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_113146_971814_FEE88D48 
X-CRM114-Status: UNSURE (   9.94  )
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

Changes since RFC:
 - replace static per-radio number of channels limit with full ifcomb
   checks
 - remove band bitmask in favor of only using freq ranges

Felix Fietkau (7):
  wifi: nl80211: split helper function from nl80211_put_iface_combinations
  wifi: cfg80211: add support for advertising multiple radios belonging to a wiphy
  wifi: cfg80211: extend interface combination check for multi-radio
  wifi: mac80211: add radio index to ieee80211_chanctx_conf
  wifi: mac80211: extend ifcomb check functions for multi-radio
  wifi: mac80211: move code in ieee80211_link_reserve_chanctx to a helper
  wifi: mac80211: add wiphy radio assignment and validation

 include/net/cfg80211.h       |  40 ++++++-
 include/net/mac80211.h       |   2 +-
 include/uapi/linux/nl80211.h |  48 ++++++++-
 net/mac80211/cfg.c           |   6 +-
 net/mac80211/chan.c          | 228 +++++++++++++++++++++++-------------
 net/mac80211/ibss.c          |   2 +-
 net/mac80211/ieee80211_i.h   |   4 +-
 net/mac80211/iface.c         |   2 +-
 net/mac80211/util.c          | 114 ++++++++++++------
 net/wireless/nl80211.c       | 190 +++++++++++++++++++++---------
 net/wireless/util.c          |  29 ++---
 11 files changed, 481 insertions(+), 184 deletions(-)

base-commit: 5bcd9a0a59953b5ff55ac226f903397319bf7f40
-- 
git-series 0.9.1

