Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC449C35FF1
	for <ath12k@archiver.kernel.org>; Sat, 15 Mar 2025 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vfOHHmw8slfVKGwcibJ3ksC8kzzxvEyOh+tUAW4T854=; b=vKHOIpnG42phikPgqd48BMuFbP
	bavZI8vWgqlIS+CTOwxe0I8ha523Re6dPQ/vW2U1pDiw1qXHUW0EqfUKLpmMmbufSk1NtumxVk23u
	Bj/8XOfuj2iUNvUkXBHWEx20YZ01v1IDI+UQT1Co+D/HxvAWd0PkjNcjMSZtBpfcs6LktZwPd//Ei
	fP9VjIkCsXG3zNLrz3wuQQoYgw4Q1srbJosOAGoopbCF6PfBlt0MneNe/K76ay41YqnC8JBkN00LL
	4KX9Gr9W1Qwwk/OIr6s47z99Tmpqy7ltKapZ2DJxcs9Yo+xTucNwcmsG/7iu4+6TIgiPPvkmEAdgM
	w0eJmqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttYJF-0000000Gq3B-2dfp
	for ath12k@archiver.kernel.org;
	Sat, 15 Mar 2025 20:40:41 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttY6R-0000000Goz9-01uR
	for ath12k@lists.infradead.org;
	Sat, 15 Mar 2025 20:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742070447; x=1773606447;
  h=date:from:to:cc:subject:message-id;
  bh=nIgeCugFpluZalOErWthOCQzQIBk2i4hAQBS3hE8hiI=;
  b=UG3LOznAvsBbzO+d3k3CYaGk4ezLMSEgM7pRKwZ1014H2e3krvLQ8EbU
   dSSszw14iSbsz6JOxdJ+iuou+CHaCl/97CfJc8S6T/O4vI8Usn5D61CZ/
   oYBuIREimJM4hytYvTq4JOt1s+dK5XNjy8hOKaZeiX5a0r/CKpdzLgLLl
   BVm9cyhxnwRBV3J3Bj11QAmn0TiC+OArDEUQu1AarSSbesgsIuLBKPJVO
   pBqMtu9glpbt6d16cmeC07pF9Fpi9Of2pItqOMa7xXw6Q9DGAtkNuEB2G
   gEK83JRod4e5hL04GbZtQBEz2H3iHLTFJveFDmbB2h3x/zN/NjJtuOUi3
   g==;
X-CSE-ConnectionGUID: 5sU180x9SdKVoVDoz3PrdA==
X-CSE-MsgGUID: aGkEbRH6Tq2BDvOMQz5fPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="46986568"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="46986568"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 13:27:23 -0700
X-CSE-ConnectionGUID: tH4F1o+XQD+hYd95+KZvQA==
X-CSE-MsgGUID: 7b2HtXMcRyGpq4SEXaDb4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121585893"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Mar 2025 13:27:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttY6J-000Bd5-2A;
	Sat, 15 Mar 2025 20:27:19 +0000
Date: Sun, 16 Mar 2025 04:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-split-phy] BUILD REGRESSION
 b8fa5b81fe378ec2bf46db73a2ff7d43151121da
