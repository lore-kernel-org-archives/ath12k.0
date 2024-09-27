Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4FCCEBF97
	for <ath12k@archiver.kernel.org>; Fri, 27 Sep 2024 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xOFkTldEHXftaN18/0vqGJw6oFdhIYgW6YnKzFf7Yf8=; b=gtaDFja0q355XJkcInDdu731+F
	KMypUwr/9/2uaT1aHu7qHyO04h4LmG36I1RarDZ/xDcJwt6i8VIUCpqjsX9vAHTavsGZUJvFRbUMS
	rieyp8ldNF1dHY0F1wQn56aIm2loj5YX65BTkfL89VkqnPElSYKp9az5jKTK0aglbqCKPo8tqp+yz
	XNviCOpNKIIjbqiKhjvYzxdROdFabqmAW7dImUi09stpPd5T6IEq4QQUIX5BNRMvixENW5Z1pPLAW
	U+dBmE+vIaFNUEk6r6LPWHhuS8fy99L36S2Up2XHMuJFnjSkI0OjdiSln5puYpCAkut1y5BHaSC+T
	cjO+eluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su8nk-0000000Auny-1qx1
	for ath12k@archiver.kernel.org;
	Fri, 27 Sep 2024 11:06:20 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su8nh-0000000AunP-1da5
	for ath12k@lists.infradead.org;
	Fri, 27 Sep 2024 11:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727435177; x=1758971177;
  h=date:from:to:cc:subject:message-id;
  bh=aWO/L8EGaNMWAveAo1ujuOY/YpEO/DxW8fQLVddzhW4=;
  b=V6582+WVXy8FEAFlgJ/Z+wTAKe15ux8Stv+qaGr3x1nsIJ/u4vQ81hZ/
   U4IC+cr805UEzUZ2irmeac3tSjMceLu0QB0yWO8XJPnAqH4dRfYKpUNPV
   tLHz6k+3FTfSHJbdF1dqHloWqhrBgsHfrF6livxqXgxmAa7f+f+GcGMEg
   bwc4oDhE2aG9Nb+IIDDedghvBqQRe8ljmUlfE8yqB2vn5O9WPR7EpUYzF
   kY33q6XYQegf2c6dfeCQw2D6dbnI6KOgxa8pP7Y393lAHJeHDZSLWAVg+
   j/5XhqjwrRg4DVwz+f0upEvMQOt5xdsYCV0nFQLCrK1AEz9tnbDIu5dct
   Q==;
X-CSE-ConnectionGUID: Uc2AWi9KRr2uVlyu5IZRxg==
X-CSE-MsgGUID: VuLT9SVIR4eZ/wwFBSMAUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37955923"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37955923"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 04:06:15 -0700
X-CSE-ConnectionGUID: gWWeCCBzQ4+AmCsB7ZnEfw==
X-CSE-MsgGUID: /fxibl9EScG/5Zc3dxSMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="73294041"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2024 04:06:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su8na-000LqZ-2Z;
	Fri, 27 Sep 2024 11:06:10 +0000
Date: Fri, 27 Sep 2024 19:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 ced1f8bd64cda4e0c1df0890d1041cc6b18d5c77
Message-ID: <202409271934.MmovdJFl-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_040617_616633_EEDAB0BC 
X-CRM114-Status: UNSURE (   3.59  )
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
branch HEAD: ced1f8bd64cda4e0c1df0890d1041cc6b18d5c77  Add localversion-wireless-testing-ath

elapsed time: 1214m

