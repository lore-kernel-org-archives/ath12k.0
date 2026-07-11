Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5764BC43458
	for <ath12k@archiver.kernel.org>; Sat, 11 Jul 2026 02:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/nbShO7BUIKxEDvxhVMo2R36y0U/kgKvz/y/CdEouaA=; b=C4agqNeMcOt9x4U74VtFwdz09J
	rqYm+TK+FFZXs+jauL1ytMCk23rs7eJ9fCgJ9mqspuw53ivwO16wSC3l7Wv2Bn7G1LUUDPVZBUIIt
	M6BRikOoEp8mw/DYGrCP2//aiVaKefr7W8GaYaQTMSLwta9BxzaV9uDBg4DdUks0WHK5ZSqdXZHEG
	DhcTGjgkBe3n1bXKsbj/k5an8PHtGzwuy8tsN2DAYFhHjtddXNlFrHEuUcabTuYHvOm60jnCwA20s
	HFH90PF53E2cRswYrXPVGfYZEHQkDwRuGc5QC4IyHhMwjffmURkfZ4Ky82DzNHarcrd1Co5Wx8JpB
	wGXwaXng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNaC-000000068sG-0nPT;
	Sat, 11 Jul 2026 02:36:48 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNa9-000000068rx-1qy1
	for ath12k@lists.infradead.org;
	Sat, 11 Jul 2026 02:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783737405; x=1815273405;
  h=date:from:to:cc:subject:message-id;
  bh=FD+QiZ4OI6RyLIrYJFiQ0ly9UdBFakmeG2ZqFFc+kzM=;
  b=W4Yric/m+TkfO6juOLC7bnCGpLD8KGN0tq+bp6ZMhrO0PNxaSzqTLRYM
   WrmKutHhgLEPjIN/KcYVkXscbvwERWN64qIoRkIvGNgyJ0ecIO7EdCbAu
   2WbYJT5FFz1WqY/2NoZY//WsPhduuDAai63p/4I8xOx2hsPyq28bEmwlh
   5qmdkVUgA/M7g3M7xPEKmTT2440uFedwdcOkGjz4m+dyA+QYlqOs4vyJc
   vJfWzSKLAIOrqefv3OfKirh6QOmg2z/NAJxW6KwQ2q/jPg74LYMUf4aXV
   t/B9xY1aLo/JQfitOmgP5cb7uMbulXXexyc3kqSYVMTLmVZ6c1gWKkl3t
   Q==;
X-CSE-ConnectionGUID: giwRkaQSS7WBOQCS8EyY8A==
X-CSE-MsgGUID: LGKctADYSgK0uTsDAHZcMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83556685"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83556685"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 19:36:44 -0700
X-CSE-ConnectionGUID: ChbqCuoDS2C8RbGnHXlKHg==
X-CSE-MsgGUID: tFLFk+OFQoeRoySAC5+VbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253915326"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Jul 2026 19:36:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiNa4-00000000Jeu-2GSq;
	Sat, 11 Jul 2026 02:36:40 +0000
