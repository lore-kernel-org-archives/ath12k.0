Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0449ECA5FF0
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 13:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XPD/3pmJ7uLmM2zYKckBtyIs5XCMj2sUqSeZ1yuvkhY=; b=fIyCjGHoCwSUvIcXvQFs09r7Mq
	hqDA1OdaTy/eZBzzjIrJ+L7lq95a6/F4UfscaHcLfLR8qs3F7KGuKUeZ0b1/R+dtczFMQNpo1SrJ5
	TobLF2mVOSJa5ewfqtd5nXOhHQokMuscZe9OpG+kFbLochouBU84WcddjFL2wpJNrpZ38vr3xpfTa
	dTPmLs9/0bS3RUAcgdqATeXP9MN8hSbsm4MzfPs2BV7UpQl/WZK5INeoG2yJJ7W0OUGvmqKhGNB0I
	6kj4eTmlg/LSL1Qs0PPWMGSSynrwcyboHqMr1MarFgdHOrvI5Lyl5Egsh0SWtyA1kLFa5IRWWR86e
	W5naGyQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiyj-0000000GZDf-2fdi;
	Mon, 05 Oct 2026 13:43:41 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiyg-0000000GZC3-19HR
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 13:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791207818; x=1822743818;
  h=date:from:to:cc:subject:message-id;
  bh=oZiP7qWSrwCUU9NBzqX7Kt85+zNEYz9H2KvvkVcnF80=;
  b=bPpCGluRfZUVObpzB01JTzE/qgZBTplIV+EeHMBFd0WWqTMAiYKTfPz2
   hC6iWywPCzenvNqHw61tChhFWNkxlOmAuVQ/tJ/+DhHn48cRJM5/kNr3h
   kC0mMcEHpdB3Us2Pt9ZVf2fEygfGNdfRUVEbX/DDGTxNVrB4UaQboRcrQ
   hT6v/wwS9uWJh7AKqzm/yLjBEWEKUBLOcFQtzUizYPM+sx4Ipq8l8DlTn
   7eqdEnBByMsOq4bS4KtiRjMwIk9h67CLs46swufHEQml2YOWC+BamsnXX
   isw8MMcYf5iiB0DMPtHKEbQV/P7Ux75p8DDA25M/CNmmxJyM5HL+OYvVQ
   Q==;
X-CSE-ConnectionGUID: sDWEtyNvRXu0kDmxeLpygQ==
X-CSE-MsgGUID: APCFcdPuSeyquD1qkfHYEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="95688796"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="95688796"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 06:43:36 -0700
X-CSE-ConnectionGUID: 14lz6BWJReifAzIXSr62Jw==
X-CSE-MsgGUID: qD3B/Ib+QYK7NEmT8I74dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="284703986"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Oct 2026 06:43:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDiya-000000000MV-2lkT;
	Mon, 05 Oct 2026 13:43:32 +0000
Date: Mon, 05 Oct 2026 21:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main-pending] BUILD SUCCESS
 6a1073bc48ee949c3a7d3181c204769e31b68eeb
Message-ID: <202610052146.FdzDfutj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_064338_336494_CD54715F 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-pending
branch HEAD: 6a1073bc48ee949c3a7d3181c204769e31b68eeb  Merge branch 'pending' into main-pending

elapsed time: 1200m

