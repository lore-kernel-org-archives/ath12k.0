Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B7CC02180
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 23:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIrd1fElu6xAPtb9/EFjY3DnsYgKHDvrqg/kUV7zqAg=; b=QLTWMYi4LnvW72yki+p+n/ylup
	2B9C+A6GJ18eTYF9Ra6HvASlcJs9JIjAMZ1qIrEIp1GaW0sGVW0i8U75VW1m7gmpeTiZTpgDTOQLp
	cbm6NwL9oCNDlyNs9hYpnm136WiVNACrGsVsK7hgQO4kMT/k9x9iPs50OPWNu4L7gj2YFU6ZuPqqE
	AixpYeZ9m+G7lHvzJVk0qBgPGTVT6UwsHPbnjk8HLB5FxxyANKzhhPOPln7YoOQtu+DFccT7uUPZA
	rssw2aJXUf3u5qnpZhvSLEXowBGVANezRpe7t8RR3V8iA5boOVxXsRr3LI6idefAF9ap0x3d5SrKP
	Gh1Yaetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCdr-0000000DKei-29jy
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 23:17:43 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCdo-0000000DKdm-1zL7;
	Wed, 15 Jan 2025 23:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736983061; x=1768519061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KpiWwHPBU8cn7bfIaWcZtYTJFTB9Ri7oDlqiBOCgGzY=;
  b=mRq/VM+Ap05sBtP9Ua3oni82lCjmRn6xsm6Mrl2A3oL7LUnEFQp7tioJ
   XP2LUV/pR7CabmEWQZCtaExuX5pBF2mERg3H1RPiJkonDucYtHKXuNlpc
   aAMDwb1m5iNe8rTcBugXkKrMA8TrWwLb81jE0WdEJPn1sc8VEgDKtFATl
   ilATVkE2c7Vf0ekLc+vkSbE9QU4KB68f07O83hn78Rc9/VT9roKAesXY8
   Q1XSrARYlG/orX2H9znKaQL7pBanrG/FNyB3nYmrEGpjjTL858Oypolkk
   dp0A6KDbjqCONH65HrjWyVX08oMPRTxz89xhqKHp1IlwaRxFJuZHeMe9V
   A==;
X-CSE-ConnectionGUID: OhyPwNdaQmuAb8aRF8o+kA==
X-CSE-MsgGUID: DN2fokGWTb27soz5LZft3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48734520"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="48734520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 15:17:37 -0800
X-CSE-ConnectionGUID: kgZIbBxjQdGjPvS6DawAcQ==
X-CSE-MsgGUID: TS12OjrKSU+x5+ILfGs6PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="110266871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jan 2025 15:17:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYCdg-000QzP-2Y;
	Wed, 15 Jan 2025 23:17:32 +0000
Date: Thu, 16 Jan 2025 07:16:46 +0800
From: kernel test robot <lkp@intel.com>
To: Aloka Dixit <quic_alokad@quicinc.com>, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Aloka Dixit <quic_alokad@quicinc.com>
Subject: Re: [PATCH 1/5] wifi: ath11k: refactor transmitted arvif retrieval
Message-ID: <202501160626.Jbb3GHnk-lkp@intel.com>
References: <20250114223612.2979310-2-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114223612.2979310-2-quic_alokad@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_151740_588638_11E4DE0D 
X-CRM114-Status: GOOD (  10.19  )
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

Hi Aloka,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0c5fcd9069dd5f984e39820629acbfbe0f1b4256]

