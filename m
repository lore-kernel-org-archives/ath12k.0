Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EE3C43458
	for <ath12k@archiver.kernel.org>; Mon,  6 Jul 2026 11:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2106IpwiJzVex0lG9nBp4/FstCkFilMJrGKbknRNN9Q=; b=kx7o1BcrwMBQaKLmuEBh0cRPdW
	k9UVnUhGHudEtdPvSkOhXoAx3tbc8qRFU/j6yxF9bqBYHNM3Y0nmkMQ4uK7BJDxxa2Yej5bpD6ON8
	w1f16qPYp6rUjxEyDIw+Sjr3oxNWWpYtkeNrfTYTmj4RxRBoF6MuZKjMFYioH5t8LpPxy3YvA5S2Y
	j/j7z+MeqKYAd9hsLRmlyUt4vlbq5Ukfn1b2o2wZ2ZmXtxRg021cPY9Q1BNFWyRroyHqDvfnaLGeI
	z/v76awu6fH0aqkoNqytUEeuuDtSCf4gJ0zUOLD3udCH/q58LxgN9qkrVavHJzXBSnsvXkDj2TGN7
	tIXSCZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgh61-0000000CIHl-2v2R;
	Mon, 06 Jul 2026 11:02:41 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgh5z-0000000CIH8-3eId
	for ath12k@lists.infradead.org;
	Mon, 06 Jul 2026 11:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783335759; x=1814871759;
  h=date:from:to:cc:subject:message-id;
  bh=m/b/PZtfdpRhf5C1SoYVkdcqBAr3xE6nngGv6g1WTT8=;
  b=kzgx2xIc5Pfo8CcHdIDWriNcRSN+fYyQgKhjnwG8n2z7lnVOuadRqdHM
   SnMsFdaNcU94E4RmF4SF8y2omrzmdint92ji9ZASOfiF8IJRpaEXUl4hB
   iV3Gh487XO1mcc2JexJoehSiu5CRB3CkK6gJdSk+gU4eboatgw6VGYqkj
   uK4gEZlJaigZpSolIw4++6blrJTEWemS45ZgDoU2+SstomA7BsAsrKnnJ
   ovSo6CEZ3b1PcFSn7VwVW6hRa+ZbamN0i3amRDPVr19+EHtsAZb78zOwf
   sjXY2w34nMFfFahZ1In8A8kYDCX2/IcuDt86GdHtvtsPo8HIqo9vWVSjZ
   A==;
X-CSE-ConnectionGUID: BEM0hSEEQEuC87crcIIAmQ==
X-CSE-MsgGUID: 8qKLPsqERJ6yMl4Wub/eaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94571292"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94571292"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 04:02:38 -0700
X-CSE-ConnectionGUID: YnVgHazmTtab9QqSkWzQCA==
X-CSE-MsgGUID: ndibZv/fSAGxWzWUSkth+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257270673"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Jul 2026 04:02:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgh5r-00000000EJ0-1FaF;
	Mon, 06 Jul 2026 11:02:32 +0000
Date: Mon, 06 Jul 2026 19:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD REGRESSION
 1d5283626b8f083b88ab62107a0b506fa49b816f
Message-ID: <202607061907.ZvSDVYHN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_040239_930882_DC12CE51 
X-CRM114-Status: UNSURE (   3.15  )
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
branch HEAD: 1d5283626b8f083b88ab62107a0b506fa49b816f  wifi: ath12k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET

