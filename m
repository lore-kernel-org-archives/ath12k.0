Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF57BC83F10
	for <ath12k@archiver.kernel.org>; Sat, 12 Jul 2025 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WNlShQk/b5/5o7pyHUtlc5ymnClQEKmilRWpKcrBdK8=; b=F4g5P5MUx3UTCy8Qq8BznIu+MB
	2X2/WBaOrXg0pE1q2Anld94GjEo2pdcZYBrA/3f+gzRd187LJ7rdXdL+LW7bnldaZKmqVJ/AiMR3A
	lqf2CW/x/2cL35ye7vdB+3w0FfqjWjTc9Chh44TxvVBex9F/Eir3uvfeLOEKdIQVLxgcnVhafmMMm
	fL8ayPnhmE3fuKg9rwoTLD3iiBB4l5yiykYA+00mWe1r5VwBAUCAZLsmiMbJ0gRwH0rstE/AjjNeH
	zpTUXljZzldfC0TAaW2IzpqA+J46h6glFtlX3WZSahWeCfDlllUqE5H30OM1MjOGJZU3NQbtTmuRA
	8L/3vPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uabzD-0000000GksN-1cqo;
	Sat, 12 Jul 2025 15:17:59 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uabzA-0000000Gks2-1NqW
	for ath12k@lists.infradead.org;
	Sat, 12 Jul 2025 15:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752333476; x=1783869476;
  h=date:from:to:cc:subject:message-id;
  bh=0ZIKjbiYmuLx10PXt8R9cD8cBKl0h+j8jdqY5iopotI=;
  b=LQPBhlVYmpV1XCMYC/66WFMIMjzWUgEqVE6orvBU0FhiMCIVnwa+N/kB
   Lx72hAl71Vh4YIZ6S7hZg2b6k+NxUCpQyN4MdB9m5WUiilc8lhlqj4Pva
   PdJAEm1MvivuClspNBF2O2+wAeb0hxl9sl/pJw65ufvNtTGyH0Oj6R/De
   VtU+gTESy4luEl7A0kcUVxz/3Qxp99IlI1oLSCiRspyq0vA2cL1Kx/Pcy
   N+qQ4ck2YO3Oi62o2IdOFjRxwGTH5Zwb7twLoQS7S7TEqn2luacR6nI84
   MvBSuEk9l0V41FCXfibRrvv5wPakr2THsqzCgyokgdWTTLfX/Qs5ErGF+
   g==;
X-CSE-ConnectionGUID: UcWVL/oyRBaDb/VllVcvvg==
X-CSE-MsgGUID: Z/NzGne8QDGDGDuWfl6Veg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="42232696"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="42232696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 08:17:53 -0700
X-CSE-ConnectionGUID: pXXSwVEZRQmWZp03JuywWw==
X-CSE-MsgGUID: TESOyvglTDCibi+J5H1jVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="156384905"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jul 2025 08:17:51 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uabz3-0007QV-1K;
	Sat, 12 Jul 2025 15:17:49 +0000
Date: Sat, 12 Jul 2025 23:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 7e22b60a8af12b81ff3d416ed4e7d21fb98e9f25
Message-ID: <202507122306.ejhTU2hu-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_081756_486828_4068F8A4 
X-CRM114-Status: UNSURE (   4.09  )
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
branch HEAD: 7e22b60a8af12b81ff3d416ed4e7d21fb98e9f25  Add localversion-wireless-testing-ath

elapsed time: 1179m

