Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E4FC9832F
	for <ath12k@archiver.kernel.org>; Sun, 27 Sep 2026 20:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mP+C5WjuMCLZqYO1hnj/J2GoG6+wZgy5ivK/K+955QM=; b=mWlETRp9s3hNF3RXSY5FKuZOqW
	R/5B/h1DAs4KVtKSsVexAyPOJKK+L9EYrMVaCo3SfjJMV6Hp0NOB+P+v97sOAC+kwUonlPAb4wrUy
	w/s5EqZHHF2lGuZMfVvJQUVdTeOAiQqmLqk+gLlGOxCX7h9ygEbXksXYb2/S84ganYnk685yTrr80
	sIcLNrmTaPqYZ/VQ5oXhzWUZcZ3VoVN+Xc5DzIR0OZFLzTGb5/NVmlZjRyntkOZkoOHdGlN05Xczv
	cY3XngwaNpgaWtTS76HWX17qpMyjJpRpWSZelmjrUQ+F3O01EeCkuvs+6flQxzDMTVOm2GzaCPvgb
	ZBCU5Gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAv6D-0000000GmM3-3EaS;
	Sun, 27 Sep 2026 20:03:49 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAv6B-0000000GmLc-2OdK
	for ath12k@lists.infradead.org;
	Sun, 27 Sep 2026 20:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790539427; x=1822075427;
  h=date:from:to:cc:subject:message-id;
  bh=jwUBFnOkz5vogazpxonSH3T3bbCBQMe8Ou0YaTJZkD8=;
  b=ej+Jh+SPnVZ5P+2aLXfkTH5nhaIJN3UtLnjXMplgSVPRdWQFJgAOFkOm
   wjf85ECx2mki3JbBzwpuqzTp9UznwXOD7fYf/1rooprgi/PFx4tx1y0P8
   xiYir3h9KhxupUxwwq1c7BUdBRRVIHuWpp+WZfl3CEfwZzjoRdvqruXXO
   8/xqZ+HDWnBqBZaC04+kjfyuJb0dp2MPW59/ujNKUKU+7AFcfWYsE19/l
   wYfG2YjsW8BziGxKeYhYWdbfRNpw/1P3Bfwg64w9IhxRr8WqZcAwfFPUK
   /rGhBSgW8HwMwAJG2JiAfHIhorBjGUVI1hK0LPBbbjDBD7bpfxIzVLbuw
   g==;
X-CSE-ConnectionGUID: Ql4wKww9TCOvz/g0IC0BCA==
X-CSE-MsgGUID: S9f2hVCAQ6a1MYKVhWUpEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="102614043"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="102614043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 13:03:45 -0700
X-CSE-ConnectionGUID: x4SwfejTRMq0M3x2dLDhwQ==
X-CSE-MsgGUID: 5T5FCNQPQP2eBH71Z6T+Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="282944760"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2026 13:03:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAv65-00000000N8A-1j2z;
	Sun, 27 Sep 2026 20:03:41 +0000
Date: Mon, 28 Sep 2026 04:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 5b28e8dc7503f47619905b97779437de7a01695d
Message-ID: <202609280422.5X2cpQkR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_130347_634830_9A5A52E4 
X-CRM114-Status: UNSURE (   3.78  )
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
branch HEAD: 5b28e8dc7503f47619905b97779437de7a01695d  MIPS: generic: Remove undefined image 'ramdisk'

elapsed time: 2176m

