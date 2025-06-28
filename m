Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9D4C54ED1
	for <ath12k@archiver.kernel.org>; Sat, 28 Jun 2025 21:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oYCjCk4mlJplcvzO/MJbCEi6aqLMJNv54sovSNMrqUg=; b=XMCVjpy6sEJr0+U6PT2UVxHPNr
	JvOaOx3bCz3b+q5DsVWNJuh3PTv41P97T0J6ztNla+beufZQLZ2DhEaEsAgVuTWJty/fBJ7zLDFrQ
	Ojox0FCbv5ly8K/4Aurk2qObDI055bycy6SGJfu5ZiN3ACQ7w8fJXnsO+tqbFHX045H5lJ/OrzK7X
	3VOOuy10vLBoKj0On+TijLHwOuQ0fSkmzgOz0ZbK23aYolPi1MPvdGgtpuNCoj+s2pM9rXvwAriu8
	EkJJa8+JNlxo2kiWo5irawQ8Cr4yxWrOhuZuv/4d6MFVJqi07FvWSU0qSvr2NbjVxc0nojLvoHnqw
	b3g00j+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVdGV-0000000HK8h-36BK;
	Sat, 28 Jun 2025 21:39:15 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVdGS-0000000HK8L-0qTr
	for ath12k@lists.infradead.org;
	Sat, 28 Jun 2025 21:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751146752; x=1782682752;
  h=date:from:to:cc:subject:message-id;
  bh=UQYiE0xeK57LzWbREPnx42if9aG+o+YXmzTJTyCqDhU=;
  b=OnGwKuXsGRVwpysqgRxoiKnvBoRo+/NvTVrxX8te2hdkN8x3W0Wf0TTt
   TvBN3Im1dEnsWi4rJ4NI4Z6Xc08VNf1tCmShFo+W9qyyIkGZZBVO0FLFL
   VMydyqffpymJ6expYBstozIKxUK9XlGYQ7ZCiNztZXq/N+RGjyvLWLJw7
   gIPN7xDmCVxmt3PgK62jf+YyFA9/Q77tn3fl0f//oJGOqIgpCNODvpdK2
   uyfngHVf79zq7YeAe8I+YawnN2hyo6kNzC7fvuusm3ZfRBalg0sBobvVO
   dFUMgxt/EfOBw6ou0r5CwN8pXFeF/GRFYSdkqhLSvYM4g/W87RYWD7/V7
   Q==;
X-CSE-ConnectionGUID: 2x0rQjc0TKipOTm5OM+qfg==
X-CSE-MsgGUID: W7p35bmMQK2plLBt2AMNtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="63673000"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="63673000"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 14:39:11 -0700
X-CSE-ConnectionGUID: vtbKpNOcTaurpCBRCPd89A==
X-CSE-MsgGUID: VKHklugvTmCcvzfNcebA3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="158596313"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jun 2025 14:39:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVdGN-000XPK-1a;
	Sat, 28 Jun 2025 21:39:07 +0000
Date: Sun, 29 Jun 2025 05:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 6e17bbb5a86e6c68d65e38dfc850699e7a0706cb
Message-ID: <202506290547.ETFgyhjz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_143912_315629_8D3B6A26 
X-CRM114-Status: UNSURE (   3.84  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: 6e17bbb5a86e6c68d65e38dfc850699e7a0706cb  wifi: ath12k: fix timeout while waiting for regulatory update during interface creation

elapsed time: 1443m

configs tested: 135
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250628    gcc-8.5.0
arc                   randconfig-002-20250628    gcc-15.1.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         at91_dt_defconfig    clang-21
arm                          exynos_defconfig    clang-21
arm                      footbridge_defconfig    clang-17
arm                       imx_v4_v5_defconfig    clang-21
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20250628    gcc-12.4.0
arm                   randconfig-002-20250628    clang-21
arm                   randconfig-003-20250628    clang-17
arm                   randconfig-004-20250628    clang-17
arm                             rpc_defconfig    clang-18
arm                        spear6xx_defconfig    clang-21
arm                           sunxi_defconfig    gcc-15.1.0
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250628    gcc-14.3.0
arm64                 randconfig-002-20250628    clang-21
arm64                 randconfig-003-20250628    clang-21
arm64                 randconfig-004-20250628    clang-17
csky                             alldefconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250628    gcc-14.3.0
csky                  randconfig-002-20250628    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250628    clang-21
hexagon               randconfig-002-20250628    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250628    clang-20
i386        buildonly-randconfig-002-20250628    clang-20
i386        buildonly-randconfig-003-20250628    gcc-12
i386        buildonly-randconfig-004-20250628    clang-20
i386        buildonly-randconfig-005-20250628    clang-20
i386        buildonly-randconfig-006-20250628    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250628    gcc-12.4.0
loongarch             randconfig-002-20250628    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-21
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250628    gcc-8.5.0
nios2                 randconfig-002-20250628    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250628    gcc-8.5.0
parisc                randconfig-002-20250628    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                      mgcoge_defconfig    clang-21
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc               randconfig-001-20250628    gcc-8.5.0
powerpc               randconfig-002-20250628    clang-19
powerpc               randconfig-003-20250628    clang-21
powerpc64             randconfig-001-20250628    clang-20
powerpc64             randconfig-002-20250628    gcc-8.5.0
powerpc64             randconfig-003-20250628    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250628    clang-21
riscv                 randconfig-002-20250628    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250628    clang-21
s390                  randconfig-002-20250628    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250628    gcc-15.1.0
sh                    randconfig-002-20250628    gcc-9.3.0
sh                           sh2007_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250628    gcc-8.5.0
sparc                 randconfig-002-20250628    gcc-12.4.0
sparc64               randconfig-001-20250628    gcc-8.5.0
sparc64               randconfig-002-20250628    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250628    gcc-12
um                    randconfig-002-20250628    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250628    gcc-12
x86_64      buildonly-randconfig-002-20250628    clang-20
x86_64      buildonly-randconfig-003-20250628    gcc-12
x86_64      buildonly-randconfig-004-20250628    clang-20
x86_64      buildonly-randconfig-005-20250628    clang-20
x86_64      buildonly-randconfig-006-20250628    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250628    gcc-11.5.0
xtensa                randconfig-002-20250628    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

