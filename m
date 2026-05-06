Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00880CD343B
	for <ath12k@archiver.kernel.org>; Wed,  6 May 2026 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o7WrZsk7lrVloLwe63v0JJZkZcDnUuZVJLpWWl8siyQ=; b=P5k0X4ga9j/r77dO2QoxdleRvH
	dCoPijm7Cms1CUeMYSgF8rOKkHJgEbFkfq3ljZzOqaZlEuI6NBw6pDo6tRDddhzslxyVvnDPjWh6z
	BY/VSfpSH99JLTsElKZ++vL6Krsog7CUBb7afN1wuECaAgt1pCxULOmqeWeiu+KKzzVccyS7jExdU
	foOp46AS1pzbs+VtCoMn9/78gwG9WwmvIQPY09HOsEkr9hhjgc+IpEeef1+0Ey/2NKrfNANv3Smk9
	mNJobCPacuF/3b1O4liW2cr5hKi0fXaZbQDamQQ00mIaLuQ13wZsX2x6a8qbWZGZW89biLum+M+Bz
	ulwslvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcXP-00000000wSb-3ArN;
	Wed, 06 May 2026 13:43:43 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcXP-00000000vke-0fvi
	for ath12k@lists.infradead.org;
	Wed, 06 May 2026 13:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778075023; x=1809611023;
  h=date:from:to:cc:subject:message-id;
  bh=av6QwQ8solFI6pehsrHO0ywni6P8enXnxKbJTBK9+rU=;
  b=Hdc4K9pf6+PBH52R5ZpyZKuqjCe51NXEX3csudB+ea1vi3bRJW6vN3EK
   IU4Fu5HYhwRVNYT7iFcuWM+2Yryj2k3cJ7V3inTpiUgiyyE1UmVz1WGvq
   PvcJ1y8BeGGf6yNLQzkCoIV4t9MgIs+R5hwdqnsA1/ZVOjOSGlo9/wK6S
   0AQvahyMevuImpaZbY53LNEvCCy5wUy6usujojj3jDmxIIq7ZpV8s8/bT
   ictEZT1PAo2ts98VFPWrFLAbb2JfvUYKTwXU80gEeHi/iwORh/Waip9eZ
   wRyg+Nh/CIftzlP0fz7C54/pREWVhpbJTfajVr6ExkoajKfX5XctXHO54
   A==;
X-CSE-ConnectionGUID: B6v9JVdySbiGQOCnzjLFeg==
X-CSE-MsgGUID: wH6lXJB4Rxa+TC/VsSEA0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82849491"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="82849491"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:41:42 -0700
X-CSE-ConnectionGUID: 6DQ0uyjSQIaGhZn3LQFccQ==
X-CSE-MsgGUID: cjXRdmGfSkaylrGXMOHr9Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2026 06:41:40 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKcVO-000000000xJ-0XQp;
	Wed, 06 May 2026 13:41:38 +0000
Date: Wed, 06 May 2026 21:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-current] BUILD SUCCESS
 ac8eb3e18f41e2cc8492cc1d358bcb786c850270
