Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324BFCD6E50
	for <ath12k@archiver.kernel.org>; Fri, 29 May 2026 15:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AmGLSPMZG0BADWtvnp4NUpKStaxn+SfMTsCO0ohXgv4=; b=ehnp7QW4zd0GOhGO7Yr6xBSrTg
	+FCkaVdbkjwxqYk8ZD/x95jSnfM21U2kHu2C0wIXLA3Yu2w2W1zwg/vo/+cZOKzsHBLAmn6ilRcFr
	aZCuaLVhaBEhw4eFsdBJECMbPyDXJo6n8/FIb42g6ZnJd8EfKBMHoOLinBDe+uL54NS+Tr1bpV6Zm
	an1TxpJQQKen1EHLvByxM1tZR62Ps8DD01/Pq3xWZf1E+AerKbU5BWyAbQYGqkjGUydchAW/KOSWD
	WTGFEZWPLZa8HijDPfXe2wBHI2V0NPxL8ORIbVszw7WrsJS1OWr8rRzJBCkB9mtqQYyMoYYRSGoV+
	5eno1DNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz1h-00000007esi-3v3o;
	Fri, 29 May 2026 15:21:33 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz1c-00000007erT-3Knj
	for ath12k@lists.infradead.org;
	Fri, 29 May 2026 15:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780068088; x=1811604088;
  h=date:from:to:cc:subject:message-id;
  bh=920NX949Zw24+0Kzq75OnEVG0nn6c32prBgs6SVpZeM=;
  b=nXbWZ6iETNNDEUViaIgjLGsDZ2uZqxMzgl/tXR8Tz/RYxb2wsbRzC631
   ZHHXjvDBbwg7u4m9lTLr7xI45U4mdRZk+YZHhaXmfBhBrPU3Reo/LmyH9
   JNg8d0QjZEAy7A5ckkHnN9GZ9/dh48z/VaJdheEGsGfmNYDbAbmFYsoKP
   JRcn1d4U09ZC/WgcZo5t5xidUG3VxYalNXiQYJc+2jPFeDscDSSKnSdVp
   4HBPsiz1TM6wUBqUivTzEfU3ezapR3NQgg/r5xxBUkZ/hq7erbjOIgHUP
   yiVvrwLqNKm+0POqgUaGG46uLcyI1r2jOQo0pvwfJzpV56g0n2IjW3LE5
   Q==;
X-CSE-ConnectionGUID: uGQPgR3oTY6dHPH7V2Yjpg==
X-CSE-MsgGUID: b3hRu5SQQOGBtpugtvqj/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92394670"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="92394670"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 08:21:28 -0700
X-CSE-ConnectionGUID: 6SRYEeZ9RDe/1sP9KloXYQ==
X-CSE-MsgGUID: QdmsRVKhTUWg6McUMBjPlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="238695122"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 May 2026 08:21:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSz1Y-000000007PG-1s8a;
	Fri, 29 May 2026 15:21:24 +0000
