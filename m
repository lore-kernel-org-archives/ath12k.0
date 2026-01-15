Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB46BD4116C
	for <ath12k@archiver.kernel.org>; Thu, 15 Jan 2026 11:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fukmzakvDujjdAukbWUrYkyD3ensh8ERsAvv2ohPkWo=; b=BV8070yroTU1M5xMXH2B4b7E0P
	TyGLUf8+wEEmnrtfgPxqEkTzIcJ/rIEAeu2zlk0g6UhNRM1BxzZiOyKnx+BG0ZhO5kZsa4r+RMUMk
	VbQhkc86pSknzbPi1+trgLFNOWbs+M9DqOXtaiMJeBRqH12OMBJsHs4Ec0jwg1HQ3KD0l+ZR/aA8q
	848K4sDxWmsd9HCSJcyZbdIE++0HoU404yieqrIQVMzvJwvr7kYgv4+zChMPSXPtaUAQRGLVDN0kW
	vNoudmP/U0TmbS+AT3V13rg4ad40RNYukLYYHXQG7+6Y9SgjBqMK9N0FlVXVah4WYeQjrXriYzMEG
	hb1eE3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLd4-0000000CERE-1AMs;
	Thu, 15 Jan 2026 11:35:06 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLd1-0000000CEQp-03ZJ
	for ath12k@lists.infradead.org;
	Thu, 15 Jan 2026 11:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768476903; x=1800012903;
  h=date:from:to:cc:subject:message-id;
  bh=RapfyicazHim27RVtcZ7j+kIyBi8gszwiRHeTzFC2UY=;
  b=ExA6Wsbyoy6c74l9K58pgeBN1TBl6W+UyskOrevXdXdOj7Ktfzr+unlo
   3SkNXMHhO2Xo1K6V/g3ChRTO7mUbViv5r/rMutbNmPj/KaqrLW6zQm85Z
   y+qC+bANuKPfIjOAofQg/ubUQYxfqo6LYB0AgxqwewHP3RMLDXQd4CTlI
   kWgibS/fP+Ik8ZDVQmlmXQOphmJN19spuGhvtq25WVhRx0x9F8f1BswkN
   5YSIY/ZhIjlzhjPXH7d06zPHpEZVeQ5aZzwZFHL4X5vToqM+v0srELc4k
   qS1Fso9gCgWl4oRYY/vi9A51ePv96MYNjgbB+u6BA1cUk30rr8IWlbRVS
   g==;
X-CSE-ConnectionGUID: k1SEpvo6QhqR6KLnCFpscg==
X-CSE-MsgGUID: 2tT59OjaRrKAFPzAskuJbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72365795"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="72365795"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 03:35:03 -0800
X-CSE-ConnectionGUID: Q7n7WAs7SDG2idsSNEHpqQ==
X-CSE-MsgGUID: RD+nl+FWR32HevZEBqkjBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="235644152"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 03:35:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgLcw-00000000Htg-2FzZ;
	Thu, 15 Jan 2026 11:34:58 +0000
Date: Thu, 15 Jan 2026 19:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 194148fa3c5a7d03cc1e91db86960b413494e6ad
Message-ID: <202601151908.O1Q1zfHr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_033503_075387_00DBFEAD 
X-CRM114-Status: UNSURE (   3.96  )
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
branch HEAD: 194148fa3c5a7d03cc1e91db86960b413494e6ad  Merge branch 'pending' into main-pending

elapsed time: 744m

