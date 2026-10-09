Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605E7CA9EBB
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Yi305B1JnHvhXWi977LW/gMVf4WDTE96/8qzv2P6wc=; b=ezRuafaM1WMqZuCbLqhfBrTRz9
	uA4MUv9h2nU4Ej/wB2ndFA0gJxSKWyjmACiihIkyq366f2xD3sO/3rSGf7q33JG0r4DKhnpfU9Opc
	XbHUtUiGy3Ww2gxTUzEZLlkVwusGy4tnoNZRYxEHavDNtpd1wLiIb3Wk4ZJDJDdYv6ptUWsH5Poj1
	3TagqyrJH4rZg7ecYZbg/mkhQBcn2yhIqAfJJQGb/O3VTYUFv0lJAjs7g9PwyB/p2uQc297lPIrhP
	MN39VQ1h6vFyOwLqiuT5PWKKutUyB8h8sK+qQBeS9tatpMti4gI0oaLe9l8RXZvgyngO1DU39O0oU
	ympFEWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA0b-00000006KNh-0Fy6;
	Fri, 09 Oct 2026 12:47:33 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA0W-00000006KM1-49uI
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 12:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791550049; x=1823086049;
  h=date:from:to:cc:subject:message-id;
  bh=fN/S/vpnFnnVBkm2N+WFXqLo9AfXhs3fh6mv3J6+Mgk=;
  b=kRXj78KOP5YGvCWvADvshGVWhaaXBvSrfGK3x+4Vvw/4mX97tgvq8YVq
   VYGBgUPnwe+8mc5ISi1KzqNlRVHII/guNC0V/xzrKd+LfQtOUZcJoZ+Ef
   hzr4gAM+qBxnokoOV1j8EXZSmNKNBqFXhA7gsY9AlQZWtlUqOzqHSp6Cs
   RzJ9AjlembTX/6SMCs6r8FRlFCT23jk3VsTxDkWBxzeTYJh8JS6f8DSIe
   eaTHzFiYfwvLfhdS8/P2KpGDZBZj4X4+Kc6qQrqI8JpTctxO05gNC47Gr
   raVkoSHeZqxxfjh13g5DQ8BEDJ35eihew4lzVpidc2ngayowsT0SCZV23
   A==;
X-CSE-ConnectionGUID: ndKLQo8xSEmhYyBDzkdLuQ==
X-CSE-MsgGUID: 0IbJTJqWRQW2wGzv5uoQ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="355938"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="355938"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:47:26 -0700
X-CSE-ConnectionGUID: BFGCMKUCR6WrunsVpXRADA==
X-CSE-MsgGUID: A5HRIuvnSB2nzUtB+7k5sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="304126"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Oct 2026 05:47:24 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFA0Q-000000005mG-2YrU;
	Fri, 09 Oct 2026 12:47:22 +0000
Date: Fri, 09 Oct 2026 20:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-current] BUILD SUCCESS
 08a3f02fea636e97a7422d1512f76dacdb5b0887
