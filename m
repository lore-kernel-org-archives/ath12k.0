Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE7CCD3427
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NT3q0LI9y6tND3x9g/EyIv1MCCmSfShOQRAC7Pcj660=; b=D4lCrFO75z8931vh9LeA+XVRC8
	kNE44wZ0oVscjjsPbivindk3TqZqPj01sgD77mUDnbSyMcOhWJAALC6GO5vbh5F0ulm5PcH5sfvmA
	1qXg72eZfC91HMEzaGZRLa/GXw3aXxinK6WVrIq8m8j7ah/+KHUNq+zPzG5mhCcGNVA39dj6l0ccE
	2nP3PiFY7QkxMgZcPGLuC5VXOGmDJLtFikxFNWMYd6u4cUQJRAERfd0E0cJJ4ttPHhNKRlOrqtFpK
	Awt9cUcXBX2eeF3+Gcc/9DkjaE5FCht/dw4+Ct6wmVXBLjhzXSFESOfgTdsgTGtTT6RmjxZKtetLQ
	susXV12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH1G-0000000GYUD-1N6L;
	Tue, 05 May 2026 14:45:06 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH1D-0000000GYTl-0x4r
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 14:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777992303; x=1809528303;
  h=date:from:to:cc:subject:message-id;
  bh=O9Wby4O0WuuNFneHNws3cdmfZ/sPkp8QJI/NBW6axzM=;
  b=fNaKZ3Xvt8P4aIWDxF12Fsacc5qKZohyNEQUSkkSf6qC0QjOAR7ujFQZ
   MbQ+vooln54Fa5/PURM93KbyP3t3Oye/0qjnFM40dNnkiC41Cnd3goC/J
   3OdTPRbSYlpYO0Qm1d4FOs9+iTMXW+0OC7ZckWaj3hl0RfllJ1H0ZyDkH
   jm8qslgMMvDjHNXv7AJFqrWY0w6jmNL+px1IQfBZoMRQU96uRbomE3i78
   wc0EYRn+qZbLCSEUYsh2eJ4jR4X44g1Sn546DMpBl+M3v/jcvBdf4VCda
   y8uqrrqckQPRR1tHI/JMNtS6rFtcV+TUpsCrldd5sInIqnXWrkn4Aekh6
   w==;
X-CSE-ConnectionGUID: b5DgaxhSS7O2MQ4yGJRt4Q==
X-CSE-MsgGUID: yptp34X0RTqSprtSsPQF6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96293018"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="96293018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 07:45:03 -0700
X-CSE-ConnectionGUID: 8GtCzxFQQo2CbU43Q5IFsw==
X-CSE-MsgGUID: uBtMBrpWQrinrFYl+wdOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="231256811"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2026 07:45:01 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKH18-000000000Bt-3YW3;
	Tue, 05 May 2026 14:44:58 +0000
Date: Tue, 05 May 2026 22:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 19d695cb264dcd67e31188d02d6852cb8dca5a51
Message-ID: <202605052226.15SpfyPj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_074503_341452_911849FB 
X-CRM114-Status: UNSURE (   3.86  )
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
branch HEAD: 19d695cb264dcd67e31188d02d6852cb8dca5a51  Add localversion-wireless-testing-ath

elapsed time: 735m

