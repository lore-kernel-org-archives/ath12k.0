Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B0E77199
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 01:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xr95TVa8hSTIFgqPYaeH3n2kx3ffIeQg9gzk+kttMFE=; b=g4SXYX4ORFNEScxQm6uIPX5Unm
	g9cK/axFehPRz79fyJ78WkeNJ2POywT9wBJ9MkqycY/1LP12k1sNuENPjL/09AdRPxyzbiCm9/j94
	dzGEchJGt7BY6lH/SBwxPpSPRPAdfk27f8RzPi7cEWDRPqFkos7YbPf9WKnzKTqtqvOVlzAG0T2CJ
	d61e+l5Ml8gbVt9ZoOjTh4bF0Wma6dHsqe7ABtRSAeVgPboSvaZ1tu9vr2pZcgN5jChWJgw5mkDRS
	XuuJZcrjKel9PywKvq3NOrFMu64SSdz6GjeSnqMwJMIvrgHtrfH9J6kN3F2AXwQsMTWrpMM2EWfm0
	keum9VIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVhTx-0000000AKZo-0s6n
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 01:37:09 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVhNP-0000000AJaL-23EB
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 01:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736386223; x=1767922223;
  h=date:from:to:cc:subject:message-id;
  bh=Pd0AukkV/tobG1bitewwRhZOTmrId4Y0+tsR/lIhdV4=;
  b=W/xiuUt33sxT99jageluIh5efLGyCdMyzusZxd6dc4Rlu8u5mFQXVRgb
   KHKi5ZMH3T8F3nJTSnJRudAoRruWbWdPpuDmsUErb4mGTrssKWHHmfAUQ
   sQ03421koX663ehqebPBHZD0TMVyyTEC357AStjir643vjdcCWS0f2xNd
   tQCvZoMUtV3hBOUMS5BCdDptZKwxffQdKZUxNAik7yElqwilMoMKK4TBM
   wG1a8/n+0+0+e0FJgIgkf2lEaIRviKsG/bXScx69E6hN+jWdl16Qsuz56
   E0isIRDG7WQbFCRgOnMUS4x2NiV1CH8J+c2IGMX83e3EwViXrQBUWBjJb
   A==;
X-CSE-ConnectionGUID: 0+KSnfUCQ+i/hxCbKgndag==
X-CSE-MsgGUID: OzGWgulxSDSWYgkw/W8Vfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="39451074"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="39451074"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 17:30:18 -0800
X-CSE-ConnectionGUID: eXg0WfJ7TMisX0Xm8j+zvg==
X-CSE-MsgGUID: r66pouOsRm+iHAVWpY1/uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="103761669"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2025 17:30:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVhNH-000Gt1-1C;
	Thu, 09 Jan 2025 01:30:15 +0000
