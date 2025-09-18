Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FB9CA1013
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 20:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xVpyiBBHeCSM0N3Ry1ngp8EwCGBalfSHGcGknLmESto=; b=yWvVAoh9z+ghnF3HN7jbvSueoS
	YBeooRU4aJtsXtlPw7y9vdyDhxszJvMEwRvb6O1AcJs4KaJVVEN7xHAcfaQ9Xpq2fXBPyvYkvdXli
	wGM6i9mCp9UnEEQZY094d2gkw9ajDpMhMml/I+Hm5TrJhv3+1R4/05v0kGaFdfB8KPdUoDfZftjF2
	03KbP/IDccyWBgUkILMWfx+KS4keWD692OvJaDzq6WuZjC10X5FlkZKaiFrLuETmzDkXL2dXrng4t
	ue79QWavlQ0WXWk6BZpCkxsL8LZCypmhnTCyEv1d74UvJfZIXxP0IwBW6schnBV1lf+pbI9+l+7M6
	nywFjpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKy2-000000014Vh-1xCO;
	Thu, 18 Sep 2025 20:10:58 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKy0-000000014Uv-00dl
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 20:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758226256; x=1789762256;
  h=date:from:to:cc:subject:message-id;
  bh=2cTciA63ZtIExlZN+J+kEzV6uDE16Gp9jcRIDrMh0+g=;
  b=BuUC9YbeBbW6bISWYebda4RK6ZxJowH3Mzj6ywHXK+phK491YZg71LYi
   /fKpMmVsVgqQfa4nEe//y5X1Tl+slhDeCUwwI9gSliZuwp6YRgeig8ZHR
   E2wFfLjPq2gXoAGYF/tJM6MXTO7NoAD2/o/m0T2tA33QttkpgOnLy0oha
   IBwluyocaZj9GlQp2A4ACAgO4VRW89BYNiM2IhoPORfE8bXjWbu2nPTVR
   OePjZRwI5vMNwjwoVLPiAgnISwftLbwPeWMLY5xM3RJfGsYyRzcpXZfij
   155oZxRK5sPM4DmyirmbEBPpbHiT01IA2qzfIJi307uJ5Lbj54OTCsjIS
   A==;
X-CSE-ConnectionGUID: 32GZ859pQbyynXVL8kZwAw==
X-CSE-MsgGUID: un5Dn1b3RN+97R+E2vHqbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="59791009"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="59791009"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 13:10:55 -0700
X-CSE-ConnectionGUID: 8r0eGCdbR8+Os7XFB/OFZw==
X-CSE-MsgGUID: 90otOHh5QgqkNnDk/l9ldw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="179919474"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 13:10:54 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzKxv-0003gl-20;
	Thu, 18 Sep 2025 20:10:51 +0000
