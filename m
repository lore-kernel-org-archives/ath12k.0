Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2057C282EC
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 01:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EFedOtfpVMV9BIInC7jLkBd+URuaKiJA6OQCWFNok9E=; b=oWX2q9PngfLeavIFrprto0EBUI
	lXOO9pCH0xzKNjhcgMMZXD+2kB4w40igs5abTvYstOcNEnjwh8AjBLPQ0DocwA8YkFAU3l949c5MM
	o14DpJszWtUPGbHjHKtSWh2gWrESU0MfgONjf+T1xx7fbzOkW22KyvXFX7lDVPATED149uMnsDJyZ
	p1CyfBPkFFnei1ZvwvB5ymCvlpvY+tevZyWjbNbefC/TTfA1tszDoIq/5Dav4/LqYhuxZb5HNLF2D
	vfgAKT5xjyqb5XZEw2day4R0X7Y44h/mPVnMufGwDt9i4z1OhH5W84l3WVt7ZGr6rTb9nrM5Wgz4j
	o3nrWeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuibt-00000007lAq-2i89
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 01:52:45 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuibq-00000007lAM-2VYn
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 01:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742349162; x=1773885162;
  h=date:from:to:cc:subject:message-id;
  bh=IR1c9HMzfjjKBKWTYfQHFyebVKx9NSY0HV6IH+2cf7Q=;
  b=LfDOc50YKCtsMZrVobL48CGN+A9fyT/vBo3QqYx/KTw8HD5VlzW2eZdW
   17Iz8Wc/zwpxr6UzhQNxozYmRtZnJ+Ao0a5ca3akA72dENfYaIr8qXGLo
   iT5AhL/y+DGz78TxS0qTnXEPyZNNMpk9BjurK+fKIFtEOEcl8/F8mSrO7
   iMrguY/EMf4+sJh1HNNAYpYNkEg84/qChR7d57jw7rFRMkGzQurLgtp1+
   uwWjZHYmr+yiaEBTZV0hMIYJUlSHJePAq6AUgGQ6nZq9uouOBpKTMl84i
   a0xJ9YcMiA2T+ix671wd4+5dHn7F00qDdj/EIdvbWoqLiP7FtHH4dIa9O
   Q==;
X-CSE-ConnectionGUID: 8kuvR2BUS9CYPoSRIlZUZQ==
X-CSE-MsgGUID: fit3cWCITFyjjvYGCJfXAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53733984"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="53733984"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 18:52:40 -0700
X-CSE-ConnectionGUID: zMnL+ziCRIqs3QJ9GLe+8g==
X-CSE-MsgGUID: hGOl+BlLTJKnqoU1fR6J/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122455392"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2025 18:52:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuibN-000EGk-2A;
	Wed, 19 Mar 2025 01:52:33 +0000
Date: Wed, 19 Mar 2025 09:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 b6f473c96421b8b451a8df8ccb620bcd71d4b3f4
Message-ID: <202503190902.4Yj6CzmN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_185242_702617_5C975BCF 
X-CRM114-Status: UNSURE (   4.19  )
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
branch HEAD: b6f473c96421b8b451a8df8ccb620bcd71d4b3f4  Add localversion-wireless-testing-ath

elapsed time: 1467m

