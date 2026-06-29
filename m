Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6832C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ecx55/xc2lxYMC6N88BvIRn0gavSqSu2MdQlITN/LoU=; b=hy2jEjxkQDfkhreJf/uzE4QouI
	0SkDch/uo4XuZkV3sX6TVtTC8BKoU47Lysu1DyrXDJRlXw21Hh3naVAvi82s2BbU+HvL6A+1NCvWH
	PTicXC7T0pw1NVEbdkxw+HqSVttfQ+XUMNeJoZtUgi33KO+CkUXGYxI5s3AYm+D4glF5gTVOkyIG5
	/fHn9csyVBz9pbnp2bNP7L4ZUOTIs70OOR8th4p244pCkIX6qCptOgZlArw5u0CyxJJic4Eg72Wmc
	R1sp+y3nD4Q83K8iP+K2c0JMzjce6MHXqOP/CFYjbgAa8BVAtJ8hi3z8doLA5IYki64X9Nrwj6tn6
	QKlRrLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7Ah-0000000DzWu-1rEz;
	Mon, 29 Jun 2026 08:16:51 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7Af-0000000DzWU-26AC
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 08:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782721009; x=1814257009;
  h=date:from:to:cc:subject:message-id;
  bh=Nl0uZihPN74ZQtAIIMQDskn5Me1/PFxnuK6ahsMoIdI=;
  b=darQQcW5hrmd7RvYWyN1zEGJBObJFurmbFCyZ+l3Qiefz6hFUWKHMO/3
   iZvvsBcm26r4X/XFkahCZrRJdUzLwYQ8m276i10qyf9KlafqlRt3FvYUJ
   v03s006FpwgxpSV0UBqmrerMpcDWlDZn1WXNxkjDvop75chxTz8iMLJ4u
   qkLCpbazG1+NQLKbcEfxIuZlCpvp3aYEsXeuJ+DgovCdr5I2bsSF3Tpe8
   RtNEpqvMekFQFcHEZucEdicNtkQK17z+wCHETqXV1o5WQlIZYRcnnSrlV
   /8AuU1Zh8R4bbsFpP+g2llGRmax5obNXC04FclS/PfJw8t/1Yc5U5+XG6
   w==;
X-CSE-ConnectionGUID: dUdkpuAxSpKJQPm9VytCXg==
X-CSE-MsgGUID: f9fehEWTScyNcSvHFQRFuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83408193"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83408193"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 01:16:48 -0700
X-CSE-ConnectionGUID: SbPTgI0oRcWIrNnYcDMp3g==
X-CSE-MsgGUID: 8hcXnS/DTUKVO95jeBb1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="252028725"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Jun 2026 01:16:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we7AI-000000007An-12en;
	Mon, 29 Jun 2026 08:16:43 +0000
Date: Mon, 29 Jun 2026 16:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 4bfe69d8f78d69f3c2e70742263b195fe2433f97
Message-ID: <202606291625.XcdBOFJ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_011649_595209_D0F442BB 
X-CRM114-Status: UNSURE (   4.36  )
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
branch HEAD: 4bfe69d8f78d69f3c2e70742263b195fe2433f97  wifi: ath12k: advertise ieee_link_id in vdev start MLO params

elapsed time: 809m

