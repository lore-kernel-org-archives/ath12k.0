Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684F9C43458
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TjY4DQMbnUSfK8O5gfehBzMKTsCOoNCHkTskmcwxmcQ=; b=wpG1FPTsy/ALWd7iVtIEAQsQRa
	JCx6SPS7dGoptBRIpelq99FutRu8svHAzP5Ezv3e1av0YiKuOfkVQJqxBkzrCkBn70yMdHTq99Sqx
	99OuYHyMQ+j1yNOyG7voJELTvqE0NR/BJ3MHiiUlAl+gdvR63hPBWRm6Mq2BQgO4abCbnTvdkTI2R
	40cZeznQkXh/Ug1OX+IYmzlOFcAsm3NM+NQ2ieeJMsc0VlGkQ0MhjaFdEuDa+elkGI9o+TVVNgzk0
	R4cnQtA9QEB6j0/5jmxt6iy4kZ7SkotltIJHhkDP6uU58jFijCPnkHqj3ob4ZTdE2LLMFLU6DCA42
	Zi+YLUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYGM-0000000BGtN-0Zqs;
	Tue, 14 Jul 2026 08:13:10 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYGF-0000000BGs6-3gXo
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 08:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784016784; x=1815552784;
  h=date:from:to:cc:subject:message-id;
  bh=PIZZrTvLkypAYJR9eLZhbNsElRAYCy/VnQLmXOxmFl0=;
  b=PT7cVtdgCx3/dyl6W6rcNx5viP1c9SjO9VEluI/XN4t0T+VrLl8BiiWR
   R2ZQiHwvKgXTNt6bXRqBmU8aeDr7I5wZaFcxTmIceMn9lWUfvpXQ+RDKR
   vb2xsbtymhRFKxbUuK3LtQZrNzSo5Nq7Jer5UZcUPx/RLIq/RbVG5CIFc
   WSXjjAA6j+eax/hzYah7MkUyZ1DDYu6vioGbpZcXEKY2c15vWNkCaecVM
   ZyJmYKO4aznRakQIsd4oLZRrV2fmUX27apXL33YBVnc4yy5Kxf6SXsPam
   9BP/gXoSKGum1yI+dI08mgm5al8Y2htIe1F5gfp/G/bHKb7RO0X4swEnx
   Q==;
X-CSE-ConnectionGUID: 5SnOWFSiQ1Sn4ZMR4B5r2A==
X-CSE-MsgGUID: YOFe+GfFSBOKfqOKNJop7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="102185433"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="102185433"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:12:59 -0700
X-CSE-ConnectionGUID: tWF2OfT5Q0KFYVdtTgAeKA==
X-CSE-MsgGUID: v2ESRMCOSzaTCOlY1QNufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="279055524"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jul 2026 01:12:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjYG7-00000000MWr-3jPL;
	Tue, 14 Jul 2026 08:12:55 +0000
Date: Tue, 14 Jul 2026 16:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 aeac56ea2f3067a64de6f44e5054c5bccd8536d1
Message-ID: <202607141624.1rtzwydP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_011303_936397_349E9409 
X-CRM114-Status: UNSURE (   3.73  )
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
branch HEAD: aeac56ea2f3067a64de6f44e5054c5bccd8536d1  wifi: ath12k: fix MLO peer delete race

elapsed time: 806m

