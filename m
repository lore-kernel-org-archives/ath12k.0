Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F1DCD6E52
	for <ath12k@archiver.kernel.org>; Sun, 31 May 2026 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8A6ylZDk/rJTim0N2jxFg+5pdYrZBb6K2o88YPk49P0=; b=Rm1ngs0NA3Lj5QbmOEO35iSwvL
	+fdKSfHdvsPcx3NPDIPFIDVsRksR7xoFGpuvLk7vfAffXoVTf2Ku2l8o12QUZGDZITPvVSV4hSjoR
	Q+d3Wm9ZBtrtxeCldYM6kisjquQeivp7Gyk5XcL2g85oJNQVRtZNPE8/dzN2Cjnpgt6zgYvAC140+
	YwwG8Av62h07veAoYRe+W0krYp+SblVji381/rjVpJtyN+1ghNXlRUfcqpc2cZ6KuHLBTPX586Z89
	LKyuK0d/6Prsza/ouRLmsJm/KC8EMN+aVmqT2pl5UfRSHumntZaoHzw6ie+6CkDEJwwX3JuZ9mr/p
	hXm6V8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTded-00000009VjV-3am6;
	Sun, 31 May 2026 10:44:27 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdea-00000009Vj5-0uob
	for ath12k@lists.infradead.org;
	Sun, 31 May 2026 10:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780224264; x=1811760264;
  h=date:from:to:cc:subject:message-id;
  bh=5pdggbNeB1SzrNX24/wLSxEJebBX+9N0T3yet/fp3aM=;
  b=avjLMKjXt9NhNl4pSgMMFe1FTiDWRTpKDQH5jRrAGKbN/Ym9tZsIf9Iv
   /RI1pwT4FVC3RWzu9RJB2uILfZxmpORS9gdnyaxBI4ip7B7ZObljCDf4D
   fKan/BLNW/ca82oa13Joir2UBJzkKLM2/Buu56/IaCA3Yh/7wN0u+EHLM
   K1zYkzNUZETXoMIdrMJ5avFwRzQKQnWjUNxMjTNj6ZVmmg3wuRZTO8zI5
   nhBenDwe+O2Jp6EUFfiGlZd7hq9tr02/cgcBfmuTF8le32dJcHvm9Pe2U
   Kc8mOIMk+y9qTuqbD/A1wepynw3I2r7EarQPhQoZFMtdsLuT3KP9GghoS
   w==;
X-CSE-ConnectionGUID: gOKhmdFaTzKWaqP3pPGB1g==
X-CSE-MsgGUID: GxvdjGzTR725UG13GditAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="81194231"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="81194231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 03:44:23 -0700
X-CSE-ConnectionGUID: ap8+R/DGSUeSupQvjtiDTw==
X-CSE-MsgGUID: VWxHYAYCQ6qkeDWmQ2A3ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="243150139"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 May 2026 03:44:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTdeV-000000009Kk-0Lxk;
	Sun, 31 May 2026 10:44:19 +0000
Date: Sun, 31 May 2026 18:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 fd63738468412e29a3f79cc1ed581e621604e970
Message-ID: <202605311830.MnrqNPaU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_034424_323867_4ED2E427 
X-CRM114-Status: UNSURE (   4.21  )
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
branch HEAD: fd63738468412e29a3f79cc1ed581e621604e970  Merge branch 'pending' into main-pending

elapsed time: 725m

configs tested: 151
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260531    clang-23
arm64                 randconfig-001-20260531    gcc-10.5.0
arm64                 randconfig-002-20260531    clang-23
arm64                 randconfig-002-20260531    gcc-12.5.0
arm64                 randconfig-003-20260531    clang-23
arm64                 randconfig-003-20260531    gcc-13.4.0
arm64                 randconfig-004-20260531    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260531    clang-23
csky                  randconfig-001-20260531    gcc-13.4.0
csky                  randconfig-002-20260531    clang-23
csky                  randconfig-002-20260531    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260531    clang-23
hexagon               randconfig-002-20260531    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260531    clang-20
i386        buildonly-randconfig-002-20260531    clang-20
i386        buildonly-randconfig-003-20260531    clang-20
i386        buildonly-randconfig-004-20260531    clang-20
i386        buildonly-randconfig-005-20260531    clang-20
i386        buildonly-randconfig-006-20260531    clang-20
i386                                defconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260531    clang-23
loongarch             randconfig-001-20260531    gcc-15.2.0
loongarch             randconfig-002-20260531    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260531    clang-23
nios2                 randconfig-001-20260531    gcc-11.5.0
nios2                 randconfig-002-20260531    clang-23
nios2                 randconfig-002-20260531    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260531    clang-23
parisc                randconfig-002-20260531    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260531    clang-23
powerpc               randconfig-002-20260531    clang-23
powerpc64             randconfig-001-20260531    clang-23
powerpc64             randconfig-002-20260531    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          r7785rp_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260531    gcc-8.5.0
sparc                 randconfig-002-20260531    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260531    gcc-8.5.0
sparc64               randconfig-002-20260531    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260531    gcc-8.5.0
um                    randconfig-002-20260531    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260531    clang-20
x86_64      buildonly-randconfig-002-20260531    clang-20
x86_64      buildonly-randconfig-003-20260531    clang-20
x86_64      buildonly-randconfig-004-20260531    clang-20
x86_64      buildonly-randconfig-005-20260531    clang-20
x86_64      buildonly-randconfig-006-20260531    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-002-20260531    gcc-14
x86_64                randconfig-003-20260531    gcc-14
x86_64                randconfig-004-20260531    gcc-14
x86_64                randconfig-006-20260531    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260531    gcc-8.5.0
xtensa                randconfig-002-20260531    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

