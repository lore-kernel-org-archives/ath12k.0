Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFADC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 15:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tI+Q2HDU4uTK+h91XFeg1SsaxNxXOrGUlA8cjHRABo0=; b=NU7cfAi6cvvjgBfJqnuFC4eaHe
	8KWV06UUd8uGf0ZQtHuTzjAGTb2HbhQMYZ1Y8Bq1bwkA7QCkg5Lxu4F4ruiSDiQ8YGv7WR5dwJzQ8
	SJCSNGutzQnhAwJAC37c6NVYTUBGb8eekkr4RrQczk2BNcG3am+nErVDcIeAA9yBjOuzx2wVYAacT
	xXokf9Sj1RyptFe0ivvEWbgYcP4P0NezUz0x3tH7uBeDqi8zsRjiiz4boh5nZJjzikLTbxzag5DEx
	hNftGLOzMEnc5vExwrRHicmYVtZZORu8RxsGEs516kosSfVwK1jklZ6XR/ln250GeQWbyq6r0qO+/
	aC3jRhow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea4t-0000000HLAN-3wV0;
	Tue, 30 Jun 2026 15:08:47 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea4r-0000000HLA0-1LSZ
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 15:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782832126; x=1814368126;
  h=date:from:to:cc:subject:message-id;
  bh=b1LQ48n1Irc+yti3e3jmcgxw2KxSSMesaRdd4XfDq+s=;
  b=JSMeFGaDZX3ozixvdFnmBaB5uQLbXyPDIdadTOOlycfOC5VTbL9AOZiU
   n5iZK7aK7mwQ3cfqMTCkxJhNaE42KbrjgDTfekLn2pIpIrS1XR5a3tMh8
   RyLx02/re4i1cLeMruJ+BLmttaAmlTeY4f4e2BnSCDWTFytBbnXZ/vWCL
   68xQIdVTmZIdC690hrwMUzjuX6Of1uc/jN5RuQR9Mcmm9OwW/jPncOK3q
   cqPcks1p0vAg49lNimr+zI05O/KhH5L959gF6E35BT7Zq8ofbGGnK2YeZ
   A3WxAZEqTBL6sdnHQEvksKNLi9KXm4V2cPtjkTZfoA6GyUdJhdbVGUqMG
   g==;
X-CSE-ConnectionGUID: GkVH6ldFR1SD/tmbLWh1Hg==
X-CSE-MsgGUID: e9/CMvTCSzm0Sf0rrR/ulg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106340425"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="106340425"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:08:45 -0700
X-CSE-ConnectionGUID: nlbfrfqGRNKvQScL9g4LhQ==
X-CSE-MsgGUID: XMQ65jS6T2Oj9TRoake0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="290413617"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Jun 2026 08:08:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wea4i-000000008RK-0CbY;
	Tue, 30 Jun 2026 15:08:40 +0000
Date: Tue, 30 Jun 2026 23:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 f82b6b0daaa3d8321e88019f4bfa342fd0ae7862
Message-ID: <202606302337.BSYOSWHS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_080845_415349_A919801A 
X-CRM114-Status: UNSURE (   3.93  )
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
branch HEAD: f82b6b0daaa3d8321e88019f4bfa342fd0ae7862  wifi: ath12k: Skip peer link info update in rx_status for monitor MSDUs

elapsed time: 804m

