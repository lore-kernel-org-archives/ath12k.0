Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E40CC8303C
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O4gRbB22lddS9p8OwpE9vQAIadaO0y7b9tWrKGRF/NQ=; b=hEczyCD2weNud0J/g0wRY/efH/
	DduxZj3zBQj7HpZMqEDvkjY1kNkcC2Edog6nOkiHZ0nsXPRMO4++G+sIqLrDEZ365BQAoRrP8fdBR
	5uuijCHlHNME9jWx/9VdwPNGZL0497COBvf4Gj1QmPql2ewEFpk7BNNRTIbdUfjSgNdIOI6JIOVMJ
	10NKynTm0hLvjwcWjvfeD5KD1dLWq3BWpNp4tt+qWrZZWDhJFlUSrDnZMAvpwIj+APRj3Z0lTQkGm
	X0LPByRiqGyIFZC9rt7YjPaTMKuMmkPfNzMhq6GnQkeuieHnDph48hLiIDFL+Kj6/O12MYfsNBcpa
	Jfg1muGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEyL-00000006WGD-3iM6;
	Tue, 08 Jul 2025 20:31:25 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAW-00000006NIP-3DbQ
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 19:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752003596; x=1783539596;
  h=date:from:to:cc:subject:message-id;
  bh=nwc/Zjr07XDnbUaxg72DM3Z42aj6Vo1Vq829tb6nJ4c=;
  b=EIvXYNZki8wGSRZhSPP90jS1uxTwSd762i2Eu/gkDc3QmBZ8Ht3CdQ/7
   zUYdOdsw2G/GQK49IuvCEmc33BYU4sG016XUepuZ5IFExAYUS04no9fcs
   eBlNOLh2/J+4vNYkg2Cr9dMBgghfSggNNjWhfj939gBEfyB05oJ+ESJdw
   VTIZrR7ErShQ/FrMEKWnNxCianhjLWevqcmIAWaTtFpRzp731ZR5kkaR7
   re2avaaP77r+zU0YPmE+jJI4+bEmVFFmtALkLu/Rm9aZvt9XRwHPscQDg
   Cb9agA8HlpnKUXLxVEjAdcw0bB4qL+m6WELuVZAjsjGAawuNb1Rnnc2ba
   g==;
X-CSE-ConnectionGUID: BqMQ+ALGRSO7gN6286wJcw==
X-CSE-MsgGUID: t/DGhmomR7GYlz2YxStYSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79690228"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="79690228"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 12:39:49 -0700
X-CSE-ConnectionGUID: 4xXASgYMQGOvYXbVCuaFvA==
X-CSE-MsgGUID: J/CTKAezQ6+D9hq3J61V4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155311571"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jul 2025 12:39:47 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZEAK-0002h9-2Z;
	Tue, 08 Jul 2025 19:39:44 +0000
Date: Wed, 09 Jul 2025 03:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 a1bff3d6cc454d65a3a654cd3fcd0c90f1fb45fb
Message-ID: <202507090306.3Vnljgxs-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_123956_898008_7C665735 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: a1bff3d6cc454d65a3a654cd3fcd0c90f1fb45fb  wifi: ath12k: Add num_stations counter for each interface

elapsed time: 1222m

