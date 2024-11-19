Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E52AD4415F
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z+JjWXGkq7R8kWNomy1p8mSGQvuOZ0WjS7CInoEedAo=; b=F1lc00joX6J1/zzhBKt8bFQjSx
	JPB9GBQWwBd+TjmqpaFNOP76IcL/OP64R6/ayBTykD+YC+uu++DLBw+XHV4SODUiU8HCkXi/EjWAg
	Cz6I/uTlRunKFG2ZQ/2KsW3y2ekLrfFJ/w+OEFY3mNyC+KOoFPOAW5IrRlTFuEHIZXfCTGHakt+Hc
	GdXDLtHsO334zDyNVySPFico69ubC2Jmo2D0RFng8EIhuJEMYwGG1+wNQ45uiou+zekMOPbo+zXrz
	1FtYkLiFozd4a6p3szqYy7ohkMQ6FkuBSZ9SCLy74r1LoL4+5T8UQri8I6MXZMts4nf7pVuUFqHFC
	Bq5sucww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDORF-0000000CXZU-401l
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 13:38:41 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOQV-0000000CXLw-3r62
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 13:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732023476; x=1763559476;
  h=date:from:to:cc:subject:message-id;
  bh=FfvHNNP9Fgks4lFzVCPtxzHwBYnSNk0++n7AQfxjtlQ=;
  b=QGEat7ucAt4vRv85oXmgLaAZtJ7yQJtoRTArfhQ4vei5nPQxRQ/eHAag
   i25gqdr5VUIzKzuHhANfKYJf1KGRcsSBSeaNqglZP9WekWveqxHjL4JN6
   qnGa1P129mokca5kXndjHMUSMa89I0VjSRwXazmel8kC7JBObVcxo52vu
   PfzILpGqZVJcYiz6lA1A8uDNHO6yy7bOYGEn8+lG0adfPrkZHJ9NIInmz
   RdDqT4Kiyoop2Pzz/m6aOY/7o3YAtcMOo17iMQwWChuv2aK9CjP21z2x5
   jHDRL9YmB2yQEUIRk6CDOTMXZVjhLogeFaSGdWIZNfCSbdSod/7gdiiRw
   Q==;
X-CSE-ConnectionGUID: vg+uNSTvSuqxKSKPusxhow==
X-CSE-MsgGUID: Aau23WsuR1KzWHHZdqM/Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35691261"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35691261"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 05:37:52 -0800
X-CSE-ConnectionGUID: rkQj6/b6RlWwxKjmJmbcow==
X-CSE-MsgGUID: cMDCFv/pSEatHl/mnTSLMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="89571158"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2024 05:37:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDOQO-00004C-0q;
	Tue, 19 Nov 2024 13:37:48 +0000
Date: Tue, 19 Nov 2024 20:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 313e6dd1f43f9c168658378e24000578e5637301
Message-ID: <202411192040.znPX7bbT-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_053756_020403_725FD8C2 
X-CRM114-Status: UNSURE (   4.35  )
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
branch HEAD: 313e6dd1f43f9c168658378e24000578e5637301  Add localversion-wireless-testing-ath

elapsed time: 1222m

