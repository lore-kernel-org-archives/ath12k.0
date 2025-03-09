Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD38C282D1
	for <ath12k@archiver.kernel.org>; Sun,  9 Mar 2025 07:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i3Ij6pv2kfzs+U2GEbOXby8bJeLf+ZtbzQsnZ/LAdic=; b=Rx8QtU/eBKvbKlYJawjM2nQj1Y
	oi6OJOI2UjCpo+C7witxym28TwSOZXdy2kaNlrJJbKTBR2Bqdc6qe07OpZBb3yfVeOS++CSWJl+nL
	HffkBUQ/S4Sib4k4Xlop2yexT04VjPV4lF/gYqe6+dHvEKgvs8zEjbbz+ZAGxeoMjzZ003hew9DyT
	1OiAo6LDebX+0FgePs1uXvjU4PILpCE/8U7Dhesiyl/8PT5puEALnNtiaLQ1ZVXfXIGmPL4ZBaRHU
	tNqZJl8tF4MXF6zWLltD5OiSl5pqditVTiwQaERC2VyitbmbTdKT6BV9ya5gkspoICNOvBwYQhJaD
	6niBgHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAy0-0000000071R-2eNm
	for ath12k@archiver.kernel.org;
	Sun, 09 Mar 2025 07:20:56 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAxy-00000000717-1nMq
	for ath12k@lists.infradead.org;
	Sun, 09 Mar 2025 07:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741504854; x=1773040854;
  h=date:from:to:cc:subject:message-id;
  bh=glX62IZZOhcjAEyrEgoePb06YLagLm0ue4Oiw09zOhE=;
  b=LlOTKD8ljwRxl2Vzszhp74vZarluFMnFMLU7agZRKU9Q5WXFV3X6FtIQ
   DpMf/m7IJlskRgFxn2j+DO5nPyZTniR7/Q2NEaVJxs243oX/TjBplEz/P
   D1Z9BMxzSeQ6iJ3nkFo2OEPx7aBamunEvmZVGQKLpMeN3lALsjsXOXtLu
   PNgwkKzki+GoExXybhaXL5M+AUzHXEGsZuDGZwRh6Zcec3zQ9a16Qb/so
   jVVpmg+PewFLO4+D+lNF7zETaljpvNGAzxs/h0t6feZSEFu3ncFrGjLCd
   XHAH9oVsLPD72RoxYLTrEOuqVuacbO2+VEtGqcsZco14TURhEr20l2foF
   A==;
X-CSE-ConnectionGUID: WPxC/xzKT0C1IDHDbFHJkQ==
X-CSE-MsgGUID: VdGiBtiqRaKP+NLVvq2T8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="41764166"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="41764166"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 23:20:54 -0800
X-CSE-ConnectionGUID: ebzC63NcRNWjnjpyT5TNdw==
X-CSE-MsgGUID: NZNDcNVMRJCvh5hBZTud8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123892732"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Mar 2025 23:20:52 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trAxu-0002nI-1W;
	Sun, 09 Mar 2025 07:20:50 +0000
Date: Sun, 09 Mar 2025 15:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k_ng] BUILD SUCCESS
 42aa76e608ca845c98e79f9e23af0bdb07b2eb1d
