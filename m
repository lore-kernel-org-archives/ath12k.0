Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAD4CA5FF1
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 13:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deZuCCnmB/cyvshoIquy/G6i0xQgH4AZ2cKQVpaxegI=; b=YTcpX6nhD7zez+spIEVdagd7t3
	Tbx7QgMPeepLW9IaL8UjezCkXxMYwXmR64UDczutzs7oKKbp/MW+qiemHmP2AfUY/pa96yjJ9JTjE
	EnENT06VLvwNdwPvdgP08pnLk1k8PNTcZvZc+6mCWOeU9W2ZaOqJ1+BnHfXroyf2sD2/EMs08WhRZ
	tCEeq6sHbUBEAzrvjcZTgbnn+3FPsyXvlmTqMbWR3EDsb8R8Lg3ecgMK2IB2jPeBM2wz5X4/FI49T
	AWmoDkibQ5z8rybSdTAaQO1PjmS+1WqpctwnwdcXnTN+6/BcKRskeL0zE9B2MO5LoGid9m38s4qXy
	Oyn/kHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERhF-00000002Wth-0xJw;
	Wed, 07 Oct 2026 13:28:37 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERhC-00000002WtK-3SWL
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 13:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379715; x=1822915715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HmrYqLlz/iFOT1qIwq+oFd7wxoG3X9eBwkkqkSQqhgo=;
  b=C09d+V4nt1hqCjyccyFpUtLOg4P7Dx0nwqvFuZpHdyJPiZ1DyYKVzUTP
   uveQfz8nQZSCLy3fhLa4wqOL0qqE7MT2qpuKJXtp1zqQ4Y7DMNsGrQP7S
   9pxlhswonc/YZ/JUcILGZ5vgeyC/hOcL0Ioew0DCseRsLHnfOXu0m5nK3
   ebSW/983RKDDEFYCf8whXjJ1SysM3TaBsHTnpu5dDi0m5uTgrEuGMmypr
   K++SnL02cTmXngXoDUG7B/l6YTsTYfpOQDrEboWb8LTbPY4CMg3GUFr+c
   OgdGYZAEi0f+IFajDO+Ls/vjHre2bQNGnlatSqqzFV3mq+qPAQGe+nzlG
   w==;
X-CSE-ConnectionGUID: OP6yQfCOQm+8NNCqQc9MRg==
X-CSE-MsgGUID: YlcD8NrOTvq4dmbCtIzT8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="22922"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="22922"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:28:34 -0700
X-CSE-ConnectionGUID: PvxnDQ/bQe+MNMIKDrBmYg==
X-CSE-MsgGUID: s5qIULmlTNGOtPi87J9xkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="281200455"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Oct 2026 06:28:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xERh8-0000000031o-0Abr;
	Wed, 07 Oct 2026 13:28:30 +0000
Date: Wed, 7 Oct 2026 21:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nikolai Semendiaev <agent00791@gmail.com>, ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	jjohnson@kernel.org, wabsie@gmail.com
Subject: Re: [PATCH 2/2] wifi: ath12k: use private page-frag caches for RXDMA
 rings
Message-ID: <202610072103.1v2wWX3z-lkp@intel.com>
References: <7bb1b30324eea87b53a8c585566842a1a0ec7d06.1791279304.git.agent00791@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bb1b30324eea87b53a8c585566842a1a0ec7d06.1791279304.git.agent00791@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_062834_910711_31BB50C2 
X-CRM114-Status: UNSURE (   9.02  )
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

Hi Nikolai,

kernel test robot noticed the following build errors:

[auto build test ERROR on 388d3c42e8aba1cfc3c6d2c52877a46d8cf740db]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikolai-Semendiaev/wifi-ath12k-make-external-IRQ-control-idempotent/20261006-154146
base:   388d3c42e8aba1cfc3c6d2c52877a46d8cf740db
patch link:    https://lore.kernel.org/r/7bb1b30324eea87b53a8c585566842a1a0ec7d06.1791279304.git.agent00791%40gmail.com
patch subject: [PATCH 2/2] wifi: ath12k: use private page-frag caches for RXDMA rings
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261007/202610072103.1v2wWX3z-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072103.1v2wWX3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072103.1v2wWX3z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/dp.c:7:
   include/linux/page_frag_cache.h: In function 'page_frag_alloc_align':
>> include/linux/page_frag_cache.h:49:9: error: implicit declaration of function 'WARN_ON_ONCE' [-Wimplicit-function-declaration]
      49 |         WARN_ON_ONCE(!is_power_of_2(align));
         |         ^~~~~~~~~~~~


vim +/WARN_ON_ONCE +49 include/linux/page_frag_cache.h

3d18dfe69ce46f Yunsheng Lin 2024-10-28  39  
65941f10caf2c0 Yunsheng Lin 2024-10-28  40  void page_frag_cache_drain(struct page_frag_cache *nc);
65941f10caf2c0 Yunsheng Lin 2024-10-28  41  void __page_frag_cache_drain(struct page *page, unsigned int count);
65941f10caf2c0 Yunsheng Lin 2024-10-28  42  void *__page_frag_alloc_align(struct page_frag_cache *nc, unsigned int fragsz,
65941f10caf2c0 Yunsheng Lin 2024-10-28  43  			      gfp_t gfp_mask, unsigned int align_mask);
65941f10caf2c0 Yunsheng Lin 2024-10-28  44  
65941f10caf2c0 Yunsheng Lin 2024-10-28  45  static inline void *page_frag_alloc_align(struct page_frag_cache *nc,
65941f10caf2c0 Yunsheng Lin 2024-10-28  46  					  unsigned int fragsz, gfp_t gfp_mask,
65941f10caf2c0 Yunsheng Lin 2024-10-28  47  					  unsigned int align)
65941f10caf2c0 Yunsheng Lin 2024-10-28  48  {
65941f10caf2c0 Yunsheng Lin 2024-10-28 @49  	WARN_ON_ONCE(!is_power_of_2(align));
65941f10caf2c0 Yunsheng Lin 2024-10-28  50  	return __page_frag_alloc_align(nc, fragsz, gfp_mask, -align);
65941f10caf2c0 Yunsheng Lin 2024-10-28  51  }
65941f10caf2c0 Yunsheng Lin 2024-10-28  52  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

