Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A7DCD128A
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 23:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnGP+fXueKRTQPkFEnw+1WL16/ezxN9tReae+d970oA=; b=LqabHp2FYjjG0/f4oYSKKnqBm4
	+L1IfKOVf5GwwLXL2idh2InhKYI8MfMp1SS2Glark9nK5FjiTHb9SV6h5MJSoCi5fRJjAG55cHJYJ
	+w8LHYPblb+Z9gxGlhmIH08POC0IQWczc9RzVk0cKhBNTqYL2zhyXYy3sLg7B5A5SUjOcv1he9PuR
	l0nl5KbbVTMX1BhscyptB+HJRLY8VyRXSTKZtpmIKehokk3niJHoy2YoJ8hrk81Rig4Yk0s9qlPQJ
	jJlCt4bDbRY16V5aBzVCFrcNrYPYj6DzNVhS3bNRFmH+wPWDIDMivZRdD8DcEtFATfsjh8Ph9dKBp
	WEXyD8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpzPH-0000000G6pp-1tXH
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 23:43:39 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpzPD-0000000G6pI-1ehr
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 23:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711669415; x=1743205415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I/WZfIyNxjJxFKhS5s+O6KXilxr0kqvm8WeoL63ejdo=;
  b=VO+vQuixs6zfOqoE2fQ2cUG4HUibAYtXifoc5cYmgv84IOG3KONI3iJh
   awdj3+jIbUoH/ZX9jW5RpU0eEWNgnwYJ/UDeDTITSzjd1ebUtacTReXsq
   YW+R8nlFHL4tPKgGRem5LiMGpRN79AgFsKZLg3j+NiUx1ZPpLMSeQxCi+
   69OtwnvcdliP60Ib7etIicrfrECnpj4D5RSjqUH4910viPtg5+P0ljBdM
   qYYPN/12KZY4mua/1ZdctfrOdYEvViH+IOR3hN984StPFIwlcJtVo/6h6
   zBwCBnZMm/nCDOeX1FZLcKJ0YuMyMc2/T98JG8Bz6OrkFuxQJBUbJJyHz
   g==;
X-CSE-ConnectionGUID: a2np6OSxRUO/80yDlubyqA==
X-CSE-MsgGUID: OJNyIvJVS9+MokiAW1xzag==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6689762"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6689762"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 16:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="47777412"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2024 16:43:27 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpzP2-0002d0-15;
	Thu, 28 Mar 2024 23:43:24 +0000
Date: Fri, 29 Mar 2024 07:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	ath12k@lists.infradead.org, johannes@sipsolutions.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	Harshitha Prem <quic_hprem@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: Re: [PATCH 13/13] wifi: ath12k: Advertise multi hardware iface
 combination
Message-ID: <202403290724.p8vSV474-lkp@intel.com>
References: <20240328072916.1164195-14-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328072916.1164195-14-quic_periyasa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_164335_478509_B9A0ADC1 
X-CRM114-Status: GOOD (  11.72  )
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

Hi Karthikeyan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d69aef8084cc72df7b0f2583096d9b037c647ec8]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikeyan-Periyasamy/wifi-cfg80211-Add-provision-to-advertise-multiple-radio-in-one-wiphy/20240328-153303
base:   d69aef8084cc72df7b0f2583096d9b037c647ec8
patch link:    https://lore.kernel.org/r/20240328072916.1164195-14-quic_periyasa%40quicinc.com
patch subject: [PATCH 13/13] wifi: ath12k: Advertise multi hardware iface combination
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240329/202403290724.p8vSV474-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290724.p8vSV474-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290724.p8vSV474-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/mac.c:7:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/mac.c:7795:11: warning: variable 'band' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    7795 |         else if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP &&
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    7796 |                  ar->supports_6ghz)
         |                  ~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/mac.c:7799:44: note: uninitialized use occurs here
    7799 |         chans = kzalloc(struct_size(chans, chans, band->n_channels),
         |                                                   ^~~~
   include/linux/overflow.h:294:53: note: expanded from macro 'struct_size'
     294 |                 size_add(sizeof(*(p)), flex_array_size(p, member, count)))
         |                                                                   ^~~~~
   include/linux/overflow.h:278:12: note: expanded from macro 'flex_array_size'
     278 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   drivers/net/wireless/ath/ath12k/mac.c:7795:7: note: remove the 'if' if its condition is always true
    7795 |         else if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP &&
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    7796 |                  ar->supports_6ghz)
         |                  ~~~~~~~~~~~~~~~~~~
    7797 |                 band = &ar->mac.sbands[NL80211_BAND_6GHZ];
>> drivers/net/wireless/ath/ath12k/mac.c:7795:11: warning: variable 'band' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    7795 |         else if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP &&
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/mac.c:7799:44: note: uninitialized use occurs here
    7799 |         chans = kzalloc(struct_size(chans, chans, band->n_channels),
         |                                                   ^~~~
   include/linux/overflow.h:294:53: note: expanded from macro 'struct_size'
     294 |                 size_add(sizeof(*(p)), flex_array_size(p, member, count)))
         |                                                                   ^~~~~
   include/linux/overflow.h:278:12: note: expanded from macro 'flex_array_size'
     278 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   drivers/net/wireless/ath/ath12k/mac.c:7795:11: note: remove the '&&' if its condition is always true
    7795 |         else if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP &&
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/mac.c:7788:39: note: initialize the variable 'band' to silence this warning
    7788 |         struct ieee80211_supported_band *band;
         |                                              ^
         |                                               = NULL
   7 warnings generated.


vim +7795 drivers/net/wireless/ath/ath12k/mac.c

  7783	
  7784	static
  7785	struct ieee80211_chans_per_hw *ath12k_setup_per_hw_chan(struct ath12k *ar)
  7786	{
  7787		struct ieee80211_chans_per_hw *chans;
  7788		struct ieee80211_supported_band *band;
  7789	
  7790		if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_2G_CAP)
  7791			band = &ar->mac.sbands[NL80211_BAND_2GHZ];
  7792		else if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP &&
  7793			 !ar->supports_6ghz)
  7794			band = &ar->mac.sbands[NL80211_BAND_5GHZ];
> 7795		else if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP &&
  7796			 ar->supports_6ghz)
  7797			band = &ar->mac.sbands[NL80211_BAND_6GHZ];
  7798	
  7799		chans = kzalloc(struct_size(chans, chans, band->n_channels),
  7800				GFP_KERNEL);
  7801		if (!chans)
  7802			return NULL;
  7803	
  7804		memcpy(chans->chans, band->channels,
  7805		       sizeof(*band->channels) * band->n_channels);
  7806		chans->n_chans = band->n_channels;
  7807	
  7808		return chans;
  7809	}
  7810	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

