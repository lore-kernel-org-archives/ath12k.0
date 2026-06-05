Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A3ACD6E5D
	for <ath12k@archiver.kernel.org>; Fri,  5 Jun 2026 05:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xxyOkJpBXGksy2IZQsPgd8cl9F/yMZVrKdjNtJnc8iM=; b=MCsEXgLACXKrxj48QL4hXLvJyb
	JE9UL9C1Y7ClNheYQMeM/gSwzyAMCLG8ihMgP6imd8rDZntghqi45rcdgzzk+p8SILzjGqxOpsFOB
	kJ5z/LACBeFdO5YLhG7B1DetueAM37BJKji8GXkGXJ6BNpcYDBoLLr4HFkXdprvHZGQUr9+8UCEWW
	KBdr6JTRHEVyyVQsii3busflCivUkkz/sPskXXOKUozp6SGbgYT9vbuFvZARdskXeMkcIWvwCySwb
	O7biTg4Td3eXovjo69Q32CSKf/JveyNkASvWPso89NCAKOYAC82DINjf2ZPPqIuy4kg0ZHnzPDE3a
	t9t+NU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNK3-000000007Fk-0yvb;
	Fri, 05 Jun 2026 05:42:23 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNJz-00000000795-2fwe
	for ath12k@lists.infradead.org;
	Fri, 05 Jun 2026 05:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780638140; x=1812174140;
  h=date:from:to:cc:subject:message-id;
  bh=QwVL5bnbAHg6L90NwksFlxa8HoQrIZVaGy9q5Tq4ZmY=;
  b=gxCB4Rpe05L4luhlrDohE9ExsTcHKVcFjmT15M8kWCwctOyCg8sumCB1
   Bo0qMq5OTVDCCuT0NSliFkHV7tBUn5tJa375Re+8VNZDSV+3SQ5jyvawr
   xtwksZISsisCYG3/qVcawx02wwfWVtfJeRw2kaMUaVTM9vFAp2/gUGSVD
   TYb/vv5/nfF+9GDFUT2zSiq8TkqFSKFOrGkxr5VqrW5RxQRHnqKUoFzWz
   iU5f7Mb+BDzdcr3/Ml19P3yGwRJxACkqdZ4LGeSzRxmpMgyBGdA5GgWiX
   Cqo6+oT7r4ns/fNu7RccL7d0PMXhNTOLMXGjALyzKmfDDkiyjcqO6xxHP
   g==;
X-CSE-ConnectionGUID: mCisUIaDTVW6eeff8yWywA==
X-CSE-MsgGUID: IxJH79yKQJqSRVfafr3wFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81470342"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81470342"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 22:40:18 -0700
X-CSE-ConnectionGUID: 7MXVQDgJQACoSDtNQYvOMQ==
X-CSE-MsgGUID: YUTNBXvFSjqMoJWq2mZYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249681379"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2026 22:40:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVNHw-00000000FZm-2ZA4;
	Fri, 05 Jun 2026 05:40:12 +0000
Date: Fri, 05 Jun 2026 13:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Johnson <jjohnson@kernel.org>,
 ath12k@lists.infradead.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [ath:master 2/4] net/wireless/nl80211.c:6993:41: error:
 'struct cfg80211_ap_settings' has no member named 'he_oper'
