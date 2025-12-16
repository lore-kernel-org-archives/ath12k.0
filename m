Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85A8D609D2
	for <ath12k@archiver.kernel.org>; Tue, 16 Dec 2025 16:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pD6mDROljEyHh6SIACfZeHqecV6webrpa1JkviOcaQ8=; b=rsJdKDUj9ReG6pvQwebGppoRq2
	WFvygRB34vEeQfEEQOCgvSF2r64Gwdzptr+DOiqv6YgsXZxsajpIRknH39LQ7AXqmTIG+PNe9CfwD
	Ikz3oXEak+aO/tg4rzlqQfMwviYJ/6lPU4JpRYO8D6VLSjEdhl40f5JBpRIQTgkiMxJa4WxZXzk1v
	nUbP39sONAOtGrVaiRiB0RzfiYllcaEPCoofzyqvacYVjEhfXFK69e4yxwKGHmqwEsAgv7RZt+evK
	v1ZQo7ZoB8K/22frvCdUCIT/C0r4lMyhirufKhNPD/c3kdzfvCv7V5OQ6ewwrkF7CNa0R/sY4s4gL
	40n84gjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYHe-00000005Ynm-2c47;
	Tue, 16 Dec 2025 16:52:22 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYHb-00000005YnS-3fqv
	for ath12k@lists.infradead.org;
	Tue, 16 Dec 2025 16:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765903940; x=1797439940;
  h=date:from:to:cc:subject:message-id;
  bh=gb00CHDfw6pY3Hign6dfFsfObR38kSQ8VkFGzrqALX8=;
  b=fQ1iWi/KipDPC+2I/TY29g4F/ELZ61x/AgYOFCfWh4u7tbtKOOA3Ybs7
   6fBmwIgpBeyXK4Faymwu8fyNP/K+hKS6UVKK0kkQhwkDiqr3f9j3UWWLE
   LhX6Teij5FPX+O+nXB5BJagb1w8ObDEmbrWVsPtvhEt7Sr2fiy8pXNUBc
   9Ic/1ePpBQNWYz+TR+hyUXI5ur/VChQTWwsFg3bO2adm2c/+4JeIrHADm
   UwRsiDebhldvbCjC0JkGc3/i7Rq9ydZOMrqzjpjWFOrgpEL3qyEBFr0PL
   VfKEo/XHfobEqQHNj79L5Mmy19pHI4Io/715NnzW6J5tAdgMCK+tS+tFN
   A==;
X-CSE-ConnectionGUID: T1tYCcsoSsKGCpFduFrzMg==
X-CSE-MsgGUID: 5SfFfChlTHWnsbhSnKzdnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67765844"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67765844"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:52:19 -0800
X-CSE-ConnectionGUID: wbKXHSjhRB2kQDS0LUwVqw==
X-CSE-MsgGUID: /YjP3F+HSK2QctM7cewzpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198121256"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2025 08:52:18 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVYHX-000000003am-3aIm;
	Tue, 16 Dec 2025 16:52:15 +0000
Date: Wed, 17 Dec 2025 00:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 25f833fff81de4fbb9b5382806860b63768567e8
Message-ID: <202512170015.zdtd2xFW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085220_002748_483726D4 
X-CRM114-Status: UNSURE (   3.76  )
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
branch HEAD: 25f833fff81de4fbb9b5382806860b63768567e8  Add localversion-wireless-testing-ath

elapsed time: 1377m

