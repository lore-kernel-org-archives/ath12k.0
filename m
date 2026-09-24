Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CA1C98318
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 23:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c2xHd0GsxWaL3B4g9JtvBG9gqWMjNkC7ZHM29eHkFfQ=; b=GbSmd1ubMVePpJkJYbbJnFVDqa
	jaFl91ls6G/k/8/tJgjBlTgpm8pi+yAoELxIx+HZM77wLFtDgJB6KRFBNM9hoUyhHsEnI4OI1iklh
	MV7BbEUcYEsViVQe3oFaBg1Kf3zlihuuqF7Hoavc4zHDv0GRUO45K7mBCo6I/06nuxc3dNfQimlvS
	TdMca2QfFqtG6L7RHFfnEdq3wBhKprQ/WNfoUG19VacaJbPVpOk03Sn8D3O7k5Lui2jafZ9WnqZ1m
	6dDiahCA6kxRe0Ko+BEwrd0GDf0i58OnWfTtKgbAr03HqOq9hNfoMcqhFUecxSKxtFgqfHs3YPF2o
	fn3sOlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tGt-0000000CPrI-3CTX;
	Thu, 24 Sep 2026 23:54:35 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tGq-0000000CPqd-3wQ8
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 23:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790294073; x=1821830073;
  h=date:from:to:cc:subject:message-id;
  bh=zYuysVCfptUOeRtUUYkAqR95sGeqGBSCw2dMWavwGi4=;
  b=cHqPdOXU0CyIvQ6hxxy+eorRLG0FTpX5ce1IQqVg/qmNiLVCCJHP4Ft1
   DsJG2O2MRR4wXbAiu342P2gnxauETfCHa/HHUrX62qchGkmlvvBth8X0x
   Gxc+Li5Yks1g7RE/FQ2vso9KbcYoIgO3RmK0BXpwi6Mq6uwD6pPOPBwOk
   haFgS05aoTwd7QWgkspIRMcKmXk2AS94DW5gQQ0AsiShS124phAE0EfUR
   iXRchhzmFN9zcfrvZlp/J6uuVTrhxuoBxO3HEn3hzrgIHWrURhRkXItUh
   xeLytmzSF15/vReXaHpBai6oiOGbroaSpvxS4zr4o8X0bua9kDEPMC1g7
   g==;
X-CSE-ConnectionGUID: IousdQm8SJiEpwZRayp1Sw==
X-CSE-MsgGUID: gTcQnW1rRQmNo8x+maieIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93968654"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="93968654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 16:54:32 -0700
X-CSE-ConnectionGUID: JIxW+FJGThStevQOWAxp4Q==
X-CSE-MsgGUID: DEut5FafTN27qnfCcvUxDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277342512"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2026 16:54:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9tGm-00000000Jow-2roW;
	Thu, 24 Sep 2026 23:54:28 +0000
Date: Fri, 25 Sep 2026 07:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 414f2b40f7b0244ea3ec1f7411d194a6d9c89c33
Message-ID: <202609250754.BOK6pipl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_165433_192451_9A4052AC 
X-CRM114-Status: UNSURE (   3.93  )
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
branch HEAD: 414f2b40f7b0244ea3ec1f7411d194a6d9c89c33  net: qrtr: resend HELLO on MHI resume

elapsed time: 3146m