configs tested: 259
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260927    gcc-11.5.0
arc                   randconfig-1001-20260927    gcc-11.5.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20260927    gcc-11.5.0
arm                   randconfig-1001-20260927    gcc-11.5.0
arm                   randconfig-1002-20260927    gcc-11.5.0
arm                   randconfig-1003-20260927    gcc-11.5.0
arm                  randconfig-r2107-20260927    clang-17   cocci
arm                  randconfig-r2300-20260927    clang-22   sparse
arm                  randconfig-r2304-20260927    clang-22   sparse
arm                           sp7021_defconfig    gcc-11.5.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260927    clang-17
arm64                 randconfig-1001-20260927    clang-17
arm64                 randconfig-1002-20260927    clang-17
arm64                 randconfig-1003-20260927    clang-17
arm64                randconfig-r2200-20260927    clang-24   smatch
arm64                randconfig-r2305-20260927    gcc-15.2.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260927    clang-17
csky                  randconfig-1001-20260927    clang-17
csky                 randconfig-r2106-20260927    clang-17   cocci
csky                 randconfig-r2200-20260927    gcc-16.1.0 smatch
csky                 randconfig-r2300-20260927    gcc-15.2.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260927    gcc-11.5.0
hexagon               randconfig-1001-20260927    gcc-11.5.0
hexagon              randconfig-r2104-20260927    clang-24   cocci
hexagon              randconfig-r2304-20260927    gcc-15.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260927    clang-22
i386        buildonly-randconfig-1001-20260927    clang-22
i386        buildonly-randconfig-1002-20260927    clang-22
i386        buildonly-randconfig-1003-20260927    clang-22
i386        buildonly-randconfig-1004-20260927    clang-22
i386        buildonly-randconfig-1005-20260927    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260927    clang-22
i386                  randconfig-1001-20260927    clang-22
i386                  randconfig-1002-20260927    clang-22
i386                  randconfig-1003-20260927    clang-22
i386                  randconfig-1004-20260927    clang-22
i386                  randconfig-1005-20260927    clang-22
i386                  randconfig-1006-20260927    clang-22
i386                  randconfig-1007-20260927    gcc-14
i386                  randconfig-1008-20260927    gcc-14
i386                  randconfig-1009-20260927    gcc-14
i386                  randconfig-1010-20260927    gcc-14
i386                  randconfig-1011-20260927    gcc-14
i386                  randconfig-1012-20260927    gcc-14
i386                  randconfig-1013-20260927    gcc-14
i386                  randconfig-2100-20260927    clang-22   cocci
i386                  randconfig-2101-20260927    clang-22   cocci
i386                  randconfig-2102-20260927    clang-22   cocci
i386                  randconfig-2103-20260927    clang-22   cocci
i386                  randconfig-2200-20260927    clang-22   smatch
i386                  randconfig-2300-20260927    clang-22   sparse
i386                  randconfig-2301-20260927    clang-22   sparse
i386                  randconfig-2302-20260927    clang-22   sparse
i386                 randconfig-r2107-20260927    clang-24   cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260927    gcc-11.5.0
loongarch             randconfig-1001-20260927    gcc-11.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-11.5.0
m68k                 randconfig-r2301-20260927    gcc-15.2.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2202-20260927    gcc-13.4.0 smatch
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm47xx_defconfig    gcc-11.5.0
mips                   cavium_octeon_defconfig    gcc-16.1.0
mips                        lemote2f_defconfig    gcc-16.1.0
mips                 randconfig-r2305-20260927    clang-22   sparse
nios2                             alldefconfig    gcc-11.5.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260927    gcc-11.5.0
nios2                 randconfig-1001-20260927    gcc-11.5.0
nios2                randconfig-r2303-20260927    clang-22   sparse
nios2                randconfig-r2303-20260927    gcc-15.2.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20260927    gcc-13.4.0 cocci
openrisc             randconfig-r2106-20260927    clang-24   cocci
openrisc             randconfig-r2200-20260927    gcc-16.1.0 smatch
openrisc             randconfig-r2202-20260927    gcc-10.5.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260927    clang-24
parisc                randconfig-1001-20260927    clang-24
parisc               randconfig-r2103-20260927    gcc-13.4.0 cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20260927    clang-24
powerpc               randconfig-1001-20260927    clang-24
powerpc              randconfig-r2105-20260927    clang-17   cocci
powerpc              randconfig-r2302-20260927    gcc-15.2.0 sparse
powerpc                      tqm8541_defconfig    gcc-11.5.0
powerpc                      tqm8541_defconfig    gcc-16.1.0
powerpc                      tqm8548_defconfig    gcc-11.5.0
powerpc                      tqm8555_defconfig    gcc-11.5.0
powerpc                      tqm8560_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260927    clang-24
powerpc64             randconfig-1001-20260927    clang-24
powerpc64            randconfig-r2102-20260927    gcc-13.4.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260927    gcc-16.1.0
riscv                 randconfig-1001-20260927    gcc-16.1.0
riscv                 randconfig-2000-20260927    clang-24
riscv                 randconfig-2001-20260927    clang-24
riscv                randconfig-r2201-20260927    gcc-8.5.0  smatch
riscv                randconfig-r2301-20260927    clang-22   sparse
riscv                randconfig-r2307-20260927    clang-24   sparse
riscv                randconfig-r2308-20260927    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                           debug_defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260927    gcc-16.1.0
s390                  randconfig-1001-20260927    gcc-16.1.0
s390                  randconfig-2000-20260927    clang-24
s390                  randconfig-2001-20260927    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           polaris_defconfig    gcc-16.1.0
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260927    gcc-16.1.0
sh                    randconfig-1001-20260927    gcc-16.1.0
sh                    randconfig-2000-20260927    clang-24
sh                    randconfig-2001-20260927    clang-24
sh                   randconfig-r2201-20260927    gcc-15.2.0 smatch
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260927    clang-24
sparc                 randconfig-1001-20260927    clang-24
sparc                 randconfig-2000-20260927    gcc-16.1.0
sparc                 randconfig-2001-20260927    gcc-16.1.0
sparc                randconfig-r2105-20260927    clang-24   cocci
sparc                randconfig-r2306-20260927    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260927    clang-24
sparc64               randconfig-1001-20260927    clang-24
sparc64               randconfig-2000-20260927    gcc-16.1.0
sparc64               randconfig-2001-20260927    gcc-16.1.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260927    clang-24
um                    randconfig-1001-20260927    clang-24
um                    randconfig-2000-20260927    gcc-16.1.0
um                    randconfig-2001-20260927    gcc-16.1.0
um                   randconfig-r2202-20260927    gcc-14     smatch
um                   randconfig-r2302-20260927    clang-22   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260927    gcc-14
x86_64      buildonly-randconfig-1001-20260927    gcc-14
x86_64      buildonly-randconfig-1002-20260927    gcc-14
x86_64      buildonly-randconfig-1003-20260927    gcc-14
x86_64      buildonly-randconfig-1004-20260927    gcc-14
x86_64      buildonly-randconfig-1005-20260927    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260927    clang-22
x86_64                randconfig-1001-20260927    clang-22
x86_64                randconfig-1002-20260927    clang-22
x86_64                randconfig-1003-20260927    clang-22
x86_64                randconfig-1004-20260927    clang-22
x86_64                randconfig-1005-20260927    clang-22
x86_64                randconfig-1006-20260927    clang-22
x86_64                randconfig-1007-20260927    clang-22
x86_64                randconfig-1008-20260927    clang-22
x86_64                randconfig-1009-20260927    clang-22
x86_64                randconfig-1010-20260927    clang-22
x86_64                randconfig-1011-20260927    clang-22
x86_64                randconfig-1012-20260927    clang-22
x86_64                randconfig-1013-20260927    clang-22
x86_64                randconfig-1014-20260927    clang-22
x86_64                randconfig-1015-20260927    clang-22
x86_64                randconfig-1016-20260927    clang-22
x86_64                randconfig-1017-20260927    clang-22
x86_64                randconfig-2100-20260927    clang-22   cocci
x86_64                randconfig-2101-20260927    clang-22   cocci
x86_64                randconfig-2102-20260927    clang-22   cocci
x86_64                randconfig-2102-20260927    gcc-14     cocci
x86_64                randconfig-2103-20260927    clang-22   cocci
x86_64                randconfig-2200-20260927    gcc-14     smatch
x86_64                randconfig-2300-20260927    clang-22   sparse
x86_64                randconfig-2300-20260927    gcc-14     sparse
x86_64                randconfig-2301-20260927    clang-22   sparse
x86_64                randconfig-2301-20260927    gcc-14     sparse
x86_64                randconfig-2302-20260927    clang-22   sparse
x86_64                randconfig-2302-20260927    gcc-13     sparse
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
xtensa                randconfig-1000-20260927    clang-24
xtensa                randconfig-1001-20260927    clang-24
xtensa                randconfig-2000-20260927    gcc-16.1.0
xtensa                randconfig-2001-20260927    gcc-16.1.0
xtensa               randconfig-r2100-20260927    gcc-13.4.0 cocci
xtensa               randconfig-r2104-20260927    clang-17   cocci
xtensa               randconfig-r2201-20260927    gcc-16.1.0 smatch
xtensa               randconfig-r2202-20260927    gcc-14.3.0 smatch
xtensa               randconfig-r2309-20260927    clang-24   sparse
xtensa                     smp_lx200_defconfig    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