configs tested: 274
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251216    gcc-12.5.0
arc                   randconfig-001-20251216    gcc-8.5.0
arc                   randconfig-002-20251216    gcc-12.5.0
arc                   randconfig-002-20251216    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-22
arm                        clps711x_defconfig    clang-22
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    clang-17
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20251216    gcc-10.5.0
arm                   randconfig-001-20251216    gcc-8.5.0
arm                   randconfig-002-20251216    gcc-8.5.0
arm                   randconfig-003-20251216    gcc-11.5.0
arm                   randconfig-003-20251216    gcc-8.5.0
arm                   randconfig-004-20251216    clang-19
arm                   randconfig-004-20251216    gcc-8.5.0
arm                             rpc_defconfig    gcc-15.1.0
arm                           tegra_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251216    gcc-10.5.0
arm64                 randconfig-002-20251216    gcc-10.5.0
arm64                 randconfig-003-20251216    gcc-10.5.0
arm64                 randconfig-004-20251216    gcc-10.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251216    gcc-10.5.0
csky                  randconfig-002-20251216    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251216    clang-22
hexagon               randconfig-001-20251216    gcc-8.5.0
hexagon               randconfig-002-20251216    clang-19
hexagon               randconfig-002-20251216    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251216    clang-20
i386        buildonly-randconfig-001-20251216    gcc-14
i386        buildonly-randconfig-002-20251216    gcc-14
i386        buildonly-randconfig-003-20251216    gcc-14
i386        buildonly-randconfig-004-20251216    gcc-14
i386        buildonly-randconfig-005-20251216    clang-20
i386        buildonly-randconfig-005-20251216    gcc-14
i386        buildonly-randconfig-006-20251216    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251216    clang-20
i386                  randconfig-001-20251216    gcc-14
i386                  randconfig-002-20251216    clang-20
i386                  randconfig-002-20251216    gcc-14
i386                  randconfig-003-20251216    gcc-14
i386                  randconfig-004-20251216    gcc-14
i386                  randconfig-005-20251216    gcc-14
i386                  randconfig-006-20251216    gcc-14
i386                  randconfig-007-20251216    clang-20
i386                  randconfig-007-20251216    gcc-14
i386                  randconfig-011-20251216    gcc-13
i386                  randconfig-012-20251216    clang-20
i386                  randconfig-012-20251216    gcc-13
i386                  randconfig-013-20251216    gcc-13
i386                  randconfig-014-20251216    gcc-13
i386                  randconfig-015-20251216    clang-20
i386                  randconfig-015-20251216    gcc-13
i386                  randconfig-016-20251216    clang-20
i386                  randconfig-016-20251216    gcc-13
i386                  randconfig-017-20251216    clang-20
i386                  randconfig-017-20251216    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch                loongson32_defconfig    gcc-15.1.0
loongarch             randconfig-001-20251216    gcc-15.1.0
loongarch             randconfig-001-20251216    gcc-8.5.0
loongarch             randconfig-002-20251216    clang-22
loongarch             randconfig-002-20251216    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
mips                           ip32_defconfig    gcc-15.1.0
mips                           xway_defconfig    clang-22
mips                           xway_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251216    gcc-8.5.0
nios2                 randconfig-002-20251216    gcc-11.5.0
nios2                 randconfig-002-20251216    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251216    clang-22
parisc                randconfig-001-20251216    gcc-11.5.0
parisc                randconfig-002-20251216    clang-22
parisc                randconfig-002-20251216    gcc-11.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20251216    clang-22
powerpc               randconfig-002-20251216    clang-19
powerpc               randconfig-002-20251216    clang-22
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251216    clang-22
powerpc64             randconfig-002-20251216    clang-17
powerpc64             randconfig-002-20251216    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251216    clang-17
riscv                 randconfig-001-20251216    gcc-9.5.0
riscv                 randconfig-002-20251216    clang-17
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251216    clang-17
s390                  randconfig-001-20251216    clang-22
s390                  randconfig-002-20251216    clang-17
s390                  randconfig-002-20251216    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251216    clang-17
sh                    randconfig-001-20251216    gcc-13.4.0
sh                    randconfig-002-20251216    clang-17
sh                    randconfig-002-20251216    gcc-12.5.0
sh                          sdk7780_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251216    gcc-8.5.0
sparc                 randconfig-002-20251216    gcc-14.3.0
sparc                 randconfig-002-20251216    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251216    clang-22
sparc64               randconfig-001-20251216    gcc-8.5.0
sparc64               randconfig-002-20251216    clang-22
sparc64               randconfig-002-20251216    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251216    gcc-12
um                    randconfig-001-20251216    gcc-8.5.0
um                    randconfig-002-20251216    gcc-14
um                    randconfig-002-20251216    gcc-8.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251216    clang-20
x86_64      buildonly-randconfig-002-20251216    clang-20
x86_64      buildonly-randconfig-002-20251216    gcc-14
x86_64      buildonly-randconfig-003-20251216    clang-20
x86_64      buildonly-randconfig-004-20251216    clang-20
x86_64      buildonly-randconfig-005-20251216    clang-20
x86_64      buildonly-randconfig-005-20251216    gcc-14
x86_64      buildonly-randconfig-006-20251216    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251216    clang-20
x86_64                randconfig-001-20251216    gcc-14
x86_64                randconfig-002-20251216    clang-20
x86_64                randconfig-003-20251216    clang-20
x86_64                randconfig-004-20251216    clang-20
x86_64                randconfig-004-20251216    gcc-14
x86_64                randconfig-005-20251216    clang-20
x86_64                randconfig-006-20251216    clang-20
x86_64                randconfig-006-20251216    gcc-14
x86_64                randconfig-011-20251216    clang-20
x86_64                randconfig-011-20251216    gcc-14
x86_64                randconfig-012-20251216    clang-20
x86_64                randconfig-012-20251216    gcc-14
x86_64                randconfig-013-20251216    clang-20
x86_64                randconfig-014-20251216    clang-20
x86_64                randconfig-015-20251216    clang-20
x86_64                randconfig-016-20251216    clang-20
x86_64                randconfig-071-20251216    clang-20
x86_64                randconfig-071-20251216    gcc-14
x86_64                randconfig-072-20251216    gcc-14
x86_64                randconfig-073-20251216    gcc-14
x86_64                randconfig-074-20251216    gcc-12
x86_64                randconfig-074-20251216    gcc-14
x86_64                randconfig-075-20251216    clang-20
x86_64                randconfig-075-20251216    gcc-14
x86_64                randconfig-076-20251216    clang-20
x86_64                randconfig-076-20251216    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251216    gcc-8.5.0
xtensa                randconfig-002-20251216    gcc-12.5.0
xtensa                randconfig-002-20251216    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

