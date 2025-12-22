Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C1CE6748D
	for <ath12k@archiver.kernel.org>; Mon, 22 Dec 2025 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayt6w0rAXyDMSz2Vg5He6QzObxP7DpGq41u1Min5gpw=; b=xl5ZF5ifMSVeiLVAXHJIGkG6lx
	Zoqoe1wx/pzOKQ150hw8Hr7YUbrxq0AdmMUM+DWqELYAxNpORK9oL/+WyHh3r1TJolgoD2qr6hRGm
	idNcdfBBtchY/rvoEfdjHocNv+gPRcaJWO5Ss8GPPPdN64DIYtgU4KhAMcu68e+dRAgSRaGioBnyt
	vRtqq1XO8pHvTdZ/oCV5cFxO+JOhCyzT0iQTZvcLWOqtKz8YItK6xmZdaR1rJSdvbCIeD+SmOf1LI
	MCJ7fUjiqqxgmWyYSlGereZW4U4pfrtIUYA00HshJtkiWsVvHId1cnH0t8HH9oM7csKfrxW3xqNWo
	R43yi5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd70-0000000DceC-1SM7;
	Mon, 22 Dec 2025 10:25:58 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd6x-0000000DcdS-3OVR
	for ath12k@lists.infradead.org;
	Mon, 22 Dec 2025 10:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766399156; x=1797935156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62taOR2EI0MqLH+HSIMWwZvEtr5H5VJiNu+vI3TqvDE=;
  b=TVNoNPvRCBhC4qGLSsLknbFffekX3KG9T02Doy3PZ/9zFCUBk6TTh0/k
   dVjpidaMOU6TrOYw13iTTT9E33zTzJ48lL8m3pKqU3tMWA/u+MA6LF4vn
   GtQGf9Iwye3Ul6OnYkfgUHzkArcVnwrGikVJ6rFJSOQmrRAU6CEiREddJ
   ZAyWRf347pyD+C+rBDt+vYdlfaYjXeSEvHL165serciC4Y46vn9ePn8AX
   B9okLFj15eYrBT82ynBW9Gddapb9jRY1V7p8X/1re0X2+CG/lop4/EiLr
   awz9A74m8qQZiVWrKLUOdyz8t2I4Ap17l2CCBzT3yA3IQKjfPoxb1aVwz
   w==;
X-CSE-ConnectionGUID: soZxGYRNQCyRjzqfQU63Ww==
X-CSE-MsgGUID: foU0QRUQTa6v3VNBzv00jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68297228"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68297228"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:25:54 -0800
X-CSE-ConnectionGUID: fAWCdZUaR5q2u7vr4ATdJQ==
X-CSE-MsgGUID: 5u0tkOQdRAmhs1RBOjgFlQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 02:25:51 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXd6L-000000000Nt-051A;
	Mon, 22 Dec 2025 10:25:34 +0000
Date: Mon, 22 Dec 2025 18:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>,
	Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>,
	Ripan Deuri <quic_rdeuri@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Message-ID: <202512221824.sz1jZjhH-lkp@intel.com>
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUOw1J0TU4VgeXj6@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_022556_042000_6421E215 
X-CRM114-Status: UNSURE (   9.10  )
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

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251217]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/wifi-ath12k-clean-up-on-error-in-ath12k_dp_setup/20251218-154554
base:   next-20251217
patch link:    https://lore.kernel.org/r/aUOw1J0TU4VgeXj6%40stanley.mountain
patch subject: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251222/202512221824.sz1jZjhH-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221824.sz1jZjhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221824.sz1jZjhH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/dp.c:1767:8: error: use of undeclared label 'rhash_destroy'
                   goto rhash_destroy;
                        ^
   1 error generated.


vim +/rhash_destroy +1767 drivers/net/wireless/ath/ath12k/dp.c

  1734	
  1735	int ath12k_dp_alloc(struct ath12k_base *ab)
  1736	{
  1737		struct ath12k_dp *dp = &ab->dp;
  1738		struct hal_srng *srng = NULL;
  1739		size_t size = 0;
  1740		u32 n_link_desc = 0;
  1741		int ret;
  1742		int i;
  1743	
  1744		dp->ab = ab;
  1745	
  1746		INIT_LIST_HEAD(&dp->reo_cmd_list);
  1747		INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
  1748		INIT_LIST_HEAD(&dp->reo_cmd_update_rx_queue_list);
  1749		spin_lock_init(&dp->reo_cmd_lock);
  1750		spin_lock_init(&dp->reo_rxq_flush_lock);
  1751	
  1752		dp->reo_cmd_cache_flush_count = 0;
  1753		dp->idle_link_rbm = ath12k_dp_get_idle_link_rbm(ab);
  1754	
  1755		ret = ath12k_wbm_idle_ring_setup(ab, &n_link_desc);
  1756		if (ret) {
  1757			ath12k_warn(ab, "failed to setup wbm_idle_ring: %d\n", ret);
  1758			return ret;
  1759		}
  1760	
  1761		srng = &ab->hal.srng_list[dp->wbm_idle_ring.ring_id];
  1762	
  1763		ret = ath12k_dp_link_desc_setup(ab, dp->link_desc_banks,
  1764						HAL_WBM_IDLE_LINK, srng, n_link_desc);
  1765		if (ret) {
  1766			ath12k_warn(ab, "failed to setup link desc: %d\n", ret);
> 1767			goto rhash_destroy;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

