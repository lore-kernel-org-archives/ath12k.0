Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985C6CCD1BF
	for <ath12k@archiver.kernel.org>; Sat, 25 Oct 2025 16:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nYc5GfTG/jr8D5PXT2/U34FU/AvnNYmNmZPyP8WwNwQ=; b=VgggMDFJx0P5kE0yh1sevaFyeU
	rU448cj3Qxal85yU/PE0fqT7sSd0rJkafbXk/jMhxcHg7iYYadSxBCHdF/InKMB1/mBxmiSJ5gdwp
	sFH3QheI4knJUAfIXagzHYUP3TnuhdoborHyfnpL+kF0zOTpPwsYiHU2+fP8bPt8DP4PPIvwvjX9v
	mqm0FxQUtnaDJKaeW1Wh2JZZvam8/TQeN33im6I8x1WEuUxQFoJVcp+SDs7hS4fDCM79l4LHoRS/2
	YlM7MF4SNd3ijE749YQ6EpPubtK7Z1V3IxRC+a0pvnVNDjbJK4zNRmCMvOLYyenxc4y3P3WQNBofJ
	SXeejziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgir-0000000BPt4-1ZGs;
	Sat, 25 Oct 2025 16:02:29 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgio-0000000BPsP-3Ylh
	for ath12k@lists.infradead.org;
	Sat, 25 Oct 2025 16:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761408147; x=1792944147;
  h=date:from:to:cc:subject:message-id;
  bh=klUIiWsLV5IwS9Dt2XkH+eInBqD4vN871dbXYmUO9Pk=;
  b=ldEkXdQB9a2JAF9wNLJA7Iz0QDjYJut04xynPywQCA3rP9lEWquLRlpw
   Qw78GI2JtHSxsv3kwQV/WOgb+f5NpiZ7GwGQuTSb7NrISwCZfDWIAKdxb
   MORIMtJYZxCWfAb57cj+WuQrX14DTPifR66uMwXQJNmq22YqgxOm6+a9x
   f8RIZ+SC7ISR5PDzcDygalt0z9/W/2IOjRgOa05Reu3qGsGJoMr+Ygc2M
   JELvlx1CB2qTjcoirL1lp0+jhmdHOu7/gSrr+WCff5kB51uoy9WpDFK29
   gFRWMJAQVmcVevhpbbLm8uYK669htAAa9xLn7v2hcFttYkYEd8z8F1/7G
   w==;
X-CSE-ConnectionGUID: WGXwtFc4RaqGSZpBjzY76w==
X-CSE-MsgGUID: JG2aGvSeRYGe2dW1BVJZOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63707604"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63707604"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 09:02:26 -0700
X-CSE-ConnectionGUID: o8XWutm8Q6mYfdAytFN9QQ==
X-CSE-MsgGUID: roYVu7GiQ+CALauDrNXFpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184568924"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Oct 2025 09:02:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCgil-000FPF-0h;
	Sat, 25 Oct 2025 16:02:23 +0000