Date: Thu, 09 Jan 2025 09:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 3540bba855b4b422e8b977d11aa8173ccb4f089d
Message-ID: <202501090935.kUrlZNRR-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_173023_581475_F2C25157 
X-CRM114-Status: UNSURE (   3.66  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: 3540bba855b4b422e8b977d11aa8173ccb4f089d  wifi: ath12k: fix tx power, max reg power update to firmware

elapsed time: 1455m

configs tested: 167
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250108    gcc-13.2.0
arc                   randconfig-002-20250108    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-20
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                   randconfig-001-20250108    gcc-14.2.0
arm                   randconfig-002-20250108    gcc-14.2.0
arm                   randconfig-003-20250108    clang-20
arm                   randconfig-004-20250108    clang-18
arm                           sama5_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250108    gcc-14.2.0
arm64                 randconfig-002-20250108    clang-20
arm64                 randconfig-003-20250108    gcc-14.2.0
arm64                 randconfig-004-20250108    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250108    gcc-14.2.0
csky                  randconfig-002-20250108    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250108    clang-20
hexagon               randconfig-002-20250108    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250108    clang-19
i386        buildonly-randconfig-002-20250108    gcc-12
i386        buildonly-randconfig-003-20250108    gcc-12
i386        buildonly-randconfig-004-20250108    gcc-12
i386        buildonly-randconfig-005-20250108    gcc-12
i386        buildonly-randconfig-006-20250108    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250109    gcc-12
i386                  randconfig-002-20250109    gcc-12
i386                  randconfig-003-20250109    gcc-12
i386                  randconfig-004-20250109    gcc-12
i386                  randconfig-005-20250109    gcc-12
i386                  randconfig-006-20250109    gcc-12
i386                  randconfig-007-20250109    gcc-12
i386                  randconfig-011-20250109    clang-19
i386                  randconfig-012-20250109    clang-19
i386                  randconfig-013-20250109    clang-19
i386                  randconfig-014-20250109    clang-19
i386                  randconfig-015-20250109    clang-19
i386                  randconfig-016-20250109    clang-19
i386                  randconfig-017-20250109    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250108    gcc-14.2.0
loongarch             randconfig-002-20250108    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-20
mips                              allnoconfig    gcc-14.2.0
mips                        omega2p_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250108    gcc-14.2.0
nios2                 randconfig-002-20250108    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250108    gcc-14.2.0
parisc                randconfig-002-20250108    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.2.0
powerpc                      pasemi_defconfig    clang-20
powerpc                      ppc6xx_defconfig    clang-20
powerpc               randconfig-001-20250108    clang-16
powerpc               randconfig-002-20250108    gcc-14.2.0
powerpc               randconfig-003-20250108    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-20
powerpc64             randconfig-001-20250108    clang-18
powerpc64             randconfig-002-20250108    clang-16
powerpc64             randconfig-003-20250108    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250108    gcc-14.2.0
riscv                 randconfig-001-20250109    gcc-12
riscv                 randconfig-002-20250108    gcc-14.2.0
riscv                 randconfig-002-20250109    gcc-12
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250108    gcc-14.2.0
s390                  randconfig-001-20250109    gcc-12
s390                  randconfig-002-20250108    gcc-14.2.0
s390                  randconfig-002-20250109    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250108    gcc-14.2.0
sh                    randconfig-001-20250109    gcc-12
sh                    randconfig-002-20250108    gcc-14.2.0
sh                    randconfig-002-20250109    gcc-12
sh                          rsk7264_defconfig    clang-20
sh                        sh7757lcr_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250108    gcc-14.2.0
sparc                 randconfig-001-20250109    gcc-12
sparc                 randconfig-002-20250108    gcc-14.2.0
sparc                 randconfig-002-20250109    gcc-12
sparc64               randconfig-001-20250108    gcc-14.2.0
sparc64               randconfig-001-20250109    gcc-12
sparc64               randconfig-002-20250108    gcc-14.2.0
sparc64               randconfig-002-20250109    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20250108    gcc-12
um                    randconfig-001-20250109    gcc-12
um                    randconfig-002-20250108    clang-16
um                    randconfig-002-20250109    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250108    clang-19
x86_64      buildonly-randconfig-002-20250108    gcc-11
x86_64      buildonly-randconfig-003-20250108    clang-19
x86_64      buildonly-randconfig-004-20250108    gcc-12
x86_64      buildonly-randconfig-005-20250108    gcc-12
x86_64      buildonly-randconfig-006-20250108    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250109    gcc-12
x86_64                randconfig-072-20250109    gcc-12
x86_64                randconfig-073-20250109    gcc-12
x86_64                randconfig-074-20250109    gcc-12
x86_64                randconfig-075-20250109    gcc-12
x86_64                randconfig-076-20250109    gcc-12
x86_64                randconfig-077-20250109    gcc-12
x86_64                randconfig-078-20250109    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250108    gcc-14.2.0
xtensa                randconfig-001-20250109    gcc-12
xtensa                randconfig-002-20250108    gcc-14.2.0
xtensa                randconfig-002-20250109    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

