Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6922C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9pBrrQxqlL04ZqZ4oznB2tUhaUVXDv5kqwIHsmi6Sw8=; b=zTk8wkL/qXEj/cBA7+wHJRGhSN
	bSkznjE3G4IDUC+Sbe3OndOnw22sJEJF2q3IUwl9GmZIuxZO7kaKaMoh1yRKIG8zAqyBIE2tHGen6
	zh70axBr7bKicjTH2hJPj8x80RxMnwYIWR2DQFPtdtvPQhHfaIoOQTw09MjaXEVsOmNjre94VRSTu
	JnSsw1HE3X+V+o1ot4KN5+TjJMQHH+PRT2NX8Loc0VldRcSeUFyko5b2Khy6l0S9lZNb0TUNbsl8e
	BxjuZypN6xk85fvBqWBv1ufdZ3z4KTrdc5o0pnBEiMY/d4/mejTl2zNQvkX6njK7BmrEQH7JDpvpm
	prN9a5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbN1U-0000000FB2I-2QIB
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 16:59:12 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbN1S-0000000FB1z-0SwD
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 16:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737737950; x=1769273950;
  h=date:from:to:cc:subject:message-id;
  bh=+t6Z/4s3kCZyLIrlGyHPj4EE08PzqjoQ8KPeYxOenvg=;
  b=IBMSp1RLLewWKHiULXg5fHEKYfC8FKlhsiumnmD/vm6/Lerd6xkr9QcO
   MVYKM5Rq055gL+qy7BTrkJ3gyB8YQD/TQ2Dc/AVR2vhQ54Me4JZZqGVLI
   UQYO5Pq1f9dHyQ4jk37wuV34KxNqdkmmYv0RfGLg8nvmvt2dhw0McqYU2
   DZtckJS6UVgcF8Xv9k55cB3Zz1bLY6m6kRbmvGPrg7yGAhABKfYzyvcp2
   wAjTY6dc3ElJud7ylOIppp5uhfthdpwFyQMKcT9R6s8wzk3Ue7CLrw2bI
   u+KGnaA7ns9+TDhgCtRe8qO5AAW3I/7WYj/Tusuxeme9EriW4wwx2/oAD
   w==;
X-CSE-ConnectionGUID: F2lM4Q+BQs+50t/dVFv0Dg==
X-CSE-MsgGUID: B+m+gMOKQs6Fewl4mdaFnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38379226"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38379226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 08:59:07 -0800
X-CSE-ConnectionGUID: f1MlqqO7SrimHF64YkyLzw==
X-CSE-MsgGUID: nlh5ZcIuRNysFeill6C6Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="108357765"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2025 08:59:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbN1L-000ctH-0G;
	Fri, 24 Jan 2025 16:59:03 +0000