Date: Sat, 11 Jul 2026 10:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 e36b3c776adc9891d8574241be77640ded819ee7
Message-ID: <202607111056.H9sBNg8v-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_193645_507909_BDE35D22 
X-CRM114-Status: UNSURE (   3.62  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: e36b3c776adc9891d8574241be77640ded819ee7  Add localversion-wireless-testing-ath

elapsed time: 1236m

configs tested: 372
configs skipped: 5

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
arc                            randconfig-001    clang-23
arc                   randconfig-001-20260710    clang-23
arc                   randconfig-001-20260711    gcc-13.4.0
arc                            randconfig-002    clang-23
arc                   randconfig-002-20260710    clang-23
arc                   randconfig-002-20260711    gcc-13.4.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                           omap1_defconfig    gcc-16.1.0
arm                            randconfig-001    clang-23
arm                   randconfig-001-20260710    clang-23
arm                   randconfig-001-20260711    gcc-13.4.0
arm                            randconfig-002    clang-23
arm                   randconfig-002-20260710    clang-23
arm                   randconfig-002-20260711    gcc-13.4.0
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260710    clang-23
arm                   randconfig-003-20260711    gcc-13.4.0
arm                            randconfig-004    clang-23
arm                   randconfig-004-20260710    clang-23
arm                   randconfig-004-20260711    gcc-13.4.0
arm                          sp7021_defconfig    gcc-16.1.0
arm                        vexpress_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260710    clang-23
arm64                 randconfig-001-20260710    gcc-10.5.0
arm64                 randconfig-001-20260710    gcc-8.5.0
arm64                 randconfig-001-20260711    gcc-16.1.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260710    clang-23
arm64                 randconfig-002-20260710    gcc-10.5.0
arm64                 randconfig-002-20260710    gcc-8.5.0
arm64                 randconfig-002-20260711    gcc-16.1.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260710    clang-23
arm64                 randconfig-003-20260710    gcc-10.5.0
arm64                 randconfig-003-20260710    gcc-16.1.0
arm64                 randconfig-003-20260711    gcc-16.1.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260710    clang-23
arm64                 randconfig-004-20260710    gcc-10.5.0
arm64                 randconfig-004-20260710    gcc-8.5.0
arm64                 randconfig-004-20260711    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260710    clang-23
csky                  randconfig-001-20260710    gcc-10.5.0
csky                  randconfig-001-20260711    gcc-16.1.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260710    clang-23
csky                  randconfig-002-20260710    gcc-10.5.0
csky                  randconfig-002-20260710    gcc-16.1.0
csky                  randconfig-002-20260711    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260710    clang-23
hexagon               randconfig-001-20260710    gcc-12.5.0
hexagon               randconfig-001-20260711    gcc-16.1.0
hexagon               randconfig-002-20260710    clang-20
hexagon               randconfig-002-20260710    gcc-12.5.0
hexagon               randconfig-002-20260711    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260710    clang-22
i386        buildonly-randconfig-001-20260711    gcc-14
i386        buildonly-randconfig-002-20260710    clang-22
i386        buildonly-randconfig-002-20260711    gcc-14
i386        buildonly-randconfig-003-20260710    clang-22
i386        buildonly-randconfig-003-20260711    gcc-14
i386        buildonly-randconfig-004-20260710    clang-22
i386        buildonly-randconfig-004-20260711    gcc-14
i386        buildonly-randconfig-005-20260710    clang-22
i386        buildonly-randconfig-005-20260711    gcc-14
i386        buildonly-randconfig-006-20260710    clang-22
i386        buildonly-randconfig-006-20260711    gcc-14
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260710    clang-22
i386                  randconfig-001-20260711    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260710    clang-22
i386                  randconfig-002-20260711    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260710    clang-22
i386                  randconfig-003-20260711    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260710    clang-22
i386                  randconfig-004-20260711    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260710    clang-22
i386                  randconfig-005-20260711    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260710    clang-22
i386                  randconfig-006-20260711    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260710    clang-22
i386                  randconfig-007-20260711    clang-22
i386                           randconfig-011    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260710    gcc-14
i386                  randconfig-011-20260711    gcc-13
i386                           randconfig-012    clang-22
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260710    clang-22
i386                  randconfig-012-20260710    gcc-14
i386                  randconfig-012-20260711    gcc-13
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260710    gcc-14
i386                  randconfig-013-20260711    gcc-13
i386                           randconfig-014    clang-22
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260710    gcc-14
i386                  randconfig-014-20260711    gcc-13
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260710    clang-22
i386                  randconfig-015-20260710    gcc-14
i386                  randconfig-015-20260711    gcc-13
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260710    gcc-14
i386                  randconfig-016-20260711    gcc-13
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260710    gcc-14
i386                  randconfig-017-20260711    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260710    gcc-12.5.0
loongarch             randconfig-001-20260711    gcc-16.1.0
loongarch             randconfig-002-20260710    clang-18
loongarch             randconfig-002-20260710    gcc-12.5.0
loongarch             randconfig-002-20260711    gcc-16.1.0
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
mips                malta_qemu_32r6_defconfig    gcc-16.1.0
mips                   sb1250_swarm_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260710    gcc-12.5.0
nios2                 randconfig-001-20260710    gcc-8.5.0
nios2                 randconfig-001-20260711    gcc-16.1.0
nios2                 randconfig-002-20260710    gcc-12.5.0
nios2                 randconfig-002-20260710    gcc-8.5.0
nios2                 randconfig-002-20260711    gcc-16.1.0
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
parisc                         randconfig-001    clang-17
parisc                         randconfig-001    gcc-10.5.0
parisc                randconfig-001-20260710    clang-17
parisc                randconfig-001-20260711    clang-17
parisc                randconfig-001-20260711    gcc-10.5.0
parisc                         randconfig-002    clang-17
parisc                         randconfig-002    gcc-10.5.0
parisc                randconfig-002-20260710    clang-17
parisc                randconfig-002-20260711    clang-17
parisc                randconfig-002-20260711    gcc-10.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                        randconfig-001    clang-17
powerpc                        randconfig-001    gcc-10.5.0
powerpc               randconfig-001-20260710    clang-17
powerpc               randconfig-001-20260711    clang-17
powerpc               randconfig-001-20260711    gcc-10.5.0
powerpc                        randconfig-002    clang-17
powerpc                        randconfig-002    gcc-10.5.0
powerpc               randconfig-002-20260710    clang-17
powerpc               randconfig-002-20260711    clang-17
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260710    clang-17
powerpc64             randconfig-001-20260711    clang-17
powerpc64             randconfig-001-20260711    gcc-10.5.0
powerpc64                      randconfig-002    clang-17
powerpc64                      randconfig-002    gcc-10.5.0
powerpc64             randconfig-002-20260710    clang-17
powerpc64             randconfig-002-20260711    clang-17
powerpc64             randconfig-002-20260711    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260710    clang-17
riscv                 randconfig-001-20260711    gcc-8.5.0
riscv                 randconfig-002-20260710    clang-17
riscv                 randconfig-002-20260711    gcc-8.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260710    clang-17
s390                  randconfig-001-20260710    gcc-9.5.0
s390                  randconfig-001-20260711    gcc-8.5.0
s390                  randconfig-002-20260710    clang-17
s390                  randconfig-002-20260710    gcc-8.5.0
s390                  randconfig-002-20260711    gcc-8.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260710    clang-17
sh                    randconfig-001-20260710    gcc-16.1.0
sh                    randconfig-001-20260711    gcc-8.5.0
sh                    randconfig-002-20260710    clang-17
sh                    randconfig-002-20260710    gcc-12.5.0
sh                    randconfig-002-20260711    gcc-8.5.0
sh                   sh7724_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260710    gcc-15.2.0
sparc                 randconfig-001-20260711    gcc-16.1.0
sparc                 randconfig-002-20260710    gcc-13.4.0
sparc                 randconfig-002-20260711    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260710    gcc-15.2.0
sparc64               randconfig-001-20260711    gcc-16.1.0
sparc64               randconfig-002-20260710    gcc-13.4.0
sparc64               randconfig-002-20260711    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260710    gcc-14
um                    randconfig-001-20260711    gcc-16.1.0
um                    randconfig-002-20260710    clang-23
um                    randconfig-002-20260711    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260710    clang-22
x86_64      buildonly-randconfig-001-20260711    gcc-14
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260710    clang-22
x86_64      buildonly-randconfig-002-20260711    gcc-14
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260710    clang-22
x86_64      buildonly-randconfig-003-20260711    gcc-14
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260710    clang-22
x86_64      buildonly-randconfig-004-20260711    gcc-14
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260710    clang-22
x86_64      buildonly-randconfig-005-20260711    gcc-14
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260710    clang-22
x86_64      buildonly-randconfig-006-20260711    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260710    clang-22
x86_64                randconfig-001-20260710    gcc-14
x86_64                randconfig-001-20260711    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260710    clang-22
x86_64                randconfig-002-20260710    gcc-14
x86_64                randconfig-002-20260711    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260710    clang-22
x86_64                randconfig-003-20260710    gcc-14
x86_64                randconfig-003-20260711    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260710    clang-22
x86_64                randconfig-004-20260710    gcc-14
x86_64                randconfig-004-20260711    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260710    clang-22
x86_64                randconfig-005-20260710    gcc-14
x86_64                randconfig-005-20260711    gcc-14
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260710    clang-22
x86_64                randconfig-006-20260710    gcc-14
x86_64                randconfig-006-20260711    gcc-14
x86_64                randconfig-011-20260710    clang-22
x86_64                randconfig-011-20260710    gcc-14
x86_64                randconfig-011-20260711    gcc-14
x86_64                randconfig-012-20260710    clang-22
x86_64                randconfig-012-20260710    gcc-14
x86_64                randconfig-012-20260711    gcc-14
x86_64                randconfig-013-20260710    clang-22
x86_64                randconfig-013-20260711    gcc-14
x86_64                randconfig-014-20260710    clang-22
x86_64                randconfig-014-20260711    gcc-14
x86_64                randconfig-015-20260710    clang-22
x86_64                randconfig-015-20260710    gcc-14
x86_64                randconfig-015-20260711    gcc-14
x86_64                randconfig-016-20260710    clang-22
x86_64                randconfig-016-20260711    gcc-14
x86_64                randconfig-071-20260710    gcc-14
x86_64                randconfig-071-20260711    gcc-14
x86_64                randconfig-072-20260710    gcc-14
x86_64                randconfig-072-20260711    gcc-14
x86_64                randconfig-073-20260710    gcc-14
x86_64                randconfig-073-20260711    gcc-14
x86_64                randconfig-074-20260710    gcc-14
x86_64                randconfig-074-20260711    gcc-14
x86_64                randconfig-075-20260710    gcc-14
x86_64                randconfig-075-20260711    gcc-14
x86_64                randconfig-076-20260710    gcc-14
x86_64                randconfig-076-20260711    gcc-14
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
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260711    gcc-16.1.0
xtensa                randconfig-002-20260710    gcc-9.5.0
xtensa                randconfig-002-20260711    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

