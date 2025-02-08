Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92672C02198
	for <ath12k@archiver.kernel.org>; Sat,  8 Feb 2025 04:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVRkZ5FPbEVUaS6O5yctEdv7vh7VQn6uShjcmy4Yau8=; b=0GZus8OWeVMbfzYItV7DjFGUgK
	u4XvQNqPNmOO82eR4eMvS20lNXyOlfNXawxA0Z/+SgI03Mf831zKCrahFIrGV8CcY0saebPqN7BoQ
	YT9L8XuCjHt/EapVeTlZf8OiGnHJRjISjyUN4bC2/1gVIz64Cj2RiUe2nYz7VfDSzWAV44aKGRWab
	n0h3aUZfk5d063TOyGnbylV3VI4eph35YkeJCZriRQNImb9ZgXRSYQ7u2H4twVDwQlezEEELiddpt
	u9jaAva5w/Fk0B4mTRtT176E6uQhf6Nk293uuAY/rfSKuAFwNssvikH/iMT7cJtgc6L0+s6BTdBgC
	d76CRoog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgciJ-0000000C8AN-1NoX
	for ath12k@archiver.kernel.org;
	Sat, 08 Feb 2025 04:45:07 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgciG-0000000C89p-26OF
	for ath12k@lists.infradead.org;
	Sat, 08 Feb 2025 04:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738989905; x=1770525905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GvYQaLiDW/yeR5mK5o7wYWIt7Bg9kP22YSV3dyDsULc=;
  b=ZrjytY7vNz0HwdCO1SNi2CWMAF5+xKtLj7r4ZhA4AoipM+Y2KWzoB1zz
   DVh4HmHqMt11MCOxYQrTmfuZzE9XdtLZm44b+/O+Nwou/6dHcYA4MxbLR
   znpnCWD9aXKSney2jLH1VRm4FF5veaQEFI/1JwqBJLjdNr1xtD84tEbG1
   NIEMw/0dx9AEGA0NYX+g8prPLkkYOELaGT8L80QMQK9cairm+46OEzBGp
   e6YIbb5YmU4ahMiGRnOM+MH/2U6vo0Quv+4BkOrBWxhTXu5XIQgEbAGmv
   8soxqbQWzjWXAb91yOM2BoiDfwQHDa1X3y/48xSk047ogAHRxf8hoI0Nz
   A==;
X-CSE-ConnectionGUID: F7g5jW7kSQeEM9KtaROjVw==
X-CSE-MsgGUID: fNLe2x+RQn+0dGRttoPk3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43401130"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="43401130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 20:45:02 -0800
X-CSE-ConnectionGUID: WgkKndJ3Qt+uoB/ZP1d8IA==
X-CSE-MsgGUID: ZlKvYrhsSNuso87MzZFjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116646881"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2025 20:45:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgci9-000zXH-34;
	Sat, 08 Feb 2025 04:44:57 +0000
Date: Sat, 8 Feb 2025 12:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org, quic_lingbok@quicinc.com
Subject: Re: [PATCH] wifi: ath12k: report station mode per-chain signal
 strength
Message-ID: <202502081250.6rZZ2s6H-lkp@intel.com>
References: <20250207071003.162576-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207071003.162576-1-quic_lingbok@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_204504_614537_BFEC0B0D 
X-CRM114-Status: GOOD (  10.41  )
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

Hi Lingbo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d132a72d768bae74d10e6539fcf6522dfdbd1115]

url:    https://github.com/intel-lab-lkp/linux/commits/Lingbo-Kong/wifi-ath12k-report-station-mode-per-chain-signal-strength/20250207-151239
base:   d132a72d768bae74d10e6539fcf6522dfdbd1115
patch link:    https://lore.kernel.org/r/20250207071003.162576-1-quic_lingbok%40quicinc.com
patch subject: [PATCH] wifi: ath12k: report station mode per-chain signal strength
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250208/202502081250.6rZZ2s6H-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081250.6rZZ2s6H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081250.6rZZ2s6H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/wmi.c:6:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/wmi.c:7550:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    7550 |         default:
         |         ^
   drivers/net/wireless/ath/ath12k/wmi.c:7550:2: note: insert 'break;' to avoid fall-through
    7550 |         default:
         |         ^
         |         break; 
   4 warnings generated.


