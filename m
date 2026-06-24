Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DA1CDB479
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S2i47y9FmE7+zXVGOZtS1dhCO8aQfEB0hgxcuAa8bcA=; b=1hvGK0nVBdRPlUCRFojwwS/w6b
	Pbk3lWppLgHvjOGBDCDEKlRKQdk8lxFKO/oIe4dnuo4vf3AH9cuuqysY6Ten/SBYa6aHIitgjWsL7
	byh+XAu+QgjyC8vHBf2TyWmWN/W9rMjum6f9Hp+2uXo3KMgMWNM6oZBgaPiRYASs8eZEaH9oRJOkU
	HR8SsXecYEnlSK7Mv/NSwx97jDIfIpU0I2wdM0jer3M3ekxFZHMrYaXWhTRBKFppP2rKI8VaOth+j
	pcnEcXIcVWukR308AUdj2ZYEk8/DIlkvVnw1wHVgRl08bMRwueYQat+harrXiKCjkVs7ImtJgC8sK
	KrBfBMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOih-00000007vI6-0gUV;
	Wed, 24 Jun 2026 14:36:51 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOie-00000007vHa-2RIp
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 14:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782311809; x=1813847809;
  h=date:from:to:cc:subject:message-id;
  bh=4lUZGwlrSp1xXEn//ATUMyLj2AyfFmyceHPTsb5rDdg=;
  b=nDBfPc/KcOcSDegcDUYmLf3olsYzwaE19J/yPu2QJi0DJvaHTsMmTwOb
   KnkpKy+HtReaICyeTgCFhmX0F3GNkLIAwx2isxNly4Gq1Ae4myPXsDLPq
   +hNaeFJTDw+DSrIq7Mx5L0rI7xjmU0RdHXO6FCeofZcwspU1kIqfhL9id
   IB458G3mU3gvQubD2NAoyUm8eTT5gJ9USdQU4uKQclGHODBDF9GbqRwWn
   Ot8UfSqMz2tXl1ZOo5Gm2UaX+tWzz739y+ytRoxvr6A+o0/V3mwFnV8Lj
   W18+kCkYnhy1KqhS5YwJidvXpmvBMhIRteH5wVOa8BhdOUrOhDYKpJBvz
   g==;
X-CSE-ConnectionGUID: nhlzXgGoTy+M/TP3yZBWOg==
X-CSE-MsgGUID: FSVRF/mYRrWmmZKuLzYIrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93435100"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="93435100"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:36:47 -0700
X-CSE-ConnectionGUID: 7YwOO4RoT2CYQ/uw3FN/Ng==
X-CSE-MsgGUID: +YIF2zlUSl+tmNVa0yQokw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="249913393"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2026 07:36:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcOiZ-000000003Q5-0bHU;
	Wed, 24 Jun 2026 14:36:43 +0000
Date: Wed, 24 Jun 2026 22:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 f3bfda20cdd8b64bf2940772f2714cceaa32a493
Message-ID: <202606242226.SF0M7fBX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_073648_718666_39D90313 
X-CRM114-Status: UNSURE (   3.71  )
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
branch HEAD: f3bfda20cdd8b64bf2940772f2714cceaa32a493  Merge branch 'pending' into main-pending

elapsed time: 1211m

configs tested: 257
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260624    gcc-15.2.0
arc                   randconfig-002-20260624    gcc-15.2.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260624    gcc-15.2.0
arm                   randconfig-002-20260624    gcc-15.2.0
arm                   randconfig-003-20260624    gcc-15.2.0
arm                   randconfig-004-20260624    gcc-15.2.0
arm                           tegra_defconfig    gcc-16.1.0
arm                        vexpress_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260624    clang-21
arm64                 randconfig-001-20260624    clang-23
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260624    clang-21
arm64                 randconfig-002-20260624    clang-23
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260624    clang-21
arm64                 randconfig-003-20260624    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260624    clang-21
arm64                 randconfig-004-20260624    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260624    clang-21
csky                  randconfig-001-20260624    clang-23
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260624    clang-21
csky                  randconfig-002-20260624    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260624    gcc-11.5.0
hexagon               randconfig-001-20260624    gcc-9.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260624    gcc-11.5.0
hexagon               randconfig-002-20260624    gcc-9.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20260624    gcc-12
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20260624    gcc-12
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20260624    gcc-12
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20260624    gcc-12
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20260624    gcc-12
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20260624    gcc-12
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260624    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260624    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260624    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260624    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260624    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260624    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260624    clang-22
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260624    clang-22
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260624    clang-22
i386                           randconfig-013    clang-22
i386                  randconfig-013-20260624    clang-22
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260624    clang-22
i386                           randconfig-015    clang-22
i386                  randconfig-015-20260624    clang-22
i386                           randconfig-016    clang-22
i386                  randconfig-016-20260624    clang-22
i386                           randconfig-017    clang-22
i386                  randconfig-017-20260624    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260624    gcc-11.5.0
loongarch             randconfig-001-20260624    gcc-9.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260624    gcc-11.5.0
loongarch             randconfig-002-20260624    gcc-9.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
m68k                        stmark2_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        omega2p_defconfig    clang-17
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-16.1.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260624    gcc-11.5.0
nios2                 randconfig-001-20260624    gcc-9.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260624    gcc-11.5.0
nios2                 randconfig-002-20260624    gcc-9.5.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260624    gcc-16.1.0
parisc                randconfig-002-20260624    gcc-16.1.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                     asp8347_defconfig    clang-23
powerpc                        fsp2_defconfig    gcc-16.1.0
powerpc                          g5_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260624    gcc-16.1.0
powerpc               randconfig-002-20260624    gcc-16.1.0
powerpc64             randconfig-001-20260624    gcc-16.1.0
powerpc64             randconfig-002-20260624    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-18
riscv                 randconfig-001-20260624    clang-18
riscv                          randconfig-002    clang-18
riscv                 randconfig-002-20260624    clang-18
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-18
s390                  randconfig-001-20260624    clang-18
s390                           randconfig-002    clang-18
s390                  randconfig-002-20260624    clang-18
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-18
sh                    randconfig-001-20260624    clang-18
sh                             randconfig-002    clang-18
sh                    randconfig-002-20260624    clang-18
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-14.3.0
sparc                 randconfig-001-20260624    gcc-14.3.0
sparc                          randconfig-002    gcc-14.3.0
sparc                 randconfig-002-20260624    gcc-14.3.0
sparc                       sparc32_defconfig    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-14.3.0
sparc64               randconfig-001-20260624    gcc-14.3.0
sparc64                        randconfig-002    gcc-14.3.0
sparc64               randconfig-002-20260624    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-14.3.0
um                    randconfig-001-20260624    gcc-14.3.0
um                             randconfig-002    gcc-14.3.0
um                    randconfig-002-20260624    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260624    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260624    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260624    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260624    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260624    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260624    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260624    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260624    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260624    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260624    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260624    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260624    clang-22
x86_64                randconfig-011-20260624    gcc-14
x86_64                randconfig-012-20260624    gcc-14
x86_64                randconfig-013-20260624    gcc-14
x86_64                randconfig-014-20260624    gcc-14
x86_64                randconfig-015-20260624    gcc-14
x86_64                randconfig-016-20260624    gcc-14
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260624    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260624    gcc-14
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260624    gcc-14
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260624    gcc-14
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260624    gcc-14
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260624    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                         randconfig-001    gcc-14.3.0
xtensa                randconfig-001-20260624    gcc-14.3.0
xtensa                         randconfig-002    gcc-14.3.0
xtensa                randconfig-002-20260624    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

