Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AC8CA601E
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/51sOb8WPe7a9lM8TcESyYaXoBg28lUuhvrgvTJ0Css=; b=WrGA+CGvgK4kmnE6e31CTsjLKW
	29qIVtK4yil8dF4zVQ4oOe1rjS2Ew8iFTjuaJN9JyhvLHmDdkjyYq1oNUU8P8AEJg6Lo+BwrLZ+TT
	Gw6RQxbMli1qSR4wxaOTni9z/JoAZ7yjjEZNjs7CEmMCEWO2AEBonO/lPPYqBSGxnWjtrgu2kZU2G
	bCYG55caBttsxU/SvPS5OtmCGQeoay2WC0wy7EPUJmuj/x71I2EkJ11ZU2s73OlNLdGafBvBiKBtx
	6nJMDYw6H7AgcqzOkiWDZF86LmYGdzDfP+LPvKiQc7xDZLmiuvUODi5nE9tKifHa45trLXhf0sFqb
	flk+hHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA0Z-00000006KMw-3CwL;
	Fri, 09 Oct 2026 12:47:31 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA0V-00000006KLY-0BrE
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 12:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791550047; x=1823086047;
  h=date:from:to:cc:subject:message-id;
  bh=n3v/byih93i0i/iTO8FdTjZtmXH2F8V+hYpa8cM9G/Y=;
  b=QRjkv4NqzV5OD0WGOSDA+KXWNwzE85Fha0LpPkgK0qp0vunl9dYGE484
   Ec491OUp/35t78ip8wFR/iTiiorEawAIfIC4kI48hnq6S2L4x4BWk3Tuw
   ktLr3jhjMB6EGca/sTfRjwtEhNQgNctKNqgBveGerE8L5nr8HEOTc+w6H
   w+q0L9ODSJVeV3tcNUuCiek9z6Uc+NJcolZwUXefh9qn3tng6reUBVjQA
   dWF1pKHv5N8hQItp93ZTygVoOPTXSBtwwk5xyZcXTy6/bkufh9JSozGmt
   OMwJe9IpPjx4dKyG/PGUP8/KEisefPZMU6FnQLLVv0sRYF//+v+Hdhrxz
   g==;
X-CSE-ConnectionGUID: dfS3PonuTIWebko0KPnPEA==
X-CSE-MsgGUID: e+H5hbb0S126M4Du+hYzzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="355933"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="355933"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:47:26 -0700
X-CSE-ConnectionGUID: P1Y1Fn7WQbaRJL0IJa5b1g==
X-CSE-MsgGUID: RqDiQgoNR8i/JQzY+wP7wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="304122"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Oct 2026 05:47:24 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFA0Q-000000005mK-3CtK;
	Fri, 09 Oct 2026 12:47:22 +0000
Date: Fri, 09 Oct 2026 20:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 cb741c66e84be2cee112c706c9141076e11b7dc5
Message-ID: <202610092003.wFH7L81H-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_054727_511963_312A6BE8 
X-CRM114-Status: UNSURE (   4.05  )
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
branch HEAD: cb741c66e84be2cee112c706c9141076e11b7dc5  wifi: ath12k: advertise interface MAC address pool

elapsed time: 1423m

