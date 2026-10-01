Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3F1CA5FB3
	for <ath12k@archiver.kernel.org>; Thu,  1 Oct 2026 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K3oA/nSy8s9isG+7+DbHvFUsIqR8plCv0QnojjkFKuY=; b=Bc7Z2i4xX6H3CfJNGpHm19KwoC
	H5CC7JdpJMthy4eNxTjW+x9ufTySspAbkua0MvQOwnlkIgEc5eKTcV05+et4wcRBoaZhEzBzso/bp
	6uUOJFAEOeZHACU4ilq8Li99HeWu2td9PP8/SE8kXnB18+DTLDPMwW0vbsRzpiNJNL+dDdIaiw9iD
	jaATWl+KTnCnsRm9YcaNXA1QxDcLQ3dVbdKCmletPGSxwErHlfg1iK3D0j9pOf53zPv09S+3E4Nhk
	NhpDhqSm82dWuoWdC1SgPIYxa0hgjWcMTDjXzXSMQnac9ic4tUsISTmMkoWFb0qV8Y2rUBzjxtx2x
	VKMNndwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCf1-00000008IPg-33BO;
	Thu, 01 Oct 2026 09:01:03 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCez-00000008IOd-44VU
	for ath12k@lists.infradead.org;
	Thu, 01 Oct 2026 09:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790845262; x=1822381262;
  h=date:from:to:cc:subject:message-id;
  bh=HblCFe8XQn2DgkuxWDPfur5BY9iMPU0DNcM1Wzo4JrY=;
  b=WrkQKwp3HlFrqnrpTWctum6HvESMZOBtFUgh01Xh9ERhyAFOUAAYuk4c
   JkBmC7ZkD0p13JoBocttk9OSL8Pc3WhNNiiaB0HiPKmOdplZcjBoP93uO
   Nzo5sMzNDH3pRuyFfUNSScZic+/AkMisAJ5nCCqKgShHZ0cEuW5Acqkkv
   7JmCRxEYyOJDcOZE/Hy6q1CelDqticDW17gMadPGUmviTjnPr4jsPyUq5
   FXT2UWpxnvGiWPKAfCCw+J5mh7huZ/2477H2gAao4BM5wZcATFsT+uhEI
   wJPKo1DihqQcWJkkTknLVjPz+0db9ezaT1sp29+5BE6ErXroMUCYxX35a
   w==;
X-CSE-ConnectionGUID: lHDf9GUPSkW66kkh7AtoTg==
X-CSE-MsgGUID: so97nL4eSHeI+pr9hDBcZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91613538"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="91613538"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 02:01:01 -0700
X-CSE-ConnectionGUID: o0xs43SgSSSstRCIcT/+mg==
X-CSE-MsgGUID: Ny66r3YWRnuibTAz7i75tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="274027116"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2026 02:00:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCCeq-00000000Rg8-43JB;
	Thu, 01 Oct 2026 09:00:52 +0000
Date: Thu, 01 Oct 2026 17:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 b64812cb6cec118f6c59a4ec2bd4848db17f6bb2
Message-ID: <202610011722.zpu5cZdc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_020102_056886_524CA9D8 
X-CRM114-Status: UNSURE (   4.09  )
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
branch HEAD: b64812cb6cec118f6c59a4ec2bd4848db17f6bb2  MIPS: generic: Remove undefined image 'ramdisk'

elapsed time: 2122m

