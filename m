Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381B0C677C4
	for <ath12k@archiver.kernel.org>; Wed, 11 Jun 2025 02:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E5WcXEhkC2Zt2t9n6P5L5IONIV5khU+MhqjFjRuhOtY=; b=JxIEfq2BE0XDbsQkqQ0Tm+ReAb
	ndOTVq0gxQTeWXCDYPx0BXlzxY85V7VFwGx6vwiQxjx11/E/S2PhUW6QNEgYm0yu0o7OxpK9RRSOD
	SRVRrnezYZ7M7cU3HT2JdZgTuBJsVidtSHk8drFHBv14Axvdc05yRf2DotPmPhwSYOtms2yLNB1Nd
	t2YzmWPbUnRP2QFsYffc70oxHQPdZdKXN9zz3GNaGLfdffn4lk7G/WpN2aXjMRNqFRLOe8avc2cjK
	kFHsOK7LKYgQ1W4LjNWDLY5ae3M1qd0NF6F56v6V52/0AXqD7A85fUdJ0qWGiPKuZ31ytxnxz0hou
	KAKkYk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBbF-00000008h10-41Mw;
	Wed, 11 Jun 2025 02:54:01 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPARQ-00000008Zdd-0HAZ
	for ath12k@lists.infradead.org;
	Wed, 11 Jun 2025 01:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749605989; x=1781141989;
  h=date:from:to:cc:subject:message-id;
  bh=nwmF9BSfOzEuWAly1VvKmVxxXaGnLiKLaQx0nOlvrjQ=;
  b=BplhrXUuSwXsPwyVDKM/GjkjpvFWcosMUez4i3u7owitFnRpVEEcQhhQ
   GTAoasNu3BxueG+LZP8r84ZIdF5EJeU+BhX+zrUwDh5QsM779WYuG1+5+
   MVjuQ6ktOl5E3pYlIFAhVrtxxgCUOzNqyXnUGMfUZtKZLwYWwmQtlBzGp
   s6gu5taTTi5CBMCtqWii6IfbYrSZ1OaZ1MTDrbsdAWK5W6JofMLxD/8XT
   R3MSf20My/dOTTGkd3Gz3uiyxQhRSDEyNDx62ARkEC0R3oZDvlRndxFkS
   suuPC/Ojjzb/5JXDCBKngQ4Eo52Sfp20njjZg3Cctr+OTuqhSn93hIMYO
   w==;
X-CSE-ConnectionGUID: TdVXakoCQsOR1UjPf2oivg==
X-CSE-MsgGUID: kyPWMyY1Q42Z5J5W0etgZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51726644"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51726644"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 18:39:48 -0700
X-CSE-ConnectionGUID: hHdSNr0IQzGUPiNhREZQXw==
X-CSE-MsgGUID: yS075rOPQ3uBzrfJV9LjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="152156828"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2025 18:39:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uP9Nn-0008y8-2D;
	Wed, 11 Jun 2025 00:31:59 +0000
Date: Wed, 11 Jun 2025 08:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 a7720c3d225a2675d9073fcd35f9b063bb6b8e61
Message-ID: <202506110828.evVP3BIb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_183948_161226_095F95FA 
X-CRM114-Status: UNSURE (   3.47  )
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
branch HEAD: a7720c3d225a2675d9073fcd35f9b063bb6b8e61  wifi: ath12k: remove monitor handling from ath12k_dp_rx_deliver_msdu()

elapsed time: 1355m

