Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9003C3ABC0
	for <ath12k@archiver.kernel.org>; Thu,  8 May 2025 05:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rRR3zE2ANNjNrChUMN9KugkZY2R+cvRqKjrulP1t6XU=; b=2MYP5y4UaKrEoLncoTa7DNnzlT
	xC0RnNGEV9ORy40Dgm9Zyy/QeBqzIdoTHb4dfW98PHtwsSsMt1vzDXEm89Dx+73PF3xPiKrTgVMYr
	Cw2TIaOyL392zdIT5wyS8X3qudt+BWRh12LxkLPi3rm174tagTprCqYOmPXDboJbL4YUrRyF4mtqM
	mOv99C6bde9IpEtqUZvw163xRHl7gl3SzfJxh9sUn95bs2tvC68rlFo42oatoY9psmI+Af5CAtF20
	OZwFuCEls6haqrWg8tE6PzIQZMyV/Wm8u9JhFwOy9PELY1P0mmCE70FyG7LQNvaFwZ6FQaSbzhlya
	JmYYHnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtSP-0000000HKfV-1l3p;
	Thu, 08 May 2025 05:06:05 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtSM-0000000HKeZ-30Xg
	for ath12k@lists.infradead.org;
	Thu, 08 May 2025 05:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746680763; x=1778216763;
  h=date:from:to:cc:subject:message-id;
  bh=OEYk4Am/O8bkMUyN7whqQfSFUIJA4lGonfXYburWNE8=;
  b=HXGfCLkNqxvKBolYeEx9A43or0bq6PwBGL/JuiOx4/0YIk3XDNWVHz49
   naTcIcgQTaSt+Dz7MpkmYepfJ/WtGligOwWgReSMzx5xyUl1ay8eUy4+y
   gSoQqb0yD9D1RAPgemK2iKHAjTm9MugB3BwMGEjgc4olF8jHJKSFOZ/vd
   nFKb9Dd38Ab6xPL1T8YOXrbu/8T5KSrOEVOpyNvQ5EHA+Qh5UkGtlftds
   rllEdCouGpLS8apv4J3dVu8Gu4NhhKRNoHm/9znZbbHJs+B4FiGymGTs3
   p0JO/yipscFnvJgcykhsv8cZJDpybECdeWgHNSr953T16ghhsUehK8QSb
   A==;
X-CSE-ConnectionGUID: 32Z24/SFT/eI5kIP5U9vxg==
X-CSE-MsgGUID: Xkpd+JgqTluS5XiHmxSNEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52257105"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52257105"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:05:58 -0700
X-CSE-ConnectionGUID: +1QjEOqdQ6OtzVb8vOLynQ==
X-CSE-MsgGUID: f0Fa0+D2QzO0HiZxChvwHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136191634"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 22:05:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtSD-000AEs-2H;
	Thu, 08 May 2025 05:05:53 +0000
Date: Thu, 08 May 2025 13:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 885e5cbaa0ee3738fcd99167439459ede2cc102c
Message-ID: <202505081343.LlQH5eCb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_220602_833220_36B61378 
X-CRM114-Status: UNSURE (   4.03  )
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
branch HEAD: 885e5cbaa0ee3738fcd99167439459ede2cc102c  Revert "wifi: iwlwifi: clean up config macro"

elapsed time: 13729m

