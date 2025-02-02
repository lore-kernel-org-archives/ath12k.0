Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35D5C02190
	for <ath12k@archiver.kernel.org>; Sun,  2 Feb 2025 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pUglh2XFgRNvYd6g9h+wuD8LxBk62u2mzjqofVkzUYM=; b=KG7AC5dsgd5HN8LAJGonHB4B/5
	JHUM1/vSlfa0P6vHsSngm/jNiB35PKc8qltIB8Z5hkbl1xJKlHZwZ7fHddvbCXRr0BADNyBTrqJRF
	alsBU1lWQLFWtJ2Z0Cu4eqcMU82Frv+47HJKdN6rzyn//aPVVECPAssJPaLScCbW31qUpNqNm+rAA
	qRbJqdlUsWrg3ZrI3Hm4Df6y6EisTSLonelqPQHWSmFeGZ7xjWvN9zUHDfc/Qoc3177pfl+5/TTbC
	kr2UwAFCmpb5DyHj5rAlsBorEyi4R0uFBO1hFEtoftL0OKi46YkRF6/DCMvZ/s/S+6dHHhiuX800G
	6XXa68Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teTn7-0000000DRt6-2Kw7
	for ath12k@archiver.kernel.org;
	Sun, 02 Feb 2025 06:49:13 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teTn5-0000000DRsn-2tMy
	for ath12k@lists.infradead.org;
	Sun, 02 Feb 2025 06:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738478952; x=1770014952;
  h=date:from:to:cc:subject:message-id;
  bh=bT/pEywJuikPh/4LKGFZ876zKpXia8diE4R8GUvTLDE=;
  b=IRqEsWlVIZqLbz7sYWveRqvlN4imFrwbj5QzivbCda3Mk2RYXKcvRLWL
   qvsTJDEJ7coyjmVMN3ImfsQV7O5JdAoWg+7jV1HGVMJeDhBNM+gU3qnZ/
   eT3VAOV/aEVThmP6Omjr63WOa+JlAAm1ceKHT4FocV5UUkfj9iOTastVA
   yQM1ZLGWukYKkW0PTKMpCLa1R1Gn9wFsbOguJAreZq2fqpZbO7xiT0NOl
   I5ch2sV+itqXKIr3/T6PfUM3mRkMWCb2GjRFc8jdtI9Uq4n4AAWNDK7dr
   2T4InvcD7xwv0zh7h061nEzaRE3W4EL+S1FfR6biyI/QSB64iGEKbgNp8
   Q==;
X-CSE-ConnectionGUID: yXJ142tzShOXUbunkxsjfA==
X-CSE-MsgGUID: tGluZFs4QNOZDZx3FY/t1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="39152092"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="39152092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 22:49:08 -0800
X-CSE-ConnectionGUID: B7K7bqr8QqqNdDInQPtMeg==
X-CSE-MsgGUID: IQmjQoOwSjyufb7+b3ZFzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="110558392"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Feb 2025 22:49:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teTmy-000pNj-2k;
	Sun, 02 Feb 2025 06:49:04 +0000
Date: Sun, 02 Feb 2025 14:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 d8a327038aa3caee3399411f1ab017ca37ce24f0
Message-ID: <202502021423.2Ydcsh1K-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_224911_774489_5EF4DCC2 
X-CRM114-Status: UNSURE (   3.70  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: d8a327038aa3caee3399411f1ab017ca37ce24f0  Merge branch 'pending' into main-pending

elapsed time: 747m

configs tested: 145
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250202    gcc-13.2.0
arc                   randconfig-002-20250202    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-21
arm                          collie_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-15
arm                         lpc18xx_defconfig    clang-19
arm                   milbeaut_m10v_defconfig    clang-21
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250202    gcc-14.2.0
arm                   randconfig-002-20250202    clang-15
arm                   randconfig-003-20250202    clang-21
arm                   randconfig-004-20250202    clang-15
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250202    gcc-14.2.0
arm64                 randconfig-002-20250202    clang-17
arm64                 randconfig-003-20250202    gcc-14.2.0
arm64                 randconfig-004-20250202    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250202    gcc-14.2.0
csky                  randconfig-002-20250202    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250202    clang-16
hexagon               randconfig-002-20250202    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250202    gcc-12
i386        buildonly-randconfig-002-20250202    gcc-12
i386        buildonly-randconfig-003-20250202    gcc-12
i386        buildonly-randconfig-004-20250202    gcc-12
i386        buildonly-randconfig-005-20250202    gcc-12
i386        buildonly-randconfig-006-20250202    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250202    gcc-14.2.0
loongarch             randconfig-002-20250202    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-19
mips                           ip28_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250202    gcc-14.2.0
nios2                 randconfig-002-20250202    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250202    gcc-14.2.0
parisc                randconfig-002-20250202    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       ebony_defconfig    clang-18
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                  mpc866_ads_defconfig    clang-21
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250202    clang-17
powerpc               randconfig-002-20250202    gcc-14.2.0
powerpc               randconfig-003-20250202    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250202    gcc-14.2.0
powerpc64             randconfig-002-20250202    clang-21
powerpc64             randconfig-003-20250202    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250202    clang-21
riscv                 randconfig-002-20250202    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250202    gcc-14.2.0
s390                  randconfig-002-20250202    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250202    gcc-14.2.0
sh                    randconfig-002-20250202    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250202    gcc-14.2.0
sparc                 randconfig-002-20250202    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250202    gcc-14.2.0
sparc64               randconfig-002-20250202    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250202    gcc-12
um                    randconfig-002-20250202    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250202    clang-19
x86_64      buildonly-randconfig-002-20250202    clang-19
x86_64      buildonly-randconfig-003-20250202    gcc-12
x86_64      buildonly-randconfig-004-20250202    gcc-12
x86_64      buildonly-randconfig-005-20250202    clang-19
x86_64      buildonly-randconfig-006-20250202    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250202    gcc-14.2.0
xtensa                randconfig-002-20250202    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