Date: Fri, 29 May 2026 23:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 6f5dc19f46f4bd0e104c9a4da2f0a912cdf3bd86
Message-ID: <202605292353.NJKcTg85-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_082128_913632_7FFB67C9 
X-CRM114-Status: UNSURE (   4.01  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: 6f5dc19f46f4bd0e104c9a4da2f0a912cdf3bd86  Merge tag 'ath-next-20260526' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

elapsed time: 1365m

configs tested: 220
configs skipped: 107

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
arc                   randconfig-001-20260529    clang-23
arc                   randconfig-002-20260529    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260529    clang-23
arm                   randconfig-001-20260529    gcc-14.3.0
arm                   randconfig-002-20260529    clang-23
arm                   randconfig-002-20260529    gcc-8.5.0
arm                   randconfig-003-20260529    clang-23
arm                   randconfig-003-20260529    gcc-13.4.0
arm                   randconfig-004-20260529    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260529    clang-23
arm64                 randconfig-001-20260529    gcc-8.5.0
arm64                 randconfig-002-20260529    clang-23
arm64                 randconfig-003-20260529    clang-23
arm64                 randconfig-004-20260529    clang-23
arm64                 randconfig-004-20260529    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260529    clang-23
csky                  randconfig-002-20260529    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260529    gcc-8.5.0
hexagon               randconfig-002-20260529    gcc-8.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260529    gcc-12
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260529    gcc-12
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260529    gcc-12
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260529    gcc-12
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260529    gcc-12
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260529    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260529    gcc-14
i386                  randconfig-002-20260529    gcc-12
i386                  randconfig-002-20260529    gcc-14
i386                  randconfig-003-20260529    clang-20
i386                  randconfig-003-20260529    gcc-14
i386                  randconfig-004-20260529    clang-20
i386                  randconfig-004-20260529    gcc-14
i386                  randconfig-005-20260529    gcc-14
i386                  randconfig-006-20260529    clang-20
i386                  randconfig-006-20260529    gcc-14
i386                  randconfig-007-20260529    gcc-12
i386                  randconfig-007-20260529    gcc-14
i386                  randconfig-011-20260529    clang-20
i386                  randconfig-011-20260529    gcc-14
i386                  randconfig-012-20260529    clang-20
i386                  randconfig-012-20260529    gcc-14
i386                  randconfig-013-20260529    clang-20
i386                  randconfig-013-20260529    gcc-14
i386                  randconfig-014-20260529    clang-20
i386                  randconfig-014-20260529    gcc-14
i386                  randconfig-015-20260529    gcc-14
i386                  randconfig-016-20260529    clang-20
i386                  randconfig-016-20260529    gcc-14
i386                  randconfig-017-20260529    gcc-13
i386                  randconfig-017-20260529    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260529    gcc-8.5.0
loongarch             randconfig-002-20260529    gcc-8.5.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
nios2                            alldefconfig    gcc-11.5.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260529    gcc-8.5.0
nios2                 randconfig-002-20260529    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-19
parisc                randconfig-001-20260529    clang-19
parisc                         randconfig-002    clang-19
parisc                randconfig-002-20260529    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        randconfig-001    clang-19
powerpc               randconfig-001-20260529    clang-19
powerpc                        randconfig-002    clang-19
powerpc               randconfig-002-20260529    clang-19
powerpc64                      randconfig-001    clang-19
powerpc64             randconfig-001-20260529    clang-19
powerpc64                      randconfig-002    clang-19
powerpc64             randconfig-002-20260529    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260529    gcc-15.2.0
riscv                 randconfig-002-20260529    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260529    gcc-15.2.0
s390                  randconfig-002-20260529    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260529    gcc-15.2.0
sh                    randconfig-002-20260529    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260529    gcc-14
x86_64      buildonly-randconfig-002-20260529    gcc-14
x86_64      buildonly-randconfig-003-20260529    gcc-14
x86_64      buildonly-randconfig-004-20260529    clang-20
x86_64      buildonly-randconfig-004-20260529    gcc-14
x86_64      buildonly-randconfig-005-20260529    clang-20
x86_64      buildonly-randconfig-005-20260529    gcc-14
x86_64      buildonly-randconfig-006-20260529    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260529    clang-20
x86_64                randconfig-001-20260529    gcc-14
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260529    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260529    clang-20
x86_64                randconfig-003-20260529    gcc-14
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260529    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260529    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260529    clang-20
x86_64                randconfig-011-20260529    clang-20
x86_64                randconfig-011-20260529    gcc-14
x86_64                randconfig-012-20260529    clang-20
x86_64                randconfig-012-20260529    gcc-14
x86_64                randconfig-013-20260529    clang-20
x86_64                randconfig-014-20260529    clang-20
x86_64                randconfig-015-20260529    clang-20
x86_64                randconfig-015-20260529    gcc-14
x86_64                randconfig-016-20260529    clang-20
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260529    clang-20
x86_64                randconfig-071-20260529    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260529    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260529    clang-20
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260529    clang-20
x86_64                randconfig-074-20260529    gcc-14
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260529    clang-20
x86_64                randconfig-075-20260529    gcc-14
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260529    clang-20
x86_64                randconfig-076-20260529    gcc-14
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

