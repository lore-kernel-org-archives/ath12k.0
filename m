Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BD3C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 05:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PP+9eVwo8F1bqlpEAgD6Ysj99s9Sj4YSe1/5FO44++o=; b=cV7pg9Q5Bt0FUX7CYJOJWj+E4c
	6lAo1uW4VapUup2BCWGmFD8eL1tTJ385cPnhJG4CPy89t5IP+/NqwksSUPy2yjjMzlGmONfYWCc99
	OvM0eG6AA3VJ02e4hAMGrNTjbfXi5ljOQWiSkHqWvEUHSUBuJhocEEOGZNORy1mUoBzRFVuDMe7Mv
	AEpF6kQACOn/LeU306T/xWt8ReD1WI7ilmPOpjL5XZV76XndpqZ5HxCfVmpbgjeWz/8HtQUdF2RqJ
	e8lqQ9bUoo8wZRGGEmEP1DcrZy4rDW1k/hzSpn47VacbHMLS1gjTcpTTPaBBimxkQ/UhtxQ/Y7uXD
	O8ySDjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9TR-00000008AfI-2SXB;
	Mon, 13 Jul 2026 05:45:01 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9TO-00000008Aeh-2qnU
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 05:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783921499; x=1815457499;
  h=date:from:to:cc:subject:message-id;
  bh=QMFRmFPWtLk4zGHmu1kZl9pgxoZGYKvuSGzXYq2uF0k=;
  b=eVhn9QvwL9B0eeo9eO2Wx4k+2IGGt1Hfs+UlAAqcC8nO5CKjxllifvUH
   LH8NVc+RPyfxnoH0yiOeTSDO8iK8oRKVQBmTnwXBvca/c1wU/RPP93fCv
   8KFCLhXgzXHVCW+mFg+iM/uPzJc/wkExSuTzTFKQtKb1twztBJDcMJ3bm
   bYblk4GlOqavZQebk4fQ+7wFT9ttm08nWvppITK5AVu10AhVTztWLeLg/
   0SnkGvw7ZYCWV9slDUAW+zB5NgANnNwy4dewzLTihpzVs2oPOkfNrzytT
   5xQfkBMtPs9qdhusVJWwT6PeuJLAosc6yzYa5AYQBGFaesfKNhTSHI8uG
   A==;
X-CSE-ConnectionGUID: qKWjlpX5Qt+DJ/uLHbDviw==
X-CSE-MsgGUID: zKAMEzFTTh+90gWRk+jhig==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88204852"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88204852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 22:44:58 -0700
X-CSE-ConnectionGUID: LhnP28ghSDCt8KDoY29ESA==
X-CSE-MsgGUID: g2GMjot1TXCHc5t2DaewEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256090717"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Jul 2026 22:44:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj9TD-00000000LPs-47IC;
	Mon, 13 Jul 2026 05:44:50 +0000
