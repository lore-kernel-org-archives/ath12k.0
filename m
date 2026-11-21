Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54298606A330
	for <ath12k@archiver.kernel.org>; Sat, 21 Nov 2026 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DCBeVsRs;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SpfT8UZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2+TJ/oIyRwSAuN0AL0TNbcpRv8eeUQp/tk6xwrJZtns=; b=DCBeVsRsZ1OEXyKV8XOW57QBof
	YnM9AHtoNR6KwrwfoawmkdSsJkD8yRAU/cdWLg/kWmqVh94VW7zUGyoRsEjiDo/Yi9ADZC6/2TRTr
	sEETvWnxQib6yaT1J18NQGKWQu2VRS41i2dbxk3J8vXLr+HIMdszeFGTFFmLOBDbJLy3pjEDQQDb4
	dfzXuEKGg66oTLD0qlT8b39ULv0UHGCF9vN4C0bi0MtYq6wRaK/ABU2ssIgfA1sMFuwV718eba/si
	oTpAbJQoRAR+rvPnWYzN76/TD4v1AlJ5VPjuDsWUlYOcEWV0EqnIzmDSo+0wOvlTJG8LvSpHhsg13
	V5gFSKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUcY4-0000000GkVs-3S6o;
	Sat, 21 Nov 2026 04:18:00 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUcY2-0000000GkVX-2R43
	for ath12k@lists.infradead.org;
	Sat, 21 Nov 2026 04:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795234678; x=1826770678;
  h=date:from:to:cc:subject:message-id;
  bh=R07ZAcr3rYRBjDrPmvBC1UV+MPfQ86pYKBu3PGKozz0=;
  b=SpfT8UZS2hRvWoWJoQYRjfhFoX8+bI/cLuahKdMZ7cwnJatulOjYsahr
   r2eUBxLLn5u+LJfCnEua1NrpOIks2kSamoViYOzYi/onKLSvKWN+UcQuo
   4/hw1mJamkbcz8HKpGIyzUmim7G59ufjVR9cFYgzUhFHPz9SvHX5JVfNG
   Le18lqSHNLdVqRMF+Omh50lkiddFTZMbQtDggGM2f/V8xdgzQh8csDpaB
   HYCjWcRq/9AcsD+Ldr3Lq4+9Uao4pkWpwu4K2VwTlFJNqVl1Y+jiuLrfZ
   PnyIRtlSh2lOtVD20EcxO7RWpEzwShISXqllAIIWpwj24e0qNvY+dfOG7
   g==;
X-CSE-ConnectionGUID: Og/d5SoWTUaxVAw0kfqhng==
X-CSE-MsgGUID: RWd1z5ZGS+OLk3gYl32JpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4034606"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4034606"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 20:17:55 -0800
X-CSE-ConnectionGUID: rymDS0geQSy0lHqtlLzsfQ==
X-CSE-MsgGUID: cFOREolCQGCCzkGqo7A6GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10844262"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2026 20:17:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUcXv-00000001JV9-0iCN;
	Sat, 21 Nov 2026 04:17:51 +0000
