Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4003D262B2
	for <ath12k@archiver.kernel.org>; Wed, 21 Jan 2026 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b69aZSImZt/RuaWWHvjhQE92Ov19vJ0wG8h5WXnYr+M=; b=bZdUCvXk1CeCtpRhCvPr15dchq
	xs0ShZymiYwjKxcPndHs/Mf4ag48YuAgCrIIrPpVGlZ8RpV0FmOaC2vI7CsADUYeU9QYkdMYl/h6P
	87a0ge9s0RODggtLT7z5IyilmxHl93U0ct5zElJFPVPTRZ546UYzcX1OdMH78PSSgw4ptlrFDL9BG
	df+BQhyYIFpa8JWU/7FMMZRtOAePUSF5cgw+Gl8b4NJWANrV5QVo4Hynb8KDmXR4BXYnU61TEF5II
	Bansfht/I+j+faxBLPzKbDhPYGvUA3IyAMIKbStZClQBK2R1OTqTx+uxIhMucXBXp2HJ3cvYDG29J
	c8/QEnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSBs-00000004ylx-2NOs;
	Wed, 21 Jan 2026 06:59:44 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSBp-00000004ylT-1VOf
	for ath12k@lists.infradead.org;
	Wed, 21 Jan 2026 06:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768978781; x=1800514781;
  h=date:from:to:cc:subject:message-id;
  bh=bCKkuxAkvOc681RcuhZZ8MN0OOpcKl0awy8a0gkAdns=;
  b=T5op0BpiASbQ5ymh0ACdFwER1wd5aq7rbX/5IFn+m8o2i/7RraCRsehH
   iWs1QqY7HQyZCIm4ffO0FtVvWFMeadoC+113RtKA1fin8eVmk3W5PdFkv
   5rwNucpXdo0VEQ52qMmDyacZSv59HcnG9NtKuKM/zAyDdoxC5icJcfbFI
   4qcxmuEUwINE5wdX/kDbj2G/ZeUzUfjNyBvGvznM75UJBiVF8HLKVWiAQ
   cmufy0xkcrSWOoU2d4Ot6JH2oLc6v7tMazGQvMBpbZHC1MKwrukbb4URf
   +JIoEat+UyjLs0SuIhv1M4V8VbGKJjrovveUEKdw/MNT2HobegOXYRXcM
   Q==;
X-CSE-ConnectionGUID: fcY9onRuSL6tuZjzhHZd4w==
X-CSE-MsgGUID: oWkdo1FYTbqUG58TckZy4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70254971"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70254971"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:59:41 -0800
X-CSE-ConnectionGUID: dfJTX6w2Rc2pABJX1Y5b1Q==
X-CSE-MsgGUID: G0HidyFlQTq4/7wwScI7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210819097"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2026 22:59:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viSBl-00000000Q6r-0O78;
	Wed, 21 Jan 2026 06:59:37 +0000
Date: Wed, 21 Jan 2026 14:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 e0d71eac0e872186bf9ba16c9b8b2cee29568401
Message-ID: <202601211439.utUDRz8K-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_225941_414886_64F6844B 
X-CRM114-Status: UNSURE (   4.47  )
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
branch HEAD: e0d71eac0e872186bf9ba16c9b8b2cee29568401  wifi: ath10k: snoc: support powering on the device via pwrseq

elapsed time: 899m

configs tested: 209
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260121    clang-18
arc                   randconfig-002-20260121    clang-18
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          gemini_defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    gcc-15.2.0
arm                        neponset_defconfig    gcc-15.2.0
arm                         orion5x_defconfig    gcc-15.2.0
arm                   randconfig-001-20260121    clang-18
arm                   randconfig-002-20260121    clang-18
arm                   randconfig-003-20260121    clang-18
arm                   randconfig-004-20260121    clang-18
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260121    gcc-15.2.0
arm64                 randconfig-002-20260121    gcc-15.2.0
arm64                 randconfig-003-20260121    gcc-15.2.0
arm64                 randconfig-004-20260121    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-15.2.0
csky                  randconfig-002-20260121    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260121    gcc-15.2.0
hexagon               randconfig-002-20260121    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260121    clang-20
i386        buildonly-randconfig-002-20260121    clang-20
i386        buildonly-randconfig-003-20260121    clang-20
i386        buildonly-randconfig-004-20260121    clang-20
i386        buildonly-randconfig-005-20260121    clang-20
i386        buildonly-randconfig-006-20260121    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260121    clang-20
i386                  randconfig-002-20260121    clang-20
i386                  randconfig-003-20260121    clang-20
i386                  randconfig-004-20260121    clang-20
i386                  randconfig-005-20260121    clang-20
i386                  randconfig-006-20260121    clang-20
i386                  randconfig-007-20260121    clang-20
i386                  randconfig-011-20260121    gcc-14
i386                  randconfig-012-20260121    gcc-14
i386                  randconfig-013-20260121    gcc-14
i386                  randconfig-014-20260121    gcc-14
i386                  randconfig-015-20260121    gcc-14
i386                  randconfig-016-20260121    gcc-14
i386                  randconfig-017-20260121    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson64_defconfig    gcc-15.2.0
loongarch             randconfig-001-20260121    gcc-15.2.0
loongarch             randconfig-002-20260121    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    gcc-15.2.0
m68k                           sun3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
mips                         rt305x_defconfig    gcc-15.2.0
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260121    gcc-15.2.0
nios2                 randconfig-002-20260121    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260121    gcc-9.5.0
parisc                randconfig-002-20260121    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 linkstation_defconfig    gcc-15.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260121    gcc-9.5.0
powerpc               randconfig-002-20260121    gcc-9.5.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260121    gcc-9.5.0
powerpc64             randconfig-002-20260121    gcc-9.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260121    clang-16
riscv                 randconfig-002-20260121    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260121    clang-16
s390                  randconfig-002-20260121    clang-16
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                         apsh4a3a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260121    clang-16
sh                    randconfig-002-20260121    clang-16
sh                          rsk7201_defconfig    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7705_defconfig    gcc-15.2.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260121    gcc-8.5.0
sparc                 randconfig-002-20260121    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260121    gcc-8.5.0
sparc64               randconfig-002-20260121    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260121    gcc-8.5.0
um                    randconfig-002-20260121    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260121    clang-20
x86_64      buildonly-randconfig-002-20260121    clang-20
x86_64      buildonly-randconfig-003-20260121    clang-20
x86_64      buildonly-randconfig-004-20260121    clang-20
x86_64      buildonly-randconfig-005-20260121    clang-20
x86_64      buildonly-randconfig-006-20260121    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260121    clang-20
x86_64                randconfig-002-20260121    clang-20
x86_64                randconfig-003-20260121    clang-20
x86_64                randconfig-004-20260121    clang-20
x86_64                randconfig-005-20260121    clang-20
x86_64                randconfig-006-20260121    clang-20
x86_64                randconfig-011-20260121    gcc-14
x86_64                randconfig-012-20260121    gcc-14
x86_64                randconfig-013-20260121    gcc-14
x86_64                randconfig-014-20260121    gcc-14
x86_64                randconfig-015-20260121    gcc-14
x86_64                randconfig-016-20260121    gcc-14
x86_64                randconfig-071-20260121    clang-20
x86_64                randconfig-072-20260121    clang-20
x86_64                randconfig-073-20260121    clang-20
x86_64                randconfig-074-20260121    clang-20
x86_64                randconfig-075-20260121    clang-20
x86_64                randconfig-076-20260121    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260121    gcc-8.5.0
xtensa                randconfig-002-20260121    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

