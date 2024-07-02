Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46856C3064D
	for <ath12k@archiver.kernel.org>; Tue,  2 Jul 2024 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q43pZ2SYBCGRgcHP5b9DvgW/FsRUqYXEULVcIdpxa5w=; b=xiWltFLX8U0XbQu5RkImIOh16J
	YkWkgQaqpQsLvbK+Wi7ec/0VBySnJmmsIwlrt2BfyuRGb7IbCqcWZBwR3LQSnluqnqjzBx8LA+p2S
	qDmmnIjd0+NIMa2ZXd8N40Zb9dTNgnS0KXpWWWcBNGkAkAVmESpGlGiVg1W1Td62/fd9xd2thFs3U
	b1NIb3Xxcqh3GtgOLirZXaA3l1DvNeGx42WZeOEpYc5hu6SNF6/6NRLAFeCdV0SRUEzKxTeXzdpxz
	WzlUlHPLa9IEXehFRUhZOUtTosg7YaYaGagO+2zIGmWq7ciSGzjKirbgjRPQugSGSXTbRRC3BrJLG
	MkKj9UKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObnz-00000006UP9-41o3
	for ath12k@archiver.kernel.org;
	Tue, 02 Jul 2024 11:36:15 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObnw-00000006UN8-45f2
	for ath12k@lists.infradead.org;
	Tue, 02 Jul 2024 11:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Q43pZ2SYBCGRgcHP5b9DvgW/FsRUqYXEULVcIdpxa5w=; b=JAQ9UW14/D9ZNJelW8YMgodv2q
	6OelMyn0XAIizN3SMBQr9bO9Hg3Qn8KQquBwerIs00mAR6gznwrX9G2owGj4UpdS3fQROQirQbhkL
	88sbUn3QPWfJoCCftF1nF+9Mv2Jk8TkJN63RazdZTs6/t57BG4OvNyDW4goXB2nbI/6c=;
Received: from p54ae9766.dip0.t-ipconnect.de ([84.174.151.102] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sObnq-001lDm-1x;
	Tue, 02 Jul 2024 13:36:06 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [PATCH v4 00/10] cfg80211/mac80211: support defining multiple radios per wiphy
Date: Tue,  2 Jul 2024 13:35:55 +0200
Message-ID: <cover.39da4d3b01ce5545ac85da8cab3179f7c7a351a8.1719919832.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_043613_052181_90BA9A23 
X-CRM114-Status: GOOD (  15.87  )
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

Changes since PATCH v3:
 - add documentation note for interface combinations
 - fix ibss ifcomb check
 - drop redundant/incorrect lines in mac80211 radio ifcomb code

Changes since PATCH v2:
 - fix locking annotation for get_radio_mask
 - fix related rcu access in mac80211
 - fix nl80211 radio data type docs
 - remove __counted_by
 - fix unwinding on netlink attr/nest
 - consmetic fixes
 - remove WARN_ON_ONCE in hwsim

Changes since PATCH v1:
 - add nested flag to newly added nested attributes
 - make per-radio attributes multi-attr
 - add __counted_by annotation
 - remove unnecessary tracing
 - fix hwsim attribute docs
 - add hwsim attribute policy
 - add radio index

Changes since RFC v4:
 - report the first radio's ifcomb as main ifcomb for legacy compatibility
 - report the global wiphy ifcomb separately
 - add mac80211_hwsim support

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

Felix Fietkau (10):
  wifi: nl80211: split helper function from nl80211_put_iface_combinations
  wifi: cfg80211: add support for advertising multiple radios belonging to a wiphy
  wifi: cfg80211: extend interface combination check for multi-radio
  wifi: cfg80211: add helper for checking if a chandef is valid on a radio
  wifi: mac80211: add support for DFS with multiple radios
  wifi: mac80211: add radio index to ieee80211_chanctx_conf
  wifi: mac80211: extend ifcomb check functions for multi-radio
  wifi: mac80211: move code in ieee80211_link_reserve_chanctx to a helper
  wifi: mac80211: add wiphy radio assignment and validation
  wifi: mac80211_hwsim: add support for multi-radio wiphy

 drivers/net/wireless/virtual/mac80211_hwsim.c |  74 +++++--
 drivers/net/wireless/virtual/mac80211_hwsim.h |   4 +-
 include/net/cfg80211.h                        |  56 ++++-
 include/net/mac80211.h                        |   2 +-
 include/uapi/linux/nl80211.h                  |  65 ++++++-
 net/mac80211/cfg.c                            |   7 +-
 net/mac80211/chan.c                           | 210 +++++++++++--------
 net/mac80211/ibss.c                           |   2 +-
 net/mac80211/ieee80211_i.h                    |   5 +-
 net/mac80211/iface.c                          |   2 +-
 net/mac80211/main.c                           |  50 +++--
 net/mac80211/util.c                           | 143 ++++++++-----
 net/wireless/nl80211.c                        | 202 +++++++++++++-----
 net/wireless/rdev-ops.h                       |  12 +-
 net/wireless/util.c                           |  68 +++++-
 15 files changed, 673 insertions(+), 229 deletions(-)

base-commit: 8c62617295d3c4cd03f1a02c3b9bf9d4e6d6e0c6
-- 
git-series 0.9.1