configs tested: 232
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    clang-22
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260115    clang-22
arc                   randconfig-002-20260115    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                            mmp2_defconfig    clang-22
arm                          pxa168_defconfig    clang-22
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20260115    clang-22
arm                   randconfig-002-20260115    clang-22
arm                   randconfig-003-20260115    clang-22
arm                   randconfig-004-20260115    clang-22
arm                             rpc_defconfig    clang-22
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260115    clang-22
arm64                 randconfig-002-20260115    clang-22
arm64                 randconfig-003-20260115    clang-22
arm64                 randconfig-004-20260115    clang-22
arm64                 randconfig-004-20260115    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260115    clang-22
csky                  randconfig-001-20260115    gcc-15.2.0
csky                  randconfig-002-20260115    clang-22
csky                  randconfig-002-20260115    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260115    clang-22
hexagon               randconfig-002-20260115    clang-16
hexagon               randconfig-002-20260115    clang-22
i386                             alldefconfig    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260115    gcc-14
i386        buildonly-randconfig-002-20260115    gcc-14
i386        buildonly-randconfig-003-20260115    gcc-14
i386        buildonly-randconfig-004-20260115    clang-20
i386        buildonly-randconfig-004-20260115    gcc-14
i386        buildonly-randconfig-005-20260115    clang-20
i386        buildonly-randconfig-005-20260115    gcc-14
i386        buildonly-randconfig-006-20260115    clang-20
i386        buildonly-randconfig-006-20260115    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260115    clang-20
i386                  randconfig-002-20260115    clang-20
i386                  randconfig-003-20260115    clang-20
i386                  randconfig-004-20260115    clang-20
i386                  randconfig-005-20260115    clang-20
i386                  randconfig-006-20260115    clang-20
i386                  randconfig-007-20260115    clang-20
i386                  randconfig-011-20260115    clang-20
i386                  randconfig-011-20260115    gcc-14
i386                  randconfig-012-20260115    gcc-14
i386                  randconfig-013-20260115    gcc-14
i386                  randconfig-014-20260115    gcc-14
i386                  randconfig-015-20260115    clang-20
i386                  randconfig-015-20260115    gcc-14
i386                  randconfig-016-20260115    clang-20
i386                  randconfig-016-20260115    gcc-14
i386                  randconfig-017-20260115    clang-20
i386                  randconfig-017-20260115    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260115    clang-22
loongarch             randconfig-002-20260115    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    clang-22
m68k                        mvme16x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                           gcw0_defconfig    clang-22
mips                        qi_lb60_defconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    clang-22
mips                           xway_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260115    clang-22
nios2                 randconfig-001-20260115    gcc-10.5.0
nios2                 randconfig-002-20260115    clang-22
nios2                 randconfig-002-20260115    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260115    clang-22
parisc                randconfig-001-20260115    gcc-8.5.0
parisc                randconfig-002-20260115    clang-22
parisc                randconfig-002-20260115    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                     asp8347_defconfig    gcc-15.2.0
powerpc                   currituck_defconfig    clang-22
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                      mgcoge_defconfig    gcc-15.2.0
powerpc                 mpc8313_rdb_defconfig    clang-22
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260115    clang-22
powerpc               randconfig-001-20260115    gcc-8.5.0
powerpc               randconfig-002-20260115    clang-22
powerpc                 xes_mpc85xx_defconfig    clang-22
powerpc64             randconfig-001-20260115    clang-22
powerpc64             randconfig-002-20260115    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260115    clang-18
riscv                 randconfig-001-20260115    gcc-10.5.0
riscv                 randconfig-002-20260115    gcc-10.5.0
riscv                 randconfig-002-20260115    gcc-12.5.0
s390                             alldefconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260115    gcc-10.5.0
s390                  randconfig-002-20260115    clang-22
s390                  randconfig-002-20260115    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                         ap325rxa_defconfig    clang-22
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-15.2.0
sh                               j2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260115    gcc-10.5.0
sh                    randconfig-002-20260115    gcc-10.5.0
sh                    randconfig-002-20260115    gcc-14.3.0
sh                          rsk7269_defconfig    gcc-15.2.0
sh                           se7206_defconfig    gcc-15.2.0
sh                           se7751_defconfig    clang-22
sh                              ul2_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260115    clang-22
sparc                 randconfig-001-20260115    gcc-15.2.0
sparc                 randconfig-002-20260115    clang-22
sparc                 randconfig-002-20260115    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260115    clang-22
sparc64               randconfig-002-20260115    clang-22
sparc64               randconfig-002-20260115    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260115    clang-22
um                    randconfig-002-20260115    clang-22
um                    randconfig-002-20260115    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260115    clang-20
x86_64      buildonly-randconfig-002-20260115    clang-20
x86_64      buildonly-randconfig-003-20260115    clang-20
x86_64      buildonly-randconfig-004-20260115    clang-20
x86_64      buildonly-randconfig-005-20260115    clang-20
x86_64      buildonly-randconfig-006-20260115    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260115    clang-20
x86_64                randconfig-002-20260115    clang-20
x86_64                randconfig-002-20260115    gcc-14
x86_64                randconfig-003-20260115    clang-20
x86_64                randconfig-004-20260115    clang-20
x86_64                randconfig-005-20260115    clang-20
x86_64                randconfig-005-20260115    gcc-14
x86_64                randconfig-006-20260115    clang-20
x86_64                randconfig-006-20260115    gcc-12
x86_64                randconfig-011-20260115    clang-20
x86_64                randconfig-012-20260115    clang-20
x86_64                randconfig-012-20260115    gcc-14
x86_64                randconfig-013-20260115    clang-20
x86_64                randconfig-013-20260115    gcc-14
x86_64                randconfig-014-20260115    clang-20
x86_64                randconfig-015-20260115    clang-20
x86_64                randconfig-016-20260115    clang-20
x86_64                randconfig-071-20260115    gcc-14
x86_64                randconfig-072-20260115    gcc-14
x86_64                randconfig-073-20260115    gcc-14
x86_64                randconfig-074-20260115    gcc-14
x86_64                randconfig-075-20260115    gcc-14
x86_64                randconfig-076-20260115    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  cadence_csp_defconfig    clang-22
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260115    clang-22
xtensa                randconfig-001-20260115    gcc-8.5.0
xtensa                randconfig-002-20260115    clang-22
xtensa                randconfig-002-20260115    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