configs tested: 194
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250712    gcc-10.5.0
arc                   randconfig-001-20250712    gcc-13.4.0
arc                   randconfig-002-20250712    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                         mv78xx0_defconfig    gcc-15.1.0
arm                   randconfig-001-20250712    gcc-13.4.0
arm                   randconfig-001-20250712    gcc-8.5.0
arm                   randconfig-002-20250712    gcc-10.5.0
arm                   randconfig-002-20250712    gcc-13.4.0
arm                   randconfig-003-20250712    clang-21
arm                   randconfig-003-20250712    gcc-13.4.0
arm                   randconfig-004-20250712    clang-21
arm                   randconfig-004-20250712    gcc-13.4.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                 randconfig-001-20250712    gcc-12.3.0
arm64                 randconfig-001-20250712    gcc-13.4.0
arm64                 randconfig-002-20250712    gcc-12.3.0
arm64                 randconfig-002-20250712    gcc-13.4.0
arm64                 randconfig-003-20250712    gcc-13.4.0
arm64                 randconfig-003-20250712    gcc-8.5.0
arm64                 randconfig-004-20250712    gcc-13.4.0
csky                              allnoconfig    clang-21
csky                  randconfig-001-20250712    gcc-11.5.0
csky                  randconfig-001-20250712    gcc-14.3.0
csky                  randconfig-002-20250712    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250712    clang-21
hexagon               randconfig-001-20250712    gcc-11.5.0
hexagon               randconfig-002-20250712    clang-18
hexagon               randconfig-002-20250712    gcc-11.5.0
i386                             alldefconfig    gcc-15.1.0
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250712    clang-20
i386        buildonly-randconfig-002-20250712    gcc-11
i386        buildonly-randconfig-003-20250712    gcc-12
i386        buildonly-randconfig-004-20250712    gcc-12
i386        buildonly-randconfig-005-20250712    gcc-12
i386        buildonly-randconfig-006-20250712    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250712    gcc-12
i386                  randconfig-002-20250712    gcc-12
i386                  randconfig-003-20250712    gcc-12
i386                  randconfig-004-20250712    gcc-12
i386                  randconfig-005-20250712    gcc-12
i386                  randconfig-006-20250712    gcc-12
i386                  randconfig-007-20250712    gcc-12
i386                  randconfig-011-20250712    gcc-12
i386                  randconfig-012-20250712    gcc-12
i386                  randconfig-013-20250712    gcc-12
i386                  randconfig-014-20250712    gcc-12
i386                  randconfig-015-20250712    gcc-12
i386                  randconfig-016-20250712    gcc-12
i386                  randconfig-017-20250712    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250712    gcc-11.5.0
loongarch             randconfig-001-20250712    gcc-15.1.0
loongarch             randconfig-002-20250712    gcc-11.5.0
loongarch             randconfig-002-20250712    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250712    gcc-11.5.0
nios2                 randconfig-002-20250712    gcc-11.5.0
nios2                 randconfig-002-20250712    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250712    gcc-11.5.0
parisc                randconfig-001-20250712    gcc-8.5.0
parisc                randconfig-002-20250712    gcc-11.5.0
parisc                randconfig-002-20250712    gcc-12.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250712    gcc-11.5.0
powerpc               randconfig-001-20250712    gcc-15.1.0
powerpc               randconfig-002-20250712    gcc-11.5.0
powerpc               randconfig-002-20250712    gcc-8.5.0
powerpc               randconfig-003-20250712    clang-21
powerpc               randconfig-003-20250712    gcc-11.5.0
powerpc64             randconfig-001-20250712    gcc-8.5.0
powerpc64             randconfig-002-20250712    clang-21
powerpc64             randconfig-002-20250712    gcc-11.5.0
powerpc64             randconfig-003-20250712    clang-19
powerpc64             randconfig-003-20250712    gcc-11.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250712    gcc-8.5.0
riscv                 randconfig-002-20250712    clang-21
riscv                 randconfig-002-20250712    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250712    clang-21
s390                  randconfig-001-20250712    gcc-8.5.0
s390                  randconfig-002-20250712    clang-21
s390                  randconfig-002-20250712    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250712    gcc-15.1.0
sh                    randconfig-001-20250712    gcc-8.5.0
sh                    randconfig-002-20250712    gcc-14.3.0
sh                    randconfig-002-20250712    gcc-8.5.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250712    gcc-13.4.0
sparc                 randconfig-001-20250712    gcc-8.5.0
sparc                 randconfig-002-20250712    gcc-15.1.0
sparc                 randconfig-002-20250712    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250712    clang-20
sparc64               randconfig-001-20250712    gcc-8.5.0
sparc64               randconfig-002-20250712    gcc-14.3.0
sparc64               randconfig-002-20250712    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250712    gcc-12
um                    randconfig-001-20250712    gcc-8.5.0
um                    randconfig-002-20250712    clang-21
um                    randconfig-002-20250712    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250712    gcc-12
x86_64      buildonly-randconfig-002-20250712    gcc-12
x86_64      buildonly-randconfig-003-20250712    clang-20
x86_64      buildonly-randconfig-004-20250712    clang-20
x86_64      buildonly-randconfig-005-20250712    gcc-12
x86_64      buildonly-randconfig-006-20250712    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250712    clang-20
x86_64                randconfig-002-20250712    clang-20
x86_64                randconfig-003-20250712    clang-20
x86_64                randconfig-004-20250712    clang-20
x86_64                randconfig-005-20250712    clang-20
x86_64                randconfig-006-20250712    clang-20
x86_64                randconfig-007-20250712    clang-20
x86_64                randconfig-008-20250712    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250712    gcc-8.5.0
xtensa                randconfig-002-20250712    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

