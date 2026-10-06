Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CD1CA5FFC
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 11:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1oqshRuqNVL30Q3frOMhb8iPVqY27l4ETJiT9Ptc+04=; b=JY4vWxUPrQ8QdzJkM7FHwGIHw7
	aYyyJLgTMzZjJjt41mwBxC32kCTRr/9t3TOQxIksFAewhvHojKYNdD21kD5KkhZ5/9v2k9uFNEyPv
	7kTQcap73X8MITTJ07C4j1ToUK5r6gNauHpFiaBJawu7YIl9iFckf+HWdus7x9z/U2kzdsU5MoINN
	VQLiAAj9FtTTBqzziRXRdfy0n82fu3CGF8MMVUtyanJRL8Y+okBUuubfbXwyHHjV/KLN/lCnJnnAS
	5QC9/K67VbQ49CDUaJ9P4IAFa1x2AxZlHyog8GqEWYVuiG7HfVzRGb836A3XWLudGam2s8cqrXpqs
	eBR1CFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3W2-00000000e7g-2rsd;
	Tue, 06 Oct 2026 11:39:26 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3W0-00000000e7G-0mcl
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 11:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791286764; x=1822822764;
  h=date:from:to:cc:subject:message-id;
  bh=CwfXl51zRs8ZGxjm176XUyyGBkWga0rmMPE9xgAE5SE=;
  b=gOQEN+Wmm933aDARHLqydtcbvBlzCspWz5/XqWER9K5ytreDyKoKmsij
   cxAq2wB574ceRhHFJjBQQYdzkws52ndJYsTV2h4wgiBzHkipd8HKD7/5w
   dI0cfavSOJ29dRvzO+5DItlybQVGusbCH0kIhbVx3gV32DOxSp+u64j/6
   OO4ntwujIGrghqtrf9iwcuUr4D1l+boXabvn46OjmiLTUoLV/WT/KT6ez
   PzDhzMtydboSJ+d5pubDfsM9WRU4McCnq4Rj4Iv93/HGLW8Afmk2VeUkM
   vt5/ZXYUt8303DxO7V/06PhTzbaCGgSjg6dsEd8xwU6zcPb303ZfAK3F/
   Q==;
X-CSE-ConnectionGUID: q0DzmNc9Qeuz3GB6AZpGYA==
X-CSE-MsgGUID: joLVS8AYT5m2+CKdNahtyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="95790450"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="95790450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 04:39:24 -0700
X-CSE-ConnectionGUID: tNzunJ9JTE6TpgY3nx6WRg==
X-CSE-MsgGUID: JVLKXCilSeKuiDB1H9O1wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303399731"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Oct 2026 04:39:22 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE3Vw-000000001Xw-0MtY;
	Tue, 06 Oct 2026 11:39:20 +0000
Date: Tue, 06 Oct 2026 19:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 129324b60343dec19d45dcf87736f129b18b95bb
Message-ID: <202610061915.keBKc22g-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_043924_248268_777FAA52 
X-CRM114-Status: UNSURE (   4.42  )
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
branch HEAD: 129324b60343dec19d45dcf87736f129b18b95bb  wifi: ath10k: clear QMI if failed during init

elapsed time: 1227m

configs tested: 292
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
csky                 randconfig-r2201-20261006    gcc-9.5.0  smatch
csky                 randconfig-r2302-20261005    gcc-9.5.0  sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261006    gcc-13.4.0
hexagon               randconfig-1001-20261006    gcc-13.4.0
hexagon              randconfig-r2100-20261006    gcc-8.5.0  cocci
hexagon              randconfig-r2301-20261005    gcc-9.5.0  sparse
hexagon              randconfig-r2301-20261006    clang-20   sparse
hexagon              randconfig-r2303-20261006    clang-20   sparse
hexagon              randconfig-r2305-20261006    clang-20   sparse
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
i386                  randconfig-2301-20261005    clang-22   sparse
i386                  randconfig-2302-20261005    clang-22   sparse
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
loongarch            randconfig-r2302-20261006    clang-20   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2304-20261006    clang-20   sparse
m68k                 randconfig-r2307-20261005    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261006    gcc-8.5.0  cocci
microblaze           randconfig-r2304-20261005    gcc-9.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2107-20261006    clang-24   cocci
mips                 randconfig-r2309-20261006    gcc-10.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261006    gcc-13.4.0
nios2                 randconfig-1001-20261006    gcc-13.4.0
nios2                randconfig-r2105-20261005    gcc-8.5.0  cocci
nios2                randconfig-r2200-20261006    gcc-11.5.0 smatch
nios2                randconfig-r2303-20261005    gcc-9.5.0  sparse
nios2                randconfig-r2307-20261006    gcc-10.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2103-20261005    gcc-11.5.0 cocci
openrisc             randconfig-r2306-20261005    gcc-16.1.0 sparse
openrisc             randconfig-r2308-20261006    gcc-10.5.0 sparse
openrisc             randconfig-r2309-20261005    gcc-11.5.0 sparse
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
powerpc              randconfig-r2106-20261006    clang-17   cocci
powerpc              randconfig-r2202-20261006    gcc-9.5.0  smatch
powerpc64             randconfig-1000-20261006    gcc-14.3.0
powerpc64             randconfig-1001-20261006    gcc-14.3.0
powerpc64            randconfig-r2103-20261006    gcc-8.5.0  cocci
powerpc64            randconfig-r2104-20261005    gcc-8.5.0  cocci
powerpc64            randconfig-r2201-20261005    clang-24   smatch
powerpc64            randconfig-r2201-20261006    gcc-13.4.0 smatch
powerpc64            randconfig-r2202-20261005    gcc-12.5.0 smatch
powerpc64            randconfig-r2305-20261005    gcc-9.5.0  sparse
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
s390                 randconfig-r2308-20261005    clang-24   sparse
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
sparc                randconfig-r2307-20261005    gcc-12.5.0 sparse
sparc                randconfig-r2309-20261005    gcc-12.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261006    gcc-14
sparc64               randconfig-1001-20261006    gcc-14
sparc64               randconfig-2000-20261005    clang-17
sparc64               randconfig-2001-20261005    clang-17
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
x86_64                randconfig-2101-20261006    clang-22   cocci
x86_64                randconfig-2102-20261005    clang-22   cocci
x86_64                randconfig-2102-20261006    clang-22   cocci
x86_64                randconfig-2103-20261005    clang-22   cocci
x86_64                randconfig-2103-20261006    clang-22   cocci
x86_64                randconfig-2200-20261005    clang-22   smatch
x86_64                randconfig-2200-20261006    clang-22   smatch
x86_64                randconfig-2300-20261005    clang-22   sparse
x86_64                randconfig-2301-20261005    clang-22   sparse
x86_64                randconfig-2302-20261005    clang-22   sparse
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

