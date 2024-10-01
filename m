Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAD3CE7CF5
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bLegxFQvwRSarXGE1Ly3SGFC28O/hqnP0QCRBmSfISY=; b=GQnLhEh26VJoTcfeVhrjOPYp/X
	5PBGpKQQE/5u8V8V5z5i8fqPFqamWPlqS1RgH/WwxbXOQbpCpzg92a4epnK2WY/Ny2I/UEeOhu/Br
	jsjtTu5RfWIpHl+m7n5qozRJ3b4KT/E6NXeL0OkrduFEXNX4zGGlISGnE5uuJYCSEyaJo5iQ54n+T
	DvlLQgeOZpN5E+rZ5rr0I2/9xS3Fep8N8dIDDGvlAi36lzhEYZAxHS9R2PqxWrxDTsyv8p8F5uCMx
	123O7/fYjDTPYl4pR9e1+TsjcggAKvpy0ZX4hY9lrohGpzNTi2SL+qljMXYHdUr1EJln2emVcDagD
	mF9RmCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svYUW-000000026r7-00X6
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 08:44:20 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svYUG-000000026ls-3LDb
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 08:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727772245; x=1759308245;
  h=date:from:to:cc:subject:message-id;
  bh=oX2zqss6Dt4GgjB3F7ORKL/wVJy8oE9UTQXatnS1f04=;
  b=Nu1sbqrAAzvIFOagCxwVEfJwSDbRUthTfLohqlcGmjgJ8gn7pAUfgLJS
   qMndRt9S5PvJx6Lc2hKOmj/tO7V4ViZ+JSLqpCxTqiV49VcX07rmSVRxQ
   hwSHCX5wi7sOw1Qncj9sRSc9pQnmpmdUH6JLSvs5KhSw9hYYlhVuKKUjq
   5te7ds2Yb7BV+tSF5mRZdspA4smirt13gj9L/xLP2Zg4DSvGum3iIancA
   UjNDAeRTDedAvx9cABGEeG2DpPKLvt1v4EqHcxc9lUkJmQNgjVM0MbFlT
   h1yysJYj2QEgTXNxA+Fx0mv/D7mvKIKAKlPLGNUC0gnD6+xAyFKxfeC8d
   Q==;
X-CSE-ConnectionGUID: NqlX9cnRTlSzWv4EvYDoPw==
X-CSE-MsgGUID: KgqxYoBNQFKjmiF+cyyjDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30598155"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="30598155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 01:44:04 -0700
X-CSE-ConnectionGUID: Gn4QNyK5Q1eoFAwv51OA5w==
X-CSE-MsgGUID: qIy+VW8sSPSGw6HVLZk4BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73252855"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Oct 2024 01:44:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svYUC-000QSQ-1C;
	Tue, 01 Oct 2024 08:44:00 +0000
Date: Tue, 01 Oct 2024 16:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 83fcc7003bd768a302c868ec35adb85b10d2851d
Message-ID: <202410011602.h0IBhHgv-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_014404_968737_E0FADA1A 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: 83fcc7003bd768a302c868ec35adb85b10d2851d  wifi: ath12k: remove warning print in htt mlo offset event message

elapsed time: 1035m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         at91_dt_defconfig    clang-20
arm                          collie_defconfig    gcc-14.1.0
arm                     davinci_all_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          exynos_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                         lpc18xx_defconfig    gcc-14.1.0
arm                            mmp2_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm                         s5pv210_defconfig    clang-20
arm                        shmobile_defconfig    clang-20
arm                       versatile_defconfig    gcc-14.1.0
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241001    clang-18
i386        buildonly-randconfig-002-20241001    clang-18
i386        buildonly-randconfig-003-20241001    clang-18
i386        buildonly-randconfig-004-20241001    clang-18
i386        buildonly-randconfig-005-20241001    clang-18
i386        buildonly-randconfig-006-20241001    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241001    clang-18
i386                  randconfig-002-20241001    clang-18
i386                  randconfig-003-20241001    clang-18
i386                  randconfig-004-20241001    clang-18
i386                  randconfig-005-20241001    clang-18
i386                  randconfig-006-20241001    clang-18
i386                  randconfig-011-20241001    clang-18
i386                  randconfig-012-20241001    clang-18
i386                  randconfig-013-20241001    clang-18
i386                  randconfig-014-20241001    clang-18
i386                  randconfig-015-20241001    clang-18
i386                  randconfig-016-20241001    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        mvme147_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      bmips_stb_defconfig    clang-20
mips                         db1xxx_defconfig    gcc-14.1.0
mips                           ip32_defconfig    clang-20
mips                      maltasmvp_defconfig    clang-20
mips                        maltaup_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
mips                           rs90_defconfig    gcc-14.1.0
mips                           xway_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
openrisc                  or1klitex_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                 canyonlands_defconfig    gcc-14.1.0
powerpc                        cell_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                        icon_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    gcc-14.1.0
powerpc                         wii_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               alldefconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    clang-20
sh                     magicpanelr2_defconfig    clang-20
sh                          r7780mp_defconfig    clang-20
sh                      rts7751r2d1_defconfig    clang-20
sh                          sdk7780_defconfig    clang-20
sh                          sdk7786_defconfig    clang-20
sh                           se7750_defconfig    clang-20
sh                        sh7785lcr_defconfig    clang-20
sh                            titan_defconfig    gcc-14.1.0
sh                              ul2_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

