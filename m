Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88C0CA5FCE
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 13:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VaJfgGkqeLOQucvifxyiThLkFecOiCSjCAM+aJ3uW18=; b=nfD6Cfc1e38pHKp/zS6qFRHNhO
	J2Spl6Kanbhq2/3tWFgPmIDF2S1F/lcj9Wp5gWrgv0EspXtkX5j53i4VNqeOk3fNcJLfDmbCPQQN+
	unzZb9tQ0e+A9ndZ+QAt5r47hMU4HERzlYhbu/U7ARBTrA+zRRyBZvau91HG3t7SsgeP3+4TuVLpC
	Ok/liAuN3n7QlPnf3Q8rfmYOKB2aiytxGZd3v/Jn4lh+cygwkJta5ZVyxqta+GKUnObO8dPzTnu/G
	97CX7NRO0xHyuCsK3FvYFK31emQ3JXKonHSjmjp44Lo5SzXmCpL3UmhYXZ9KlBlvx8skJE1NkvX5y
	OzbCzZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiyh-0000000GZD3-24uX;
	Mon, 05 Oct 2026 13:43:39 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiye-0000000GZC3-3JSk
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 13:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791207817; x=1822743817;
  h=date:from:to:cc:subject:message-id;
  bh=p4nyy/Alxj8Pk8UniQ8fVKNkAJQG7Fdh4A+ot6JBcMY=;
  b=ceMthgPRD9cgatsZiPRAWLC0xElEh1uj7EufE68gWKqi6PXV8Rh2tzrg
   ZYMvyLFPeQvD8vsdfZK/JFDxDsPolJkkQH8xihN4mSA0mut7scpVqAwU9
   XDLEUPtPoOCAQH9eXnJjxfsAtYOR3skwCS5v8al5kiEJIMyksOpRXoRq2
   4R5Zyk0OyrcFc3UGqCiLuKsjP1cnYsvw8RAhko5b/zVTAaoBmRBKkKM3S
   AadrjwokmjvD+Vmtq9KCRVhMXmGlgiycBKWRXGxsKdX7g8X7D17bUyIvE
   FUWgMK/XZMza6t9A4WjJGTqdddExfTIoF5utK9d3FOyT8oLN5AGQcMGOl
   A==;
X-CSE-ConnectionGUID: IMuxytC5SSq7LcsBN/QQGQ==
X-CSE-MsgGUID: OM4Vm/KCRBiLEg3FpZYZLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="95688794"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="95688794"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 06:43:36 -0700
X-CSE-ConnectionGUID: sK+ZjGdPQQGEZ5gfBBSYUA==
X-CSE-MsgGUID: xFKXvgCcRny9gV4UPf88jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="284703984"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Oct 2026 06:43:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDiya-000000000MX-2u8i;
	Mon, 05 Oct 2026 13:43:32 +0000