configs tested: 213
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                                     allnoconfig    gcc-14.2.0
alpha                                    allyesconfig    clang-20
alpha                                       defconfig    gcc-14.2.0
arc                                      allmodconfig    clang-20
arc                                      allmodconfig    gcc-13.2.0
arc                                       allnoconfig    gcc-13.2.0
arc                                       allnoconfig    gcc-14.2.0
arc                                      allyesconfig    clang-20
arc                                      allyesconfig    gcc-13.2.0
arc                                         defconfig    gcc-14.2.0
arc                           randconfig-001-20241119    gcc-14.2.0
arc                           randconfig-002-20241119    gcc-14.2.0
arc                                   tb10x_defconfig    clang-20
arc                                vdk_hs38_defconfig    clang-20
arc                            vdk_hs38_smp_defconfig    clang-20
arm                                      allmodconfig    clang-20
arm                                      allmodconfig    gcc-14.2.0
arm                                       allnoconfig    clang-20
arm                                       allnoconfig    gcc-14.2.0
arm                                      allyesconfig    clang-20
arm                                      allyesconfig    gcc-14.2.0
arm                                         defconfig    gcc-14.2.0
arm                           milbeaut_m10v_defconfig    clang-20
arm                                 nhk8815_defconfig    clang-20
arm                                     pxa_defconfig    clang-20
arm                           randconfig-001-20241119    gcc-14.2.0
arm                           randconfig-002-20241119    gcc-14.2.0
arm                           randconfig-003-20241119    gcc-14.2.0
arm                           randconfig-004-20241119    gcc-14.2.0
arm                                   sama5_defconfig    clang-20
arm                               spear13xx_defconfig    clang-20
arm                            vt8500_v6_v7_defconfig    clang-20
arm                                 wpcm450_defconfig    clang-20
arm64                                    allmodconfig    clang-20
arm64                                     allnoconfig    gcc-14.2.0
arm64                                       defconfig    gcc-14.2.0
arm64                         randconfig-001-20241119    gcc-14.2.0
arm64                         randconfig-002-20241119    gcc-14.2.0
arm64                         randconfig-003-20241119    gcc-14.2.0
arm64                         randconfig-004-20241119    gcc-14.2.0
csky                                      allnoconfig    gcc-14.2.0
csky                                        defconfig    gcc-14.2.0
csky                          randconfig-001-20241119    gcc-14.2.0
csky                          randconfig-002-20241119    gcc-14.2.0
hexagon                                  allmodconfig    clang-20
hexagon                                   allnoconfig    clang-20
hexagon                                   allnoconfig    gcc-14.2.0
hexagon                                  allyesconfig    clang-20
hexagon                                     defconfig    gcc-14.2.0
hexagon                       randconfig-001-20241119    gcc-14.2.0
hexagon                       randconfig-002-20241119    gcc-14.2.0
i386                                     allmodconfig    clang-19
i386                                     allmodconfig    gcc-12
i386                                      allnoconfig    clang-19
i386                                      allnoconfig    gcc-12
i386                                     allyesconfig    clang-19
i386                                     allyesconfig    gcc-12
i386                buildonly-randconfig-001-20241119    clang-19
i386                buildonly-randconfig-002-20241119    clang-19
i386                buildonly-randconfig-003-20241119    clang-19
i386                buildonly-randconfig-004-20241119    clang-19
i386                buildonly-randconfig-005-20241119    clang-19
i386                buildonly-randconfig-006-20241119    clang-19
i386                                        defconfig    clang-19
i386                          randconfig-001-20241119    clang-19
i386                          randconfig-002-20241119    clang-19
i386                          randconfig-003-20241119    clang-19
i386                          randconfig-004-20241119    clang-19
i386                          randconfig-005-20241119    clang-19
i386                          randconfig-006-20241119    clang-19
i386                          randconfig-011-20241119    clang-19
i386                          randconfig-012-20241119    clang-19
i386                          randconfig-013-20241119    clang-19
i386                          randconfig-014-20241119    clang-19
i386                          randconfig-015-20241119    clang-19
i386                          randconfig-016-20241119    clang-19
loongarch                                allmodconfig    gcc-14.2.0
loongarch                                 allnoconfig    gcc-14.2.0
loongarch                                   defconfig    gcc-14.2.0
loongarch                     randconfig-001-20241119    gcc-14.2.0
loongarch                     randconfig-002-20241119    gcc-14.2.0
m68k                                     allmodconfig    gcc-14.2.0
m68k                                      allnoconfig    gcc-14.2.0
m68k                                     allyesconfig    gcc-14.2.0
m68k                                        defconfig    gcc-14.2.0
m68k                               m5208evb_defconfig    clang-20
m68k                               m5249evb_defconfig    clang-20
m68k                                m5307c3_defconfig    clang-20
m68k                                    mac_defconfig    clang-20
m68k                                    q40_defconfig    clang-20
microblaze                               allmodconfig    gcc-14.2.0
microblaze                                allnoconfig    gcc-14.2.0
microblaze                               allyesconfig    gcc-14.2.0
microblaze                                  defconfig    gcc-14.2.0
mips                                      allnoconfig    gcc-14.2.0
mips                              bmips_stb_defconfig    clang-20
mips                                 db1xxx_defconfig    clang-20
mips                                   ip27_defconfig    clang-20
mips                                omega2p_defconfig    clang-20
mips                                qi_lb60_defconfig    clang-20
mips                               rbtx49xx_defconfig    clang-20
nios2                                     allnoconfig    gcc-14.2.0
nios2                                       defconfig    gcc-14.2.0
nios2                         randconfig-001-20241119    gcc-14.2.0
nios2                         randconfig-002-20241119    gcc-14.2.0
openrisc                                  allnoconfig    clang-20
openrisc                                  allnoconfig    gcc-14.2.0
openrisc                                 allyesconfig    gcc-14.2.0
openrisc                                    defconfig    gcc-12
parisc                                   allmodconfig    gcc-14.2.0
parisc                                    allnoconfig    clang-20
parisc                                    allnoconfig    gcc-14.2.0
parisc                                   allyesconfig    gcc-14.2.0
parisc                                      defconfig    gcc-12
parisc                        randconfig-001-20241119    gcc-14.2.0
parisc                        randconfig-002-20241119    gcc-14.2.0
parisc64                                    defconfig    gcc-14.2.0
powerpc                                  allmodconfig    gcc-14.2.0
powerpc                                   allnoconfig    clang-20
powerpc                                   allnoconfig    gcc-14.2.0
powerpc                                  allyesconfig    gcc-14.2.0
powerpc                            ge_imp3a_defconfig    clang-20
powerpc                              katmai_defconfig    clang-20
powerpc                              mgcoge_defconfig    clang-20
powerpc                          mpc866_ads_defconfig    clang-20
powerpc                       randconfig-001-20241119    gcc-14.2.0
powerpc                       randconfig-002-20241119    gcc-14.2.0
powerpc                       randconfig-003-20241119    gcc-14.2.0
powerpc                              tqm8xx_defconfig    clang-20
powerpc64                     randconfig-001-20241119    gcc-14.2.0
powerpc64                     randconfig-002-20241119    gcc-14.2.0
powerpc64                     randconfig-003-20241119    gcc-14.2.0
riscv                                    allmodconfig    gcc-14.2.0
riscv                                     allnoconfig    clang-20
riscv                                     allnoconfig    gcc-14.2.0
riscv                                    allyesconfig    gcc-14.2.0
riscv                                       defconfig    gcc-12
riscv                     nommu_k210_sdcard_defconfig    clang-20
riscv                         randconfig-001-20241119    gcc-14.2.0
riscv                         randconfig-002-20241119    gcc-14.2.0
s390                                     allmodconfig    clang-20
s390                                     allmodconfig    gcc-14.2.0
s390                                      allnoconfig    clang-20
s390                                     allyesconfig    gcc-14.2.0
s390                                        defconfig    gcc-12
s390                          randconfig-001-20241119    gcc-14.2.0
s390                          randconfig-002-20241119    gcc-14.2.0
sh                                       allmodconfig    gcc-14.2.0
sh                                        allnoconfig    gcc-14.2.0
sh                                       allyesconfig    gcc-14.2.0
sh                                          defconfig    gcc-12
sh                                       j2_defconfig    clang-20
sh                         kfr2r09-romimage_defconfig    clang-20
sh                            randconfig-001-20241119    gcc-14.2.0
sh                            randconfig-002-20241119    gcc-14.2.0
sh                                sh7763rdp_defconfig    clang-20
sh                           sh7770_generic_defconfig    clang-20
sparc                                    allmodconfig    gcc-14.2.0
sparc64                                     defconfig    gcc-12
sparc64                       randconfig-001-20241119    gcc-14.2.0
sparc64                       randconfig-002-20241119    gcc-14.2.0
um                                       allmodconfig    clang-20
um                                        allnoconfig    clang-17
um                                        allnoconfig    clang-20
um                                       allyesconfig    clang-20
um                                          defconfig    gcc-12
um                                     i386_defconfig    gcc-12
um                            randconfig-001-20241119    gcc-14.2.0
um                            randconfig-002-20241119    gcc-14.2.0
um                                   x86_64_defconfig    gcc-12
x86_64                                    allnoconfig    clang-19
x86_64                                   allyesconfig    clang-19
x86_64              buildonly-randconfig-001-20241119    gcc-12
x86_64              buildonly-randconfig-002-20241119    gcc-12
x86_64              buildonly-randconfig-003-20241119    gcc-12
x86_64              buildonly-randconfig-004-20241119    gcc-12
x86_64              buildonly-randconfig-005-20241119    gcc-12
x86_64              buildonly-randconfig-006-20241119    gcc-12
x86_64                                      defconfig    clang-19
x86_64                                      defconfig    gcc-11
x86_64                                          kexec    clang-19
x86_64                        randconfig-001-20241119    gcc-12
x86_64                        randconfig-002-20241119    gcc-12
x86_64                        randconfig-003-20241119    gcc-12
x86_64                        randconfig-004-20241119    gcc-12
x86_64                        randconfig-005-20241119    gcc-12
x86_64                        randconfig-006-20241119    gcc-12
x86_64                        randconfig-011-20241119    gcc-12
x86_64                        randconfig-012-20241119    gcc-12
x86_64                        randconfig-013-20241119    gcc-12
x86_64                        randconfig-014-20241119    gcc-12
x86_64                        randconfig-015-20241119    gcc-12
x86_64                        randconfig-016-20241119    gcc-12
x86_64                        randconfig-071-20241119    gcc-12
x86_64                        randconfig-072-20241119    gcc-12
x86_64                        randconfig-073-20241119    gcc-12
x86_64                        randconfig-074-20241119    gcc-12
x86_64                        randconfig-075-20241119    gcc-12
x86_64                        randconfig-076-20241119    gcc-12
x86_64                                       rhel-9.4    clang-19
x86_64                                       rhel-9.4    gcc-12
x86_64                            rhel-9.4-kselftests    gcc-12
x86_64               sof-customedconfig-amd-defconfig    clang-19
x86_64              sof-customedconfig-atom-defconfig    gcc-12
x86_64               sof-customedconfig-avs-defconfig    clang-19
x86_64               sof-customedconfig-bpf-defconfig    gcc-12
x86_64      sof-customedconfig-compile-test-defconfig    gcc-12
x86_64             sof-customedconfig-debug-defconfig    clang-19
x86_64            sof-customedconfig-edison-defconfig    gcc-12
x86_64        sof-customedconfig-lock-stall-defconfig    clang-19
xtensa                                    allnoconfig    gcc-14.2.0
xtensa                        randconfig-001-20241119    gcc-14.2.0
xtensa                        randconfig-002-20241119    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