configs tested: 368
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.1.0
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2106-20261005    gcc-15.2.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261005    gcc-8.5.0
arc                   randconfig-1001-20261005    gcc-8.5.0
arc                  randconfig-r2300-20261005    gcc-11.5.0 sparse
arc                  randconfig-r2301-20261004    clang-24   sparse
arc                  randconfig-r2306-20261004    gcc-12.5.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                        imx_v4_v5_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261005    gcc-8.5.0
arm                   randconfig-1001-20261005    gcc-8.5.0
arm                   randconfig-1002-20261005    gcc-8.5.0
arm                   randconfig-1003-20261005    gcc-8.5.0
arm                  randconfig-r2102-20261005    gcc-13.4.0 cocci
arm                  randconfig-r2103-20261005    clang-24   cocci
arm                  randconfig-r2201-20261005    clang-24   smatch
arm                  randconfig-r2303-20261005    gcc-11.5.0 sparse
arm                         spear6xx_defconfig    gcc-16.1.0
arm                         vexpress_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261005    gcc-16.1.0
arm64                 randconfig-1001-20261005    gcc-16.1.0
arm64                 randconfig-1002-20261005    gcc-16.1.0
arm64                 randconfig-1003-20261005    gcc-16.1.0
arm64                randconfig-r2102-20261005    clang-24   cocci
arm64                randconfig-r2104-20261005    gcc-15.2.0 cocci
arm64                randconfig-r2202-20261005    clang-24   smatch
arm64                randconfig-r2301-20261004    gcc-10.5.0 sparse
arm64                randconfig-r2306-20261005    gcc-8.5.0  sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261005    gcc-16.1.0
csky                  randconfig-1001-20261005    gcc-16.1.0
csky                 randconfig-r2102-20261005    gcc-16.1.0 cocci
csky                 randconfig-r2201-20261005    gcc-10.5.0 smatch
csky                 randconfig-r2300-20261005    gcc-11.5.0 sparse
csky                 randconfig-r2307-20261004    clang-18   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261005    gcc-16.1.0
hexagon               randconfig-1001-20261005    gcc-16.1.0
hexagon              randconfig-r2100-20261005    gcc-16.1.0 cocci
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
i386                  randconfig-2100-20261005    gcc-14     cocci
i386                  randconfig-2101-20261004    clang-22   cocci
i386                  randconfig-2101-20261005    gcc-14     cocci
i386                  randconfig-2102-20261004    clang-22   cocci
i386                  randconfig-2102-20261005    gcc-14     cocci
i386                  randconfig-2103-20261004    clang-22   cocci
i386                  randconfig-2103-20261005    gcc-14     cocci
i386                  randconfig-2200-20261005    gcc-14     smatch
i386                  randconfig-2300-20261004    clang-22   sparse
i386                  randconfig-2300-20261005    clang-22   sparse
i386                  randconfig-2301-20261004    clang-22   sparse
i386                  randconfig-2301-20261004    gcc-14     sparse
i386                  randconfig-2301-20261005    clang-22   sparse
i386                  randconfig-2302-20261004    clang-22   sparse
i386                  randconfig-2302-20261004    gcc-14     sparse
i386                  randconfig-2302-20261005    clang-22   sparse
i386                 randconfig-r2100-20261005    gcc-13.4.0 cocci
i386                 randconfig-r2107-20261005    gcc-15.2.0 cocci
i386                 randconfig-r2107-20261005    gcc-8.5.0  cocci
i386                 randconfig-r2200-20261005    clang-22   smatch
i386                 randconfig-r2202-20261005    clang-22   smatch
i386                 randconfig-r2300-20261004    clang-22   sparse
i386                 randconfig-r2301-20261004    clang-22   sparse
i386                 randconfig-r2304-20261005    gcc-11.5.0 sparse
i386                 randconfig-r2307-20261004    gcc-14.3.0 sparse
i386                 randconfig-r2308-20261004    gcc-14.3.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261005    gcc-16.1.0
loongarch             randconfig-1001-20261005    gcc-16.1.0
loongarch            randconfig-r2105-20261004    gcc-16.1.0 cocci
loongarch            randconfig-r2305-20261004    clang-24   sparse
loongarch            randconfig-r2306-20261004    gcc-14.3.0 sparse
loongarch            randconfig-r2309-20261004    clang-18   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         mvme16x_defconfig    gcc-16.1.0
m68k                             q40_defconfig    gcc-16.1.0
m68k                 randconfig-r2102-20261004    gcc-16.1.0 cocci
m68k                 randconfig-r2105-20261005    gcc-8.5.0  cocci
m68k                 randconfig-r2106-20261005    gcc-8.5.0  cocci
m68k                 randconfig-r2300-20261004    clang-24   sparse
m68k                 randconfig-r2301-20261005    gcc-11.5.0 sparse
m68k                 randconfig-r2302-20261004    gcc-8.5.0  sparse
m68k                 randconfig-r2304-20261004    gcc-15.2.0 sparse
m68k                 randconfig-r2307-20261005    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.1.0
microblaze           randconfig-r2100-20261005    clang-24   cocci
microblaze           randconfig-r2101-20261005    clang-24   cocci
microblaze           randconfig-r2104-20261004    gcc-10.5.0 cocci
microblaze           randconfig-r2107-20261005    gcc-15.2.0 cocci
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2103-20261004    gcc-16.1.0 cocci
mips                 randconfig-r2200-20261004    gcc-15.2.0 smatch
mips                 randconfig-r2303-20261005    gcc-11.5.0 sparse
mips                 randconfig-r2308-20261004    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261005    gcc-16.1.0
nios2                 randconfig-1001-20261005    gcc-16.1.0
nios2                randconfig-r2103-20261005    gcc-16.1.0 cocci
nios2                randconfig-r2104-20261005    gcc-8.5.0  cocci
nios2                randconfig-r2106-20261005    gcc-15.2.0 cocci
nios2                randconfig-r2201-20261004    gcc-11.5.0 smatch
nios2                randconfig-r2202-20261005    gcc-11.5.0 smatch
nios2                randconfig-r2302-20261005    gcc-11.5.0 sparse
nios2                randconfig-r2303-20261005    clang-24   sparse
nios2                randconfig-r2307-20261004    gcc-8.5.0  sparse
nios2                randconfig-r2309-20261004    gcc-14.3.0 sparse
nios2                randconfig-r2309-20261005    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261004    gcc-16.1.0 cocci
openrisc             randconfig-r2303-20261004    gcc-10.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261005    gcc-8.5.0
parisc                randconfig-1001-20261005    gcc-8.5.0
parisc               randconfig-r2100-20261004    gcc-16.1.0 cocci
parisc               randconfig-r2105-20261005    gcc-15.2.0 cocci
parisc               randconfig-r2106-20261004    gcc-16.1.0 cocci
parisc               randconfig-r2303-20261004    clang-24   sparse
parisc               randconfig-r2307-20261005    gcc-8.5.0  sparse
parisc               randconfig-r2308-20261004    clang-18   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                    bluestone_defconfig    gcc-16.1.0
powerpc                         cell_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261005    gcc-8.5.0
powerpc               randconfig-1001-20261005    gcc-8.5.0
powerpc              randconfig-r2101-20261005    gcc-16.1.0 cocci
powerpc              randconfig-r2105-20261005    gcc-15.2.0 cocci
powerpc              randconfig-r2300-20261005    clang-24   sparse
powerpc              randconfig-r2301-20261005    clang-24   sparse
powerpc              randconfig-r2302-20261005    gcc-11.5.0 sparse
powerpc              randconfig-r2308-20261005    gcc-8.5.0  sparse
powerpc64                         alldefconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261005    gcc-8.5.0
powerpc64             randconfig-1001-20261005    gcc-8.5.0
powerpc64            randconfig-r2200-20261005    gcc-12.5.0 smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261005    clang-17
riscv                 randconfig-1001-20261005    clang-17
riscv                 randconfig-2000-20261004    clang-24
riscv                 randconfig-2000-20261004    gcc-11.5.0
riscv                 randconfig-2000-20261005    gcc-16.1.0
riscv                 randconfig-2001-20261004    clang-24
riscv                 randconfig-2001-20261004    gcc-11.5.0
riscv                 randconfig-2001-20261005    gcc-16.1.0
riscv                randconfig-r2100-20261005    gcc-13.4.0 cocci
riscv                randconfig-r2101-20261005    gcc-13.4.0 cocci
riscv                randconfig-r2102-20261005    gcc-13.4.0 cocci
riscv                randconfig-r2104-20261005    gcc-15.2.0 cocci
riscv                randconfig-r2200-20261004    gcc-11.5.0 smatch
riscv                randconfig-r2202-20261004    clang-17   smatch
riscv                randconfig-r2306-20261005    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261005    clang-17
s390                  randconfig-1001-20261005    clang-17
s390                  randconfig-2000-20261004    clang-24
s390                  randconfig-2000-20261004    gcc-11.5.0
s390                  randconfig-2000-20261005    gcc-16.1.0
s390                  randconfig-2001-20261004    gcc-10.5.0
s390                  randconfig-2001-20261004    gcc-11.5.0
s390                  randconfig-2001-20261005    gcc-16.1.0
s390                 randconfig-r2303-20261004    clang-24   sparse
s390                 randconfig-r2305-20261004    clang-24   sparse
s390                 randconfig-r2305-20261005    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261005    clang-17
sh                    randconfig-1001-20261005    clang-17
sh                    randconfig-2000-20261004    gcc-11.5.0
sh                    randconfig-2000-20261004    gcc-13.4.0
sh                    randconfig-2000-20261005    gcc-16.1.0
sh                    randconfig-2001-20261004    gcc-11.5.0
sh                    randconfig-2001-20261005    gcc-16.1.0
sh                   randconfig-r2101-20261004    gcc-16.1.0 cocci
sh                   randconfig-r2304-20261004    gcc-11.5.0 sparse
sh                   randconfig-r2305-20261005    gcc-11.5.0 sparse
sh                   randconfig-r2309-20261005    gcc-8.5.0  sparse
sh                       rts7751r2d1_defconfig    gcc-16.1.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261005    clang-24
sparc                 randconfig-1001-20261005    clang-24
sparc                 randconfig-2000-20261004    clang-17
sparc                 randconfig-2000-20261004    gcc-8.5.0
sparc                 randconfig-2000-20261005    clang-17
sparc                 randconfig-2001-20261004    clang-17
sparc                 randconfig-2001-20261004    gcc-15.2.0
sparc                 randconfig-2001-20261005    clang-17
sparc                randconfig-r2201-20261005    gcc-15.2.0 smatch
sparc                randconfig-r2301-20261005    gcc-11.5.0 sparse
sparc                randconfig-r2302-20261005    clang-24   sparse
sparc                randconfig-r2304-20261005    gcc-11.5.0 sparse
sparc                randconfig-r2308-20261005    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261005    clang-24
sparc64               randconfig-1001-20261005    clang-24
sparc64               randconfig-2000-20261004    clang-17
sparc64               randconfig-2000-20261004    clang-20
sparc64               randconfig-2000-20261005    clang-17
sparc64               randconfig-2001-20261004    clang-17
sparc64               randconfig-2001-20261004    gcc-10.5.0
sparc64               randconfig-2001-20261005    clang-17
sparc64              randconfig-r2101-20261005    gcc-13.4.0 cocci
sparc64              randconfig-r2107-20261004    gcc-10.5.0 cocci
sparc64              randconfig-r2304-20261005    clang-24   sparse
sparc64              randconfig-r2306-20261004    clang-18   sparse
sparc64              randconfig-r2309-20261004    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261005    clang-24
um                    randconfig-1001-20261005    clang-24
um                    randconfig-2000-20261004    clang-17
um                    randconfig-2000-20261004    gcc-14
um                    randconfig-2000-20261005    clang-17
um                    randconfig-2001-20261004    clang-17
um                    randconfig-2001-20261005    clang-17
um                   randconfig-r2105-20261004    gcc-10.5.0 cocci
um                   randconfig-r2300-20261004    gcc-14     sparse
um                   randconfig-r2304-20261004    clang-24   sparse
um                   randconfig-r2305-20261005    gcc-11.5.0 sparse
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
x86_64                randconfig-2100-20261005    clang-22   cocci
x86_64                randconfig-2101-20261004    clang-22   cocci
x86_64                randconfig-2101-20261004    gcc-14     cocci
x86_64                randconfig-2101-20261005    clang-22   cocci
x86_64                randconfig-2102-20261004    gcc-14     cocci
x86_64                randconfig-2102-20261005    clang-22   cocci
x86_64                randconfig-2103-20261004    gcc-14     cocci
x86_64                randconfig-2103-20261005    clang-22   cocci
x86_64                randconfig-2200-20261004    gcc-14     smatch
x86_64                randconfig-2200-20261005    clang-22   smatch
x86_64                randconfig-2300-20261004    clang-22   sparse
x86_64                randconfig-2300-20261004    gcc-14     sparse
x86_64                randconfig-2300-20261005    clang-22   sparse
x86_64                randconfig-2301-20261004    clang-22   sparse
x86_64                randconfig-2301-20261004    gcc-14     sparse
x86_64                randconfig-2301-20261005    clang-22   sparse
x86_64                randconfig-2302-20261004    clang-22   sparse
x86_64                randconfig-2302-20261005    clang-22   sparse
x86_64               randconfig-r2103-20261005    gcc-13.4.0 cocci
x86_64               randconfig-r2302-20261004    clang-22   sparse
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
xtensa                randconfig-2000-20261004    gcc-8.5.0
xtensa                randconfig-2000-20261005    clang-17
xtensa                randconfig-2001-20261004    clang-17
xtensa                randconfig-2001-20261004    gcc-9.5.0
xtensa                randconfig-2001-20261005    clang-17
xtensa               randconfig-r2103-20261005    gcc-13.4.0 cocci
xtensa               randconfig-r2106-20261004    gcc-10.5.0 cocci
xtensa               randconfig-r2107-20261004    gcc-16.1.0 cocci
xtensa               randconfig-r2201-20261004    gcc-13.4.0 smatch
xtensa               randconfig-r2202-20261005    gcc-10.5.0 smatch
xtensa               randconfig-r2302-20261004    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