Date: Fri, 19 Sep 2025 04:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 e6b964c13071c05690395a0ee0d373ae7f00abcc
Message-ID: <202509190435.issHYCN6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_131056_088997_E8803031 
X-CRM114-Status: UNSURE (   4.06  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: e6b964c13071c05690395a0ee0d373ae7f00abcc  Merge branch 'pending' into main-pending

elapsed time: 1308m

configs tested: 285
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs101_defconfig    clang-22
arc                                 defconfig    clang-19
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250918    clang-22
arc                   randconfig-001-20250918    gcc-8.5.0
arc                   randconfig-001-20250919    gcc-11.5.0
arc                   randconfig-002-20250918    clang-22
arc                   randconfig-002-20250918    gcc-8.5.0
arc                   randconfig-002-20250919    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   milbeaut_m10v_defconfig    clang-22
arm                       netwinder_defconfig    clang-22
arm                   randconfig-001-20250918    clang-22
arm                   randconfig-001-20250919    gcc-11.5.0
arm                   randconfig-002-20250918    clang-22
arm                   randconfig-002-20250918    gcc-8.5.0
arm                   randconfig-002-20250919    gcc-11.5.0
arm                   randconfig-003-20250918    clang-22
arm                   randconfig-003-20250919    gcc-11.5.0
arm                   randconfig-004-20250918    clang-22
arm                   randconfig-004-20250918    gcc-11.5.0
arm                   randconfig-004-20250919    gcc-11.5.0
arm                         s5pv210_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250918    clang-22
arm64                 randconfig-001-20250919    gcc-11.5.0
arm64                 randconfig-002-20250918    clang-22
arm64                 randconfig-002-20250918    gcc-11.5.0
arm64                 randconfig-002-20250919    gcc-11.5.0
arm64                 randconfig-003-20250918    clang-22
arm64                 randconfig-003-20250919    gcc-11.5.0
arm64                 randconfig-004-20250918    clang-22
arm64                 randconfig-004-20250919    gcc-11.5.0
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250918    clang-22
csky                  randconfig-001-20250918    gcc-15.1.0
csky                  randconfig-001-20250919    clang-22
csky                  randconfig-002-20250918    clang-22
csky                  randconfig-002-20250918    gcc-15.1.0
csky                  randconfig-002-20250919    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250918    clang-22
hexagon               randconfig-001-20250919    clang-22
hexagon               randconfig-002-20250918    clang-22
hexagon               randconfig-002-20250919    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250918    clang-20
i386        buildonly-randconfig-001-20250918    gcc-14
i386        buildonly-randconfig-001-20250919    gcc-14
i386        buildonly-randconfig-002-20250918    gcc-14
i386        buildonly-randconfig-002-20250919    gcc-14
i386        buildonly-randconfig-003-20250918    gcc-14
i386        buildonly-randconfig-003-20250919    gcc-14
i386        buildonly-randconfig-004-20250918    clang-20
i386        buildonly-randconfig-004-20250918    gcc-14
i386        buildonly-randconfig-004-20250919    gcc-14
i386        buildonly-randconfig-005-20250918    gcc-14
i386        buildonly-randconfig-005-20250919    gcc-14
i386        buildonly-randconfig-006-20250918    clang-20
i386        buildonly-randconfig-006-20250918    gcc-14
i386        buildonly-randconfig-006-20250919    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20250918    gcc-14
i386                  randconfig-001-20250919    gcc-14
i386                  randconfig-002-20250918    gcc-14
i386                  randconfig-002-20250919    gcc-14
i386                  randconfig-003-20250918    gcc-14
i386                  randconfig-003-20250919    gcc-14
i386                  randconfig-004-20250918    gcc-14
i386                  randconfig-004-20250919    gcc-14
i386                  randconfig-005-20250918    gcc-14
i386                  randconfig-005-20250919    gcc-14
i386                  randconfig-006-20250918    gcc-14
i386                  randconfig-006-20250919    gcc-14
i386                  randconfig-007-20250918    gcc-14
i386                  randconfig-007-20250919    gcc-14
i386                  randconfig-011-20250918    gcc-14
i386                  randconfig-011-20250919    clang-20
i386                  randconfig-012-20250918    gcc-14
i386                  randconfig-012-20250919    clang-20
i386                  randconfig-013-20250918    gcc-14
i386                  randconfig-013-20250919    clang-20
i386                  randconfig-014-20250918    gcc-14
i386                  randconfig-014-20250919    clang-20
i386                  randconfig-015-20250918    gcc-14
i386                  randconfig-015-20250919    clang-20
i386                  randconfig-016-20250918    gcc-14
i386                  randconfig-016-20250919    clang-20
i386                  randconfig-017-20250918    gcc-14
i386                  randconfig-017-20250919    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250918    clang-18
loongarch             randconfig-001-20250918    clang-22
loongarch             randconfig-001-20250919    clang-22
loongarch             randconfig-002-20250918    clang-18
loongarch             randconfig-002-20250918    clang-22
loongarch             randconfig-002-20250919    clang-22
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                         amcore_defconfig    clang-22
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    gcc-15.1.0
mips                        maltaup_defconfig    clang-22
mips                           mtx1_defconfig    clang-22
mips                         rt305x_defconfig    clang-22
nios2                         3c120_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250918    clang-22
nios2                 randconfig-001-20250918    gcc-10.5.0
nios2                 randconfig-001-20250919    clang-22
nios2                 randconfig-002-20250918    clang-22
nios2                 randconfig-002-20250918    gcc-8.5.0
nios2                 randconfig-002-20250919    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250918    clang-22
parisc                randconfig-001-20250918    gcc-12.5.0
parisc                randconfig-001-20250919    clang-22
parisc                randconfig-002-20250918    clang-22
parisc                randconfig-002-20250918    gcc-8.5.0
parisc                randconfig-002-20250919    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    ge_imp3a_defconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250918    clang-22
powerpc               randconfig-001-20250918    gcc-9.5.0
powerpc               randconfig-001-20250919    clang-22
powerpc               randconfig-002-20250918    clang-17
powerpc               randconfig-002-20250918    clang-22
powerpc               randconfig-002-20250919    clang-22
powerpc               randconfig-003-20250918    clang-19
powerpc               randconfig-003-20250918    clang-22
powerpc               randconfig-003-20250919    clang-22
powerpc64             randconfig-001-20250918    clang-22
powerpc64             randconfig-001-20250918    gcc-8.5.0
powerpc64             randconfig-001-20250919    clang-22
powerpc64             randconfig-002-20250918    clang-22
powerpc64             randconfig-002-20250918    gcc-14.3.0
powerpc64             randconfig-002-20250919    clang-22
powerpc64             randconfig-003-20250918    clang-22
powerpc64             randconfig-003-20250919    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250918    clang-22
riscv                 randconfig-001-20250918    gcc-10.5.0
riscv                 randconfig-001-20250919    gcc-10.5.0
riscv                 randconfig-002-20250918    gcc-10.5.0
riscv                 randconfig-002-20250918    gcc-9.5.0
riscv                 randconfig-002-20250919    gcc-10.5.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250918    gcc-10.5.0
s390                  randconfig-001-20250918    gcc-11.5.0
s390                  randconfig-001-20250919    gcc-10.5.0
s390                  randconfig-002-20250918    gcc-10.5.0
s390                  randconfig-002-20250918    gcc-8.5.0
s390                  randconfig-002-20250919    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250918    gcc-10.5.0
sh                    randconfig-001-20250918    gcc-15.1.0
sh                    randconfig-001-20250919    gcc-10.5.0
sh                    randconfig-002-20250918    gcc-10.5.0
sh                    randconfig-002-20250919    gcc-10.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250918    gcc-10.5.0
sparc                 randconfig-001-20250918    gcc-11.5.0
sparc                 randconfig-001-20250919    gcc-10.5.0
sparc                 randconfig-002-20250918    gcc-10.5.0
sparc                 randconfig-002-20250918    gcc-15.1.0
sparc                 randconfig-002-20250919    gcc-10.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250918    clang-20
sparc64               randconfig-001-20250918    gcc-10.5.0
sparc64               randconfig-001-20250919    gcc-10.5.0
sparc64               randconfig-002-20250918    gcc-10.5.0
sparc64               randconfig-002-20250918    gcc-8.5.0
sparc64               randconfig-002-20250919    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250918    clang-22
um                    randconfig-001-20250918    gcc-10.5.0
um                    randconfig-001-20250919    gcc-10.5.0
um                    randconfig-002-20250918    clang-18
um                    randconfig-002-20250918    gcc-10.5.0
um                    randconfig-002-20250919    gcc-10.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250918    clang-20
x86_64      buildonly-randconfig-002-20250918    clang-20
x86_64      buildonly-randconfig-003-20250918    clang-20
x86_64      buildonly-randconfig-004-20250918    clang-20
x86_64      buildonly-randconfig-005-20250918    clang-20
x86_64      buildonly-randconfig-006-20250918    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250918    gcc-12
x86_64                randconfig-001-20250919    clang-20
x86_64                randconfig-002-20250918    gcc-12
x86_64                randconfig-002-20250919    clang-20
x86_64                randconfig-003-20250918    gcc-12
x86_64                randconfig-003-20250919    clang-20
x86_64                randconfig-004-20250918    gcc-12
x86_64                randconfig-004-20250919    clang-20
x86_64                randconfig-005-20250918    gcc-12
x86_64                randconfig-005-20250919    clang-20
x86_64                randconfig-006-20250918    gcc-12
x86_64                randconfig-006-20250919    clang-20
x86_64                randconfig-007-20250918    gcc-12
x86_64                randconfig-007-20250919    clang-20
x86_64                randconfig-008-20250918    gcc-12
x86_64                randconfig-008-20250919    clang-20
x86_64                randconfig-071-20250918    clang-20
x86_64                randconfig-072-20250918    clang-20
x86_64                randconfig-073-20250918    clang-20
x86_64                randconfig-074-20250918    clang-20
x86_64                randconfig-075-20250918    clang-20
x86_64                randconfig-076-20250918    clang-20
x86_64                randconfig-077-20250918    clang-20
x86_64                randconfig-078-20250918    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250918    gcc-10.5.0
xtensa                randconfig-001-20250918    gcc-8.5.0
xtensa                randconfig-001-20250919    gcc-10.5.0
xtensa                randconfig-002-20250918    gcc-10.5.0
xtensa                randconfig-002-20250918    gcc-8.5.0
xtensa                randconfig-002-20250919    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

