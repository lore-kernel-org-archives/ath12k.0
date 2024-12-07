Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D795E7717B
	for <ath12k@archiver.kernel.org>; Sat,  7 Dec 2024 16:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=faQFY7lrBv5qH/YbLFy5EYHEeRpZy+lkH48xgM97ppI=; b=TF7GhNXpDeyew1CVvequciFx35
	LpYcR226Snun0Fsl09iOaVmMA0aSv6cGByC1N4t6t5K0OHb21quQR41O8fJNM+OEFhe7gSs9a+PJC
	R5k5aekYAC8WRvSK+czdTse7RU/k/rVrzPOV1XpL2Fc5wkQzDijsjF60WFrRbw94OuBJMHhMWAIad
	TMI10DwaAu/0+sK05KslSYgVuc4oo8XN8+piMd6YkatEqRoCC7zdZP4KzfJkd2F0EoFS8PTGs9Yd9
	yNXbq1EOhHM7XbkLEmyxEqbLc/x0SDehQwmkSuF/y9mP3uTw7+YbosLlhuzgc2UGXUzpgowcXGx5R
	yQYms7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJxpg-00000004AI7-37ta
	for ath12k@archiver.kernel.org;
	Sat, 07 Dec 2024 16:39:04 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJxpe-00000004AHe-0VZ0
	for ath12k@lists.infradead.org;
	Sat, 07 Dec 2024 16:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733589542; x=1765125542;
  h=date:from:to:cc:subject:message-id;
  bh=bTdfBB4QNR318EoYyRA4nnwSlLrNi0SazHO0b582dpI=;
  b=RGHLtR3lMstuBgEbRZTe5p8Rf0/Hz5/WnMEtDNMDzd5OrTAteh740XNf
   3sQpu/NcH/13mGUJoReKvtgpyvZCY36pTpZK8hE3dJQdL8Bg4NE7vfLlk
   0B9k3JBFk4ulExt9zP5R9t+FRKhXSeuOYDV0rYk7EtHsgSvDixLjXHA8u
   QQW+DkK9Gd9A5TsFZdGfeWyMv29cwr2mJMhKHEkblBZNfHKG8O38ISuFV
   oiSqPxUJFxZO3QLWOzBCng8erNGYvEg2OkQhe0Vm4ztookJexJfuJY35n
   e4Lj0ugsat/+/cLVK8rfrMxOYcs1YXyUALWf62l0SqO0bVt6xFkp90/kO
   A==;
X-CSE-ConnectionGUID: yLPj6IiQROGf/M6Jn/bKdw==
X-CSE-MsgGUID: KNHMP2B2Szy+8o/WNqhpwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11279"; a="33991895"
X-IronPort-AV: E=Sophos;i="6.12,216,1728975600"; 
   d="scan'208";a="33991895"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2024 08:38:58 -0800
X-CSE-ConnectionGUID: fpoQ5ZW1QyeR+7OioVlzKQ==
X-CSE-MsgGUID: MFLrDYfWRz6LARWV5SANjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,216,1728975600"; 
   d="scan'208";a="99634551"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Dec 2024 08:38:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJxpV-0002px-2r;
	Sat, 07 Dec 2024 16:38:53 +0000
Date: Sun, 08 Dec 2024 00:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 ff73f816ca105f1eb3d28b093e0d9cdeb43bb672
Message-ID: <202412080042.94k0VJci-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_083902_221889_E70576FD 
X-CRM114-Status: UNSURE (   3.09  )
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
branch HEAD: ff73f816ca105f1eb3d28b093e0d9cdeb43bb672  wifi: ath12k: avoid redundant code in DP Rx error process

elapsed time: 1338m

