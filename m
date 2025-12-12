Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EB4D49238
	for <ath12k@archiver.kernel.org>; Fri, 12 Dec 2025 15:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tOzK9vIBskz8qm8AeiRvCZIknxdvbHd0qSA20pbLcME=; b=2r8WBNCfbynXRkpEF/Nfi/5Uw+
	9a1LenFFjZF7UsEwS4pfaxUslzUlcTIhJcWPU4fCpA1qHkODUG0gxf5osIbGwgJJax46NSEdBCUdX
	yoemuDv8C/XsHsd0LG/C5rw1rhmRzxycNtO52bB32apFoSEGEkUPcKMYI0LohvRs/t405rUHoXM0P
	0ANkZRC2qZcyGZ+sYtGaitPUrWd+ap6hBpjtQLRHjhexekhOBOm4WPDeNIWD7a9fpJ2kWXlyTh+Lb
	Mpp+oWwAOY4HncimYewnrNvH6vMiqygQxyexIKlZfJq2laB63DBs+u4KpFD1zHTV9GvAhhOw74M/c
	F7MumcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5Ew-00000000ksS-3Dd9;
	Fri, 12 Dec 2025 15:39:30 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5Eu-00000000krW-3Kwz
	for ath12k@lists.infradead.org;
	Fri, 12 Dec 2025 15:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765553969; x=1797089969;
  h=date:from:to:cc:subject:message-id;
  bh=WViW7dodc0TKyzwU4g2cVy+vK1bTUKUQNA1Pqr75yJU=;
  b=Z42pNYiBAPrBji6upcXe4htNMzwHvnFmZxUq3qR5j7UnGwKWea3xMzOv
   O5Y1faZ++xb8IeZgwvtujkHZT+b/9rkOoiKWT0Wz/j+uR6z5qjcfimKVM
   Ww0R5mgWNfJlGEOPH6eGT+o4ohr33te/V8PACWN//FifaGI7kNWqoPTAv
   ebW+fbgLNantjumCLr/er3+KRdKGYp5FwbmCSitAhnLk/BuQlH6LOBchJ
   nULUpgwJrk+eSYGJro+Dzxk5nyRgVuxML7HZJPn6KdkuPMJweX+OHWXxD
   5/CST9wCN3340gKf3OgyumXSkpR9/7L/H0Cj7wkOuR8ogJBCYJJGthUF1
   g==;
X-CSE-ConnectionGUID: eugpgDs5Rl6JV9sQCiA4Fg==
X-CSE-MsgGUID: 12w9vunoTye/wwvKBqf2SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78260981"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78260981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 07:38:06 -0800
X-CSE-ConnectionGUID: +4wPk/OzTo27L9o80KD3Yw==
X-CSE-MsgGUID: fSk6568oRS24+ZZBqXoQ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196865030"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Dec 2025 07:38:04 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU5DW-000000006F1-0cz1;
	Fri, 12 Dec 2025 15:38:02 +0000
Date: Fri, 12 Dec 2025 23:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 912a4585732f47e03fa499dd0243e0513b11e388
Message-ID: <202512122301.ebys3ZA3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073928_871197_10151698 
X-CRM114-Status: UNSURE (   3.33  )
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
branch HEAD: 912a4585732f47e03fa499dd0243e0513b11e388  Merge branch 'ath12k-ng' into pending

elapsed time: 1190m

