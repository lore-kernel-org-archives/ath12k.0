Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250A9C61CE7
	for <ath12k@archiver.kernel.org>; Sun,  8 Jun 2025 02:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qpIR2qiuqcB0ma+7EFYHUjZzxSpYMCbUs0Q5UuexPFs=; b=eadHWMifYMtls9KqAHa+83anW5
	FKjvr28l1GBJKL2kJpt9NBToXzbtzusfmItvCYN4OV7nIpm3sENeQQ93JbxD7uQXJbh4rkjPKvr/Z
	NY2Dp+N09YWM3wqcvrDXoZWyGJbBjMKa0xS3GDIac1U30mcrjYgV/L43YzQkcVKe5dz2oP2aKwRwo
	HKl+KXVI+uCLKtoMJ1zdpOoCczftJjTEVNL0jiSSXxu2IFa+fnjjL+gANi+3M4++kP3HalllLzYzF
	HPcGBz2o5AAy4MRR1Q8xFsRn3ZovValUmUbhCuBmoFEU690G7muyCj/TfON79w6lwsHwBPDV+DETp
	ttznguDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO67v-00000002IgW-3Fn2;
	Sun, 08 Jun 2025 02:51:15 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO67s-00000002Ifk-3sNN
	for ath12k@lists.infradead.org;
	Sun, 08 Jun 2025 02:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749351072; x=1780887072;
  h=date:from:to:cc:subject:message-id;
  bh=+sMQ8V26U1gPYKKpA/TIrO34d/inSJfHpKuGTPoOvvs=;
  b=jA9H4C1zVzgziyEhpADsn/0dFCMy+N/YI0K8hOhTq1hzp78CZzeNyQ9i
   KPGrDYLY933CEsrtxsZBr1XFKiRz7gyaKvXW59TpclsV/6J+RwjK8w3It
   eNfYYEOfOXXAwZF/cjSfe9Lomw9QQxznCgjC5Ga9xBZ2hH4UySqs5INi9
   UGL5dNaH34MDRDofGkZYiyvGGdz5uZuQu0kbdWWVfHZGFypT8NsjOdoy9
   bsp9eBG/N35G4sYYzBxPc/SVhQAB9LLCMeeu7b9fEXo6FWs42MwRoJKXd
   0TeTzpLCpLRxzN+/yMev8EUg9Hi76wTi5aN6Oq6sjGieCDZep06p7kOXq
   g==;
X-CSE-ConnectionGUID: 7h4AfWUDTnCSPZ29rMt6Kw==
X-CSE-MsgGUID: D5uq44BKT+mcZkzkvfZfEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="73990708"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="73990708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 19:51:11 -0700
X-CSE-ConnectionGUID: KJhgCVEXS8GNAjH6ZCGOUA==
X-CSE-MsgGUID: B9Y1TOg/RC6RaPM5es8Jew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="146531900"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jun 2025 19:51:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO67m-000695-1a;
	Sun, 08 Jun 2025 02:51:06 +0000
Date: Sun, 08 Jun 2025 10:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-current] BUILD SUCCESS
 f3fe49dbddd73f0155a8935af47cb63693069dbe
