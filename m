Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A621CC369A2
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AQaBhuVr0px5iJfp0XaquODNSHTKJKqAst8V2+E4aGo=; b=ukawKbQ2JO+nQ7RmgnHbDsOc8W
	s8m0YK3n2NaqBS1Nj3y3f9dhAPkBLfdeitmnvSN6+le6oGaL/g47YZDi+Erk3U4zMEKzkSdGBxlP9
	kRju9YVFEPL65jBbTY0Tue4fO+rNSrpeuvBTij/Am5lI4rtYkK7aEZouD/bH18Im3NuSQqLktTDJp
	sLGeh5qgB+f+4VQEjnNEl6rJULSG8kCywCSSA4SwiISRwSMkdLIFZ6e1x7uGulrUIIc+AW+Pp7CFg
	JjPFe0OWQv0WIuVhItkyfUx4L/pc16/fAlkvF3IKsRilsopRKUwu4XiuuEw4b59jbFtea66kSMrPU
	cGuzf26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BqI-00000004orv-1kb8
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 16:30:30 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BqF-00000004orH-1o5z
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 16:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744129828; x=1775665828;
  h=date:from:to:cc:subject:message-id;
  bh=EQF0RcyTRIJN+zuvlIb64TeycWDLYl8Xrz8lQq7K9Zw=;
  b=ePvp4TdqZJTPc+tuz4ga3HqEouSgTvjb282leEdkgecHRpgPUgNBexad
   k/WdmSlJHtncgtADF2LK7YnAKcBQuBbrq6JB3kQN7ytxl3juF2vT0eUD/
   7W70cqMsof8c1mNmIyCMn6pxWvZoJTpxdE/3dZqPTEUD9Ya3VeCVFOlSN
   CZC/RWZMwPGLlUzNcvikI43bor+YCQzftIK8flDitnnp8I6aPq83oKFRV
   LiLjgt5kMtcpeb04XN/XjEG5kAemQbrw61ZBpG+13g4tJgcpTYBWlfZ/v
   TufKD2Dh2GhEF3wqZXQc94qqaoPAF48/k13ncEcIFKeivJ5CYaCJZ1cys
   g==;
X-CSE-ConnectionGUID: wSBgDZYIRQK+pWEGQBEa3A==
X-CSE-MsgGUID: +y9oYrmLTQSytetMmEdndw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55761061"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="55761061"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:30:25 -0700
X-CSE-ConnectionGUID: wkKUymayTAS40yqOEwryDQ==
X-CSE-MsgGUID: OGQ8kszHSyON6bAdLgdkag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133529653"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Apr 2025 09:30:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2Bq7-0007hf-2u;
	Tue, 08 Apr 2025 16:30:19 +0000
Date: Wed, 09 Apr 2025 00:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-split-phy] BUILD REGRESSION
 31d82c3b3b8782ff326a188f2ae78d3d9f333448
Message-ID: <202504090003.ewxZQSyb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_093027_583947_291F4B59 
X-CRM114-Status: UNSURE (   3.53  )
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
branch HEAD: 31d82c3b3b8782ff326a188f2ae78d3d9f333448  wifi: ath12k: Avoid allocating rx_stats when ext_rx_stats is disabled

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202503151013.F71WON7c-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202503151644.yfAQJbDP-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202504081054.5RQgJOIZ-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202504081251.hX88VR4a-lkp@intel.com

    drivers/net/wireless/ath/ath12k/reg.c:243:11: warning: variable 'band' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:243:11: warning: variable 'band' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:245:13: warning: variable 'freq_high' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:245:13: warning: variable 'freq_high' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:245:13: warning: variable 'freq_low' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:245:13: warning: variable 'freq_low' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:249:11: warning: variable 'band' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:249:11: warning: variable 'band' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:269:13: warning: variable 'freq_high' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:269:13: warning: variable 'freq_high' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:269:13: warning: variable 'freq_low' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    drivers/net/wireless/ath/ath12k/reg.c:269:13: warning: variable 'freq_low' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
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
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-if-condition-is-false
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
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-if-condition-is-false
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
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-if-condition-is-false
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
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-if-condition-is-false
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
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-if-condition-is-false
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
|-- x86_64-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-band-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_high-is-used-uninitialized-whenever-if-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-condition-is-false
|   |-- drivers-net-wireless-ath-ath12k-reg.c:warning:variable-freq_low-is-used-uninitialized-whenever-if-condition-is-false
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
`-- x86_64-buildonly-randconfig-001-20250408
    `-- drivers-net-wireless-ath-wcn36xx-main.c:error:field-designator-sta_statistics-does-not-refer-to-any-field-in-type-const-struct-ieee80211_ops

elapsed time: 1470m

configs tested: 110
configs skipped: 1

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250408    gcc-14.2.0
arc                   randconfig-002-20250408    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250408    clang-21
arm                   randconfig-002-20250408    gcc-10.5.0
arm                   randconfig-003-20250408    clang-17
arm                   randconfig-004-20250408    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250408    clang-21
arm64                 randconfig-002-20250408    gcc-9.5.0
arm64                 randconfig-003-20250408    gcc-9.5.0
arm64                 randconfig-004-20250408    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250408    gcc-14.2.0
csky                  randconfig-002-20250408    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250408    clang-21
hexagon               randconfig-002-20250408    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250408    clang-20
i386        buildonly-randconfig-002-20250408    clang-20
i386        buildonly-randconfig-003-20250408    gcc-12
i386        buildonly-randconfig-004-20250408    gcc-12
i386        buildonly-randconfig-005-20250408    gcc-12
i386        buildonly-randconfig-006-20250408    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250408    gcc-14.2.0
loongarch             randconfig-002-20250408    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250408    gcc-13.3.0
nios2                 randconfig-002-20250408    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250408    gcc-6.5.0
parisc                randconfig-002-20250408    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250408    gcc-5.5.0
powerpc               randconfig-002-20250408    gcc-9.3.0
powerpc               randconfig-003-20250408    gcc-5.5.0
powerpc64             randconfig-001-20250408    clang-21
powerpc64             randconfig-002-20250408    gcc-5.5.0
powerpc64             randconfig-003-20250408    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250408    gcc-9.3.0
riscv                 randconfig-002-20250408    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250408    gcc-8.5.0
s390                  randconfig-002-20250408    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250408    gcc-13.3.0
sh                    randconfig-002-20250408    gcc-13.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250408    gcc-10.3.0
sparc                 randconfig-002-20250408    gcc-6.5.0
sparc64               randconfig-001-20250408    gcc-6.5.0
sparc64               randconfig-002-20250408    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250408    clang-21
um                    randconfig-002-20250408    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250408    clang-20
x86_64      buildonly-randconfig-002-20250408    clang-20
x86_64      buildonly-randconfig-003-20250408    clang-20
x86_64      buildonly-randconfig-004-20250408    gcc-12
x86_64      buildonly-randconfig-005-20250408    clang-20
x86_64      buildonly-randconfig-006-20250408    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250408    gcc-6.5.0
xtensa                randconfig-002-20250408    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

