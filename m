Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEBECF6491
	for <ath12k@archiver.kernel.org>; Sun, 29 Sep 2024 01:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I81RsapLB3lT3se4nI+evnppjATg4j92R+y11UgbX90=; b=ucrbQ0X9qxWKQnaPsKpcpEC4o2
	5r7MeI11f7hpWQvAzXMGSTdOTAhL2xvKsuJCEVjA/pHQSysdbiVXaUHOnORriAjNCLVgApgnPmphF
	6PetRgOkDXAmt2FV7W/ertyyVNjffdx5Gl4QXdq7z6TAfFLSncAkP7cbHtx/5Wwk0gE1kLjK0fDuQ
	OOPFqiBylPQokKpnJcap34bKd8GuHv3aFBKv3D7Y7ciX9t7Tz7MDruKJV9E5N5PbM5BQRNMLDbpsx
	upzbJFm0/gFNVMX2auS9kFYgD+V2Hb9Sm2PSwHIUl9AYxCZoa3cGgpRicZOTjNj7ediqXf7a2kYiA
	0hqBEHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suiMA-0000000DtJl-3rEf
	for ath12k@archiver.kernel.org;
	Sun, 29 Sep 2024 01:04:14 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suiM8-0000000DtJC-0mUP
	for ath12k@lists.infradead.org;
	Sun, 29 Sep 2024 01:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727571853; x=1759107853;
  h=date:from:to:cc:subject:message-id;
  bh=XdnwxAlVobmfCxoQJwC+tcCSK9ncJ+bI5W2SwLQ3f9U=;
  b=G/riaLRyxEuvHv8ClAniT3G/l1ou/GF7yky7xZR1swuXwO25gwMw/cO9
   9qe+GukRDJchAWhoHqOIj9OnUFqP8l9psgrQ0gt1EGB6cAL+v+NAMG/qS
   oVoUr4Yr18ajrd5qmNU/AG+xAGHnCUIBwPbPrXgnmIqRAziw7QYP7jb2b
   ARG5yWw9bmxRkB6UvnFA+OIjs9haHLF1LC/rfhtwNvX7x187sNUyzfaUU
   t70RrX4o1neosd728b3f0njfRCHDtQxBzectvKo46fGhRJ/MSPMERafR3
   gojk8FzkdY2YMi+fn0du31XSMa8e2RzbJy/dtOXKU5Mzpg1llazBkHte4
   w==;
X-CSE-ConnectionGUID: sNzMtunDQzGczd83HPDVaw==
X-CSE-MsgGUID: FSdvW8d3TJqZGp1LW1rSTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26815003"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26815003"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 18:04:09 -0700
X-CSE-ConnectionGUID: q9pFMkw0TbGtnWQ6FBIa/Q==
X-CSE-MsgGUID: V095Yfg7SJ6nBirtLrggbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72975280"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2024 18:04:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suiM0-000NnL-22;
	Sun, 29 Sep 2024 01:04:04 +0000
Date: Sun, 29 Sep 2024 09:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 1a0c640ce1cdcde3eb131a0c1e70ca1ed7cf27cb
Message-ID: <202409290939.21IgbizC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_180412_299693_A241FC0C 
X-CRM114-Status: UNSURE (   3.95  )
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
branch HEAD: 1a0c640ce1cdcde3eb131a0c1e70ca1ed7cf27cb  wifi: ath12k: Skip Rx TID cleanup for self peer

elapsed time: 908m

configs tested: 161
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20240928    gcc-14.1.0
arc                   randconfig-002-20240928    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                          collie_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                       netwinder_defconfig    gcc-14.1.0
arm                   randconfig-001-20240928    gcc-14.1.0
arm                   randconfig-002-20240928    gcc-14.1.0
arm                   randconfig-003-20240928    gcc-14.1.0
arm                   randconfig-004-20240928    gcc-14.1.0
arm                           sunxi_defconfig    gcc-14.1.0
arm                           tegra_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240928    gcc-14.1.0
arm64                 randconfig-002-20240928    gcc-14.1.0
arm64                 randconfig-003-20240928    gcc-14.1.0
arm64                 randconfig-004-20240928    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240928    gcc-14.1.0
csky                  randconfig-002-20240928    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240928    gcc-14.1.0
hexagon               randconfig-002-20240928    gcc-14.1.0
i386                             alldefconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240929    clang-18
i386        buildonly-randconfig-002-20240929    clang-18
i386        buildonly-randconfig-003-20240929    clang-18
i386        buildonly-randconfig-004-20240929    clang-18
i386        buildonly-randconfig-005-20240929    clang-18
i386        buildonly-randconfig-006-20240929    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240929    clang-18
i386                  randconfig-002-20240929    clang-18
i386                  randconfig-003-20240929    clang-18
i386                  randconfig-004-20240929    clang-18
i386                  randconfig-005-20240929    clang-18
i386                  randconfig-006-20240929    clang-18
i386                  randconfig-011-20240929    clang-18
i386                  randconfig-012-20240929    clang-18
i386                  randconfig-013-20240929    clang-18
i386                  randconfig-014-20240929    clang-18
i386                  randconfig-015-20240929    clang-18
i386                  randconfig-016-20240929    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240928    gcc-14.1.0
loongarch             randconfig-002-20240928    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        stmark2_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                         3c120_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240928    gcc-14.1.0
nios2                 randconfig-002-20240928    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-14.1.0
parisc                randconfig-001-20240928    gcc-14.1.0
parisc                randconfig-002-20240928    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     kmeter1_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240928    gcc-14.1.0
powerpc               randconfig-002-20240928    gcc-14.1.0
powerpc               randconfig-003-20240928    gcc-14.1.0
powerpc                    socrates_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20240928    gcc-14.1.0
powerpc64             randconfig-002-20240928    gcc-14.1.0
powerpc64             randconfig-003-20240928    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240928    gcc-14.1.0
riscv                 randconfig-002-20240928    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240928    gcc-14.1.0
s390                  randconfig-002-20240928    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          r7780mp_defconfig    gcc-14.1.0
sh                    randconfig-001-20240928    gcc-14.1.0
sh                    randconfig-002-20240928    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240928    gcc-14.1.0
sparc64               randconfig-002-20240928    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240928    gcc-14.1.0
um                    randconfig-002-20240928    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    gcc-14.1.0
xtensa                randconfig-001-20240928    gcc-14.1.0
xtensa                randconfig-002-20240928    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

