Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC7606A323
	for <ath12k@archiver.kernel.org>; Fri, 27 Nov 2026 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BT/pyuY/;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOfALqOb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LIgGkTzLNziPAB76rE42qf2/9JSNJzb7zfNw1PI1fLA=; b=BT/pyuY/tSX5qmRvdDsxJY8f8m
	0IcShxJrvFg6AplfbekzGwRh/8olU2gMwAT4g9VtYe8dZd4XyTredAghlyPfEANbvJELA/XvCzHzR
	kp4d4zOCa869TEqYWRmbhijGu8+/8oQmE4saxUeJphl1XweoXRbkMcJNN30sytVFDj6NWP0yJNnYA
	1hDG7VNN4hYJJLuPcpLNNYcvTTG+LJdhUHduVXLGBRV1AwQVXrVXdjP1tkU7VJ2d94NYP/BjMcY0p
	Y+mHUWNJ+sFxyhW4aNlwkHOcLYWwp4xq/RlNzkQJ34pWcNRpAlnmZTaUVvNBj24gxboa7X6fsxbdQ
	DpN6Si0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx89-0000000GbI6-0Qdz;
	Fri, 27 Nov 2026 14:40:53 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx85-0000000GbHM-1Isl
	for ath12k@lists.infradead.org;
	Fri, 27 Nov 2026 14:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795790449; x=1827326449;
  h=date:from:to:cc:subject:message-id;
  bh=ty6F1TDjG2wVgU4yo6sKULHpuS4UStLtRaa8ruintSY=;
  b=DOfALqObxsZvglXKEWFg9w4wxhc63xUf00qsfsBrcxSqOOr9r+tU0Mte
   LwNeulob75djE3ONoKrTOCiOM0UL2rITuZa0BYOg3AKR4EQIm9GB09yVY
   6qhOWGdWUbx5jbTaJ+dOGlhWycXVCuolxRwICTF7L+89lDBU/CxkM3hRx
   OJqzB6pWk1h4tFuIqhUFe/KBYMfF6DVFb6IKVeq517oXQIG76FIrd+jE4
   baQyz0Qnzs3btxTLQlsIkQHduOd7mG4RR5DjrefcbficqlM18F/MJv+Ww
   QkBB5JiDeQddgYwch6Hg7Br9hhTH0Fx1mt0KCt9w4quE6gcxRdK+s7/il
   A==;
X-CSE-ConnectionGUID: TfctjmQJQfaMHfV5oZKthg==
X-CSE-MsgGUID: 7lLSYyxBQvurHXKum5d4dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4610346"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4610346"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:40:47 -0800
X-CSE-ConnectionGUID: gxpZspqZQvqkWO7Hsewf3A==
X-CSE-MsgGUID: Nnzi+Lu/R5G9Lj1aCKztnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14431755"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 27 Nov 2026 06:40:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWx7y-00000001WE6-33KK;
	Fri, 27 Nov 2026 14:40:42 +0000
Date: Fri, 27 Nov 2026 22:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 ba015e05863e3e57cb4c07ca94f78aba05b1ba23
Message-ID: <20261127224013.7nMzK3F7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_064049_459928_A526EA68 
X-CRM114-Status: UNSURE (   3.97  )
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
branch HEAD: ba015e05863e3e57cb4c07ca94f78aba05b1ba23  drm/amd/display: use include guards instead of #pragma once in Core 2 headers

elapsed time: 1104m