Date: Sun, 26 Oct 2025 00:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 8fee7b3dbad96e03d3dc8b6bccda37d6ae5bfd13
Message-ID: <202510260008.zoHEVLYr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_090226_963170_E0C72300 
X-CRM114-Status: UNSURE (   3.67  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: 8fee7b3dbad96e03d3dc8b6bccda37d6ae5bfd13  spi: amlogic: fix spifc build error

elapsed time: 1447m

configs tested: 216
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251025    clang-22
arc                   randconfig-001-20251025    gcc-10.5.0
arc                   randconfig-002-20251025    clang-22
arc                   randconfig-002-20251025    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            hisi_defconfig    clang-22
arm                   randconfig-001-20251025    clang-22
arm                   randconfig-002-20251025    clang-22
arm                   randconfig-002-20251025    gcc-10.5.0
arm                   randconfig-003-20251025    clang-22
arm                   randconfig-004-20251025    clang-22
arm                           sama7_defconfig    clang-22
arm                        spear6xx_defconfig    clang-22
arm                           u8500_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251025    clang-22
arm64                 randconfig-001-20251025    gcc-14.3.0
arm64                 randconfig-002-20251025    clang-22
arm64                 randconfig-002-20251025    gcc-11.5.0
arm64                 randconfig-003-20251025    clang-22
arm64                 randconfig-003-20251025    gcc-9.5.0
arm64                 randconfig-004-20251025    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251025    gcc-10.5.0
csky                  randconfig-001-20251025    gcc-11.5.0
csky                  randconfig-002-20251025    gcc-10.5.0
csky                  randconfig-002-20251025    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251025    clang-18
hexagon               randconfig-001-20251025    gcc-10.5.0
hexagon               randconfig-002-20251025    clang-20
hexagon               randconfig-002-20251025    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251025    clang-20
i386        buildonly-randconfig-001-20251025    gcc-14
i386        buildonly-randconfig-002-20251025    clang-20
i386        buildonly-randconfig-002-20251025    gcc-14
i386        buildonly-randconfig-003-20251025    clang-20
i386        buildonly-randconfig-004-20251025    clang-20
i386        buildonly-randconfig-005-20251025    clang-20
i386        buildonly-randconfig-006-20251025    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251025    clang-20
i386                  randconfig-002-20251025    clang-20
i386                  randconfig-003-20251025    clang-20
i386                  randconfig-004-20251025    clang-20
i386                  randconfig-005-20251025    clang-20
i386                  randconfig-006-20251025    clang-20
i386                  randconfig-007-20251025    clang-20
i386                  randconfig-011-20251025    gcc-14
i386                  randconfig-012-20251025    gcc-14
i386                  randconfig-013-20251025    gcc-14
i386                  randconfig-014-20251025    gcc-14
i386                  randconfig-015-20251025    gcc-14
i386                  randconfig-016-20251025    gcc-14
i386                  randconfig-017-20251025    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251025    clang-22
loongarch             randconfig-001-20251025    gcc-10.5.0
loongarch             randconfig-002-20251025    clang-18
loongarch             randconfig-002-20251025    gcc-10.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251025    gcc-10.5.0
nios2                 randconfig-001-20251025    gcc-11.5.0
nios2                 randconfig-002-20251025    gcc-10.5.0
nios2                 randconfig-002-20251025    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251025    gcc-10.5.0
parisc                randconfig-001-20251025    gcc-14.3.0
parisc                randconfig-002-20251025    gcc-10.5.0
parisc                randconfig-002-20251025    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       ebony_defconfig    clang-22
powerpc               randconfig-001-20251025    gcc-10.5.0
powerpc               randconfig-001-20251025    gcc-11.5.0
powerpc               randconfig-002-20251025    clang-16
powerpc               randconfig-002-20251025    gcc-10.5.0
powerpc               randconfig-003-20251025    clang-22
powerpc               randconfig-003-20251025    gcc-10.5.0
powerpc64             randconfig-001-20251025    clang-17
powerpc64             randconfig-001-20251025    gcc-10.5.0
powerpc64             randconfig-002-20251025    clang-16
powerpc64             randconfig-002-20251025    gcc-10.5.0
powerpc64             randconfig-003-20251025    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251025    clang-22
riscv                 randconfig-002-20251025    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251025    gcc-11.5.0
s390                  randconfig-002-20251025    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251025    gcc-11.5.0
sh                    randconfig-002-20251025    gcc-15.1.0
sh                   sh7724_generic_defconfig    clang-22
sh                            titan_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251025    gcc-11.5.0
sparc                 randconfig-002-20251025    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251025    clang-22
sparc64               randconfig-002-20251025    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251025    clang-22
um                    randconfig-002-20251025    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251025    clang-20
x86_64      buildonly-randconfig-001-20251025    gcc-14
x86_64      buildonly-randconfig-002-20251025    clang-20
x86_64      buildonly-randconfig-002-20251025    gcc-14
x86_64      buildonly-randconfig-003-20251025    clang-20
x86_64      buildonly-randconfig-003-20251025    gcc-14
x86_64      buildonly-randconfig-004-20251025    clang-20
x86_64      buildonly-randconfig-005-20251025    clang-20
x86_64      buildonly-randconfig-006-20251025    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251025    clang-20
x86_64                randconfig-002-20251025    clang-20
x86_64                randconfig-003-20251025    clang-20
x86_64                randconfig-004-20251025    clang-20
x86_64                randconfig-005-20251025    clang-20
x86_64                randconfig-006-20251025    clang-20
x86_64                randconfig-007-20251025    clang-20
x86_64                randconfig-008-20251025    clang-20
x86_64                randconfig-071-20251025    clang-20
x86_64                randconfig-072-20251025    clang-20
x86_64                randconfig-073-20251025    clang-20
x86_64                randconfig-074-20251025    clang-20
x86_64                randconfig-075-20251025    clang-20
x86_64                randconfig-076-20251025    clang-20
x86_64                randconfig-077-20251025    clang-20
x86_64                randconfig-078-20251025    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251025    gcc-15.1.0
xtensa                randconfig-002-20251025    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

