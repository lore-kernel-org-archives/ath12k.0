Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F5DD609A3
	for <ath12k@archiver.kernel.org>; Wed, 27 Nov 2024 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XOtIdRBmAa67I4Y1CptYf9uP8IldK4WMIK7mMBFXeFg=; b=j75etCzDTWZnagoyzgl8tOo4Lr
	UFSNCo3HwEgzruI+i6xe3Yn/NhDMThq4VDazZDafYFmSOkaN/Bc6gxMg44pL/YnQt4MeQgae4Jffe
	J+gWtCoHCqG43IAzvWQ4ssYMblAGd4hDWh6B+RXXluxsYM6mq5rWsaQ1YF/IBGjPYm7MBWs0Y9CI7
	hupxJ3pRQ6wQuT44ECg4ZVtB+sqo6Xd+ooZyoYOzxKUk2mG2NLUpT24wBuDxF9be6QJbyPVs6lqA1
	gnuepm9i9YLSADKLfqo+9hPKvf3092mkAZlQV2VNUEaHDjnIj8qPqunpgokveEcxxikEWuzR7kreC
	zfGVshuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGBZ8-0000000CKaY-0uR1
	for ath12k@archiver.kernel.org;
	Wed, 27 Nov 2024 06:30:22 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGBZ5-0000000CKaE-45lK
	for ath12k@lists.infradead.org;
	Wed, 27 Nov 2024 06:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732689021; x=1764225021;
  h=date:from:to:cc:subject:message-id;
  bh=GX1L77ht2taT+MERuIQPdv3pP5+9Tsa8Y+w3B1CRwBE=;
  b=kiIJQ2uepoE7Gd8ynkve5n+9HqKu/p1r8vxM6SdkJQ3uimcxM91FnqZZ
   bRUl20j29KL2mg0FyiMuRBB0RseBfrOAKSijVvijI7p7kkv/HvWm1ujAR
   PcD9ajZ6/0EXYj1puZ7gC6DgN4n84erumymDCCYfP61LEI+tbIuk79gO1
   DES7aLNFH7N2b88wbsV+BfrYcf18k9lAM8NjU263Xynj7mKExrNkjxXpP
   361E6ggUJC+4DsSUbhWqQVLz7FM33G8KKz5YXhzuHFDWgaEZEOx+JSF+9
   YrUY4ROKoD2xYdWF5ZuAEiczgJWJM1EbL/+8JBUx+PN43pZIza1aev0fX
   g==;
X-CSE-ConnectionGUID: E84U+BJ2QU+7oqR46vi4Qg==
X-CSE-MsgGUID: MA8plaf/TiSujANEwmkYjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50281808"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="50281808"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 22:30:20 -0800
X-CSE-ConnectionGUID: PqdsoNFvRp6PBngBAZfFvg==
X-CSE-MsgGUID: aAQkW2z+Snq2H2n+AbN7yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="122680244"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2024 22:30:17 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGBZ1-0007mR-0c;
	Wed, 27 Nov 2024 06:30:15 +0000
Date: Wed, 27 Nov 2024 14:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 21a8130f4da0b797a01052c4a422ac297ddad87c
Message-ID: <202411271441.NC9z08ne-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_223020_066787_1DB9B969 
X-CRM114-Status: UNSURE (   3.91  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
branch HEAD: 21a8130f4da0b797a01052c4a422ac297ddad87c  wifi: ath12k: ath12k_mac_op_sta_rc_update(): use mac80211 provided link id

elapsed time: 752m

configs tested: 154
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    clang-20
arc                   randconfig-001-20241127    gcc-14.2.0
arc                   randconfig-002-20241127    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                         mv78xx0_defconfig    clang-20
arm                         mv78xx0_defconfig    gcc-14.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-20
arm                          pxa3xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20241127    gcc-14.2.0
arm                   randconfig-002-20241127    gcc-14.2.0
arm                   randconfig-003-20241127    gcc-14.2.0
arm                   randconfig-004-20241127    gcc-14.2.0
arm                        realview_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm                        spear3xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241127    gcc-14.2.0
arm64                 randconfig-002-20241127    gcc-14.2.0
arm64                 randconfig-003-20241127    gcc-14.2.0
arm64                 randconfig-004-20241127    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241127    gcc-14.2.0
csky                  randconfig-002-20241127    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241127    gcc-14.2.0
hexagon               randconfig-002-20241127    gcc-14.2.0
i386        buildonly-randconfig-001-20241127    clang-19
i386        buildonly-randconfig-002-20241127    clang-19
i386        buildonly-randconfig-003-20241127    clang-19
i386        buildonly-randconfig-004-20241127    clang-19
i386        buildonly-randconfig-005-20241127    clang-19
i386        buildonly-randconfig-006-20241127    clang-19
i386                  randconfig-001-20241127    clang-19
i386                  randconfig-002-20241127    clang-19
i386                  randconfig-003-20241127    clang-19
i386                  randconfig-004-20241127    clang-19
i386                  randconfig-005-20241127    clang-19
i386                  randconfig-006-20241127    clang-19
i386                  randconfig-011-20241127    clang-19
i386                  randconfig-012-20241127    clang-19
i386                  randconfig-013-20241127    clang-19
i386                  randconfig-014-20241127    clang-19
i386                  randconfig-015-20241127    clang-19
i386                  randconfig-016-20241127    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241127    gcc-14.2.0
loongarch             randconfig-002-20241127    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-20
m68k                          atari_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                          eyeq6_defconfig    clang-20
mips                        maltaup_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241127    gcc-14.2.0
nios2                 randconfig-002-20241127    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241127    gcc-14.2.0
parisc                randconfig-002-20241127    gcc-14.2.0
powerpc                     akebono_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                     mpc5200_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                       ppc64_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241127    gcc-14.2.0
powerpc               randconfig-002-20241127    gcc-14.2.0
powerpc               randconfig-003-20241127    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241127    gcc-14.2.0
powerpc64             randconfig-002-20241127    gcc-14.2.0
powerpc64             randconfig-003-20241127    gcc-14.2.0
riscv                            alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241127    gcc-14.2.0
riscv                 randconfig-002-20241127    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241127    gcc-14.2.0
s390                  randconfig-002-20241127    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20241127    gcc-14.2.0
sh                    randconfig-002-20241127    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sh                          urquell_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64               randconfig-001-20241127    gcc-14.2.0
sparc64               randconfig-002-20241127    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                    randconfig-001-20241127    gcc-14.2.0
um                    randconfig-002-20241127    gcc-14.2.0
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                          rhel-9.4-func    clang-19
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-20
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241127    gcc-14.2.0
xtensa                randconfig-002-20241127    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

