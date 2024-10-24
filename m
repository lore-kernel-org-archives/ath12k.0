Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CA1D0E3F8
	for <ath12k@archiver.kernel.org>; Thu, 24 Oct 2024 19:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E4gP/57sjn4B+KMA0O3AVnLLQrR9v5850o2Ha0dfcFk=; b=MD+jLPlbj7qPAz0S4jnnUi4Vbl
	03Mgqo1YwNcgMTANAcD2Hzp8xHfOIyyeabdfnBSfCuAKI2rTZXRCqazMN1pseJRlUZzSWmRSrJ21c
	cwD76QDS4jF1iKqDOlxqbq+rLzbMFEUrtC7jepAJ3hhvqO18aK1A/UyaegJGCijSSjUwczpVv+VJG
	J+D/R2P7AMiKf/YZ/EWClX2bRhpXM847O5RVUIkQJZ9MwsnpLcU1qD8TVKIaoFP3BM+6Hk0UiLCnS
	REAf8YD9Y3UnYX4zt9n6rk5Bg/xpejPp9JSspYeBZxHZIuRFs/MUyRdeiOsnC2rCdMy1LESUMjEa4
	RQKWZtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t43nV-00000001dg1-1p3e
	for ath12k@archiver.kernel.org;
	Thu, 24 Oct 2024 19:47:05 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t43RQ-00000001asU-4BkT
	for ath12k@lists.infradead.org;
	Thu, 24 Oct 2024 19:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729797857; x=1761333857;
  h=date:from:to:cc:subject:message-id;
  bh=L6RzPYhd0MgThX52vlVMOVsLTYrvumAViHtrHBOBW5Q=;
  b=RyJtmm94l7m7Om87+nVF7I0X5CwzN0wAjHnaXVww7Buoz4Ep98IKaQTM
   iV0nNVE4Vmkr9rrcP8qW3RRCfrekLvm7iBVxlZqBrHlXD7/X09UN+PL8W
   x8Bk6WgLTSBGYLHGRiG662+sGRbn4MHmnqx+cqO2mzugIenig/6NaBXzc
   sxTfzoXv13hqz7U6sPVDKYZGPBLE8C6TVz7hnWJuaUDGp6pJCrAjjpADl
   nnBBra9uR/NXhtnHLGBjx05F9Ueu8zqIolAydQBXnHQNgiffVi+K9Jjja
   g7cHKD65PkIB0Mrqjfo8Tg2/EYVMEJZxeNAv9EbqOHcPv5WI1LcwXamRI
   Q==;
X-CSE-ConnectionGUID: Tx4p3AoQTtWAW00Yf7wYaw==
X-CSE-MsgGUID: cyVcAC64QQeDSVk0BhAXrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32309035"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="32309035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 12:24:15 -0700
X-CSE-ConnectionGUID: zRwPVNjDTyaSr6Fq96gz3g==
X-CSE-MsgGUID: BhPG3semR4GTCtAb/It1Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80608283"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Oct 2024 12:24:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t43RL-000WvI-2w;
	Thu, 24 Oct 2024 19:24:11 +0000
Date: Fri, 25 Oct 2024 03:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 cd4827fef2fd758a00012615f4529fd43a461dba
Message-ID: <202410250325.VW99M08w-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_122417_082432_BE0705F1 
X-CRM114-Status: UNSURE (   3.63  )
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
branch HEAD: cd4827fef2fd758a00012615f4529fd43a461dba  Add localversion-wireless-testing-ath

elapsed time: 1467m

