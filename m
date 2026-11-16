Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6530A606A31C
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 19:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h5qtM8eU;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EsSnhnq3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ixECoo5laLpb0pAebbkh1tS5iaNqKImT0wpzAvhxxyY=; b=h5qtM8eUsGQi9fKCxqJPd7JzCj
	nHhU0p7CuO1YzbxG9KfLATlU1Bgt6KB/JCaksRSokkB+2QoxnbrjaN8XZ5ZTyJo8UR7CO13+Ezr1L
	Dr+i2VXqCkg9xppAJSmTtX1SHejb/U/VCmglqsSLi03oV4ZkSP5DiLn1QLAH/sH4Ghp0Z3Kabdy3H
	YdEwMX9VDbmJm6XQi7WAeyN1d+uGBjYsmJWO9AL8vYXm7GY2FmqxFoqqTzozdtbJuC4iz9TjnXwB+
	wcEM5QqXajKi+YhK8TImoewkfZNtoL+mOUJ6YDDFjHjYXreNjSSFModMfAgIsUMCkeNOerFv+vM2n
	KrWN0EIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2k5-00000003nXo-1oqc;
	Mon, 16 Nov 2026 19:51:53 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2k1-00000003nXR-2rFf
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 19:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794858710; x=1826394710;
  h=date:from:to:cc:subject:message-id;
  bh=Eo3wokeuDfLaPhIhn+gNegUv+EcDDgzBhiD1/VQBzGE=;
  b=EsSnhnq3ztEecBFsCQLU26tXh9hXyS/v55AYiO6FA9r6DsxPPNNF6yvf
   qGZvcB5vsZTKB0szZuVanVdL8ZvUj6eDH9cBBX4AC590lb+4lpK3LsiGF
   qMdLdETxk10lrVwBq0EY2w2Bnbzl/mu85mfVvGoAL40QfrD5nMxKH3ddL
   zFe8GliYMbjFo56mtjxT+IK6xQva4QG+pBPRU2jAVf6m5JK0xQ+a5gmKn
   0x/J1ufd/ycj1oLQHs8T7UhenuXJtvhoZSkOJBfyLRPQ7AZX9FayYitBu
   CDf3/3/FYqgfabqnqqbZH8D8e0FmA+H51jExQUTxHGCgeNAjEPTtwlP1U
   w==;
X-CSE-ConnectionGUID: Q+5lgeb0QDqcQJ3PgczPvQ==
X-CSE-MsgGUID: fSE08BOlT5qwDIJN+CyWbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3487913"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3487913"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 11:51:48 -0800
X-CSE-ConnectionGUID: 9Njib57lQr+iYhk/yUrvXQ==
X-CSE-MsgGUID: Pj/LAH5FRFy3oH6Rt2ruvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9948276"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2026 11:51:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT2jw-000000019MK-0Ml8;
	Mon, 16 Nov 2026 19:51:44 +0000
Date: Tue, 17 Nov 2026 03:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 983dbe9129e04693ee8905449fb757fa60cebc76
Message-ID: <20261117035104.dWTUnQi4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_115149_764224_C9E5F309 
X-CRM114-Status: UNSURE (   4.34  )
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
branch HEAD: 983dbe9129e04693ee8905449fb757fa60cebc76  drm/amd/display: use include guards instead of #pragma once in Core 2 headers

elapsed time: 1388m

