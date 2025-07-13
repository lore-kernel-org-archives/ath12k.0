Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647C2C83F1D
	for <ath12k@archiver.kernel.org>; Sun, 13 Jul 2025 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vh7bmUyjYC8XGU8brmwZtk3MAmCzcgkb/GDH8jy4k4o=; b=23+zOND87tVR0TNb4y82DVzllQ
	mNZbr4UHeZmYIg2vNUnuopJsu/cpFDkfZ1SUteIO9DTNhlnxt3c9zPR+EoXGjg0WDgTJMX0u1eQQH
	WmojC2x+KGvUNd7zw7D298z0JmYrHUgymaJlCt7QmkeA8cWSFKOBQn8olUFODf3/2wyDit0i+f/LT
	aFKZPuN58N1aoIeoJtMK8+xisXjAIwpOOoau0fJAid6VMdn4EqVs/tFUi5U3gOtb4seggS1xLuJSz
	opmXFtwWflmpAYKnRMoTIMjSPZF+8znIItIk+/XJEMMPx13exQHIitYJ2SQbkUqONzC2jhgJYjH4J
	p15bVclA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasKe-0000000HYGH-0W4M;
	Sun, 13 Jul 2025 08:45:12 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaryW-0000000HW2G-3O3j
	for ath12k@lists.infradead.org;
	Sun, 13 Jul 2025 08:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752394941; x=1783930941;
  h=date:from:to:cc:subject:message-id;
  bh=9IU6JVLdmBo5EF1eUK0lR05P+UOE7uvTFJElrg0+AZY=;
  b=mO3xTsiHIJw8qmk9ft2LDwkB2K2yx9yecjcAUK0eawVGkZDHDXl5vlXN
   rHEyuyqKO1pTIGpCfAxppQrcKnQFxs+iEUOX5B4oMQiQ6fj0GdLEeQtXJ
   78jSLwmVlNfYhOTUGwua9G7CclvFNhTgZzpvZfzPYKiaRbyPklUG0QvjI
   z1xL62SxfGe+0+IjuVPHpL4R8I3E/C1c8u9VH/vDJ+D6GL9ieaCaH3FDD
   VvSeK7EJc2aLaenlhHwqgPSH7g0q0KNaNhsOD00mPYkfFrrs5YVYeH4RQ
   fOuWr9KdVwNEQJRWbtalyh6Cyw+02V5PZyuCUJVxY1exF6Ook0Kl2a/ks
   g==;
X-CSE-ConnectionGUID: OsB4s+mGQYWVpLW3sejWqA==
X-CSE-MsgGUID: QOYE2m+VQzGNeXXN98NlZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54705158"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="54705158"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 01:22:19 -0700
X-CSE-ConnectionGUID: 4wjEz/xuSTKiCawoanX7GA==
X-CSE-MsgGUID: tB8tME8ERCChdUxlgJxm8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="156491327"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jul 2025 01:22:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaryR-0007zv-29;
	Sun, 13 Jul 2025 08:22:15 +0000
Date: Sun, 13 Jul 2025 16:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 3a94f25ee280547f0839da5381dcbec7c41c3497
Message-ID: <202507131640.WqM1jF0w-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_012220_892774_850F6E34 
X-CRM114-Status: UNSURE (   3.86  )
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
branch HEAD: 3a94f25ee280547f0839da5381dcbec7c41c3497  wifi: ath12k: Add support to enqueue management frame at MLD level

elapsed time: 724m

configs tested: 123
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250713    gcc-11.5.0
arc                   randconfig-002-20250713    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       imx_v6_v7_defconfig    clang-16
arm                   randconfig-001-20250713    clang-21
arm                   randconfig-002-20250713    gcc-10.5.0
arm                   randconfig-003-20250713    clang-21
arm                   randconfig-004-20250713    gcc-11.5.0
arm                         s5pv210_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250713    gcc-8.5.0
arm64                 randconfig-002-20250713    gcc-13.4.0
arm64                 randconfig-003-20250713    clang-21
arm64                 randconfig-004-20250713    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250713    gcc-15.1.0
csky                  randconfig-002-20250713    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250713    clang-21
hexagon               randconfig-002-20250713    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250713    clang-20
i386        buildonly-randconfig-002-20250713    clang-20
i386        buildonly-randconfig-003-20250713    gcc-12
i386        buildonly-randconfig-004-20250713    gcc-12
i386        buildonly-randconfig-005-20250713    clang-20
i386        buildonly-randconfig-006-20250713    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250713    clang-21
loongarch             randconfig-002-20250713    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250713    gcc-11.5.0
nios2                 randconfig-002-20250713    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250713    gcc-8.5.0
parisc                randconfig-002-20250713    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                   lite5200b_defconfig    clang-21
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250713    clang-21
powerpc               randconfig-002-20250713    clang-19
powerpc               randconfig-003-20250713    gcc-8.5.0
powerpc64             randconfig-002-20250713    clang-21
powerpc64             randconfig-003-20250713    gcc-13.4.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250713    clang-20
riscv                 randconfig-002-20250713    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250713    clang-21
s390                  randconfig-002-20250713    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250713    gcc-15.1.0
sh                    randconfig-002-20250713    gcc-11.5.0
sh                           se7721_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250713    gcc-8.5.0
sparc                 randconfig-002-20250713    gcc-10.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250713    gcc-8.5.0
sparc64               randconfig-002-20250713    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250713    clang-21
um                    randconfig-002-20250713    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250713    clang-20
x86_64      buildonly-randconfig-002-20250713    clang-20
x86_64      buildonly-randconfig-003-20250713    clang-20
x86_64      buildonly-randconfig-004-20250713    clang-20
x86_64      buildonly-randconfig-005-20250713    clang-20
x86_64      buildonly-randconfig-006-20250713    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250713    gcc-11.5.0
xtensa                randconfig-002-20250713    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