configs tested: 216
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251212    clang-22
arc                   randconfig-001-20251212    gcc-8.5.0
arc                   randconfig-002-20251212    clang-22
arc                   randconfig-002-20251212    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                      footbridge_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    clang-19
arm                   randconfig-001-20251212    clang-22
arm                   randconfig-002-20251212    clang-22
arm                   randconfig-003-20251212    clang-22
arm                   randconfig-003-20251212    gcc-8.5.0
arm                   randconfig-004-20251212    clang-22
arm                   randconfig-004-20251212    gcc-15.1.0
arm                    vt8500_v6_v7_defconfig    clang-19
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251212    clang-22
arm64                 randconfig-002-20251212    clang-22
arm64                 randconfig-003-20251212    clang-22
arm64                 randconfig-004-20251212    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251212    clang-22
csky                  randconfig-002-20251212    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251212    gcc-11.5.0
hexagon               randconfig-002-20251212    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251212    gcc-14
i386        buildonly-randconfig-002-20251212    gcc-14
i386        buildonly-randconfig-003-20251212    gcc-14
i386        buildonly-randconfig-004-20251212    gcc-14
i386        buildonly-randconfig-005-20251212    gcc-14
i386        buildonly-randconfig-006-20251212    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251212    gcc-14
i386                  randconfig-002-20251212    gcc-14
i386                  randconfig-003-20251212    gcc-14
i386                  randconfig-004-20251212    gcc-14
i386                  randconfig-005-20251212    gcc-14
i386                  randconfig-006-20251212    gcc-14
i386                  randconfig-007-20251212    gcc-14
i386                  randconfig-011-20251212    gcc-14
i386                  randconfig-012-20251212    gcc-14
i386                  randconfig-013-20251212    gcc-14
i386                  randconfig-014-20251212    gcc-14
i386                  randconfig-015-20251212    gcc-14
i386                  randconfig-016-20251212    gcc-14
i386                  randconfig-017-20251212    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251212    gcc-11.5.0
loongarch             randconfig-002-20251212    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    clang-19
m68k                                defconfig    clang-19
m68k                           sun3_defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251212    gcc-11.5.0
nios2                 randconfig-002-20251212    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251212    clang-22
parisc                randconfig-002-20251212    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    clang-19
powerpc               randconfig-001-20251212    clang-22
powerpc               randconfig-002-20251212    clang-22
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20251212    clang-22
powerpc64             randconfig-002-20251212    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251212    clang-17
riscv                 randconfig-002-20251212    clang-17
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251212    clang-17
s390                  randconfig-002-20251212    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20251212    clang-17
sh                    randconfig-002-20251212    clang-17
sh                          rsk7269_defconfig    clang-19
sh                           se7619_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251212    gcc-8.5.0
sparc                 randconfig-002-20251212    gcc-8.5.0
sparc                       sparc32_defconfig    clang-19
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251212    gcc-8.5.0
sparc64               randconfig-002-20251212    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251212    gcc-8.5.0
um                    randconfig-002-20251212    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251212    clang-20
x86_64      buildonly-randconfig-002-20251212    clang-20
x86_64      buildonly-randconfig-003-20251212    clang-20
x86_64      buildonly-randconfig-004-20251212    clang-20
x86_64      buildonly-randconfig-005-20251212    clang-20
x86_64      buildonly-randconfig-006-20251212    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251212    clang-20
x86_64                randconfig-001-20251212    gcc-14
x86_64                randconfig-002-20251212    clang-20
x86_64                randconfig-003-20251212    clang-20
x86_64                randconfig-004-20251212    clang-20
x86_64                randconfig-005-20251212    clang-20
x86_64                randconfig-006-20251212    clang-20
x86_64                randconfig-011-20251212    clang-20
x86_64                randconfig-012-20251212    clang-20
x86_64                randconfig-013-20251212    clang-20
x86_64                randconfig-014-20251212    clang-20
x86_64                randconfig-015-20251212    clang-20
x86_64                randconfig-016-20251212    clang-20
x86_64                randconfig-071-20251212    clang-20
x86_64                randconfig-072-20251212    clang-20
x86_64                randconfig-073-20251212    clang-20
x86_64                randconfig-074-20251212    clang-20
x86_64                randconfig-075-20251212    clang-20
x86_64                randconfig-076-20251212    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251212    gcc-8.5.0
xtensa                randconfig-002-20251212    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