Message-ID: <202606051314.S2kES3SV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_224219_718677_532B99E7 
X-CRM114-Status: UNSURE (   7.38  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
head:   d54e5a797eebf0ef8c91f628aac578128b39a0b1
commit: da16cf9abfd30e79c6c7ed7c4f8bf8b1316b934b [2/4] Merge remote-tracking branch 'wireless-next/main'
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260605/202606051314.S2kES3SV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051314.S2kES3SV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051314.S2kES3SV-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/wireless/nl80211.c: In function 'nl80211_calculate_ap_capabilities':
>> net/wireless/nl80211.c:6993:41: error: 'struct cfg80211_ap_settings' has no member named 'he_oper'
    6993 |         if (!!params->he_cap != !!params->he_oper)
         |                                         ^~
>> net/wireless/nl80211.c:6996:42: error: 'struct cfg80211_ap_settings' has no member named 'eht_oper'
    6996 |         if (!!params->eht_cap != !!params->eht_oper)
         |                                          ^~


vim +6993 net/wireless/nl80211.c

7443dcd1f1718a Aloka Dixit   2020-09-11  6942  
66cd794e3c30b8 Johannes Berg 2017-02-07  6943  /*
66cd794e3c30b8 Johannes Berg 2017-02-07  6944   * Since the nl80211 API didn't include, from the beginning, attributes about
a384ae96990250 Johannes Berg 2026-04-15  6945   * HT/VHT/... capabilities, we parse them out of the elements and check for
a384ae96990250 Johannes Berg 2026-04-15  6946   * validity for use by drivers/mac80211.
66cd794e3c30b8 Johannes Berg 2017-02-07  6947   */
d642e759b73cbf Johannes Berg 2026-04-15  6948  static int nl80211_calculate_ap_capabilities(struct genl_info *info,
d642e759b73cbf Johannes Berg 2026-04-15  6949  					     struct cfg80211_ap_settings *params)
66cd794e3c30b8 Johannes Berg 2017-02-07  6950  {
a384ae96990250 Johannes Berg 2026-04-15  6951  	size_t ies_len = params->beacon.tail_len;
a384ae96990250 Johannes Berg 2026-04-15  6952  	const u8 *ies = params->beacon.tail;
153e2a11c99b73 Johannes Berg 2021-09-30  6953  	const struct element *cap;
66cd794e3c30b8 Johannes Berg 2017-02-07  6954  
153e2a11c99b73 Johannes Berg 2021-09-30  6955  	cap = cfg80211_find_elem(WLAN_EID_HT_CAPABILITY, ies, ies_len);
d642e759b73cbf Johannes Berg 2026-04-15  6956  	if (cap) {
d642e759b73cbf Johannes Berg 2026-04-15  6957  		if (cap->datalen < sizeof(*params->ht_cap)) {
d642e759b73cbf Johannes Berg 2026-04-15  6958  			GENL_SET_ERR_MSG(info, "bad HT capability in beacon");
d642e759b73cbf Johannes Berg 2026-04-15  6959  			return -EINVAL;
d642e759b73cbf Johannes Berg 2026-04-15  6960  		}
153e2a11c99b73 Johannes Berg 2021-09-30  6961  		params->ht_cap = (void *)cap->data;
d642e759b73cbf Johannes Berg 2026-04-15  6962  	}
d642e759b73cbf Johannes Berg 2026-04-15  6963  
153e2a11c99b73 Johannes Berg 2021-09-30  6964  	cap = cfg80211_find_elem(WLAN_EID_VHT_CAPABILITY, ies, ies_len);
d642e759b73cbf Johannes Berg 2026-04-15  6965  	if (cap) {
d642e759b73cbf Johannes Berg 2026-04-15  6966  		if (cap->datalen < sizeof(*params->vht_cap)) {
d642e759b73cbf Johannes Berg 2026-04-15  6967  			GENL_SET_ERR_MSG(info, "bad VHT capability in beacon");
d642e759b73cbf Johannes Berg 2026-04-15  6968  			return -EINVAL;
d642e759b73cbf Johannes Berg 2026-04-15  6969  		}
153e2a11c99b73 Johannes Berg 2021-09-30  6970  		params->vht_cap = (void *)cap->data;
d642e759b73cbf Johannes Berg 2026-04-15  6971  	}
d642e759b73cbf Johannes Berg 2026-04-15  6972  
153e2a11c99b73 Johannes Berg 2021-09-30  6973  	cap = cfg80211_find_ext_elem(WLAN_EID_EXT_HE_CAPABILITY, ies, ies_len);
d642e759b73cbf Johannes Berg 2026-04-15  6974  	if (cap) {
d642e759b73cbf Johannes Berg 2026-04-15  6975  		if (cap->datalen < sizeof(*params->he_cap) + 1) {
d642e759b73cbf Johannes Berg 2026-04-15  6976  			GENL_SET_ERR_MSG(info, "bad HE capability in beacon");
d642e759b73cbf Johannes Berg 2026-04-15  6977  			return -EINVAL;
d642e759b73cbf Johannes Berg 2026-04-15  6978  		}
153e2a11c99b73 Johannes Berg 2021-09-30  6979  		params->he_cap = (void *)(cap->data + 1);
d642e759b73cbf Johannes Berg 2026-04-15  6980  	}
d642e759b73cbf Johannes Berg 2026-04-15  6981  
8bc65d38ee4668 Aloka Dixit   2022-05-22  6982  	cap = cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_CAPABILITY, ies, ies_len);
8bc65d38ee4668 Aloka Dixit   2022-05-22  6983  	if (cap) {
8bc65d38ee4668 Aloka Dixit   2022-05-22  6984  		params->eht_cap = (void *)(cap->data + 1);
8bc65d38ee4668 Aloka Dixit   2022-05-22  6985  		if (!ieee80211_eht_capa_size_ok((const u8 *)params->he_cap,
8bc65d38ee4668 Aloka Dixit   2022-05-22  6986  						(const u8 *)params->eht_cap,
d642e759b73cbf Johannes Berg 2026-04-15  6987  						cap->datalen - 1, true)) {
d642e759b73cbf Johannes Berg 2026-04-15  6988  			GENL_SET_ERR_MSG(info, "bad EHT capability in beacon");
8bc65d38ee4668 Aloka Dixit   2022-05-22  6989  			return -EINVAL;
8bc65d38ee4668 Aloka Dixit   2022-05-22  6990  		}
8bc65d38ee4668 Aloka Dixit   2022-05-22  6991  	}
072e6f7f416f5d Johannes Berg 2026-01-30  6992  
cb9959ab5f9961 Johannes Berg 2026-06-03 @6993  	if (!!params->he_cap != !!params->he_oper)
cb9959ab5f9961 Johannes Berg 2026-06-03  6994  		return -EINVAL;
cb9959ab5f9961 Johannes Berg 2026-06-03  6995  
cb9959ab5f9961 Johannes Berg 2026-06-03 @6996  	if (!!params->eht_cap != !!params->eht_oper)
cb9959ab5f9961 Johannes Berg 2026-06-03  6997  		return -EINVAL;
cb9959ab5f9961 Johannes Berg 2026-06-03  6998  
8bc65d38ee4668 Aloka Dixit   2022-05-22  6999  	return 0;
66cd794e3c30b8 Johannes Berg 2017-02-07  7000  }
66cd794e3c30b8 Johannes Berg 2017-02-07  7001  

:::::: The code at line 6993 was first introduced by commit
:::::: cb9959ab5f99611d27a06586add84811fe8102dc wifi: cfg80211: enforce HE/EHT cap/oper consistency

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

