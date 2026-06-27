Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666CCC43458
	for <ath12k@archiver.kernel.org>; Sat, 27 Jun 2026 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VcOLUFpBcSnkzT3Jovs10m+nJVNw8gWAyd76f8veTYQ=; b=m0fXssWdMYl7XAcjwejnWRKDS7
	3+PRy45afder6FY+srbleUJIJWilD4Cc+VxW36jXX4bfdLaUJ/6t/MfMGxs8AtUMtJpiRqSJi4bTm
	K2USbw3g/BydeqGt52TURxFXbJi2dgBr1Pt73kO5HaOPxWK7v5ei0XBz/4tAYFY7l4B9G5aTUBJnU
	XenizNl/gbMrRkI8zd+4T202LziyKAq0hslQiIIJ+EYE+ZcHOc/WpXpI9Wl7BVmwNoYlvx/AuN7cr
	3blVntkYkx4D0gzJFB5lXIRm89Mi7qz6o5PUsyDBvMpGA6WzzfBbEn9JMDS9zQoBSuxybDdyMiDwd
	mEcSLuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdR2M-0000000CPJt-3vIB;
	Sat, 27 Jun 2026 11:17:26 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdR2K-0000000CPJZ-1h2E
	for ath12k@lists.infradead.org;
	Sat, 27 Jun 2026 11:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782559045; x=1814095045;
  h=date:from:to:cc:subject:message-id;
  bh=dRON/FZcZFS88iJEO/wDwYgZgRV1QaHp3gaRmwFygUM=;
  b=L8kNuY/BfdqdcT6D9Vn3eJI18R81TZojako2MFqToPwFYErkoMlJLV3l
   w1UZ+wtLprkRAwOt26evxeEqGxglv7c+RAvTj95yx73e7RJRfkC58hrEO
   4zBZvekYCZ8cR0xK7YudOBGO8PX6AvA2S7BfwwMldtn9DyaVdWzKP7Aah
   uafti7F5yHE2AatPw6DLqeFy06sV4ppIyw3T2kwHqMqhgUQo02VBUQhIQ
   aPkT3kPCYhogoPQRTSNz7/q/T1lfnBSl4wqBuLfPygA3FRGQtYIgXt+Ct
   Kz6x/1WFn1AEkXkdtSNJ1IEwph7Koeu/0GMxEBc77gQfQ34G/0zVriMjD
   A==;
X-CSE-ConnectionGUID: 1y2hqv+mShac7Gf6INYEig==
X-CSE-MsgGUID: 0spTZaSHRA+4kTBmjIMiJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83206305"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="83206305"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 04:17:24 -0700
X-CSE-ConnectionGUID: 7miTJgUeS1q1XJEbbK06PA==
X-CSE-MsgGUID: OAOqk2GrRpe3Qan2ENNJbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="247552537"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2026 04:17:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdR2G-000000005or-0AGU;
	Sat, 27 Jun 2026 11:17:20 +0000
Date: Sat, 27 Jun 2026 19:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 0352b3372c26dc5474f2f99bf26e8018d23828c5
Message-ID: <202606271927.MJQx38bg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_041724_506199_CFDB3A1D 
X-CRM114-Status: UNSURE (   3.68  )
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
branch HEAD: 0352b3372c26dc5474f2f99bf26e8018d23828c5  wifi: ath12k: reset REOQ LUT addresses before firmware stop

elapsed time: 738m

configs tested: 225
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260627    gcc-16.1.0
arc                   randconfig-002-20260627    gcc-16.1.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                         at91_dt_defconfig    clang-17
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260627    gcc-16.1.0
arm                   randconfig-002-20260627    gcc-16.1.0
arm                   randconfig-003-20260627    gcc-16.1.0
arm                   randconfig-004-20260627    gcc-16.1.0
arm                           spitz_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260627    gcc-10.5.0
arm64                 randconfig-002-20260627    gcc-10.5.0
arm64                 randconfig-003-20260627    gcc-10.5.0
arm64                 randconfig-004-20260627    gcc-10.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260627    gcc-10.5.0
csky                  randconfig-002-20260627    gcc-10.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260627    gcc-11.5.0
hexagon               randconfig-002-20260627    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260627    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260627    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260627    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260627    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260627    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260627    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260627    clang-22
i386                  randconfig-002-20260627    clang-22
i386                  randconfig-003-20260627    clang-22
i386                  randconfig-003-20260627    gcc-13
i386                  randconfig-004-20260627    clang-22
i386                  randconfig-005-20260627    clang-22
i386                  randconfig-006-20260627    clang-22
i386                  randconfig-006-20260627    gcc-14
i386                  randconfig-007-20260627    clang-22
i386                  randconfig-011-20260627    clang-22
i386                  randconfig-012-20260627    clang-22
i386                  randconfig-013-20260627    clang-22
i386                  randconfig-014-20260627    clang-22
i386                  randconfig-015-20260627    clang-22
i386                  randconfig-016-20260627    clang-22
i386                  randconfig-017-20260627    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260627    gcc-11.5.0
loongarch             randconfig-002-20260627    gcc-11.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260627    gcc-11.5.0
nios2                 randconfig-002-20260627    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260627    gcc-8.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260627    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               mpc834x_itxgp_defconfig    clang-23
powerpc                        randconfig-001    gcc-8.5.0
powerpc               randconfig-001-20260627    gcc-8.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260627    gcc-8.5.0
powerpc64                      randconfig-001    gcc-8.5.0
powerpc64             randconfig-001-20260627    gcc-8.5.0
powerpc64                      randconfig-002    gcc-8.5.0
powerpc64             randconfig-002-20260627    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260627    clang-23
riscv                 randconfig-002-20260627    clang-23
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260627    clang-23
s390                  randconfig-002-20260627    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260627    clang-23
sh                    randconfig-002-20260627    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260627    gcc-8.5.0
sparc                 randconfig-002-20260627    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260627    gcc-8.5.0
sparc64               randconfig-002-20260627    gcc-8.5.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260627    gcc-8.5.0
um                    randconfig-002-20260627    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260627    gcc-14
x86_64      buildonly-randconfig-002-20260627    gcc-14
x86_64      buildonly-randconfig-003-20260627    gcc-14
x86_64      buildonly-randconfig-004-20260627    gcc-14
x86_64      buildonly-randconfig-005-20260627    gcc-14
x86_64      buildonly-randconfig-006-20260627    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260627    clang-22
x86_64                randconfig-002-20260627    clang-22
x86_64                randconfig-003-20260627    clang-22
x86_64                randconfig-004-20260627    clang-22
x86_64                randconfig-005-20260627    clang-22
x86_64                randconfig-006-20260627    clang-22
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260627    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260627    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260627    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260627    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260627    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260627    gcc-14
x86_64                         randconfig-071    clang-22
x86_64                randconfig-071-20260627    clang-22
x86_64                         randconfig-072    clang-22
x86_64                randconfig-072-20260627    clang-22
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260627    clang-22
x86_64                         randconfig-074    clang-22
x86_64                randconfig-074-20260627    clang-22
x86_64                         randconfig-075    clang-22
x86_64                randconfig-075-20260627    clang-22
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260627    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260627    gcc-8.5.0
xtensa                randconfig-002-20260627    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

