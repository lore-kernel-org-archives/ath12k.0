Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79325CA9EC5
	for <ath12k@archiver.kernel.org>; Sun, 11 Oct 2026 01:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zDBsuhUC7Zl0drnGn51zc6JOJhUVoJdZQ4EAFiHECOs=; b=e/DfKzB78EoJod/k7w12RQLcgI
	poaqoLiGTQBBsYJttGXm0oUuZeODKyR5UqR5Rq/m9ZUz9VWDV5ABJgnlSDiF1qDMirxLzv/rVg4yo
	bwCv+3bynVf+wqyDXXDBX5X8ERTvS8awos6QhBW60Vr3YfkqUp3wRBD4cw2qNNRfF7TjEgdKxD5gh
	QfhRrfXmC6CI/SwMzQ90I42FsGpbFLmzQgYSJsoKdWN4bDJ90NM0hP/Borkzbp7JYiqVPHcTMZqyc
	5ZL8niWE1MHovd2bRS/uk1ZiG+NYkRV4YPb6rI+Zqs1NKnNtALMn1gnqtWBGO5wXHdXP+jg80pW5Z
	psHOA6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhzn-00000008bci-0fTE;
	Sun, 11 Oct 2026 01:04:59 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhzk-00000008bcJ-2war
	for ath12k@lists.infradead.org;
	Sun, 11 Oct 2026 01:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791680697; x=1823216697;
  h=date:from:to:cc:subject:message-id;
  bh=2/yrb5iq1e1rzn4w14+panyt8VrlW40gqXa4WBmgNyQ=;
  b=TG1F7w/1tc5NFYeoHCmy11cWsdbWJgtf5R6X0VpLDvKnr5y+toXB5STM
   d5n1CulUsNL/OxWQR0y1WVJobWx4qtzNZYLNtRfNApF9i4f1WdqF+MKGa
   512dtiTGjnDIbdeZ7hgP0r0ynVRWm2Dsklw3b0md0zuj/Wy6rpzJABQfS
   xNxbOR3H6DeSc3DAy0TIV1LJFQ7p/oihxJ/Grp+e3qVjg5a2Hldn04Cb0
   L0TDiGzLemovHpsslEjpHAXsx3V0Ty5Eo1uUOvozJ6vTkTFT+qm0sp5bs
   PfwDVuZ1oV48OgqWl+CBE0xKnrb1phSHIt9J9QKwamQEAdyuYZjT34gmY
   w==;
X-CSE-ConnectionGUID: 6Mpf5CWqRd2AcxlauG7uYg==
X-CSE-MsgGUID: S+xiSScqSWyFcNFdVrz3Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="311542"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="311542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 18:04:54 -0700
X-CSE-ConnectionGUID: wviHoKK+RMO6lWG6vrGbFQ==
X-CSE-MsgGUID: TGiiYrHIRl6SUzFks4J4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="566850"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2026 18:04:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFhze-00000000ACq-1kUf;
	Sun, 11 Oct 2026 01:04:50 +0000