configs tested: 182
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-9.3.0
arc                              alldefconfig    gcc-8.5.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.3.0
arc                              allyesconfig    gcc-10.5.0
arc                          axs101_defconfig    gcc-14.2.0
arc                   randconfig-001-20250318    gcc-8.5.0
arc                   randconfig-001-20250319    gcc-14.2.0
arc                   randconfig-002-20250318    gcc-8.5.0
arc                   randconfig-002-20250319    gcc-14.2.0
arm                              allmodconfig    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    clang-19
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-9.3.0
arm                   randconfig-001-20250318    gcc-14.2.0
arm                   randconfig-001-20250319    clang-18
arm                   randconfig-002-20250318    clang-21
arm                   randconfig-002-20250319    clang-21
arm                   randconfig-003-20250318    gcc-14.2.0
arm                   randconfig-003-20250319    clang-20
arm                   randconfig-004-20250318    clang-21
arm                   randconfig-004-20250319    clang-16
arm                           stm32_defconfig    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-8.5.0
arm64                 randconfig-001-20250318    clang-21
arm64                 randconfig-001-20250319    gcc-14.2.0
arm64                 randconfig-002-20250318    clang-14
arm64                 randconfig-002-20250319    gcc-7.5.0
arm64                 randconfig-003-20250318    gcc-13.3.0
arm64                 randconfig-003-20250319    gcc-12.3.0
arm64                 randconfig-004-20250318    gcc-6.5.0
arm64                 randconfig-004-20250319    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250318    gcc-14.2.0
csky                  randconfig-001-20250319    gcc-14.2.0
csky                  randconfig-002-20250318    gcc-14.2.0
csky                  randconfig-002-20250319    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250318    clang-21
hexagon               randconfig-001-20250319    clang-21
hexagon               randconfig-002-20250318    clang-17
hexagon               randconfig-002-20250319    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250318    clang-20
i386        buildonly-randconfig-001-20250319    gcc-12
i386        buildonly-randconfig-002-20250318    clang-20
i386        buildonly-randconfig-002-20250319    gcc-12
i386        buildonly-randconfig-003-20250318    clang-20
i386        buildonly-randconfig-003-20250319    gcc-12
i386        buildonly-randconfig-004-20250318    clang-20
i386        buildonly-randconfig-004-20250319    clang-20
i386        buildonly-randconfig-005-20250318    clang-20
i386        buildonly-randconfig-005-20250319    gcc-12
i386        buildonly-randconfig-006-20250318    clang-20
i386        buildonly-randconfig-006-20250319    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250318    gcc-14.2.0
loongarch             randconfig-001-20250319    gcc-14.2.0
loongarch             randconfig-002-20250318    gcc-14.2.0
loongarch             randconfig-002-20250319    gcc-14.2.0
m68k                             allmodconfig    gcc-8.5.0
m68k                              allnoconfig    gcc-5.5.0
m68k                             allyesconfig    gcc-6.5.0
m68k                          sun3x_defconfig    gcc-5.5.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-11.5.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
mips                           ip22_defconfig    gcc-11.5.0
nios2                         10m50_defconfig    gcc-9.3.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250318    gcc-9.3.0
nios2                 randconfig-001-20250319    gcc-14.2.0
nios2                 randconfig-002-20250318    gcc-5.5.0
nios2                 randconfig-002-20250319    gcc-10.5.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-8.5.0
parisc                           allmodconfig    gcc-5.5.0
parisc                            allnoconfig    gcc-5.5.0
parisc                           allyesconfig    gcc-9.3.0
parisc                generic-32bit_defconfig    gcc-9.3.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250318    gcc-8.5.0
parisc                randconfig-001-20250319    gcc-10.5.0
parisc                randconfig-002-20250318    gcc-14.2.0
parisc                randconfig-002-20250319    gcc-5.5.0
powerpc                    adder875_defconfig    gcc-13.3.0
powerpc                          allmodconfig    gcc-10.5.0
powerpc                           allnoconfig    gcc-8.5.0
powerpc                          allyesconfig    clang-21
powerpc                 canyonlands_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-15
powerpc                 mpc832x_rdb_defconfig    gcc-9.3.0
powerpc               randconfig-001-20250318    clang-21
powerpc               randconfig-001-20250319    gcc-9.3.0
powerpc               randconfig-002-20250318    clang-21
powerpc               randconfig-002-20250319    clang-21
powerpc               randconfig-003-20250318    gcc-14.2.0
powerpc               randconfig-003-20250319    clang-21
powerpc                     stx_gp3_defconfig    gcc-10.5.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250318    clang-21
powerpc64             randconfig-001-20250319    clang-20
powerpc64             randconfig-002-20250318    gcc-14.2.0
powerpc64             randconfig-002-20250319    gcc-5.5.0
powerpc64             randconfig-003-20250318    gcc-8.5.0
powerpc64             randconfig-003-20250319    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-7.5.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250318    clang-21
riscv                 randconfig-001-20250319    clang-20
riscv                 randconfig-002-20250318    clang-21
riscv                 randconfig-002-20250319    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-13.2.0
s390                  randconfig-001-20250318    clang-15
s390                  randconfig-001-20250319    gcc-11.5.0
s390                  randconfig-002-20250318    gcc-12.4.0
s390                  randconfig-002-20250319    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-10.5.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250318    gcc-14.2.0
sh                    randconfig-001-20250319    gcc-11.5.0
sh                    randconfig-002-20250318    gcc-7.5.0
sh                    randconfig-002-20250319    gcc-14.2.0
sh                           se7712_defconfig    gcc-5.5.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-6.5.0
sparc                             allnoconfig    gcc-6.5.0
sparc                 randconfig-001-20250318    gcc-14.2.0
sparc                 randconfig-001-20250319    gcc-6.5.0
sparc                 randconfig-002-20250318    gcc-14.2.0
sparc                 randconfig-002-20250319    gcc-13.3.0
sparc64               randconfig-001-20250318    gcc-11.5.0
sparc64               randconfig-001-20250319    gcc-14.2.0
sparc64               randconfig-002-20250318    gcc-11.5.0
sparc64               randconfig-002-20250319    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250318    clang-21
um                    randconfig-001-20250319    gcc-12
um                    randconfig-002-20250318    gcc-12
um                    randconfig-002-20250319    gcc-11
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250318    clang-20
x86_64      buildonly-randconfig-001-20250319    clang-20
x86_64      buildonly-randconfig-002-20250318    clang-20
x86_64      buildonly-randconfig-002-20250319    clang-20
x86_64      buildonly-randconfig-003-20250318    clang-20
x86_64      buildonly-randconfig-003-20250319    gcc-12
x86_64      buildonly-randconfig-004-20250318    clang-20
x86_64      buildonly-randconfig-004-20250319    gcc-11
x86_64      buildonly-randconfig-005-20250318    gcc-12
x86_64      buildonly-randconfig-005-20250319    clang-20
x86_64      buildonly-randconfig-006-20250318    gcc-12
x86_64      buildonly-randconfig-006-20250319    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250318    gcc-14.2.0
xtensa                randconfig-001-20250319    gcc-10.5.0
xtensa                randconfig-002-20250318    gcc-7.5.0
xtensa                randconfig-002-20250319    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

