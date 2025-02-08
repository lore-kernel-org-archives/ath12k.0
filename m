Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E12AC02198
	for <ath12k@archiver.kernel.org>; Sat,  8 Feb 2025 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6e3Qh0JaIOtQ3LvrdmYEA8yPahsxmfnF0P07Csn2NM=; b=hOWuXjhRaP1Dv8HBImTarYwyfr
	CWY/vI+Uc2SpaAR1WYlVSmQRvri2BXxj0N+V9nyaEECVi8Lmvsap1FR0OK/YD1nshtqENM3/61KZs
	uWxdmI4AfrX6ffFH25N4h98lRUFPQTXfLPprSjzrrTUd/eQB2sJk2Rlo6srjnmslOmlir/I1MSM3h
	aQtFHXSzufweoLnaFfeJ4LorxBrkWgKX1fFDzMGUJX2f61J3NgUo/NTm86hrXa4ho54gjaQqdlCNB
	U23MIDpgZl8+lK2t6ltE8nVdksx1UWuTEZDiqpKdH5hmWriEgazBc1OjrJtJoHrXeYVh35ga7/qaP
	BQdFqgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgpMr-0000000DM8j-0lPZ
	for ath12k@archiver.kernel.org;
	Sat, 08 Feb 2025 18:15:49 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgpMo-0000000DM8L-3V43
	for ath12k@lists.infradead.org;
	Sat, 08 Feb 2025 18:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739038547; x=1770574547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JhlPtXpJUKq8YkpZhW4KEnNGOc3+W5nAxp0WPvcA3H0=;
  b=U39WXpRUFL0aD3OogtQe3mxNEsN3NwP8ru9IA2q7Mdk6/KimHwHyT3KH
   v2WyXxhoakBwTe/bREXIZoSVV0AaKkrJnEm2PVGL1X6Ad8xnZdrX+l2/+
   4MbsvkeG+Fm2jXswqECmv2grYjVyuYG3OPYWRSGexW+/76d+EFKhVIp8w
   K2+rf+mIFO4SsQbXdYHjr6nOCfEupYMNJz4uuA6S8l2l/yhIyXUz5MyCm
   WrVurLDc1i0WyIsv0XeQ2inif3TXJTttcakhMQ2uBsgYAxPlwz0Y0g75W
   IghB5dLtJAlB+UcUtVX7gyG55JuVHvm3oV5As7fK/0iG2+MhmtqIKreHT
   A==;
X-CSE-ConnectionGUID: tnygxJUYQDKzG4XkCTanTA==
X-CSE-MsgGUID: +YNqLpHYRO2/X80w/xfctg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43325122"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="43325122"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 10:15:42 -0800
X-CSE-ConnectionGUID: vdKkOMaDSp2tQafImAOQ8w==
X-CSE-MsgGUID: MpH5rHbeR56r7mrgJdw4XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="112023278"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Feb 2025 10:15:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgpMg-0010Tv-2F;
	Sat, 08 Feb 2025 18:15:38 +0000
Date: Sun, 9 Feb 2025 02:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
	ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Sriram R <quic_srirrama@quicinc.com>,
	Nithyanantham Paramasivam <quic_nithp@quicinc.com>
Subject: Re: [PATCH v2 1/3] wifi: ath12k: Fix the enabling of REO queue
 lookup table feature
Message-ID: <202502090206.lIwUMGJF-lkp@intel.com>
References: <20250207173023.3856217-2-quic_nithp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207173023.3856217-2-quic_nithp@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_101546_920051_B64ACFD2 
X-CRM114-Status: GOOD (  10.66  )
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

Hi Nithyanantham,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 48a62436540224f57013c27519dd2aa3ddd714c9]

url:    https://github.com/intel-lab-lkp/linux/commits/Nithyanantham-Paramasivam/wifi-ath12k-Fix-the-enabling-of-REO-queue-lookup-table-feature/20250208-013400
base:   48a62436540224f57013c27519dd2aa3ddd714c9
patch link:    https://lore.kernel.org/r/20250207173023.3856217-2-quic_nithp%40quicinc.com
patch subject: [PATCH v2 1/3] wifi: ath12k: Fix the enabling of REO queue lookup table feature
config: i386-randconfig-063-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090206.lIwUMGJF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090206.lIwUMGJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090206.lIwUMGJF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/dp.c:1660:30: warning: shift count is negative [-Wshift-count-negative]
    1660 |                            ((dp->reoq_lut.paddr & HAL_REO_QLUT_REG_BASE_ADDR) >> 8));
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/hal.h:328:38: note: expanded from macro 'HAL_REO_QLUT_REG_BASE_ADDR'
     328 | #define HAL_REO_QLUT_REG_BASE_ADDR                      GENMASK(39, 8)
         |                                                         ^~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/dp.c:1663:33: warning: shift count is negative [-Wshift-count-negative]
    1663 |                            ((dp->ml_reoq_lut.paddr & HAL_REO_QLUT_REG_BASE_ADDR) >> 8));
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/hal.h:328:38: note: expanded from macro 'HAL_REO_QLUT_REG_BASE_ADDR'
     328 | #define HAL_REO_QLUT_REG_BASE_ADDR                      GENMASK(39, 8)
         |                                                         ^~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +1660 drivers/net/wireless/ath/ath12k/dp.c

  1628	
  1629	static int ath12k_dp_reoq_lut_setup(struct ath12k_base *ab)
  1630	{
  1631		struct ath12k_dp *dp = &ab->dp;
  1632		u32 val;
  1633		int ret;
  1634	
  1635		if (!ab->hw_params->reoq_lut_support)
  1636			return 0;
  1637	
  1638		ret = ath12k_dp_alloc_reoq_lut(ab, &dp->reoq_lut);
  1639		if (ret) {
  1640			ath12k_warn(ab, "failed to allocate memory for reoq table");
  1641			return ret;
  1642		}
  1643	
  1644		ret = ath12k_dp_alloc_reoq_lut(ab, &dp->ml_reoq_lut);
  1645		if (ret) {
  1646			ath12k_warn(ab, "failed to allocate memory for ML reoq table");
  1647			dma_free_coherent(ab->dev, dp->reoq_lut.size,
  1648					  dp->reoq_lut.vaddr_unaligned,
  1649					  dp->reoq_lut.paddr_unaligned);
  1650			dp->reoq_lut.vaddr_unaligned = NULL;
  1651			return ret;
  1652		}
  1653	
  1654		/* Bits in the register have address [39:8] LUT base address to be
  1655		 * allocated such that LSBs are assumed to be zero. Also, current
  1656		 * design supports paddr upto 4 GB max hence it fits in 32 bit register only
  1657		 */
  1658	
  1659		ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_LUT_BASE0(ab),
> 1660				   ((dp->reoq_lut.paddr & HAL_REO_QLUT_REG_BASE_ADDR) >> 8));
  1661	
  1662		ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_LUT_BASE1(ab),
  1663				   ((dp->ml_reoq_lut.paddr & HAL_REO_QLUT_REG_BASE_ADDR) >> 8));
  1664	
  1665		val = ath12k_hif_read32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_ADDR(ab));
  1666	
  1667		ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_ADDR(ab),
  1668				   val | HAL_REO_QDESC_ADDR_READ_LUT_ENABLE);
  1669	
  1670		ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_MAX_PEERID(ab),
  1671				   HAL_REO_QDESC_MAX_PEERID);
  1672	
  1673		return 0;
  1674	}
  1675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

