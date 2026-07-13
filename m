Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A731C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 05:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N9zPekj4K21zSbXSPhZCG9t3B1ph7jQ14zHKprvD3o8=; b=YrdcgY/CCjhSV8Pup/HLla/sFq
	yb7WIbuPcjEHqPfT1sIsPvctJUy2Y9AuiupQbMgbtjnYxY3C2lJiojakn0tk4PeHLWE+4M/KedxDX
	9ksf+OWdLOoI2GPgk4EseMfaG0FElspvwwtoExM1oUPQY/VE0a/vsqTBFEvJwbdxuiJU8K2wSDcpA
	btnrwnuq/G5Tcl+Tj6vl7JPuxctdmjZm2XhvV/XLLeArOjJJhgnuVieCEqGUHp1N+yVhSdVzbKBkl
	DNftXi9FrYf2cbCIClEs+9ADt0Kz8IwVKuzB9QE1Y4udbCIh3PNTVgOCzOjMDirRVyIqxTErq7j0X
	r1Cb8u9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9S7-00000008AUw-1ZL6;
	Mon, 13 Jul 2026 05:43:39 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9S5-00000008AUd-12PY
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 05:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783921417; x=1815457417;
  h=date:from:to:cc:subject:message-id;
  bh=luGVFE+uKAL29C+G/QJbzWvHOOlm1vqBtv6dF6QhNgA=;
  b=YcYZfay8bLkyUWiqh2oetHQCDG7ZxIAAWNIRmj3VDiuslixCyG6WbsZ7
   NQUBJDTVKF0BbsvHOfhjA31iStqbC+CiJG/cfeFlrek1vIJVx7B2SxjFe
   LvIL4kE1Synu7gQtNE3XesGjeRcojRb0i2VEr7PchHQGzFihJp4HJrKLU
   gDJ+Uk1lJgTxW35EZrxFF7cPeB0S6xWjgzNQeMEYPwNeyGRrhPXspCf7x
   Zv9cjoC3I7z8QxplYx137dKZwzqsqCIiiMDatJSCYzT63ngVDgvQGg+Vw
   mPH/giL35P+tqAf/X0lXo+gqGYb/jkU6ljo6F60znDyttQASc/OtKGdvr
   Q==;
X-CSE-ConnectionGUID: qipuaYl2T2aud4wHW3gUQw==
X-CSE-MsgGUID: v6nGhK9WTkaLVxMI2qOT6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84402288"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84402288"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 22:43:36 -0700
X-CSE-ConnectionGUID: XlsnIXXZRMeMzQCnji3YNw==
X-CSE-MsgGUID: 526JSB7rQiCUsqQXZmB3Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252815504"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jul 2026 22:43:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj9Rl-00000000LPc-2V7T;
	Mon, 13 Jul 2026 05:43:24 +0000
Date: Mon, 13 Jul 2026 13:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 7b713170f13d3f1dd7b2cb77eb727c6b7e315358
Message-ID: <202607131334.WizwRZ2r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_224337_311147_2423B55B 
X-CRM114-Status: UNSURE (   4.06  )
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
branch HEAD: 7b713170f13d3f1dd7b2cb77eb727c6b7e315358  Merge branch 'pending' into main-pending

elapsed time: 725m

