Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBA6C02193
	for <ath12k@archiver.kernel.org>; Wed,  5 Feb 2025 02:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K1aBstj5fgoFMizWs3vu/lQErU5soeQFo9e168WvVIk=; b=VK7KZgbwFTf2sJr/IoLz5TEhQQ
	Ybp2Nlh271v2AQyrY1QcW9ANc9IYZ1m4Wu4HUtsQNAhHM27mp9AMpjs3i4MkPDReWv2uXRgcPycqQ
	ghx28N5JoAKXWuj4GtlvVEe4F8ADUradjkJi8P+rK0LgzzfoH6ujtgBABejub7HAJ/gb4oRmJkFsP
	QQ6xjE8Gld1N69gTjcQTPmFxMksrGBzHl+hrVZ6GDU+8pi5Y/bwUggfqk5o8q+M0sVZD9vKjy9eBm
	THpu+6gDimEhQWG4cAfIfdr/zQLLz0swuoSnnOOOBpXfTDWIW4XnjlFVSO/iB9QoovY5WmwGqKxUa
	qcjR2I0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVAY-000000028GQ-2E6q
	for ath12k@archiver.kernel.org;
	Wed, 05 Feb 2025 02:29:38 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVAV-000000028G2-0xrq
	for ath12k@lists.infradead.org;
	Wed, 05 Feb 2025 02:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738722575; x=1770258575;
  h=date:from:to:cc:subject:message-id;
  bh=8aVwcpPifeBggesO7jPd70bMA9Ij2QYpkeFkZcPCXmo=;
  b=Bt6AspLIVgY7LwhCx1IFeU0nyfOm3i7FQLF3MGe7eiEmGZAzweopHSCF
   oUkDHBZo/LZ1Axj5HMxaapXkAIKK55lJI/LE27/+MEOO7vwMR4KZYi34A
   qv/dbua4jcCqS/90O1GSujJ8cN/eDZcFjVdf+MmqqGG7slllaA3pNhoOj
   vZn4lgbFoxioBJZYUYPqZq1+onebZ6L2ic8MEbhRzsGZm+GsW12noP5oZ
   teXPVII4iwMUhVaRdoPzOEI90C2Oux6lAlvDiPm+t2nWlWKsX2h+CR/GB
   XlGKDgo7tqdeMHCpXhnQwmlBoziYj1RJdHKhcZMQ30ytNlCEfxUlbK/4/
   Q==;
X-CSE-ConnectionGUID: G8bJLux7R4a7cXonVdWFfQ==
X-CSE-MsgGUID: ovLbUmdLTYydPY4L8jGM7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39161240"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="39161240"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 18:29:32 -0800
X-CSE-ConnectionGUID: KJdiH5bcTyGsS6owyqIPxg==
X-CSE-MsgGUID: MwLaJbkmRNWkeBwTWzKU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111646780"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 18:29:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfVAO-000tKZ-2U;
	Wed, 05 Feb 2025 02:29:28 +0000
Date: Wed, 05 Feb 2025 10:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 f5c90ff80b4c0326e5fd1feecafd88718075b1b7
Message-ID: <202502051021.iIVOg7s1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_182935_332973_67C12E9C 
X-CRM114-Status: UNSURE (   3.52  )
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
branch HEAD: f5c90ff80b4c0326e5fd1feecafd88718075b1b7  wifi: ath12k: Add Support to Calculate and Display TPC Values

elapsed time: 1450m

