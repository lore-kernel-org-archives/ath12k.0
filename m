Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5872C7EE39
	for <ath12k@archiver.kernel.org>; Sat, 28 Jun 2025 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Qq7sq1dNbZ0fDj2WMJoychbqlKTUYLfPhTdUn4B+Vk=; b=uEVetvtmUyV+VF3N56qmYkn2EJ
	wh2mi4AIzAuJKr2vy5JwB8exCbiUG7rADqCmXmjYQaf7YBXQ6FoRyIrCtOvyrFh21lk4ClC1UArSg
	KrFwRttFvgPUyCvKc3/M1TVigLwQmqjUj934QyYoCMPYGJ/W2GsQ/DsziaPnq592pwL1wig9AEGEc
	PFZSzAcIHuOg80b4/LCFut+ZCK739KuUob3DjecKOKtzL/csp4J2sQBpBafUNJGBbN7L7rlJetd8T
	WidaeqpdW9pMDVoXh8eKoObC1/p7sSStxaSusLXMLrULUdsULKk5HER12WcsO9Wr/xo6n6D5ML6nC
	3uOoaYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVaET-0000000HCko-2Tgq;
	Sat, 28 Jun 2025 18:24:57 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVaEQ-0000000HCkD-3TFC
	for ath12k@lists.infradead.org;
	Sat, 28 Jun 2025 18:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751135095; x=1782671095;
  h=date:from:to:cc:subject:message-id;
  bh=USl6aQIDQ7IyChcLhRGLDKADCqvIXarMMH60CutJSF0=;
  b=TPEEKI449GIeJL7UetDprL1Lr519HReq7yNAxRigV7RVk/gBRk/Uya7V
   XFlVFVvhgrs4dGxGPU0ZjbnnVgBJgz9OI1FYoVzNQ8WTBhBj8LCqfDXJe
   lCKwoWXEMmFR90xpUCbfah0DSTkZ3vE4kf6m/PRF17wFqLUm/qLOoiKtT
   NVatxhwFwYsqoVVrcibSvnV5KC1L27wNof6DicOMb2uGJBffFk8UgL/RF
   rmzp0w1GtJaYzYl+iWYZgrG2XfAPS4gTjKoPIUVf1sg5KE08wOBaiZOy+
   dPT/3ForGSCQCmNAkCi0ZCeZWPWyqD+gEjnBOD59Msy2bB0GnsE1RCaTA
   A==;
X-CSE-ConnectionGUID: QRKLz8t0SOCUTKjpBsU26A==
X-CSE-MsgGUID: SvPXFOieSGmA450tCbDB9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53285632"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53285632"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 11:24:54 -0700
X-CSE-ConnectionGUID: iO9ZuIKKQTuMUklYXXtCJw==
X-CSE-MsgGUID: UVncfLKOQca9TxdUJiuLBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="184109069"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jun 2025 11:24:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVaEM-000XII-13;
	Sat, 28 Jun 2025 18:24:50 +0000
Date: Sun, 29 Jun 2025 02:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 391a83d0c8ebb1e476cba73bf4c010af73993111
Message-ID: <202506290227.jscYXWfW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_112454_941309_A77C6381 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: 391a83d0c8ebb1e476cba73bf4c010af73993111  Add localversion-wireless-testing-ath

elapsed time: 1248m

configs tested: 131
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250628    gcc-8.5.0
arc                   randconfig-002-20250628    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                     davinci_all_defconfig    clang-19
arm                   randconfig-001-20250628    gcc-12.4.0
arm                   randconfig-002-20250628    clang-21
arm                   randconfig-003-20250628    clang-17
arm                   randconfig-004-20250628    clang-17
arm                        spear3xx_defconfig    clang-17
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250628    gcc-14.3.0
arm64                 randconfig-002-20250628    clang-21
arm64                 randconfig-003-20250628    clang-21
arm64                 randconfig-004-20250628    clang-17
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250628    gcc-14.3.0
csky                  randconfig-002-20250628    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250628    clang-21
hexagon               randconfig-002-20250628    clang-21
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250628    clang-20
i386        buildonly-randconfig-002-20250628    clang-20
i386        buildonly-randconfig-003-20250628    gcc-12
i386        buildonly-randconfig-004-20250628    clang-20
i386        buildonly-randconfig-005-20250628    clang-20
i386        buildonly-randconfig-006-20250628    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250628    gcc-12.4.0
loongarch             randconfig-002-20250628    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-21
mips                            gpr_defconfig    clang-18
mips                           ip32_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250628    gcc-8.5.0
nios2                 randconfig-002-20250628    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250628    gcc-8.5.0
parisc                randconfig-002-20250628    gcc-12.4.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250628    gcc-8.5.0
powerpc               randconfig-002-20250628    clang-19
powerpc               randconfig-003-20250628    clang-21
powerpc                     redwood_defconfig    clang-21
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250628    clang-20
powerpc64             randconfig-002-20250628    gcc-8.5.0
powerpc64             randconfig-003-20250628    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250628    clang-21
riscv                 randconfig-002-20250628    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250628    clang-21
s390                  randconfig-002-20250628    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250628    gcc-15.1.0
sh                    randconfig-002-20250628    gcc-9.3.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250628    gcc-8.5.0
sparc                 randconfig-002-20250628    gcc-12.4.0
sparc64               randconfig-001-20250628    gcc-8.5.0
sparc64               randconfig-002-20250628    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250628    gcc-12
um                    randconfig-002-20250628    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250628    gcc-12
x86_64      buildonly-randconfig-002-20250628    clang-20
x86_64      buildonly-randconfig-003-20250628    gcc-12
x86_64      buildonly-randconfig-004-20250628    clang-20
x86_64      buildonly-randconfig-005-20250628    clang-20
x86_64      buildonly-randconfig-006-20250628    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250628    gcc-11.5.0
xtensa                randconfig-002-20250628    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