Message-ID: <202605062105.WEnmWtJf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_064343_217830_273D9759 
X-CRM114-Status: UNSURE (   3.65  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
branch HEAD: ac8eb3e18f41e2cc8492cc1d358bcb786c850270  wifi: mac80211: use safe list iteration in radar detect work

elapsed time: 730m

configs tested: 248
configs skipped: 26

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260506    gcc-12.5.0
arc                   randconfig-002-20260506    gcc-12.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260506    gcc-12.5.0
arm                   randconfig-002-20260506    gcc-12.5.0
arm                   randconfig-003-20260506    gcc-12.5.0
arm                   randconfig-004-20260506    gcc-12.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-15.2.0
arm64                 randconfig-001-20260506    gcc-15.2.0
arm64                          randconfig-002    gcc-15.2.0
arm64                 randconfig-002-20260506    gcc-15.2.0
arm64                          randconfig-003    gcc-15.2.0
arm64                 randconfig-003-20260506    gcc-15.2.0
arm64                          randconfig-004    gcc-15.2.0
arm64                 randconfig-004-20260506    gcc-15.2.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-15.2.0
csky                  randconfig-001-20260506    gcc-15.2.0
csky                           randconfig-002    gcc-15.2.0
csky                  randconfig-002-20260506    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260506    clang-23
hexagon               randconfig-001-20260506    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260506    clang-23
hexagon               randconfig-002-20260506    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260506    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260506    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260506    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260506    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260506    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260506    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260506    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260506    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260506    gcc-14
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260506    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260506    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260506    gcc-14
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260506    gcc-14
i386                  randconfig-011-20260506    clang-20
i386                  randconfig-012-20260506    clang-20
i386                  randconfig-013-20260506    clang-20
i386                  randconfig-014-20260506    clang-20
i386                  randconfig-015-20260506    clang-20
i386                  randconfig-016-20260506    clang-20
i386                  randconfig-017-20260506    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260506    clang-23
loongarch             randconfig-001-20260506    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260506    clang-23
loongarch             randconfig-002-20260506    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         db1xxx_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260506    clang-23
nios2                 randconfig-001-20260506    gcc-11.5.0
nios2                 randconfig-001-20260506    gcc-8.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260506    clang-23
nios2                 randconfig-002-20260506    gcc-11.5.0
nios2                 randconfig-002-20260506    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                       virt_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260506    gcc-13.4.0
parisc                         randconfig-002    gcc-13.4.0
parisc                randconfig-002-20260506    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                          g5_defconfig    gcc-15.2.0
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260506    gcc-13.4.0
powerpc                        randconfig-002    gcc-13.4.0
powerpc               randconfig-002-20260506    gcc-13.4.0
powerpc64                      randconfig-001    gcc-13.4.0
powerpc64             randconfig-001-20260506    gcc-13.4.0
powerpc64                      randconfig-002    gcc-13.4.0
powerpc64             randconfig-002-20260506    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260506    gcc-8.5.0
riscv                          randconfig-002    gcc-8.5.0
riscv                 randconfig-002-20260506    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-8.5.0
s390                  randconfig-001-20260506    gcc-8.5.0
s390                           randconfig-002    gcc-8.5.0
s390                  randconfig-002-20260506    gcc-8.5.0
sh                               alldefconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                 kfr2r09-romimage_defconfig    gcc-15.2.0
sh                             randconfig-001    gcc-8.5.0
sh                    randconfig-001-20260506    gcc-8.5.0
sh                             randconfig-002    gcc-8.5.0
sh                    randconfig-002-20260506    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260506    gcc-11.5.0
sparc                 randconfig-002-20260506    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260506    gcc-11.5.0
sparc64               randconfig-002-20260506    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260506    gcc-11.5.0
um                    randconfig-002-20260506    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260506    clang-20
x86_64      buildonly-randconfig-002-20260506    clang-20
x86_64      buildonly-randconfig-002-20260506    gcc-14
x86_64      buildonly-randconfig-003-20260506    clang-20
x86_64      buildonly-randconfig-004-20260506    clang-20
x86_64      buildonly-randconfig-005-20260506    clang-20
x86_64      buildonly-randconfig-005-20260506    gcc-14
x86_64      buildonly-randconfig-006-20260506    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260506    clang-20
x86_64                randconfig-001-20260506    gcc-13
x86_64                randconfig-002-20260506    clang-20
x86_64                randconfig-003-20260506    clang-20
x86_64                randconfig-004-20260506    clang-20
x86_64                randconfig-005-20260506    clang-20
x86_64                randconfig-005-20260506    gcc-13
x86_64                randconfig-006-20260506    clang-20
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260506    clang-20
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260506    clang-20
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260506    clang-20
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260506    clang-20
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260506    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260506    clang-20
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260506    clang-20
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260506    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260506    clang-20
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260506    clang-20
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260506    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260506    clang-20
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
xtensa                           allyesconfig    gcc-11.5.0
xtensa                randconfig-001-20260506    gcc-11.5.0
xtensa                randconfig-002-20260506    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

