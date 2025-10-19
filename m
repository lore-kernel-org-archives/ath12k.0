Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D970CCD195
	for <ath12k@archiver.kernel.org>; Sun, 19 Oct 2025 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LVfSn3DHxoPjFPsvMfn6P0aewV6LgAFPCurSIcJ7Exg=; b=urwrAsK/WL23bd/3rHpjTSAusF
	pctZTTadEa2x214TV9vttb77gN3/tSidenPHfWjtcQws1UbxpdFVQilZwjceSTRw6WJ+KLOtQQzrl
	1rWPsvta3UMn3JM35l/5SKPP4RZffabfr5iWTEh9oK7xzlKagVHhdXIj549VkLw98pfikEKEglEit
	MAiUvQMexWuw+2BFN/2dbXsIPR9YVZ2AS7HejbjB+0uDkByPfYnTT6qxChiLCxYnwtFuiqu5LsFL6
	9QciW1Aks811/bPDNNj58xvZ0E32j1aZ3fJ/IafmJvcf8ivWJx8eWTNWI16WAr6Gt7xNMV1vyGeGt
	UnE31+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAPya-0000000AswJ-3K1r;
	Sun, 19 Oct 2025 09:45:20 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAPyV-0000000Asvv-3m89
	for ath12k@lists.infradead.org;
	Sun, 19 Oct 2025 09:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760867116; x=1792403116;
  h=date:from:to:cc:subject:message-id;
  bh=VFt2t1666K2k+xVnl8XXyXMr4Kqc9xilwVLLkZXmLnE=;
  b=DBZXwGpBIVBVHYGBItO5znZzM5yfGn1CnQRvQNNDNWWA1dJSTFvQG3fz
   PE6Q8YEXYg8lzaBjIdw2LF0ocircJRuvgKIsuQjN+1Mu29e/RPX/N+hI0
   bIK7TEPToRSwoNXq9vEzUjXq3OxcJpaDwAIG0qjV0xtHwDSGxq4ObEqKc
   cHfeBUKp2y3+22HP0pExitTc0GtbT3a5/pMCa+2NSHhK6+9lRlEfL9p1m
   8ci+l2U+R6P5m6yBC7jZMaLsHlNG63SlS3nEp5sJXtd8Nlna8ba+hSoxU
   n0a32bvSV5xrXypTWeQ58gKtzIHNV5ZtoGGDdbqfHF7+EP9Ap3u84a+K1
   g==;
X-CSE-ConnectionGUID: GKJH7jWzRAifbCGqhJxhog==
X-CSE-MsgGUID: 5wnhgCJKQaSpMxoCyMAOWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62718106"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="62718106"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 01:04:50 -0700
X-CSE-ConnectionGUID: pwRZCtW/Q6WnIwfiFWuQ6g==
X-CSE-MsgGUID: q/cWsXOBT++jvO2IYSn3WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="187510343"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2025 01:04:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAOOf-0008wD-18;
	Sun, 19 Oct 2025 08:04:23 +0000
Date: Sun, 19 Oct 2025 16:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 38e3a9408496540f3a1dbbfc2ea7e495e14e03d7
Message-ID: <202510191610.lGqvqXsN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_024516_035995_8B85E038 
X-CRM114-Status: UNSURE (   4.02  )
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
branch HEAD: 38e3a9408496540f3a1dbbfc2ea7e495e14e03d7  wifi: ath12k: Add MODULE_FIRMWARE() entries

elapsed time: 970m

