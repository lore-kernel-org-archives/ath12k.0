Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7790EC52D7D
	for <ath12k@archiver.kernel.org>; Sat, 10 Aug 2024 03:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmNiQvDoAv9lmat74EpV2SdkVSQx7bphNGGaPPYB5nc=; b=s3ebFh6iOsJRNbonslZh4fH2AR
	JYrYX6ZowSOcu40ff6vfhDXhWaseZquznvmIUQjSwrDNRwJwvvN2dqoEj4D2XfcXjrRw/WYkexzg6
	xgMCUFg9e+LBDlx74/15cxWiz+bfa+mKrjooBKD5qfADxiRzbNRdMJj8LPWLpQBb9YPVlbJmXzthZ
	ki95qALAqoAtuKTL0ddzx3HMEhe8irz0ismPXQag9jFAdh3IB54iMGlKWWeWr6J8xUojl2BUlWcRL
	BwfwfM/XH+MzW1tID0Y0lmCmtr6l/DaT1nrzDnwl6OFXHC8hbvUZv1oBj2bO5BZLVgL+Y1fNE2FOM
	blT9El1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sccVn-0000000D4gV-0NvS
	for ath12k@archiver.kernel.org;
	Sat, 10 Aug 2024 03:11:23 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sccVk-0000000D4g2-0pbU
	for ath12k@lists.infradead.org;
	Sat, 10 Aug 2024 03:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723259480; x=1754795480;
  h=date:from:to:cc:subject:message-id;
  bh=50TJOyxkltTc6VZxbrlv2aNND8tyGkVahBZJpHBwlTw=;
  b=VUYwZNoXsKNeMMGvH7yHV6OJE+k0nWNr42Znncq83Ob7oFfxME5Ji8ks
   Jjf/XWU6N9SoGW/rynUsEXe9hsJq0HvnlYMV9xHoxBSmhO+Zlr22NVZrC
   O4caQSIh/LbLMqkaex6AK/Pswhwh9bR7CTGIi2bnIEG9xEseJKbtTOPe1
   4oqpUAa+IG8h31Jpve8S7HfeC41vnzwgRSZnyzXnBF2t5a9Fcgx8XGxcD
   b8+Tl0UU/xztqTah5dKHRO5wVlAoxT1l596UAirQksfsoDYHOlgPiZgtp
   xPzPnlTCpCbL8FuM5+6XGELGI99DE4kOhaBUj2q003wLgmao+9659xlK4
   g==;
X-CSE-ConnectionGUID: 5v/zL+lKTsmTGsEcVyZv7g==
X-CSE-MsgGUID: 1tFSjtoUT4+g/d4iJMcTjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25242375"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="25242375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 20:11:13 -0700
X-CSE-ConnectionGUID: avRo8JlOT1mGpRN9alvzag==
X-CSE-MsgGUID: xYTnv/WGSRKRaSWlDplUKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="88595062"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 09 Aug 2024 20:11:12 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sccVa-0009Y7-1H;
	Sat, 10 Aug 2024 03:11:10 +0000
Date: Sat, 10 Aug 2024 11:10:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 3da843c9e27dc4459b1ee775c1837fed45c2695f
Message-ID: <202408101151.kRC3HdeY-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_201120_344467_EF5CFA36 
X-CRM114-Status: UNSURE (   3.66  )
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
branch HEAD: 3da843c9e27dc4459b1ee775c1837fed45c2695f  Merge branch 'pending' into main-pending

elapsed time: 995m

configs tested: 180
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                        clps711x_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   clang-20
arm                         lpc18xx_defconfig   clang-20
arm                            mps2_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240809   gcc-12
i386         buildonly-randconfig-001-20240810   clang-18
i386         buildonly-randconfig-002-20240809   gcc-12
i386         buildonly-randconfig-002-20240810   clang-18
i386         buildonly-randconfig-003-20240809   gcc-12
i386         buildonly-randconfig-003-20240810   clang-18
i386         buildonly-randconfig-004-20240809   gcc-12
i386         buildonly-randconfig-004-20240810   clang-18
i386         buildonly-randconfig-005-20240809   gcc-12
i386         buildonly-randconfig-005-20240810   clang-18
i386         buildonly-randconfig-006-20240809   gcc-12
i386         buildonly-randconfig-006-20240810   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240809   gcc-12
i386                  randconfig-001-20240810   clang-18
i386                  randconfig-002-20240809   gcc-12
i386                  randconfig-002-20240810   clang-18
i386                  randconfig-003-20240809   gcc-12
i386                  randconfig-003-20240810   clang-18
i386                  randconfig-004-20240809   gcc-12
i386                  randconfig-004-20240810   clang-18
i386                  randconfig-005-20240809   gcc-12
i386                  randconfig-005-20240810   clang-18
i386                  randconfig-006-20240809   gcc-12
i386                  randconfig-006-20240810   clang-18
i386                  randconfig-011-20240809   gcc-12
i386                  randconfig-011-20240810   clang-18
i386                  randconfig-012-20240809   gcc-12
i386                  randconfig-012-20240810   clang-18
i386                  randconfig-013-20240809   gcc-12
i386                  randconfig-013-20240810   clang-18
i386                  randconfig-014-20240809   gcc-12
i386                  randconfig-014-20240810   clang-18
i386                  randconfig-015-20240809   gcc-12
i386                  randconfig-015-20240810   clang-18
i386                  randconfig-016-20240809   gcc-12
i386                  randconfig-016-20240810   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                          sun3x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                           ci20_defconfig   clang-20
mips                  maltasmvp_eva_defconfig   gcc-13.2.0
mips                        qi_lb60_defconfig   gcc-13.2.0
mips                       rbtx49xx_defconfig   gcc-13.2.0
mips                         rt305x_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    amigaone_defconfig   clang-20
powerpc                       ebony_defconfig   clang-20
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                       holly_defconfig   clang-20
powerpc                 linkstation_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                       zfcpdump_defconfig   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-13.2.0
sh                     magicpanelr2_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240810   gcc-12
x86_64       buildonly-randconfig-002-20240810   gcc-12
x86_64       buildonly-randconfig-003-20240810   gcc-12
x86_64       buildonly-randconfig-004-20240810   gcc-12
x86_64       buildonly-randconfig-005-20240810   gcc-12
x86_64       buildonly-randconfig-006-20240810   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240810   gcc-12
x86_64                randconfig-002-20240810   gcc-12
x86_64                randconfig-003-20240810   gcc-12
x86_64                randconfig-004-20240810   gcc-12
x86_64                randconfig-005-20240810   gcc-12
x86_64                randconfig-006-20240810   gcc-12
x86_64                randconfig-011-20240810   gcc-12
x86_64                randconfig-012-20240810   gcc-12
x86_64                randconfig-013-20240810   gcc-12
x86_64                randconfig-014-20240810   gcc-12
x86_64                randconfig-015-20240810   gcc-12
x86_64                randconfig-016-20240810   gcc-12
x86_64                randconfig-071-20240810   gcc-12
x86_64                randconfig-072-20240810   gcc-12
x86_64                randconfig-073-20240810   gcc-12
x86_64                randconfig-074-20240810   gcc-12
x86_64                randconfig-075-20240810   gcc-12
x86_64                randconfig-076-20240810   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