configs tested: 190
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241024    gcc-14.1.0
arc                   randconfig-002-20241024    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm                             pxa_defconfig    clang-20
arm                   randconfig-001-20241024    gcc-14.1.0
arm                   randconfig-002-20241024    gcc-14.1.0
arm                   randconfig-003-20241024    gcc-14.1.0
arm                   randconfig-004-20241024    gcc-14.1.0
arm                        realview_defconfig    clang-20
arm                           spitz_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    clang-20
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241024    gcc-14.1.0
arm64                 randconfig-002-20241024    gcc-14.1.0
arm64                 randconfig-003-20241024    gcc-14.1.0
arm64                 randconfig-004-20241024    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241024    gcc-14.1.0
csky                  randconfig-002-20241024    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241024    gcc-14.1.0
hexagon               randconfig-002-20241024    gcc-14.1.0
i386                             alldefconfig    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241024    clang-19
i386        buildonly-randconfig-002-20241024    clang-19
i386        buildonly-randconfig-003-20241024    clang-19
i386        buildonly-randconfig-004-20241024    clang-19
i386        buildonly-randconfig-005-20241024    clang-19
i386        buildonly-randconfig-006-20241024    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241024    clang-19
i386                  randconfig-002-20241024    clang-19
i386                  randconfig-003-20241024    clang-19
i386                  randconfig-004-20241024    clang-19
i386                  randconfig-005-20241024    clang-19
i386                  randconfig-006-20241024    clang-19
i386                  randconfig-011-20241024    clang-19
i386                  randconfig-012-20241024    clang-19
i386                  randconfig-013-20241024    clang-19
i386                  randconfig-014-20241024    clang-19
i386                  randconfig-015-20241024    clang-19
i386                  randconfig-016-20241024    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241024    gcc-14.1.0
loongarch             randconfig-002-20241024    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    clang-20
m68k                       bvme6000_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    gcc-14.1.0
mips                            gpr_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241024    gcc-14.1.0
nios2                 randconfig-002-20241024    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241024    gcc-14.1.0
parisc                randconfig-002-20241024    gcc-14.1.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    clang-20
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       ebony_defconfig    gcc-14.1.0
powerpc                     ep8248e_defconfig    clang-20
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc                    gamecube_defconfig    clang-20
powerpc                     mpc83xx_defconfig    clang-20
powerpc               randconfig-001-20241024    gcc-14.1.0
powerpc               randconfig-002-20241024    gcc-14.1.0
powerpc               randconfig-003-20241024    gcc-14.1.0
powerpc                     redwood_defconfig    clang-20
powerpc                     tqm8540_defconfig    gcc-14.1.0
powerpc                     tqm8548_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241024    gcc-14.1.0
powerpc64             randconfig-002-20241024    gcc-14.1.0
powerpc64             randconfig-003-20241024    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.1.0
riscv                 randconfig-001-20241024    gcc-14.1.0
riscv                 randconfig-002-20241024    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241024    gcc-14.1.0
s390                  randconfig-002-20241024    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          kfr2r09_defconfig    clang-20
sh                          r7780mp_defconfig    clang-20
sh                    randconfig-001-20241024    gcc-14.1.0
sh                    randconfig-002-20241024    gcc-14.1.0
sh                      rts7751r2d1_defconfig    gcc-14.1.0
sh                           se7712_defconfig    clang-20
sh                           se7750_defconfig    gcc-14.1.0
sh                             shx3_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241024    gcc-14.1.0
sparc64               randconfig-002-20241024    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241024    gcc-14.1.0
um                    randconfig-002-20241024    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241024    gcc-12
x86_64      buildonly-randconfig-002-20241024    gcc-12
x86_64      buildonly-randconfig-003-20241024    gcc-12
x86_64      buildonly-randconfig-004-20241024    gcc-12
x86_64      buildonly-randconfig-005-20241024    gcc-12
x86_64      buildonly-randconfig-006-20241024    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241024    gcc-12
x86_64                randconfig-002-20241024    gcc-12
x86_64                randconfig-003-20241024    gcc-12
x86_64                randconfig-004-20241024    gcc-12
x86_64                randconfig-005-20241024    gcc-12
x86_64                randconfig-006-20241024    gcc-12
x86_64                randconfig-011-20241024    gcc-12
x86_64                randconfig-012-20241024    gcc-12
x86_64                randconfig-013-20241024    gcc-12
x86_64                randconfig-014-20241024    gcc-12
x86_64                randconfig-015-20241024    gcc-12
x86_64                randconfig-016-20241024    gcc-12
x86_64                randconfig-071-20241024    gcc-12
x86_64                randconfig-072-20241024    gcc-12
x86_64                randconfig-073-20241024    gcc-12
x86_64                randconfig-074-20241024    gcc-12
x86_64                randconfig-075-20241024    gcc-12
x86_64                randconfig-076-20241024    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241024    gcc-14.1.0
xtensa                randconfig-002-20241024    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