Date: Mon, 05 Oct 2026 21:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 de728286ea70521b3ce81ad68bb2c65984369af7
Message-ID: <202610052131.tIyuUq07-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_064336_876131_FC64B9F1 
X-CRM114-Status: UNSURE (   3.70  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: de728286ea70521b3ce81ad68bb2c65984369af7  MIPS: generic: Remove undefined image 'ramdisk'

elapsed time: 1200m

configs tested: 307
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.1.0
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20261004    gcc-11.5.0 cocci
alpha                randconfig-r2102-20261004    gcc-10.5.0 cocci
alpha                randconfig-r2105-20261004    clang-24   cocci
alpha                randconfig-r2201-20261004    gcc-14.3.0 smatch
alpha                randconfig-r2301-20261004    clang-24   sparse
alpha                randconfig-r2309-20261004    clang-19   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261005    gcc-8.5.0
arc                   randconfig-1001-20261005    gcc-8.5.0
arc                  randconfig-r2302-20261004    clang-24   sparse
arc                  randconfig-r2309-20261004    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                        imx_v4_v5_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261005    gcc-8.5.0
arm                   randconfig-1001-20261005    gcc-8.5.0
arm                   randconfig-1002-20261005    gcc-8.5.0
arm                   randconfig-1003-20261005    gcc-8.5.0
arm                  randconfig-r2107-20261004    gcc-14.3.0 cocci
arm                  randconfig-r2201-20261004    gcc-13.4.0 smatch
arm                  randconfig-r2202-20261004    gcc-11.5.0 smatch
arm                  randconfig-r2302-20261004    clang-20   sparse
arm                  randconfig-r2304-20261004    gcc-16.1.0 sparse
arm                  randconfig-r2306-20261004    gcc-14.3.0 sparse
arm                         spear6xx_defconfig    gcc-16.1.0
arm                         vexpress_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261005    gcc-16.1.0
arm64                 randconfig-1001-20261005    gcc-16.1.0
arm64                 randconfig-1002-20261005    gcc-16.1.0
arm64                 randconfig-1003-20261005    gcc-16.1.0
arm64                randconfig-r2100-20261004    gcc-11.5.0 cocci
arm64                randconfig-r2300-20261004    clang-20   sparse
arm64                randconfig-r2305-20261004    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261005    gcc-16.1.0
csky                  randconfig-1001-20261005    gcc-16.1.0
csky                 randconfig-r2202-20261004    gcc-16.1.0 smatch
csky                 randconfig-r2304-20261004    clang-20   sparse
csky                 randconfig-r2304-20261004    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261005    gcc-16.1.0
hexagon               randconfig-1001-20261005    gcc-16.1.0
hexagon              randconfig-r2102-20261004    clang-24   cocci
hexagon              randconfig-r2102-20261004    gcc-11.5.0 cocci
hexagon              randconfig-r2106-20261004    clang-22   cocci
hexagon              randconfig-r2300-20261004    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261005    clang-22
i386        buildonly-randconfig-1001-20261005    clang-22
i386        buildonly-randconfig-1002-20261005    clang-22
i386        buildonly-randconfig-1003-20261005    clang-22
i386        buildonly-randconfig-1004-20261005    clang-22
i386        buildonly-randconfig-1005-20261005    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261005    clang-22
i386                  randconfig-1001-20261005    clang-22
i386                  randconfig-1002-20261005    clang-22
i386                  randconfig-1003-20261005    clang-22
i386                  randconfig-1004-20261005    clang-22
i386                  randconfig-1005-20261005    clang-22
i386                  randconfig-1006-20261005    clang-22
i386                  randconfig-1007-20261005    clang-22
i386                  randconfig-1008-20261005    clang-22
i386                  randconfig-1009-20261005    clang-22
i386                  randconfig-1010-20261005    clang-22
i386                  randconfig-1011-20261005    clang-22
i386                  randconfig-1012-20261005    clang-22
i386                  randconfig-1013-20261005    clang-22
i386                  randconfig-2100-20261004    clang-22   cocci
i386                  randconfig-2101-20261004    clang-22   cocci
i386                  randconfig-2101-20261004    gcc-14     cocci
i386                  randconfig-2102-20261004    clang-22   cocci
i386                  randconfig-2102-20261004    gcc-14     cocci
i386                  randconfig-2103-20261004    clang-22   cocci
i386                  randconfig-2103-20261004    gcc-14     cocci
i386                  randconfig-2200-20261004    clang-22   smatch
i386                  randconfig-2300-20261004    clang-22   sparse
i386                  randconfig-2301-20261004    clang-22   sparse
i386                  randconfig-2302-20261004    clang-22   sparse
i386                 randconfig-r2100-20261004    clang-24   cocci
i386                 randconfig-r2101-20261004    gcc-13     cocci
i386                 randconfig-r2104-20261004    clang-22   cocci
i386                 randconfig-r2303-20261004    clang-20   sparse
i386                 randconfig-r2305-20261004    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261005    gcc-16.1.0
loongarch             randconfig-1001-20261005    gcc-16.1.0
loongarch            randconfig-r2302-20261004    gcc-16.1.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         mvme16x_defconfig    gcc-16.1.0
m68k                             q40_defconfig    gcc-16.1.0
m68k                 randconfig-r2100-20261004    gcc-13.4.0 cocci
m68k                 randconfig-r2103-20261004    gcc-11.5.0 cocci
m68k                 randconfig-r2200-20261004    gcc-8.5.0  smatch
m68k                 randconfig-r2202-20261004    gcc-8.5.0  smatch
m68k                 randconfig-r2307-20261004    gcc-9.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.1.0
microblaze           randconfig-r2100-20261004    gcc-10.5.0 cocci
microblaze           randconfig-r2107-20261004    clang-22   cocci
microblaze           randconfig-r2305-20261004    clang-20   sparse
microblaze           randconfig-r2305-20261004    gcc-16.1.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2103-20261004    gcc-11.5.0 cocci
mips                 randconfig-r2106-20261004    gcc-14.3.0 cocci
mips                 randconfig-r2307-20261004    gcc-14.3.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261005    gcc-16.1.0
nios2                 randconfig-1001-20261005    gcc-16.1.0
nios2                randconfig-r2100-20261004    gcc-11.5.0 cocci
nios2                randconfig-r2103-20261004    clang-24   cocci
nios2                randconfig-r2107-20261004    clang-24   cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261004    gcc-16.1.0 cocci
openrisc             randconfig-r2102-20261004    gcc-11.5.0 cocci
openrisc             randconfig-r2103-20261004    gcc-12.5.0 cocci
openrisc             randconfig-r2105-20261004    gcc-14.3.0 cocci
openrisc             randconfig-r2306-20261004    clang-19   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261005    gcc-8.5.0
parisc                randconfig-1001-20261005    gcc-8.5.0
parisc               randconfig-r2201-20261004    gcc-15.2.0 smatch
parisc               randconfig-r2306-20261004    gcc-9.5.0  sparse
parisc               randconfig-r2307-20261004    clang-19   sparse
parisc               randconfig-r2308-20261004    gcc-14.3.0 sparse
parisc               randconfig-r2308-20261004    gcc-9.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                    bluestone_defconfig    gcc-16.1.0
powerpc                         cell_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261005    gcc-8.5.0
powerpc               randconfig-1001-20261005    gcc-8.5.0
powerpc              randconfig-r2101-20261004    gcc-11.5.0 cocci
powerpc              randconfig-r2104-20261004    clang-24   cocci
powerpc              randconfig-r2106-20261004    clang-24   cocci
powerpc              randconfig-r2300-20261004    gcc-8.5.0  sparse
powerpc              randconfig-r2301-20261004    gcc-16.1.0 sparse
powerpc              randconfig-r2304-20261004    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261004    gcc-14.3.0 sparse
powerpc64                         alldefconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261005    gcc-8.5.0
powerpc64             randconfig-1001-20261005    gcc-8.5.0
powerpc64            randconfig-r2301-20261004    clang-20   sparse
powerpc64            randconfig-r2306-20261004    gcc-16.1.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261005    clang-17
riscv                 randconfig-1001-20261005    clang-17
riscv                 randconfig-2000-20261004    gcc-11.5.0
riscv                 randconfig-2001-20261004    gcc-11.5.0
riscv                randconfig-r2101-20261004    clang-24   cocci
riscv                randconfig-r2102-20261004    clang-24   cocci
riscv                randconfig-r2107-20261004    clang-22   cocci
riscv                randconfig-r2200-20261004    gcc-11.5.0 smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261005    clang-17
s390                  randconfig-1001-20261005    clang-17
s390                  randconfig-2000-20261004    gcc-11.5.0
s390                  randconfig-2001-20261004    gcc-11.5.0
s390                 randconfig-r2101-20261004    gcc-11.5.0 cocci
s390                 randconfig-r2103-20261004    gcc-10.5.0 cocci
s390                 randconfig-r2202-20261004    gcc-9.5.0  smatch
s390                 randconfig-r2301-20261004    gcc-8.5.0  sparse
s390                 randconfig-r2302-20261004    gcc-8.5.0  sparse
s390                 randconfig-r2303-20261004    gcc-16.1.0 sparse
s390                 randconfig-r2308-20261004    clang-19   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261005    clang-17
sh                    randconfig-1001-20261005    clang-17
sh                    randconfig-2000-20261004    gcc-11.5.0
sh                    randconfig-2001-20261004    gcc-11.5.0
sh                   randconfig-r2102-20261004    gcc-13.4.0 cocci
sh                   randconfig-r2104-20261004    gcc-14.3.0 cocci
sh                   randconfig-r2105-20261004    clang-22   cocci
sh                       rts7751r2d1_defconfig    gcc-16.1.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261005    clang-24
sparc                 randconfig-1001-20261005    clang-24
sparc                 randconfig-2000-20261004    clang-17
sparc                 randconfig-2001-20261004    clang-17
sparc                randconfig-r2105-20261004    clang-22   cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261005    clang-24
sparc64               randconfig-1001-20261005    clang-24
sparc64               randconfig-2000-20261004    clang-17
sparc64               randconfig-2001-20261004    clang-17
sparc64              randconfig-r2101-20261004    gcc-10.5.0 cocci
sparc64              randconfig-r2103-20261004    clang-24   cocci
sparc64              randconfig-r2303-20261004    gcc-8.5.0  sparse
sparc64              randconfig-r2307-20261004    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261005    clang-24
um                    randconfig-1001-20261005    clang-24
um                    randconfig-2000-20261004    clang-17
um                    randconfig-2001-20261004    clang-17
um                   randconfig-r2303-20261004    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261005    gcc-13
x86_64      buildonly-randconfig-1001-20261005    gcc-13
x86_64      buildonly-randconfig-1002-20261005    gcc-13
x86_64      buildonly-randconfig-1003-20261005    gcc-13
x86_64      buildonly-randconfig-1004-20261005    gcc-13
x86_64      buildonly-randconfig-1005-20261005    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261005    gcc-14
x86_64                randconfig-1001-20261005    gcc-14
x86_64                randconfig-1002-20261005    gcc-14
x86_64                randconfig-1003-20261005    gcc-14
x86_64                randconfig-1004-20261005    gcc-14
x86_64                randconfig-1005-20261005    gcc-14
x86_64                randconfig-1006-20261005    gcc-14
x86_64                randconfig-1007-20261005    gcc-14
x86_64                randconfig-1008-20261005    gcc-14
x86_64                randconfig-1009-20261005    gcc-14
x86_64                randconfig-1010-20261005    gcc-14
x86_64                randconfig-1011-20261005    gcc-14
x86_64                randconfig-1012-20261005    gcc-14
x86_64                randconfig-1013-20261005    gcc-14
x86_64                randconfig-1014-20261005    gcc-14
x86_64                randconfig-1015-20261005    gcc-14
x86_64                randconfig-1016-20261005    gcc-14
x86_64                randconfig-1017-20261005    gcc-14
x86_64                randconfig-2100-20261004    gcc-14     cocci
x86_64                randconfig-2101-20261004    clang-22   cocci
x86_64                randconfig-2101-20261004    gcc-14     cocci
x86_64                randconfig-2102-20261004    gcc-14     cocci
x86_64                randconfig-2103-20261004    gcc-14     cocci
x86_64                randconfig-2200-20261004    gcc-14     smatch
x86_64                randconfig-2300-20261004    clang-22   sparse
x86_64                randconfig-2301-20261004    clang-22   sparse
x86_64                randconfig-2302-20261004    clang-22   sparse
x86_64               randconfig-r2104-20261004    clang-22   cocci
x86_64               randconfig-r2106-20261004    clang-22   cocci
x86_64               randconfig-r2308-20261004    gcc-16.1.0 sparse
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
xtensa                randconfig-1000-20261005    clang-24
xtensa                randconfig-1001-20261005    clang-24
xtensa                randconfig-2000-20261004    clang-17
xtensa                randconfig-2001-20261004    clang-17
xtensa               randconfig-r2200-20261004    gcc-15.2.0 smatch
xtensa               randconfig-r2300-20261004    gcc-16.1.0 sparse
xtensa               randconfig-r2309-20261004    gcc-16.1.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

