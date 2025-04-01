Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49555C36014
	for <ath12k@archiver.kernel.org>; Tue,  1 Apr 2025 23:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zo6UL396eZz7yo306CJXWTWhvpJj29Mn+vA5DW7fjYg=; b=gOWXDdvin6kFknziQt1O1AFLiy
	UZEOZUEcreaKkvLls/iCPc9si2PEYMpwo/WuPk16c/+cmlJ2OXb1YgeHZo445M7Wwt6EGZaNMx5ZI
	pmiqDmYpTNyl9o4N5gjVZL2OgQyYzHvBzqC4MLeJOPBUl18AyE5WJyPM10HNCKKMlpYgORFlFsJi9
	d1KmUGsE8HK3aFRaZKjb1Kx6SBEGgmHZ/UGMCZtbsJRkRhKLYNjW3ishgOcTr5SNC/XM75u4rTeIc
	rfq52wsRFoS1vCc7VEhvfYUrhbRDe3yoPr4qvSH7b5EDo8Wvh9cZE6jwpuPheMOrCcwjZb4yDxMIx
	Bfdu1ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzkjN-00000004bNJ-07uh
	for ath12k@archiver.kernel.org;
	Tue, 01 Apr 2025 23:09:17 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzkjK-00000004bLl-0iuG
	for ath12k@lists.infradead.org;
	Tue, 01 Apr 2025 23:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743548954; x=1775084954;
  h=date:from:to:cc:subject:message-id;
  bh=BtK4mterK4CQ/Rzp3YUbk3ellz2/hVrhDqVd/IqoH20=;
  b=MKV1K1h4lQNxVIMW59yoyRcVUKaXON6eY1uTs/IskHq0z5Hj6vYGDZ5O
   NuaYsVeHxTHsGxz2+xqO9tJwo1oHggcd2x77W0j59L9KYWOr8fQ/z+vkk
   tIvqnpuHKTXcKCgJ5P86jLLewFvBq/YhSKAsflomGkzn1DAtfIyR75+cX
   qKs5Vyeb3tojaXqnw4lnWbRm5p51bgAcQBXNtAojOfceqN5ro6OwKq3mE
   M+0PhbPxpghgTdr/WcRM+oxC4prRYVzNNw1bmURHIGzy3IsG+5MABwY+e
   D/0LAuyZtNUl/B2Qb+rpWPEgMM5//+T2WTfeFM6FfCI8dA7X0CY4/wi/U
   w==;
X-CSE-ConnectionGUID: r5hrZWMlS9WUMck09n5raQ==
X-CSE-MsgGUID: rn6tji6wQmeEgp3UCHx/pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56260657"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="56260657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 16:09:14 -0700
X-CSE-ConnectionGUID: UXaiW00eT8CxLbjdHHOh/w==
X-CSE-MsgGUID: p+TUpwH6QxOq5gkqkJRphg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131239193"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2025 16:09:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzkjB-000AEu-2t;
	Tue, 01 Apr 2025 23:09:07 +0000
Date: Wed, 02 Apr 2025 07:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 ba613742db305037ca2193b2b552b769c4f2a5f7
Message-ID: <202504020720.AaUcFi9S-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_160914_256580_762A0FD8 
X-CRM114-Status: UNSURE (   3.98  )
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
branch HEAD: ba613742db305037ca2193b2b552b769c4f2a5f7  Add localversion-wireless-testing-ath

elapsed time: 1450m

configs tested: 145
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250401    gcc-12.4.0
arc                   randconfig-002-20250401    gcc-14.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                   randconfig-001-20250401    gcc-7.5.0
arm                   randconfig-002-20250401    gcc-8.5.0
arm                   randconfig-003-20250401    clang-18
arm                   randconfig-004-20250401    clang-14
arm                             rpc_defconfig    clang-18
arm                       spear13xx_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250401    clang-21
arm64                 randconfig-002-20250401    clang-20
arm64                 randconfig-003-20250401    gcc-8.5.0
arm64                 randconfig-004-20250401    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250401    gcc-14.2.0
csky                  randconfig-002-20250401    gcc-10.5.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250401    clang-21
hexagon               randconfig-002-20250401    clang-21
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250401    gcc-12
i386        buildonly-randconfig-002-20250401    clang-20
i386        buildonly-randconfig-003-20250401    clang-20
i386        buildonly-randconfig-004-20250401    clang-20
i386        buildonly-randconfig-005-20250401    gcc-12
i386        buildonly-randconfig-006-20250401    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250401    gcc-14.2.0
loongarch             randconfig-002-20250401    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250401    gcc-8.5.0
nios2                 randconfig-002-20250401    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250401    gcc-11.5.0
parisc                randconfig-002-20250401    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   currituck_defconfig    clang-14
powerpc                       ebony_defconfig    clang-21
powerpc                      katmai_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-15
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    clang-15
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250401    clang-21
powerpc               randconfig-002-20250401    gcc-8.5.0
powerpc               randconfig-003-20250401    clang-20
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250401    clang-21
powerpc64             randconfig-002-20250401    clang-17
powerpc64             randconfig-003-20250401    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250401    clang-21
riscv                 randconfig-002-20250401    clang-14
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250401    clang-15
s390                  randconfig-002-20250401    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                    randconfig-001-20250401    gcc-12.4.0
sh                    randconfig-002-20250401    gcc-12.4.0
sh                           se7750_defconfig    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250401    gcc-11.5.0
sparc                 randconfig-002-20250401    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250401    gcc-9.3.0
sparc64               randconfig-002-20250401    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250401    gcc-12
um                    randconfig-002-20250401    gcc-11
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250401    clang-20
x86_64      buildonly-randconfig-002-20250401    gcc-12
x86_64      buildonly-randconfig-003-20250401    clang-20
x86_64      buildonly-randconfig-004-20250401    clang-20
x86_64      buildonly-randconfig-005-20250401    gcc-12
x86_64      buildonly-randconfig-006-20250401    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250401    gcc-9.3.0
xtensa                randconfig-002-20250401    gcc-13.3.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

