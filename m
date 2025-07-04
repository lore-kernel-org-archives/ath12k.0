Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429D6C8303D
	for <ath12k@archiver.kernel.org>; Fri,  4 Jul 2025 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+FAViSAp5keVZTyB7PxdgXhgZ2KIOA7yI7MT8AHmcv4=; b=hHXQforodL0nmGKoA7/8QjLyPK
	OhMXSteT2MvdH0N3BmJqFKHL+hft3FSq9JqTP+Z7gA8ZGjRUe2F6BLCzFSYuUhFKwG5iAbZzOdErb
	xIfcxnqWdOrYYDAGpU6V7B5nxbDilZuBe8q9BYyuesW3CrgPzkMGZ7Ye3Of3DaeOTBSiuFr9AzUy0
	qCNBOJO39ReN1Gw+awmzSE5J9Y2ZjeOnVJJZQ5egeBYq+Pcf82KydiSBxkgJlIL7MkNM8RnmzDVHN
	SGKoNkn7FvzvUQd7/4AtyKQibPKgigwAP5CqMDfX+g2I97yU0EXwohI5gBma4onrg6quMEzHqyL0F
	/4KfrjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhha-0000000Ei60-4Bh8;
	Fri, 04 Jul 2025 14:47:47 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhVI-0000000EgKw-3WJF
	for ath12k@lists.infradead.org;
	Fri, 04 Jul 2025 14:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751639705; x=1783175705;
  h=date:from:to:cc:subject:message-id;
  bh=l1IOrPF/EpwFeqk0I/+51XVFGZYShJ0PNgo64oN/JNk=;
  b=ASviAYEpqMSFtI4Pmje0+EyZ7+2L1TY/znhTtn1w7x79eA5aez72x00a
   95l0Nc4ySs5Z2+cM8V/3zDKdzo+gJEZ8LEodPjvTFQMWjng7oqmS0jwcA
   R9VNLyR8JP5+ZNlPf11SELIuPjyzMW97axo6SS+Y4BLWSwvgOJl9sjSrd
   ALg4akOgAfWoC2PC9FTZixILg7NfreiuHDk5oa2Lu15Fo01JX/HWQJy5r
   kCaoMUu3fgF/tFZ0LY/y0mYZn5vLGTak6qu4imlWbe2AoEn17e29aN5S4
   s1K4nDdlprvikLJJy0YSoYdMk3+mrfPyc1odLsp84g8pJwwOZpyHuMNVx
   Q==;
X-CSE-ConnectionGUID: kiOZzoYbTxGdjsi7R0ptFA==
X-CSE-MsgGUID: CV6hOv25SLyO3oixD84wFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="41601043"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="41601043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 07:35:05 -0700
X-CSE-ConnectionGUID: xPCcLtimRta6ZhGBlwrkcw==
X-CSE-MsgGUID: HxGR1VipSaKMas1aU33iTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154080282"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2025 07:35:03 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXhVE-0003nh-15;
	Fri, 04 Jul 2025 14:35:00 +0000
Date: Fri, 04 Jul 2025 22:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 77711ada19d0948d27f6479e78897c4348e734d4
Message-ID: <202507042228.xIXBLydu-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_073504_940142_5AC82D21 
X-CRM114-Status: UNSURE (   3.69  )
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
branch HEAD: 77711ada19d0948d27f6479e78897c4348e734d4  Merge branch 'pending' into main-pending

elapsed time: 937m

