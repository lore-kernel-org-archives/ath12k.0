Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839B9CCF9F8
	for <ath12k@archiver.kernel.org>; Fri, 31 Oct 2025 22:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d71aUu370zEjKT0KlmBmjlneY7eLejK7dfHA42iXNsM=; b=yg28HbFd/JvJEg1nt0451U0iSb
	uR5ii/aZWdyLn/LAV1k0KRySnAgbT5fcl2mqgmNIcDntyx2UyTioG69L8/OvpUNsjCPle/WVvI08m
	z3IetxvGZQROeox2w2BF+7h4sMffwR1f8NE6ZRVKigp2wRjvA+kekVlXTVorwe+IeTfql9/C8Joca
	gezishG5DcP3aK/hC0kXWYbPSGREzX2ESArB4KcCvkjq6J33NNpDMy6kF0CagL6bDCdSCSskF3fGb
	jN6veRvCxcg+VO+eR6KxdhCQOpb5iWQ6FTGpevLHgumXDHIVWLirqL/fBq2Txet+AoyXT0w5uNoiY
	pgO4rBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExvT-00000006sdV-19LD;
	Fri, 31 Oct 2025 22:48:55 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExvQ-00000006sd8-2VE8
	for ath12k@lists.infradead.org;
	Fri, 31 Oct 2025 22:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761950932; x=1793486932;
  h=date:from:to:cc:subject:message-id;
  bh=s8j/GLiwcuDe8O1rZ0WnfIGC1rPi+Z7QciQIZkakLhY=;
  b=UpddaT0W+16tSrAUq7KPm/+3dG5umAgz+MqTREZ4Y383hxxVa1vKd0Oq
   EM2Ml6hG6a17CwWi295n6U+hGiOuuNkT8QkkiwJvv1K4gbSCrWJZrWcZH
   f3fDRsHuxFo3EGVv2ubedWprbN8i20mD5BpTCRK7IhCQh0nsfYNQ2PT3m
   S3pZjfQJOtBiHW6tPR3i23efy/u/MW0yTluHEd3BIDHdZ3f76Gn4olnE7
   bkoLfYu2v9p1P8nCU7BmsA8Cm3fxAlbbLv9PdciwAbQGq2ve+nVfC0Fiw
   CbxDTAdrJuwxoMfSdg+u1CY02oeTS9nxSF+QQT2LBK4dDTnerxYczfSnE
   A==;
X-CSE-ConnectionGUID: teBS0tEZRXKJX2khIpIyMQ==
X-CSE-MsgGUID: MYuzsI1hQrGrxzPDvZ9/pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="86744557"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="86744557"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 15:48:51 -0700
X-CSE-ConnectionGUID: lI6blN8zSEKsQY7xAyBbLg==
X-CSE-MsgGUID: hSB8/kSnSk6cTU4b5Q5ZlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="186013550"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 31 Oct 2025 15:48:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vExuz-000Nhe-2R;
	Fri, 31 Oct 2025 22:48:37 +0000
Date: Sat, 01 Nov 2025 06:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 6a5812e1623723adb18e6217d512274ef0d84015
Message-ID: <202511010626.vfj6BWmn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_154852_702072_A8A1CA19 
X-CRM114-Status: UNSURE (   3.64  )
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
branch HEAD: 6a5812e1623723adb18e6217d512274ef0d84015  spi: amlogic: fix spifc build error

elapsed time: 1400m