configs tested: 211
configs skipped: 2

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
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260629    clang-17
arc                   randconfig-001-20260629    gcc-16.1.0
arc                   randconfig-002-20260629    clang-17
arc                   randconfig-002-20260629    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260629    clang-17
arm                   randconfig-001-20260629    gcc-10.5.0
arm                   randconfig-002-20260629    clang-16
arm                   randconfig-002-20260629    clang-17
arm                   randconfig-003-20260629    clang-17
arm                   randconfig-003-20260629    clang-23
arm                   randconfig-004-20260629    clang-17
arm                   randconfig-004-20260629    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260629    gcc-16.1.0
arm64                 randconfig-002-20260629    clang-22
arm64                 randconfig-003-20260629    clang-23
arm64                 randconfig-004-20260629    clang-20
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260629    gcc-10.5.0
csky                  randconfig-002-20260629    gcc-12.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260629    gcc-11.5.0
hexagon               randconfig-002-20260629    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260629    gcc-14
i386        buildonly-randconfig-002-20260629    gcc-14
i386        buildonly-randconfig-003-20260629    gcc-14
i386        buildonly-randconfig-004-20260629    gcc-14
i386        buildonly-randconfig-005-20260629    gcc-14
i386        buildonly-randconfig-006-20260629    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260629    clang-22
i386                  randconfig-002-20260629    clang-22
i386                  randconfig-003-20260629    clang-22
i386                  randconfig-004-20260629    clang-22
i386                  randconfig-005-20260629    clang-22
i386                  randconfig-006-20260629    clang-22
i386                  randconfig-007-20260629    clang-22
i386                  randconfig-011-20260629    gcc-14
i386                  randconfig-012-20260629    gcc-14
i386                  randconfig-013-20260629    gcc-14
i386                  randconfig-014-20260629    gcc-14
i386                  randconfig-015-20260629    gcc-14
i386                  randconfig-016-20260629    gcc-14
i386                  randconfig-017-20260629    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260629    gcc-11.5.0
loongarch             randconfig-002-20260629    gcc-11.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                       m5475evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260629    gcc-11.5.0
nios2                 randconfig-002-20260629    gcc-11.5.0
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
parisc                randconfig-001-20260629    gcc-9.5.0
parisc                randconfig-002-20260629    gcc-9.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                     ksi8560_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260629    gcc-9.5.0
powerpc               randconfig-002-20260629    gcc-9.5.0
powerpc64             randconfig-001-20260629    gcc-9.5.0
powerpc64             randconfig-002-20260629    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260629    clang-17
riscv                 randconfig-001-20260629    gcc-12.5.0
riscv                 randconfig-002-20260629    clang-16
riscv                 randconfig-002-20260629    clang-17
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260629    clang-17
s390                  randconfig-001-20260629    gcc-8.5.0
s390                  randconfig-002-20260629    clang-17
s390                  randconfig-002-20260629    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                               j2_defconfig    gcc-16.1.0
sh                    randconfig-001-20260629    clang-17
sh                    randconfig-001-20260629    gcc-10.5.0
sh                    randconfig-002-20260629    clang-17
sh                    randconfig-002-20260629    gcc-12.5.0
sh                   sh7770_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260629    gcc-15.2.0
sparc                 randconfig-002-20260629    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260629    gcc-15.2.0
sparc64               randconfig-002-20260629    gcc-15.2.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260629    gcc-15.2.0
um                    randconfig-002-20260629    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260629    clang-22
x86_64      buildonly-randconfig-002-20260629    clang-22
x86_64      buildonly-randconfig-003-20260629    clang-22
x86_64      buildonly-randconfig-004-20260629    clang-22
x86_64      buildonly-randconfig-005-20260629    clang-22
x86_64      buildonly-randconfig-006-20260629    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260629    gcc-14
x86_64                randconfig-002-20260629    gcc-14
x86_64                randconfig-003-20260629    gcc-14
x86_64                randconfig-004-20260629    gcc-14
x86_64                randconfig-005-20260629    gcc-14
x86_64                randconfig-006-20260629    gcc-14
x86_64                randconfig-011-20260629    gcc-13
x86_64                randconfig-012-20260629    gcc-13
x86_64                randconfig-013-20260629    gcc-13
x86_64                randconfig-014-20260629    gcc-13
x86_64                randconfig-015-20260629    gcc-13
x86_64                randconfig-016-20260629    gcc-13
x86_64                randconfig-071-20260629    clang-22
x86_64                randconfig-072-20260629    clang-22
x86_64                randconfig-073-20260629    clang-22
x86_64                randconfig-074-20260629    clang-22
x86_64                randconfig-075-20260629    clang-22
x86_64                randconfig-076-20260629    clang-22
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
xtensa                randconfig-001-20260629    gcc-15.2.0
xtensa                randconfig-002-20260629    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