url:    https://github.com/intel-lab-lkp/linux/commits/Aloka-Dixit/wifi-ath11k-refactor-transmitted-arvif-retrieval/20250115-063922
base:   0c5fcd9069dd5f984e39820629acbfbe0f1b4256
patch link:    https://lore.kernel.org/r/20250114223612.2979310-2-quic_alokad%40quicinc.com
patch subject: [PATCH 1/5] wifi: ath11k: refactor transmitted arvif retrieval
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250116/202501160626.Jbb3GHnk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160626.Jbb3GHnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160626.Jbb3GHnk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/mac.c:6349:46: warning: variable 'tx_vif' is uninitialized when used here [-Wuninitialized]
    6349 |                 if (ar->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
         |                                                            ^~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:6339:30: note: initialize the variable 'tx_vif' to silence this warning
    6339 |         struct ieee80211_vif *tx_vif;
         |                                     ^
         |                                      = NULL
   1 warning generated.


vim +/tx_vif +6349 drivers/net/wireless/ath/ath11k/mac.c

d5c65159f28953 Kalle Valo  2019-11-23  6333  
5a81610acf66c4 Aloka Dixit 2023-05-05  6334  static int ath11k_mac_setup_vdev_params_mbssid(struct ath11k_vif *arvif,
5a81610acf66c4 Aloka Dixit 2023-05-05  6335  					       u32 *flags, u32 *tx_vdev_id)
5a81610acf66c4 Aloka Dixit 2023-05-05  6336  {
5a81610acf66c4 Aloka Dixit 2023-05-05  6337  	struct ath11k *ar = arvif->ar;
5a81610acf66c4 Aloka Dixit 2023-05-05  6338  	struct ath11k_vif *tx_arvif;
5a81610acf66c4 Aloka Dixit 2023-05-05  6339  	struct ieee80211_vif *tx_vif;
5a81610acf66c4 Aloka Dixit 2023-05-05  6340  
5a81610acf66c4 Aloka Dixit 2023-05-05  6341  	*tx_vdev_id = 0;
72f88bc503a76c Aloka Dixit 2025-01-14  6342  	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
72f88bc503a76c Aloka Dixit 2025-01-14  6343  	if (!tx_arvif) {
5a81610acf66c4 Aloka Dixit 2023-05-05  6344  		*flags = WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP;
5a81610acf66c4 Aloka Dixit 2023-05-05  6345  		return 0;
5a81610acf66c4 Aloka Dixit 2023-05-05  6346  	}
5a81610acf66c4 Aloka Dixit 2023-05-05  6347  
5a81610acf66c4 Aloka Dixit 2023-05-05  6348  	if (arvif->vif->bss_conf.nontransmitted) {
5a81610acf66c4 Aloka Dixit 2023-05-05 @6349  		if (ar->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
5a81610acf66c4 Aloka Dixit 2023-05-05  6350  			return -EINVAL;
5a81610acf66c4 Aloka Dixit 2023-05-05  6351  
5a81610acf66c4 Aloka Dixit 2023-05-05  6352  		*flags = WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP;
5a81610acf66c4 Aloka Dixit 2023-05-05  6353  		*tx_vdev_id = ath11k_vif_to_arvif(tx_vif)->vdev_id;
5a81610acf66c4 Aloka Dixit 2023-05-05  6354  	} else if (tx_arvif == arvif) {
5a81610acf66c4 Aloka Dixit 2023-05-05  6355  		*flags = WMI_HOST_VDEV_FLAGS_TRANSMIT_AP;
5a81610acf66c4 Aloka Dixit 2023-05-05  6356  	} else {
5a81610acf66c4 Aloka Dixit 2023-05-05  6357  		return -EINVAL;
5a81610acf66c4 Aloka Dixit 2023-05-05  6358  	}
5a81610acf66c4 Aloka Dixit 2023-05-05  6359  
5a81610acf66c4 Aloka Dixit 2023-05-05  6360  	if (arvif->vif->bss_conf.ema_ap)
5a81610acf66c4 Aloka Dixit 2023-05-05  6361  		*flags |= WMI_HOST_VDEV_FLAGS_EMA_MODE;
5a81610acf66c4 Aloka Dixit 2023-05-05  6362  
5a81610acf66c4 Aloka Dixit 2023-05-05  6363  	return 0;
5a81610acf66c4 Aloka Dixit 2023-05-05  6364  }
5a81610acf66c4 Aloka Dixit 2023-05-05  6365  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

