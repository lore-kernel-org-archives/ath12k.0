Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1DEC282C7
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGoYfacmVhPGF8jCIZLnWjml46t+qzOjPNutdAWxW28=; b=M4/dy0WLj/xw6mLqZJ2t/OHJu9
	OFFDs+JaamLtkXG772JLmJLAgHletmLxhN4AEdM89vpF8N2d6HJMvr8WlN/t+gSLMychHAWkeWpZL
	Rw6e3NDbLk1dmZAkuZU7M6RbKLa30+rqpxwioMbp/uvU9XDu7cn/IQwSjuL4yvvSUUB4D1/bYPwuP
	G0OfbdBJ43tKZ6RND0Tfr/WLxvmdCYFvXEyGgOxiNyXP1I0tDFlJWl2KBtJO4OcEuMh+jGB59Hb0E
	QzNhf9AJt+JacLfwEJNgHrPraMZA/mRUCYByK34TZBZ/skQGP6bDbIBXDVGpC2xwbasKe6a8edNOl
	2R+EvY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjnI-00000008f3z-3SfU
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 19:43:40 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjQV-00000008RIo-1Vk1
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 19:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740684007; x=1772220007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VofQ0MMFNn/3/peulSddBz10VHBiuJCK5GWnGS+Q5H0=;
  b=Phi3tXQ2o/TEvpAHQG00d2StAuvFZRIhAK1wloUuhnFdpusKd2Ex5RRO
   tHr3YqsXvEVYcC0E4v9ArVXsxIi/MUClgN9ByjyjDZUQ6i0z/JZ/vXOmR
   TiBlR3GR3SG3+p7fWDKzvYBe96GHB0I0/now7nRtN4jbhGkL60eBy8dEk
   WUcX4mKR28Zu5/cQgqErlRIY1n/RvR6cVa7vFSL5ui7HkHVpN/llqCm5W
   +luvb8uYwMw3XJaDsx84LPczWi63mo0zqqrihnF88UtqyFwA413Nxmp3S
   Y+VJqmj4cCUkyLC+rrnEUjftXe5DX9w6vvclD2he9LvHB6ZjDUgls3yzC
   w==;
X-CSE-ConnectionGUID: xCRn6uaFS9mXKUVUMb5vPQ==
X-CSE-MsgGUID: o2Kfx1JWQcuRPa0N8gle6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52228393"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="52228393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 11:20:02 -0800
X-CSE-ConnectionGUID: lbJBhQv4TaKW+I2N+pzi/w==
X-CSE-MsgGUID: UG5ljOKTSPyONnpcqJOy5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118042917"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Feb 2025 11:19:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnjQK-000Dvm-2O;
	Thu, 27 Feb 2025 19:19:56 +0000
Date: Fri, 28 Feb 2025 03:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
	ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: Re: [PATCH v6 07/13] wifi: ath12k: add support for fixed QMI
 firmware memory
Message-ID: <202502280215.J3T7EWeY-lkp@intel.com>
References: <20250225064834.2002499-8-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225064834.2002499-8-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_112007_453033_7AA2B99D 
X-CRM114-Status: GOOD (  13.26  )
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

Hi Raj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 13a84b4e7dd5d843dfaa54283adb4bbbe0adee15]

url:    https://github.com/intel-lab-lkp/linux/commits/Raj-Kumar-Bhagat/dt-bindings-net-wireless-describe-the-ath12k-AHB-module-for-IPQ5332/20250225-145536
base:   13a84b4e7dd5d843dfaa54283adb4bbbe0adee15
patch link:    https://lore.kernel.org/r/20250225064834.2002499-8-quic_rajkbhag%40quicinc.com
patch subject: [PATCH v6 07/13] wifi: ath12k: add support for fixed QMI firmware memory
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280215.J3T7EWeY-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280215.J3T7EWeY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280215.J3T7EWeY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/qmi.c:11:
   drivers/net/wireless/ath/ath12k/qmi.c: In function 'ath12k_qmi_assign_target_mem_chunk':