configs tested: 230
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260505    gcc-8.5.0
arc                   randconfig-002-20260505    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            mmp2_defconfig    gcc-15.2.0
arm                   randconfig-001-20260505    gcc-8.5.0
arm                   randconfig-002-20260505    gcc-8.5.0
arm                   randconfig-003-20260505    gcc-8.5.0
arm                   randconfig-004-20260505    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260505    gcc-14.3.0
arm64                 randconfig-002-20260505    gcc-14.3.0
arm64                 randconfig-003-20260505    gcc-14.3.0
arm64                 randconfig-004-20260505    gcc-14.3.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260505    gcc-14.3.0
csky                  randconfig-002-20260505    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260505    clang-23
hexagon               randconfig-001-20260505    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260505    clang-23
hexagon               randconfig-002-20260505    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260505    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260505    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260505    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260505    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260505    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260505    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260505    clang-20
i386                  randconfig-002-20260505    clang-20
i386                  randconfig-003-20260505    clang-20
i386                  randconfig-004-20260505    clang-20
i386                  randconfig-005-20260505    clang-20
i386                  randconfig-006-20260505    clang-20
i386                  randconfig-007-20260505    clang-20
i386                  randconfig-011-20260505    clang-20
i386                  randconfig-012-20260505    clang-20
i386                  randconfig-013-20260505    clang-20
i386                  randconfig-014-20260505    clang-20
i386                  randconfig-015-20260505    clang-20
i386                  randconfig-016-20260505    clang-20
i386                  randconfig-017-20260505    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260505    clang-23
loongarch             randconfig-001-20260505    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260505    clang-23
loongarch             randconfig-002-20260505    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260505    clang-23
nios2                 randconfig-001-20260505    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260505    clang-23
nios2                 randconfig-002-20260505    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc         de0_nano_multicore_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-14.3.0
parisc                randconfig-001-20260505    gcc-14.3.0
parisc                         randconfig-002    gcc-14.3.0
parisc                randconfig-002-20260505    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        randconfig-001    gcc-14.3.0
powerpc               randconfig-001-20260505    gcc-14.3.0
powerpc                        randconfig-002    gcc-14.3.0
powerpc               randconfig-002-20260505    gcc-14.3.0
powerpc                     tqm8541_defconfig    clang-23
powerpc64                      randconfig-001    gcc-14.3.0
powerpc64             randconfig-001-20260505    gcc-14.3.0
powerpc64                      randconfig-002    gcc-14.3.0
powerpc64             randconfig-002-20260505    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260505    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-002-20260505    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260505    gcc-10.5.0
sh                    randconfig-002-20260505    gcc-10.5.0
sh                          urquell_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-15.2.0
sparc                 randconfig-001-20260505    gcc-15.2.0
sparc                          randconfig-002    gcc-15.2.0
sparc                 randconfig-002-20260505    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-15.2.0
sparc64               randconfig-001-20260505    gcc-15.2.0
sparc64                        randconfig-002    gcc-15.2.0
sparc64               randconfig-002-20260505    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-15.2.0
um                    randconfig-001-20260505    gcc-15.2.0
um                             randconfig-002    gcc-15.2.0
um                    randconfig-002-20260505    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260505    clang-20
x86_64      buildonly-randconfig-002-20260505    clang-20
x86_64      buildonly-randconfig-003-20260505    clang-20
x86_64      buildonly-randconfig-004-20260505    clang-20
x86_64      buildonly-randconfig-005-20260505    clang-20
x86_64      buildonly-randconfig-006-20260505    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260505    clang-20
x86_64                randconfig-002-20260505    clang-20
x86_64                randconfig-003-20260505    clang-20
x86_64                randconfig-004-20260505    clang-20
x86_64                randconfig-005-20260505    clang-20
x86_64                randconfig-006-20260505    clang-20
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260505    clang-20
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260505    clang-20
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260505    clang-20
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260505    clang-20
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260505    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260505    clang-20
x86_64                randconfig-071-20260505    clang-20
x86_64                randconfig-071-20260505    gcc-14
x86_64                randconfig-072-20260505    clang-20
x86_64                randconfig-073-20260505    clang-20
x86_64                randconfig-073-20260505    gcc-14
x86_64                randconfig-074-20260505    clang-20
x86_64                randconfig-074-20260505    gcc-14
x86_64                randconfig-075-20260505    clang-20
x86_64                randconfig-076-20260505    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-15.2.0
xtensa                randconfig-001-20260505    gcc-15.2.0
xtensa                         randconfig-002    gcc-15.2.0
xtensa                randconfig-002-20260505    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