configs tested: 218
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20240927    gcc-14.1.0
arc                   randconfig-002-20240927    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          gemini_defconfig    gcc-14.1.0
arm                         lpc18xx_defconfig    gcc-14.1.0
arm                         lpc32xx_defconfig    gcc-14.1.0
arm                   milbeaut_m10v_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                        multi_v7_defconfig    gcc-14.1.0
arm                   randconfig-001-20240927    gcc-14.1.0
arm                   randconfig-002-20240927    gcc-14.1.0
arm                   randconfig-003-20240927    gcc-14.1.0
arm                   randconfig-004-20240927    gcc-14.1.0
arm                           u8500_defconfig    gcc-14.1.0
arm                        vexpress_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240927    gcc-14.1.0
arm64                 randconfig-002-20240927    gcc-14.1.0
arm64                 randconfig-003-20240927    gcc-14.1.0
arm64                 randconfig-004-20240927    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240927    gcc-14.1.0
csky                  randconfig-002-20240927    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240927    gcc-14.1.0
hexagon               randconfig-002-20240927    gcc-14.1.0
i386                             alldefconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240927    clang-18
i386        buildonly-randconfig-002-20240927    clang-18
i386        buildonly-randconfig-002-20240927    gcc-12
i386        buildonly-randconfig-003-20240927    clang-18
i386        buildonly-randconfig-004-20240927    clang-18
i386        buildonly-randconfig-005-20240927    clang-18
i386        buildonly-randconfig-006-20240927    clang-18
i386        buildonly-randconfig-006-20240927    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240927    clang-18
i386                  randconfig-002-20240927    clang-18
i386                  randconfig-003-20240927    clang-18
i386                  randconfig-004-20240927    clang-18
i386                  randconfig-004-20240927    gcc-12
i386                  randconfig-005-20240927    clang-18
i386                  randconfig-006-20240927    clang-18
i386                  randconfig-011-20240927    clang-18
i386                  randconfig-011-20240927    gcc-12
i386                  randconfig-012-20240927    clang-18
i386                  randconfig-013-20240927    clang-18
i386                  randconfig-013-20240927    gcc-12
i386                  randconfig-014-20240927    clang-18
i386                  randconfig-014-20240927    gcc-12
i386                  randconfig-015-20240927    clang-18
i386                  randconfig-015-20240927    gcc-11
i386                  randconfig-016-20240927    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240927    gcc-14.1.0
loongarch             randconfig-002-20240927    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                            mac_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    clang-20
mips                     cu1000-neo_defconfig    clang-20
mips                  decstation_64_defconfig    gcc-14.1.0
mips                           ip28_defconfig    clang-20
mips                       lemote2f_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240927    gcc-14.1.0
nios2                 randconfig-002-20240927    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20240927    gcc-14.1.0
parisc                randconfig-002-20240927    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                       eiger_defconfig    gcc-14.1.0
powerpc                     ksi8560_defconfig    gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc               randconfig-001-20240927    gcc-14.1.0
powerpc                     redwood_defconfig    clang-20
powerpc                     taishan_defconfig    clang-20
powerpc64             randconfig-001-20240927    gcc-14.1.0
powerpc64             randconfig-002-20240927    gcc-14.1.0
powerpc64             randconfig-003-20240927    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240927    gcc-14.1.0
riscv                 randconfig-002-20240927    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240927    gcc-14.1.0
s390                  randconfig-002-20240927    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-20
sh                    randconfig-001-20240927    gcc-14.1.0
sh                    randconfig-002-20240927    gcc-14.1.0
sh                          rsk7201_defconfig    gcc-14.1.0
sh                           se7724_defconfig    clang-20
sh                   sh7770_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240927    gcc-14.1.0
sparc64               randconfig-002-20240927    gcc-14.1.0
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240927    gcc-14.1.0
um                    randconfig-002-20240927    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240927    clang-18
x86_64      buildonly-randconfig-002-20240927    clang-18
x86_64      buildonly-randconfig-003-20240927    clang-18
x86_64      buildonly-randconfig-004-20240927    clang-18
x86_64      buildonly-randconfig-005-20240927    clang-18
x86_64      buildonly-randconfig-006-20240927    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240927    clang-18
x86_64                randconfig-002-20240927    clang-18
x86_64                randconfig-003-20240927    clang-18
x86_64                randconfig-004-20240927    clang-18
x86_64                randconfig-005-20240927    clang-18
x86_64                randconfig-006-20240927    clang-18
x86_64                randconfig-011-20240927    clang-18
x86_64                randconfig-012-20240927    clang-18
x86_64                randconfig-013-20240927    clang-18
x86_64                randconfig-014-20240927    clang-18
x86_64                randconfig-015-20240927    clang-18
x86_64                randconfig-016-20240927    clang-18
x86_64                randconfig-071-20240927    clang-18
x86_64                randconfig-072-20240927    clang-18
x86_64                randconfig-073-20240927    clang-18
x86_64                randconfig-074-20240927    clang-18
x86_64                randconfig-075-20240927    clang-18
x86_64                randconfig-076-20240927    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    clang-20
xtensa                randconfig-001-20240927    gcc-14.1.0
xtensa                randconfig-002-20240927    gcc-14.1.0
xtensa                         virt_defconfig    gcc-14.1.0
xtensa                    xip_kc705_defconfig    clang-20
xtensa                    xip_kc705_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