configs tested: 206
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-15
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241207    clang-19
arc                   randconfig-001-20241207    gcc-13.2.0
arc                   randconfig-002-20241207    clang-19
arc                   randconfig-002-20241207    gcc-13.2.0
arc                        vdk_hs38_defconfig    clang-20
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-15
arm                            hisi_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-13.2.0
arm                            mps2_defconfig    clang-15
arm                        multi_v5_defconfig    clang-20
arm                   randconfig-001-20241207    clang-19
arm                   randconfig-001-20241207    gcc-14.2.0
arm                   randconfig-002-20241207    clang-19
arm                   randconfig-002-20241207    gcc-14.2.0
arm                   randconfig-003-20241207    clang-19
arm                   randconfig-004-20241207    clang-19
arm                   randconfig-004-20241207    clang-20
arm                        realview_defconfig    clang-20
arm                        shmobile_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    clang-17
arm64                            alldefconfig    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241207    clang-19
arm64                 randconfig-001-20241207    gcc-14.2.0
arm64                 randconfig-002-20241207    clang-19
arm64                 randconfig-002-20241207    gcc-14.2.0
arm64                 randconfig-003-20241207    clang-19
arm64                 randconfig-003-20241207    clang-20
arm64                 randconfig-004-20241207    clang-15
arm64                 randconfig-004-20241207    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241207    clang-19
csky                  randconfig-001-20241207    gcc-14.2.0
csky                  randconfig-002-20241207    clang-19
csky                  randconfig-002-20241207    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241207    clang-14
hexagon               randconfig-001-20241207    clang-19
hexagon               randconfig-002-20241207    clang-16
hexagon               randconfig-002-20241207    clang-19
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241207    clang-19
i386        buildonly-randconfig-002-20241207    clang-19
i386        buildonly-randconfig-003-20241207    clang-19
i386        buildonly-randconfig-003-20241207    gcc-12
i386        buildonly-randconfig-004-20241207    clang-19
i386        buildonly-randconfig-005-20241207    clang-19
i386        buildonly-randconfig-006-20241207    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241207    clang-19
loongarch             randconfig-001-20241207    gcc-14.2.0
loongarch             randconfig-002-20241207    clang-19
loongarch             randconfig-002-20241207    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-13.2.0
m68k                        stmark2_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-17
mips                           mtx1_defconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-17
mips                   sb1250_swarm_defconfig    clang-20
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241207    clang-19
nios2                 randconfig-001-20241207    gcc-14.2.0
nios2                 randconfig-002-20241207    clang-19
nios2                 randconfig-002-20241207    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-13.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241207    clang-19
parisc                randconfig-001-20241207    gcc-14.2.0
parisc                randconfig-002-20241207    clang-19
parisc                randconfig-002-20241207    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    clang-15
powerpc                     akebono_defconfig    clang-17
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-15
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    clang-20
powerpc                 mpc832x_rdb_defconfig    gcc-13.2.0
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                      pmac32_defconfig    clang-15
powerpc               randconfig-001-20241207    clang-19
powerpc               randconfig-001-20241207    gcc-14.2.0
powerpc               randconfig-002-20241207    clang-19
powerpc               randconfig-002-20241207    clang-20
powerpc               randconfig-003-20241207    clang-15
powerpc               randconfig-003-20241207    clang-19
powerpc                     redwood_defconfig    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241207    clang-19
powerpc64             randconfig-001-20241207    gcc-14.2.0
powerpc64             randconfig-002-20241207    clang-19
powerpc64             randconfig-003-20241207    clang-17
powerpc64             randconfig-003-20241207    clang-19
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241207    gcc-14.2.0
riscv                 randconfig-002-20241207    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.2.0
s390                  randconfig-001-20241207    gcc-14.2.0
s390                  randconfig-002-20241207    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    clang-17
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    clang-20
sh                          landisk_defconfig    clang-20
sh                          polaris_defconfig    gcc-14.2.0
sh                    randconfig-001-20241207    gcc-14.2.0
sh                    randconfig-002-20241207    gcc-14.2.0
sh                           se7343_defconfig    clang-15
sh                           se7724_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241207    gcc-14.2.0
sparc                 randconfig-002-20241207    gcc-14.2.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241207    gcc-14.2.0
sparc64               randconfig-002-20241207    gcc-14.2.0
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241207    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241207    clang-19
x86_64      buildonly-randconfig-002-20241207    clang-19
x86_64      buildonly-randconfig-003-20241207    clang-19
x86_64      buildonly-randconfig-004-20241207    clang-19
x86_64      buildonly-randconfig-005-20241207    clang-19
x86_64      buildonly-randconfig-006-20241207    clang-19
x86_64                              defconfig    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-13.2.0
xtensa                generic_kc705_defconfig    clang-20
xtensa                randconfig-001-20241207    gcc-14.2.0
xtensa                randconfig-002-20241207    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

