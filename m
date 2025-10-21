Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E05CCD1AA
	for <ath12k@archiver.kernel.org>; Tue, 21 Oct 2025 20:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YqMPfhHT2NRVz0u7aj69meP7wNmsT9Fy6Balc2qg1o8=; b=jdACKjZ7qTsnS5JHYm9UbT5HRA
	SwtGQ7AwoUW/H2X9gSYPTAjc6OoKxVTEj5voU4bhV5Jx0xYADBO6HtJMPBeqAbKp/rvP4bGBupwID
	no7LXpDkVXtemvDxhYp/jrtM+8RpZeJR63Cn4QEogvvdzOGSb+ufkKsMgl1pC6W/AriEi0FFKtL4N
	kZq61MXCzuPzz4gQtYUkZ5KrPIpNvYSBZ2rc8WsZV8G3If016ifRNIW18wwZBkRpXSR214nj15tGI
	Bdg1B8nvZrv0E61IOFSLS/irfcO+Oz7MTBLHaNp6xiKZo3RYIxBRYk+mVcxPxZI4ZoFPMVMMo9iua
	53oQjLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJGm-00000000cpk-0qNs;
	Tue, 21 Oct 2025 20:47:48 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJGj-00000000cpN-1ISP
	for ath12k@lists.infradead.org;
	Tue, 21 Oct 2025 20:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761079665; x=1792615665;
  h=date:from:to:cc:subject:message-id;
  bh=U8bnaIfnzFRbthyKseu149ZmpoIu71qNz75OVDMGUaw=;
  b=dDI9sk6zsR3dYMcyqdfrUx5LlUPxX6DQDNkfgPsq4ZJ7I9qk0w4ZnYAb
   r3LxrDZJxBygbWSAcVy9cY+KtgXoCBOzozLx4uVmZVYDKGgpG5V16+Hgs
   rcU7MHXlqBAjZOvXgS/bmr0p66KCONzRpPXaotz/+viC+XUq5hEckoGYV
   GFaZWp+1jRBlJcJiEaTFx2WDgCznNmTr46At7xGe+hkLBAdz2G/phNPPv
   1sR56r3jtKG3OHSi/Lt4QyyUrXs+n68LbfpuwfIIZ/MmbOd1jIP7jtMZX
   s8uyIvgAKUBWoYSA5pzD4hai93UdIiGL04flAtlPKP2wFwQSXWvp9Jt2m
   Q==;
X-CSE-ConnectionGUID: 9lx4p/s5QIaEW1AqoxPBcg==
X-CSE-MsgGUID: 8BNBERnTSFyXoqwAafMRFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74655393"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="74655393"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 13:47:45 -0700
X-CSE-ConnectionGUID: cUUbejBRQgiY7FNlqIZbaQ==
X-CSE-MsgGUID: xuedqiFKR7iAvggpctg2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="220867264"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2025 13:47:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBJGf-000Bjh-0y;
	Tue, 21 Oct 2025 20:47:41 +0000
Date: Wed, 22 Oct 2025 04:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 cfa945b31b79b17872b060f66e9406fa3b32c87c
Message-ID: <202510220408.7wGrINy5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_134745_390304_D0C63E98 
X-CRM114-Status: UNSURE (   4.28  )
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
branch HEAD: cfa945b31b79b17872b060f66e9406fa3b32c87c  wifi: ath10k: Support for FTM TLV test commands

elapsed time: 1455m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251021    gcc-8.5.0
arc                   randconfig-002-20251021    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                         bcm2835_defconfig    clang-22
arm                   randconfig-001-20251021    clang-22
arm                   randconfig-002-20251021    clang-22
arm                   randconfig-003-20251021    clang-22
arm                   randconfig-004-20251021    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251021    gcc-15.1.0
arm64                 randconfig-002-20251021    clang-22
arm64                 randconfig-003-20251021    gcc-12.5.0
arm64                 randconfig-004-20251021    clang-18
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251021    gcc-15.1.0
csky                  randconfig-002-20251021    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251021    clang-22
hexagon               randconfig-002-20251021    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251021    clang-20
i386        buildonly-randconfig-002-20251021    clang-20
i386        buildonly-randconfig-003-20251021    clang-20
i386        buildonly-randconfig-004-20251021    gcc-14
i386        buildonly-randconfig-005-20251021    gcc-14
i386        buildonly-randconfig-006-20251021    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251021    clang-22
loongarch             randconfig-002-20251021    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251021    gcc-10.5.0
nios2                 randconfig-002-20251021    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251021    gcc-8.5.0
parisc                randconfig-002-20251021    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    clang-22
powerpc                       ppc64_defconfig    clang-22
powerpc               randconfig-001-20251021    clang-22
powerpc               randconfig-002-20251021    clang-19
powerpc               randconfig-003-20251021    clang-22
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251021    clang-22
powerpc64             randconfig-002-20251021    gcc-12.5.0
powerpc64             randconfig-003-20251021    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251021    gcc-8.5.0
riscv                 randconfig-002-20251021    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251021    clang-22
s390                  randconfig-002-20251021    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251021    gcc-9.5.0
sh                    randconfig-002-20251021    gcc-10.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251021    gcc-8.5.0
sparc                 randconfig-002-20251021    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251021    gcc-8.5.0
sparc64               randconfig-002-20251021    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251021    gcc-14
um                    randconfig-002-20251021    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251021    gcc-13
x86_64      buildonly-randconfig-002-20251021    clang-20
x86_64      buildonly-randconfig-003-20251021    clang-20
x86_64      buildonly-randconfig-004-20251021    clang-20
x86_64      buildonly-randconfig-005-20251021    gcc-14
x86_64      buildonly-randconfig-006-20251021    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251021    gcc-8.5.0
xtensa                randconfig-002-20251021    gcc-13.4.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