Date: Mon, 13 Jul 2026 13:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 faea7a4c62ea491868361947faa2fb3088dfca17
Message-ID: <202607131325.RrAoQxwh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_224458_787431_824E3F6D 
X-CRM114-Status: UNSURE (   4.16  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: faea7a4c62ea491868361947faa2fb3088dfca17  wifi: carl9170: fix buffer overflow in rx_stream failover path

elapsed time: 724m

configs tested: 287
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260713    gcc-8.5.0
arc                   randconfig-002-20260713    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260713    gcc-13.4.0
arm                   randconfig-001-20260713    gcc-8.5.0
arm                   randconfig-002-20260713    gcc-15.2.0
arm                   randconfig-002-20260713    gcc-8.5.0
arm                   randconfig-003-20260713    gcc-13.4.0
arm                   randconfig-003-20260713    gcc-8.5.0
arm                   randconfig-004-20260713    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260713    clang-23
arm64                 randconfig-001-20260713    gcc-11.5.0
arm64                 randconfig-001-20260713    gcc-13.4.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260713    clang-23
arm64                 randconfig-002-20260713    gcc-13.4.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260713    clang-23
arm64                 randconfig-003-20260713    gcc-11.5.0
arm64                 randconfig-003-20260713    gcc-13.4.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260713    clang-23
arm64                 randconfig-004-20260713    gcc-13.4.0
arm64                 randconfig-004-20260713    gcc-8.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260713    clang-23
csky                  randconfig-001-20260713    gcc-13.4.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260713    clang-23
csky                  randconfig-002-20260713    gcc-11.5.0
csky                  randconfig-002-20260713    gcc-13.4.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260713    clang-21
hexagon               randconfig-001-20260713    clang-23
hexagon               randconfig-002-20260713    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260713    gcc-14
i386        buildonly-randconfig-002-20260713    clang-22
i386        buildonly-randconfig-002-20260713    gcc-14
i386        buildonly-randconfig-003-20260713    gcc-14
i386        buildonly-randconfig-004-20260713    clang-22
i386        buildonly-randconfig-004-20260713    gcc-14
i386        buildonly-randconfig-005-20260713    gcc-14
i386        buildonly-randconfig-006-20260713    gcc-14
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260713    clang-22
i386                  randconfig-001-20260713    gcc-14
i386                  randconfig-002-20260713    clang-22
i386                  randconfig-003-20260713    clang-22
i386                  randconfig-003-20260713    gcc-14
i386                  randconfig-004-20260713    clang-22
i386                  randconfig-004-20260713    gcc-14
i386                  randconfig-005-20260713    clang-22
i386                  randconfig-005-20260713    gcc-14
i386                  randconfig-006-20260713    clang-22
i386                  randconfig-006-20260713    gcc-14
i386                  randconfig-007-20260713    clang-22
i386                  randconfig-007-20260713    gcc-14
i386                  randconfig-011-20260713    clang-22
i386                  randconfig-012-20260713    clang-22
i386                  randconfig-012-20260713    gcc-14
i386                  randconfig-013-20260713    clang-22
i386                  randconfig-014-20260713    clang-22
i386                  randconfig-014-20260713    gcc-13
i386                  randconfig-015-20260713    clang-22
i386                  randconfig-015-20260713    gcc-14
i386                  randconfig-016-20260713    clang-22
i386                  randconfig-017-20260713    clang-22
i386                  randconfig-017-20260713    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260713    clang-23
loongarch             randconfig-002-20260713    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                  maltasmvp_eva_defconfig    gcc-16.1.0
mips                        omega2p_defconfig    clang-17
mips                          rm200_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260713    clang-23
nios2                 randconfig-001-20260713    gcc-11.5.0
nios2                 randconfig-002-20260713    clang-23
nios2                 randconfig-002-20260713    gcc-9.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260713    clang-23
parisc                randconfig-001-20260713    gcc-10.5.0
parisc                randconfig-002-20260713    clang-23
parisc                randconfig-002-20260713    gcc-8.5.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                     mpc512x_defconfig    clang-23
powerpc               randconfig-001-20260713    clang-23
powerpc               randconfig-001-20260713    gcc-13.4.0
powerpc               randconfig-002-20260713    clang-23
powerpc64             randconfig-001-20260713    clang-23
powerpc64             randconfig-001-20260713    gcc-15.2.0
powerpc64             randconfig-002-20260713    clang-23
powerpc64             randconfig-002-20260713    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-19
riscv                 randconfig-001-20260713    clang-19
riscv                 randconfig-001-20260713    gcc-15.2.0
riscv                          randconfig-002    clang-19
riscv                 randconfig-002-20260713    clang-19
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-19
s390                  randconfig-001-20260713    clang-17
s390                  randconfig-001-20260713    clang-19
s390                           randconfig-002    clang-19
s390                  randconfig-002-20260713    clang-17
s390                  randconfig-002-20260713    clang-19
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    clang-19
sh                    randconfig-001-20260713    clang-19
sh                    randconfig-001-20260713    gcc-16.1.0
sh                             randconfig-002    clang-19
sh                    randconfig-002-20260713    clang-19
sh                    randconfig-002-20260713    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-12.5.0
sparc                 randconfig-001-20260713    gcc-12.5.0
sparc                          randconfig-002    gcc-12.5.0
sparc                 randconfig-002-20260713    gcc-12.5.0
sparc                 randconfig-002-20260713    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-12.5.0
sparc64               randconfig-001-20260713    clang-20
sparc64               randconfig-001-20260713    gcc-12.5.0
sparc64                        randconfig-002    gcc-12.5.0
sparc64               randconfig-002-20260713    gcc-10.5.0
sparc64               randconfig-002-20260713    gcc-12.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-12.5.0
um                    randconfig-001-20260713    gcc-12.5.0
um                    randconfig-001-20260713    gcc-14
um                             randconfig-002    gcc-12.5.0
um                    randconfig-002-20260713    gcc-12.5.0
um                    randconfig-002-20260713    gcc-14
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260713    clang-22
x86_64      buildonly-randconfig-001-20260713    gcc-14
x86_64      buildonly-randconfig-002-20260713    clang-22
x86_64      buildonly-randconfig-002-20260713    gcc-12
x86_64      buildonly-randconfig-002-20260713    gcc-14
x86_64      buildonly-randconfig-003-20260713    clang-22
x86_64      buildonly-randconfig-004-20260713    clang-22
x86_64      buildonly-randconfig-005-20260713    clang-22
x86_64      buildonly-randconfig-006-20260713    clang-22
x86_64      buildonly-randconfig-006-20260713    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260713    gcc-13
x86_64                randconfig-001-20260713    gcc-14
x86_64                randconfig-002-20260713    gcc-13
x86_64                randconfig-003-20260713    clang-22
x86_64                randconfig-003-20260713    gcc-13
x86_64                randconfig-004-20260713    clang-22
x86_64                randconfig-004-20260713    gcc-13
x86_64                randconfig-005-20260713    gcc-13
x86_64                randconfig-006-20260713    gcc-13
x86_64                randconfig-006-20260713    gcc-14
x86_64                randconfig-011-20260713    gcc-14
x86_64                randconfig-012-20260713    clang-22
x86_64                randconfig-012-20260713    gcc-14
x86_64                randconfig-013-20260713    clang-22
x86_64                randconfig-013-20260713    gcc-14
x86_64                randconfig-014-20260713    gcc-14
x86_64                randconfig-015-20260713    gcc-14
x86_64                randconfig-016-20260713    gcc-14
x86_64                randconfig-071-20260713    clang-22
x86_64                randconfig-071-20260713    gcc-14
x86_64                randconfig-072-20260713    clang-22
x86_64                randconfig-072-20260713    gcc-14
x86_64                randconfig-073-20260713    gcc-14
x86_64                randconfig-074-20260713    gcc-14
x86_64                randconfig-075-20260713    gcc-14
x86_64                randconfig-076-20260713    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-12.5.0
xtensa                randconfig-001-20260713    gcc-12.5.0
xtensa                         randconfig-002    gcc-12.5.0
xtensa                randconfig-002-20260713    gcc-12.5.0
xtensa                randconfig-002-20260713    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