configs tested: 239
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              alldefconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    clang-23
arc                   randconfig-001-20260714    clang-23
arc                            randconfig-002    clang-23
arc                   randconfig-002-20260714    clang-23
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                          ixp4xx_defconfig    gcc-16.1.0
arm                            randconfig-001    clang-23
arm                   randconfig-001-20260714    clang-23
arm                            randconfig-002    clang-23
arm                   randconfig-002-20260714    clang-23
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260714    clang-23
arm                            randconfig-004    clang-23
arm                   randconfig-004-20260714    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260714    clang-17
arm64                 randconfig-001-20260714    gcc-16.1.0
arm64                 randconfig-002-20260714    clang-23
arm64                 randconfig-002-20260714    gcc-16.1.0
arm64                 randconfig-003-20260714    clang-17
arm64                 randconfig-003-20260714    gcc-16.1.0
arm64                 randconfig-004-20260714    clang-23
arm64                 randconfig-004-20260714    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260714    gcc-16.1.0
csky                  randconfig-002-20260714    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260714    clang-20
hexagon               randconfig-001-20260714    gcc-16.1.0
hexagon               randconfig-002-20260714    clang-23
hexagon               randconfig-002-20260714    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260714    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260714    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260714    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260714    clang-22
i386        buildonly-randconfig-004-20260714    gcc-14
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260714    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260714    clang-22
i386        buildonly-randconfig-006-20260714    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260714    gcc-13
i386                  randconfig-001-20260714    gcc-14
i386                  randconfig-002-20260714    gcc-13
i386                  randconfig-003-20260714    clang-22
i386                  randconfig-003-20260714    gcc-13
i386                  randconfig-004-20260714    gcc-13
i386                  randconfig-004-20260714    gcc-14
i386                  randconfig-005-20260714    gcc-13
i386                  randconfig-006-20260714    gcc-13
i386                  randconfig-006-20260714    gcc-14
i386                  randconfig-007-20260714    clang-22
i386                  randconfig-007-20260714    gcc-13
i386                  randconfig-011-20260714    clang-22
i386                  randconfig-012-20260714    clang-22
i386                  randconfig-013-20260714    clang-22
i386                  randconfig-014-20260714    clang-22
i386                  randconfig-015-20260714    clang-22
i386                  randconfig-016-20260714    clang-22
i386                  randconfig-017-20260714    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260714    gcc-16.1.0
loongarch             randconfig-002-20260714    gcc-14.3.0
loongarch             randconfig-002-20260714    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260714    gcc-11.5.0
nios2                 randconfig-001-20260714    gcc-16.1.0
nios2                 randconfig-002-20260714    gcc-11.5.0
nios2                 randconfig-002-20260714    gcc-16.1.0
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
parisc                randconfig-001-20260714    clang-17
parisc                randconfig-002-20260714    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260714    clang-17
powerpc               randconfig-002-20260714    clang-17
powerpc64             randconfig-001-20260714    clang-17
powerpc64             randconfig-002-20260714    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-001-20260714    clang-17
riscv                 randconfig-001-20260714    gcc-10.5.0
riscv                 randconfig-002-20260714    gcc-10.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260714    gcc-10.5.0
s390                  randconfig-001-20260714    gcc-8.5.0
s390                  randconfig-002-20260714    clang-23
s390                  randconfig-002-20260714    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-16.1.0
sh                    randconfig-001-20260714    gcc-10.5.0
sh                    randconfig-002-20260714    gcc-10.5.0
sh                    randconfig-002-20260714    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260714    gcc-8.5.0
sparc                 randconfig-002-20260714    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260714    gcc-8.5.0
sparc64               randconfig-002-20260714    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260714    gcc-8.5.0
um                    randconfig-002-20260714    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260714    gcc-14
x86_64      buildonly-randconfig-002-20260714    gcc-14
x86_64      buildonly-randconfig-003-20260714    gcc-14
x86_64      buildonly-randconfig-004-20260714    gcc-14
x86_64      buildonly-randconfig-005-20260714    gcc-14
x86_64      buildonly-randconfig-006-20260714    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260714    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260714    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260714    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260714    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260714    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260714    clang-22
x86_64                randconfig-011-20260714    clang-22
x86_64                randconfig-011-20260714    gcc-14
x86_64                randconfig-012-20260714    clang-22
x86_64                randconfig-013-20260714    clang-22
x86_64                randconfig-013-20260714    gcc-14
x86_64                randconfig-014-20260714    clang-22
x86_64                randconfig-015-20260714    clang-22
x86_64                randconfig-016-20260714    clang-22
x86_64                randconfig-016-20260714    gcc-14
x86_64                randconfig-071-20260714    gcc-14
x86_64                randconfig-072-20260714    gcc-14
x86_64                randconfig-073-20260714    gcc-14
x86_64                randconfig-074-20260714    gcc-14
x86_64                randconfig-075-20260714    gcc-14
x86_64                randconfig-076-20260714    gcc-14
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
xtensa                randconfig-001-20260714    gcc-8.5.0
xtensa                randconfig-002-20260714    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