configs tested: 191
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20251019    gcc-8.5.0
arc                   randconfig-002-20251019    gcc-13.4.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-22
arm                          exynos_defconfig    clang-22
arm                        multi_v7_defconfig    gcc-15.1.0
arm                       omap2plus_defconfig    gcc-15.1.0
arm                   randconfig-001-20251019    clang-22
arm                   randconfig-002-20251019    gcc-11.5.0
arm                   randconfig-003-20251019    clang-22
arm                   randconfig-004-20251019    clang-22
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251019    gcc-13.4.0
arm64                 randconfig-002-20251019    clang-18
arm64                 randconfig-003-20251019    gcc-13.4.0
arm64                 randconfig-004-20251019    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251018    gcc-9.5.0
csky                  randconfig-001-20251019    gcc-13.4.0
csky                  randconfig-002-20251018    gcc-9.5.0
csky                  randconfig-002-20251019    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251018    clang-22
hexagon               randconfig-001-20251019    clang-20
hexagon               randconfig-002-20251018    clang-22
hexagon               randconfig-002-20251019    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251019    clang-20
i386        buildonly-randconfig-002-20251019    gcc-14
i386        buildonly-randconfig-003-20251019    gcc-14
i386        buildonly-randconfig-004-20251019    clang-20
i386        buildonly-randconfig-005-20251019    gcc-13
i386        buildonly-randconfig-006-20251019    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251019    clang-20
i386                  randconfig-002-20251019    clang-20
i386                  randconfig-003-20251019    clang-20
i386                  randconfig-004-20251019    clang-20
i386                  randconfig-005-20251019    clang-20
i386                  randconfig-006-20251019    clang-20
i386                  randconfig-007-20251019    clang-20
i386                  randconfig-011-20251019    gcc-14
i386                  randconfig-012-20251019    gcc-14
i386                  randconfig-013-20251019    gcc-14
i386                  randconfig-014-20251019    gcc-14
i386                  randconfig-015-20251019    gcc-14
i386                  randconfig-016-20251019    gcc-14
i386                  randconfig-017-20251019    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251018    clang-22
loongarch             randconfig-001-20251019    clang-18
loongarch             randconfig-002-20251018    gcc-13.4.0
loongarch             randconfig-002-20251019    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251018    gcc-11.5.0
nios2                 randconfig-001-20251019    gcc-8.5.0
nios2                 randconfig-002-20251018    gcc-8.5.0
nios2                 randconfig-002-20251019    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251018    gcc-10.5.0
parisc                randconfig-001-20251019    gcc-15.1.0
parisc                randconfig-002-20251018    gcc-14.3.0
parisc                randconfig-002-20251019    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251018    clang-22
powerpc               randconfig-001-20251019    clang-17
powerpc               randconfig-002-20251018    clang-22
powerpc               randconfig-002-20251019    gcc-10.5.0
powerpc               randconfig-003-20251018    gcc-14.3.0
powerpc               randconfig-003-20251019    gcc-11.5.0
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251018    gcc-10.5.0
powerpc64             randconfig-002-20251018    gcc-12.5.0
powerpc64             randconfig-002-20251019    clang-16
powerpc64             randconfig-003-20251018    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251019    clang-19
riscv                 randconfig-002-20251019    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251019    gcc-8.5.0
s390                  randconfig-002-20251019    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20251019    gcc-15.1.0
sh                    randconfig-002-20251019    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251019    gcc-11.5.0
sparc                 randconfig-002-20251019    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251019    gcc-8.5.0
sparc64               randconfig-002-20251019    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251019    gcc-13
um                    randconfig-002-20251019    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251019    clang-20
x86_64      buildonly-randconfig-002-20251019    gcc-13
x86_64      buildonly-randconfig-003-20251019    clang-20
x86_64      buildonly-randconfig-004-20251019    gcc-14
x86_64      buildonly-randconfig-005-20251019    clang-20
x86_64      buildonly-randconfig-006-20251019    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251019    clang-20
x86_64                randconfig-002-20251019    clang-20
x86_64                randconfig-003-20251019    clang-20
x86_64                randconfig-004-20251019    clang-20
x86_64                randconfig-005-20251019    clang-20
x86_64                randconfig-006-20251019    clang-20
x86_64                randconfig-007-20251019    clang-20
x86_64                randconfig-008-20251019    clang-20
x86_64                randconfig-071-20251019    clang-20
x86_64                randconfig-072-20251019    clang-20
x86_64                randconfig-073-20251019    clang-20
x86_64                randconfig-074-20251019    clang-20
x86_64                randconfig-075-20251019    clang-20
x86_64                randconfig-076-20251019    clang-20
x86_64                randconfig-077-20251019    clang-20
x86_64                randconfig-078-20251019    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251019    gcc-14.3.0
xtensa                randconfig-002-20251019    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