configs tested: 272
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260630    clang-23
arc                   randconfig-002-20260630    clang-23
arc                    vdk_hs38_smp_defconfig    gcc-16.1.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260630    clang-23
arm                   randconfig-002-20260630    clang-23
arm                   randconfig-003-20260630    clang-23
arm                   randconfig-004-20260630    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260630    clang-23
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260630    clang-23
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260630    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260630    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260630    clang-23
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260630    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260630    clang-18
hexagon               randconfig-002-20260630    clang-18
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260630    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260630    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260630    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260630    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260630    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260630    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260630    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260630    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260630    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260630    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260630    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260630    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260630    clang-22
i386                           randconfig-011    gcc-12
i386                  randconfig-011-20260630    gcc-12
i386                           randconfig-012    gcc-12
i386                  randconfig-012-20260630    gcc-12
i386                           randconfig-013    gcc-12
i386                  randconfig-013-20260630    gcc-12
i386                           randconfig-014    gcc-12
i386                  randconfig-014-20260630    gcc-12
i386                           randconfig-015    gcc-12
i386                  randconfig-015-20260630    gcc-12
i386                           randconfig-016    gcc-12
i386                  randconfig-016-20260630    gcc-12
i386                           randconfig-017    gcc-12
i386                  randconfig-017-20260630    gcc-12
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260630    clang-18
loongarch             randconfig-002-20260630    clang-18
m68k                             alldefconfig    gcc-16.1.0
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
mips                      bmips_stb_defconfig    clang-17
mips                      malta_kvm_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260630    clang-18
nios2                 randconfig-002-20260630    clang-18
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
parisc                         randconfig-001    clang-22
parisc                randconfig-001-20260630    clang-22
parisc                         randconfig-002    clang-22
parisc                randconfig-002-20260630    clang-22
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                        randconfig-001    clang-22
powerpc               randconfig-001-20260630    clang-22
powerpc                        randconfig-002    clang-22
powerpc               randconfig-002-20260630    clang-22
powerpc64                      randconfig-001    clang-22
powerpc64             randconfig-001-20260630    clang-22
powerpc64                      randconfig-002    clang-22
powerpc64             randconfig-002-20260630    clang-22
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-9.5.0
riscv                 randconfig-001-20260630    gcc-9.5.0
riscv                          randconfig-002    gcc-9.5.0
riscv                 randconfig-002-20260630    gcc-9.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-9.5.0
s390                  randconfig-001-20260630    gcc-9.5.0
s390                           randconfig-002    gcc-9.5.0
s390                  randconfig-002-20260630    gcc-9.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-9.5.0
sh                    randconfig-001-20260630    gcc-9.5.0
sh                             randconfig-002    gcc-9.5.0
sh                    randconfig-002-20260630    gcc-9.5.0
sh                          rsk7201_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    clang-17
sparc                 randconfig-001-20260630    clang-17
sparc                          randconfig-002    clang-17
sparc                 randconfig-002-20260630    clang-17
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    clang-17
sparc64               randconfig-001-20260630    clang-17
sparc64                        randconfig-002    clang-17
sparc64               randconfig-002-20260630    clang-17
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    clang-17
um                    randconfig-001-20260630    clang-17
um                             randconfig-002    clang-17
um                    randconfig-002-20260630    clang-17
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260630    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260630    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260630    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260630    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260630    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260630    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260630    gcc-14
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260630    gcc-14
x86_64                         randconfig-003    gcc-14
x86_64                randconfig-003-20260630    gcc-14
x86_64                         randconfig-004    gcc-14
x86_64                randconfig-004-20260630    gcc-14
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260630    gcc-14
x86_64                         randconfig-006    gcc-14
x86_64                randconfig-006-20260630    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260630    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260630    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260630    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260630    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260630    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260630    gcc-14
x86_64                         randconfig-071    gcc-13
x86_64                randconfig-071-20260630    clang-22
x86_64                randconfig-071-20260630    gcc-13
x86_64                         randconfig-072    gcc-13
x86_64                randconfig-072-20260630    clang-22
x86_64                randconfig-072-20260630    gcc-13
x86_64                         randconfig-073    gcc-13
x86_64                randconfig-073-20260630    clang-22
x86_64                randconfig-073-20260630    gcc-13
x86_64                         randconfig-074    gcc-13
x86_64                randconfig-074-20260630    clang-22
x86_64                randconfig-074-20260630    gcc-13
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260630    clang-22
x86_64                randconfig-075-20260630    gcc-13
x86_64                         randconfig-076    gcc-13
x86_64                randconfig-076-20260630    clang-22
x86_64                randconfig-076-20260630    gcc-13
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
xtensa                         randconfig-001    clang-17
xtensa                randconfig-001-20260630    clang-17
xtensa                         randconfig-002    clang-17
xtensa                randconfig-002-20260630    clang-17
xtensa                    smp_lx200_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