Unverified Error/Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202607061342.7idrl3mm-lkp@intel.com

    ERROR: modpost: __ex_table+0x2670 references non-executable section '.debug_abbrev'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- riscv-randconfig-002-20260706
    `-- ERROR:__ex_table-references-non-executable-section-.debug_abbrev

elapsed time: 761m

configs tested: 294
configs skipped: 11

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260706    gcc-15.2.0
arc                   randconfig-002-20260706    gcc-15.2.0
arc                   randconfig-002-20260706    gcc-9.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                       aspeed_g4_defconfig    clang-20
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260706    clang-23
arm                   randconfig-001-20260706    gcc-15.2.0
arm                   randconfig-002-20260706    gcc-15.2.0
arm                   randconfig-003-20260706    gcc-13.4.0
arm                   randconfig-003-20260706    gcc-15.2.0
arm                   randconfig-004-20260706    clang-23
arm                   randconfig-004-20260706    gcc-15.2.0
arm                         s5pv210_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-11.5.0
arm64                 randconfig-001-20260706    clang-17
arm64                 randconfig-001-20260706    gcc-11.5.0
arm64                          randconfig-002    gcc-11.5.0
arm64                 randconfig-002-20260706    clang-17
arm64                 randconfig-002-20260706    gcc-11.5.0
arm64                          randconfig-003    gcc-11.5.0
arm64                 randconfig-003-20260706    gcc-11.5.0
arm64                 randconfig-003-20260706    gcc-15.2.0
arm64                          randconfig-004    gcc-11.5.0
arm64                 randconfig-004-20260706    clang-17
arm64                 randconfig-004-20260706    gcc-11.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-11.5.0
csky                  randconfig-001-20260706    gcc-11.5.0
csky                  randconfig-001-20260706    gcc-9.5.0
csky                           randconfig-002    gcc-11.5.0
csky                  randconfig-002-20260706    gcc-11.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260706    clang-17
hexagon               randconfig-001-20260706    gcc-16.1.0
hexagon               randconfig-002-20260706    clang-23
hexagon               randconfig-002-20260706    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-12
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260706    clang-22
i386        buildonly-randconfig-001-20260706    gcc-12
i386                 buildonly-randconfig-002    clang-22
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20260706    gcc-12
i386                 buildonly-randconfig-003    clang-22
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20260706    clang-22
i386        buildonly-randconfig-003-20260706    gcc-12
i386                 buildonly-randconfig-004    gcc-12
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260706    clang-22
i386        buildonly-randconfig-004-20260706    gcc-12
i386                 buildonly-randconfig-005    gcc-12
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260706    clang-22
i386        buildonly-randconfig-005-20260706    gcc-12
i386                 buildonly-randconfig-006    gcc-12
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260706    gcc-12
i386        buildonly-randconfig-006-20260706    gcc-14
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260706    clang-22
i386                  randconfig-001-20260706    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260706    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260706    gcc-14
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260706    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260706    clang-22
i386                  randconfig-005-20260706    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260706    gcc-14
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260706    clang-22
i386                  randconfig-007-20260706    gcc-14
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260706    clang-22
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260706    clang-22
i386                           randconfig-013    clang-22
i386                  randconfig-013-20260706    clang-22
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260706    clang-22
i386                           randconfig-015    clang-22
i386                  randconfig-015-20260706    clang-22
i386                           randconfig-016    clang-22
i386                  randconfig-016-20260706    clang-22
i386                           randconfig-017    clang-22
i386                  randconfig-017-20260706    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260706    gcc-16.1.0
loongarch             randconfig-002-20260706    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                malta_qemu_32r6_defconfig    gcc-16.1.0
mips                           xway_defconfig    clang-19
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260706    gcc-11.5.0
nios2                 randconfig-001-20260706    gcc-16.1.0
nios2                 randconfig-002-20260706    gcc-11.5.0
nios2                 randconfig-002-20260706    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260706    gcc-10.5.0
parisc                randconfig-001-20260706    gcc-14.3.0
parisc                randconfig-002-20260706    gcc-10.5.0
parisc                randconfig-002-20260706    gcc-16.1.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260706    gcc-10.5.0
powerpc               randconfig-001-20260706    gcc-9.5.0
powerpc               randconfig-002-20260706    gcc-10.5.0
powerpc               randconfig-002-20260706    gcc-15.2.0
powerpc64             randconfig-001-20260706    gcc-10.5.0
powerpc64             randconfig-001-20260706    gcc-11.5.0
powerpc64             randconfig-002-20260706    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260706    clang-17
riscv                 randconfig-001-20260706    clang-23
riscv                 randconfig-002-20260706    clang-23
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260706    clang-23
s390                  randconfig-002-20260706    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260706    clang-23
sh                    randconfig-001-20260706    gcc-16.1.0
sh                    randconfig-002-20260706    clang-23
sh                    randconfig-002-20260706    gcc-16.1.0
sh                           se7721_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260706    gcc-12.5.0
sparc                 randconfig-001-20260706    gcc-14.3.0
sparc                 randconfig-002-20260706    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260706    gcc-14.3.0
sparc64               randconfig-001-20260706    gcc-16.1.0
sparc64               randconfig-002-20260706    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260706    gcc-14
um                    randconfig-001-20260706    gcc-14.3.0
um                    randconfig-002-20260706    gcc-14
um                    randconfig-002-20260706    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260706    clang-22
x86_64      buildonly-randconfig-001-20260706    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260706    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260706    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260706    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260706    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260706    clang-22
x86_64      buildonly-randconfig-006-20260706    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260706    clang-22
x86_64                randconfig-001-20260706    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260706    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260706    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260706    clang-22
x86_64                randconfig-004-20260706    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260706    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260706    clang-22
x86_64                randconfig-006-20260706    gcc-13
x86_64                randconfig-011-20260706    clang-22
x86_64                randconfig-011-20260706    gcc-14
x86_64                randconfig-012-20260706    clang-22
x86_64                randconfig-012-20260706    gcc-14
x86_64                randconfig-013-20260706    gcc-14
x86_64                randconfig-014-20260706    gcc-12
x86_64                randconfig-014-20260706    gcc-14
x86_64                randconfig-015-20260706    gcc-14
x86_64                randconfig-016-20260706    gcc-12
x86_64                randconfig-016-20260706    gcc-14
x86_64                randconfig-071-20260706    gcc-14
x86_64                randconfig-072-20260706    clang-22
x86_64                randconfig-072-20260706    gcc-14
x86_64                randconfig-073-20260706    clang-22
x86_64                randconfig-073-20260706    gcc-14
x86_64                randconfig-074-20260706    clang-22
x86_64                randconfig-074-20260706    gcc-14
x86_64                randconfig-075-20260706    gcc-14
x86_64                randconfig-076-20260706    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260706    gcc-14.3.0
xtensa                randconfig-001-20260706    gcc-16.1.0
xtensa                randconfig-002-20260706    gcc-14.3.0
xtensa                randconfig-002-20260706    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

