Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F13C87FD2
	for <ath12k@archiver.kernel.org>; Sat,  2 Aug 2025 18:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lMS9J3PPhJC/BrP5q+xd1wGF0fjwoDmXJVutY4TMgj0=; b=2iTtGxlh4ViAjEcsTSDYYhch52
	FJFlgLLw142x940lrbmSTFqXcrMl2c9HoJzHnl5gYnFbacyE4GET1rTQMCCwUmtk5VYvjFaG34bI0
	2KN57DpbrEqU7Fh3/k3QiggGZSCiS4I+FN55d7PC74Es6Y9soUwa6SVvgrkKZB3pHApLrpmwPaAl5
	HRSadEqU7sGyGHThjMqdaI38RZ0AOFYSeDDok4JqvSftZTl0GaOu24MZsvootQ1SpGm+Y7j7SVjEc
	cpBBqY/QUJ/583D+MoUbsCN4Q1ZKyeHKZ12zxWBzYPVdrlKIUXQ4LJDvEFbW8IpzrY3bAHwjIAidf
	FsHwfHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiH5z-00000007o4p-3mTT;
	Sat, 02 Aug 2025 18:36:39 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiH5w-00000007o4R-28Ez
	for ath12k@lists.infradead.org;
	Sat, 02 Aug 2025 18:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754159796; x=1785695796;
  h=date:from:to:cc:subject:message-id;
  bh=KzIBywAG9I7bXG5F/cM7dXXFcOCQKjmLG4r227xG+k4=;
  b=e4LUtImjVKFOMXS0JqGDLEei6YQJfvSHt/iVaAz4YaQpgPJGQL+I5XVJ
   +3J2nBMwrr9cAtROkGCH8QjELxsfPm4wb6Wp69hB6yy2KW1aOxBo92bmM
   V+LJ0D5IZcZ0HDW8Qwy5gxiY/BiUROzK2/+vAlTn968M/o7R1fQ1+swvs
   5lRSZiJ98oXLAz8yJF/np1eGLjAXcUvUUJlrjx5U+Ox7eZHRo03hZpVgg
   iItX0dCRVEX/PBYymYHAmVI9GAbhS7vWLFagJx9RTNKA9d5pMG5v933Iq
   CZKKguZqycCA4Wz7zTIhlIRd8fc/G6XjnJM+xRwLYCSUWCHdcXXQLDwWv
   g==;
X-CSE-ConnectionGUID: 99FEtScRRY+V34ZaiSLu7w==
X-CSE-MsgGUID: 5w0M4fEUQi+Uf3UENTiwVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56617689"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56617689"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 11:36:32 -0700
X-CSE-ConnectionGUID: coPXIPF2SNeshsTfQZSzJQ==
X-CSE-MsgGUID: 9Hv0BpD0SZmVVZ40V7te6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163101969"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Aug 2025 11:36:32 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiH5p-0005Xw-1Y;
	Sat, 02 Aug 2025 18:36:29 +0000
Date: Sun, 03 Aug 2025 02:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 582032d59415f19f1dc0c78d114ee5a074abc0fe
Message-ID: <202508030247.Yb6qaXuf-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_113636_622335_DA637F06 
X-CRM114-Status: UNSURE (   3.36  )
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
branch HEAD: 582032d59415f19f1dc0c78d114ee5a074abc0fe  wifi: ath12k: Fix peer lookup in ath12k_dp_mon_rx_deliver_msdu()

elapsed time: 1205m

configs tested: 125
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250802    gcc-11.5.0
arc                   randconfig-002-20250802    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-22
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250802    gcc-10.5.0
arm                   randconfig-002-20250802    clang-22
arm                   randconfig-003-20250802    clang-18
arm                   randconfig-004-20250802    gcc-8.5.0
arm                         s5pv210_defconfig    gcc-15.1.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250802    gcc-12.5.0
arm64                 randconfig-002-20250802    gcc-8.5.0
arm64                 randconfig-003-20250802    clang-22
arm64                 randconfig-004-20250802    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250802    gcc-15.1.0
csky                  randconfig-002-20250802    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250802    clang-22
hexagon               randconfig-002-20250802    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250802    gcc-12
i386        buildonly-randconfig-002-20250802    gcc-12
i386        buildonly-randconfig-003-20250802    clang-20
i386        buildonly-randconfig-004-20250802    gcc-12
i386        buildonly-randconfig-005-20250802    clang-20
i386        buildonly-randconfig-006-20250802    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250802    clang-18
loongarch             randconfig-002-20250802    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250802    gcc-9.5.0
nios2                 randconfig-002-20250802    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250802    gcc-8.5.0
parisc                randconfig-002-20250802    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250802    gcc-8.5.0
powerpc               randconfig-002-20250802    clang-20
powerpc               randconfig-003-20250802    gcc-10.5.0
powerpc                     taishan_defconfig    clang-17
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250802    clang-16
powerpc64             randconfig-002-20250802    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250802    gcc-10.5.0
riscv                 randconfig-002-20250802    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250802    clang-22
s390                  randconfig-002-20250802    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250802    gcc-15.1.0
sh                    randconfig-002-20250802    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250802    gcc-8.5.0
sparc                 randconfig-002-20250802    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250802    gcc-8.5.0
sparc64               randconfig-002-20250802    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250802    clang-22
um                    randconfig-002-20250802    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250802    gcc-12
x86_64      buildonly-randconfig-002-20250802    clang-20
x86_64      buildonly-randconfig-003-20250802    clang-20
x86_64      buildonly-randconfig-004-20250802    clang-20
x86_64      buildonly-randconfig-005-20250802    clang-20
x86_64      buildonly-randconfig-006-20250802    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250802    gcc-13.4.0
xtensa                randconfig-002-20250802    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

