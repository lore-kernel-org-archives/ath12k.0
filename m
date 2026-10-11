Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BEACA9EC5
	for <ath12k@archiver.kernel.org>; Sun, 11 Oct 2026 02:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OwXFJj5E/rEf2pEKukMm+bXUQ8gU2eIV/NFI7qlEfns=; b=hfkLOdX3RGG1IrSwqug/EORpEv
	Zj6co9rwBVKX1IWHE6QQGLRWetBE0DSfXCAFWJFwxTC2nd1dJVfhnPCLAqzXsVkYQOFEtmBHyySlP
	l1+0DXekyP6BAl5r+mf//TaRZk5u6Xjlv6e9CBrI4B++KLQ3pmR8XbEHTwTBjnfY0QqH/qRmnzqYq
	eB3CjkccpM/8w/bIIZFxQbZ/OPQ619GGCDRM+v07zrK7e3k5C0Plpi4CcUKV9LRiJfwy0q+IPF4EH
	CtHzwo2WMoW+WFCpF6syTNWm/V25zbJUM3R6+EdRRT/o3yRNSA/0PvfPW512ezK4QtYeKYQ6MiqPF
	ewj3+ZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFjFL-00000008eN4-0i8e;
	Sun, 11 Oct 2026 02:25:07 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFjFI-00000008eKt-3hrw
	for ath12k@lists.infradead.org;
	Sun, 11 Oct 2026 02:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791685505; x=1823221505;
  h=date:from:to:cc:subject:message-id;
  bh=C0+TZHwevFw+XyqVrQssh3M4oZMdMz41n/baO1Eifwk=;
  b=b+RNqaETpOXi8QY3DQBW/AuoTwnBDUdJyfnjAsgm1t6ZW+SF5fDtKWGn
   694Gw89SFhrT3vA3s7U++FbIzG00hFFO67P+2K6q+S5qMo5aFjKvYr1XY
   WFri9Old+3xoXQfS6epXgpKzXl7jTHwIRP+bw7r3Dvjg7MEeovLUg1z0S
   Ne5TkSDh5kOSZ0fV8gVo3AnwZ45Hmb1O8i5YYnjQSInUFE/8cOtYa0wO7
   Uq++x4kZeKt6go885di+tPLBkJAK5gV+lv1ksf4bWUN8zV/Rp1B8chk4w
   Y3a3yIo1ZsuWvweJ6QyKtGpd/84e5mZfxxGDPqNpySiYQGsT9PhOia1OO
   w==;
X-CSE-ConnectionGUID: W4ya3DeGSIySvw3tCnFfOw==
X-CSE-MsgGUID: /FMMXmUFT2+pBRfjsy8OrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="462163"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="462163"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 19:24:59 -0700
X-CSE-ConnectionGUID: x9AXYAR3QQ2stEub8m808A==
X-CSE-MsgGUID: nd6dT6IbRIqhrxfMrHZSXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="577476"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2026 19:24:57 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFjF9-00000000AGI-11l9;
	Sun, 11 Oct 2026 02:24:55 +0000
Date: Sun, 11 Oct 2026 10:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 363b16f7b2e2fcfdcb26ebc72f703d35efa15a7e
Message-ID: <202610111031.Q6qPtCtc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_192504_977064_9C8E6D8C 
X-CRM114-Status: UNSURE (   3.15  )
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
branch HEAD: 363b16f7b2e2fcfdcb26ebc72f703d35efa15a7e  wifi: ath12k: Remove unused HAL_RX_REO_QUEUE_INFO macros

elapsed time: 1307m