configs tested: 383
configs skipped: 24

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250429    gcc-13.3.0
arc                   randconfig-002-20250429    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-21
arm                                 defconfig    clang-21
arm                          exynos_defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                        multi_v5_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250429    gcc-7.5.0
arm                   randconfig-002-20250429    clang-20
arm                   randconfig-003-20250429    gcc-10.5.0
arm                   randconfig-004-20250429    clang-21
arm                         s5pv210_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250429    gcc-7.5.0
arm64                 randconfig-002-20250429    clang-21
arm64                 randconfig-003-20250429    gcc-9.5.0
arm64                 randconfig-004-20250429    gcc-9.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250429    gcc-14.2.0
csky                  randconfig-001-20250502    gcc-8.5.0
csky                  randconfig-001-20250503    gcc-8.5.0
csky                  randconfig-002-20250429    gcc-14.2.0
csky                  randconfig-002-20250502    gcc-8.5.0
csky                  randconfig-002-20250503    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250429    clang-21
hexagon               randconfig-001-20250502    gcc-8.5.0
hexagon               randconfig-001-20250503    gcc-8.5.0
hexagon               randconfig-002-20250429    clang-21
hexagon               randconfig-002-20250502    gcc-8.5.0
hexagon               randconfig-002-20250503    gcc-8.5.0
i386                             alldefconfig    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250429    gcc-12
i386        buildonly-randconfig-001-20250502    clang-20
i386        buildonly-randconfig-001-20250503    clang-20
i386        buildonly-randconfig-002-20250429    gcc-11
i386        buildonly-randconfig-002-20250502    clang-20
i386        buildonly-randconfig-002-20250503    clang-20
i386        buildonly-randconfig-003-20250429    gcc-12
i386        buildonly-randconfig-003-20250502    clang-20
i386        buildonly-randconfig-003-20250503    clang-20
i386        buildonly-randconfig-004-20250429    gcc-12
i386        buildonly-randconfig-004-20250502    clang-20
i386        buildonly-randconfig-004-20250503    clang-20
i386        buildonly-randconfig-005-20250429    clang-20
i386        buildonly-randconfig-005-20250502    clang-20
i386        buildonly-randconfig-005-20250503    clang-20
i386        buildonly-randconfig-006-20250429    gcc-12
i386        buildonly-randconfig-006-20250502    clang-20
i386        buildonly-randconfig-006-20250503    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250502    clang-20
i386                  randconfig-001-20250503    clang-20
i386                  randconfig-002-20250502    clang-20
i386                  randconfig-002-20250503    clang-20
i386                  randconfig-003-20250502    clang-20
i386                  randconfig-003-20250503    clang-20
i386                  randconfig-004-20250502    clang-20
i386                  randconfig-004-20250503    clang-20
i386                  randconfig-005-20250502    clang-20
i386                  randconfig-005-20250503    clang-20
i386                  randconfig-006-20250502    clang-20
i386                  randconfig-006-20250503    clang-20
i386                  randconfig-007-20250502    clang-20
i386                  randconfig-007-20250503    clang-20
i386                  randconfig-011-20250502    gcc-12
i386                  randconfig-011-20250503    clang-20
i386                  randconfig-012-20250502    gcc-12
i386                  randconfig-012-20250503    clang-20
i386                  randconfig-013-20250502    gcc-12
i386                  randconfig-013-20250503    clang-20
i386                  randconfig-014-20250502    gcc-12
i386                  randconfig-014-20250503    clang-20
i386                  randconfig-015-20250502    gcc-12
i386                  randconfig-015-20250503    clang-20
i386                  randconfig-016-20250502    gcc-12
i386                  randconfig-016-20250503    clang-20
i386                  randconfig-017-20250502    gcc-12
i386                  randconfig-017-20250503    clang-20
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250429    gcc-14.2.0
loongarch             randconfig-001-20250502    gcc-8.5.0
loongarch             randconfig-001-20250503    gcc-8.5.0
loongarch             randconfig-002-20250429    gcc-13.3.0
loongarch             randconfig-002-20250502    gcc-8.5.0
loongarch             randconfig-002-20250503    gcc-8.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
mips                        bcm63xx_defconfig    clang-21
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-21
mips                  cavium_octeon_defconfig    clang-21
mips                         db1xxx_defconfig    clang-21
mips                          eyeq6_defconfig    clang-21
mips                           gcw0_defconfig    clang-21
mips                            gpr_defconfig    clang-18
mips                      maltaaprp_defconfig    clang-21
mips                         rt305x_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250429    gcc-11.5.0
nios2                 randconfig-001-20250502    gcc-8.5.0
nios2                 randconfig-001-20250503    gcc-8.5.0
nios2                 randconfig-002-20250429    gcc-7.5.0
nios2                 randconfig-002-20250502    gcc-8.5.0
nios2                 randconfig-002-20250503    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250429    gcc-14.2.0
parisc                randconfig-001-20250502    gcc-8.5.0
parisc                randconfig-001-20250503    gcc-8.5.0
parisc                randconfig-002-20250429    gcc-10.5.0
parisc                randconfig-002-20250502    gcc-8.5.0
parisc                randconfig-002-20250503    gcc-8.5.0
parisc64                         alldefconfig    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    clang-19
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                 mpc836x_rdk_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250429    clang-21
powerpc               randconfig-001-20250502    gcc-8.5.0
powerpc               randconfig-001-20250503    gcc-8.5.0
powerpc               randconfig-002-20250429    clang-21
powerpc               randconfig-002-20250502    gcc-8.5.0
powerpc               randconfig-002-20250503    gcc-8.5.0
powerpc               randconfig-003-20250429    clang-21
powerpc               randconfig-003-20250502    gcc-8.5.0
powerpc               randconfig-003-20250503    gcc-8.5.0
powerpc                     redwood_defconfig    clang-21
powerpc                    socrates_defconfig    clang-21
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    clang-21
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250429    clang-21
powerpc64             randconfig-001-20250502    gcc-8.5.0
powerpc64             randconfig-001-20250503    gcc-8.5.0
powerpc64             randconfig-002-20250429    clang-21
powerpc64             randconfig-002-20250502    gcc-8.5.0
powerpc64             randconfig-002-20250503    gcc-8.5.0
powerpc64             randconfig-003-20250429    gcc-7.5.0
powerpc64             randconfig-003-20250502    gcc-8.5.0
powerpc64             randconfig-003-20250503    gcc-8.5.0
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250429    gcc-14.2.0
riscv                 randconfig-001-20250502    gcc-13.3.0
riscv                 randconfig-001-20250503    gcc-10.5.0
riscv                 randconfig-002-20250429    clang-18
riscv                 randconfig-002-20250502    gcc-13.3.0
riscv                 randconfig-002-20250503    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250429    clang-21
s390                  randconfig-001-20250502    gcc-13.3.0
s390                  randconfig-001-20250503    gcc-10.5.0
s390                  randconfig-002-20250429    clang-17
s390                  randconfig-002-20250502    gcc-13.3.0
s390                  randconfig-002-20250503    gcc-10.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    clang-21
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                    randconfig-001-20250429    gcc-5.5.0
sh                    randconfig-001-20250502    gcc-13.3.0
sh                    randconfig-001-20250503    gcc-10.5.0
sh                    randconfig-002-20250429    gcc-13.3.0
sh                    randconfig-002-20250502    gcc-13.3.0
sh                    randconfig-002-20250503    gcc-10.5.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                          rsk7269_defconfig    clang-21
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                           se7721_defconfig    clang-21
sh                           se7721_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250429    gcc-12.4.0
sparc                 randconfig-001-20250502    gcc-13.3.0
sparc                 randconfig-001-20250503    gcc-10.5.0
sparc                 randconfig-002-20250429    gcc-10.3.0
sparc                 randconfig-002-20250502    gcc-13.3.0
sparc                 randconfig-002-20250503    gcc-10.5.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250429    gcc-12.4.0
sparc64               randconfig-001-20250502    gcc-13.3.0
sparc64               randconfig-001-20250503    gcc-10.5.0
sparc64               randconfig-002-20250429    gcc-8.5.0
sparc64               randconfig-002-20250502    gcc-13.3.0
sparc64               randconfig-002-20250503    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250429    clang-18
um                    randconfig-001-20250502    gcc-13.3.0
um                    randconfig-001-20250503    gcc-10.5.0
um                    randconfig-002-20250429    gcc-12
um                    randconfig-002-20250502    gcc-13.3.0
um                    randconfig-002-20250503    gcc-10.5.0
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250429    gcc-12
x86_64      buildonly-randconfig-001-20250502    clang-20
x86_64      buildonly-randconfig-001-20250503    gcc-12
x86_64      buildonly-randconfig-002-20250429    gcc-12
x86_64      buildonly-randconfig-002-20250502    clang-20
x86_64      buildonly-randconfig-002-20250503    gcc-12
x86_64      buildonly-randconfig-003-20250429    clang-20
x86_64      buildonly-randconfig-003-20250502    clang-20
x86_64      buildonly-randconfig-003-20250503    gcc-12
x86_64      buildonly-randconfig-004-20250429    gcc-12
x86_64      buildonly-randconfig-004-20250502    clang-20
x86_64      buildonly-randconfig-004-20250503    gcc-12
x86_64      buildonly-randconfig-005-20250429    clang-20
x86_64      buildonly-randconfig-005-20250502    clang-20
x86_64      buildonly-randconfig-005-20250503    gcc-12
x86_64      buildonly-randconfig-006-20250429    gcc-12
x86_64      buildonly-randconfig-006-20250502    clang-20
x86_64      buildonly-randconfig-006-20250503    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250502    clang-20
x86_64                randconfig-001-20250503    clang-20
x86_64                randconfig-002-20250502    clang-20
x86_64                randconfig-002-20250503    clang-20
x86_64                randconfig-003-20250502    clang-20
x86_64                randconfig-003-20250503    clang-20
x86_64                randconfig-004-20250502    clang-20
x86_64                randconfig-004-20250503    clang-20
x86_64                randconfig-005-20250502    clang-20
x86_64                randconfig-005-20250503    clang-20
x86_64                randconfig-006-20250502    clang-20
x86_64                randconfig-006-20250503    clang-20
x86_64                randconfig-007-20250502    clang-20
x86_64                randconfig-007-20250503    clang-20
x86_64                randconfig-008-20250502    clang-20
x86_64                randconfig-008-20250503    clang-20
x86_64                randconfig-071-20250502    clang-20
x86_64                randconfig-071-20250503    clang-20
x86_64                randconfig-072-20250502    clang-20
x86_64                randconfig-072-20250503    clang-20
x86_64                randconfig-073-20250502    clang-20
x86_64                randconfig-073-20250503    clang-20
x86_64                randconfig-074-20250502    clang-20
x86_64                randconfig-074-20250503    clang-20
x86_64                randconfig-075-20250502    clang-20
x86_64                randconfig-075-20250503    clang-20
x86_64                randconfig-076-20250502    clang-20
x86_64                randconfig-076-20250503    clang-20
x86_64                randconfig-077-20250502    clang-20
x86_64                randconfig-077-20250503    clang-20
x86_64                randconfig-078-20250502    clang-20
x86_64                randconfig-078-20250503    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                          rhel-9.4-func    clang-20
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250429    gcc-14.2.0
xtensa                randconfig-001-20250502    gcc-13.3.0
xtensa                randconfig-001-20250503    gcc-10.5.0
xtensa                randconfig-002-20250429    gcc-8.5.0
xtensa                randconfig-002-20250502    gcc-13.3.0
xtensa                randconfig-002-20250503    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

