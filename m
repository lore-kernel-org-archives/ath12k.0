Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729BCC28B2F
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 02:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ISkmKlFBck186y+r4DkhHIQOZLDXJNxT+kF52S+OhJY=; b=0e6FTDkCCBtcxfnjVRCr7kQmic
	JS4ugqNQuA5s6q1zghFBCCwm6IefiCSilYDHC4eqqRD/fiJOyL0PCqbuGQUDktpWROW11vnvBWbfJ
	GpKQnsXfYFXQqrIbZggnVY4ceiZzpTIMdkmOxKyZEGpDpSHnCMA8ixfWCf3nQL7mt7CZhheex+UI0
	z2ylVmXps9iO3YOTzZ8PR4CtunvauA59ZG8Y/dmrziWJmHwckUKYVWLZyv0DzveZXQzZSODXgcqmk
	zObH+H+lJ9bf/awidatIq907XUlV7MeO4f1N/vj207vIoQp5hcyZJj2Qb2iVL1FRZeQsWpAojjFy9
	bHBpPjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuj1A-00000007mwt-0O4C
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 02:18:52 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuj17-00000007mwT-1AAW
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 02:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742350729; x=1773886729;
  h=date:from:to:cc:subject:message-id;
  bh=WTBX4nLQc0QFueV/SwQD7iWkzCFBC2mkAmN80Aoq3NA=;
  b=dniXxtyVzHW6av7bM6Dx45l1UjlUf6RvOeOSNtN68zWXdeYgYh/Aptjo
   X5dC/K6Kt1nkPXeksbrZfpDKY84u2TBYjQvBNB945R2sbBaHTqzqlqt7s
   DxAJ3bxcAMVdN0c5e+zMYX6kD4ifMOeT0p9ZM2AWmXt008JSN5EigMEbt
   Rn51z3OrH68NhGQx6fc8QoVnSgvyIwC1nzxCPUq6tUh6yyF3R2yYuwzvP
   Ol2+u4rxzit2nfKD7r04XCY9qq6c8hybie6Awvhea+5MdHnBqsIHhae+o
   +ZWghuwHQUKj7kI+3fIEPH6MwTSxin2Ryrz874o8TJqJhWa/jom2nsL5i
   Q==;
X-CSE-ConnectionGUID: ZRXv7901R1eTH5FmRwXIjg==
X-CSE-MsgGUID: K0BBqXhDR9mMJXX9D31OFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="47165365"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="47165365"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 19:18:46 -0700
X-CSE-ConnectionGUID: AibGcCFrTMOHykkT6eYmYQ==
X-CSE-MsgGUID: QjgrYTnkQfaxDghC93mS5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122169721"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2025 19:18:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuj0s-000EHy-24;
	Wed, 19 Mar 2025 02:18:37 +0000
Date: Wed, 19 Mar 2025 10:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS WITH WARNING
 5bc3e6ca41aa7982442c7c2002d339f1a3343eae
Message-ID: <202503191015.G77ucrm6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_191849_387871_91A3B9D8 
X-CRM114-Status: UNSURE (   3.26  )
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
branch HEAD: 5bc3e6ca41aa7982442c7c2002d339f1a3343eae  wifi: ath12k: enable ath12k AHB support

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202503181631.ckurxYu4-lkp@intel.com

    drivers/net/wireless/ath/ath12k/ahb.c:1011:11: warning: cast to smaller integer type 'enum ath12k_hw_rev' from 'const void *' [-Wvoid-pointer-to-enum-cast]

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
|-- powerpc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
|-- riscv-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
|-- riscv-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
|-- um-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
`-- x86_64-allyesconfig
    `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void

elapsed time: 1493m

configs tested: 118
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-9.3.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.3.0
arc                              allyesconfig    gcc-10.5.0
arc                          axs101_defconfig    gcc-14.2.0
arc                   randconfig-001-20250318    gcc-13.2.0
arc                   randconfig-001-20250318    gcc-8.5.0
arc                   randconfig-002-20250318    gcc-8.5.0
arc                           tb10x_defconfig    gcc-11.5.0
arm                              allmodconfig    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250318    gcc-14.2.0
arm                   randconfig-002-20250318    clang-21
arm                   randconfig-003-20250318    gcc-14.2.0
arm                   randconfig-004-20250318    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-8.5.0
arm64                 randconfig-001-20250318    clang-21
arm64                 randconfig-002-20250318    clang-14
arm64                 randconfig-003-20250318    gcc-13.3.0
arm64                 randconfig-004-20250318    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250318    gcc-14.2.0
csky                  randconfig-002-20250318    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250318    clang-21
hexagon               randconfig-002-20250318    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250318    clang-20
i386        buildonly-randconfig-002-20250318    clang-20
i386        buildonly-randconfig-003-20250318    clang-20
i386        buildonly-randconfig-004-20250318    clang-20
i386        buildonly-randconfig-005-20250318    clang-20
i386        buildonly-randconfig-006-20250318    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250318    gcc-14.2.0
loongarch             randconfig-002-20250318    gcc-14.2.0
m68k                             allmodconfig    gcc-8.5.0
m68k                              allnoconfig    gcc-5.5.0
m68k                             allyesconfig    gcc-6.5.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-11.5.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-11.5.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250318    gcc-9.3.0
nios2                 randconfig-002-20250318    gcc-5.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-5.5.0
parisc                            allnoconfig    gcc-5.5.0
parisc                           allyesconfig    gcc-9.3.0
parisc                randconfig-001-20250318    gcc-8.5.0
parisc                randconfig-002-20250318    gcc-14.2.0
powerpc                          allmodconfig    gcc-10.5.0
powerpc                           allnoconfig    gcc-8.5.0
powerpc                          allyesconfig    clang-21
powerpc                     mpc5200_defconfig    clang-21
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250318    clang-21
powerpc               randconfig-002-20250318    clang-21
powerpc               randconfig-003-20250318    gcc-14.2.0
powerpc64             randconfig-001-20250318    clang-21
powerpc64             randconfig-002-20250318    gcc-14.2.0
powerpc64             randconfig-003-20250318    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-7.5.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250318    clang-21
riscv                 randconfig-002-20250318    clang-21
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-13.2.0
s390                  randconfig-001-20250318    clang-15
s390                  randconfig-002-20250318    gcc-12.4.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-10.5.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250318    gcc-14.2.0
sh                    randconfig-002-20250318    gcc-7.5.0
sh                             shx3_defconfig    gcc-5.5.0
sparc                            allmodconfig    gcc-6.5.0
sparc                             allnoconfig    gcc-6.5.0
sparc                 randconfig-001-20250318    gcc-14.2.0
sparc                 randconfig-002-20250318    gcc-14.2.0
sparc64               randconfig-001-20250318    gcc-11.5.0
sparc64               randconfig-002-20250318    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250318    clang-21
um                    randconfig-002-20250318    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250318    clang-20
x86_64      buildonly-randconfig-002-20250318    clang-20
x86_64      buildonly-randconfig-003-20250318    clang-20
x86_64      buildonly-randconfig-004-20250318    clang-20
x86_64      buildonly-randconfig-005-20250318    gcc-12
x86_64      buildonly-randconfig-006-20250318    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250318    gcc-14.2.0
xtensa                randconfig-002-20250318    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