configs tested: 347
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1303-20260925    gcc-14.3.0 sparse
alpha                randconfig-r1304-20260924    gcc-16.1.0 sparse
alpha                randconfig-r2102-20260923    gcc-8.5.0  cocci
alpha                randconfig-r2102-20260924    gcc-11.5.0 cocci
alpha                randconfig-r2103-20260924    gcc-11.5.0 cocci
alpha                randconfig-r2106-20260924    gcc-14     cocci
alpha                randconfig-r2107-20260923    gcc-10.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260924    clang-24
arc                   randconfig-1000-20260925    clang-24
arc                   randconfig-1001-20260924    clang-24
arc                   randconfig-1001-20260925    clang-24
arc                  randconfig-r2101-20260923    gcc-8.5.0  cocci
arc                  randconfig-r2202-20260923    gcc-14.3.0 smatch
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20260924    clang-24
arm                   randconfig-1000-20260925    clang-24
arm                   randconfig-1001-20260924    clang-24
arm                   randconfig-1001-20260925    clang-24
arm                   randconfig-1002-20260924    clang-24
arm                   randconfig-1002-20260925    clang-24
arm                   randconfig-1003-20260924    clang-24
arm                   randconfig-1003-20260925    clang-24
arm                  randconfig-r1305-20260924    gcc-16.1.0 sparse
arm                  randconfig-r2100-20260923    gcc-8.5.0  cocci
arm                  randconfig-r2201-20260923    gcc-16.1.0 smatch
arm                         spear6xx_defconfig    clang-24
arm                            stm32_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260924    gcc-11.5.0
arm64                 randconfig-1001-20260924    gcc-11.5.0
arm64                 randconfig-1002-20260924    gcc-11.5.0
arm64                 randconfig-1003-20260924    gcc-11.5.0
arm64                randconfig-r1302-20260924    gcc-16.1.0 sparse
arm64                randconfig-r1307-20260924    gcc-11.5.0 sparse
arm64                randconfig-r2200-20260923    clang-24   smatch
arm64                randconfig-r2201-20260923    clang-24   smatch
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260924    gcc-11.5.0
csky                  randconfig-1001-20260924    gcc-11.5.0
csky                 randconfig-r1300-20260924    gcc-16.1.0 sparse
csky                 randconfig-r2103-20260923    gcc-8.5.0  cocci
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260924    gcc-8.5.0
hexagon               randconfig-1000-20260925    gcc-9.5.0
hexagon               randconfig-1001-20260924    gcc-8.5.0
hexagon               randconfig-1001-20260925    gcc-9.5.0
hexagon              randconfig-r1301-20260924    gcc-16.1.0 sparse
hexagon              randconfig-r2107-20260924    gcc-14     cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260924    gcc-14
i386        buildonly-randconfig-1000-20260925    clang-22
i386        buildonly-randconfig-1001-20260924    gcc-14
i386        buildonly-randconfig-1001-20260925    clang-22
i386        buildonly-randconfig-1002-20260924    gcc-14
i386        buildonly-randconfig-1002-20260925    clang-22
i386        buildonly-randconfig-1003-20260924    gcc-14
i386        buildonly-randconfig-1003-20260925    clang-22
i386        buildonly-randconfig-1004-20260924    gcc-14
i386        buildonly-randconfig-1004-20260925    clang-22
i386        buildonly-randconfig-1005-20260924    gcc-14
i386        buildonly-randconfig-1005-20260925    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260924    gcc-12
i386                  randconfig-1001-20260924    gcc-12
i386                  randconfig-1002-20260924    gcc-12
i386                  randconfig-1003-20260924    gcc-12
i386                  randconfig-1004-20260924    gcc-12
i386                  randconfig-1005-20260924    gcc-12
i386                  randconfig-1006-20260924    gcc-12
i386                  randconfig-1007-20260924    clang-22
i386                  randconfig-1008-20260924    clang-22
i386                  randconfig-1009-20260924    clang-22
i386                  randconfig-1010-20260924    clang-22
i386                  randconfig-1011-20260924    clang-22
i386                  randconfig-1012-20260924    clang-22
i386                  randconfig-1013-20260924    clang-22
i386                  randconfig-1300-20260924    clang-22   sparse
i386                  randconfig-1301-20260924    clang-22   sparse
i386                  randconfig-1302-20260924    clang-22   sparse
i386                  randconfig-2100-20260923    clang-22   cocci
i386                  randconfig-2101-20260923    clang-22   cocci
i386                  randconfig-2102-20260923    clang-22   cocci
i386                  randconfig-2103-20260923    clang-22   cocci
i386                  randconfig-2200-20260923    gcc-12     smatch
i386                  randconfig-2200-20260924    clang-22   smatch
i386                 randconfig-r2100-20260923    gcc-8.5.0  cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260924    gcc-8.5.0
loongarch             randconfig-1000-20260925    gcc-9.5.0
loongarch             randconfig-1001-20260924    gcc-8.5.0
loongarch             randconfig-1001-20260925    gcc-9.5.0
loongarch            randconfig-r2104-20260923    gcc-10.5.0 cocci
loongarch            randconfig-r2105-20260923    gcc-14     cocci
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                         m5307c3_defconfig    gcc-16.1.0
m68k                 randconfig-r2103-20260923    gcc-8.5.0  cocci
m68k                 randconfig-r2105-20260923    gcc-10.5.0 cocci
m68k                 randconfig-r2201-20260924    gcc-8.5.0  smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r1304-20260925    gcc-14.3.0 sparse
microblaze           randconfig-r2101-20260924    gcc-11.5.0 cocci
microblaze           randconfig-r2200-20260923    gcc-9.5.0  smatch
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                 randconfig-r1309-20260924    gcc-11.5.0 sparse
mips                 randconfig-r2202-20260923    gcc-8.5.0  smatch
mips                            xway_defconfig    clang-24
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260924    gcc-8.5.0
nios2                 randconfig-1000-20260925    gcc-9.5.0
nios2                 randconfig-1001-20260924    gcc-8.5.0
nios2                 randconfig-1001-20260925    gcc-9.5.0
nios2                randconfig-r1303-20260924    gcc-16.1.0 sparse
nios2                randconfig-r1306-20260924    gcc-11.5.0 sparse
nios2                randconfig-r2100-20260923    gcc-15.2.0 cocci
nios2                randconfig-r2105-20260924    gcc-14     cocci
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    clang-24
openrisc             randconfig-r2106-20260923    gcc-16.1.0 cocci
openrisc             randconfig-r2200-20260924    gcc-13.4.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260924    gcc-8.5.0
parisc                randconfig-1000-20260925    clang-24
parisc                randconfig-1001-20260924    gcc-8.5.0
parisc                randconfig-1001-20260925    clang-24
parisc               randconfig-r1301-20260925    gcc-14.3.0 sparse
parisc               randconfig-r2104-20260923    gcc-14     cocci
parisc               randconfig-r2106-20260923    gcc-10.5.0 cocci
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       mgcoge_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260924    gcc-8.5.0
powerpc               randconfig-1000-20260925    clang-24
powerpc               randconfig-1001-20260924    gcc-8.5.0
powerpc               randconfig-1001-20260925    clang-24
powerpc              randconfig-r2102-20260923    gcc-15.2.0 cocci
powerpc64             randconfig-1000-20260924    gcc-8.5.0
powerpc64             randconfig-1000-20260925    clang-24
powerpc64             randconfig-1001-20260924    gcc-8.5.0
powerpc64             randconfig-1001-20260925    clang-24
powerpc64            randconfig-r1300-20260925    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260924    gcc-15.2.0
riscv                 randconfig-1000-20260925    clang-24
riscv                 randconfig-1001-20260924    gcc-15.2.0
riscv                 randconfig-1001-20260925    clang-24
riscv                 randconfig-2000-20260923    gcc-9.5.0
riscv                 randconfig-2000-20260924    clang-24
riscv                 randconfig-2001-20260923    gcc-9.5.0
riscv                 randconfig-2001-20260924    clang-24
riscv                randconfig-r2107-20260923    gcc-16.1.0 cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260924    gcc-15.2.0
s390                  randconfig-1000-20260925    clang-24
s390                  randconfig-1001-20260924    gcc-15.2.0
s390                  randconfig-1001-20260925    clang-24
s390                  randconfig-2000-20260923    gcc-9.5.0
s390                  randconfig-2000-20260924    clang-24
s390                  randconfig-2001-20260923    gcc-9.5.0
s390                  randconfig-2001-20260924    clang-24
s390                 randconfig-r1308-20260924    gcc-11.5.0 sparse
s390                 randconfig-r2200-20260923    gcc-8.5.0  smatch
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20260924    gcc-15.2.0
sh                    randconfig-1000-20260925    clang-24
sh                    randconfig-1001-20260924    gcc-15.2.0
sh                    randconfig-1001-20260925    clang-24
sh                    randconfig-2000-20260923    gcc-9.5.0
sh                    randconfig-2000-20260924    clang-24
sh                    randconfig-2001-20260923    gcc-9.5.0
sh                    randconfig-2001-20260924    clang-24
sh                   randconfig-r1305-20260925    gcc-14.3.0 sparse
sh                   randconfig-r2103-20260923    gcc-15.2.0 cocci
sh                   randconfig-r2104-20260923    gcc-16.1.0 cocci
sh                   randconfig-r2202-20260924    gcc-14.3.0 smatch
sh                            se7780_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260924    clang-17
sparc                 randconfig-1000-20260925    gcc-12
sparc                 randconfig-1001-20260924    clang-17
sparc                 randconfig-1001-20260925    gcc-12
sparc                 randconfig-2000-20260923    gcc-14.3.0
sparc                 randconfig-2000-20260924    gcc-13.4.0
sparc                 randconfig-2001-20260923    gcc-14.3.0
sparc                 randconfig-2001-20260924    gcc-13.4.0
sparc                randconfig-r2105-20260923    gcc-16.1.0 cocci
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260924    clang-17
sparc64               randconfig-1000-20260925    gcc-12
sparc64               randconfig-1001-20260924    clang-17
sparc64               randconfig-1001-20260925    gcc-12
sparc64               randconfig-2000-20260923    gcc-14.3.0
sparc64               randconfig-2000-20260924    gcc-13.4.0
sparc64               randconfig-2001-20260923    gcc-14.3.0
sparc64               randconfig-2001-20260924    gcc-13.4.0
sparc64              randconfig-r2100-20260924    gcc-11.5.0 cocci
sparc64              randconfig-r2101-20260923    gcc-15.2.0 cocci
sparc64              randconfig-r2102-20260923    gcc-8.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260924    clang-17
um                    randconfig-1000-20260925    gcc-12
um                    randconfig-1001-20260924    clang-17
um                    randconfig-1001-20260925    gcc-12
um                    randconfig-2000-20260923    gcc-14.3.0
um                    randconfig-2000-20260924    gcc-13.4.0
um                    randconfig-2001-20260923    gcc-14.3.0
um                    randconfig-2001-20260924    gcc-13.4.0
um                   randconfig-r1302-20260925    gcc-14.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260924    clang-22
x86_64      buildonly-randconfig-1000-20260925    clang-22
x86_64      buildonly-randconfig-1001-20260924    clang-22
x86_64      buildonly-randconfig-1001-20260925    clang-22
x86_64      buildonly-randconfig-1002-20260924    clang-22
x86_64      buildonly-randconfig-1002-20260925    clang-22
x86_64      buildonly-randconfig-1003-20260924    clang-22
x86_64      buildonly-randconfig-1003-20260925    clang-22
x86_64      buildonly-randconfig-1004-20260924    clang-22
x86_64      buildonly-randconfig-1004-20260925    clang-22
x86_64      buildonly-randconfig-1005-20260924    clang-22
x86_64      buildonly-randconfig-1005-20260925    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260924    clang-22
x86_64                randconfig-1000-20260925    gcc-14
x86_64                randconfig-1001-20260924    clang-22
x86_64                randconfig-1001-20260925    gcc-14
x86_64                randconfig-1002-20260924    clang-22
x86_64                randconfig-1002-20260925    gcc-14
x86_64                randconfig-1003-20260924    clang-22
x86_64                randconfig-1003-20260925    gcc-14
x86_64                randconfig-1004-20260924    clang-22
x86_64                randconfig-1004-20260925    gcc-14
x86_64                randconfig-1005-20260924    clang-22
x86_64                randconfig-1005-20260925    gcc-14
x86_64                randconfig-1006-20260924    clang-22
x86_64                randconfig-1006-20260925    clang-22
x86_64                randconfig-1007-20260924    clang-22
x86_64                randconfig-1007-20260925    clang-22
x86_64                randconfig-1008-20260924    clang-22
x86_64                randconfig-1008-20260925    clang-22
x86_64                randconfig-1009-20260924    clang-22
x86_64                randconfig-1009-20260925    clang-22
x86_64                randconfig-1010-20260924    clang-22
x86_64                randconfig-1010-20260925    clang-22
x86_64                randconfig-1011-20260924    clang-22
x86_64                randconfig-1011-20260925    clang-22
x86_64                randconfig-1012-20260924    clang-22
x86_64                randconfig-1013-20260924    clang-22
x86_64                randconfig-1014-20260924    clang-22
x86_64                randconfig-1015-20260924    clang-22
x86_64                randconfig-1016-20260924    clang-22
x86_64                randconfig-1017-20260924    clang-22
x86_64                randconfig-1300-20260924    clang-22   sparse
x86_64                randconfig-1301-20260924    clang-22   sparse
x86_64                randconfig-1302-20260924    clang-22   sparse
x86_64                randconfig-2100-20260923    clang-22   cocci
x86_64                randconfig-2100-20260924    clang-22   cocci
x86_64                randconfig-2101-20260923    clang-22   cocci
x86_64                randconfig-2101-20260924    clang-22   cocci
x86_64                randconfig-2102-20260923    clang-22   cocci
x86_64                randconfig-2102-20260924    clang-22   cocci
x86_64                randconfig-2103-20260923    clang-22   cocci
x86_64                randconfig-2103-20260924    clang-22   cocci
x86_64                randconfig-2200-20260923    gcc-14     smatch
x86_64                randconfig-2200-20260924    clang-22   smatch
x86_64               randconfig-r2101-20260923    gcc-8.5.0  cocci
x86_64               randconfig-r2104-20260924    gcc-14     cocci
x86_64               randconfig-r2106-20260923    gcc-14     cocci
x86_64               randconfig-r2107-20260923    gcc-14     cocci
x86_64               randconfig-r2201-20260923    clang-22   smatch
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
xtensa                            alldefconfig    gcc-16.1.0
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20260924    clang-17
xtensa                randconfig-1000-20260925    gcc-12
xtensa                randconfig-1001-20260924    clang-17
xtensa                randconfig-1001-20260925    gcc-12
xtensa                randconfig-2000-20260923    gcc-14.3.0
xtensa                randconfig-2000-20260924    gcc-13.4.0
xtensa                randconfig-2001-20260923    gcc-14.3.0
xtensa                randconfig-2001-20260924    gcc-13.4.0
xtensa               randconfig-r2202-20260923    gcc-10.5.0 smatch

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

