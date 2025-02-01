Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A631AC0218A
	for <ath12k@archiver.kernel.org>; Sat,  1 Feb 2025 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=15FUAk91XYttQv9YqpKBIaUa1iOyqSdX71wWyJXDEho=; b=Ci52vzR0uXWTlVURHH4Bvtk5P1
	813PxIA8kTs9cn0Ujp+TfGClrTHISsiSUKrjvuB10cg8GqjKAv9XItBAObCdZE+mHrdRGCwEblrMa
	zM+e2o++LlZnyYS4wmIbdXEUmSWw3kLVRefDTSMMVnkj/96w5n+fE8XHZkdSxYLP4ChNjo4z6NZKQ
	VoRgcFfwbhJc/xLp6TmNwUehLrNB7soPRpaaJJ0xk6gsgr7KIeeYIL6bdfTqxH5SFHJma+sD1G1Ib
	fdTFpHArJUisGKu7fSzY7L65YXGonuro9ZfgMXlQjOmiAHnkHP8w4MIJW5epwik8VPhn88TN7ITxL
	/DoYG9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teEea-0000000Ckno-1ZSP
	for ath12k@archiver.kernel.org;
	Sat, 01 Feb 2025 14:39:24 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teEeX-0000000CknV-1xVV
	for ath12k@lists.infradead.org;
	Sat, 01 Feb 2025 14:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738420761; x=1769956761;
  h=date:from:to:cc:subject:message-id;
  bh=BFaxUE1NPEFOBAgqicqUczb4xN4iCT4yKbu0shQdoKQ=;
  b=Gen1x/GfrnT/Gu52bgrSdqkzn5HMXvrCecC+1DOnUamZymvu1RZgsA7I
   mySxcKAF+wkNrH6ubLWfIeTr8N4pAx2hCWnueaNG3iEB8BJFS6Gvacisn
   quA27XliGU7JxIHulpTtvPODkcpccqv9pUIX1Zt2KKhYYXMxITEAFvvf/
   SaaBuX/wknV9QP4rMReD3tebSjl9py4g8JZSq2T2XTtXFaFFDHyk8U822
   jtnOb1Xg53hTjpb+djS0ijNhk2qqPKSMIXghq+aHVBs1ADfhDYKs1cfZG
   fnaM/pwv5h6w+VRtwfOhbcqtlShVewLziEb2bUcyuxSYLQKmBtkimyrZs
   g==;
X-CSE-ConnectionGUID: o9Mx9+YORBy2F2mnZt4+og==
X-CSE-MsgGUID: okBfmCpAT9Kl1wwHCW50gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="38207668"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="38207668"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 06:39:20 -0800
X-CSE-ConnectionGUID: jkpl3xj6Tquijr1As82FVw==
X-CSE-MsgGUID: BorHSi4ARhGlEP5bjgenoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="109777378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Feb 2025 06:39:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teEeT-000oGR-2A;
	Sat, 01 Feb 2025 14:39:17 +0000
Date: Sat, 01 Feb 2025 22:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 9729a7acddcf227d7ea869dda368699cab6ba974
Message-ID: <202502012240.TJYVO4xJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_063921_522755_F9206C35 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: 9729a7acddcf227d7ea869dda368699cab6ba974  Merge branch 'pending' into main-pending

elapsed time: 1011m

configs tested: 142
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250201    gcc-13.2.0
arc                   randconfig-002-20250201    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                           h3600_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-21
arm                          moxart_defconfig    gcc-14.2.0
arm                   randconfig-001-20250201    gcc-14.2.0
arm                   randconfig-002-20250201    clang-18
arm                   randconfig-003-20250201    gcc-14.2.0
arm                   randconfig-004-20250201    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250201    gcc-14.2.0
arm64                 randconfig-002-20250201    clang-16
arm64                 randconfig-003-20250201    gcc-14.2.0
arm64                 randconfig-004-20250201    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250201    gcc-14.2.0
csky                  randconfig-002-20250201    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250201    clang-21
hexagon               randconfig-002-20250201    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250201    clang-19
i386        buildonly-randconfig-002-20250201    gcc-12
i386        buildonly-randconfig-003-20250201    gcc-12
i386        buildonly-randconfig-004-20250201    gcc-12
i386        buildonly-randconfig-005-20250201    gcc-12
i386        buildonly-randconfig-006-20250201    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250201    gcc-14.2.0
loongarch             randconfig-002-20250201    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-21
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250201    gcc-14.2.0
nios2                 randconfig-002-20250201    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250201    gcc-14.2.0
parisc                randconfig-002-20250201    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250201    clang-21
powerpc               randconfig-002-20250201    clang-18
powerpc               randconfig-003-20250201    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250201    gcc-14.2.0
powerpc64             randconfig-002-20250201    gcc-14.2.0
powerpc64             randconfig-003-20250201    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20250201    clang-21
riscv                 randconfig-002-20250201    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250201    gcc-14.2.0
s390                  randconfig-002-20250201    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250201    gcc-14.2.0
sh                    randconfig-002-20250201    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250201    gcc-14.2.0
sparc                 randconfig-002-20250201    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250201    gcc-14.2.0
sparc64               randconfig-002-20250201    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250201    clang-18
um                    randconfig-002-20250201    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250201    clang-19
x86_64      buildonly-randconfig-002-20250201    gcc-12
x86_64      buildonly-randconfig-003-20250201    gcc-12
x86_64      buildonly-randconfig-004-20250201    gcc-12
x86_64      buildonly-randconfig-005-20250201    clang-19
x86_64      buildonly-randconfig-006-20250201    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250201    gcc-14.2.0
xtensa                randconfig-002-20250201    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