>> drivers/net/wireless/ath/ath12k/qmi.c:2677:44: warning: format '%lld' expects argument of type 'long long int', but argument 6 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    2677 |                                            "failed to assign mem type %d req size %d avail size %lld\n",
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ......
    2680 |                                            rmem->size);
         |                                            ~~~~~~~~~~
         |                                                |
         |                                                phys_addr_t {aka unsigned int}
   drivers/net/wireless/ath/ath12k/debug.h:69:40: note: in definition of macro 'ath12k_dbg'
      69 |                 __ath12k_dbg(ab, mask, fmt, ##__VA_ARGS__);     \
         |                                        ^~~
   drivers/net/wireless/ath/ath12k/qmi.c:2677:100: note: format string is defined here
    2677 |                                            "failed to assign mem type %d req size %d avail size %lld\n",
         |                                                                                                 ~~~^
         |                                                                                                    |
         |                                                                                                    long long int
         |                                                                                                 %d
   drivers/net/wireless/ath/ath12k/qmi.c:2707:44: warning: format '%lld' expects argument of type 'long long int', but argument 6 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    2707 |                                            "failed to assign mem type %d req size %d avail size %lld\n",
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ......
    2710 |                                            bdf_size);
         |                                            ~~~~~~~~
         |                                            |
         |                                            phys_addr_t {aka unsigned int}
   drivers/net/wireless/ath/ath12k/debug.h:69:40: note: in definition of macro 'ath12k_dbg'
      69 |                 __ath12k_dbg(ab, mask, fmt, ##__VA_ARGS__);     \
         |                                        ^~~
   drivers/net/wireless/ath/ath12k/qmi.c:2707:100: note: format string is defined here
    2707 |                                            "failed to assign mem type %d req size %d avail size %lld\n",
         |                                                                                                 ~~~^
         |                                                                                                    |
         |                                                                                                    long long int
         |                                                                                                 %d
   drivers/net/wireless/ath/ath12k/qmi.c:2748:44: warning: format '%lld' expects argument of type 'long long int', but argument 6 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    2748 |                                            "failed to assign mem type %d req size %d avail size %lld\n",
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ......
    2751 |                                            rmem->size);
         |                                            ~~~~~~~~~~
         |                                                |
         |                                                phys_addr_t {aka unsigned int}
   drivers/net/wireless/ath/ath12k/debug.h:69:40: note: in definition of macro 'ath12k_dbg'
      69 |                 __ath12k_dbg(ab, mask, fmt, ##__VA_ARGS__);     \
         |                                        ^~~
   drivers/net/wireless/ath/ath12k/qmi.c:2748:100: note: format string is defined here
    2748 |                                            "failed to assign mem type %d req size %d avail size %lld\n",
         |                                                                                                 ~~~^
         |                                                                                                    |
         |                                                                                                    long long int
         |                                                                                                 %d


vim +2677 drivers/net/wireless/ath/ath12k/qmi.c

  2659	
  2660	static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
  2661	{
  2662		struct reserved_mem *rmem;
  2663		phys_addr_t bdf_size;
  2664		int i, idx, ret;
  2665	
  2666		for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
  2667			switch (ab->qmi.target_mem[i].type) {
  2668			case HOST_DDR_REGION_TYPE:
  2669				rmem = ath12k_core_get_reserved_mem(ab, 0);
  2670				if (!rmem) {
  2671					ret = -ENODEV;
  2672					goto out;
  2673				}
  2674	
  2675				if (rmem->size < ab->qmi.target_mem[i].size) {
  2676					ath12k_dbg(ab, ATH12K_DBG_QMI,
> 2677						   "failed to assign mem type %d req size %d avail size %lld\n",
  2678						   ab->qmi.target_mem[i].type,
  2679						   ab->qmi.target_mem[i].size,
  2680						   rmem->size);
  2681					ret = -EINVAL;
  2682					goto out;
  2683				}
  2684	
  2685				ab->qmi.target_mem[idx].paddr = rmem->base;
  2686				ab->qmi.target_mem[idx].v.ioaddr =
  2687					ioremap(ab->qmi.target_mem[idx].paddr,
  2688						ab->qmi.target_mem[i].size);
  2689				if (!ab->qmi.target_mem[idx].v.ioaddr) {
  2690					ret = -EIO;
  2691					goto out;
  2692				}
  2693				ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
  2694				ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
  2695				idx++;
  2696				break;
  2697			case BDF_MEM_REGION_TYPE:
  2698				rmem = ath12k_core_get_reserved_mem(ab, 0);
  2699				if (!rmem) {
  2700					ret = -ENODEV;
  2701					goto out;
  2702				}
  2703	
  2704				bdf_size = rmem->size - ab->hw_params->bdf_addr_offset;
  2705				if (bdf_size < ab->qmi.target_mem[i].size) {
  2706					ath12k_dbg(ab, ATH12K_DBG_QMI,
  2707						   "failed to assign mem type %d req size %d avail size %lld\n",
  2708						   ab->qmi.target_mem[i].type,
  2709						   ab->qmi.target_mem[i].size,
  2710						   bdf_size);
  2711					ret = -EINVAL;
  2712					goto out;
  2713				}
  2714				ab->qmi.target_mem[idx].paddr =
  2715					rmem->base + ab->hw_params->bdf_addr_offset;
  2716				ab->qmi.target_mem[idx].v.ioaddr =
  2717					ioremap(ab->qmi.target_mem[idx].paddr,
  2718						ab->qmi.target_mem[i].size);
  2719				if (!ab->qmi.target_mem[idx].v.ioaddr) {
  2720					ret = -EIO;
  2721					goto out;
  2722				}
  2723				ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
  2724				ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
  2725				idx++;
  2726				break;
  2727			case CALDB_MEM_REGION_TYPE:
  2728				/* Cold boot calibration is not enabled in Ath12k. Hence,
  2729				 * assign paddr = 0.
  2730				 * Once cold boot calibration is enabled add support to
  2731				 * assign reserved memory from DT.
  2732				 */
  2733				ab->qmi.target_mem[idx].paddr = 0;
  2734				ab->qmi.target_mem[idx].v.ioaddr = NULL;
  2735				ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
  2736				ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
  2737				idx++;
  2738				break;
  2739			case M3_DUMP_REGION_TYPE:
  2740				rmem = ath12k_core_get_reserved_mem(ab, 1);
  2741				if (!rmem) {
  2742					ret = -EINVAL;
  2743					goto out;
  2744				}
  2745	
  2746				if (rmem->size < ab->qmi.target_mem[i].size) {
  2747					ath12k_dbg(ab, ATH12K_DBG_QMI,
  2748						   "failed to assign mem type %d req size %d avail size %lld\n",
  2749						   ab->qmi.target_mem[i].type,
  2750						   ab->qmi.target_mem[i].size,
  2751						   rmem->size);
  2752					ret = -EINVAL;
  2753					goto out;
  2754				}
  2755	
  2756				ab->qmi.target_mem[idx].paddr = rmem->base;
  2757				ab->qmi.target_mem[idx].v.ioaddr =
  2758					ioremap(ab->qmi.target_mem[idx].paddr,
  2759						ab->qmi.target_mem[i].size);
  2760				if (!ab->qmi.target_mem[idx].v.ioaddr) {
  2761					ret = -EIO;
  2762					goto out;
  2763				}
  2764				ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
  2765				ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
  2766				idx++;
  2767				break;
  2768			default:
  2769				ath12k_warn(ab, "qmi ignore invalid mem req type %d\n",
  2770					    ab->qmi.target_mem[i].type);
  2771				break;
  2772			}
  2773		}
  2774		ab->qmi.mem_seg_count = idx;
  2775	
  2776		return 0;
  2777	out:
  2778		ath12k_qmi_free_target_mem_chunk(ab);
  2779		return ret;
  2780	}
  2781	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