configs tested: 356
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261114    gcc-12.5.0
alpha                 randconfig-2001-20261114    gcc-12.5.0
alpha                 randconfig-2200-20261114    gcc-9.5.0  smatch
alpha                 randconfig-2200-20261116    gcc-15.3.0 smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261116    gcc-8.5.0
arc                   randconfig-1001-20261116    gcc-8.5.0
arc                   randconfig-2000-20261114    gcc-11.5.0
arc                   randconfig-2001-20261114    gcc-11.5.0
arc                   randconfig-2002-20261114    gcc-11.5.0
arc                   randconfig-2003-20261114    gcc-11.5.0
arc                   randconfig-2004-20261114    gcc-11.5.0
arc                   randconfig-2005-20261114    gcc-11.5.0
arc                   randconfig-2200-20261114    gcc-8.5.0  smatch
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                              mxs_defconfig    clang-17
arm                         neponset_defconfig    gcc-16.2.0
arm                          nhk8815_defconfig    clang-24
arm                          orion5x_defconfig    clang-24
arm                          orion5x_defconfig    gcc-16.2.0
arm                              pxa_defconfig    clang-24
arm                   randconfig-1000-20261116    gcc-8.5.0
arm                   randconfig-1001-20261116    gcc-8.5.0
arm                   randconfig-1002-20261116    gcc-8.5.0
arm                   randconfig-1003-20261116    gcc-8.5.0
arm                   randconfig-2000-20261114    gcc-10.5.0
arm                   randconfig-2001-20261114    gcc-10.5.0
arm                   randconfig-2002-20261114    gcc-10.5.0
arm                   randconfig-2200-20261114    clang-17   smatch
arm                  randconfig-r2310-20261114    clang-24   sparse
arm                         realview_defconfig    clang-17
arm                            sama7_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    clang-24
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-2000-20261114    gcc-10.5.0
arm64                 randconfig-2001-20261114    gcc-10.5.0
arm64                 randconfig-2002-20261114    gcc-10.5.0
arm64                 randconfig-2200-20261114    clang-17   smatch
arm64                 randconfig-2200-20261116    gcc-8.5.0  smatch
arm64                randconfig-r2103-20261114    clang-24   cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-2000-20261114    gcc-16.2.0
csky                  randconfig-2001-20261114    gcc-16.2.0
csky                  randconfig-2200-20261114    gcc-16.2.0 smatch
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261116    clang-17
hexagon               randconfig-1001-20261116    clang-17
hexagon               randconfig-2000-20261114    gcc-16.2.0
hexagon               randconfig-2001-20261114    gcc-16.2.0
hexagon               randconfig-2200-20261114    clang-24   smatch
hexagon              randconfig-r2301-20261114    gcc-12.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261116    gcc-14
i386        buildonly-randconfig-1001-20261116    gcc-14
i386        buildonly-randconfig-1002-20261116    gcc-14
i386        buildonly-randconfig-1003-20261116    gcc-14
i386        buildonly-randconfig-1004-20261116    gcc-14
i386        buildonly-randconfig-1005-20261116    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261116    gcc-14
i386                  randconfig-1001-20261116    gcc-14
i386                  randconfig-1002-20261116    gcc-14
i386                  randconfig-1003-20261116    gcc-14
i386                  randconfig-1004-20261116    gcc-14
i386                  randconfig-1005-20261116    gcc-14
i386                  randconfig-1006-20261116    gcc-14
i386                  randconfig-1007-20261116    gcc-12
i386                  randconfig-1008-20261116    gcc-12
i386                  randconfig-1009-20261116    gcc-12
i386                  randconfig-1010-20261116    gcc-12
i386                  randconfig-1011-20261116    gcc-12
i386                  randconfig-1012-20261116    gcc-12
i386                  randconfig-1013-20261116    gcc-12
i386                  randconfig-2000-20261114    clang-22
i386                  randconfig-2001-20261114    clang-22
i386                  randconfig-2002-20261114    clang-22
i386                  randconfig-2003-20261114    clang-22
i386                  randconfig-2003-20261114    gcc-14
i386                  randconfig-2004-20261114    clang-22
i386                  randconfig-2004-20261114    gcc-14
i386                  randconfig-2005-20261114    clang-22
i386                  randconfig-2005-20261114    gcc-14
i386                  randconfig-2100-20261114    gcc-14     cocci
i386                  randconfig-2101-20261114    gcc-14     cocci
i386                  randconfig-2102-20261114    gcc-14     cocci
i386                  randconfig-2103-20261114    gcc-14     cocci
i386                  randconfig-2104-20261114    gcc-14     cocci
i386                  randconfig-2105-20261114    gcc-14     cocci
i386                  randconfig-2200-20261114    gcc-14     smatch
i386                  randconfig-2300-20261114    clang-22   sparse
i386                  randconfig-2300-20261114    gcc-12     sparse
i386                  randconfig-2301-20261114    clang-22   sparse
i386                  randconfig-2301-20261114    gcc-14     sparse
i386                  randconfig-2302-20261114    clang-22   sparse
i386                  randconfig-2302-20261114    gcc-14     sparse
i386                 randconfig-r2311-20261114    clang-24   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261116    clang-17
loongarch             randconfig-1001-20261116    clang-17
loongarch             randconfig-2000-20261114    gcc-11.5.0
loongarch             randconfig-2001-20261114    gcc-11.5.0
loongarch             randconfig-2200-20261114    clang-18   smatch
loongarch            randconfig-r2303-20261114    gcc-12.5.0 sparse
loongarch            randconfig-r2304-20261114    gcc-12.5.0 sparse
loongarch            randconfig-r2308-20261114    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-17
m68k                        m5329evb_defconfig    clang-17
m68k                  randconfig-2000-20261114    gcc-12.5.0
m68k                  randconfig-2001-20261114    gcc-12.5.0
m68k                  randconfig-2200-20261114    gcc-16.2.0 smatch
microblaze                        alldefconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261114    gcc-12.5.0
microblaze            randconfig-2001-20261114    gcc-12.5.0
microblaze            randconfig-2200-20261114    gcc-9.5.0  smatch
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath79_defconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    clang-17
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261114    gcc-16.2.0
mips                  randconfig-2001-20261114    gcc-16.2.0
mips                  randconfig-2002-20261114    gcc-16.2.0
mips                  randconfig-2200-20261114    gcc-15.3.0 smatch
mips                 randconfig-r2100-20261114    clang-24   cocci
mips                 randconfig-r2107-20261114    clang-24   cocci
mips                            rs90_defconfig    gcc-16.2.0
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261116    clang-17
nios2                 randconfig-1001-20261116    clang-17
nios2                 randconfig-2000-20261114    gcc-11.5.0
nios2                 randconfig-2001-20261114    gcc-11.5.0
nios2                 randconfig-2200-20261114    gcc-11.5.0 smatch
nios2                randconfig-r2105-20261114    clang-24   cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261114    gcc-16.2.0
openrisc              randconfig-2001-20261114    gcc-16.2.0
openrisc              randconfig-2002-20261114    gcc-16.2.0
openrisc              randconfig-2200-20261114    gcc-16.2.0 smatch
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261116    gcc-16.2.0
parisc                randconfig-1001-20261116    gcc-16.2.0
parisc                randconfig-2000-20261114    gcc-11.5.0
parisc                randconfig-2001-20261114    gcc-11.5.0
parisc                randconfig-2200-20261114    gcc-8.5.0  smatch
parisc                randconfig-2200-20261116    gcc-8.5.0  smatch
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        eiger_defconfig    clang-17
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                  linkstation_defconfig    gcc-16.2.0
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                       ppc44x_defconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    clang-24
powerpc               randconfig-1000-20261116    gcc-16.2.0
powerpc               randconfig-1001-20261116    gcc-16.2.0
powerpc               randconfig-2000-20261114    gcc-8.5.0
powerpc               randconfig-2001-20261114    gcc-8.5.0
powerpc               randconfig-2002-20261114    gcc-8.5.0
powerpc               randconfig-2200-20261114    clang-24   smatch
powerpc              randconfig-r2101-20261114    clang-24   cocci
powerpc              randconfig-r2104-20261114    clang-24   cocci
powerpc                      tqm8548_defconfig    clang-24
powerpc64             randconfig-1000-20261116    gcc-16.2.0
powerpc64             randconfig-1001-20261116    gcc-16.2.0
powerpc64             randconfig-2000-20261114    gcc-8.5.0
powerpc64             randconfig-2001-20261114    gcc-8.5.0
powerpc64             randconfig-2002-20261114    gcc-8.5.0
powerpc64             randconfig-2200-20261114    clang-17   smatch
powerpc64            randconfig-r2307-20261114    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261116    clang-17
riscv                 randconfig-1001-20261116    clang-17
riscv                 randconfig-2000-20261114    gcc-12.5.0
riscv                 randconfig-2001-20261114    gcc-12.5.0
riscv                 randconfig-2002-20261114    gcc-12.5.0
riscv                 randconfig-2003-20261114    gcc-12.5.0
riscv                 randconfig-2004-20261114    gcc-12.5.0
riscv                 randconfig-2005-20261114    gcc-12.5.0
riscv                 randconfig-2200-20261114    clang-24   smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261116    clang-17
s390                  randconfig-1001-20261116    clang-17
s390                  randconfig-2000-20261114    clang-24
s390                  randconfig-2001-20261114    clang-24
s390                  randconfig-2002-20261114    clang-24
s390                  randconfig-2003-20261114    clang-24
s390                  randconfig-2004-20261114    clang-24
s390                  randconfig-2005-20261114    clang-24
s390                  randconfig-2200-20261114    clang-24   smatch
s390                  randconfig-2200-20261116    gcc-10.5.0 smatch
s390                 randconfig-r2102-20261114    clang-24   cocci
s390                 randconfig-r2108-20261114    clang-24   cocci
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261116    clang-17
sh                    randconfig-1001-20261116    clang-17
sh                    randconfig-2000-20261114    gcc-13.5.0
sh                    randconfig-2001-20261114    gcc-13.5.0
sh                    randconfig-2002-20261114    gcc-13.5.0
sh                    randconfig-2003-20261114    gcc-13.5.0
sh                    randconfig-2004-20261114    gcc-13.5.0
sh                    randconfig-2005-20261114    gcc-13.5.0
sh                    randconfig-2200-20261114    gcc-9.5.0  smatch
sh                   randconfig-r2302-20261114    gcc-12.5.0 sparse
sh                   randconfig-r2305-20261114    gcc-12.5.0 sparse
sh                           sdk7780_defconfig    gcc-16.2.0
sh                           sdk7786_defconfig    clang-17
sh                            se7206_defconfig    clang-17
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261116    gcc-16.2.0
sparc                 randconfig-1001-20261116    gcc-16.2.0
sparc                 randconfig-2000-20261114    clang-21
sparc                 randconfig-2000-20261114    gcc-11.5.0
sparc                 randconfig-2001-20261114    clang-21
sparc                 randconfig-2001-20261114    gcc-13.5.0
sparc                 randconfig-2200-20261114    gcc-8.5.0  smatch
sparc                randconfig-r2106-20261114    clang-24   cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261116    gcc-16.2.0
sparc64               randconfig-1001-20261116    gcc-16.2.0
sparc64               randconfig-2000-20261114    clang-21
sparc64               randconfig-2000-20261114    clang-24
sparc64               randconfig-2001-20261114    clang-21
sparc64               randconfig-2001-20261114    gcc-8.5.0
sparc64              randconfig-r2309-20261114    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261116    gcc-16.2.0
um                    randconfig-1001-20261116    gcc-16.2.0
um                    randconfig-2000-20261114    clang-21
um                    randconfig-2000-20261114    clang-24
um                    randconfig-2001-20261114    clang-21
um                    randconfig-2200-20261114    gcc-14     smatch
um                   randconfig-r2111-20261114    clang-24   cocci
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261116    gcc-14
x86_64      buildonly-randconfig-1001-20261116    gcc-14
x86_64      buildonly-randconfig-1002-20261116    gcc-14
x86_64      buildonly-randconfig-1003-20261116    gcc-14
x86_64      buildonly-randconfig-1004-20261116    gcc-14
x86_64      buildonly-randconfig-1005-20261116    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261116    gcc-14
x86_64                randconfig-1001-20261116    gcc-14
x86_64                randconfig-1002-20261116    gcc-14
x86_64                randconfig-1003-20261116    gcc-14
x86_64                randconfig-1004-20261116    gcc-14
x86_64                randconfig-1005-20261116    gcc-14
x86_64                randconfig-1006-20261116    clang-22
x86_64                randconfig-1007-20261116    clang-22
x86_64                randconfig-1008-20261116    clang-22
x86_64                randconfig-1009-20261116    clang-22
x86_64                randconfig-1010-20261116    clang-22
x86_64                randconfig-1011-20261116    clang-22
x86_64                randconfig-1012-20261116    clang-22
x86_64                randconfig-1013-20261116    clang-22
x86_64                randconfig-1014-20261116    clang-22
x86_64                randconfig-1015-20261116    clang-22
x86_64                randconfig-1016-20261116    clang-22
x86_64                randconfig-1017-20261116    clang-22
x86_64                randconfig-2000-20261114    gcc-14
x86_64                randconfig-2001-20261114    gcc-14
x86_64                randconfig-2002-20261114    gcc-14
x86_64                randconfig-2003-20261114    gcc-14
x86_64                randconfig-2004-20261114    gcc-14
x86_64                randconfig-2005-20261114    gcc-14
x86_64                randconfig-2100-20261114    gcc-14     cocci
x86_64                randconfig-2101-20261114    gcc-14     cocci
x86_64                randconfig-2102-20261114    gcc-14     cocci
x86_64                randconfig-2103-20261114    gcc-14     cocci
x86_64                randconfig-2104-20261114    gcc-14     cocci
x86_64                randconfig-2105-20261114    gcc-14     cocci
x86_64                randconfig-2200-20261114    gcc-14     smatch
x86_64                randconfig-2300-20261114    clang-22   sparse
x86_64                randconfig-2300-20261114    gcc-12     sparse
x86_64                randconfig-2301-20261114    clang-22   sparse
x86_64                randconfig-2301-20261114    gcc-14     sparse
x86_64                randconfig-2302-20261114    clang-22   sparse
x86_64               randconfig-r2109-20261114    clang-24   cocci
x86_64               randconfig-r2110-20261114    clang-24   cocci
x86_64               randconfig-r2300-20261114    gcc-12.5.0 sparse
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
xtensa                randconfig-1000-20261116    gcc-16.2.0
xtensa                randconfig-1001-20261116    gcc-16.2.0
xtensa                randconfig-2000-20261114    gcc-16.2.0
xtensa                randconfig-2001-20261114    gcc-16.2.0
xtensa               randconfig-r2306-20261114    clang-24   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

