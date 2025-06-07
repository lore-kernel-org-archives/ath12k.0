Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45449C5B543
	for <ath12k@archiver.kernel.org>; Sat,  7 Jun 2025 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2kWHMqnz0tICY2ZD+cRZN8nO7v0LCc0heuBl4w1FkAY=; b=ilRzGi76ZKILBiOHnFW0N0+Vbw
	FY63TgG7+cdOp7mYnINwVF5p/5IxuduummL24jhKN6OFuJN/XuZASEvkgacIsN2Ub24rPgh0rOsE/
	tbpiARvRy8WxdBwc+eLhOa3d7QVopfnudZ/lq0QFDmFrYQmFifmRDnmQlyCPFsKWjVtihfXodtNLD
	8h2nOxBFQTaP9lmY35TChtsJkiMbNQi5BtPez8SDUY98MHDlmzJAr6d6S1yFQIFj4mNZhWi1arPaq
	mWUzYMV13XIH83MmkY7d+CiI+jGm+TQ/MYcQuTYK5R5LCg/fyrKJFmwHfoK7Kk+I+vycIOp6khZ6o
	SEueLimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNs82-00000001df0-04Z2;
	Sat, 07 Jun 2025 11:54:26 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNs6V-00000001dTn-00J1
	for ath12k@lists.infradead.org;
	Sat, 07 Jun 2025 11:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749297171; x=1780833171;
  h=date:from:to:cc:subject:message-id;
  bh=VdaltdbHpGQeyoz+76w5kWWRmUZYynyqeZv1dJ4ZNi4=;
  b=idaVRuBhzgkihRE0J8ndWnlDo3VAhwj3KaVACnHbWI+P7yt51C+CtVrR
   1iJwHnQ6eO4RvnOwaEb2GtdEDEJ0Oa0Rgx23e9j4GjKZyZSa/dbJRWR+i
   M60xNxGMCJo6R2krY0ZWs1L4yWoGVJuYZz2fe9tSIAkBh2qZc6DC+UQ2o
   SV4VKxzqzyDi0zpCZAbx0xktFFFpNn8KXCYVryPn8qFp/KzBKQGd4s2nY
   KPOogXUdZHNHjVlTo39jDMy2AGH9zzd3T2WcSy6wwvVarvHReRNZrMTXK
   jKgxYsXCV0X8zS+heUAnXM1SQUKeViI0B7S5Yv79jGseMHqoS3oTNSo8C
   g==;
X-CSE-ConnectionGUID: rINZpdX5SPmAP7lXF7R55A==
X-CSE-MsgGUID: IQ1bzkUnRoG0f47fT9GHTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="61703006"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="61703006"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 04:52:46 -0700
X-CSE-ConnectionGUID: qcZI6uOLSRafBApilkcIHA==
X-CSE-MsgGUID: V0VzpwaRSFOFULbgZIglHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="177004213"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jun 2025 04:52:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNs6M-0005lZ-0R;
	Sat, 07 Jun 2025 11:52:42 +0000
Date: Sat, 07 Jun 2025 19:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 65c6c598b488a861afd4371a8010777521048996
Message-ID: <202506071914.yxZmDwQF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_045251_128790_7F1DED3F 
X-CRM114-Status: UNSURE (   3.77  )
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
branch HEAD: 65c6c598b488a861afd4371a8010777521048996  wifi: ath12k: fix uaf in ath12k_core_init()

elapsed time: 858m

