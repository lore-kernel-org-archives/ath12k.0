Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58544CA5FFC
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 11:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fR4brii+BxzFXO3PMoXewN32Fw9c+mRJAYTMdOGkc54=; b=xi9WF5Xf9uT8ju0UhQ1nYBWknc
	U3QaCMMw2gfoKw00g+0eLV5UTyMWfAzaZa1WFhPa3b/4aQiVgMvPd1vJ8SBDsgX1uKBUJiC0uwnw8
	czwT4TdhEACOB5DFR4evUo+vpyecVyCutcgufIXdvLwek3FKdRxMegwlgzI4HpAbuIKu8qB4RD5ag
	5wGaCT1Bst64g9bBtw3EWSS9moRKlxNsowBXxO5LbfjYFasPncYi901nrXaNCNa8+TbpX96Iq8XbK
	pPhMFjoY/wCGmGt6e16D7NsqkIHBuvMlO3A8YtPLGa6gZ7DCccyu7/P1m6sIu639q72MFg4SP4QO7
	yzmnRBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3Yx-00000000eRO-0AiN;
	Tue, 06 Oct 2026 11:42:27 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3Yu-00000000eQy-34M0
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 11:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791286945; x=1822822945;
  h=date:from:to:cc:subject:message-id;
  bh=rCB0wb1SsPYRvK0vv0ueWwuk9M2I0vCvGCyp2fGi8R0=;
  b=NkqVG0Noz1QfPjXlK4+A7DHOR7ymEvOIXxKN4z1JZ5dsixK1h3Lnw/u1
   SO7GBePFqYaB76jwv5E10LBVG0qoPN4pGAiSkzpBP7z7/52EZ60x7+FYl
   xH1Kp5VYulL4S6Kn4xMqRVz79OGrjIX3b8lewrw99imoYlBJfKPfwOQGg
   DwsOwx/+YRgzLvlMRuC0d1wsGQHDA3HVCCZs2hhUcySsN5uB5NXchcQ5D
   XWa1LF1zlBD6o9/VaP4bgDSNyKWIkzs/uJ2rI3+cPR8nkSH3k21xPRGd0
   9CpHwkAI+erGLSX5bJhR6KBzfa7YBPLcx2kfhJ4a+xtZAFiYJ+B26JP5S
   g==;
X-CSE-ConnectionGUID: /1aUXWXIQdyXrrCsMbmB3g==
X-CSE-MsgGUID: 6vVsRnpcRLmvsnulEX+p3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="31094"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="31094"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 04:42:25 -0700
X-CSE-ConnectionGUID: tAvk8PxxTy+vwHPMywRFnw==
X-CSE-MsgGUID: KeocD8zqQCmADiSvrEzkpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="281912985"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Oct 2026 04:42:22 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE3Yq-000000001YO-12ep;
	Tue, 06 Oct 2026 11:42:20 +0000
Date: Tue, 06 Oct 2026 19:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 388d3c42e8aba1cfc3c6d2c52877a46d8cf740db
Message-ID: <202610061926.FPTJH8oA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_044224_840600_97E2EBC8 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: 388d3c42e8aba1cfc3c6d2c52877a46d8cf740db  MIPS: generic: Remove undefined image 'ramdisk'

elapsed time: 1199m