Date: Sun, 11 Oct 2026 09:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 97aab70a03df478ffefcf890ed4be258c0240bcb
Message-ID: <202610110921.MFBbH31e-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_180456_839923_04CEEF52 
X-CRM114-Status: UNSURE (   3.19  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 97aab70a03df478ffefcf890ed4be258c0240bcb  wifi: ath6kl: don't take RTNL in del_virtual_intf

elapsed time: 1228m

configs tested: 441
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261010    gcc-12.5.0 cocci
alpha                randconfig-r2202-20261010    gcc-8.5.0  smatch
alpha                randconfig-r2303-20261009    gcc-16.1.0 sparse
alpha                randconfig-r2306-20261009    clang-24   sparse
alpha                randconfig-r2307-20261009    gcc-11.5.0 sparse
alpha                randconfig-r2307-20261009    gcc-8.5.0  sparse
alpha                randconfig-r2308-20261009    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261010    gcc-8.5.0
arc                   randconfig-1000-20261011    clang-24
arc                   randconfig-1001-20261010    gcc-8.5.0
arc                   randconfig-1001-20261011    clang-24
arc                  randconfig-r2100-20261009    clang-24   cocci
arc                  randconfig-r2101-20261009    gcc-13.4.0 cocci
arc                  randconfig-r2104-20261009    gcc-14     cocci
arc                  randconfig-r2106-20261009    gcc-15.2.0 cocci
arc                  randconfig-r2200-20261009    gcc-14.3.0 smatch
arc                  randconfig-r2200-20261010    gcc-14.3.0 smatch
arc                  randconfig-r2202-20261009    gcc-8.5.0  smatch
arc                  randconfig-r2300-20261009    clang-22   sparse
arc                  randconfig-r2302-20261009    gcc-11.5.0 sparse
arc                  randconfig-r2305-20261010    clang-17   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           moxart_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261010    gcc-8.5.0
arm                   randconfig-1000-20261011    clang-24
arm                   randconfig-1001-20261010    gcc-8.5.0
arm                   randconfig-1001-20261011    clang-24
arm                   randconfig-1002-20261010    gcc-8.5.0
arm                   randconfig-1002-20261011    clang-24
arm                   randconfig-1003-20261010    gcc-8.5.0
arm                   randconfig-1003-20261011    clang-24
arm                  randconfig-r2107-20261009    gcc-15.2.0 cocci
arm                  randconfig-r2202-20261009    clang-24   smatch
arm                  randconfig-r2305-20261009    gcc-11.5.0 sparse
arm                  randconfig-r2306-20261010    gcc-14     sparse
arm                  randconfig-r2308-20261009    clang-24   sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261010    gcc-10.5.0
arm64                 randconfig-1001-20261010    gcc-10.5.0
arm64                 randconfig-1002-20261010    gcc-10.5.0
arm64                 randconfig-1003-20261010    gcc-10.5.0
arm64                randconfig-r2102-20261009    gcc-11.5.0 cocci
arm64                randconfig-r2104-20261010    gcc-14     cocci
arm64                randconfig-r2300-20261009    gcc-8.5.0  sparse
arm64                randconfig-r2301-20261010    gcc-15.2.0 sparse
arm64                randconfig-r2304-20261010    gcc-16.1.0 sparse
arm64                randconfig-r2306-20261009    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261010    gcc-10.5.0
csky                  randconfig-1001-20261010    gcc-10.5.0
csky                 randconfig-r2103-20261010    clang-24   cocci
csky                 randconfig-r2103-20261010    gcc-16.1.0 cocci
csky                 randconfig-r2104-20261009    gcc-16.1.0 cocci
csky                 randconfig-r2200-20261009    gcc-16.1.0 smatch
csky                 randconfig-r2300-20261009    clang-24   sparse
csky                 randconfig-r2300-20261009    gcc-16.1.0 sparse
csky                 randconfig-r2300-20261010    gcc-16.1.0 sparse
csky                 randconfig-r2302-20261009    clang-24   sparse
csky                 randconfig-r2303-20261009    gcc-16.1.0 sparse
csky                 randconfig-r2304-20261010    gcc-15.2.0 sparse
csky                 randconfig-r2309-20261009    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261010    clang-17
hexagon               randconfig-1001-20261010    clang-17
hexagon              randconfig-r2100-20261010    clang-24   cocci
hexagon              randconfig-r2102-20261009    clang-24   cocci
hexagon              randconfig-r2103-20261009    clang-19   cocci
hexagon              randconfig-r2103-20261010    gcc-12.5.0 cocci
hexagon              randconfig-r2104-20261009    gcc-16.1.0 cocci
hexagon              randconfig-r2106-20261009    gcc-16.1.0 cocci
hexagon              randconfig-r2200-20261010    clang-24   smatch
hexagon              randconfig-r2302-20261009    gcc-16.1.0 sparse
hexagon              randconfig-r2302-20261010    clang-17   sparse
hexagon              randconfig-r2303-20261009    clang-22   sparse
hexagon              randconfig-r2304-20261009    gcc-11.5.0 sparse
hexagon              randconfig-r2305-20261009    clang-24   sparse
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
i386                  randconfig-2100-20261009    clang-22   cocci
i386                  randconfig-2100-20261010    clang-22   cocci
i386                  randconfig-2101-20261009    clang-22   cocci
i386                  randconfig-2101-20261009    gcc-14     cocci
i386                  randconfig-2101-20261010    clang-22   cocci
i386                  randconfig-2102-20261009    clang-22   cocci
i386                  randconfig-2102-20261009    gcc-14     cocci
i386                  randconfig-2102-20261010    clang-22   cocci
i386                  randconfig-2103-20261009    clang-22   cocci
i386                  randconfig-2103-20261010    clang-22   cocci
i386                  randconfig-2200-20261009    gcc-14     smatch
i386                  randconfig-2200-20261010    gcc-12     smatch
i386                  randconfig-2300-20261009    clang-22   sparse
i386                  randconfig-2300-20261010    gcc-14     sparse
i386                  randconfig-2301-20261009    clang-22   sparse
i386                  randconfig-2301-20261010    gcc-14     sparse
i386                  randconfig-2302-20261009    clang-22   sparse
i386                  randconfig-2302-20261010    gcc-14     sparse
i386                 randconfig-r2101-20261009    clang-22   cocci
i386                 randconfig-r2106-20261009    gcc-14     cocci
i386                 randconfig-r2201-20261009    gcc-14     smatch
i386                 randconfig-r2306-20261009    gcc-13.4.0 sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    clang-24
loongarch             randconfig-1000-20261010    clang-17
loongarch             randconfig-1001-20261010    clang-17
loongarch            randconfig-r2107-20261010    gcc-14     cocci
loongarch            randconfig-r2300-20261010    clang-17   sparse
loongarch            randconfig-r2301-20261009    gcc-13.4.0 sparse
loongarch            randconfig-r2302-20261009    clang-24   sparse
loongarch            randconfig-r2303-20261009    gcc-11.5.0 sparse
loongarch            randconfig-r2309-20261009    gcc-13.4.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                         m5307c3_defconfig    clang-24
m68k                 randconfig-r2103-20261009    gcc-14.3.0 cocci
m68k                 randconfig-r2107-20261009    gcc-16.1.0 cocci
m68k                 randconfig-r2202-20261010    gcc-13.4.0 smatch
m68k                 randconfig-r2301-20261009    clang-24   sparse
m68k                 randconfig-r2304-20261009    gcc-8.5.0  sparse
m68k                 randconfig-r2306-20261009    gcc-14.3.0 sparse
m68k                 randconfig-r2307-20261009    gcc-9.5.0  sparse
m68k                 randconfig-r2307-20261010    gcc-14     sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2105-20261010    gcc-8.5.0  cocci
microblaze           randconfig-r2107-20261009    gcc-14     cocci
microblaze           randconfig-r2200-20261009    gcc-9.5.0  smatch
microblaze           randconfig-r2302-20261010    gcc-15.2.0 sparse
microblaze           randconfig-r2304-20261010    clang-17   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                  decstation_r4k_defconfig    clang-24
mips                      eyeq6lplus_defconfig    gcc-16.1.0
mips                            ip22_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    clang-24
mips                 randconfig-r2101-20261010    gcc-12.5.0 cocci
mips                 randconfig-r2102-20261009    clang-19   cocci
mips                 randconfig-r2103-20261009    gcc-12     cocci
mips                 randconfig-r2106-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2202-20261010    clang-18   smatch
mips                 randconfig-r2301-20261009    gcc-11.5.0 sparse
mips                 randconfig-r2303-20261009    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261010    clang-17
nios2                 randconfig-1001-20261010    clang-17
nios2                randconfig-r2100-20261009    gcc-12     cocci
nios2                randconfig-r2201-20261009    gcc-10.5.0 smatch
nios2                randconfig-r2301-20261009    gcc-16.1.0 sparse
nios2                randconfig-r2306-20261009    gcc-9.5.0  sparse
nios2                randconfig-r2308-20261009    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261010    gcc-8.5.0  cocci
openrisc             randconfig-r2105-20261009    gcc-16.1.0 cocci
openrisc             randconfig-r2301-20261010    gcc-16.1.0 sparse
openrisc             randconfig-r2305-20261009    clang-24   sparse
openrisc             randconfig-r2306-20261009    gcc-16.1.0 sparse
openrisc             randconfig-r2308-20261009    gcc-9.5.0  sparse
openrisc             randconfig-r2309-20261009    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-64bit_defconfig    clang-24
parisc                 generic-64bit_defconfig    gcc-16.1.0
parisc                randconfig-1000-20261010    clang-24
parisc                randconfig-1001-20261010    clang-24
parisc               randconfig-r2101-20261010    clang-24   cocci
parisc               randconfig-r2201-20261010    gcc-10.5.0 smatch
parisc               randconfig-r2305-20261010    gcc-16.1.0 sparse
parisc               randconfig-r2307-20261009    gcc-13.4.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.1.0
powerpc                      mpc5200_defconfig    clang-24
powerpc               randconfig-1000-20261010    clang-24
powerpc               randconfig-1001-20261010    clang-24
powerpc              randconfig-r2100-20261009    clang-19   cocci
powerpc              randconfig-r2100-20261009    gcc-15.2.0 cocci
powerpc              randconfig-r2101-20261009    gcc-11.5.0 cocci
powerpc              randconfig-r2104-20261009    gcc-15.2.0 cocci
powerpc              randconfig-r2107-20261010    clang-20   cocci
powerpc              randconfig-r2200-20261009    clang-17   smatch
powerpc              randconfig-r2300-20261009    gcc-13.4.0 sparse
powerpc              randconfig-r2305-20261009    gcc-16.1.0 sparse
powerpc              randconfig-r2306-20261009    gcc-11.5.0 sparse
powerpc              randconfig-r2307-20261009    gcc-11.5.0 sparse
powerpc              randconfig-r2308-20261010    gcc-14     sparse
powerpc                       tqm8xx_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261010    clang-24
powerpc64             randconfig-1001-20261010    clang-24
powerpc64            randconfig-r2102-20261009    clang-24   cocci
powerpc64            randconfig-r2104-20261010    clang-20   cocci
powerpc64            randconfig-r2200-20261009    clang-24   smatch
powerpc64            randconfig-r2202-20261009    gcc-16.1.0 smatch
powerpc64            randconfig-r2301-20261010    clang-17   sparse
powerpc64            randconfig-r2304-20261009    clang-22   sparse
powerpc64            randconfig-r2304-20261009    gcc-15.2.0 sparse
powerpc64            randconfig-r2308-20261009    gcc-11.5.0 sparse
powerpc64            randconfig-r2309-20261009    gcc-9.5.0  sparse
powerpc64            randconfig-r2309-20261010    gcc-14     sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261010    clang-19
riscv                 randconfig-1000-20261011    clang-17
riscv                 randconfig-1001-20261010    clang-19
riscv                 randconfig-1001-20261011    clang-17
riscv                 randconfig-2000-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261010    gcc-16.1.0
riscv                 randconfig-2001-20261009    gcc-16.1.0
riscv                 randconfig-2001-20261010    gcc-16.1.0
riscv                randconfig-r2100-20261010    gcc-12.5.0 cocci
riscv                randconfig-r2101-20261009    gcc-12     cocci
riscv                randconfig-r2200-20261009    gcc-10.5.0 smatch
riscv                randconfig-r2300-20261010    gcc-15.2.0 sparse
riscv                randconfig-r2308-20261009    gcc-9.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261010    clang-19
s390                  randconfig-1000-20261011    clang-17
s390                  randconfig-1001-20261010    clang-19
s390                  randconfig-1001-20261011    clang-17
s390                  randconfig-2000-20261009    gcc-16.1.0
s390                  randconfig-2000-20261010    gcc-16.1.0
s390                  randconfig-2001-20261009    gcc-16.1.0
s390                  randconfig-2001-20261010    gcc-16.1.0
s390                 randconfig-r2100-20261010    gcc-16.1.0 cocci
s390                 randconfig-r2103-20261009    gcc-11.5.0 cocci
s390                 randconfig-r2104-20261009    gcc-14     cocci
s390                 randconfig-r2105-20261009    gcc-15.2.0 cocci
s390                 randconfig-r2307-20261009    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261010    clang-19
sh                    randconfig-1000-20261011    clang-17
sh                    randconfig-1001-20261010    clang-19
sh                    randconfig-1001-20261011    clang-17
sh                    randconfig-2000-20261009    gcc-16.1.0
sh                    randconfig-2000-20261010    gcc-16.1.0
sh                    randconfig-2001-20261009    gcc-16.1.0
sh                    randconfig-2001-20261010    gcc-16.1.0
sh                   randconfig-r2107-20261009    gcc-16.1.0 cocci
sh                   randconfig-r2301-20261009    clang-22   sparse
sh                   randconfig-r2302-20261010    gcc-16.1.0 sparse
sh                   randconfig-r2303-20261010    clang-17   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261010    gcc-16.1.0
sparc                 randconfig-1001-20261010    gcc-16.1.0
sparc                 randconfig-2000-20261009    clang-17
sparc                 randconfig-2000-20261010    gcc-16.1.0
sparc                 randconfig-2001-20261009    clang-17
sparc                 randconfig-2001-20261010    gcc-16.1.0
sparc                randconfig-r2100-20261009    gcc-11.5.0 cocci
sparc                randconfig-r2100-20261009    gcc-8.5.0  cocci
sparc                randconfig-r2101-20261009    clang-24   cocci
sparc                randconfig-r2101-20261010    gcc-16.1.0 cocci
sparc                randconfig-r2106-20261009    gcc-16.1.0 cocci
sparc                randconfig-r2106-20261010    clang-20   cocci
sparc                randconfig-r2200-20261009    gcc-16.1.0 smatch
sparc                randconfig-r2201-20261009    gcc-11.5.0 smatch
sparc                randconfig-r2303-20261010    gcc-16.1.0 sparse
sparc                randconfig-r2304-20261009    gcc-16.1.0 sparse
sparc                randconfig-r2309-20261009    gcc-12.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261010    gcc-16.1.0
sparc64               randconfig-1001-20261010    gcc-16.1.0
sparc64               randconfig-2000-20261009    clang-17
sparc64               randconfig-2000-20261010    gcc-16.1.0
sparc64               randconfig-2001-20261009    clang-17
sparc64               randconfig-2001-20261010    gcc-16.1.0
sparc64              randconfig-r2101-20261009    clang-19   cocci
sparc64              randconfig-r2102-20261009    gcc-13.4.0 cocci
sparc64              randconfig-r2102-20261010    clang-24   cocci
sparc64              randconfig-r2105-20261010    gcc-14     cocci
sparc64              randconfig-r2302-20261009    gcc-8.5.0  sparse
sparc64              randconfig-r2305-20261010    gcc-15.2.0 sparse
sparc64              randconfig-r2306-20261010    gcc-14     sparse
sparc64              randconfig-r2308-20261009    gcc-13.4.0 sparse
sparc64              randconfig-r2309-20261009    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261010    gcc-16.1.0
um                    randconfig-1001-20261010    gcc-16.1.0
um                    randconfig-2000-20261009    clang-17
um                    randconfig-2000-20261010    gcc-16.1.0
um                    randconfig-2001-20261009    clang-17
um                    randconfig-2001-20261010    gcc-16.1.0
um                   randconfig-r2102-20261009    gcc-12     cocci
um                   randconfig-r2105-20261009    gcc-16.1.0 cocci
um                   randconfig-r2105-20261010    clang-20   cocci
um                   randconfig-r2201-20261009    clang-24   smatch
um                   randconfig-r2201-20261010    clang-17   smatch
um                   randconfig-r2302-20261009    clang-22   sparse
um                   randconfig-r2304-20261009    clang-24   sparse
um                   randconfig-r2307-20261009    clang-24   sparse
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
x86_64                randconfig-1001-20261010    gcc-14
x86_64                randconfig-1002-20261010    gcc-14
x86_64                randconfig-1003-20261010    gcc-14
x86_64                randconfig-1004-20261010    gcc-14
x86_64                randconfig-1005-20261010    gcc-14
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
x86_64                randconfig-2100-20261009    clang-22   cocci
x86_64                randconfig-2100-20261010    clang-22   cocci
x86_64                randconfig-2101-20261009    clang-22   cocci
x86_64                randconfig-2101-20261010    clang-22   cocci
x86_64                randconfig-2102-20261009    clang-22   cocci
x86_64                randconfig-2102-20261010    clang-22   cocci
x86_64                randconfig-2103-20261009    clang-22   cocci
x86_64                randconfig-2103-20261010    clang-22   cocci
x86_64                randconfig-2200-20261009    gcc-14     smatch
x86_64                randconfig-2300-20261009    clang-22   sparse
x86_64                randconfig-2300-20261010    gcc-14     sparse
x86_64                randconfig-2301-20261009    clang-22   sparse
x86_64                randconfig-2301-20261010    gcc-14     sparse
x86_64                randconfig-2302-20261009    clang-22   sparse
x86_64                randconfig-2302-20261010    gcc-14     sparse
x86_64               randconfig-r2105-20261009    gcc-14     cocci
x86_64               randconfig-r2106-20261009    gcc-14     cocci
x86_64               randconfig-r2106-20261010    gcc-14     cocci
x86_64               randconfig-r2200-20261009    clang-22   smatch
x86_64               randconfig-r2201-20261010    clang-22   smatch
x86_64               randconfig-r2300-20261009    gcc-11.5.0 sparse
x86_64               randconfig-r2301-20261009    gcc-11.5.0 sparse
x86_64               randconfig-r2303-20261009    clang-22   sparse
x86_64               randconfig-r2303-20261010    gcc-15.2.0 sparse
x86_64               randconfig-r2305-20261009    clang-22   sparse
x86_64               randconfig-r2307-20261010    gcc-14     sparse
x86_64               randconfig-r2309-20261010    gcc-14     sparse
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
xtensa                randconfig-2000-20261009    clang-17
xtensa                randconfig-2000-20261010    gcc-16.1.0
xtensa                randconfig-2001-20261009    clang-17
xtensa                randconfig-2001-20261010    gcc-16.1.0
xtensa               randconfig-r2102-20261010    gcc-16.1.0 cocci
xtensa               randconfig-r2103-20261009    clang-24   cocci
xtensa               randconfig-r2107-20261009    gcc-14     cocci
xtensa               randconfig-r2200-20261010    gcc-8.5.0  smatch
xtensa               randconfig-r2308-20261010    gcc-14     sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