Date: Sat, 21 Nov 2026 12:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 03b7c601b6e314115015a57061f5b377afe13190
Message-ID: <20261121121745.Dbi9WWdz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_201758_702393_C7397A58 
X-CRM114-Status: UNSURE (   3.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: 03b7c601b6e314115015a57061f5b377afe13190  drm/amd/display: use include guards instead of #pragma once in Core 2 headers

elapsed time: 1389m

configs tested: 415
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                 randconfig-2000-20261120    gcc-15.3.0
alpha                 randconfig-2001-20261120    gcc-15.3.0
alpha                 randconfig-2200-20261120    gcc-15.3.0 smatch
alpha                randconfig-r2107-20261120    gcc-11.5.0 cocci
alpha                randconfig-r2109-20261120    gcc-11.5.0 cocci
alpha                randconfig-r2111-20261120    gcc-11.5.0 cocci
alpha                randconfig-r2307-20261120    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                       axs103_smp_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261120    clang-17
arc                   randconfig-1000-20261121    clang-24
arc                   randconfig-1001-20261120    clang-17
arc                   randconfig-1001-20261121    clang-24
arc                   randconfig-2000-20261120    gcc-11.5.0
arc                   randconfig-2001-20261120    gcc-11.5.0
arc                   randconfig-2002-20261120    gcc-11.5.0
arc                   randconfig-2003-20261120    gcc-11.5.0
arc                   randconfig-2004-20261120    gcc-11.5.0
arc                   randconfig-2005-20261120    gcc-11.5.0
arc                   randconfig-2200-20261120    gcc-15.3.0 smatch
arc                  randconfig-r2102-20261120    gcc-8.5.0  cocci
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261120    clang-17
arm                   randconfig-1000-20261121    clang-24
arm                   randconfig-1001-20261120    clang-17
arm                   randconfig-1001-20261121    clang-24
arm                   randconfig-1002-20261120    clang-17
arm                   randconfig-1002-20261121    clang-24
arm                   randconfig-1003-20261120    clang-17
arm                   randconfig-1003-20261121    clang-24
arm                   randconfig-2000-20261120    gcc-8.5.0
arm                   randconfig-2001-20261120    gcc-8.5.0
arm                   randconfig-2002-20261120    gcc-8.5.0
arm                   randconfig-2200-20261120    clang-17   smatch
arm                  randconfig-r2307-20261120    gcc-13.5.0 sparse
arm                  randconfig-r2309-20261120    gcc-10.5.0 sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                         shmobile_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                 randconfig-1000-20261120    clang-18
arm64                 randconfig-1001-20261120    clang-18
arm64                 randconfig-1002-20261120    clang-18
arm64                 randconfig-1003-20261120    clang-18
arm64                 randconfig-2000-20261120    gcc-8.5.0
arm64                 randconfig-2001-20261120    gcc-8.5.0
arm64                 randconfig-2002-20261120    gcc-8.5.0
arm64                 randconfig-2200-20261120    clang-17   smatch
arm64                randconfig-r2107-20261120    clang-24   cocci
arm64                randconfig-r2108-20261120    clang-17   cocci
arm64                randconfig-r2110-20261120    gcc-11.5.0 cocci
arm64                randconfig-r2300-20261120    gcc-11.5.0 sparse
arm64                randconfig-r2303-20261120    clang-22   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                  randconfig-1000-20261120    clang-18
csky                  randconfig-1001-20261120    clang-18
csky                  randconfig-2000-20261120    gcc-16.2.0
csky                  randconfig-2001-20261120    gcc-16.2.0
csky                  randconfig-2200-20261120    gcc-15.3.0 smatch
csky                 randconfig-r2103-20261120    gcc-14     cocci
csky                 randconfig-r2106-20261120    gcc-11.5.0 cocci
csky                 randconfig-r2300-20261120    clang-22   sparse
csky                 randconfig-r2301-20261120    gcc-11.5.0 sparse
csky                 randconfig-r2304-20261120    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon               randconfig-1000-20261120    gcc-10.5.0
hexagon               randconfig-1000-20261121    gcc-11.5.0
hexagon               randconfig-1001-20261120    gcc-10.5.0
hexagon               randconfig-1001-20261121    gcc-11.5.0
hexagon               randconfig-2000-20261120    gcc-16.2.0
hexagon               randconfig-2001-20261120    gcc-16.2.0
hexagon               randconfig-2200-20261120    clang-17   smatch
hexagon              randconfig-r2104-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2107-20261120    clang-17   cocci
hexagon              randconfig-r2108-20261120    gcc-11.5.0 cocci
hexagon              randconfig-r2300-20261120    clang-24   sparse
hexagon              randconfig-r2303-20261120    gcc-16.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261120    clang-22
i386        buildonly-randconfig-1000-20261121    gcc-13
i386        buildonly-randconfig-1001-20261120    clang-22
i386        buildonly-randconfig-1001-20261121    gcc-13
i386        buildonly-randconfig-1002-20261120    clang-22
i386        buildonly-randconfig-1002-20261121    gcc-13
i386        buildonly-randconfig-1003-20261120    clang-22
i386        buildonly-randconfig-1003-20261121    gcc-13
i386        buildonly-randconfig-1004-20261120    clang-22
i386        buildonly-randconfig-1004-20261121    gcc-13
i386        buildonly-randconfig-1005-20261120    clang-22
i386        buildonly-randconfig-1005-20261121    gcc-13
i386                  randconfig-1000-20261120    clang-22
i386                  randconfig-1001-20261120    clang-22
i386                  randconfig-1002-20261120    clang-22
i386                  randconfig-1003-20261120    clang-22
i386                  randconfig-1004-20261120    clang-22
i386                  randconfig-1005-20261120    clang-22
i386                  randconfig-1006-20261120    clang-22
i386                  randconfig-1007-20261121    gcc-14
i386                  randconfig-1008-20261121    gcc-14
i386                  randconfig-1009-20261121    gcc-14
i386                  randconfig-1010-20261121    gcc-14
i386                  randconfig-1011-20261121    gcc-14
i386                  randconfig-1012-20261121    gcc-14
i386                  randconfig-1013-20261121    gcc-14
i386                  randconfig-2000-20261120    clang-22
i386                  randconfig-2001-20261120    clang-22
i386                  randconfig-2002-20261120    clang-22
i386                  randconfig-2003-20261120    clang-22
i386                  randconfig-2004-20261120    clang-22
i386                  randconfig-2005-20261120    clang-22
i386                  randconfig-2100-20261120    gcc-14     cocci
i386                  randconfig-2101-20261120    gcc-14     cocci
i386                  randconfig-2102-20261120    gcc-14     cocci
i386                  randconfig-2103-20261120    gcc-14     cocci
i386                  randconfig-2104-20261120    gcc-14     cocci
i386                  randconfig-2105-20261120    gcc-14     cocci
i386                  randconfig-2200-20261120    clang-22   smatch
i386                  randconfig-2300-20261120    clang-22   sparse
i386                  randconfig-2301-20261120    clang-22   sparse
i386                  randconfig-2302-20261120    clang-22   sparse
i386                 randconfig-r2100-20261120    gcc-14     cocci
i386                 randconfig-r2305-20261120    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261120    gcc-10.5.0
loongarch             randconfig-1000-20261121    gcc-11.5.0
loongarch             randconfig-1001-20261120    gcc-10.5.0
loongarch             randconfig-1001-20261121    gcc-11.5.0
loongarch             randconfig-2000-20261120    clang-24
loongarch             randconfig-2001-20261120    clang-24
loongarch             randconfig-2200-20261120    clang-18   smatch
loongarch            randconfig-r2100-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2101-20261120    gcc-16.2.0 cocci
loongarch            randconfig-r2102-20261120    gcc-16.2.0 cocci
loongarch            randconfig-r2303-20261120    clang-24   sparse
loongarch            randconfig-r2304-20261120    clang-22   sparse
loongarch            randconfig-r2311-20261120    gcc-13.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261120    gcc-15.3.0
m68k                  randconfig-2001-20261120    gcc-15.3.0
m68k                  randconfig-2200-20261120    gcc-14.4.0 smatch
m68k                 randconfig-r2105-20261120    gcc-8.5.0  cocci
m68k                 randconfig-r2300-20261120    gcc-16.2.0 sparse
m68k                 randconfig-r2305-20261120    gcc-16.2.0 sparse
m68k                 randconfig-r2306-20261120    gcc-8.5.0  sparse
m68k                 randconfig-r2311-20261120    gcc-14.4.0 sparse
m68k                         stmark2_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261120    gcc-15.3.0
microblaze            randconfig-2001-20261120    gcc-15.3.0
microblaze            randconfig-2200-20261120    gcc-11.5.0 smatch
microblaze           randconfig-r2101-20261120    gcc-14     cocci
microblaze           randconfig-r2301-20261120    gcc-16.2.0 sparse
microblaze           randconfig-r2302-20261120    clang-24   sparse
microblaze           randconfig-r2305-20261120    clang-24   sparse
microblaze           randconfig-r2309-20261120    gcc-13.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261120    gcc-9.5.0
mips                  randconfig-2001-20261120    gcc-9.5.0
mips                  randconfig-2002-20261120    gcc-9.5.0
mips                  randconfig-2200-20261120    clang-24   smatch
mips                 randconfig-r2105-20261120    gcc-16.2.0 cocci
mips                 randconfig-r2108-20261120    gcc-8.5.0  cocci
mips                 randconfig-r2302-20261120    gcc-16.2.0 sparse
mips                 randconfig-r2310-20261120    gcc-8.5.0  sparse
mips                 randconfig-r2311-20261120    gcc-10.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261120    gcc-10.5.0
nios2                 randconfig-1000-20261121    gcc-11.5.0
nios2                 randconfig-1001-20261120    gcc-10.5.0
nios2                 randconfig-1001-20261121    gcc-11.5.0
nios2                 randconfig-2000-20261120    clang-24
nios2                 randconfig-2001-20261120    clang-24
nios2                 randconfig-2200-20261120    gcc-11.5.0 smatch
nios2                randconfig-r2100-20261120    gcc-16.2.0 cocci
nios2                randconfig-r2103-20261120    gcc-16.2.0 cocci
nios2                randconfig-r2105-20261120    gcc-14     cocci
nios2                randconfig-r2301-20261120    clang-24   sparse
nios2                randconfig-r2303-20261120    gcc-11.5.0 sparse
nios2                randconfig-r2306-20261120    gcc-10.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261120    gcc-9.5.0
openrisc              randconfig-2001-20261120    gcc-9.5.0
openrisc              randconfig-2002-20261120    gcc-9.5.0
openrisc              randconfig-2200-20261120    gcc-11.5.0 smatch
openrisc             randconfig-r2104-20261120    gcc-14     cocci
openrisc             randconfig-r2109-20261120    gcc-8.5.0  cocci
openrisc             randconfig-r2110-20261120    clang-24   cocci
openrisc             randconfig-r2111-20261120    clang-24   cocci
openrisc             randconfig-r2304-20261120    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    gcc-16.2.0
parisc                randconfig-2000-20261120    clang-24
parisc                randconfig-2001-20261120    clang-24
parisc                randconfig-2200-20261120    gcc-8.5.0  smatch
parisc               randconfig-r2104-20261120    gcc-16.2.0 cocci
parisc               randconfig-r2107-20261120    gcc-8.5.0  cocci
parisc               randconfig-r2109-20261120    clang-24   cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       ep88xc_defconfig    gcc-16.2.0
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc               randconfig-2000-20261120    clang-24
powerpc               randconfig-2001-20261120    clang-24
powerpc               randconfig-2002-20261120    clang-24
powerpc               randconfig-2200-20261120    clang-17   smatch
powerpc              randconfig-r2307-20261120    gcc-14.4.0 sparse
powerpc              randconfig-r2310-20261120    gcc-14.4.0 sparse
powerpc64             randconfig-2000-20261120    clang-24
powerpc64             randconfig-2001-20261120    clang-24
powerpc64             randconfig-2002-20261120    clang-24
powerpc64             randconfig-2200-20261120    gcc-16.2.0 smatch
powerpc64            randconfig-r2102-20261120    gcc-14     cocci
powerpc64            randconfig-r2106-20261120    gcc-8.5.0  cocci
powerpc64            randconfig-r2108-20261120    clang-24   cocci
powerpc64            randconfig-r2111-20261120    clang-17   cocci
powerpc64            randconfig-r2111-20261120    gcc-8.5.0  cocci
powerpc64            randconfig-r2305-20261120    gcc-11.5.0 sparse
powerpc64            randconfig-r2308-20261120    gcc-14.4.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261120    gcc-11.5.0
riscv                 randconfig-1000-20261121    clang-17
riscv                 randconfig-1001-20261120    gcc-11.5.0
riscv                 randconfig-1001-20261121    clang-17
riscv                 randconfig-2000-20261120    clang-24
riscv                 randconfig-2001-20261120    clang-24
riscv                 randconfig-2002-20261120    clang-24
riscv                 randconfig-2003-20261120    clang-24
riscv                 randconfig-2004-20261120    clang-24
riscv                 randconfig-2005-20261120    clang-24
riscv                 randconfig-2200-20261120    gcc-8.5.0  smatch
riscv                randconfig-r2106-20261120    clang-24   cocci
riscv                randconfig-r2309-20261120    gcc-8.5.0  sparse
riscv                randconfig-r2310-20261120    gcc-10.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261120    gcc-11.5.0
s390                  randconfig-1000-20261121    clang-17
s390                  randconfig-1001-20261120    gcc-11.5.0
s390                  randconfig-1001-20261121    clang-17
s390                  randconfig-2000-20261120    clang-24
s390                  randconfig-2001-20261120    clang-24
s390                  randconfig-2002-20261120    clang-24
s390                  randconfig-2003-20261120    clang-24
s390                  randconfig-2004-20261120    clang-24
s390                  randconfig-2005-20261120    clang-24
s390                  randconfig-2200-20261120    clang-17   smatch
s390                 randconfig-r2106-20261120    clang-17   cocci
s390                 randconfig-r2109-20261120    clang-17   cocci
s390                 randconfig-r2302-20261120    clang-22   sparse
s390                 randconfig-r2310-20261120    gcc-13.5.0 sparse
s390                        zfcpdump_defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                                j2_defconfig    gcc-16.2.0
sh                           kfr2r09_defconfig    gcc-16.2.0
sh                           r7785rp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261120    gcc-11.5.0
sh                    randconfig-1000-20261121    clang-17
sh                    randconfig-1001-20261120    gcc-11.5.0
sh                    randconfig-1001-20261121    clang-17
sh                    randconfig-2000-20261120    gcc-11.5.0
sh                    randconfig-2001-20261120    gcc-11.5.0
sh                    randconfig-2002-20261120    gcc-11.5.0
sh                    randconfig-2003-20261120    gcc-11.5.0
sh                    randconfig-2004-20261120    gcc-11.5.0
sh                    randconfig-2005-20261120    gcc-11.5.0
sh                    randconfig-2200-20261120    gcc-11.5.0 smatch
sh                   randconfig-r2301-20261120    clang-22   sparse
sh                   randconfig-r2306-20261120    gcc-14.4.0 sparse
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261120    clang-24
sparc                 randconfig-1001-20261120    clang-24
sparc                 randconfig-2000-20261120    gcc-8.5.0
sparc                 randconfig-2001-20261120    gcc-8.5.0
sparc                 randconfig-2200-20261120    gcc-11.5.0 smatch
sparc                randconfig-r2101-20261120    gcc-8.5.0  cocci
sparc                randconfig-r2110-20261120    gcc-8.5.0  cocci
sparc                randconfig-r2302-20261120    gcc-11.5.0 sparse
sparc                randconfig-r2308-20261120    gcc-10.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261120    clang-24
sparc64               randconfig-1001-20261120    clang-24
sparc64               randconfig-2000-20261120    gcc-8.5.0
sparc64               randconfig-2001-20261120    gcc-8.5.0
sparc64               randconfig-2200-20261120    gcc-14.4.0 smatch
sparc64              randconfig-r2110-20261120    clang-17   cocci
sparc64              randconfig-r2308-20261120    gcc-13.5.0 sparse
sparc64              randconfig-r2311-20261120    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261120    clang-24
um                    randconfig-1001-20261120    clang-24
um                    randconfig-2000-20261120    gcc-8.5.0
um                    randconfig-2001-20261120    gcc-8.5.0
um                    randconfig-2200-20261120    clang-24   smatch
um                   randconfig-r2103-20261120    gcc-8.5.0  cocci
um                   randconfig-r2304-20261120    clang-24   sparse
um                   randconfig-r2306-20261120    gcc-13.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261121    clang-22
x86_64      buildonly-randconfig-1001-20261121    clang-22
x86_64      buildonly-randconfig-1002-20261121    clang-22
x86_64      buildonly-randconfig-1003-20261121    clang-22
x86_64      buildonly-randconfig-1004-20261121    clang-22
x86_64      buildonly-randconfig-1005-20261121    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261120    clang-22
x86_64                randconfig-1001-20261120    clang-22
x86_64                randconfig-1002-20261120    clang-22
x86_64                randconfig-1003-20261120    clang-22
x86_64                randconfig-1004-20261120    clang-22
x86_64                randconfig-1005-20261120    clang-22
x86_64                randconfig-1006-20261120    clang-22
x86_64                randconfig-1007-20261120    clang-22
x86_64                randconfig-1008-20261120    clang-22
x86_64                randconfig-1009-20261120    clang-22
x86_64                randconfig-1010-20261120    clang-22
x86_64                randconfig-1011-20261120    clang-22
x86_64                randconfig-2000-20261120    clang-22
x86_64                randconfig-2001-20261120    clang-22
x86_64                randconfig-2002-20261120    clang-22
x86_64                randconfig-2003-20261120    clang-22
x86_64                randconfig-2004-20261120    clang-22
x86_64                randconfig-2005-20261120    clang-22
x86_64                randconfig-2100-20261120    gcc-14     cocci
x86_64                randconfig-2101-20261120    gcc-14     cocci
x86_64                randconfig-2102-20261120    gcc-14     cocci
x86_64                randconfig-2103-20261120    gcc-14     cocci
x86_64                randconfig-2104-20261120    gcc-14     cocci
x86_64                randconfig-2105-20261120    gcc-14     cocci
x86_64                randconfig-2200-20261120    clang-22   smatch
x86_64                randconfig-2300-20261120    clang-22   sparse
x86_64                randconfig-2301-20261120    clang-22   sparse
x86_64                randconfig-2302-20261120    clang-22   sparse
x86_64               randconfig-r2309-20261120    gcc-14.4.0 sparse
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
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261120    clang-24
xtensa                randconfig-1001-20261120    clang-24
xtensa                randconfig-2000-20261120    gcc-16.2.0
xtensa                randconfig-2001-20261120    gcc-16.2.0
xtensa                randconfig-2200-20261120    gcc-9.5.0  smatch
xtensa               randconfig-r2307-20261120    gcc-10.5.0 sparse
xtensa               randconfig-r2308-20261120    gcc-8.5.0  sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