configs tested: 195
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251031    gcc-8.5.0
arc                   randconfig-002-20251031    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20251031    gcc-14.3.0
arm                   randconfig-001-20251031    gcc-8.5.0
arm                   randconfig-002-20251031    clang-22
arm                   randconfig-002-20251031    gcc-8.5.0
arm                   randconfig-003-20251031    gcc-11.5.0
arm                   randconfig-003-20251031    gcc-8.5.0
arm                   randconfig-004-20251031    clang-22
arm                   randconfig-004-20251031    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251031    gcc-10.5.0
arm64                 randconfig-002-20251031    gcc-10.5.0
arm64                 randconfig-003-20251031    gcc-10.5.0
arm64                 randconfig-004-20251031    gcc-10.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251031    gcc-10.5.0
csky                  randconfig-002-20251031    gcc-10.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251031    clang-22
hexagon               randconfig-002-20251031    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251031    clang-20
i386        buildonly-randconfig-002-20251031    clang-20
i386        buildonly-randconfig-003-20251031    clang-20
i386        buildonly-randconfig-004-20251031    clang-20
i386        buildonly-randconfig-005-20251031    clang-20
i386        buildonly-randconfig-006-20251031    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251031    clang-20
i386                  randconfig-002-20251031    clang-20
i386                  randconfig-003-20251031    clang-20
i386                  randconfig-004-20251031    clang-20
i386                  randconfig-005-20251031    clang-20
i386                  randconfig-006-20251031    clang-20
i386                  randconfig-007-20251031    clang-20
i386                  randconfig-011-20251031    gcc-13
i386                  randconfig-012-20251031    gcc-13
i386                  randconfig-013-20251031    gcc-13
i386                  randconfig-014-20251031    gcc-13
i386                  randconfig-015-20251031    gcc-13
i386                  randconfig-016-20251031    gcc-13
i386                  randconfig-017-20251031    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251031    gcc-15.1.0
loongarch             randconfig-002-20251031    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                       m5208evb_defconfig    clang-22
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251031    gcc-9.5.0
nios2                 randconfig-002-20251031    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251031    clang-22
parisc                randconfig-002-20251031    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   lite5200b_defconfig    clang-22
powerpc                     mpc5200_defconfig    clang-22
powerpc               randconfig-001-20251031    clang-22
powerpc               randconfig-002-20251031    clang-22
powerpc64             randconfig-001-20251031    clang-22
powerpc64             randconfig-002-20251031    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251031    clang-17
riscv                 randconfig-001-20251031    gcc-8.5.0
riscv                 randconfig-002-20251031    clang-17
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251031    clang-16
s390                  randconfig-001-20251031    clang-17
s390                  randconfig-002-20251031    clang-17
s390                  randconfig-002-20251031    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251031    clang-17
sh                    randconfig-001-20251031    gcc-14.3.0
sh                    randconfig-002-20251031    clang-17
sh                    randconfig-002-20251031    gcc-14.3.0
sh                           se7705_defconfig    clang-22
sh                           se7750_defconfig    clang-22
sh                            titan_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251031    gcc-8.5.0
sparc                 randconfig-002-20251031    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251031    gcc-8.5.0
sparc64               randconfig-002-20251031    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251031    gcc-8.5.0
um                    randconfig-002-20251031    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251031    gcc-14
x86_64      buildonly-randconfig-002-20251031    gcc-14
x86_64      buildonly-randconfig-003-20251031    gcc-14
x86_64      buildonly-randconfig-004-20251031    gcc-14
x86_64      buildonly-randconfig-005-20251031    gcc-14
x86_64      buildonly-randconfig-006-20251031    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251031    gcc-14
x86_64                randconfig-002-20251031    gcc-14
x86_64                randconfig-003-20251031    gcc-14
x86_64                randconfig-004-20251031    gcc-14
x86_64                randconfig-005-20251031    gcc-14
x86_64                randconfig-006-20251031    gcc-14
x86_64                randconfig-011-20251031    gcc-14
x86_64                randconfig-012-20251031    gcc-14
x86_64                randconfig-013-20251031    gcc-14
x86_64                randconfig-014-20251031    gcc-14
x86_64                randconfig-015-20251031    gcc-14
x86_64                randconfig-016-20251031    gcc-14
x86_64                randconfig-071-20251031    clang-20
x86_64                randconfig-072-20251031    clang-20
x86_64                randconfig-073-20251031    clang-20
x86_64                randconfig-074-20251031    clang-20
x86_64                randconfig-075-20251031    clang-20
x86_64                randconfig-076-20251031    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251031    gcc-8.5.0
xtensa                randconfig-002-20251031    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