vim +7550 drivers/net/wireless/ath/ath12k/wmi.c

1715fcabad1648 Lingbo Kong 2025-02-07  7520  
79e7b04b5388c1 Lingbo Kong 2025-01-15  7521  static int ath12k_wmi_tlv_fw_stats_parse(struct ath12k_base *ab,
79e7b04b5388c1 Lingbo Kong 2025-01-15  7522  					 u16 tag, u16 len,
79e7b04b5388c1 Lingbo Kong 2025-01-15  7523  					 const void *ptr, void *data)
79e7b04b5388c1 Lingbo Kong 2025-01-15  7524  {
79e7b04b5388c1 Lingbo Kong 2025-01-15  7525  	struct wmi_tlv_fw_stats_parse *parse = data;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7526  	int ret = 0;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7527  
79e7b04b5388c1 Lingbo Kong 2025-01-15  7528  	switch (tag) {
79e7b04b5388c1 Lingbo Kong 2025-01-15  7529  	case WMI_TAG_STATS_EVENT:
79e7b04b5388c1 Lingbo Kong 2025-01-15  7530  		parse->ev = ptr;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7531  		break;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7532  	case WMI_TAG_ARRAY_BYTE:
79e7b04b5388c1 Lingbo Kong 2025-01-15  7533  		ret = ath12k_wmi_tlv_fw_stats_data_parse(ab, parse, ptr, len);
79e7b04b5388c1 Lingbo Kong 2025-01-15  7534  		break;
1715fcabad1648 Lingbo Kong 2025-02-07  7535  	case WMI_TAG_PER_CHAIN_RSSI_STATS:
1715fcabad1648 Lingbo Kong 2025-02-07  7536  		parse->rssi = ptr;
1715fcabad1648 Lingbo Kong 2025-02-07  7537  		if (le32_to_cpu(parse->ev->stats_id) & WMI_REQUEST_RSSI_PER_CHAIN_STAT)
1715fcabad1648 Lingbo Kong 2025-02-07  7538  			parse->rssi_num = le32_to_cpu(parse->rssi->num_per_chain_rssi);
1715fcabad1648 Lingbo Kong 2025-02-07  7539  		break;
1715fcabad1648 Lingbo Kong 2025-02-07  7540  	case WMI_TAG_ARRAY_STRUCT:
1715fcabad1648 Lingbo Kong 2025-02-07  7541  		if (parse->rssi_num && !parse->chain_rssi_done) {
1715fcabad1648 Lingbo Kong 2025-02-07  7542  			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
1715fcabad1648 Lingbo Kong 2025-02-07  7543  						  ath12k_wmi_tlv_rssi_chain_parse,
1715fcabad1648 Lingbo Kong 2025-02-07  7544  						  parse);
1715fcabad1648 Lingbo Kong 2025-02-07  7545  			if (ret)
1715fcabad1648 Lingbo Kong 2025-02-07  7546  				return ret;
1715fcabad1648 Lingbo Kong 2025-02-07  7547  
1715fcabad1648 Lingbo Kong 2025-02-07  7548  			parse->chain_rssi_done = true;
1715fcabad1648 Lingbo Kong 2025-02-07  7549  		}
79e7b04b5388c1 Lingbo Kong 2025-01-15 @7550  	default:
79e7b04b5388c1 Lingbo Kong 2025-01-15  7551  		break;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7552  	}
79e7b04b5388c1 Lingbo Kong 2025-01-15  7553  	return ret;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7554  }
79e7b04b5388c1 Lingbo Kong 2025-01-15  7555  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