configs tested: 247
configs skipped: 14

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
arc                   randconfig-001-20260713    gcc-8.5.0
arc                   randconfig-002-20260713    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                           omap1_defconfig    gcc-16.1.0
arm                   randconfig-001-20260713    gcc-13.4.0
arm                   randconfig-001-20260713    gcc-8.5.0
arm                   randconfig-002-20260713    gcc-15.2.0
arm                   randconfig-002-20260713    gcc-8.5.0
arm                   randconfig-003-20260713    gcc-13.4.0
arm                   randconfig-003-20260713    gcc-8.5.0
arm                   randconfig-004-20260713    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260713    clang-23
arm64                 randconfig-001-20260713    gcc-11.5.0
arm64                 randconfig-001-20260713    gcc-13.4.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260713    clang-23
arm64                 randconfig-002-20260713    gcc-13.4.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260713    clang-23
arm64                 randconfig-003-20260713    gcc-11.5.0
arm64                 randconfig-003-20260713    gcc-13.4.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260713    clang-23
arm64                 randconfig-004-20260713    gcc-13.4.0
arm64                 randconfig-004-20260713    gcc-8.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260713    clang-23
csky                  randconfig-001-20260713    gcc-13.4.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260713    clang-23
csky                  randconfig-002-20260713    gcc-11.5.0
csky                  randconfig-002-20260713    gcc-13.4.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260713    clang-23
hexagon               randconfig-002-20260713    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260713    gcc-14
i386        buildonly-randconfig-002-20260713    gcc-14
i386        buildonly-randconfig-003-20260713    gcc-14
i386        buildonly-randconfig-004-20260713    gcc-14
i386        buildonly-randconfig-005-20260713    gcc-14
i386        buildonly-randconfig-006-20260713    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260713    clang-22
i386                  randconfig-002-20260713    clang-22
i386                  randconfig-003-20260713    clang-22
i386                  randconfig-004-20260713    clang-22
i386                  randconfig-005-20260713    clang-22
i386                  randconfig-006-20260713    clang-22
i386                  randconfig-007-20260713    clang-22
i386                  randconfig-011-20260713    clang-22
i386                  randconfig-012-20260713    clang-22
i386                  randconfig-012-20260713    gcc-14
i386                  randconfig-013-20260713    clang-22
i386                  randconfig-014-20260713    clang-22
i386                  randconfig-014-20260713    gcc-13
i386                  randconfig-015-20260713    clang-22
i386                  randconfig-015-20260713    gcc-14
i386                  randconfig-016-20260713    clang-22
i386                  randconfig-017-20260713    clang-22
i386                  randconfig-017-20260713    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260713    clang-23
loongarch             randconfig-002-20260713    clang-23
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
mips                  maltasmvp_eva_defconfig    gcc-16.1.0
mips                        omega2p_defconfig    clang-17
mips                          rm200_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260713    clang-23
nios2                 randconfig-002-20260713    clang-23
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260713    clang-23
parisc                randconfig-001-20260713    gcc-10.5.0
parisc                randconfig-002-20260713    clang-23
parisc                randconfig-002-20260713    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                     mpc512x_defconfig    clang-23
powerpc               randconfig-001-20260713    clang-23
powerpc               randconfig-001-20260713    gcc-13.4.0
powerpc               randconfig-002-20260713    clang-23
powerpc64             randconfig-001-20260713    clang-23
powerpc64             randconfig-001-20260713    gcc-15.2.0
powerpc64             randconfig-002-20260713    clang-23
powerpc64             randconfig-002-20260713    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-19
riscv                 randconfig-001-20260713    clang-19
riscv                 randconfig-001-20260713    gcc-15.2.0
riscv                          randconfig-002    clang-19
riscv                 randconfig-002-20260713    clang-19
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-19
s390                  randconfig-001-20260713    clang-17
s390                  randconfig-001-20260713    clang-19
s390                           randconfig-002    clang-19
s390                  randconfig-002-20260713    clang-17
s390                  randconfig-002-20260713    clang-19
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-19
sh                    randconfig-001-20260713    clang-19
sh                    randconfig-001-20260713    gcc-16.1.0
sh                             randconfig-002    clang-19
sh                    randconfig-002-20260713    clang-19
sh                    randconfig-002-20260713    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-12.5.0
sparc                 randconfig-001-20260713    gcc-12.5.0
sparc                          randconfig-002    gcc-12.5.0
sparc                 randconfig-002-20260713    gcc-12.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-12.5.0
sparc64               randconfig-001-20260713    gcc-12.5.0
sparc64                        randconfig-002    gcc-12.5.0
sparc64               randconfig-002-20260713    gcc-12.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-12.5.0
um                    randconfig-001-20260713    gcc-12.5.0
um                             randconfig-002    gcc-12.5.0
um                    randconfig-002-20260713    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260713    clang-22
x86_64      buildonly-randconfig-001-20260713    gcc-14
x86_64      buildonly-randconfig-002-20260713    clang-22
x86_64      buildonly-randconfig-002-20260713    gcc-12
x86_64      buildonly-randconfig-002-20260713    gcc-14
x86_64      buildonly-randconfig-003-20260713    clang-22
x86_64      buildonly-randconfig-004-20260713    clang-22
x86_64      buildonly-randconfig-005-20260713    clang-22
x86_64      buildonly-randconfig-006-20260713    clang-22
x86_64      buildonly-randconfig-006-20260713    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260713    gcc-13
x86_64                randconfig-002-20260713    gcc-13
x86_64                randconfig-003-20260713    gcc-13
x86_64                randconfig-004-20260713    gcc-13
x86_64                randconfig-005-20260713    gcc-13
x86_64                randconfig-006-20260713    gcc-13
x86_64                randconfig-011-20260713    gcc-14
x86_64                randconfig-012-20260713    gcc-14
x86_64                randconfig-013-20260713    gcc-14
x86_64                randconfig-014-20260713    gcc-14
x86_64                randconfig-015-20260713    gcc-14
x86_64                randconfig-016-20260713    gcc-14
x86_64                randconfig-071-20260713    gcc-14
x86_64                randconfig-072-20260713    gcc-14
x86_64                randconfig-073-20260713    gcc-14
x86_64                randconfig-074-20260713    gcc-14
x86_64                randconfig-075-20260713    gcc-14
x86_64                randconfig-076-20260713    gcc-14
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
xtensa                         randconfig-001    gcc-12.5.0
xtensa                randconfig-001-20260713    gcc-12.5.0
xtensa                         randconfig-002    gcc-12.5.0
xtensa                randconfig-002-20260713    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

