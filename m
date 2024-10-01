Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49500CEACEC
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NAVuePrYg04jv3x/Y7V0bNB4RmN/xBKM9ImvYMf197I=; b=O892bi0Sv8NylOqEtLbScl8EI0
	zZDep2TZIcqNHdfbKtBSyVJOh1WmG/44rJGLHhZZYfR+jnUSNXcEeVeH/vXZJpy/9gkKnLzggtmPW
	CefSJVsh++fsMAzoz/MDsD9P20evRYpIhPrUOCKtWREkdCO6QD/UCjZiW+3UxFYD65w35TzJPOyPV
	fvRqs1pXuAOHDI/no6NqJtmEwPiUOH1b3oPN9XUUudK6h1v8OFg0DFw5Mw7BL4/6D4q1lXtwACLPf
	ZyOoO/jbP4UCjXolMHCWVfgeAy6U1azWqa2wSQLkPlwMrjrRYiXB4GNSMXb8xxELNTh/LqUOyvN7Q
	GI55m0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgY9-00000003eMD-01kP
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 17:20:37 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svgY6-00000003eL7-0iry
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 17:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727803234; x=1759339234;
  h=date:from:to:cc:subject:message-id;
  bh=fYWaeKh1yidBRsAjx/NKGGKA+eKNZOtWmusMrvBBxj8=;
  b=hZJNKOXUxSqRGb98s+vQWM1Jh2vl453cwbzgZ15t5SKCaur3imKzEbtv
   mCdNXp/F8tCVJ2/jrCD9fp2R0L1sOO/AzqK1o8rs8po4GoFNW2EnQYzpE
   LQ2dgOvdanugdg72uK98DlvIpKsjPo7sDDNChPekEBPrwOaMJjk1fYFeR
   8/vmuRGtO9LLUzJUpCFM3nS7pR0AmK12b5ZMU8azwSrba/L9F+eveytrO
   0yV8aT88CJbMHUQurUwZwMIrObxYfMcQmh9DTVI8kioybFm4Q5tiBNHmy
   cyDnf+Xgqo0nfF5Ku1I+VrqOQmOW+YKuUWdGw2RjgkKIleEQvC0S/IXsO
   w==;
X-CSE-ConnectionGUID: O/wssauiQLG2+cMV9MqCnQ==
X-CSE-MsgGUID: CBXfGf2+THSQ87Gca90V4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27085202"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="27085202"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 10:20:33 -0700
X-CSE-ConnectionGUID: sMTx4Sd1RfmSZXMSUP0O1g==
X-CSE-MsgGUID: 1OiXfSnzScumZ+OUJvkQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="77767652"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2024 10:20:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svgY1-000Qzh-0L;
	Tue, 01 Oct 2024 17:20:29 +0000
Date: Wed, 02 Oct 2024 01:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-preparation] BUILD SUCCESS
 72f999b8bccf1532620331f6275f1e32a86ccf4e
Message-ID: <202410020107.wW46xiri-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_102034_318814_03CEAEE6 
X-CRM114-Status: UNSURE (   4.31  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-preparation
branch HEAD: 72f999b8bccf1532620331f6275f1e32a86ccf4e  wifi: ath12k: fix use-after-free in ath12k_dp_cc_cleanup()

elapsed time: 1335m

configs tested: 173
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241001    gcc-13.2.0
arc                   randconfig-002-20241001    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                         at91_dt_defconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          exynos_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                            mmp2_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm                   randconfig-001-20241001    gcc-14.1.0
arm                   randconfig-002-20241001    gcc-14.1.0
arm                   randconfig-003-20241001    clang-17
arm                   randconfig-004-20241001    clang-17
arm                         s5pv210_defconfig    clang-20
arm                        shmobile_defconfig    clang-20
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241001    gcc-14.1.0
arm64                 randconfig-002-20241001    gcc-14.1.0
arm64                 randconfig-004-20241001    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241001    gcc-14.1.0
csky                  randconfig-002-20241001    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241001    clang-20
hexagon               randconfig-002-20241001    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241001    clang-18
i386        buildonly-randconfig-002-20241001    gcc-12
i386        buildonly-randconfig-003-20241001    clang-18
i386        buildonly-randconfig-004-20241001    gcc-12
i386        buildonly-randconfig-005-20241001    clang-18
i386        buildonly-randconfig-006-20241001    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241001    gcc-12
i386                  randconfig-002-20241001    clang-18
i386                  randconfig-003-20241001    clang-18
i386                  randconfig-004-20241001    gcc-12
i386                  randconfig-005-20241001    clang-18
i386                  randconfig-006-20241001    clang-18
i386                  randconfig-011-20241001    gcc-12
i386                  randconfig-012-20241001    gcc-12
i386                  randconfig-013-20241001    gcc-12
i386                  randconfig-014-20241001    gcc-11
i386                  randconfig-015-20241001    gcc-12
i386                  randconfig-016-20241001    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241001    gcc-14.1.0
loongarch             randconfig-002-20241001    gcc-14.1.0
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
mips                           ip32_defconfig    clang-20
mips                      maltasmvp_defconfig    clang-20
mips                        maltaup_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
mips                           xway_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241001    gcc-14.1.0
nios2                 randconfig-002-20241001    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    clang-20
parisc                randconfig-001-20241001    gcc-14.1.0
parisc                randconfig-002-20241001    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                 canyonlands_defconfig    clang-20
powerpc                        icon_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc               randconfig-001-20241001    clang-20
powerpc               randconfig-002-20241001    clang-15
powerpc64             randconfig-001-20241001    gcc-14.1.0
powerpc64             randconfig-002-20241001    clang-20
powerpc64             randconfig-003-20241001    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241001    gcc-14.1.0
riscv                 randconfig-002-20241001    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241001    gcc-14.1.0
s390                  randconfig-002-20241001    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    clang-20
sh                     magicpanelr2_defconfig    clang-20
sh                          r7780mp_defconfig    clang-20
sh                    randconfig-001-20241001    gcc-14.1.0
sh                    randconfig-002-20241001    gcc-14.1.0
sh                      rts7751r2d1_defconfig    clang-20
sh                          sdk7780_defconfig    clang-20
sh                          sdk7786_defconfig    clang-20
sh                           se7750_defconfig    clang-20
sh                        sh7785lcr_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241001    gcc-14.1.0
sparc64               randconfig-002-20241001    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241001    clang-18
x86_64      buildonly-randconfig-002-20241001    clang-18
x86_64      buildonly-randconfig-003-20241001    clang-18
x86_64      buildonly-randconfig-004-20241001    gcc-12
x86_64      buildonly-randconfig-005-20241001    clang-18
x86_64      buildonly-randconfig-006-20241001    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20241001    clang-18
x86_64                randconfig-002-20241001    clang-18
x86_64                randconfig-003-20241001    gcc-11
x86_64                randconfig-004-20241001    clang-18
x86_64                randconfig-005-20241001    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

