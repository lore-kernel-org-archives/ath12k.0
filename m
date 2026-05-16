Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7411CD4F3C
	for <ath12k@archiver.kernel.org>; Sat, 16 May 2026 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d4kxugFGf36nsbrwaFluItb+Wlo31LL34EZM38/MK+0=; b=tPKhm8K6e9pS9tZAvS4Dv290o7
	oYw8F+e6wP8Qw/viI5vXfaqfVhnd6bXA7MeGm86fc4g8jZCN4KxvOGLnSxweakQ8ZgTlu90wDE10Q
	Zkam3tlWWtwuv5nphOl73mpSdqvl+RNSyCl7WflmhZBScjp9sxnISvnynuefQUR2+xI0lpqejHq5s
	If8oj/StDUjN3gz20LpUQtwpK9hr5lQKfxq2Ge27eHWf4MCbncjHiL1yeZftQ8WHWMlr6H340zeHH
	TCkk7FY4mglPqoLQxwHZYPsEN0tXN9X//CetrmSQSEbkvzfbg5vW+cnou1wsbpj/vs5adinL4ueHL
	mcRY2qkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGuf-0000000AwRQ-2ZKg;
	Sat, 16 May 2026 15:26:49 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGuc-0000000AwQw-4B03
	for ath12k@lists.infradead.org;
	Sat, 16 May 2026 15:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778945207; x=1810481207;
  h=date:from:to:cc:subject:message-id;
  bh=oOEWQ/r239cp2SK925nHYAlxtRh8fw4xB7NnNvABhsI=;
  b=PgC2Z7HiY/GWcvJOfqyFc9sS10TaddAQt9KA7/6lUlN8r/0JBH8kzwAB
   ueRYUrpWr6tJMhXTxr9Zmi0OAy1QucVP9N1CAjZHkyBBTgGmMUsKppsjm
   INA3/2gWNPVhAV9BxLho3M/UUvVIH2IF5hCWc5D+6IxvYUGbxU0yeMAYJ
   OoOX5OPIYZaJ4IypVWqdx+Sc9lOJPQyKVN3V2vaPBdIUBh9+Ka5WrQnTH
   qFtvydNrpTpnDEuut78TVwPcvjbaRKkUmEmZ4RSAlgPJcVzxD1J1ypiTH
   11i6ICYmpQyMG5G42Fh2brf135PRAZMotz6WoFAEhMhhVR7XTArGwx0Bk
   A==;
X-CSE-ConnectionGUID: 3z3iwtCtSNiMeIfCvNDkKg==
X-CSE-MsgGUID: lc6aWz8MQd6KGUqWyEuWvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83740132"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="83740132"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 08:26:46 -0700
X-CSE-ConnectionGUID: xvbjU1coTnOAM9k2dAN1Yw==
X-CSE-MsgGUID: CaOz8B33Qp6iZBGfuSQaIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="235945941"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 May 2026 08:26:45 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOGuY-000000000ui-3HTi;
	Sat, 16 May 2026 15:26:42 +0000
Date: Sat, 16 May 2026 23:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 3525f7205ae644880405555e4968dfdd1a7a9aa7
Message-ID: <202605162335.UAFHQPr7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_082647_118303_4DC17239 
X-CRM114-Status: UNSURE (   3.67  )
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
branch HEAD: 3525f7205ae644880405555e4968dfdd1a7a9aa7  wifi: ath12k: fix EHT TX MCS limitation due to wrong 20 MHz-only parsing

elapsed time: 1320m

configs tested: 211
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260516    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260516    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260516    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260516    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260516    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260516    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260516    gcc-9.5.0
arm64                 randconfig-002-20260516    gcc-9.5.0
arm64                 randconfig-003-20260516    gcc-9.5.0
arm64                 randconfig-004-20260516    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260516    gcc-9.5.0
csky                  randconfig-002-20260516    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260516    gcc-11.5.0
hexagon               randconfig-002-20260516    gcc-11.5.0
i386                             alldefconfig    gcc-14
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260516    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260516    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260516    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260516    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260516    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260516    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260516    clang-20
i386                           randconfig-002    clang-20
i386                  randconfig-002-20260516    clang-20
i386                           randconfig-003    clang-20
i386                  randconfig-003-20260516    clang-20
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260516    clang-20
i386                           randconfig-005    clang-20
i386                  randconfig-005-20260516    clang-20
i386                           randconfig-006    clang-20
i386                  randconfig-006-20260516    clang-20
i386                           randconfig-007    clang-20
i386                  randconfig-007-20260516    clang-20
i386                  randconfig-011-20260516    gcc-14
i386                  randconfig-012-20260516    gcc-14
i386                  randconfig-013-20260516    gcc-14
i386                  randconfig-014-20260516    gcc-14
i386                  randconfig-015-20260516    gcc-14
i386                  randconfig-016-20260516    gcc-14
i386                  randconfig-017-20260516    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260516    gcc-11.5.0
loongarch             randconfig-002-20260516    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip32_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260516    gcc-11.5.0
nios2                 randconfig-002-20260516    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260516    gcc-12.5.0
parisc                randconfig-002-20260516    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260516    gcc-12.5.0
powerpc               randconfig-002-20260516    gcc-12.5.0
powerpc                     tqm8560_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260516    gcc-12.5.0
powerpc64             randconfig-002-20260516    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260516    gcc-15.2.0
riscv                 randconfig-002-20260516    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260516    gcc-15.2.0
s390                  randconfig-002-20260516    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260516    gcc-15.2.0
sh                    randconfig-002-20260516    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260516    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260516    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260516    gcc-8.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260516    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260516    gcc-8.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260516    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260516    gcc-14
x86_64      buildonly-randconfig-002-20260516    gcc-14
x86_64      buildonly-randconfig-003-20260516    gcc-14
x86_64      buildonly-randconfig-004-20260516    gcc-14
x86_64      buildonly-randconfig-005-20260516    gcc-14
x86_64      buildonly-randconfig-006-20260516    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260516    gcc-14
x86_64                randconfig-002-20260516    gcc-14
x86_64                randconfig-003-20260516    gcc-14
x86_64                randconfig-004-20260516    gcc-14
x86_64                randconfig-005-20260516    gcc-14
x86_64                randconfig-006-20260516    gcc-14
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260516    clang-20
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260516    clang-20
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260516    clang-20
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260516    clang-20
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260516    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260516    clang-20
x86_64                randconfig-071-20260516    gcc-14
x86_64                randconfig-072-20260516    gcc-14
x86_64                randconfig-073-20260516    gcc-14
x86_64                randconfig-074-20260516    gcc-14
x86_64                randconfig-075-20260516    gcc-14
x86_64                randconfig-076-20260516    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260516    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260516    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