configs tested: 332
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261006    gcc-8.5.0  cocci
alpha                randconfig-r2103-20261005    gcc-14.3.0 cocci
alpha                randconfig-r2103-20261006    gcc-8.5.0  cocci
alpha                randconfig-r2104-20261006    clang-17   cocci
alpha                randconfig-r2200-20261005    gcc-9.5.0  smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    clang-24
arc                   randconfig-1000-20261006    clang-24
arc                   randconfig-1001-20261006    clang-24
arc                  randconfig-r2100-20261005    gcc-11.5.0 cocci
arc                  randconfig-r2102-20261006    gcc-8.5.0  cocci
arc                  randconfig-r2106-20261006    clang-24   cocci
arc                  randconfig-r2202-20261005    gcc-14.3.0 smatch
arc                  randconfig-r2307-20261006    gcc-10.5.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    clang-24
arm                           pxa3xx_defconfig    clang-24
arm                   randconfig-1000-20261006    clang-24
arm                   randconfig-1001-20261006    clang-24
arm                   randconfig-1002-20261006    clang-24
arm                   randconfig-1003-20261006    clang-24
arm                  randconfig-r2306-20261005    gcc-13.4.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261006    gcc-16.1.0
arm64                 randconfig-1001-20261006    gcc-16.1.0
arm64                 randconfig-1002-20261006    gcc-16.1.0
arm64                 randconfig-1003-20261006    gcc-16.1.0
arm64                randconfig-r2101-20261005    gcc-14.3.0 cocci
arm64                randconfig-r2105-20261006    clang-24   cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261006    gcc-16.1.0
csky                  randconfig-1001-20261006    gcc-16.1.0
csky                 randconfig-r2106-20261006    gcc-8.5.0  cocci
csky                 randconfig-r2201-20261006    gcc-9.5.0  smatch
csky                 randconfig-r2302-20261005    gcc-9.5.0  sparse
csky                 randconfig-r2307-20261005    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261006    gcc-13.4.0
hexagon               randconfig-1001-20261006    gcc-13.4.0
hexagon              randconfig-r2100-20261006    gcc-8.5.0  cocci
hexagon              randconfig-r2103-20261006    clang-24   cocci
hexagon              randconfig-r2301-20261005    gcc-9.5.0  sparse
hexagon              randconfig-r2301-20261006    clang-20   sparse
hexagon              randconfig-r2303-20261006    clang-20   sparse
hexagon              randconfig-r2305-20261006    clang-20   sparse
hexagon              randconfig-r2309-20261005    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261006    gcc-14
i386        buildonly-randconfig-1001-20261006    gcc-14
i386        buildonly-randconfig-1002-20261006    gcc-14
i386        buildonly-randconfig-1003-20261006    gcc-14
i386        buildonly-randconfig-1004-20261006    gcc-14
i386        buildonly-randconfig-1005-20261006    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261006    gcc-14
i386                  randconfig-1001-20261006    gcc-14
i386                  randconfig-1002-20261006    gcc-14
i386                  randconfig-1003-20261006    gcc-14
i386                  randconfig-1004-20261006    gcc-14
i386                  randconfig-1005-20261006    gcc-14
i386                  randconfig-1006-20261006    gcc-14
i386                  randconfig-1007-20261006    gcc-14
i386                  randconfig-1008-20261006    gcc-14
i386                  randconfig-1009-20261006    gcc-14
i386                  randconfig-1010-20261006    gcc-14
i386                  randconfig-1011-20261006    gcc-14
i386                  randconfig-1012-20261006    gcc-14
i386                  randconfig-1013-20261006    gcc-14
i386                  randconfig-2100-20261005    gcc-14     cocci
i386                  randconfig-2100-20261006    clang-22   cocci
i386                  randconfig-2101-20261005    gcc-14     cocci
i386                  randconfig-2101-20261006    clang-22   cocci
i386                  randconfig-2102-20261005    gcc-14     cocci
i386                  randconfig-2102-20261006    clang-22   cocci
i386                  randconfig-2103-20261005    gcc-14     cocci
i386                  randconfig-2103-20261006    clang-22   cocci
i386                  randconfig-2200-20261005    gcc-14     smatch
i386                  randconfig-2200-20261006    gcc-13     smatch
i386                  randconfig-2300-20261005    clang-22   sparse
i386                  randconfig-2300-20261005    gcc-14     sparse
i386                  randconfig-2300-20261006    gcc-14     sparse
i386                  randconfig-2301-20261005    clang-22   sparse
i386                  randconfig-2301-20261005    gcc-13     sparse
i386                  randconfig-2301-20261006    gcc-14     sparse
i386                  randconfig-2302-20261005    clang-22   sparse
i386                  randconfig-2302-20261006    gcc-14     sparse
i386                 randconfig-r2100-20261005    gcc-14.3.0 cocci
i386                 randconfig-r2101-20261005    gcc-11.5.0 cocci
i386                 randconfig-r2107-20261005    gcc-8.5.0  cocci
i386                 randconfig-r2300-20261005    gcc-9.5.0  sparse
i386                 randconfig-r2306-20261005    gcc-12.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261006    gcc-13.4.0
loongarch             randconfig-1001-20261006    gcc-13.4.0
loongarch            randconfig-r2104-20261006    gcc-8.5.0  cocci
loongarch            randconfig-r2106-20261006    gcc-16.1.0 cocci
loongarch            randconfig-r2201-20261006    gcc-13.4.0 smatch
loongarch            randconfig-r2302-20261006    clang-20   sparse
loongarch            randconfig-r2305-20261006    clang-24   sparse
loongarch            randconfig-r2307-20261006    gcc-14.3.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2107-20261006    gcc-8.5.0  cocci
m68k                 randconfig-r2304-20261006    clang-20   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261006    clang-24   cocci
microblaze           randconfig-r2101-20261006    gcc-8.5.0  cocci
microblaze           randconfig-r2304-20261005    gcc-9.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2107-20261006    clang-24   cocci
mips                 randconfig-r2302-20261006    clang-24   sparse
mips                 randconfig-r2309-20261006    gcc-10.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261006    gcc-13.4.0
nios2                 randconfig-1001-20261006    gcc-13.4.0
nios2                randconfig-r2105-20261005    gcc-8.5.0  cocci
nios2                randconfig-r2200-20261006    gcc-11.5.0 smatch
nios2                randconfig-r2303-20261005    gcc-9.5.0  sparse
nios2                randconfig-r2304-20261006    clang-24   sparse
nios2                randconfig-r2307-20261005    gcc-9.5.0  sparse
nios2                randconfig-r2307-20261006    gcc-10.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2103-20261005    gcc-11.5.0 cocci
openrisc             randconfig-r2308-20261006    gcc-10.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261006    gcc-14.3.0
parisc                randconfig-1001-20261006    gcc-14.3.0
parisc               randconfig-r2101-20261006    gcc-8.5.0  cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc               randconfig-1000-20261006    gcc-14.3.0
powerpc               randconfig-1001-20261006    gcc-14.3.0
powerpc              randconfig-r2100-20261006    clang-24   cocci
powerpc              randconfig-r2104-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2105-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2106-20261006    clang-17   cocci
powerpc              randconfig-r2202-20261006    gcc-9.5.0  smatch
powerpc              randconfig-r2308-20261005    gcc-13.4.0 sparse
powerpc64             randconfig-1000-20261006    gcc-14.3.0
powerpc64             randconfig-1001-20261006    gcc-14.3.0
powerpc64            randconfig-r2102-20261006    clang-24   cocci
powerpc64            randconfig-r2103-20261006    gcc-8.5.0  cocci
powerpc64            randconfig-r2104-20261005    gcc-8.5.0  cocci
powerpc64            randconfig-r2201-20261005    clang-24   smatch
powerpc64            randconfig-r2201-20261006    gcc-13.4.0 smatch
powerpc64            randconfig-r2202-20261005    gcc-12.5.0 smatch
powerpc64            randconfig-r2303-20261006    clang-24   sparse
powerpc64            randconfig-r2305-20261005    gcc-9.5.0  sparse
powerpc64            randconfig-r2308-20261005    clang-17   sparse
powerpc64            randconfig-r2309-20261006    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_virt_defconfig    clang-24
riscv                 randconfig-1000-20261006    clang-24
riscv                 randconfig-1001-20261006    clang-24
riscv                 randconfig-2000-20261005    gcc-16.1.0
riscv                 randconfig-2000-20261006    gcc-16.1.0
riscv                 randconfig-2001-20261005    gcc-16.1.0
riscv                 randconfig-2001-20261006    gcc-16.1.0
riscv                randconfig-r2308-20261006    gcc-14.3.0 sparse
riscv                randconfig-r2309-20261005    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261006    clang-24
s390                  randconfig-1001-20261006    clang-24
s390                  randconfig-2000-20261005    gcc-16.1.0
s390                  randconfig-2000-20261006    gcc-16.1.0
s390                  randconfig-2001-20261005    gcc-16.1.0
s390                  randconfig-2001-20261006    gcc-16.1.0
s390                 randconfig-r2102-20261005    gcc-14.3.0 cocci
s390                 randconfig-r2102-20261006    gcc-8.5.0  cocci
s390                 randconfig-r2201-20261005    clang-22   smatch
s390                 randconfig-r2306-20261006    gcc-10.5.0 sparse
s390                 randconfig-r2308-20261005    gcc-12.5.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261006    clang-24
sh                    randconfig-1001-20261006    clang-24
sh                    randconfig-2000-20261005    gcc-16.1.0
sh                    randconfig-2000-20261006    gcc-16.1.0
sh                    randconfig-2001-20261005    gcc-16.1.0
sh                    randconfig-2001-20261006    gcc-16.1.0
sh                   randconfig-r2102-20261005    gcc-11.5.0 cocci
sh                   randconfig-r2107-20261006    clang-17   cocci
sh                   randconfig-r2200-20261006    gcc-16.1.0 smatch
sh                   randconfig-r2300-20261006    clang-20   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261006    gcc-14
sparc                 randconfig-1001-20261006    gcc-14
sparc                 randconfig-2000-20261005    clang-17
sparc                 randconfig-2001-20261005    clang-17
sparc                randconfig-r2106-20261005    gcc-8.5.0  cocci
sparc                randconfig-r2107-20261006    gcc-16.1.0 cocci
sparc                randconfig-r2300-20261006    clang-24   sparse
sparc                randconfig-r2306-20261005    gcc-14.3.0 sparse
sparc                randconfig-r2307-20261005    gcc-12.5.0 sparse
sparc                randconfig-r2309-20261005    gcc-12.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261006    gcc-14
sparc64               randconfig-1001-20261006    gcc-14
sparc64               randconfig-2000-20261005    clang-17
sparc64               randconfig-2001-20261005    clang-17
sparc64              randconfig-r2201-20261005    clang-21   smatch
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261006    gcc-14
um                    randconfig-1001-20261006    gcc-14
um                    randconfig-2000-20261005    clang-17
um                    randconfig-2001-20261005    clang-17
um                   randconfig-r2104-20261006    clang-24   cocci
um                   randconfig-r2105-20261006    clang-17   cocci
um                   randconfig-r2105-20261006    gcc-8.5.0  cocci
um                   randconfig-r2301-20261006    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261006    gcc-14
x86_64      buildonly-randconfig-1001-20261006    gcc-14
x86_64      buildonly-randconfig-1002-20261006    gcc-14
x86_64      buildonly-randconfig-1003-20261006    gcc-14
x86_64      buildonly-randconfig-1004-20261006    gcc-14
x86_64      buildonly-randconfig-1005-20261006    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261006    gcc-14
x86_64                randconfig-1001-20261006    gcc-14
x86_64                randconfig-1002-20261006    gcc-14
x86_64                randconfig-1003-20261006    gcc-14
x86_64                randconfig-1004-20261006    gcc-14
x86_64                randconfig-1005-20261006    gcc-14
x86_64                randconfig-1006-20261006    gcc-14
x86_64                randconfig-1007-20261006    gcc-14
x86_64                randconfig-1008-20261006    gcc-14
x86_64                randconfig-1009-20261006    gcc-14
x86_64                randconfig-1010-20261006    gcc-14
x86_64                randconfig-1011-20261006    gcc-14
x86_64                randconfig-1012-20261006    gcc-14
x86_64                randconfig-1013-20261006    gcc-14
x86_64                randconfig-1014-20261006    gcc-14
x86_64                randconfig-1015-20261006    gcc-14
x86_64                randconfig-1016-20261006    gcc-14
x86_64                randconfig-1017-20261006    gcc-14
x86_64                randconfig-2100-20261005    clang-22   cocci
x86_64                randconfig-2100-20261006    clang-22   cocci
x86_64                randconfig-2101-20261005    clang-22   cocci
x86_64                randconfig-2101-20261005    gcc-14     cocci
x86_64                randconfig-2101-20261006    clang-22   cocci
x86_64                randconfig-2102-20261005    clang-22   cocci
x86_64                randconfig-2102-20261005    gcc-14     cocci
x86_64                randconfig-2102-20261006    clang-22   cocci
x86_64                randconfig-2103-20261005    clang-22   cocci
x86_64                randconfig-2103-20261006    clang-22   cocci
x86_64                randconfig-2200-20261005    clang-22   smatch
x86_64                randconfig-2200-20261006    clang-22   smatch
x86_64                randconfig-2300-20261005    clang-22   sparse
x86_64                randconfig-2300-20261006    gcc-14     sparse
x86_64                randconfig-2301-20261005    clang-22   sparse
x86_64                randconfig-2301-20261005    gcc-14     sparse
x86_64                randconfig-2301-20261006    gcc-14     sparse
x86_64                randconfig-2302-20261005    clang-22   sparse
x86_64                randconfig-2302-20261006    gcc-14     sparse
x86_64               randconfig-r2200-20261005    gcc-14     smatch
x86_64               randconfig-r2308-20261006    gcc-10.5.0 sparse
x86_64               randconfig-r2309-20261006    gcc-10.5.0 sparse
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
xtensa                randconfig-1000-20261006    gcc-14
xtensa                randconfig-1001-20261006    gcc-14
xtensa                randconfig-2000-20261005    clang-17
xtensa                randconfig-2001-20261005    clang-17
xtensa               randconfig-r2200-20261005    gcc-14.3.0 smatch
xtensa               randconfig-r2202-20261006    gcc-9.5.0  smatch
xtensa               randconfig-r2306-20261006    gcc-10.5.0 sparse
xtensa               randconfig-r2306-20261006    gcc-14.3.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