Message-ID: <202503091556.Y6EAS5sq-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_232054_511937_D60A9044 
X-CRM114-Status: UNSURE (   3.64  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k_ng
branch HEAD: 42aa76e608ca845c98e79f9e23af0bdb07b2eb1d  Add localversion-wireless-testing-ath

elapsed time: 1443m

configs tested: 188
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250308    gcc-13.2.0
arc                   randconfig-001-20250309    gcc-13.2.0
arc                   randconfig-002-20250308    gcc-13.2.0
arc                   randconfig-002-20250309    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20250308    gcc-14.2.0
arm                   randconfig-001-20250309    clang-21
arm                   randconfig-002-20250308    gcc-14.2.0
arm                   randconfig-002-20250309    gcc-14.2.0
arm                   randconfig-003-20250308    gcc-14.2.0
arm                   randconfig-003-20250309    clang-21
arm                   randconfig-004-20250308    gcc-14.2.0
arm                   randconfig-004-20250309    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250308    gcc-14.2.0
arm64                 randconfig-001-20250309    clang-15
arm64                 randconfig-002-20250308    gcc-14.2.0
arm64                 randconfig-002-20250309    clang-17
arm64                 randconfig-003-20250308    clang-16
arm64                 randconfig-003-20250309    clang-15
arm64                 randconfig-004-20250308    gcc-14.2.0
arm64                 randconfig-004-20250309    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250308    gcc-14.2.0
csky                  randconfig-001-20250309    gcc-14.2.0
csky                  randconfig-002-20250308    gcc-14.2.0
csky                  randconfig-002-20250309    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250308    clang-19
hexagon               randconfig-001-20250309    clang-21
hexagon               randconfig-002-20250308    clang-21
hexagon               randconfig-002-20250309    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250308    gcc-12
i386        buildonly-randconfig-001-20250309    clang-19
i386        buildonly-randconfig-002-20250308    gcc-11
i386        buildonly-randconfig-002-20250309    clang-19
i386        buildonly-randconfig-003-20250308    clang-19
i386        buildonly-randconfig-003-20250309    gcc-11
i386        buildonly-randconfig-004-20250308    clang-19
i386        buildonly-randconfig-004-20250309    gcc-12
i386        buildonly-randconfig-005-20250308    clang-19
i386        buildonly-randconfig-005-20250309    clang-19
i386        buildonly-randconfig-006-20250308    gcc-12
i386        buildonly-randconfig-006-20250309    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250309    gcc-12
i386                  randconfig-002-20250309    gcc-12
i386                  randconfig-003-20250309    gcc-12
i386                  randconfig-004-20250309    gcc-12
i386                  randconfig-005-20250309    gcc-12
i386                  randconfig-006-20250309    gcc-12
i386                  randconfig-007-20250309    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250308    gcc-14.2.0
loongarch             randconfig-001-20250309    gcc-14.2.0
loongarch             randconfig-002-20250308    gcc-14.2.0
loongarch             randconfig-002-20250309    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-18
mips                         db1xxx_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250308    gcc-14.2.0
nios2                 randconfig-001-20250309    gcc-14.2.0
nios2                 randconfig-002-20250308    gcc-14.2.0
nios2                 randconfig-002-20250309    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250308    gcc-14.2.0
parisc                randconfig-001-20250309    gcc-14.2.0
parisc                randconfig-002-20250308    gcc-14.2.0
parisc                randconfig-002-20250309    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     mpc83xx_defconfig    clang-21
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250308    clang-18
powerpc               randconfig-001-20250309    gcc-14.2.0
powerpc               randconfig-002-20250308    gcc-14.2.0
powerpc               randconfig-002-20250309    clang-21
powerpc               randconfig-003-20250308    gcc-14.2.0
powerpc               randconfig-003-20250309    clang-21
powerpc64             randconfig-001-20250308    gcc-14.2.0
powerpc64             randconfig-001-20250309    clang-15
powerpc64             randconfig-002-20250308    gcc-14.2.0
powerpc64             randconfig-002-20250309    gcc-14.2.0
powerpc64             randconfig-003-20250308    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20250308    clang-21
riscv                 randconfig-001-20250309    clang-15
riscv                 randconfig-002-20250308    gcc-14.2.0
riscv                 randconfig-002-20250309    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250308    clang-19
s390                  randconfig-001-20250309    clang-16
s390                  randconfig-002-20250308    clang-17
s390                  randconfig-002-20250309    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250308    gcc-14.2.0
sh                    randconfig-001-20250309    gcc-14.2.0
sh                    randconfig-002-20250308    gcc-14.2.0
sh                    randconfig-002-20250309    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250308    gcc-14.2.0
sparc                 randconfig-001-20250309    gcc-14.2.0
sparc                 randconfig-002-20250308    gcc-14.2.0
sparc                 randconfig-002-20250309    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250308    gcc-14.2.0
sparc64               randconfig-001-20250309    gcc-14.2.0
sparc64               randconfig-002-20250308    gcc-14.2.0
sparc64               randconfig-002-20250309    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250308    gcc-12
um                    randconfig-001-20250309    clang-21
um                    randconfig-002-20250308    gcc-12
um                    randconfig-002-20250309    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250308    gcc-12
x86_64      buildonly-randconfig-001-20250309    gcc-12
x86_64      buildonly-randconfig-002-20250308    clang-19
x86_64      buildonly-randconfig-002-20250309    gcc-11
x86_64      buildonly-randconfig-003-20250308    gcc-12
x86_64      buildonly-randconfig-003-20250309    gcc-12
x86_64      buildonly-randconfig-004-20250308    clang-19
x86_64      buildonly-randconfig-004-20250309    gcc-12
x86_64      buildonly-randconfig-005-20250308    clang-19
x86_64      buildonly-randconfig-005-20250309    clang-19
x86_64      buildonly-randconfig-006-20250308    clang-19
x86_64      buildonly-randconfig-006-20250309    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250308    gcc-14.2.0
xtensa                randconfig-001-20250309    gcc-14.2.0
xtensa                randconfig-002-20250308    gcc-14.2.0
xtensa                randconfig-002-20250309    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