configs tested: 369
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261010    gcc-12.5.0 cocci
alpha                randconfig-r2104-20261010    gcc-16.1.0 cocci
alpha                randconfig-r2107-20261010    gcc-8.5.0  cocci
alpha                randconfig-r2303-20261010    gcc-16.1.0 sparse
alpha                randconfig-r2305-20261010    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261010    gcc-8.5.0
arc                   randconfig-1000-20261011    clang-24
arc                   randconfig-1001-20261010    gcc-8.5.0
arc                   randconfig-1001-20261011    clang-24
arc                   randconfig-2000-20261010    gcc-8.5.0
arc                   randconfig-2001-20261010    gcc-8.5.0
arc                  randconfig-r2104-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2202-20261010    gcc-8.5.0  smatch
arc                  randconfig-r2307-20261010    clang-22   sparse
arc                  randconfig-r2308-20261010    gcc-13.4.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261010    gcc-8.5.0
arm                   randconfig-1000-20261011    clang-24
arm                   randconfig-1001-20261010    gcc-8.5.0
arm                   randconfig-1001-20261011    clang-24
arm                   randconfig-1002-20261010    gcc-8.5.0
arm                   randconfig-1002-20261011    clang-24
arm                   randconfig-1003-20261010    gcc-8.5.0
arm                   randconfig-1003-20261011    clang-24
arm                   randconfig-2000-20261010    gcc-8.5.0
arm                   randconfig-2001-20261010    gcc-8.5.0
arm                  randconfig-r2105-20261010    gcc-16.1.0 cocci
arm                  randconfig-r2105-20261010    gcc-8.5.0  cocci
arm                  randconfig-r2303-20261010    gcc-8.5.0  sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261010    gcc-10.5.0
arm64                 randconfig-1001-20261010    gcc-10.5.0
arm64                 randconfig-1002-20261010    gcc-10.5.0
arm64                 randconfig-1003-20261010    gcc-10.5.0
arm64                 randconfig-2000-20261010    gcc-16.1.0
arm64                 randconfig-2001-20261010    gcc-16.1.0
arm64                randconfig-r2101-20261010    clang-22   cocci
arm64                randconfig-r2101-20261010    gcc-10.5.0 cocci
arm64                randconfig-r2107-20261010    gcc-16.1.0 cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261010    gcc-10.5.0
csky                  randconfig-1001-20261010    gcc-10.5.0
csky                  randconfig-2000-20261010    gcc-16.1.0
csky                  randconfig-2001-20261010    gcc-16.1.0
csky                 randconfig-r2109-20261010    gcc-16.1.0 cocci
csky                 randconfig-r2111-20261010    gcc-16.1.0 cocci
csky                 randconfig-r2300-20261010    gcc-16.1.0 sparse
csky                 randconfig-r2306-20261010    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261010    clang-17
hexagon               randconfig-1001-20261010    clang-17
hexagon               randconfig-2000-20261010    gcc-16.1.0
hexagon               randconfig-2001-20261010    gcc-16.1.0
hexagon              randconfig-r2103-20261010    gcc-16.1.0 cocci
hexagon              randconfig-r2104-20261010    gcc-16.1.0 cocci
hexagon              randconfig-r2106-20261010    gcc-8.5.0  cocci
hexagon              randconfig-r2200-20261010    clang-24   smatch
hexagon              randconfig-r2306-20261010    gcc-16.1.0 sparse
hexagon              randconfig-r2310-20261010    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261010    gcc-14
i386        buildonly-randconfig-1001-20261010    gcc-14
i386        buildonly-randconfig-1002-20261010    gcc-14
i386        buildonly-randconfig-1003-20261010    gcc-14
i386        buildonly-randconfig-1004-20261010    gcc-14
i386        buildonly-randconfig-1005-20261010    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261010    clang-22
i386                  randconfig-1001-20261010    clang-22
i386                  randconfig-1002-20261010    clang-22
i386                  randconfig-1003-20261010    clang-22
i386                  randconfig-1004-20261010    clang-22
i386                  randconfig-1005-20261010    clang-22
i386                  randconfig-1006-20261010    clang-22
i386                  randconfig-1007-20261010    gcc-14
i386                  randconfig-1008-20261010    gcc-14
i386                  randconfig-1009-20261010    gcc-14
i386                  randconfig-1010-20261010    gcc-14
i386                  randconfig-1011-20261010    gcc-14
i386                  randconfig-1012-20261010    gcc-14
i386                  randconfig-1013-20261010    gcc-14
i386                  randconfig-2000-20261010    gcc-8.5.0
i386                  randconfig-2001-20261010    gcc-8.5.0
i386                  randconfig-2100-20261010    clang-22   cocci
i386                  randconfig-2100-20261010    gcc-13     cocci
i386                  randconfig-2101-20261010    clang-22   cocci
i386                  randconfig-2101-20261010    gcc-13     cocci
i386                  randconfig-2102-20261010    clang-22   cocci
i386                  randconfig-2102-20261010    gcc-13     cocci
i386                  randconfig-2103-20261010    clang-22   cocci
i386                  randconfig-2103-20261010    gcc-13     cocci
i386                  randconfig-2104-20261010    gcc-13     cocci
i386                  randconfig-2105-20261010    gcc-13     cocci
i386                  randconfig-2200-20261010    gcc-12     smatch
i386                  randconfig-2300-20261010    gcc-14     sparse
i386                  randconfig-2301-20261010    gcc-14     sparse
i386                  randconfig-2302-20261010    gcc-14     sparse
i386                 randconfig-r2102-20261010    gcc-16.1.0 cocci
i386                 randconfig-r2103-20261010    gcc-12.5.0 cocci
i386                 randconfig-r2301-20261010    gcc-8.5.0  sparse
i386                 randconfig-r2305-20261010    gcc-8.5.0  sparse
i386                 randconfig-r2308-20261010    gcc-16.1.0 sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261010    clang-17
loongarch             randconfig-1001-20261010    clang-17
loongarch             randconfig-2000-20261010    gcc-8.5.0
loongarch             randconfig-2001-20261010    gcc-8.5.0
loongarch            randconfig-r2105-20261010    gcc-8.5.0  cocci
loongarch            randconfig-r2108-20261010    gcc-12.5.0 cocci
loongarch            randconfig-r2304-20261010    gcc-8.5.0  sparse
loongarch            randconfig-r2309-20261010    gcc-16.1.0 sparse
loongarch            randconfig-r2311-20261010    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2100-20261010    gcc-12.5.0 cocci
m68k                 randconfig-r2110-20261010    gcc-16.1.0 cocci
m68k                 randconfig-r2303-20261010    gcc-8.5.0  sparse
m68k                 randconfig-r2307-20261010    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2103-20261010    gcc-10.5.0 cocci
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                      eyeq6lplus_defconfig    gcc-16.1.0
mips                            ip22_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261010    gcc-10.5.0 cocci
mips                 randconfig-r2105-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2106-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2200-20261010    gcc-14.3.0 smatch
mips                 randconfig-r2301-20261010    gcc-8.5.0  sparse
mips                 randconfig-r2309-20261010    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261010    clang-17
nios2                 randconfig-1001-20261010    clang-17
nios2                 randconfig-2000-20261010    gcc-8.5.0
nios2                 randconfig-2001-20261010    gcc-8.5.0
nios2                randconfig-r2101-20261010    gcc-16.1.0 cocci
nios2                randconfig-r2106-20261010    gcc-16.1.0 cocci
nios2                randconfig-r2106-20261010    gcc-8.5.0  cocci
nios2                randconfig-r2306-20261010    clang-22   sparse
nios2                randconfig-r2306-20261010    gcc-13.4.0 sparse
nios2                randconfig-r2309-20261010    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    gcc-16.1.0
openrisc             randconfig-r2102-20261010    clang-22   cocci
openrisc             randconfig-r2201-20261010    gcc-16.1.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-64bit_defconfig    gcc-16.1.0
parisc                randconfig-2000-20261010    gcc-8.5.0
parisc                randconfig-2001-20261010    gcc-8.5.0
parisc               randconfig-r2307-20261010    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.1.0
powerpc               randconfig-2000-20261010    gcc-14
powerpc               randconfig-2001-20261010    gcc-14
powerpc              randconfig-r2100-20261010    clang-22   cocci
powerpc              randconfig-r2107-20261010    clang-20   cocci
powerpc              randconfig-r2201-20261010    gcc-16.1.0 smatch
powerpc              randconfig-r2202-20261010    clang-17   smatch
powerpc              randconfig-r2301-20261010    gcc-16.1.0 sparse
powerpc              randconfig-r2302-20261010    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261010    clang-24   sparse
powerpc                       tqm8xx_defconfig    gcc-16.1.0
powerpc64             randconfig-2000-20261010    gcc-14
powerpc64             randconfig-2001-20261010    gcc-14
powerpc64            randconfig-r2104-20261010    clang-20   cocci
powerpc64            randconfig-r2307-20261010    gcc-13.4.0 sparse
powerpc64            randconfig-r2309-20261010    clang-22   sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261010    clang-19
riscv                 randconfig-1000-20261011    clang-17
riscv                 randconfig-1001-20261010    clang-19
riscv                 randconfig-1001-20261011    clang-17
riscv                 randconfig-2000-20261010    gcc-16.1.0
riscv                 randconfig-2001-20261010    gcc-16.1.0
riscv                randconfig-r2107-20261010    gcc-16.1.0 cocci
riscv                randconfig-r2110-20261010    gcc-16.1.0 cocci
riscv                randconfig-r2300-20261010    gcc-8.5.0  sparse
riscv                randconfig-r2304-20261010    gcc-8.5.0  sparse
riscv                randconfig-r2306-20261010    clang-24   sparse
riscv                randconfig-r2308-20261010    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261010    clang-19
s390                  randconfig-1000-20261011    clang-17
s390                  randconfig-1001-20261010    clang-19
s390                  randconfig-1001-20261011    clang-17
s390                  randconfig-2000-20261010    gcc-16.1.0
s390                  randconfig-2001-20261010    gcc-16.1.0
s390                 randconfig-r2102-20261010    gcc-10.5.0 cocci
s390                 randconfig-r2300-20261010    gcc-8.5.0  sparse
s390                 randconfig-r2305-20261010    gcc-16.1.0 sparse
s390                 randconfig-r2307-20261010    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261010    clang-19
sh                    randconfig-1000-20261011    clang-17
sh                    randconfig-1001-20261010    clang-19
sh                    randconfig-1001-20261011    clang-17
sh                    randconfig-2000-20261010    gcc-16.1.0
sh                    randconfig-2001-20261010    gcc-16.1.0
sh                   randconfig-r2101-20261010    gcc-12.5.0 cocci
sh                   randconfig-r2102-20261010    gcc-12.5.0 cocci
sh                   randconfig-r2105-20261010    gcc-16.1.0 cocci
sh                   randconfig-r2108-20261010    gcc-16.1.0 cocci
sh                   randconfig-r2111-20261010    gcc-16.1.0 cocci
sh                   randconfig-r2200-20261010    gcc-9.5.0  smatch
sh                   randconfig-r2201-20261010    gcc-15.2.0 smatch
sh                   randconfig-r2202-20261010    gcc-9.5.0  smatch
sh                   randconfig-r2310-20261010    clang-24   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261010    gcc-16.1.0
sparc                 randconfig-1001-20261010    gcc-16.1.0
sparc                 randconfig-2000-20261010    gcc-16.1.0
sparc                 randconfig-2001-20261010    gcc-16.1.0
sparc                randconfig-r2100-20261010    gcc-12.5.0 cocci
sparc                randconfig-r2106-20261010    clang-20   cocci
sparc                randconfig-r2109-20261010    gcc-12.5.0 cocci
sparc                randconfig-r2200-20261010    gcc-16.1.0 smatch
sparc                randconfig-r2304-20261010    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261010    gcc-16.1.0
sparc64               randconfig-1001-20261010    gcc-16.1.0
sparc64               randconfig-2000-20261010    gcc-16.1.0
sparc64               randconfig-2001-20261010    gcc-16.1.0
sparc64              randconfig-r2100-20261010    gcc-16.1.0 cocci
sparc64              randconfig-r2302-20261010    gcc-8.5.0  sparse
sparc64              randconfig-r2308-20261010    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261010    gcc-16.1.0
um                    randconfig-1001-20261010    gcc-16.1.0
um                    randconfig-2000-20261010    gcc-16.1.0
um                    randconfig-2001-20261010    gcc-16.1.0
um                   randconfig-r2105-20261010    clang-20   cocci
um                   randconfig-r2106-20261010    gcc-16.1.0 cocci
um                   randconfig-r2201-20261010    clang-17   smatch
um                   randconfig-r2309-20261010    gcc-13.4.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261010    clang-22
x86_64      buildonly-randconfig-1000-20261011    gcc-14
x86_64      buildonly-randconfig-1001-20261010    clang-22
x86_64      buildonly-randconfig-1001-20261011    gcc-14
x86_64      buildonly-randconfig-1002-20261010    clang-22
x86_64      buildonly-randconfig-1002-20261011    gcc-14
x86_64      buildonly-randconfig-1003-20261010    clang-22
x86_64      buildonly-randconfig-1003-20261011    gcc-14
x86_64      buildonly-randconfig-1004-20261010    clang-22
x86_64      buildonly-randconfig-1004-20261011    gcc-14
x86_64      buildonly-randconfig-1005-20261010    clang-22
x86_64      buildonly-randconfig-1005-20261011    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261010    gcc-14
x86_64                randconfig-1000-20261011    gcc-14
x86_64                randconfig-1001-20261010    gcc-14
x86_64                randconfig-1001-20261011    gcc-14
x86_64                randconfig-1002-20261010    gcc-14
x86_64                randconfig-1002-20261011    gcc-14
x86_64                randconfig-1003-20261010    gcc-14
x86_64                randconfig-1003-20261011    gcc-14
x86_64                randconfig-1004-20261010    gcc-14
x86_64                randconfig-1004-20261011    gcc-14
x86_64                randconfig-1005-20261010    gcc-14
x86_64                randconfig-1005-20261011    gcc-14
x86_64                randconfig-1006-20261010    clang-22
x86_64                randconfig-1007-20261010    clang-22
x86_64                randconfig-1008-20261010    clang-22
x86_64                randconfig-1009-20261010    clang-22
x86_64                randconfig-1010-20261010    clang-22
x86_64                randconfig-1011-20261010    clang-22
x86_64                randconfig-1012-20261010    clang-22
x86_64                randconfig-1013-20261010    clang-22
x86_64                randconfig-1014-20261010    clang-22
x86_64                randconfig-1015-20261010    clang-22
x86_64                randconfig-1016-20261010    clang-22
x86_64                randconfig-1017-20261010    clang-22
x86_64                randconfig-2000-20261010    gcc-14
x86_64                randconfig-2001-20261010    gcc-14
x86_64                randconfig-2100-20261010    clang-22   cocci
x86_64                randconfig-2101-20261010    clang-22   cocci
x86_64                randconfig-2102-20261010    clang-22   cocci
x86_64                randconfig-2103-20261010    clang-22   cocci
x86_64                randconfig-2104-20261010    clang-22   cocci
x86_64                randconfig-2105-20261010    clang-22   cocci
x86_64                randconfig-2200-20261010    gcc-14     smatch
x86_64                randconfig-2300-20261010    gcc-14     sparse
x86_64                randconfig-2301-20261010    gcc-14     sparse
x86_64                randconfig-2302-20261010    gcc-14     sparse
x86_64               randconfig-r2103-20261010    clang-22   cocci
x86_64               randconfig-r2104-20261010    gcc-8.5.0  cocci
x86_64               randconfig-r2201-20261010    clang-22   smatch
x86_64               randconfig-r2302-20261010    gcc-8.5.0  sparse
x86_64               randconfig-r2305-20261010    gcc-8.5.0  sparse
x86_64               randconfig-r2308-20261010    clang-22   sparse
x86_64               randconfig-r2311-20261010    clang-24   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261010    gcc-16.1.0
xtensa                randconfig-1001-20261010    gcc-16.1.0
xtensa                randconfig-2000-20261010    gcc-16.1.0
xtensa                randconfig-2001-20261010    gcc-16.1.0
xtensa               randconfig-r2101-20261010    gcc-12.5.0 cocci
xtensa               randconfig-r2104-20261010    gcc-8.5.0  cocci
xtensa               randconfig-r2202-20261010    gcc-8.5.0  smatch
xtensa               randconfig-r2300-20261010    gcc-8.5.0  sparse
xtensa               randconfig-r2301-20261010    gcc-8.5.0  sparse
xtensa               randconfig-r2302-20261010    gcc-16.1.0 sparse
xtensa               randconfig-r2306-20261010    gcc-8.5.0  sparse
xtensa               randconfig-r2307-20261010    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