Date: Sat, 25 Jan 2025 00:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 28a9972e0f0693cd4d08f431c992fa6be39c788c
Message-ID: <202501250014.OcohudKO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_085910_215760_7FA559BD 
X-CRM114-Status: UNSURE (   3.74  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 28a9972e0f0693cd4d08f431c992fa6be39c788c  wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx() error path

elapsed time: 1449m

configs tested: 219
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250124    clang-20
arc                   randconfig-001-20250124    gcc-13.2.0
arc                   randconfig-002-20250124    clang-20
arc                   randconfig-002-20250124    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                           imxrt_defconfig    clang-19
arm                   randconfig-001-20250124    clang-17
arm                   randconfig-001-20250124    clang-20
arm                   randconfig-002-20250124    clang-20
arm                   randconfig-002-20250124    gcc-14.2.0
arm                   randconfig-003-20250124    clang-20
arm                   randconfig-003-20250124    gcc-14.2.0
arm                   randconfig-004-20250124    clang-19
arm                   randconfig-004-20250124    clang-20
arm                           tegra_defconfig    gcc-14.2.0
arm                       versatile_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250124    clang-20
arm64                 randconfig-002-20250124    clang-20
arm64                 randconfig-003-20250124    clang-19
arm64                 randconfig-003-20250124    clang-20
arm64                 randconfig-004-20250124    clang-20
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250124    gcc-14.2.0
csky                  randconfig-002-20250124    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20250124    clang-20
hexagon               randconfig-001-20250124    gcc-14.2.0
hexagon               randconfig-002-20250124    clang-14
hexagon               randconfig-002-20250124    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250124    clang-19
i386        buildonly-randconfig-002-20250124    clang-19
i386        buildonly-randconfig-003-20250124    clang-19
i386        buildonly-randconfig-003-20250124    gcc-12
i386        buildonly-randconfig-004-20250124    clang-19
i386        buildonly-randconfig-004-20250124    gcc-12
i386        buildonly-randconfig-005-20250124    clang-19
i386        buildonly-randconfig-005-20250124    gcc-12
i386        buildonly-randconfig-006-20250124    clang-19
i386        buildonly-randconfig-006-20250124    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250124    clang-19
i386                  randconfig-002-20250124    clang-19
i386                  randconfig-003-20250124    clang-19
i386                  randconfig-004-20250124    clang-19
i386                  randconfig-005-20250124    clang-19
i386                  randconfig-006-20250124    clang-19
i386                  randconfig-007-20250124    clang-19
i386                  randconfig-011-20250124    gcc-12
i386                  randconfig-012-20250124    gcc-12
i386                  randconfig-013-20250124    gcc-12
i386                  randconfig-014-20250124    gcc-12
i386                  randconfig-015-20250124    gcc-12
i386                  randconfig-016-20250124    gcc-12
i386                  randconfig-017-20250124    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250124    gcc-14.2.0
loongarch             randconfig-002-20250124    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    clang-18
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-20
mips                      maltaaprp_defconfig    clang-20
mips                       rbtx49xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250124    gcc-14.2.0
nios2                 randconfig-002-20250124    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250124    gcc-14.2.0
parisc                randconfig-002-20250124    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-17
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    clang-18
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                 mpc836x_rdk_defconfig    clang-18
powerpc                  mpc885_ads_defconfig    clang-18
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250124    gcc-14.2.0
powerpc               randconfig-002-20250124    gcc-14.2.0
powerpc               randconfig-003-20250124    clang-20
powerpc               randconfig-003-20250124    gcc-14.2.0
powerpc                    sam440ep_defconfig    clang-18
powerpc                        warp_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    clang-18
powerpc64             randconfig-001-20250124    gcc-14.2.0
powerpc64             randconfig-002-20250124    clang-20
powerpc64             randconfig-002-20250124    gcc-14.2.0
powerpc64             randconfig-003-20250124    clang-19
powerpc64             randconfig-003-20250124    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20250124    clang-19
riscv                 randconfig-001-20250124    gcc-14.2.0
riscv                 randconfig-002-20250124    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250124    gcc-14.2.0
s390                  randconfig-002-20250124    clang-20
s390                  randconfig-002-20250124    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    clang-18
sh                    randconfig-001-20250124    gcc-14.2.0
sh                    randconfig-002-20250124    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250124    gcc-14.2.0
sparc                 randconfig-002-20250124    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250124    gcc-14.2.0
sparc64               randconfig-002-20250124    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250124    gcc-12
um                    randconfig-001-20250124    gcc-14.2.0
um                    randconfig-002-20250124    clang-20
um                    randconfig-002-20250124    gcc-14.2.0
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250124    gcc-12
x86_64      buildonly-randconfig-002-20250124    gcc-12
x86_64      buildonly-randconfig-003-20250124    clang-19
x86_64      buildonly-randconfig-003-20250124    gcc-12
x86_64      buildonly-randconfig-004-20250124    clang-19
x86_64      buildonly-randconfig-004-20250124    gcc-12
x86_64      buildonly-randconfig-005-20250124    clang-19
x86_64      buildonly-randconfig-005-20250124    gcc-12
x86_64      buildonly-randconfig-006-20250124    clang-19
x86_64      buildonly-randconfig-006-20250124    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250124    clang-19
x86_64                randconfig-002-20250124    clang-19
x86_64                randconfig-003-20250124    clang-19
x86_64                randconfig-004-20250124    clang-19
x86_64                randconfig-005-20250124    clang-19
x86_64                randconfig-006-20250124    clang-19
x86_64                randconfig-007-20250124    clang-19
x86_64                randconfig-008-20250124    clang-19
x86_64                randconfig-071-20250124    gcc-12
x86_64                randconfig-072-20250124    gcc-12
x86_64                randconfig-073-20250124    gcc-12
x86_64                randconfig-074-20250124    gcc-12
x86_64                randconfig-075-20250124    gcc-12
x86_64                randconfig-076-20250124    gcc-12
x86_64                randconfig-077-20250124    gcc-12
x86_64                randconfig-078-20250124    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250124    gcc-14.2.0
xtensa                randconfig-002-20250124    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

