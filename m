Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE985C5475B
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19z4ZhgMG7r/2LQo9EMckokBcKVD/D2zmJQS3RGmTA4=; b=21J0wpQJ+0BCHthfqN+6rIQERm
	ibFZ0brA3/2pIRB4sVo8RRWM7LiF4jseVPrPoB1ElMI9BNhY7LYrqaQIeVV+f7nM4Lws+TG9PzPpF
	N1d9/z4VJ0Z9Z0LBtheC2X7zEgMMD/j9y+vicxrfJISfcgic2X1umT8c+eEeEgsY5uziG/JAtxBz/
	gW6XJ0O01tzoyMifjTaAGAz7NB9Ii21kLmtdLJtGPLI1Hu++1qcJU6HRZlvmIXbzFyZkUYiAXa0AP
	/7DOq728fozxLqxAL8dkv3reD61ibhUel6LxAu27d1vLMWD17T4QyswQuaPJ98BWslac1FyG642pu
	RGqMT9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkiCT-0000000Dssh-2H6V
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 10:20:37 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkiCQ-0000000DssF-1VwF
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 10:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710411635; x=1741947635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q40t2apZMO7d2J09faoTKTeEJycl4UQXXRiMphUtsZA=;
  b=CO9ugBSncREzZm6Ycrql1+l9Xj9vS1eEEHQCDbhRnj2Hv62NNgx7NQru
   8vNf4Kc5N4pwN9IaYD4yGE3eN1bEKFtjlSTBJV1/UnFaoYvtIx2n6tKPR
   VfQJO/1LpeYuOlXWOYalJjpRWaO4t+0yb0xmMD3kk/N7BAVmXpoi57Xh5
   NXxoQw+qEa4fgD3dXF7FBoj7oqSfJC1aFqsOCfYKPYw9EBVjS7c36+CLe
   w1u+ZzpIVjrSgmhvpo+vx7BYBbKtxerKdv3GL9rd+EUhqJRlxLMXf9CBs
   UeN9LZQJaz9KQMkjxNX9MsJaAbWRlV01f4tnf5Id2vGsyof7NbqW9MYR9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5343413"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5343413"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 03:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="12312950"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Mar 2024 03:18:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkiAH-000DKZ-2l;
	Thu, 14 Mar 2024 10:18:21 +0000
Date: Thu, 14 Mar 2024 18:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	ath12k@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	Sriram R <quic_srirrama@quicinc.com>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: Re: [PATCH v4 04/12] wifi: ath12k: vdev statemachine changes for
 single wiphy
Message-ID: <202403141850.4ccwnsut-lkp@intel.com>
References: <20240312135557.1778379-5-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312135557.1778379-5-quic_ramess@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_032034_526902_4605AFDF 
X-CRM114-Status: GOOD (  14.45  )
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

