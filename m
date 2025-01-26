Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E28C0218D
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfQNuzjGvlZgeLYeSmQJY0VLQAOP1lJRpQlu8YbqFXU=; b=h3UuhzeDen4m6lONh7bOcWLhML
	6xptHOmFRi6c87GjHMuQ/16gXU6jvjB+H6OZC+lSL7sIlYshUo5xq6DomFXh1Kq4M5rnGk15ccTCs
	/0MKxO5/ohCauk53O0c6z56fQR3uosmdlukB88r4fTgAy+W5BNWvV+A79LgvJd2PaI8SbQk0GNVwD
	lcf7UoqT7gT1TwjPKdSwqPH78YlCpJzuCeF32MWpE8GA0RQMVox4c4V7JqzdPr4nBj2nnlW9vzHx+
	sWbCGs1RPnD/1p6GKOuedBj5NczaOhEm2KcHfdYKEIOeR9RV54Y7slMj7ydE1WMCMQLaMPEYr31e0
	YX92Pj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tby7w-0000000HG8D-0lhx
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 08:36:20 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tby7t-0000000HG7u-134T
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 08:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737880578; x=1769416578;
  h=date:from:to:cc:subject:message-id;
  bh=cN33XriteLno1Wp50KQlXYf3RyqGUgcTfQWnObDnykI=;
  b=Qklzz24OBO8v2SaKgOTkoX6tRYW34P1cCaUHhDhLJJDyeGiy/FVVzPe8
   VKlZmeBjX6axuuow+2knIIQJWNza4icsGnBUocxCXO+nzBTbUP1/Yw+X+
   tYbXD4yR+VH/pb47iE44BWIheHhwFhOJ/nLxfNXbOtfKSGKOI1rum1K0U
   A79K0iSh+u5dqiOyIpx4vfZFZbsGbforiPVQwsZnCDtFJFbS1+JX6Kyw6
   1oPv+Mn+qYqwK/yn0czIFN7uzYi6m2r4NxnlE8SlCWMt4DuMmecv/pczd
   aALdHojvJL3KDr0HBcZXGZ8vY729ozSy7ssZwW3akKFfdYVpLO9ooTWoJ
   Q==;
X-CSE-ConnectionGUID: L7ymcRCdTfuSnVJQ6Ya+YQ==
X-CSE-MsgGUID: Fu3wI3sJQXi8yYVYLQadLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="49348955"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="49348955"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 00:36:12 -0800
X-CSE-ConnectionGUID: rA9uLFoOSHqCpScdQ1qXeA==
X-CSE-MsgGUID: l+jNfEYNTl+UwDBgviqIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108594612"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jan 2025 00:36:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tby7e-000f8n-21;
	Sun, 26 Jan 2025 08:36:02 +0000
Date: Sun, 26 Jan 2025 16:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 abe84eae3b9a41ade71c9d8106789f9aa63505a6
Message-ID: <202501261624.a0jLupV8-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_003617_343504_C15872D1 
X-CRM114-Status: UNSURE (   4.31  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: abe84eae3b9a41ade71c9d8106789f9aa63505a6  Merge branch 'pending' into main-pending

elapsed time: 721m

configs tested: 139
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    gcc-13.2.0
arc                        nsim_700_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250126    gcc-13.2.0
arc                   randconfig-002-20250126    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-16
arm                       imx_v4_v5_defconfig    clang-16
arm                      integrator_defconfig    clang-15
arm                        mvebu_v7_defconfig    clang-15
arm                   randconfig-001-20250126    gcc-14.2.0
arm                   randconfig-002-20250126    clang-20
arm                   randconfig-003-20250126    clang-20
arm                   randconfig-004-20250126    clang-20
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250126    clang-20
arm64                 randconfig-002-20250126    gcc-14.2.0
arm64                 randconfig-003-20250126    clang-20
arm64                 randconfig-004-20250126    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250126    gcc-14.2.0
csky                  randconfig-002-20250126    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250126    clang-20
hexagon               randconfig-002-20250126    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250126    clang-19
i386        buildonly-randconfig-002-20250126    clang-19
i386        buildonly-randconfig-003-20250126    gcc-12
i386        buildonly-randconfig-004-20250126    gcc-12
i386        buildonly-randconfig-005-20250126    gcc-12
i386        buildonly-randconfig-006-20250126    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250126    gcc-14.2.0
loongarch             randconfig-002-20250126    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250126    gcc-14.2.0
nios2                 randconfig-002-20250126    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250126    gcc-14.2.0
parisc                randconfig-002-20250126    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    clang-18
powerpc               randconfig-001-20250126    clang-20
powerpc               randconfig-002-20250126    clang-17
powerpc               randconfig-003-20250126    gcc-14.2.0
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250126    gcc-14.2.0
powerpc64             randconfig-002-20250126    gcc-14.2.0
powerpc64             randconfig-003-20250126    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20250126    clang-20
riscv                 randconfig-002-20250126    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250126    gcc-14.2.0
s390                  randconfig-002-20250126    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250126    gcc-14.2.0
sh                    randconfig-002-20250126    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250126    gcc-14.2.0
sparc                 randconfig-002-20250126    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250126    gcc-14.2.0
sparc64               randconfig-002-20250126    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250126    clang-20
um                    randconfig-002-20250126    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250126    clang-19
x86_64      buildonly-randconfig-002-20250126    clang-19
x86_64      buildonly-randconfig-003-20250126    clang-19
x86_64      buildonly-randconfig-004-20250126    gcc-12
x86_64      buildonly-randconfig-005-20250126    clang-19
x86_64      buildonly-randconfig-006-20250126    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250126    gcc-14.2.0
xtensa                randconfig-002-20250126    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

