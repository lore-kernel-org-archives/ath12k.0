Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE12C0218C
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RvUgY8b+1tMlcZnwd5aeqwEox99FFxPoIhCff3T31+Q=; b=YOjPgXEbcCzCjK95Nis1iduGhy
	5JuCZJcA0rWC7AQH7oa4Rx0Oe3ArzQ91fJNKMuJUfsxODYLyE22b2QMc3WW3obSLCkATzsnMnor6e
	UN6ORRf5cvhWsQnsWegC8XJqvDf7Bb+9gaYxSoj92tkvWMIqvDIdXKuGnK8Bf1siUqvPxSKGCF4zg
	p8OJcWZlc0KsUa0GNtSYVlKfqavJl/cRcoRvfLFQkld7j7NkBE7oryr5gMEPz1Lfci10qW61x20VP
	7p3nubECew745QAWS7TvirWAFWgd9VRJTRjKQfy2oA/BKhrnh70v1fz9pR4x5Oq/WEw3nC08/jDAN
	a6pcQr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcL0y-00000001xEf-1kLS
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 09:02:40 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcL0v-00000001xCA-3Pkd
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 09:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737968558; x=1769504558;
  h=date:from:to:cc:subject:message-id;
  bh=gwaicsXiKLnFyn5prQ0Isp0pNGxjmGMI3SOSu+L4ttA=;
  b=c25yMMdwrj6lZsaUMEfblYKtyieZGzQ7J3KTr/F8gMo5lfx0ivVyQC4r
   FWhEFYcrXFWmAlHrkfQPZZBgSoCGukOvBpXCIV8slenogfWwAFNFYWzhv
   HKrYcHaUMxxlfZebVnYuMnug4EfEWIDUcS4x/QKsoycePfnNn2OrZioQM
   lznXkHHrXuzrOVIeSUkNGv6mcvfux2eQ6LmTKP3EyH8bRC1fAB+HlxPhX
   ObBn1I6TYnMGoiM+AmdOVO6JLamJ0bREnJGIMrzCRWwMIZo4imt56P/WN
   So9+KTVv6HDZuwPXYUHGcDOD7Wzc2VTVQVc54R9V0rqmG1mkmxBEWHAlv
   A==;
X-CSE-ConnectionGUID: Vyciho/SRJqNnh3ecYI0jg==
X-CSE-MsgGUID: laZsljLfT4SBjvQzg17W9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="49407917"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="49407917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 01:02:36 -0800
X-CSE-ConnectionGUID: lLImAapeSi+eYgt1kQJQ5w==
X-CSE-MsgGUID: UbmqC02vQr67jDDKMyQoaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="113371095"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2025 01:02:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcL0r-000gb1-1e;
	Mon, 27 Jan 2025 09:02:33 +0000
Date: Mon, 27 Jan 2025 17:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 58b976e4f4b4d727eea27c0e40830853ef7ecf0e
Message-ID: <202501271700.jLEj8Uz1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_010237_930900_15CAB559 
X-CRM114-Status: UNSURE (   3.42  )
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
branch HEAD: 58b976e4f4b4d727eea27c0e40830853ef7ecf0e  wifi: ath12k: Enable monitor ring mask for QCN9274

elapsed time: 722m

configs tested: 137
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250127    gcc-13.2.0
arc                   randconfig-002-20250127    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-20
arm                   randconfig-001-20250127    gcc-14.2.0
arm                   randconfig-002-20250127    gcc-14.2.0
arm                   randconfig-003-20250127    clang-16
arm                   randconfig-004-20250127    clang-18
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250127    gcc-14.2.0
arm64                 randconfig-002-20250127    gcc-14.2.0
arm64                 randconfig-003-20250127    gcc-14.2.0
arm64                 randconfig-004-20250127    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250127    gcc-14.2.0
csky                  randconfig-002-20250127    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250127    clang-17
hexagon               randconfig-002-20250127    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250127    gcc-12
i386        buildonly-randconfig-002-20250127    clang-19
i386        buildonly-randconfig-003-20250127    gcc-12
i386        buildonly-randconfig-004-20250127    gcc-12
i386        buildonly-randconfig-005-20250127    gcc-12
i386        buildonly-randconfig-006-20250127    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250127    gcc-14.2.0
loongarch             randconfig-002-20250127    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-20
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250127    gcc-14.2.0
nios2                 randconfig-002-20250127    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250127    gcc-14.2.0
parisc                randconfig-002-20250127    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                       ppc64_defconfig    clang-19
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250127    clang-16
powerpc               randconfig-002-20250127    gcc-14.2.0
powerpc               randconfig-003-20250127    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250127    gcc-14.2.0
powerpc64             randconfig-002-20250127    gcc-14.2.0
powerpc64             randconfig-003-20250127    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250127    clang-20
riscv                 randconfig-002-20250127    clang-16
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250127    clang-20
s390                  randconfig-002-20250127    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250127    gcc-14.2.0
sh                    randconfig-002-20250127    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250127    gcc-14.2.0
sparc                 randconfig-002-20250127    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250127    gcc-14.2.0
sparc64               randconfig-002-20250127    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250127    clang-20
um                    randconfig-002-20250127    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250127    clang-19
x86_64      buildonly-randconfig-002-20250127    clang-19
x86_64      buildonly-randconfig-003-20250127    clang-19
x86_64      buildonly-randconfig-004-20250127    clang-19
x86_64      buildonly-randconfig-005-20250127    gcc-12
x86_64      buildonly-randconfig-006-20250127    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250127    gcc-14.2.0
xtensa                randconfig-002-20250127    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

