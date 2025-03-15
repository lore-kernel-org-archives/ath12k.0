Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EA1C28B28
	for <ath12k@archiver.kernel.org>; Sat, 15 Mar 2025 19:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cmbwYK+V6joL6XQaImdg76rIw/qCPA3fCpAkIubvST8=; b=dxzNLSuS3AX+H9Mh7XyP3oBJL7
	KzotGCDXuCQJoAdZIGhijC5XwMsWLxLFS7Pl24dR2VWS6dyIoyHU6PfoP0fjdzyFbjdav1rFye14O
	FkPs45XWrc5EL3A2QBy/q3YMyw0q+ClR4oIOkEss0OJsTn0vyb6kZrvyA55zCkVLNKmWarcJYMXeS
	uq4IeZF0YxHcGpm7bjrTSEnB6EAxDGauqbaTjUNEbpih6UqxKHqhkmXkB7JQtQgpBhMMaB0tl1EUO
	cph2843bYFv5kXOqVTot4STg9X+DMswVvVqEKTaPJjZUSzANa1qjyAZEoywz8a4QJITs5WD5NZo6k
	wcRkG1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttX46-0000000GkYT-05Ot
	for ath12k@archiver.kernel.org;
	Sat, 15 Mar 2025 19:20:58 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttX3w-0000000GkXk-2x1N
	for ath12k@lists.infradead.org;
	Sat, 15 Mar 2025 19:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742066448; x=1773602448;
  h=date:from:to:cc:subject:message-id;
  bh=0MXV0MYSaL3Mr90Q6QDX0zCkGXQuoCzbAdSsKGYdneE=;
  b=hDuXRt1KlvPrPTZbU0IGAtV2HPWJnLHXSC00esgIe9yQf98QfhnxP/l6
   gW2wSyK7y827pfok66Znc1dNqpQWCYGnhQfGBt80dl0u3nvBw2BZ8OlhS
   6i+Bm3HIqoYbGbtce7TPTVXO321A3iTVAm50c4XnDGIZec307zeKa+pJh
   kx70aPVwZaWwKHbwj+w+nK5x/qkLqyutnWVl2BObDo7LqgiePPjXWsi2E
   sVeP6tb2KXz8pHmdsFXHJK3GtiuFxZ1yBJks9i5XP/gwwAWMH5yT3GAFP
   92JyXLgQnBpCXPbdFCZZ8PyHyCmUHs4zyLJJpMqYfRrObs253kPSTlZpc
   w==;
X-CSE-ConnectionGUID: E9+Ju+afTUik3FWCTXeRTQ==
X-CSE-MsgGUID: d+WAiqKQRma1b0s8p4bhNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43408730"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="43408730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 12:20:48 -0700
X-CSE-ConnectionGUID: bBGFfEh/Q3CNqUhXgUgNKA==
X-CSE-MsgGUID: qheibmZ5TQicvp0NN52wdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="144753194"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2025 12:20:46 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttX3s-000Bb3-2J;
	Sat, 15 Mar 2025 19:20:44 +0000
Date: Sun, 16 Mar 2025 03:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 a2ef9d802c470bc1cc8cb78391ac2e290422cee1
Message-ID: <202503160316.CKJZSxep-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_122048_764707_220F1DF0 
X-CRM114-Status: UNSURE (   3.13  )
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
branch HEAD: a2ef9d802c470bc1cc8cb78391ac2e290422cee1  Add localversion-wireless-testing-ath

elapsed time: 1447m