configs tested: 216
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250704    clang-21
arc                   randconfig-001-20250704    gcc-8.5.0
arc                   randconfig-002-20250704    clang-21
arc                   randconfig-002-20250704    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                      integrator_defconfig    gcc-15.1.0
arm                       omap2plus_defconfig    gcc-15.1.0
arm                   randconfig-001-20250704    clang-21
arm                   randconfig-001-20250704    gcc-8.5.0
arm                   randconfig-002-20250704    clang-21
arm                   randconfig-003-20250704    clang-21
arm                   randconfig-003-20250704    gcc-8.5.0
arm                   randconfig-004-20250704    clang-21
arm                   randconfig-004-20250704    gcc-13.4.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250704    clang-21
arm64                 randconfig-001-20250704    gcc-14.3.0
arm64                 randconfig-002-20250704    clang-21
arm64                 randconfig-003-20250704    clang-16
arm64                 randconfig-003-20250704    clang-21
arm64                 randconfig-004-20250704    clang-21
arm64                 randconfig-004-20250704    gcc-10.5.0
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250704    gcc-10.5.0
csky                  randconfig-001-20250704    gcc-15.1.0
csky                  randconfig-002-20250704    gcc-10.5.0
csky                  randconfig-002-20250704    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250704    clang-21
hexagon               randconfig-001-20250704    gcc-10.5.0
hexagon               randconfig-002-20250704    clang-21
hexagon               randconfig-002-20250704    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250704    clang-20
i386        buildonly-randconfig-001-20250704    gcc-12
i386        buildonly-randconfig-002-20250704    clang-20
i386        buildonly-randconfig-003-20250704    clang-20
i386        buildonly-randconfig-004-20250704    clang-20
i386        buildonly-randconfig-005-20250704    clang-20
i386        buildonly-randconfig-006-20250704    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250704    clang-20
i386                  randconfig-002-20250704    clang-20
i386                  randconfig-003-20250704    clang-20
i386                  randconfig-004-20250704    clang-20
i386                  randconfig-005-20250704    clang-20
i386                  randconfig-006-20250704    clang-20
i386                  randconfig-007-20250704    clang-20
i386                  randconfig-011-20250704    clang-20
i386                  randconfig-012-20250704    clang-20
i386                  randconfig-013-20250704    clang-20
i386                  randconfig-014-20250704    clang-20
i386                  randconfig-015-20250704    clang-20
i386                  randconfig-016-20250704    clang-20
i386                  randconfig-017-20250704    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250704    gcc-10.5.0
loongarch             randconfig-001-20250704    gcc-15.1.0
loongarch             randconfig-002-20250704    gcc-10.5.0
loongarch             randconfig-002-20250704    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      malta_kvm_defconfig    gcc-15.1.0
mips                    maltaup_xpa_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250704    gcc-10.5.0
nios2                 randconfig-001-20250704    gcc-8.5.0
nios2                 randconfig-002-20250704    gcc-10.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250704    gcc-10.5.0
parisc                randconfig-001-20250704    gcc-14.3.0
parisc                randconfig-002-20250704    gcc-10.5.0
parisc                randconfig-002-20250704    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250704    clang-21
powerpc               randconfig-001-20250704    gcc-10.5.0
powerpc               randconfig-002-20250704    gcc-10.5.0
powerpc               randconfig-002-20250704    gcc-9.3.0
powerpc               randconfig-003-20250704    clang-21
powerpc               randconfig-003-20250704    gcc-10.5.0
powerpc64                        alldefconfig    gcc-15.1.0
powerpc64             randconfig-001-20250704    clang-18
powerpc64             randconfig-001-20250704    gcc-10.5.0
powerpc64             randconfig-002-20250704    gcc-10.5.0
powerpc64             randconfig-003-20250704    clang-18
powerpc64             randconfig-003-20250704    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250704    clang-21
riscv                 randconfig-002-20250704    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250704    clang-21
s390                  randconfig-001-20250704    gcc-15.1.0
s390                  randconfig-002-20250704    clang-21
s390                  randconfig-002-20250704    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250704    clang-21
sh                    randconfig-001-20250704    gcc-15.1.0
sh                    randconfig-002-20250704    clang-21
sh                    randconfig-002-20250704    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250704    clang-21
sparc                 randconfig-001-20250704    gcc-11.5.0
sparc                 randconfig-002-20250704    clang-21
sparc                 randconfig-002-20250704    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250704    clang-21
sparc64               randconfig-001-20250704    gcc-13.4.0
sparc64               randconfig-002-20250704    clang-20
sparc64               randconfig-002-20250704    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250704    clang-21
um                    randconfig-002-20250704    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250704    clang-20
x86_64      buildonly-randconfig-001-20250704    gcc-12
x86_64      buildonly-randconfig-002-20250704    gcc-12
x86_64      buildonly-randconfig-003-20250704    clang-20
x86_64      buildonly-randconfig-003-20250704    gcc-12
x86_64      buildonly-randconfig-004-20250704    clang-20
x86_64      buildonly-randconfig-004-20250704    gcc-12
x86_64      buildonly-randconfig-005-20250704    clang-20
x86_64      buildonly-randconfig-005-20250704    gcc-12
x86_64      buildonly-randconfig-006-20250704    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250704    gcc-12
x86_64                randconfig-002-20250704    gcc-12
x86_64                randconfig-003-20250704    gcc-12
x86_64                randconfig-004-20250704    gcc-12
x86_64                randconfig-005-20250704    gcc-12
x86_64                randconfig-006-20250704    gcc-12
x86_64                randconfig-007-20250704    gcc-12
x86_64                randconfig-008-20250704    gcc-12
x86_64                randconfig-071-20250704    clang-20
x86_64                randconfig-072-20250704    clang-20
x86_64                randconfig-073-20250704    clang-20
x86_64                randconfig-074-20250704    clang-20
x86_64                randconfig-075-20250704    clang-20
x86_64                randconfig-076-20250704    clang-20
x86_64                randconfig-077-20250704    clang-20
x86_64                randconfig-078-20250704    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250704    clang-21
xtensa                randconfig-001-20250704    gcc-12.4.0
xtensa                randconfig-002-20250704    clang-21
xtensa                randconfig-002-20250704    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