configs tested: 287
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250610    gcc-12.4.0
arc                   randconfig-002-20250610    gcc-12.4.0
arc                   randconfig-002-20250610    gcc-14.3.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-21
arm                         lpc32xx_defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20250610    clang-19
arm                   randconfig-001-20250610    gcc-12.4.0
arm                   randconfig-002-20250610    gcc-12.4.0
arm                   randconfig-002-20250610    gcc-8.5.0
arm                   randconfig-003-20250610    clang-21
arm                   randconfig-003-20250610    gcc-12.4.0
arm                   randconfig-004-20250610    clang-16
arm                   randconfig-004-20250610    gcc-12.4.0
arm                           sama5_defconfig    gcc-15.1.0
arm                          sp7021_defconfig    clang-21
arm                        spear3xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250610    clang-21
arm64                 randconfig-001-20250610    gcc-12.4.0
arm64                 randconfig-002-20250610    gcc-11.5.0
arm64                 randconfig-002-20250610    gcc-12.4.0
arm64                 randconfig-003-20250610    clang-21
arm64                 randconfig-003-20250610    gcc-12.4.0
arm64                 randconfig-004-20250610    clang-18
arm64                 randconfig-004-20250610    gcc-12.4.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250610    gcc-12.4.0
csky                  randconfig-001-20250610    gcc-15.1.0
csky                  randconfig-002-20250610    gcc-14.3.0
csky                  randconfig-002-20250610    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250610    clang-21
hexagon               randconfig-001-20250610    gcc-15.1.0
hexagon               randconfig-002-20250610    clang-21
hexagon               randconfig-002-20250610    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-001-20250611    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-002-20250611    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250610    clang-20
i386        buildonly-randconfig-004-20250610    gcc-12
i386        buildonly-randconfig-004-20250611    clang-20
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-005-20250611    clang-20
i386        buildonly-randconfig-006-20250610    clang-20
i386        buildonly-randconfig-006-20250611    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250610    clang-20
i386                  randconfig-001-20250611    clang-20
i386                  randconfig-002-20250610    clang-20
i386                  randconfig-002-20250611    clang-20
i386                  randconfig-003-20250610    clang-20
i386                  randconfig-003-20250611    clang-20
i386                  randconfig-004-20250610    clang-20
i386                  randconfig-004-20250611    clang-20
i386                  randconfig-005-20250610    clang-20
i386                  randconfig-005-20250611    clang-20
i386                  randconfig-006-20250610    clang-20
i386                  randconfig-006-20250611    clang-20
i386                  randconfig-007-20250610    clang-20
i386                  randconfig-007-20250611    clang-20
i386                  randconfig-011-20250610    clang-20
i386                  randconfig-011-20250611    gcc-12
i386                  randconfig-012-20250610    clang-20
i386                  randconfig-012-20250611    gcc-12
i386                  randconfig-013-20250610    clang-20
i386                  randconfig-013-20250611    gcc-12
i386                  randconfig-014-20250610    clang-20
i386                  randconfig-014-20250611    gcc-12
i386                  randconfig-015-20250610    clang-20
i386                  randconfig-015-20250611    gcc-12
i386                  randconfig-016-20250610    clang-20
i386                  randconfig-016-20250611    gcc-12
i386                  randconfig-017-20250610    clang-20
i386                  randconfig-017-20250611    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250610    gcc-15.1.0
loongarch             randconfig-002-20250610    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    clang-21
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250610    gcc-15.1.0
nios2                 randconfig-001-20250610    gcc-6.5.0
nios2                 randconfig-002-20250610    gcc-13.3.0
nios2                 randconfig-002-20250610    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250610    gcc-10.5.0
parisc                randconfig-001-20250610    gcc-15.1.0
parisc                randconfig-002-20250610    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250610    gcc-10.5.0
powerpc               randconfig-001-20250610    gcc-15.1.0
powerpc               randconfig-002-20250610    gcc-15.1.0
powerpc               randconfig-002-20250610    gcc-8.5.0
powerpc               randconfig-003-20250610    clang-21
powerpc               randconfig-003-20250610    gcc-15.1.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250610    clang-21
powerpc64             randconfig-001-20250610    gcc-15.1.0
powerpc64             randconfig-002-20250610    clang-21
powerpc64             randconfig-002-20250610    gcc-15.1.0
riscv                            alldefconfig    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20250610    gcc-14.3.0
riscv                 randconfig-001-20250610    gcc-9.3.0
riscv                 randconfig-002-20250610    clang-16
riscv                 randconfig-002-20250610    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250610    gcc-7.5.0
s390                  randconfig-001-20250610    gcc-9.3.0
s390                  randconfig-002-20250610    gcc-14.3.0
s390                  randconfig-002-20250610    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20250610    gcc-9.3.0
sh                    randconfig-002-20250610    gcc-15.1.0
sh                    randconfig-002-20250610    gcc-9.3.0
sh                          rsk7264_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250610    gcc-15.1.0
sparc                 randconfig-001-20250610    gcc-9.3.0
sparc                 randconfig-002-20250610    gcc-12.4.0
sparc                 randconfig-002-20250610    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250610    gcc-6.5.0
sparc64               randconfig-001-20250610    gcc-9.3.0
sparc64               randconfig-002-20250610    gcc-6.5.0
sparc64               randconfig-002-20250610    gcc-9.3.0
um                               alldefconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250610    gcc-11
um                    randconfig-001-20250610    gcc-9.3.0
um                    randconfig-002-20250610    gcc-12
um                    randconfig-002-20250610    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250610    clang-20
x86_64      buildonly-randconfig-001-20250610    gcc-12
x86_64      buildonly-randconfig-001-20250611    clang-20
x86_64      buildonly-randconfig-002-20250610    gcc-12
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250610    clang-20
x86_64      buildonly-randconfig-003-20250610    gcc-12
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250610    clang-20
x86_64      buildonly-randconfig-004-20250610    gcc-12
x86_64      buildonly-randconfig-004-20250611    clang-20
x86_64      buildonly-randconfig-005-20250610    gcc-12
x86_64      buildonly-randconfig-005-20250611    clang-20
x86_64      buildonly-randconfig-006-20250610    gcc-12
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250610    clang-20
x86_64                randconfig-001-20250611    clang-20
x86_64                randconfig-002-20250610    clang-20
x86_64                randconfig-002-20250611    clang-20
x86_64                randconfig-003-20250610    clang-20
x86_64                randconfig-003-20250611    clang-20
x86_64                randconfig-004-20250610    clang-20
x86_64                randconfig-004-20250611    clang-20
x86_64                randconfig-005-20250610    clang-20
x86_64                randconfig-005-20250611    clang-20
x86_64                randconfig-006-20250610    clang-20
x86_64                randconfig-006-20250611    clang-20
x86_64                randconfig-007-20250610    clang-20
x86_64                randconfig-007-20250611    clang-20
x86_64                randconfig-008-20250610    clang-20
x86_64                randconfig-008-20250611    clang-20
x86_64                randconfig-071-20250610    clang-20
x86_64                randconfig-071-20250611    gcc-12
x86_64                randconfig-072-20250610    clang-20
x86_64                randconfig-072-20250611    gcc-12
x86_64                randconfig-073-20250610    clang-20
x86_64                randconfig-073-20250611    gcc-12
x86_64                randconfig-074-20250610    clang-20
x86_64                randconfig-074-20250611    gcc-12
x86_64                randconfig-075-20250610    clang-20
x86_64                randconfig-075-20250611    gcc-12
x86_64                randconfig-076-20250610    clang-20
x86_64                randconfig-076-20250611    gcc-12
x86_64                randconfig-077-20250610    clang-20
x86_64                randconfig-077-20250611    gcc-12
x86_64                randconfig-078-20250610    clang-20
x86_64                randconfig-078-20250611    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250610    gcc-11.5.0
xtensa                randconfig-001-20250610    gcc-9.3.0
xtensa                randconfig-002-20250610    gcc-12.4.0
xtensa                randconfig-002-20250610    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