configs tested: 240
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250315    gcc-13.2.0
arc                   randconfig-001-20250315    gcc-14.2.0
arc                   randconfig-002-20250315    gcc-13.2.0
arc                   randconfig-002-20250315    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-21
arm                      footbridge_defconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                   randconfig-001-20250315    gcc-14.2.0
arm                   randconfig-002-20250315    clang-21
arm                   randconfig-002-20250315    gcc-14.2.0
arm                   randconfig-003-20250315    clang-21
arm                   randconfig-003-20250315    gcc-14.2.0
arm                   randconfig-004-20250315    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250315    gcc-14.2.0
arm64                 randconfig-002-20250315    gcc-14.2.0
arm64                 randconfig-003-20250315    clang-16
arm64                 randconfig-003-20250315    gcc-14.2.0
arm64                 randconfig-004-20250315    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250315    gcc-14.2.0
csky                  randconfig-002-20250315    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250315    clang-21
hexagon               randconfig-001-20250315    gcc-14.2.0
hexagon               randconfig-002-20250315    clang-17
hexagon               randconfig-002-20250315    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250315    gcc-12
i386        buildonly-randconfig-002-20250315    clang-19
i386        buildonly-randconfig-003-20250315    clang-19
i386        buildonly-randconfig-004-20250315    clang-19
i386        buildonly-randconfig-005-20250315    gcc-11
i386        buildonly-randconfig-006-20250315    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250315    clang-19
i386                  randconfig-001-20250316    gcc-12
i386                  randconfig-002-20250315    clang-19
i386                  randconfig-002-20250316    gcc-12
i386                  randconfig-003-20250315    clang-19
i386                  randconfig-003-20250316    gcc-12
i386                  randconfig-004-20250315    clang-19
i386                  randconfig-004-20250316    gcc-12
i386                  randconfig-005-20250315    clang-19
i386                  randconfig-005-20250316    gcc-12
i386                  randconfig-006-20250315    clang-19
i386                  randconfig-006-20250316    gcc-12
i386                  randconfig-007-20250315    clang-19
i386                  randconfig-007-20250316    gcc-12
i386                  randconfig-011-20250315    gcc-12
i386                  randconfig-012-20250315    gcc-12
i386                  randconfig-013-20250315    gcc-12
i386                  randconfig-014-20250315    gcc-12
i386                  randconfig-015-20250315    gcc-12
i386                  randconfig-016-20250315    gcc-12
i386                  randconfig-017-20250315    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250315    gcc-14.2.0
loongarch             randconfig-002-20250315    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    clang-17
m68k                                defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    clang-17
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-21
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                        maltaup_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-21
mips                          rb532_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250315    gcc-14.2.0
nios2                 randconfig-002-20250315    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    clang-17
parisc                randconfig-001-20250315    gcc-14.2.0
parisc                randconfig-002-20250315    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-17
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250315    clang-21
powerpc               randconfig-001-20250315    gcc-14.2.0
powerpc               randconfig-002-20250315    gcc-14.2.0
powerpc               randconfig-003-20250315    clang-18
powerpc               randconfig-003-20250315    gcc-14.2.0
powerpc                    sam440ep_defconfig    clang-17
powerpc64             randconfig-001-20250315    gcc-14.2.0
powerpc64             randconfig-002-20250315    clang-18
powerpc64             randconfig-002-20250315    gcc-14.2.0
powerpc64             randconfig-003-20250315    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250315    gcc-14.2.0
riscv                 randconfig-001-20250316    gcc-14.2.0
riscv                 randconfig-002-20250315    gcc-14.2.0
riscv                 randconfig-002-20250316    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250315    clang-19
s390                  randconfig-001-20250315    gcc-14.2.0
s390                  randconfig-001-20250316    gcc-14.2.0
s390                  randconfig-002-20250315    gcc-14.2.0
s390                  randconfig-002-20250316    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250315    gcc-14.2.0
sh                    randconfig-001-20250316    gcc-14.2.0
sh                    randconfig-002-20250315    gcc-14.2.0
sh                    randconfig-002-20250316    gcc-14.2.0
sh                          sdk7786_defconfig    clang-17
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7724_defconfig    clang-21
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-21
sh                   sh7770_generic_defconfig    gcc-14.2.0
sh                            shmin_defconfig    clang-21
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250315    gcc-14.2.0
sparc                 randconfig-001-20250316    gcc-14.2.0
sparc                 randconfig-002-20250315    gcc-14.2.0
sparc                 randconfig-002-20250316    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250315    gcc-14.2.0
sparc64               randconfig-001-20250316    gcc-14.2.0
sparc64               randconfig-002-20250315    gcc-14.2.0
sparc64               randconfig-002-20250316    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250315    gcc-12
um                    randconfig-001-20250315    gcc-14.2.0
um                    randconfig-001-20250316    gcc-14.2.0
um                    randconfig-002-20250315    clang-18
um                    randconfig-002-20250315    gcc-14.2.0
um                    randconfig-002-20250316    gcc-14.2.0
um                           x86_64_defconfig    clang-17
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250315    clang-19
x86_64      buildonly-randconfig-001-20250315    gcc-12
x86_64      buildonly-randconfig-002-20250315    clang-19
x86_64      buildonly-randconfig-003-20250315    clang-19
x86_64      buildonly-randconfig-004-20250315    clang-19
x86_64      buildonly-randconfig-005-20250315    clang-19
x86_64      buildonly-randconfig-006-20250315    clang-19
x86_64      buildonly-randconfig-006-20250315    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250315    clang-19
x86_64                randconfig-002-20250315    clang-19
x86_64                randconfig-003-20250315    clang-19
x86_64                randconfig-004-20250315    clang-19
x86_64                randconfig-005-20250315    clang-19
x86_64                randconfig-006-20250315    clang-19
x86_64                randconfig-007-20250315    clang-19
x86_64                randconfig-008-20250315    clang-19
x86_64                randconfig-071-20250315    clang-19
x86_64                randconfig-072-20250315    clang-19
x86_64                randconfig-073-20250315    clang-19
x86_64                randconfig-074-20250315    clang-19
x86_64                randconfig-075-20250315    clang-19
x86_64                randconfig-076-20250315    clang-19
x86_64                randconfig-077-20250315    clang-19
x86_64                randconfig-078-20250315    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250315    gcc-14.2.0
xtensa                randconfig-001-20250316    gcc-14.2.0
xtensa                randconfig-002-20250315    gcc-14.2.0
xtensa                randconfig-002-20250316    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