configs tested: 387
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261126    gcc-13.5.0
alpha                 randconfig-2001-20261126    gcc-13.5.0
alpha                 randconfig-2200-20261126    gcc-9.5.0  smatch
alpha                randconfig-r2107-20261126    gcc-14     cocci
alpha                randconfig-r2111-20261126    gcc-14.4.0 cocci
alpha                randconfig-r2302-20261126    gcc-11.5.0 sparse
alpha                randconfig-r2302-20261126    gcc-15.3.0 sparse
alpha                randconfig-r2307-20261126    gcc-12.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-2000-20261126    gcc-9.5.0
arc                   randconfig-2001-20261126    gcc-9.5.0
arc                   randconfig-2002-20261126    gcc-9.5.0
arc                   randconfig-2003-20261126    gcc-9.5.0
arc                   randconfig-2004-20261126    gcc-9.5.0
arc                   randconfig-2005-20261126    gcc-9.5.0
arc                   randconfig-2200-20261126    gcc-8.5.0  smatch
arc                  randconfig-r2106-20261126    gcc-14     cocci
arc                  randconfig-r2108-20261126    gcc-14     cocci
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                   randconfig-2000-20261126    gcc-11.5.0
arm                   randconfig-2001-20261126    gcc-11.5.0
arm                   randconfig-2002-20261126    gcc-11.5.0
arm                   randconfig-2200-20261126    gcc-8.5.0  smatch
arm                  randconfig-r2100-20261126    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261126    gcc-8.5.0  cocci
arm                  randconfig-r2106-20261126    clang-24   cocci
arm                  randconfig-r2107-20261126    gcc-14     cocci
arm                  randconfig-r2111-20261126    gcc-11.5.0 cocci
arm                  randconfig-r2301-20261126    clang-18   sparse
arm                  randconfig-r2304-20261126    clang-24   sparse
arm                  randconfig-r2309-20261126    gcc-12.5.0 sparse
arm                  randconfig-r2310-20261126    gcc-12.5.0 sparse
arm                  randconfig-r2311-20261126    clang-18   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261127    gcc-8.5.0
arm64                 randconfig-1001-20261127    gcc-8.5.0
arm64                 randconfig-1002-20261127    gcc-8.5.0
arm64                 randconfig-1003-20261127    gcc-8.5.0
arm64                 randconfig-2000-20261126    gcc-11.5.0
arm64                 randconfig-2001-20261126    gcc-11.5.0
arm64                 randconfig-2002-20261126    gcc-11.5.0
arm64                 randconfig-2200-20261126    clang-24   smatch
arm64                randconfig-r2101-20261126    gcc-8.5.0  cocci
arm64                randconfig-r2103-20261126    clang-24   cocci
arm64                randconfig-r2107-20261126    gcc-15.3.0 cocci
arm64                randconfig-r2109-20261126    gcc-11.5.0 cocci
arm64                randconfig-r2300-20261126    clang-24   sparse
arm64                randconfig-r2308-20261126    clang-22   sparse
arm64                randconfig-r2310-20261126    clang-18   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261127    gcc-8.5.0
csky                  randconfig-1001-20261127    gcc-8.5.0
csky                  randconfig-2000-20261126    gcc-13.5.0
csky                  randconfig-2001-20261126    gcc-13.5.0
csky                  randconfig-2200-20261126    gcc-13.5.0 smatch
csky                 randconfig-r2102-20261126    clang-24   cocci
csky                 randconfig-r2103-20261126    gcc-13     cocci
csky                 randconfig-r2306-20261126    gcc-12.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261127    gcc-9.5.0
hexagon               randconfig-1001-20261127    gcc-9.5.0
hexagon               randconfig-2000-20261126    gcc-13.5.0
hexagon               randconfig-2001-20261126    gcc-13.5.0
hexagon               randconfig-2200-20261126    clang-17   smatch
hexagon              randconfig-r2102-20261126    gcc-13     cocci
hexagon              randconfig-r2108-20261126    gcc-14.4.0 cocci
hexagon              randconfig-r2109-20261126    clang-24   cocci
hexagon              randconfig-r2302-20261126    gcc-11.5.0 sparse
hexagon              randconfig-r2302-20261126    gcc-9.5.0  sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261127    clang-22
i386        buildonly-randconfig-1001-20261127    clang-22
i386        buildonly-randconfig-1002-20261127    clang-22
i386        buildonly-randconfig-1003-20261127    clang-22
i386        buildonly-randconfig-1004-20261127    clang-22
i386        buildonly-randconfig-1005-20261127    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-2000-20261126    clang-22
i386                  randconfig-2001-20261126    clang-22
i386                  randconfig-2002-20261126    clang-22
i386                  randconfig-2003-20261126    clang-22
i386                  randconfig-2004-20261126    clang-22
i386                  randconfig-2005-20261126    clang-22
i386                  randconfig-2100-20261126    clang-22   cocci
i386                  randconfig-2101-20261126    clang-22   cocci
i386                  randconfig-2102-20261126    clang-22   cocci
i386                  randconfig-2103-20261126    clang-22   cocci
i386                  randconfig-2104-20261126    clang-22   cocci
i386                  randconfig-2105-20261126    clang-22   cocci
i386                  randconfig-2200-20261126    gcc-14     smatch
i386                  randconfig-2300-20261126    gcc-14     sparse
i386                  randconfig-2301-20261126    gcc-14     sparse
i386                  randconfig-2302-20261126    gcc-14     sparse
i386                 randconfig-r2100-20261126    gcc-13     cocci
i386                 randconfig-r2102-20261126    clang-18   cocci
i386                 randconfig-r2110-20261126    gcc-14     cocci
i386                 randconfig-r2110-20261126    gcc-14.4.0 cocci
i386                 randconfig-r2111-20261126    clang-24   cocci
i386                 randconfig-r2302-20261126    clang-24   sparse
i386                 randconfig-r2306-20261126    clang-22   sparse
i386                 randconfig-r2309-20261126    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261127    gcc-9.5.0
loongarch             randconfig-1001-20261127    gcc-9.5.0
loongarch             randconfig-2000-20261126    gcc-12.5.0
loongarch             randconfig-2001-20261126    gcc-12.5.0
loongarch             randconfig-2200-20261126    gcc-14.4.0 smatch
loongarch            randconfig-r2101-20261126    clang-24   cocci
loongarch            randconfig-r2101-20261126    gcc-13     cocci
loongarch            randconfig-r2107-20261126    gcc-11.5.0 cocci
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                             q40_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261126    gcc-13.5.0
m68k                  randconfig-2001-20261126    gcc-13.5.0
m68k                 randconfig-r2104-20261126    gcc-8.5.0  cocci
m68k                 randconfig-r2106-20261126    gcc-14.4.0 cocci
m68k                 randconfig-r2108-20261126    gcc-15.3.0 cocci
m68k                 randconfig-r2301-20261126    gcc-15.3.0 sparse
m68k                 randconfig-r2304-20261126    gcc-9.5.0  sparse
m68k                 randconfig-r2309-20261126    clang-18   sparse
m68k                 randconfig-r2311-20261126    gcc-12.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261126    gcc-13.5.0
microblaze            randconfig-2001-20261126    gcc-13.5.0
microblaze            randconfig-2200-20261126    gcc-9.5.0  smatch
microblaze           randconfig-r2100-20261126    clang-24   cocci
microblaze           randconfig-r2102-20261126    gcc-8.5.0  cocci
microblaze           randconfig-r2107-20261126    clang-24   cocci
microblaze           randconfig-r2108-20261126    gcc-11.5.0 cocci
microblaze           randconfig-r2305-20261126    gcc-9.5.0  sparse
microblaze           randconfig-r2308-20261126    gcc-12.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                             gpr_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261126    gcc-16.2.0
mips                  randconfig-2001-20261126    gcc-16.2.0
mips                  randconfig-2002-20261126    gcc-16.2.0
mips                 randconfig-r2301-20261126    gcc-9.5.0  sparse
mips                 randconfig-r2306-20261126    gcc-12.5.0 sparse
mips                 randconfig-r2307-20261126    clang-22   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261127    gcc-9.5.0
nios2                 randconfig-1001-20261127    gcc-9.5.0
nios2                 randconfig-2000-20261126    gcc-12.5.0
nios2                 randconfig-2001-20261126    gcc-12.5.0
nios2                 randconfig-2200-20261126    gcc-9.5.0  smatch
nios2                randconfig-r2101-20261126    gcc-8.5.0  cocci
nios2                randconfig-r2110-20261126    gcc-15.3.0 cocci
nios2                randconfig-r2300-20261126    gcc-11.5.0 sparse
nios2                randconfig-r2307-20261126    clang-18   sparse
nios2                randconfig-r2309-20261126    clang-18   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261126    gcc-16.2.0
openrisc              randconfig-2001-20261126    gcc-16.2.0
openrisc              randconfig-2002-20261126    gcc-16.2.0
openrisc              randconfig-2200-20261126    gcc-9.5.0  smatch
openrisc             randconfig-r2100-20261126    clang-18   cocci
openrisc             randconfig-r2101-20261126    clang-18   cocci
openrisc             randconfig-r2109-20261126    gcc-15.3.0 cocci
openrisc             randconfig-r2300-20261126    gcc-9.5.0  sparse
openrisc             randconfig-r2305-20261126    gcc-11.5.0 sparse
openrisc             randconfig-r2306-20261126    clang-18   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261127    gcc-12.5.0
parisc                randconfig-1001-20261127    gcc-12.5.0
parisc                randconfig-2000-20261126    gcc-12.5.0
parisc                randconfig-2001-20261126    gcc-12.5.0
parisc                randconfig-2200-20261126    gcc-15.3.0 smatch
parisc               randconfig-r2104-20261126    clang-18   cocci
parisc               randconfig-r2111-20261126    gcc-14     cocci
parisc               randconfig-r2305-20261126    gcc-15.3.0 sparse
parisc               randconfig-r2307-20261126    clang-18   sparse
parisc               randconfig-r2310-20261126    clang-18   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20261127    gcc-12.5.0
powerpc               randconfig-1001-20261127    gcc-12.5.0
powerpc               randconfig-2000-20261126    clang-24
powerpc               randconfig-2001-20261126    clang-24
powerpc               randconfig-2002-20261126    clang-24
powerpc               randconfig-2200-20261126    clang-24   smatch
powerpc              randconfig-r2100-20261126    gcc-8.5.0  cocci
powerpc              randconfig-r2103-20261126    clang-18   cocci
powerpc              randconfig-r2106-20261126    gcc-15.3.0 cocci
powerpc              randconfig-r2110-20261126    clang-24   cocci
powerpc              randconfig-r2304-20261126    clang-18   sparse
powerpc              randconfig-r2305-20261126    clang-18   sparse
powerpc              randconfig-r2305-20261126    gcc-11.5.0 sparse
powerpc              randconfig-r2311-20261126    gcc-12.5.0 sparse
powerpc64             randconfig-1000-20261127    gcc-12.5.0
powerpc64             randconfig-1001-20261127    gcc-12.5.0
powerpc64             randconfig-2000-20261126    clang-24
powerpc64             randconfig-2001-20261126    clang-24
powerpc64             randconfig-2002-20261126    clang-24
powerpc64             randconfig-2200-20261126    clang-24   smatch
powerpc64            randconfig-r2104-20261126    clang-24   cocci
powerpc64            randconfig-r2105-20261126    gcc-8.5.0  cocci
powerpc64            randconfig-r2307-20261126    gcc-12.5.0 sparse
powerpc64            randconfig-r2308-20261126    clang-18   sparse
powerpc64            randconfig-r2310-20261126    clang-22   sparse
powerpc64            randconfig-r2311-20261126    clang-18   sparse
powerpc64            randconfig-r2311-20261126    clang-22   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261127    gcc-12.5.0
riscv                 randconfig-1001-20261127    gcc-12.5.0
riscv                 randconfig-2000-20261126    gcc-10.5.0
riscv                 randconfig-2001-20261126    gcc-10.5.0
riscv                 randconfig-2002-20261126    gcc-10.5.0
riscv                 randconfig-2003-20261126    gcc-10.5.0
riscv                 randconfig-2004-20261126    gcc-10.5.0
riscv                 randconfig-2005-20261126    gcc-10.5.0
riscv                 randconfig-2200-20261126    gcc-8.5.0  smatch
riscv                randconfig-r2110-20261126    gcc-11.5.0 cocci
riscv                randconfig-r2303-20261126    gcc-9.5.0  sparse
riscv                randconfig-r2310-20261126    gcc-12.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261127    gcc-12.5.0
s390                  randconfig-1001-20261127    gcc-12.5.0
s390                  randconfig-2000-20261126    clang-24
s390                  randconfig-2001-20261126    clang-24
s390                  randconfig-2002-20261126    clang-24
s390                  randconfig-2003-20261126    clang-24
s390                  randconfig-2004-20261126    clang-24
s390                  randconfig-2005-20261126    clang-24
s390                  randconfig-2200-20261126    gcc-16.2.0 smatch
s390                 randconfig-r2105-20261126    clang-24   cocci
s390                 randconfig-r2108-20261126    gcc-14     cocci
s390                 randconfig-r2109-20261126    gcc-14.4.0 cocci
s390                 randconfig-r2110-20261126    gcc-14     cocci
s390                 randconfig-r2111-20261126    gcc-15.3.0 cocci
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.2.0
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261127    gcc-12.5.0
sh                    randconfig-1001-20261127    gcc-12.5.0
sh                    randconfig-2000-20261126    gcc-9.5.0
sh                    randconfig-2001-20261126    gcc-9.5.0
sh                    randconfig-2002-20261126    gcc-9.5.0
sh                    randconfig-2003-20261126    gcc-9.5.0
sh                    randconfig-2004-20261126    gcc-9.5.0
sh                    randconfig-2005-20261126    gcc-9.5.0
sh                    randconfig-2200-20261126    gcc-16.2.0 smatch
sh                   randconfig-r2300-20261126    gcc-15.3.0 sparse
sh                   randconfig-r2303-20261126    clang-24   sparse
sh                   randconfig-r2303-20261126    gcc-11.5.0 sparse
sh                           rsk7264_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261127    gcc-14
sparc                 randconfig-1001-20261127    gcc-14
sparc                 randconfig-2000-20261126    gcc-8.5.0
sparc                 randconfig-2001-20261126    gcc-8.5.0
sparc                 randconfig-2200-20261126    gcc-13.5.0 smatch
sparc                randconfig-r2104-20261126    gcc-8.5.0  cocci
sparc                randconfig-r2106-20261126    gcc-11.5.0 cocci
sparc                randconfig-r2107-20261126    gcc-14.4.0 cocci
sparc                randconfig-r2108-20261126    clang-24   cocci
sparc                randconfig-r2300-20261126    clang-18   sparse
sparc                randconfig-r2303-20261126    clang-18   sparse
sparc                randconfig-r2304-20261126    gcc-15.3.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261127    gcc-14
sparc64               randconfig-1001-20261127    gcc-14
sparc64               randconfig-2000-20261126    gcc-8.5.0
sparc64               randconfig-2001-20261126    gcc-8.5.0
sparc64               randconfig-2200-20261126    gcc-12.5.0 smatch
sparc64              randconfig-r2106-20261126    gcc-14     cocci
sparc64              randconfig-r2301-20261126    clang-24   sparse
sparc64              randconfig-r2304-20261126    gcc-11.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261127    gcc-14
um                    randconfig-1001-20261127    gcc-14
um                    randconfig-2000-20261126    gcc-8.5.0
um                    randconfig-2001-20261126    gcc-8.5.0
um                    randconfig-2200-20261126    gcc-12     smatch
um                   randconfig-r2103-20261126    gcc-8.5.0  cocci
um                   randconfig-r2104-20261126    gcc-13     cocci
um                   randconfig-r2105-20261126    clang-18   cocci
um                   randconfig-r2109-20261126    gcc-14     cocci
um                   randconfig-r2301-20261126    gcc-11.5.0 sparse
um                   randconfig-r2304-20261126    gcc-11.5.0 sparse
um                   randconfig-r2308-20261126    gcc-12.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261127    gcc-14
x86_64                randconfig-1001-20261127    gcc-14
x86_64                randconfig-1002-20261127    gcc-14
x86_64                randconfig-1003-20261127    gcc-14
x86_64                randconfig-1004-20261127    gcc-14
x86_64                randconfig-1005-20261127    gcc-14
x86_64                randconfig-2000-20261126    clang-22
x86_64                randconfig-2001-20261126    clang-22
x86_64                randconfig-2002-20261126    clang-22
x86_64                randconfig-2003-20261126    clang-22
x86_64                randconfig-2004-20261126    clang-22
x86_64                randconfig-2005-20261126    clang-22
x86_64                randconfig-2100-20261126    gcc-14     cocci
x86_64                randconfig-2101-20261126    gcc-14     cocci
x86_64                randconfig-2102-20261126    gcc-14     cocci
x86_64                randconfig-2103-20261126    gcc-14     cocci
x86_64                randconfig-2104-20261126    gcc-14     cocci
x86_64                randconfig-2105-20261126    gcc-14     cocci
x86_64                randconfig-2200-20261126    clang-22   smatch
x86_64                randconfig-2300-20261126    gcc-14     sparse
x86_64                randconfig-2301-20261126    gcc-14     sparse
x86_64                randconfig-2302-20261126    gcc-14     sparse
x86_64               randconfig-r2103-20261126    gcc-8.5.0  cocci
x86_64               randconfig-r2301-20261126    gcc-11.5.0 sparse
x86_64               randconfig-r2303-20261126    gcc-11.5.0 sparse
x86_64               randconfig-r2303-20261126    gcc-15.3.0 sparse
x86_64               randconfig-r2305-20261126    clang-24   sparse
x86_64               randconfig-r2306-20261126    clang-18   sparse
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
xtensa                randconfig-1000-20261127    gcc-14
xtensa                randconfig-1001-20261127    gcc-14
xtensa                randconfig-2000-20261126    gcc-13.5.0
xtensa                randconfig-2001-20261126    gcc-13.5.0
xtensa                randconfig-2200-20261126    gcc-11.5.0 smatch
xtensa               randconfig-r2102-20261126    gcc-8.5.0  cocci
xtensa               randconfig-r2105-20261126    gcc-13     cocci
xtensa               randconfig-r2300-20261126    gcc-11.5.0 sparse
xtensa               randconfig-r2302-20261126    clang-18   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