configs tested: 256
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250204    gcc-13.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-002-20250204    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                                 defconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                   randconfig-001-20250204    clang-21
arm                   randconfig-001-20250205    gcc-13.2.0
arm                   randconfig-002-20250204    clang-17
arm                   randconfig-002-20250205    gcc-13.2.0
arm                   randconfig-003-20250204    clang-19
arm                   randconfig-003-20250205    gcc-13.2.0
arm                   randconfig-004-20250204    clang-21
arm                   randconfig-004-20250205    gcc-13.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250204    clang-21
arm64                 randconfig-001-20250205    gcc-13.2.0
arm64                 randconfig-002-20250204    clang-21
arm64                 randconfig-002-20250205    gcc-13.2.0
arm64                 randconfig-003-20250204    clang-17
arm64                 randconfig-003-20250205    gcc-13.2.0
arm64                 randconfig-004-20250204    clang-21
arm64                 randconfig-004-20250205    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-001-20250205    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
csky                  randconfig-002-20250205    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250204    clang-21
hexagon               randconfig-001-20250204    gcc-14.2.0
hexagon               randconfig-001-20250205    gcc-14.2.0
hexagon               randconfig-002-20250204    clang-21
hexagon               randconfig-002-20250204    gcc-14.2.0
hexagon               randconfig-002-20250205    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-001-20250205    gcc-12
i386        buildonly-randconfig-002-20250204    clang-19
i386        buildonly-randconfig-002-20250205    gcc-12
i386        buildonly-randconfig-003-20250204    clang-19
i386        buildonly-randconfig-003-20250205    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-004-20250205    gcc-12
i386        buildonly-randconfig-005-20250204    clang-19
i386        buildonly-randconfig-005-20250205    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386        buildonly-randconfig-006-20250205    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250205    gcc-12
i386                  randconfig-002-20250205    gcc-12
i386                  randconfig-003-20250205    gcc-12
i386                  randconfig-004-20250205    gcc-12
i386                  randconfig-005-20250205    gcc-12
i386                  randconfig-006-20250205    gcc-12
i386                  randconfig-007-20250205    gcc-12
i386                  randconfig-011-20250205    clang-19
i386                  randconfig-012-20250205    clang-19
i386                  randconfig-013-20250205    clang-19
i386                  randconfig-014-20250205    clang-19
i386                  randconfig-015-20250205    clang-19
i386                  randconfig-016-20250205    clang-19
i386                  randconfig-017-20250205    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-001-20250205    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
loongarch             randconfig-002-20250205    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.1.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    gcc-14.1.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-001-20250205    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
nios2                 randconfig-002-20250205    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-001-20250205    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
parisc                randconfig-002-20250205    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.1.0
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-001-20250205    gcc-14.2.0
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-003-20250204    clang-21
powerpc               randconfig-003-20250204    gcc-14.2.0
powerpc               randconfig-003-20250205    gcc-14.2.0
powerpc                     taishan_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250204    gcc-14.2.0
powerpc64             randconfig-001-20250205    gcc-14.2.0
powerpc64             randconfig-002-20250204    clang-19
powerpc64             randconfig-002-20250204    gcc-14.2.0
powerpc64             randconfig-002-20250205    gcc-14.2.0
powerpc64             randconfig-003-20250204    gcc-14.2.0
powerpc64             randconfig-003-20250205    gcc-14.2.0
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250204    gcc-14.2.0
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-002-20250204    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250204    gcc-14.2.0
s390                  randconfig-001-20250205    gcc-14.2.0
s390                  randconfig-002-20250204    gcc-14.2.0
s390                  randconfig-002-20250205    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250204    gcc-14.2.0
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-002-20250204    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250204    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-002-20250204    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250204    gcc-14.2.0
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-002-20250204    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250204    clang-21
um                    randconfig-001-20250204    gcc-14.2.0
um                    randconfig-001-20250205    gcc-14.2.0
um                    randconfig-002-20250204    gcc-12
um                    randconfig-002-20250204    gcc-14.2.0
um                    randconfig-002-20250205    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-001-20250205    clang-19
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-002-20250205    clang-19
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-003-20250205    clang-19
x86_64      buildonly-randconfig-004-20250204    gcc-11
x86_64      buildonly-randconfig-004-20250205    clang-19
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-005-20250205    clang-19
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64      buildonly-randconfig-006-20250205    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250204    clang-19
x86_64                randconfig-002-20250204    clang-19
x86_64                randconfig-003-20250204    clang-19
x86_64                randconfig-004-20250204    clang-19
x86_64                randconfig-005-20250204    clang-19
x86_64                randconfig-006-20250204    clang-19
x86_64                randconfig-007-20250204    clang-19
x86_64                randconfig-008-20250204    clang-19
x86_64                randconfig-071-20250205    gcc-12
x86_64                randconfig-072-20250205    gcc-12
x86_64                randconfig-073-20250205    gcc-12
x86_64                randconfig-074-20250205    gcc-12
x86_64                randconfig-075-20250205    gcc-12
x86_64                randconfig-076-20250205    gcc-12
x86_64                randconfig-077-20250205    gcc-12
x86_64                randconfig-078-20250205    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250204    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-002-20250204    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