configs tested: 283
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2103-20260930    gcc-8.5.0  cocci
alpha                randconfig-r2107-20260930    gcc-8.5.0  cocci
alpha                randconfig-r2307-20260929    gcc-14.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261001    gcc-13.4.0
arc                   randconfig-1001-20261001    gcc-13.4.0
arc                  randconfig-r2202-20260930    gcc-16.1.0 smatch
arc                  randconfig-r2301-20260930    clang-24   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261001    gcc-13.4.0
arm                   randconfig-1001-20261001    gcc-13.4.0
arm                   randconfig-1002-20261001    gcc-13.4.0
arm                   randconfig-1003-20261001    gcc-13.4.0
arm                  randconfig-r2101-20260930    clang-19   cocci
arm                  randconfig-r2101-20260930    clang-24   cocci
arm                  randconfig-r2102-20260930    clang-24   cocci
arm                  randconfig-r2105-20260930    gcc-8.5.0  cocci
arm                  randconfig-r2106-20260930    clang-22   cocci
arm                  randconfig-r2202-20260930    clang-17   smatch
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261001    gcc-15.2.0
arm64                 randconfig-1001-20261001    gcc-15.2.0
arm64                 randconfig-1002-20261001    gcc-15.2.0
arm64                 randconfig-1003-20261001    gcc-15.2.0
arm64                randconfig-r2301-20260930    gcc-13.4.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261001    gcc-15.2.0
csky                  randconfig-1001-20261001    gcc-15.2.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261001    clang-24
hexagon               randconfig-1001-20261001    clang-24
hexagon              randconfig-r2102-20260930    clang-24   cocci
hexagon              randconfig-r2107-20260930    clang-24   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261001    gcc-13
i386        buildonly-randconfig-1001-20261001    gcc-13
i386        buildonly-randconfig-1002-20261001    gcc-13
i386        buildonly-randconfig-1003-20261001    gcc-13
i386        buildonly-randconfig-1004-20261001    gcc-13
i386        buildonly-randconfig-1005-20261001    gcc-13
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261001    clang-22
i386                  randconfig-1001-20261001    clang-22
i386                  randconfig-1002-20261001    clang-22
i386                  randconfig-1003-20261001    clang-22
i386                  randconfig-1004-20261001    clang-22
i386                  randconfig-1005-20261001    clang-22
i386                  randconfig-1006-20261001    clang-22
i386                  randconfig-1007-20261001    clang-22
i386                  randconfig-1008-20261001    clang-22
i386                  randconfig-1009-20261001    clang-22
i386                  randconfig-1010-20261001    clang-22
i386                  randconfig-1011-20261001    clang-22
i386                  randconfig-1012-20261001    clang-22
i386                  randconfig-1013-20261001    clang-22
i386                  randconfig-2100-20260930    clang-22   cocci
i386                  randconfig-2101-20260930    clang-22   cocci
i386                  randconfig-2102-20260930    clang-22   cocci
i386                  randconfig-2103-20260930    clang-22   cocci
i386                  randconfig-2200-20260930    gcc-14     smatch
i386                  randconfig-2300-20260930    gcc-13     sparse
i386                  randconfig-2300-20260930    gcc-14     sparse
i386                  randconfig-2301-20260930    clang-22   sparse
i386                  randconfig-2301-20260930    gcc-13     sparse
i386                  randconfig-2302-20260930    gcc-13     sparse
i386                  randconfig-2302-20260930    gcc-14     sparse
i386                 randconfig-r2200-20260930    gcc-14     smatch
i386                 randconfig-r2202-20260930    gcc-13     smatch
i386                 randconfig-r2302-20260930    clang-22   sparse
i386                 randconfig-r2303-20260930    clang-24   sparse
i386                 randconfig-r2306-20260929    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261001    clang-24
loongarch             randconfig-1001-20261001    clang-24
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2106-20260930    gcc-8.5.0  cocci
m68k                 randconfig-r2300-20260930    gcc-12.5.0 sparse
m68k                 randconfig-r2303-20260930    gcc-8.5.0  sparse
m68k                 randconfig-r2304-20260930    gcc-8.5.0  sparse
m68k                 randconfig-r2307-20260930    gcc-12.5.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2307-20260929    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2308-20260929    gcc-15.2.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261001    clang-24
nios2                 randconfig-1001-20261001    clang-24
nios2                randconfig-r2200-20260930    gcc-10.5.0 smatch
nios2                randconfig-r2201-20260930    gcc-11.5.0 smatch
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20260930    gcc-16.1.0 cocci
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261001    gcc-13.4.0
parisc                randconfig-1001-20261001    gcc-13.4.0
parisc               randconfig-r2107-20260930    gcc-9.5.0  cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    clang-22
powerpc                         icon_defconfig    clang-22
powerpc                  mpc8313_rdb_defconfig    clang-22
powerpc                  mpc834x_itx_defconfig    clang-22
powerpc                  mpc837x_rdb_defconfig    clang-22
powerpc               randconfig-1000-20261001    gcc-13.4.0
powerpc               randconfig-1001-20261001    gcc-13.4.0
powerpc              randconfig-r2103-20260930    clang-24   cocci
powerpc              randconfig-r2306-20260930    gcc-12.5.0 sparse
powerpc                       tqm8xx_defconfig    clang-22
powerpc64             randconfig-1000-20261001    gcc-13.4.0
powerpc64             randconfig-1001-20261001    gcc-13.4.0
powerpc64            randconfig-r2100-20260930    gcc-15.2.0 cocci
powerpc64            randconfig-r2103-20260930    gcc-13.4.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261001    gcc-10.5.0
riscv                 randconfig-1001-20261001    gcc-10.5.0
riscv                 randconfig-2000-20260929    gcc-11.5.0
riscv                 randconfig-2000-20260930    gcc-14.3.0
riscv                 randconfig-2001-20260929    gcc-9.5.0
riscv                 randconfig-2001-20260930    gcc-14.3.0
riscv                randconfig-r2104-20260930    clang-17   cocci
riscv                randconfig-r2105-20260930    clang-24   cocci
riscv                randconfig-r2300-20260930    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261001    gcc-10.5.0
s390                  randconfig-1001-20261001    gcc-10.5.0
s390                  randconfig-2000-20260929    clang-24
s390                  randconfig-2000-20260930    gcc-14.3.0
s390                  randconfig-2001-20260929    gcc-8.5.0
s390                  randconfig-2001-20260930    gcc-14.3.0
s390                 randconfig-r2102-20260930    gcc-8.5.0  cocci
s390                 randconfig-r2104-20260930    gcc-8.5.0  cocci
s390                 randconfig-r2305-20260930    clang-24   sparse
s390                 randconfig-r2309-20260929    clang-17   sparse
sh                                alldefconfig    clang-22
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261001    gcc-10.5.0
sh                    randconfig-1001-20261001    gcc-10.5.0
sh                    randconfig-2000-20260929    gcc-14.3.0
sh                    randconfig-2000-20260930    gcc-14.3.0
sh                    randconfig-2001-20260929    gcc-16.1.0
sh                    randconfig-2001-20260930    gcc-14.3.0
sh                   randconfig-r2200-20260930    gcc-16.1.0 smatch
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261001    clang-17
sparc                 randconfig-1001-20261001    clang-17
sparc                 randconfig-2000-20260930    gcc-10.5.0
sparc                 randconfig-2000-20260930    gcc-14.3.0
sparc                 randconfig-2001-20260930    gcc-10.5.0
sparc                 randconfig-2001-20260930    gcc-8.5.0
sparc                randconfig-r2100-20260930    gcc-16.1.0 cocci
sparc                randconfig-r2302-20260930    clang-24   sparse
sparc                randconfig-r2308-20260930    gcc-12.5.0 sparse
sparc                        sparc64_defconfig    clang-22
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261001    clang-17
sparc64               randconfig-1001-20261001    clang-17
sparc64               randconfig-2000-20260930    gcc-10.5.0
sparc64               randconfig-2000-20260930    gcc-8.5.0
sparc64               randconfig-2001-20260930    gcc-10.5.0
sparc64               randconfig-2001-20260930    gcc-9.5.0
sparc64              randconfig-r2304-20260930    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261001    clang-17
um                    randconfig-1001-20261001    clang-17
um                    randconfig-2000-20260930    clang-24
um                    randconfig-2000-20260930    gcc-10.5.0
um                    randconfig-2001-20260930    clang-24
um                    randconfig-2001-20260930    gcc-10.5.0
um                   randconfig-r2100-20260930    clang-24   cocci
um                   randconfig-r2105-20260930    gcc-8.5.0  cocci
um                   randconfig-r2106-20260930    gcc-14     cocci
um                   randconfig-r2201-20260930    clang-17   smatch
um                   randconfig-r2309-20260930    gcc-12.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261001    clang-22
x86_64      buildonly-randconfig-1001-20261001    clang-22
x86_64      buildonly-randconfig-1002-20261001    clang-22
x86_64      buildonly-randconfig-1003-20261001    clang-22
x86_64      buildonly-randconfig-1004-20261001    clang-22
x86_64      buildonly-randconfig-1005-20261001    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261001    clang-22
x86_64                randconfig-1001-20261001    clang-22
x86_64                randconfig-1002-20261001    clang-22
x86_64                randconfig-1003-20261001    clang-22
x86_64                randconfig-1004-20261001    clang-22
x86_64                randconfig-1005-20261001    clang-22
x86_64                randconfig-1006-20261001    clang-22
x86_64                randconfig-1007-20261001    clang-22
x86_64                randconfig-1008-20261001    clang-22
x86_64                randconfig-1009-20261001    clang-22
x86_64                randconfig-1010-20261001    clang-22
x86_64                randconfig-1011-20261001    clang-22
x86_64                randconfig-1012-20261001    clang-22
x86_64                randconfig-1013-20261001    clang-22
x86_64                randconfig-1014-20261001    clang-22
x86_64                randconfig-1015-20261001    clang-22
x86_64                randconfig-1016-20261001    clang-22
x86_64                randconfig-1017-20261001    clang-22
x86_64                randconfig-2100-20260930    clang-22   cocci
x86_64                randconfig-2101-20260930    clang-22   cocci
x86_64                randconfig-2102-20260930    clang-22   cocci
x86_64                randconfig-2102-20260930    gcc-14     cocci
x86_64                randconfig-2103-20260930    clang-22   cocci
x86_64                randconfig-2200-20260930    gcc-14     smatch
x86_64                randconfig-2300-20260930    clang-22   sparse
x86_64                randconfig-2300-20260930    gcc-13     sparse
x86_64                randconfig-2301-20260930    gcc-13     sparse
x86_64                randconfig-2301-20260930    gcc-14     sparse
x86_64                randconfig-2302-20260930    gcc-13     sparse
x86_64               randconfig-r2305-20260930    clang-22   sparse
x86_64               randconfig-r2309-20260929    clang-22   sparse
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
xtensa                randconfig-1000-20261001    clang-17
xtensa                randconfig-1001-20261001    clang-17
xtensa                randconfig-2000-20260930    gcc-10.5.0
xtensa                randconfig-2000-20260930    gcc-12.5.0
xtensa                randconfig-2001-20260930    gcc-10.5.0
xtensa               randconfig-r2104-20260930    gcc-9.5.0  cocci
xtensa               randconfig-r2306-20260929    gcc-8.5.0  sparse
xtensa               randconfig-r2308-20260929    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