Message-ID: <202506081022.34AgsqBQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_195113_069949_1C5BA7C2 
X-CRM114-Status: UNSURE (   3.93  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
branch HEAD: f3fe49dbddd73f0155a8935af47cb63693069dbe  wifi: ath12k: fix uaf in ath12k_core_init()

elapsed time: 725m

configs tested: 261
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250607    gcc-15.1.0
arc                   randconfig-002-20250607    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-21
arm                                 defconfig    gcc-15.1.0
arm                            dove_defconfig    gcc-15.1.0
arm                        keystone_defconfig    gcc-15.1.0
arm                       multi_v4t_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250607    clang-21
arm                   randconfig-002-20250607    gcc-13.3.0
arm                   randconfig-003-20250607    gcc-15.1.0
arm                   randconfig-004-20250607    gcc-14.3.0
arm                        realview_defconfig    gcc-15.1.0
arm                             rpc_defconfig    clang-18
arm                       spear13xx_defconfig    gcc-15.1.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250607    clang-21
arm64                 randconfig-002-20250607    clang-21
arm64                 randconfig-003-20250607    clang-21
arm64                 randconfig-004-20250607    clang-21
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250607    gcc-12.4.0
csky                  randconfig-001-20250608    gcc-8.5.0
csky                  randconfig-002-20250607    gcc-9.3.0
csky                  randconfig-002-20250608    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250607    clang-21
hexagon               randconfig-001-20250608    gcc-8.5.0
hexagon               randconfig-002-20250607    clang-21
hexagon               randconfig-002-20250608    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250607    clang-20
i386        buildonly-randconfig-002-20250607    gcc-12
i386        buildonly-randconfig-003-20250607    gcc-12
i386        buildonly-randconfig-004-20250607    gcc-12
i386        buildonly-randconfig-005-20250607    clang-20
i386        buildonly-randconfig-006-20250607    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250608    gcc-12
i386                  randconfig-002-20250608    gcc-12
i386                  randconfig-003-20250608    gcc-12
i386                  randconfig-004-20250608    gcc-12
i386                  randconfig-005-20250608    gcc-12
i386                  randconfig-006-20250608    gcc-12
i386                  randconfig-007-20250608    gcc-12
i386                  randconfig-011-20250608    clang-20
i386                  randconfig-012-20250608    clang-20
i386                  randconfig-013-20250608    clang-20
i386                  randconfig-014-20250608    clang-20
i386                  randconfig-015-20250608    clang-20
i386                  randconfig-016-20250608    clang-20
i386                  randconfig-017-20250608    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250607    gcc-13.3.0
loongarch             randconfig-001-20250608    gcc-8.5.0
loongarch             randconfig-002-20250607    gcc-15.1.0
loongarch             randconfig-002-20250608    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-21
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-21
mips                           ip30_defconfig    gcc-15.1.0
mips                       lemote2f_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-21
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                            alldefconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250607    gcc-10.5.0
nios2                 randconfig-001-20250608    gcc-8.5.0
nios2                 randconfig-002-20250607    gcc-5.5.0
nios2                 randconfig-002-20250608    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250607    gcc-12.4.0
parisc                randconfig-001-20250608    gcc-8.5.0
parisc                randconfig-002-20250607    gcc-12.4.0
parisc                randconfig-002-20250608    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    clang-21
powerpc                     mpc83xx_defconfig    clang-21
powerpc               randconfig-001-20250607    gcc-10.5.0
powerpc               randconfig-001-20250608    gcc-8.5.0
powerpc               randconfig-002-20250607    clang-21
powerpc               randconfig-002-20250608    gcc-8.5.0
powerpc               randconfig-003-20250607    clang-21
powerpc               randconfig-003-20250608    gcc-8.5.0
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc                     tqm8541_defconfig    clang-21
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250607    clang-19
powerpc64             randconfig-001-20250608    gcc-8.5.0
powerpc64             randconfig-002-20250607    clang-21
powerpc64             randconfig-002-20250608    gcc-8.5.0
powerpc64             randconfig-003-20250607    gcc-7.5.0
powerpc64             randconfig-003-20250608    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250607    clang-21
riscv                 randconfig-002-20250607    clang-16
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250607    clang-16
s390                  randconfig-002-20250607    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20250607    gcc-14.3.0
sh                    randconfig-002-20250607    gcc-9.3.0
sh                          rsk7203_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                 randconfig-001-20250607    gcc-10.3.0
sparc                 randconfig-002-20250607    gcc-12.4.0
sparc64                          allmodconfig    gcc-15.1.0
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250607    gcc-9.3.0
sparc64               randconfig-002-20250607    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250607    clang-21
um                    randconfig-002-20250607    gcc-12
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250607    clang-20
x86_64      buildonly-randconfig-002-20250607    clang-20
x86_64      buildonly-randconfig-003-20250607    clang-20
x86_64      buildonly-randconfig-004-20250607    gcc-12
x86_64      buildonly-randconfig-005-20250607    gcc-12
x86_64      buildonly-randconfig-006-20250607    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250608    clang-20
x86_64                randconfig-002-20250608    clang-20
x86_64                randconfig-003-20250608    clang-20
x86_64                randconfig-004-20250608    clang-20
x86_64                randconfig-005-20250608    clang-20
x86_64                randconfig-006-20250608    clang-20
x86_64                randconfig-007-20250608    clang-20
x86_64                randconfig-008-20250608    clang-20
x86_64                randconfig-071-20250608    gcc-12
x86_64                randconfig-072-20250608    gcc-12
x86_64                randconfig-073-20250608    gcc-12
x86_64                randconfig-074-20250608    gcc-12
x86_64                randconfig-075-20250608    gcc-12
x86_64                randconfig-076-20250608    gcc-12
x86_64                randconfig-077-20250608    gcc-12
x86_64                randconfig-078-20250608    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20250607    gcc-10.5.0
xtensa                randconfig-002-20250607    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

