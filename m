Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC65C36008
	for <ath12k@archiver.kernel.org>; Wed, 26 Mar 2025 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4475IlQRq0dWFsOnSLlQ1VBbeZE4AzCElSPf23XrI1o=; b=38b7HCgAhn+ZQ6WFihv64w2LOu
	jkYuQBaEBtQHxG7D4QmcwqpyAJzdZSB1DEZVU5RE8RfLLqTNpu7Dts/Fpm2sJO64PkC9s2MNqLSN6
	k7TtAfCQmhpl9i0lOsj4y5n0fH21PjCuc/eSjEl/07QMnFSVB8q9t0piBn0IomCtvlfHJpYBeLxkH
	jpX+C2X3P4LYgLOReHPgYVYF456kzN70RsOKxWdBsT20xxw1iukw8+BnSbKDx/arg40n27ocjtgY2
	t8oF8Stjx+b8JXvzHM+FM3tvn77LT0LxfQqSkPz9t33lX/kesB6wttfqIYtfRcvwyTwuiJGWZzXqG
	dwNdVd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXhA-00000009aeA-3qz7
	for ath12k@archiver.kernel.org;
	Wed, 26 Mar 2025 20:49:52 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXfb-00000009aQ0-2CZQ
	for ath12k@lists.infradead.org;
	Wed, 26 Mar 2025 20:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743022095; x=1774558095;
  h=date:from:to:cc:subject:message-id;
  bh=XYoyQNDa5zJS2WygAVlgwfo/0rPB7uLIo6hWDgeBAOE=;
  b=OFydRrzA76n/x0bkpZuJLJLXTZnDy7y5IpSvBZ1+w+KXKOFFpASiq5hr
   4hJVcToomxoFIov3wMtYjICsMP/Fw1j5Yowv31ZU19skCpDoMjk0C+8Qc
   kw6U2IUyl+0BftIPHnPmS48USURfuOEveUp1NWo8VqbbhaOL6gTIpgW86
   V9IBoGIxlQny8KX87gNnoZGdwnhIVDOx49vnW5T0WrvFdUDMHBTxRRmuv
   kwWaZ0JbcoldKKOGGXabMQIRHcEOtx8zSNUpr8BfO/3GW5kvJvvGBINmk
   Q15FLJjtSZSmEZXvAQ7ScO22X2Z7G2PKFoo0KsZI4Fwus4tUlZ2244u+l
   w==;
X-CSE-ConnectionGUID: NWg+B+zHTHafpB7JbRo09A==
X-CSE-MsgGUID: e+7AM6ixS9WcvS5AJjCvSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44454740"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="44454740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 13:48:14 -0700
X-CSE-ConnectionGUID: GzbYtoPJR/CoMD0PiTl66w==
X-CSE-MsgGUID: +yYiKduRTFKhisRaE77viA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="155825402"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2025 13:48:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txXfW-00063z-0R;
	Wed, 26 Mar 2025 20:48:10 +0000
Date: Thu, 27 Mar 2025 04:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-split-phy] BUILD REGRESSION
 6ba167f14bcdae66c960bae133527d4cb390999a
Message-ID: <202503270444.qxbpXVWS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_134815_626930_21F7A83E 
X-CRM114-Status: UNSURE (   2.84  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
branch HEAD: 6ba167f14bcdae66c960bae133527d4cb390999a  wifi: ath12k: fix regulatory init race condition

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-dvm-lib.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon_signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-marvell-mwifiex-cfg80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|-- hexagon-allmodconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-marvell-mwifiex-cfg80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|-- hexagon-allyesconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-marvell-mwifiex-cfg80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|-- i386-allmodconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|-- i386-allyesconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|-- powerpc-allyesconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-dvm-lib.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon_signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-marvell-mwifiex-cfg80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|-- powerpc-randconfig-003-20250326
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   `-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-dvm-lib.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon_signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-marvell-mwifiex-cfg80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-dvm-lib.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon_signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-marvell-mwifiex-cfg80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|-- um-allmodconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-dvm-lib.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon_signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-marvell-mwifiex-cfg80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|-- um-allyesconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   |-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:positional-initialization-of-field-in-struct-declared-with-designated_init-attribute
`-- x86_64-allyesconfig
    |-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    |-- drivers-net-wireless-intel-iwlwifi-dvm-lib.c:error:too-few-arguments-to-function-call-expected-have
    |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon-in-struct-station_info
    |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon_signal_avg-in-struct-station_info
    |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-signal_avg-in-struct-station_info
    |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    |-- drivers-net-wireless-marvell-mwifiex-cfg80211.c:error:no-member-named-signal_avg-in-struct-station_info
    |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-ack_signal-in-struct-station_info
    |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
    |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
    |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
    |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-ack_signal-in-struct-station_info
    |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
    |-- drivers-net-wireless-realtek-rtl8xxxu-core.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    |-- drivers-net-wireless-realtek-rtw88-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    |-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
    `-- drivers-net-wireless-ti-wlcore-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops

elapsed time: 1445m

configs tested: 126
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250326    gcc-14.2.0
arc                   randconfig-002-20250326    gcc-8.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250326    gcc-7.5.0
arm                   randconfig-002-20250326    clang-21
arm                   randconfig-003-20250326    gcc-8.5.0
arm                   randconfig-004-20250326    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250326    clang-21
arm64                 randconfig-002-20250326    clang-21
arm64                 randconfig-003-20250326    gcc-8.5.0
arm64                 randconfig-004-20250326    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250326    gcc-14.2.0
csky                  randconfig-002-20250326    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250326    clang-21
hexagon               randconfig-002-20250326    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250326    gcc-12
i386        buildonly-randconfig-002-20250326    clang-20
i386        buildonly-randconfig-003-20250326    clang-20
i386        buildonly-randconfig-004-20250326    clang-20
i386        buildonly-randconfig-005-20250326    gcc-12
i386        buildonly-randconfig-006-20250326    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250326    gcc-14.2.0
loongarch             randconfig-002-20250326    gcc-12.4.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250326    gcc-12.4.0
nios2                 randconfig-002-20250326    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250326    gcc-13.3.0
parisc                randconfig-002-20250326    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250326    clang-21
powerpc               randconfig-002-20250326    gcc-6.5.0
powerpc               randconfig-003-20250326    clang-19
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-21
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250326    clang-21
powerpc64             randconfig-002-20250326    gcc-8.5.0
powerpc64             randconfig-003-20250326    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250326    clang-21
riscv                 randconfig-002-20250326    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250326    clang-15
s390                  randconfig-002-20250326    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                    randconfig-001-20250326    gcc-6.5.0
sh                    randconfig-002-20250326    gcc-6.5.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250326    gcc-11.5.0
sparc                 randconfig-002-20250326    gcc-5.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250326    gcc-5.5.0
sparc64               randconfig-002-20250326    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250326    clang-15
um                    randconfig-002-20250326    gcc-11
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250326    clang-20
x86_64      buildonly-randconfig-002-20250326    gcc-11
x86_64      buildonly-randconfig-003-20250326    clang-20
x86_64      buildonly-randconfig-004-20250326    clang-20
x86_64      buildonly-randconfig-005-20250326    clang-20
x86_64      buildonly-randconfig-006-20250326    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250326    gcc-7.5.0
xtensa                randconfig-002-20250326    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

