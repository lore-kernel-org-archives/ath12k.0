Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC85CC3ABBE
	for <ath12k@archiver.kernel.org>; Thu,  8 May 2025 05:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z7IRo3i6fezLWTvtPJDR4Sf7uRxBVbPN196h/YeXvsU=; b=eb9yb+u4YXbXyuUoJnt6NGg7Fx
	APwOa6XbeKeyobKaG0f2CIj9pqH2hHrQHHjasRpGXQYPVSyqQiPo+6x4oJnbsamZWXSFcU1wYofA2
	jbe21UC18ECeyHDOWZMwkyS1NghmPAPVEOurtv4uyai/tlchfZFj8wtZM8DdRWoNkkK67Xd0Qmk7F
	7XeQG/XCHs4gGrpXiznJdZYkGthOWDWfV2DHmOyUI3VMEpKwicaJv1Q/GHp5JN+292DrjrhZGbOoH
	nVXLr1XOkwnKk1xawSu4UG8ktI8DRpoGxFkUyYfuQdMFxNH8JcEbPeGnWMq9mh9xKRT5i0nHsstUV
	KOqdSf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuE0-0000000HPOG-2j03;
	Thu, 08 May 2025 05:55:16 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuDx-0000000HPNI-1pIC
	for ath12k@lists.infradead.org;
	Thu, 08 May 2025 05:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746683714; x=1778219714;
  h=date:from:to:cc:subject:message-id;
  bh=g1v9yRAlq0VyNkdntyxDuAdn2DCCTRt7FNEspWjn7ck=;
  b=fJEXBktEy6sWvZ66zbPflIQQ7XdOqqoM/gyI8tI7gmMgRduhNkqser+0
   JUC7PKIvF8q+NzE3bdFD82SovYU+rCiHWBKMn4/oNB7QNeo4vKtw2HJUk
   aoIy97LPC1O6vFgumKSI7/lL+suxxwFwMaS3GUbXNBz7YTDJh4NR2xI4N
   jeI5AEHrWttCsJGegBJjyw6ELYLSsP4KJjdFjbvilsR75yVEm1MuSSsq0
   8+azihfh+Wvh2pvirLpChzr3mHHNMC2LXkQbdqk/EgbVQCkuRSAI9Es4I
   xgya3dHd6lurkOj4Q3PmqvAZmWK0B7BhRtagWqlFfyhkawUjBmC03Bniy
   Q==;
X-CSE-ConnectionGUID: HghylkbSQi6DGLd9WkhyXA==
X-CSE-MsgGUID: aQ6paSZoTsO7VJzEFW4aeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59841220"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59841220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:55:13 -0700
X-CSE-ConnectionGUID: dQ/m1WaNRHeVZ1YyC0wYYQ==
X-CSE-MsgGUID: wcCtRJ6ITQiTIDqonAEKZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="167129534"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 22:55:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCuDt-000AUg-0p;
	Thu, 08 May 2025 05:55:09 +0000
Date: Thu, 08 May 2025 13:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 21346cd925c2567d5f56cdb1421c94815ac10221
Message-ID: <202505081320.7QMcHc3R-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_225513_523671_9371F0B1 
X-CRM114-Status: UNSURE (   4.00  )
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
branch HEAD: 21346cd925c2567d5f56cdb1421c94815ac10221  Add localversion-wireless-testing-ath

elapsed time: 13773m

configs tested: 147
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250429    gcc-13.3.0
arc                   randconfig-002-20250429    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20250429    gcc-7.5.0
arm                   randconfig-002-20250429    clang-20
arm                   randconfig-003-20250429    gcc-10.5.0
arm                   randconfig-004-20250429    clang-21
arm                          sp7021_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250429    gcc-7.5.0
arm64                 randconfig-002-20250429    clang-21
arm64                 randconfig-003-20250429    gcc-9.5.0
arm64                 randconfig-004-20250429    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250429    gcc-14.2.0
csky                  randconfig-002-20250429    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250429    clang-21
hexagon               randconfig-002-20250429    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250429    gcc-12
i386        buildonly-randconfig-002-20250429    gcc-11
i386        buildonly-randconfig-003-20250429    gcc-12
i386        buildonly-randconfig-004-20250429    gcc-12
i386        buildonly-randconfig-005-20250429    clang-20
i386        buildonly-randconfig-006-20250429    gcc-12
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250429    gcc-14.2.0
loongarch             randconfig-002-20250429    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                           gcw0_defconfig    clang-21
mips                        maltaup_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250429    gcc-11.5.0
nios2                 randconfig-002-20250429    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250429    gcc-14.2.0
parisc                randconfig-002-20250429    gcc-10.5.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-21
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250429    clang-21
powerpc               randconfig-002-20250429    clang-21
powerpc               randconfig-003-20250429    clang-21
powerpc                     redwood_defconfig    clang-21
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250429    clang-21
powerpc64             randconfig-002-20250429    clang-21
powerpc64             randconfig-003-20250429    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250429    gcc-14.2.0
riscv                 randconfig-002-20250429    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250429    clang-21
s390                  randconfig-002-20250429    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250429    gcc-5.5.0
sh                    randconfig-002-20250429    gcc-13.3.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250429    gcc-12.4.0
sparc                 randconfig-002-20250429    gcc-10.3.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250429    gcc-12.4.0
sparc64               randconfig-002-20250429    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250429    clang-18
um                    randconfig-002-20250429    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250429    gcc-12
x86_64      buildonly-randconfig-002-20250429    gcc-12
x86_64      buildonly-randconfig-003-20250429    clang-20
x86_64      buildonly-randconfig-004-20250429    gcc-12
x86_64      buildonly-randconfig-005-20250429    clang-20
x86_64      buildonly-randconfig-006-20250429    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250429    gcc-14.2.0
xtensa                randconfig-002-20250429    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