Message-ID: <202503160408.Yu7o7JVJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_132727_155900_C16E4469 
X-CRM114-Status: UNSURE (   2.94  )
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
branch HEAD: b8fa5b81fe378ec2bf46db73a2ff7d43151121da  wifi: ath12k: Fix search flag and update peer map event for sta

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202503151013.F71WON7c-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202503151644.yfAQJbDP-lkp@intel.com

    drivers/net/wireless/ath/wcn36xx/main.c:1377:35: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/ath/wcn36xx/main.c:1377:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/intel/iwlwifi/dvm/lib.c:589:40: error: too few arguments to function call, expected 2, have 1
    drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6250:10: error: no member named 'signal_avg' in 'struct station_info'
    drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6276:9: error: no member named 'rx_beacon' in 'struct station_info'
    drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6284:10: error: no member named 'rx_beacon_signal_avg' in 'struct station_info'
    drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6650:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6650:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:1419:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:1419:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/marvell/mwifiex/cfg80211.c:1479:10: error: no member named 'signal_avg' in 'struct station_info'
    drivers/net/wireless/mediatek/mt76/mt7915/main.c:1205:9: error: no member named 'ack_signal' in 'struct station_info'
    drivers/net/wireless/mediatek/mt76/mt7915/main.c:1208:9: error: no member named 'avg_ack_signal' in 'struct station_info'
    drivers/net/wireless/mediatek/mt76/mt7915/main.c:1797:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/mediatek/mt76/mt7915/main.c:1797:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/mediatek/mt76/mt7921/main.c:1547:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/mediatek/mt76/mt7921/main.c:1547:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/mediatek/mt76/mt7925/main.c:2180:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/mediatek/mt76/mt7925/main.c:2180:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/mediatek/mt76/mt792x_core.c:574:9: error: no member named 'ack_signal' in 'struct station_info'
    drivers/net/wireless/mediatek/mt76/mt792x_core.c:577:9: error: no member named 'avg_ack_signal' in 'struct station_info'
    drivers/net/wireless/mediatek/mt76/mt7996/main.c:1174:9: error: no member named 'ack_signal' in 'struct station_info'
    drivers/net/wireless/mediatek/mt76/mt7996/main.c:1177:9: error: no member named 'avg_ack_signal' in 'struct station_info'
    drivers/net/wireless/mediatek/mt76/mt7996/main.c:1667:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/mediatek/mt76/mt7996/main.c:1667:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/realtek/rtl8xxxu/core.c:7632:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/realtek/rtl8xxxu/core.c:7632:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/realtek/rtw88/mac80211.c:970:35: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/realtek/rtw88/mac80211.c:970:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/realtek/rtw89/mac80211.c:1853:35: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/realtek/rtw89/mac80211.c:1853:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    drivers/net/wireless/ti/wlcore/main.c:6057:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    drivers/net/wireless/ti/wlcore/main.c:6057:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   |-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-dvm-lib.c:error:too-few-arguments-to-function-call-expected-have
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
|   `-- drivers-net-wireless-ti-wlcore-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|-- hexagon-allmodconfig
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   `-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
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
|-- powerpc-randconfig-003-20250315
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7915-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7921-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7925-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt792x_core.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-ack_signal-in-struct-station_info
|   `-- drivers-net-wireless-mediatek-mt76-mt7996-main.c:error:no-member-named-avg_ack_signal-in-struct-station_info
|-- um-allmodconfig
|   |-- drivers-net-wireless-intel-iwlwifi-dvm-lib.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-rx_beacon_signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mac80211.c:error:no-member-named-signal_avg-in-struct-station_info
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-mld-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
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
|   `-- drivers-net-wireless-realtek-rtw89-mac80211.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops
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

configs tested: 87
configs skipped: 1

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250315    gcc-13.2.0
arc                   randconfig-002-20250315    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250315    gcc-14.2.0
arm                   randconfig-002-20250315    clang-21
arm                   randconfig-003-20250315    clang-21
arm                   randconfig-004-20250315    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250315    gcc-14.2.0
arm64                 randconfig-002-20250315    gcc-14.2.0
arm64                 randconfig-003-20250315    clang-16
arm64                 randconfig-004-20250315    gcc-14.2.0
csky                  randconfig-001-20250315    gcc-14.2.0
csky                  randconfig-002-20250315    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250315    clang-21
hexagon               randconfig-002-20250315    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250315    gcc-12
i386        buildonly-randconfig-002-20250315    clang-19
i386        buildonly-randconfig-003-20250315    clang-19
i386        buildonly-randconfig-004-20250315    clang-19
i386        buildonly-randconfig-005-20250315    gcc-11
i386        buildonly-randconfig-006-20250315    gcc-12
i386                                defconfig    clang-19
loongarch             randconfig-001-20250315    gcc-14.2.0
loongarch             randconfig-002-20250315    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250315    gcc-14.2.0
nios2                 randconfig-002-20250315    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250315    gcc-14.2.0
parisc                randconfig-002-20250315    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250315    clang-21
powerpc               randconfig-002-20250315    gcc-14.2.0
powerpc               randconfig-003-20250315    clang-18
powerpc64             randconfig-001-20250315    gcc-14.2.0
powerpc64             randconfig-002-20250315    clang-18
powerpc64             randconfig-003-20250315    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250315    gcc-14.2.0
riscv                 randconfig-002-20250315    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250315    clang-19
s390                  randconfig-002-20250315    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250315    gcc-14.2.0
sh                    randconfig-002-20250315    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250315    gcc-14.2.0
sparc                 randconfig-002-20250315    gcc-14.2.0
sparc64               randconfig-001-20250315    gcc-14.2.0
sparc64               randconfig-002-20250315    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250315    gcc-12
um                    randconfig-002-20250315    clang-18
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250315    gcc-12
x86_64      buildonly-randconfig-002-20250315    clang-19
x86_64      buildonly-randconfig-003-20250315    clang-19
x86_64      buildonly-randconfig-004-20250315    clang-19
x86_64      buildonly-randconfig-005-20250315    clang-19
x86_64      buildonly-randconfig-006-20250315    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250315    gcc-14.2.0
xtensa                randconfig-002-20250315    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