configs tested: 242
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250607    clang-21
arc                   randconfig-001-20250607    gcc-15.1.0
arc                   randconfig-002-20250607    clang-21
arc                   randconfig-002-20250607    gcc-15.1.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                       imx_v4_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250607    clang-21
arm                   randconfig-002-20250607    clang-21
arm                   randconfig-002-20250607    gcc-13.3.0
arm                   randconfig-003-20250607    clang-21
arm                   randconfig-003-20250607    gcc-15.1.0
arm                   randconfig-004-20250607    clang-21
arm                   randconfig-004-20250607    gcc-14.3.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250607    clang-21
arm64                 randconfig-002-20250607    clang-21
arm64                 randconfig-003-20250607    clang-21
arm64                 randconfig-004-20250607    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250607    clang-21
csky                  randconfig-001-20250607    gcc-12.4.0
csky                  randconfig-002-20250607    clang-21
csky                  randconfig-002-20250607    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250607    clang-21
hexagon               randconfig-002-20250607    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250607    clang-20
i386        buildonly-randconfig-002-20250607    gcc-12
i386        buildonly-randconfig-003-20250607    gcc-12
i386        buildonly-randconfig-004-20250607    gcc-12
i386        buildonly-randconfig-005-20250607    clang-20
i386        buildonly-randconfig-006-20250607    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250607    gcc-12
i386                  randconfig-002-20250607    gcc-12
i386                  randconfig-003-20250607    gcc-12
i386                  randconfig-004-20250607    gcc-12
i386                  randconfig-005-20250607    gcc-12
i386                  randconfig-006-20250607    gcc-12
i386                  randconfig-007-20250607    gcc-12
i386                  randconfig-011-20250607    gcc-12
i386                  randconfig-012-20250607    gcc-12
i386                  randconfig-013-20250607    gcc-12
i386                  randconfig-014-20250607    gcc-12
i386                  randconfig-015-20250607    gcc-12
i386                  randconfig-016-20250607    gcc-12
i386                  randconfig-017-20250607    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250607    clang-21
loongarch             randconfig-001-20250607    gcc-13.3.0
loongarch             randconfig-002-20250607    clang-21
loongarch             randconfig-002-20250607    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                  decstation_64_defconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-21
mips                           ip30_defconfig    gcc-15.1.0
mips                           jazz_defconfig    gcc-15.1.0
mips                       lemote2f_defconfig    gcc-15.1.0
mips                      maltasmvp_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    gcc-15.1.0
mips                           rs90_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-21
mips                           xway_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250607    clang-21
nios2                 randconfig-001-20250607    gcc-10.5.0
nios2                 randconfig-002-20250607    clang-21
nios2                 randconfig-002-20250607    gcc-5.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250607    clang-21
parisc                randconfig-001-20250607    gcc-12.4.0
parisc                randconfig-002-20250607    clang-21
parisc                randconfig-002-20250607    gcc-12.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       holly_defconfig    clang-21
powerpc                   lite5200b_defconfig    clang-21
powerpc               randconfig-001-20250607    clang-21
powerpc               randconfig-001-20250607    gcc-10.5.0
powerpc               randconfig-002-20250607    clang-21
powerpc               randconfig-003-20250607    clang-21
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250607    clang-19
powerpc64             randconfig-001-20250607    clang-21
powerpc64             randconfig-002-20250607    clang-21
powerpc64             randconfig-003-20250607    clang-21
powerpc64             randconfig-003-20250607    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250607    clang-21
riscv                 randconfig-001-20250607    gcc-12
riscv                 randconfig-002-20250607    clang-16
riscv                 randconfig-002-20250607    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250607    clang-16
s390                  randconfig-001-20250607    gcc-12
s390                  randconfig-002-20250607    gcc-12
s390                  randconfig-002-20250607    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250607    gcc-12
sh                    randconfig-001-20250607    gcc-14.3.0
sh                    randconfig-002-20250607    gcc-12
sh                    randconfig-002-20250607    gcc-9.3.0
sh                          rsk7264_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250607    gcc-10.3.0
sparc                 randconfig-001-20250607    gcc-12
sparc                 randconfig-002-20250607    gcc-12
sparc                 randconfig-002-20250607    gcc-12.4.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250607    gcc-12
sparc64               randconfig-001-20250607    gcc-9.3.0
sparc64               randconfig-002-20250607    gcc-12
sparc64               randconfig-002-20250607    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250607    clang-21
um                    randconfig-001-20250607    gcc-12
um                    randconfig-002-20250607    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250607    clang-20
x86_64      buildonly-randconfig-002-20250607    clang-20
x86_64      buildonly-randconfig-003-20250607    clang-20
x86_64      buildonly-randconfig-004-20250607    gcc-12
x86_64      buildonly-randconfig-005-20250607    gcc-12
x86_64      buildonly-randconfig-006-20250607    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250607    clang-20
x86_64                randconfig-002-20250607    clang-20
x86_64                randconfig-003-20250607    clang-20
x86_64                randconfig-004-20250607    clang-20
x86_64                randconfig-005-20250607    clang-20
x86_64                randconfig-006-20250607    clang-20
x86_64                randconfig-007-20250607    clang-20
x86_64                randconfig-008-20250607    clang-20
x86_64                randconfig-071-20250607    clang-20
x86_64                randconfig-072-20250607    clang-20
x86_64                randconfig-073-20250607    clang-20
x86_64                randconfig-074-20250607    clang-20
x86_64                randconfig-075-20250607    clang-20
x86_64                randconfig-076-20250607    clang-20
x86_64                randconfig-077-20250607    clang-20
x86_64                randconfig-078-20250607    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250607    gcc-10.5.0
xtensa                randconfig-001-20250607    gcc-12
xtensa                randconfig-002-20250607    gcc-12
xtensa                randconfig-002-20250607    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