configs tested: 345
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261008    gcc-8.5.0  cocci
alpha                randconfig-r2106-20261008    clang-24   cocci
alpha                randconfig-r2302-20261008    clang-22   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261009    gcc-10.5.0
arc                   randconfig-1001-20261009    gcc-10.5.0
arc                  randconfig-r2105-20261008    gcc-16.1.0 cocci
arc                  randconfig-r2202-20261008    gcc-15.2.0 smatch
arc                  randconfig-r2303-20261008    gcc-10.5.0 sparse
arc                  randconfig-r2307-20261008    gcc-13.4.0 sparse
arc                  randconfig-r2309-20261008    gcc-14.3.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             mps2_defconfig    clang-24
arm                   randconfig-1000-20261009    gcc-10.5.0
arm                   randconfig-1001-20261009    gcc-10.5.0
arm                   randconfig-1002-20261009    gcc-10.5.0
arm                   randconfig-1003-20261009    gcc-10.5.0
arm                  randconfig-r2101-20261008    gcc-8.5.0  cocci
arm                  randconfig-r2104-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2107-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2201-20261008    gcc-8.5.0  smatch
arm                  randconfig-r2300-20261008    clang-22   sparse
arm                  randconfig-r2300-20261008    gcc-10.5.0 sparse
arm                  randconfig-r2302-20261008    gcc-16.1.0 sparse
arm                  randconfig-r2303-20261008    gcc-16.1.0 sparse
arm                  randconfig-r2307-20261008    gcc-12.5.0 sparse
arm                  randconfig-r2309-20261008    gcc-12.5.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261009    gcc-15.2.0
arm64                 randconfig-1001-20261009    gcc-15.2.0
arm64                 randconfig-1002-20261009    gcc-15.2.0
arm64                 randconfig-1003-20261009    gcc-15.2.0
arm64                randconfig-r2106-20261008    gcc-14.3.0 cocci
arm64                randconfig-r2107-20261008    clang-24   cocci
arm64                randconfig-r2202-20261008    clang-24   smatch
arm64                randconfig-r2300-20261008    clang-22   sparse
arm64                randconfig-r2303-20261008    clang-22   sparse
arm64                randconfig-r2304-20261008    gcc-10.5.0 sparse
arm64                randconfig-r2306-20261008    gcc-13.4.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261009    gcc-15.2.0
csky                  randconfig-1001-20261009    gcc-15.2.0
csky                 randconfig-r2105-20261008    clang-24   cocci
csky                 randconfig-r2107-20261008    clang-24   cocci
csky                 randconfig-r2201-20261008    gcc-11.5.0 smatch
csky                 randconfig-r2300-20261008    gcc-16.1.0 sparse
csky                 randconfig-r2301-20261008    gcc-10.5.0 sparse
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261009    clang-18
hexagon               randconfig-1001-20261009    clang-18
hexagon              randconfig-r2103-20261008    gcc-8.5.0  cocci
hexagon              randconfig-r2105-20261008    clang-24   cocci
hexagon              randconfig-r2201-20261008    clang-24   smatch
hexagon              randconfig-r2304-20261008    gcc-16.1.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261009    clang-22
i386        buildonly-randconfig-1001-20261009    clang-22
i386        buildonly-randconfig-1002-20261009    clang-22
i386        buildonly-randconfig-1003-20261009    clang-22
i386        buildonly-randconfig-1004-20261009    clang-22
i386        buildonly-randconfig-1005-20261009    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261009    clang-22
i386                  randconfig-1001-20261009    clang-22
i386                  randconfig-1002-20261009    clang-22
i386                  randconfig-1003-20261009    clang-22
i386                  randconfig-1004-20261009    clang-22
i386                  randconfig-1005-20261009    clang-22
i386                  randconfig-1006-20261009    clang-22
i386                  randconfig-1007-20261009    clang-22
i386                  randconfig-1008-20261009    clang-22
i386                  randconfig-1009-20261009    clang-22
i386                  randconfig-1010-20261009    clang-22
i386                  randconfig-1011-20261009    clang-22
i386                  randconfig-1012-20261009    clang-22
i386                  randconfig-1013-20261009    clang-22
i386                  randconfig-2100-20261008    clang-22   cocci
i386                  randconfig-2101-20261008    clang-22   cocci
i386                  randconfig-2102-20261008    clang-22   cocci
i386                  randconfig-2103-20261008    clang-22   cocci
i386                  randconfig-2200-20261008    clang-22   smatch
i386                  randconfig-2300-20261008    clang-22   sparse
i386                  randconfig-2301-20261008    clang-22   sparse
i386                  randconfig-2302-20261008    clang-22   sparse
i386                 randconfig-r2100-20261008    gcc-8.5.0  cocci
i386                 randconfig-r2102-20261008    clang-22   cocci
i386                 randconfig-r2202-20261008    clang-22   smatch
i386                 randconfig-r2300-20261008    gcc-10.5.0 sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261009    clang-18
loongarch             randconfig-1001-20261009    clang-18
loongarch            randconfig-r2100-20261008    gcc-12.5.0 cocci
loongarch            randconfig-r2200-20261008    gcc-13.4.0 smatch
loongarch            randconfig-r2202-20261008    gcc-13.4.0 smatch
loongarch            randconfig-r2308-20261008    gcc-14.3.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    clang-24
m68k                 randconfig-r2202-20261008    gcc-8.5.0  smatch
m68k                 randconfig-r2306-20261008    gcc-15.2.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2103-20261008    gcc-12.5.0 cocci
microblaze           randconfig-r2105-20261008    gcc-14.3.0 cocci
microblaze           randconfig-r2305-20261008    gcc-10.5.0 sparse
microblaze           randconfig-r2309-20261008    gcc-13.4.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm63xx_defconfig    clang-24
mips                            ci20_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261008    gcc-8.5.0  cocci
mips                 randconfig-r2202-20261008    gcc-15.2.0 smatch
mips                 randconfig-r2301-20261008    gcc-10.5.0 sparse
mips                 randconfig-r2307-20261008    clang-24   sparse
nios2                             alldefconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261009    clang-18
nios2                 randconfig-1001-20261009    clang-18
nios2                randconfig-r2100-20261008    gcc-8.5.0  cocci
nios2                randconfig-r2301-20261008    gcc-16.1.0 sparse
nios2                randconfig-r2302-20261008    gcc-10.5.0 sparse
nios2                randconfig-r2305-20261008    gcc-10.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20261008    clang-22   cocci
openrisc             randconfig-r2101-20261008    gcc-12.5.0 cocci
openrisc             randconfig-r2106-20261008    gcc-16.1.0 cocci
openrisc             randconfig-r2200-20261008    gcc-16.1.0 smatch
openrisc             randconfig-r2201-20261008    gcc-13.4.0 smatch
openrisc             randconfig-r2301-20261008    gcc-15.2.0 sparse
openrisc             randconfig-r2309-20261008    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261009    gcc-8.5.0
parisc                randconfig-1001-20261009    gcc-8.5.0
parisc               randconfig-r2101-20261008    gcc-8.5.0  cocci
parisc               randconfig-r2104-20261008    gcc-16.1.0 cocci
parisc               randconfig-r2200-20261008    gcc-13.4.0 smatch
parisc               randconfig-r2302-20261008    clang-22   sparse
parisc               randconfig-r2308-20261008    gcc-14.3.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.1.0
powerpc                       chrp32_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc               randconfig-1000-20261009    gcc-8.5.0
powerpc               randconfig-1001-20261009    gcc-8.5.0
powerpc              randconfig-r2100-20261008    clang-22   cocci
powerpc              randconfig-r2100-20261008    gcc-8.5.0  cocci
powerpc              randconfig-r2103-20261008    clang-22   cocci
powerpc              randconfig-r2104-20261008    gcc-14.3.0 cocci
powerpc              randconfig-r2105-20261008    gcc-16.1.0 cocci
powerpc              randconfig-r2106-20261008    clang-24   cocci
powerpc              randconfig-r2107-20261008    clang-24   cocci
powerpc              randconfig-r2201-20261008    clang-17   smatch
powerpc              randconfig-r2304-20261008    clang-22   sparse
powerpc              randconfig-r2305-20261008    clang-22   sparse
powerpc              randconfig-r2308-20261008    clang-24   sparse
powerpc64             randconfig-1000-20261009    gcc-8.5.0
powerpc64             randconfig-1001-20261009    gcc-8.5.0
powerpc64            randconfig-r2102-20261008    gcc-8.5.0  cocci
powerpc64            randconfig-r2107-20261008    gcc-16.1.0 cocci
powerpc64            randconfig-r2200-20261008    gcc-13.4.0 smatch
riscv                             alldefconfig    gcc-16.1.0
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261009    gcc-16.1.0
riscv                 randconfig-1001-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261008    gcc-11.5.0
riscv                 randconfig-2001-20261008    gcc-11.5.0
riscv                randconfig-r2103-20261008    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261008    clang-24   cocci
riscv                randconfig-r2105-20261008    clang-24   cocci
riscv                randconfig-r2106-20261008    gcc-8.5.0  cocci
riscv                randconfig-r2300-20261008    clang-22   sparse
riscv                randconfig-r2304-20261008    clang-22   sparse
riscv                randconfig-r2307-20261008    clang-24   sparse
riscv                randconfig-r2309-20261008    gcc-15.2.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261009    gcc-16.1.0
s390                  randconfig-1001-20261009    gcc-16.1.0
s390                  randconfig-2000-20261008    gcc-11.5.0
s390                  randconfig-2001-20261008    gcc-11.5.0
s390                 randconfig-r2102-20261008    gcc-8.5.0  cocci
s390                 randconfig-r2107-20261008    gcc-8.5.0  cocci
s390                 randconfig-r2305-20261008    gcc-16.1.0 sparse
s390                 randconfig-r2306-20261008    gcc-14.3.0 sparse
s390                 randconfig-r2309-20261008    clang-24   sparse
s390                 randconfig-r2309-20261008    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                    randconfig-1000-20261009    gcc-16.1.0
sh                    randconfig-1001-20261009    gcc-16.1.0
sh                    randconfig-2000-20261008    gcc-11.5.0
sh                    randconfig-2001-20261008    gcc-11.5.0
sh                   randconfig-r2103-20261008    gcc-8.5.0  cocci
sh                   randconfig-r2200-20261008    gcc-16.1.0 smatch
sh                   randconfig-r2202-20261008    gcc-16.1.0 smatch
sh                   randconfig-r2301-20261008    clang-22   sparse
sh                   randconfig-r2302-20261008    clang-22   sparse
sh                   randconfig-r2303-20261008    clang-22   sparse
sh                   randconfig-r2303-20261008    gcc-15.2.0 sparse
sh                   randconfig-r2308-20261008    gcc-12.5.0 sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261009    clang-18
sparc                 randconfig-1001-20261009    clang-18
sparc                 randconfig-2000-20261008    gcc-14
sparc                 randconfig-2000-20261008    gcc-8.5.0
sparc                 randconfig-2001-20261008    gcc-11.5.0
sparc                 randconfig-2001-20261008    gcc-14
sparc                randconfig-r2104-20261008    gcc-8.5.0  cocci
sparc                randconfig-r2105-20261008    gcc-8.5.0  cocci
sparc                randconfig-r2106-20261008    gcc-16.1.0 cocci
sparc                randconfig-r2107-20261008    gcc-14.3.0 cocci
sparc                randconfig-r2201-20261008    gcc-8.5.0  smatch
sparc                randconfig-r2300-20261008    gcc-15.2.0 sparse
sparc                randconfig-r2301-20261008    clang-22   sparse
sparc                randconfig-r2302-20261008    gcc-15.2.0 sparse
sparc                randconfig-r2304-20261008    gcc-10.5.0 sparse
sparc                randconfig-r2304-20261008    gcc-15.2.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261009    clang-18
sparc64               randconfig-1001-20261009    clang-18
sparc64               randconfig-2000-20261008    gcc-14
sparc64               randconfig-2000-20261008    gcc-16.1.0
sparc64               randconfig-2001-20261008    clang-20
sparc64               randconfig-2001-20261008    gcc-14
sparc64              randconfig-r2100-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2101-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2102-20261008    gcc-12.5.0 cocci
sparc64              randconfig-r2102-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2307-20261008    gcc-15.2.0 sparse
sparc64              randconfig-r2308-20261008    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261009    clang-18
um                    randconfig-1001-20261009    clang-18
um                    randconfig-2000-20261008    gcc-14
um                    randconfig-2001-20261008    gcc-14
um                   randconfig-r2104-20261008    clang-24   cocci
um                   randconfig-r2306-20261008    clang-24   sparse
um                   randconfig-r2307-20261008    gcc-14.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261009    clang-22
x86_64      buildonly-randconfig-1001-20261009    clang-22
x86_64      buildonly-randconfig-1002-20261009    clang-22
x86_64      buildonly-randconfig-1003-20261009    clang-22
x86_64      buildonly-randconfig-1004-20261009    clang-22
x86_64      buildonly-randconfig-1005-20261009    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261009    gcc-14
x86_64                randconfig-1001-20261009    gcc-14
x86_64                randconfig-1002-20261009    gcc-14
x86_64                randconfig-1003-20261009    gcc-14
x86_64                randconfig-1004-20261009    gcc-14
x86_64                randconfig-1005-20261009    gcc-14
x86_64                randconfig-1012-20261009    gcc-14
x86_64                randconfig-1013-20261009    gcc-14
x86_64                randconfig-1014-20261009    gcc-14
x86_64                randconfig-1015-20261009    gcc-14
x86_64                randconfig-1016-20261009    gcc-14
x86_64                randconfig-1017-20261009    gcc-14
x86_64                randconfig-2100-20261008    clang-22   cocci
x86_64                randconfig-2101-20261008    clang-22   cocci
x86_64                randconfig-2102-20261008    clang-22   cocci
x86_64                randconfig-2103-20261008    clang-22   cocci
x86_64                randconfig-2200-20261008    gcc-14     smatch
x86_64                randconfig-2300-20261008    clang-22   sparse
x86_64                randconfig-2301-20261008    clang-22   sparse
x86_64                randconfig-2302-20261008    clang-22   sparse
x86_64               randconfig-r2106-20261008    clang-24   cocci
x86_64               randconfig-r2303-20261008    gcc-10.5.0 sparse
x86_64               randconfig-r2305-20261008    clang-22   sparse
x86_64               randconfig-r2305-20261008    gcc-15.2.0 sparse
x86_64               randconfig-r2308-20261008    gcc-13.4.0 sparse
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
xtensa                   audio_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20261009    clang-18
xtensa                randconfig-1001-20261009    clang-18
xtensa                randconfig-2000-20261008    gcc-14
xtensa                randconfig-2000-20261008    gcc-8.5.0
xtensa                randconfig-2001-20261008    gcc-14
xtensa                randconfig-2001-20261008    gcc-8.5.0
xtensa               randconfig-r2102-20261008    gcc-8.5.0  cocci
xtensa               randconfig-r2201-20261008    gcc-13.4.0 smatch
xtensa               randconfig-r2301-20261008    clang-22   sparse
xtensa               randconfig-r2305-20261008    clang-22   sparse
xtensa               randconfig-r2306-20261008    clang-24   sparse
xtensa               randconfig-r2306-20261008    gcc-12.5.0 sparse
xtensa               randconfig-r2307-20261008    gcc-14.3.0 sparse
xtensa               randconfig-r2308-20261008    gcc-15.2.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