Hi Rameshkumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvalo-ath/ath-next]
[also build test WARNING on wireless/main wireless-next/main linus/master next-20240314]
[cannot apply to v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rameshkumar-Sundaram/wifi-ath12k-add-multiple-radio-support-in-a-single-MAC-HW-un-register/20240312-215924
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
patch link:    https://lore.kernel.org/r/20240312135557.1778379-5-quic_ramess%40quicinc.com
patch subject: [PATCH v4 04/12] wifi: ath12k: vdev statemachine changes for single wiphy
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240314/202403141850.4ccwnsut-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141850.4ccwnsut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141850.4ccwnsut-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
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
   In file included from drivers/net/wireless/ath/ath12k/mac.c:7:
   In file included from include/net/mac80211.h:20:
   In file included from include/linux/ieee80211.h:20:
   In file included from include/linux/etherdevice.h:21:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:9:
   In file included from include/linux/security.h:35:
   include/linux/bpf.h:742:48: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     742 |         ARG_PTR_TO_MAP_VALUE_OR_NULL    = PTR_MAYBE_NULL | ARG_PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:743:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     743 |         ARG_PTR_TO_MEM_OR_NULL          = PTR_MAYBE_NULL | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:744:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     744 |         ARG_PTR_TO_CTX_OR_NULL          = PTR_MAYBE_NULL | ARG_PTR_TO_CTX,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:745:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     745 |         ARG_PTR_TO_SOCKET_OR_NULL       = PTR_MAYBE_NULL | ARG_PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:746:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     746 |         ARG_PTR_TO_STACK_OR_NULL        = PTR_MAYBE_NULL | ARG_PTR_TO_STACK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   include/linux/bpf.h:747:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     747 |         ARG_PTR_TO_BTF_ID_OR_NULL       = PTR_MAYBE_NULL | ARG_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:751:38: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     751 |         ARG_PTR_TO_UNINIT_MEM           = MEM_UNINIT | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:753:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     753 |         ARG_PTR_TO_FIXED_SIZE_MEM       = MEM_FIXED_SIZE | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:776:48: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     776 |         RET_PTR_TO_MAP_VALUE_OR_NULL    = PTR_MAYBE_NULL | RET_PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:777:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     777 |         RET_PTR_TO_SOCKET_OR_NULL       = PTR_MAYBE_NULL | RET_PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:778:47: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     778 |         RET_PTR_TO_TCP_SOCK_OR_NULL     = PTR_MAYBE_NULL | RET_PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:779:50: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     779 |         RET_PTR_TO_SOCK_COMMON_OR_NULL  = PTR_MAYBE_NULL | RET_PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:781:49: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     781 |         RET_PTR_TO_DYNPTR_MEM_OR_NULL   = PTR_MAYBE_NULL | RET_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:782:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     782 |         RET_PTR_TO_BTF_ID_OR_NULL       = PTR_MAYBE_NULL | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:783:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     783 |         RET_PTR_TO_BTF_ID_TRUSTED       = PTR_TRUSTED    | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~    ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:894:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     894 |         PTR_TO_MAP_VALUE_OR_NULL        = PTR_MAYBE_NULL | PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   include/linux/bpf.h:895:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     895 |         PTR_TO_SOCKET_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/linux/bpf.h:896:46: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     896 |         PTR_TO_SOCK_COMMON_OR_NULL      = PTR_MAYBE_NULL | PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:897:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     897 |         PTR_TO_TCP_SOCK_OR_NULL         = PTR_MAYBE_NULL | PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   include/linux/bpf.h:898:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     898 |         PTR_TO_BTF_ID_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/mac.c:6038:54: warning: variable 'bit' is uninitialized when used here [-Wuninitialized]
    6038 |                 ath12k_warn(ab, "failed to create vdev %d ret %d", bit, ret);
         |                                                                    ^~~
   drivers/net/wireless/ath/ath12k/mac.c:6001:8: note: initialize the variable 'bit' to silence this warning
    6001 |         u8 bit;
         |               ^
         |                = '\0'
   26 warnings generated.


vim +/bit +6038 drivers/net/wireless/ath/ath12k/mac.c

  5991	
  5992	static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
  5993							    struct ieee80211_vif *vif,
  5994							    struct ieee80211_chanctx_conf *ctx)
  5995	{
  5996		struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
  5997		struct ath12k_hw *ah = hw->priv;
  5998		struct ath12k_base *ab;
  5999		struct ath12k *ar;
  6000		int ret;
  6001		u8 bit;
  6002	
  6003		if (arvif->ar) {
  6004			WARN_ON(!arvif->is_created);
  6005			goto out;
  6006		}
  6007	
  6008		if (ah->num_radio == 1)
  6009			ar = ah->radio;
  6010		else if (ctx)
  6011			ar = ath12k_get_ar_by_ctx(hw, ctx);
  6012		else
  6013			return NULL;
  6014	
  6015		if (!ar)
  6016			goto out;
  6017	
  6018		ab = ar->ab;
  6019	
  6020		mutex_lock(&ar->conf_mutex);
  6021	
  6022		if (vif->type == NL80211_IFTYPE_AP &&
  6023		    ar->num_peers > (ar->max_num_peers - 1)) {
  6024			ath12k_warn(ab, "failed to create vdev due to insufficient peer entry resource in firmware\n");
  6025			ret = -ENOBUFS;
  6026			goto unlock;
  6027		}
  6028	
  6029		if (ar->num_created_vdevs > (TARGET_NUM_VDEVS - 1)) {
  6030			ath12k_warn(ab, "failed to create vdev, reached max vdev limit %d\n",
  6031				    TARGET_NUM_VDEVS);
  6032			ret = -EBUSY;
  6033			goto unlock;
  6034		}
  6035	
  6036		ret = ath12k_mac_vdev_create(ar, vif);
  6037		if (ret) {
> 6038			ath12k_warn(ab, "failed to create vdev %d ret %d", bit, ret);
  6039			goto unlock;
  6040		}
  6041	
  6042		/* TODO If the vdev is created during channel assign and not during
  6043		 * add_interface(), Apply any parameters for the vdev which were received
  6044		 * after add_interface, corresponding to this vif.
  6045		 */
  6046	unlock:
  6047		mutex_unlock(&ar->conf_mutex);
  6048	out:
  6049		return arvif->ar;
  6050	}
  6051	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