Message-ID: <202610092031.dX3dtSkO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_054729_095478_50698108 
X-CRM114-Status: UNSURE (   3.86  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-current
branch HEAD: 08a3f02fea636e97a7422d1512f76dacdb5b0887  wifi: brcmfmac: fix P2P device removal race in brcmf_detach()

elapsed time: 1422m

configs tested: 458
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261008    gcc-9.5.0  cocci
alpha                randconfig-r2102-20261008    clang-22   cocci
alpha                randconfig-r2102-20261008    gcc-12.5.0 cocci
alpha                randconfig-r2105-20261007    gcc-9.5.0  cocci
alpha                randconfig-r2107-20261008    gcc-8.5.0  cocci
alpha                randconfig-r2201-20261007    gcc-13.4.0 smatch
alpha                randconfig-r2202-20261007    gcc-8.5.0  smatch
alpha                randconfig-r2304-20261007    clang-24   sparse
alpha                randconfig-r2307-20261007    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261009    gcc-10.5.0
arc                   randconfig-1001-20261009    gcc-10.5.0
arc                  randconfig-r2102-20261007    clang-24   cocci
arc                  randconfig-r2104-20261007    clang-24   cocci
arc                  randconfig-r2104-20261008    gcc-8.5.0  cocci
arc                  randconfig-r2105-20261007    gcc-9.5.0  cocci
arc                  randconfig-r2300-20261007    gcc-8.5.0  sparse
arc                  randconfig-r2300-20261008    clang-24   sparse
arc                  randconfig-r2302-20261007    gcc-8.5.0  sparse
arc                  randconfig-r2302-20261007    gcc-9.5.0  sparse
arc                  randconfig-r2304-20261008    clang-24   sparse
arc                  randconfig-r2304-20261008    gcc-16.1.0 sparse
arc                  randconfig-r2307-20261007    gcc-8.5.0  sparse
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
arm                  randconfig-r2102-20261007    clang-20   cocci
arm                  randconfig-r2104-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2107-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2107-20261008    gcc-8.5.0  cocci
arm                  randconfig-r2200-20261007    gcc-12.5.0 smatch
arm                  randconfig-r2200-20261008    clang-17   smatch
arm                  randconfig-r2201-20261007    clang-17   smatch
arm                  randconfig-r2201-20261008    gcc-8.5.0  smatch
arm                  randconfig-r2202-20261007    gcc-12.5.0 smatch
arm                  randconfig-r2300-20261007    gcc-14.3.0 sparse
arm                  randconfig-r2300-20261008    gcc-10.5.0 sparse
arm                  randconfig-r2304-20261007    clang-20   sparse
arm                  randconfig-r2304-20261007    gcc-9.5.0  sparse
arm                  randconfig-r2305-20261007    clang-18   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261009    gcc-15.2.0
arm64                 randconfig-1001-20261009    gcc-15.2.0
arm64                 randconfig-1002-20261009    gcc-15.2.0
arm64                 randconfig-1003-20261009    gcc-15.2.0
arm64                randconfig-r2304-20261008    gcc-10.5.0 sparse
arm64                randconfig-r2305-20261007    gcc-9.5.0  sparse
arm64                randconfig-r2306-20261007    clang-17   sparse
arm64                randconfig-r2306-20261007    gcc-14     sparse
arm64                randconfig-r2307-20261008    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261009    gcc-15.2.0
csky                  randconfig-1001-20261009    gcc-15.2.0
csky                 randconfig-r2100-20261007    clang-20   cocci
csky                 randconfig-r2100-20261007    gcc-16.1.0 cocci
csky                 randconfig-r2102-20261007    gcc-10.5.0 cocci
csky                 randconfig-r2104-20261007    gcc-16.1.0 cocci
csky                 randconfig-r2106-20261007    gcc-9.5.0  cocci
csky                 randconfig-r2200-20261007    gcc-10.5.0 smatch
csky                 randconfig-r2300-20261007    gcc-9.5.0  sparse
csky                 randconfig-r2301-20261008    gcc-10.5.0 sparse
csky                 randconfig-r2304-20261007    gcc-8.5.0  sparse
csky                 randconfig-r2306-20261007    gcc-13.4.0 sparse
csky                 randconfig-r2307-20261007    gcc-13.4.0 sparse
csky                 randconfig-r2307-20261008    gcc-8.5.0  sparse
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261009    clang-18
hexagon               randconfig-1001-20261009    clang-18
hexagon              randconfig-r2302-20261007    clang-17   sparse
hexagon              randconfig-r2304-20261007    gcc-9.5.0  sparse
hexagon              randconfig-r2309-20261007    gcc-8.5.0  sparse
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
i386                  randconfig-2100-20261007    clang-22   cocci
i386                  randconfig-2100-20261008    clang-22   cocci
i386                  randconfig-2101-20261007    clang-22   cocci
i386                  randconfig-2101-20261008    clang-22   cocci
i386                  randconfig-2102-20261007    clang-22   cocci
i386                  randconfig-2102-20261008    clang-22   cocci
i386                  randconfig-2103-20261007    clang-22   cocci
i386                  randconfig-2103-20261007    gcc-13     cocci
i386                  randconfig-2103-20261008    clang-22   cocci
i386                  randconfig-2200-20261007    gcc-14     smatch
i386                  randconfig-2200-20261008    clang-22   smatch
i386                  randconfig-2300-20261007    clang-22   sparse
i386                  randconfig-2300-20261008    clang-22   sparse
i386                  randconfig-2301-20261007    clang-22   sparse
i386                  randconfig-2301-20261008    clang-22   sparse
i386                  randconfig-2302-20261007    clang-22   sparse
i386                  randconfig-2302-20261008    clang-22   sparse
i386                 randconfig-r2100-20261007    gcc-10.5.0 cocci
i386                 randconfig-r2101-20261008    clang-22   cocci
i386                 randconfig-r2106-20261007    gcc-9.5.0  cocci
i386                 randconfig-r2302-20261008    gcc-16.1.0 sparse
i386                 randconfig-r2303-20261007    gcc-14     sparse
i386                 randconfig-r2304-20261008    gcc-13.4.0 sparse
i386                 randconfig-r2307-20261008    gcc-14     sparse
i386                 randconfig-r2309-20261007    gcc-14     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261009    clang-18
loongarch             randconfig-1001-20261009    clang-18
loongarch            randconfig-r2100-20261007    clang-24   cocci
loongarch            randconfig-r2100-20261008    gcc-12.5.0 cocci
loongarch            randconfig-r2101-20261008    gcc-9.5.0  cocci
loongarch            randconfig-r2106-20261007    clang-24   cocci
loongarch            randconfig-r2107-20261007    gcc-16.1.0 cocci
loongarch            randconfig-r2200-20261007    clang-24   smatch
loongarch            randconfig-r2202-20261007    gcc-16.1.0 smatch
loongarch            randconfig-r2307-20261008    clang-24   sparse
loongarch            randconfig-r2309-20261007    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    clang-24
m68k                 randconfig-r2101-20261007    clang-20   cocci
m68k                 randconfig-r2101-20261007    gcc-10.5.0 cocci
m68k                 randconfig-r2105-20261008    gcc-8.5.0  cocci
m68k                 randconfig-r2200-20261008    gcc-16.1.0 smatch
m68k                 randconfig-r2202-20261007    gcc-15.2.0 smatch
m68k                 randconfig-r2202-20261008    gcc-8.5.0  smatch
m68k                 randconfig-r2300-20261007    gcc-8.5.0  sparse
m68k                 randconfig-r2300-20261008    gcc-13.4.0 sparse
m68k                 randconfig-r2302-20261007    clang-24   sparse
m68k                 randconfig-r2304-20261007    clang-18   sparse
m68k                 randconfig-r2305-20261007    gcc-14.3.0 sparse
m68k                 randconfig-r2307-20261007    clang-17   sparse
m68k                 randconfig-r2309-20261008    gcc-14     sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261007    clang-20   cocci
microblaze           randconfig-r2102-20261008    clang-24   cocci
microblaze           randconfig-r2105-20261007    gcc-9.5.0  cocci
microblaze           randconfig-r2300-20261007    clang-18   sparse
microblaze           randconfig-r2301-20261007    gcc-14.3.0 sparse
microblaze           randconfig-r2301-20261007    gcc-8.5.0  sparse
microblaze           randconfig-r2301-20261008    gcc-16.1.0 sparse
microblaze           randconfig-r2304-20261007    gcc-14.3.0 sparse
microblaze           randconfig-r2305-20261008    gcc-10.5.0 sparse
microblaze           randconfig-r2305-20261008    gcc-16.1.0 sparse
microblaze           randconfig-r2308-20261008    gcc-14     sparse
microblaze           randconfig-r2309-20261007    clang-17   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm63xx_defconfig    clang-24
mips                            ci20_defconfig    gcc-16.1.0
mips                 randconfig-r2104-20261007    clang-17   cocci
mips                 randconfig-r2105-20261007    clang-17   cocci
mips                 randconfig-r2107-20261008    gcc-16.1.0 cocci
mips                 randconfig-r2201-20261007    clang-24   smatch
mips                 randconfig-r2202-20261007    clang-17   smatch
mips                 randconfig-r2301-20261007    gcc-9.5.0  sparse
mips                 randconfig-r2306-20261008    clang-24   sparse
mips                 randconfig-r2308-20261007    gcc-8.5.0  sparse
mips                 randconfig-r2309-20261007    gcc-11.5.0 sparse
nios2                             alldefconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261009    clang-18
nios2                 randconfig-1001-20261009    clang-18
nios2                randconfig-r2102-20261008    gcc-9.5.0  cocci
nios2                randconfig-r2103-20261008    gcc-12.5.0 cocci
nios2                randconfig-r2104-20261008    gcc-8.5.0  cocci
nios2                randconfig-r2106-20261007    clang-17   cocci
nios2                randconfig-r2106-20261007    gcc-16.1.0 cocci
nios2                randconfig-r2301-20261007    gcc-14.3.0 sparse
nios2                randconfig-r2301-20261008    clang-24   sparse
nios2                randconfig-r2302-20261007    gcc-9.5.0  sparse
nios2                randconfig-r2302-20261008    gcc-10.5.0 sparse
nios2                randconfig-r2303-20261007    gcc-9.5.0  sparse
nios2                randconfig-r2305-20261007    clang-24   sparse
nios2                randconfig-r2306-20261008    gcc-8.5.0  sparse
nios2                randconfig-r2307-20261007    gcc-14     sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20261007    clang-24   cocci
openrisc             randconfig-r2104-20261007    gcc-9.5.0  cocci
openrisc             randconfig-r2104-20261008    gcc-16.1.0 cocci
openrisc             randconfig-r2202-20261008    gcc-15.2.0 smatch
openrisc             randconfig-r2301-20261007    clang-24   sparse
openrisc             randconfig-r2305-20261007    gcc-16.1.0 sparse
openrisc             randconfig-r2305-20261008    clang-24   sparse
openrisc             randconfig-r2308-20261007    gcc-11.5.0 sparse
openrisc             randconfig-r2309-20261007    gcc-13.4.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261009    gcc-8.5.0
parisc                randconfig-1001-20261009    gcc-8.5.0
parisc               randconfig-r2300-20261008    gcc-16.1.0 sparse
parisc               randconfig-r2301-20261008    gcc-13.4.0 sparse
parisc               randconfig-r2302-20261007    gcc-14.3.0 sparse
parisc               randconfig-r2303-20261007    gcc-8.5.0  sparse
parisc               randconfig-r2303-20261007    gcc-9.5.0  sparse
parisc               randconfig-r2304-20261007    gcc-8.5.0  sparse
parisc               randconfig-r2305-20261007    gcc-8.5.0  sparse
parisc               randconfig-r2305-20261008    gcc-13.4.0 sparse
parisc               randconfig-r2309-20261008    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.1.0
powerpc                       chrp32_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc               randconfig-1000-20261009    gcc-8.5.0
powerpc               randconfig-1001-20261009    gcc-8.5.0
powerpc              randconfig-r2100-20261007    clang-20   cocci
powerpc              randconfig-r2105-20261008    gcc-16.1.0 cocci
powerpc              randconfig-r2107-20261007    clang-17   cocci
powerpc              randconfig-r2200-20261007    clang-17   smatch
powerpc              randconfig-r2201-20261007    clang-24   smatch
powerpc64             randconfig-1000-20261009    gcc-8.5.0
powerpc64             randconfig-1001-20261009    gcc-8.5.0
powerpc64            randconfig-r2103-20261007    gcc-10.5.0 cocci
powerpc64            randconfig-r2103-20261008    clang-22   cocci
powerpc64            randconfig-r2105-20261008    gcc-8.5.0  cocci
powerpc64            randconfig-r2107-20261007    clang-24   cocci
powerpc64            randconfig-r2201-20261007    clang-24   smatch
powerpc64            randconfig-r2300-20261007    clang-24   sparse
powerpc64            randconfig-r2302-20261007    gcc-8.5.0  sparse
powerpc64            randconfig-r2303-20261008    clang-24   sparse
powerpc64            randconfig-r2308-20261007    gcc-14     sparse
riscv                             alldefconfig    gcc-16.1.0
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261009    gcc-16.1.0
riscv                 randconfig-1001-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261007    gcc-12.5.0
riscv                 randconfig-2000-20261008    gcc-11.5.0
riscv                 randconfig-2001-20261007    gcc-12.5.0
riscv                 randconfig-2001-20261008    gcc-11.5.0
riscv                randconfig-r2101-20261008    clang-24   cocci
riscv                randconfig-r2103-20261008    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261007    gcc-9.5.0  cocci
riscv                randconfig-r2106-20261008    gcc-8.5.0  cocci
riscv                randconfig-r2201-20261007    clang-24   smatch
riscv                randconfig-r2202-20261007    gcc-12.5.0 smatch
riscv                randconfig-r2303-20261007    clang-18   sparse
riscv                randconfig-r2307-20261008    clang-24   sparse
riscv                randconfig-r2308-20261007    clang-17   sparse
riscv                randconfig-r2308-20261008    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261009    gcc-16.1.0
s390                  randconfig-1001-20261009    gcc-16.1.0
s390                  randconfig-2000-20261007    gcc-12.5.0
s390                  randconfig-2000-20261008    gcc-11.5.0
s390                  randconfig-2001-20261007    gcc-12.5.0
s390                  randconfig-2001-20261008    gcc-11.5.0
s390                 randconfig-r2100-20261008    clang-24   cocci
s390                 randconfig-r2200-20261007    clang-22   smatch
s390                 randconfig-r2201-20261008    gcc-11.5.0 smatch
s390                 randconfig-r2202-20261008    clang-17   smatch
s390                 randconfig-r2300-20261007    gcc-9.5.0  sparse
s390                 randconfig-r2301-20261007    gcc-9.5.0  sparse
s390                 randconfig-r2302-20261008    clang-24   sparse
s390                 randconfig-r2303-20261007    gcc-8.5.0  sparse
s390                 randconfig-r2305-20261007    gcc-8.5.0  sparse
s390                 randconfig-r2306-20261007    clang-24   sparse
s390                 randconfig-r2308-20261007    clang-24   sparse
s390                 randconfig-r2309-20261008    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                    randconfig-1000-20261009    gcc-16.1.0
sh                    randconfig-1001-20261009    gcc-16.1.0
sh                    randconfig-2000-20261007    gcc-12.5.0
sh                    randconfig-2000-20261008    gcc-11.5.0
sh                    randconfig-2001-20261007    gcc-12.5.0
sh                    randconfig-2001-20261008    gcc-11.5.0
sh                   randconfig-r2200-20261008    gcc-16.1.0 smatch
sh                   randconfig-r2301-20261007    clang-18   sparse
sh                   randconfig-r2302-20261008    gcc-13.4.0 sparse
sh                   randconfig-r2303-20261008    gcc-16.1.0 sparse
sh                   randconfig-r2306-20261007    gcc-8.5.0  sparse
sh                   randconfig-r2306-20261008    clang-24   sparse
sh                   randconfig-r2308-20261007    gcc-13.4.0 sparse
sh                   randconfig-r2308-20261008    clang-24   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261009    clang-18
sparc                 randconfig-1001-20261009    clang-18
sparc                 randconfig-2000-20261007    clang-24
sparc                 randconfig-2000-20261008    gcc-14
sparc                 randconfig-2001-20261007    clang-24
sparc                 randconfig-2001-20261008    gcc-14
sparc                randconfig-r2102-20261007    clang-20   cocci
sparc                randconfig-r2103-20261008    clang-24   cocci
sparc                randconfig-r2106-20261008    gcc-16.1.0 cocci
sparc                randconfig-r2301-20261007    gcc-8.5.0  sparse
sparc                randconfig-r2303-20261007    clang-24   sparse
sparc                randconfig-r2303-20261008    gcc-13.4.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261009    clang-18
sparc64               randconfig-1001-20261009    clang-18
sparc64               randconfig-2000-20261007    clang-24
sparc64               randconfig-2000-20261008    gcc-14
sparc64               randconfig-2001-20261007    clang-24
sparc64               randconfig-2001-20261008    gcc-14
sparc64              randconfig-r2100-20261008    clang-22   cocci
sparc64              randconfig-r2100-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2101-20261007    gcc-16.1.0 cocci
sparc64              randconfig-r2102-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2103-20261007    clang-20   cocci
sparc64              randconfig-r2103-20261007    clang-24   cocci
sparc64              randconfig-r2106-20261007    gcc-9.5.0  cocci
sparc64              randconfig-r2106-20261008    gcc-16.1.0 cocci
sparc64              randconfig-r2107-20261007    gcc-9.5.0  cocci
sparc64              randconfig-r2300-20261007    gcc-8.5.0  sparse
sparc64              randconfig-r2306-20261007    gcc-11.5.0 sparse
sparc64              randconfig-r2308-20261008    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261009    clang-18
um                    randconfig-1001-20261009    clang-18
um                    randconfig-2000-20261007    clang-24
um                    randconfig-2000-20261008    gcc-14
um                    randconfig-2001-20261007    clang-24
um                    randconfig-2001-20261008    gcc-14
um                   randconfig-r2101-20261008    gcc-12.5.0 cocci
um                   randconfig-r2105-20261007    clang-24   cocci
um                   randconfig-r2105-20261008    gcc-16.1.0 cocci
um                   randconfig-r2107-20261007    gcc-9.5.0  cocci
um                   randconfig-r2200-20261008    clang-17   smatch
um                   randconfig-r2201-20261008    clang-24   smatch
um                   randconfig-r2202-20261008    clang-17   smatch
um                   randconfig-r2302-20261007    clang-18   sparse
um                   randconfig-r2303-20261007    gcc-14.3.0 sparse
um                   randconfig-r2306-20261008    clang-24   sparse
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
x86_64                randconfig-2100-20261007    clang-22   cocci
x86_64                randconfig-2100-20261008    clang-22   cocci
x86_64                randconfig-2101-20261007    clang-22   cocci
x86_64                randconfig-2101-20261008    clang-22   cocci
x86_64                randconfig-2102-20261007    clang-22   cocci
x86_64                randconfig-2102-20261008    clang-22   cocci
x86_64                randconfig-2103-20261007    clang-22   cocci
x86_64                randconfig-2103-20261008    clang-22   cocci
x86_64                randconfig-2200-20261007    gcc-14     smatch
x86_64                randconfig-2200-20261008    gcc-14     smatch
x86_64                randconfig-2300-20261007    clang-22   sparse
x86_64                randconfig-2300-20261008    clang-22   sparse
x86_64                randconfig-2301-20261007    clang-22   sparse
x86_64                randconfig-2301-20261008    clang-22   sparse
x86_64                randconfig-2302-20261007    clang-22   sparse
x86_64                randconfig-2302-20261008    clang-22   sparse
x86_64               randconfig-r2103-20261007    gcc-16.1.0 cocci
x86_64               randconfig-r2103-20261008    gcc-9.5.0  cocci
x86_64               randconfig-r2303-20261008    gcc-10.5.0 sparse
x86_64               randconfig-r2305-20261007    gcc-9.5.0  sparse
x86_64               randconfig-r2306-20261008    gcc-14     sparse
x86_64               randconfig-r2307-20261007    clang-24   sparse
x86_64               randconfig-r2309-20261008    gcc-8.5.0  sparse
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
xtensa                randconfig-2000-20261007    clang-24
xtensa                randconfig-2000-20261008    gcc-14
xtensa                randconfig-2001-20261007    clang-24
xtensa                randconfig-2001-20261008    gcc-14
xtensa               randconfig-r2102-20261007    gcc-16.1.0 cocci
xtensa               randconfig-r2105-20261007    gcc-16.1.0 cocci
xtensa               randconfig-r2106-20261008    gcc-8.5.0  cocci
xtensa               randconfig-r2107-20261007    gcc-9.5.0  cocci
xtensa               randconfig-r2201-20261007    gcc-8.5.0  smatch
xtensa               randconfig-r2201-20261008    gcc-13.4.0 smatch
xtensa               randconfig-r2308-20261008    gcc-8.5.0  sparse
xtensa               randconfig-r2309-20261008    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