configs tested: 243
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-21
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250708    clang-17
arc                   randconfig-001-20250708    gcc-13.4.0
arc                   randconfig-002-20250708    clang-17
arc                   randconfig-002-20250708    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                        mvebu_v7_defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250708    clang-17
arm                   randconfig-001-20250708    clang-21
arm                   randconfig-002-20250708    clang-17
arm                   randconfig-003-20250708    clang-17
arm                   randconfig-003-20250708    gcc-10.5.0
arm                   randconfig-004-20250708    clang-17
arm                   randconfig-004-20250708    clang-21
arm                          sp7021_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250708    clang-17
arm64                 randconfig-001-20250708    gcc-9.5.0
arm64                 randconfig-002-20250708    clang-17
arm64                 randconfig-002-20250708    clang-19
arm64                 randconfig-003-20250708    clang-17
arm64                 randconfig-003-20250708    clang-21
arm64                 randconfig-004-20250708    clang-17
arm64                 randconfig-004-20250708    gcc-8.5.0
csky                              allnoconfig    clang-21
csky                                defconfig    clang-19
csky                  randconfig-001-20250708    gcc-13.4.0
csky                  randconfig-001-20250708    gcc-8.5.0
csky                  randconfig-002-20250708    gcc-15.1.0
csky                  randconfig-002-20250708    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250708    clang-21
hexagon               randconfig-001-20250708    gcc-8.5.0
hexagon               randconfig-002-20250708    clang-21
hexagon               randconfig-002-20250708    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250708    clang-20
i386        buildonly-randconfig-002-20250708    clang-20
i386        buildonly-randconfig-003-20250708    clang-20
i386        buildonly-randconfig-004-20250708    clang-20
i386        buildonly-randconfig-004-20250708    gcc-12
i386        buildonly-randconfig-005-20250708    clang-20
i386        buildonly-randconfig-006-20250708    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250708    gcc-11
i386                  randconfig-002-20250708    gcc-11
i386                  randconfig-003-20250708    gcc-11
i386                  randconfig-004-20250708    gcc-11
i386                  randconfig-005-20250708    gcc-11
i386                  randconfig-006-20250708    gcc-11
i386                  randconfig-007-20250708    gcc-11
i386                  randconfig-011-20250708    clang-20
i386                  randconfig-012-20250708    clang-20
i386                  randconfig-013-20250708    clang-20
i386                  randconfig-014-20250708    clang-20
i386                  randconfig-015-20250708    clang-20
i386                  randconfig-016-20250708    clang-20
i386                  randconfig-017-20250708    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250708    clang-21
loongarch             randconfig-001-20250708    gcc-8.5.0
loongarch             randconfig-002-20250708    clang-21
loongarch             randconfig-002-20250708    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250708    gcc-8.5.0
nios2                 randconfig-002-20250708    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250708    gcc-8.5.0
parisc                randconfig-001-20250708    gcc-9.3.0
parisc                randconfig-002-20250708    gcc-14.3.0
parisc                randconfig-002-20250708    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250708    gcc-8.5.0
powerpc               randconfig-002-20250708    clang-19
powerpc               randconfig-002-20250708    gcc-8.5.0
powerpc               randconfig-003-20250708    clang-21
powerpc               randconfig-003-20250708    gcc-8.5.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250708    clang-21
powerpc64             randconfig-001-20250708    gcc-8.5.0
powerpc64             randconfig-002-20250708    clang-21
powerpc64             randconfig-002-20250708    gcc-8.5.0
powerpc64             randconfig-003-20250708    clang-21
powerpc64             randconfig-003-20250708    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250708    clang-16
riscv                 randconfig-001-20250708    clang-17
riscv                 randconfig-002-20250708    clang-17
riscv                 randconfig-002-20250708    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250708    clang-17
s390                  randconfig-001-20250708    gcc-14.3.0
s390                  randconfig-002-20250708    clang-17
s390                  randconfig-002-20250708    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250708    clang-17
sh                    randconfig-001-20250708    gcc-11.5.0
sh                    randconfig-002-20250708    clang-17
sh                    randconfig-002-20250708    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250708    clang-17
sparc                 randconfig-001-20250708    gcc-13.4.0
sparc                 randconfig-002-20250708    clang-17
sparc                 randconfig-002-20250708    gcc-13.4.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250708    clang-17
sparc64               randconfig-001-20250708    clang-21
sparc64               randconfig-002-20250708    clang-17
sparc64               randconfig-002-20250708    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-15.1.0
um                    randconfig-001-20250708    clang-17
um                    randconfig-001-20250708    clang-21
um                    randconfig-002-20250708    clang-17
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250708    gcc-12
x86_64      buildonly-randconfig-002-20250708    gcc-12
x86_64      buildonly-randconfig-003-20250708    clang-20
x86_64      buildonly-randconfig-003-20250708    gcc-12
x86_64      buildonly-randconfig-004-20250708    gcc-12
x86_64      buildonly-randconfig-005-20250708    clang-20
x86_64      buildonly-randconfig-005-20250708    gcc-12
x86_64      buildonly-randconfig-006-20250708    clang-20
x86_64      buildonly-randconfig-006-20250708    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250708    gcc-12
x86_64                randconfig-002-20250708    gcc-12
x86_64                randconfig-003-20250708    gcc-12
x86_64                randconfig-004-20250708    gcc-12
x86_64                randconfig-005-20250708    gcc-12
x86_64                randconfig-006-20250708    gcc-12
x86_64                randconfig-007-20250708    gcc-12
x86_64                randconfig-008-20250708    gcc-12
x86_64                randconfig-071-20250708    clang-20
x86_64                randconfig-071-20250709    gcc-12
x86_64                randconfig-072-20250708    clang-20
x86_64                randconfig-072-20250709    gcc-12
x86_64                randconfig-073-20250708    clang-20
x86_64                randconfig-073-20250709    gcc-12
x86_64                randconfig-074-20250708    clang-20
x86_64                randconfig-074-20250709    gcc-12
x86_64                randconfig-075-20250708    clang-20
x86_64                randconfig-075-20250709    gcc-12
x86_64                randconfig-076-20250708    clang-20
x86_64                randconfig-076-20250709    gcc-12
x86_64                randconfig-077-20250708    clang-20
x86_64                randconfig-077-20250709    gcc-12
x86_64                randconfig-078-20250708    clang-20
x86_64                randconfig-078-20250709    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250708    clang-17
xtensa                randconfig-001-20250708    gcc-8.5.0
xtensa                randconfig-002-20250708    clang-17
xtensa                randconfig-002-20250708    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

