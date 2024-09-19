Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED1DCF395D
	for <ath12k@archiver.kernel.org>; Thu, 19 Sep 2024 15:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y1dfzwlrixQpzFjxrTYSH6R+G04b2L1pjq2QPEqpBT8=; b=uYZ2KzuHE8vyxLJ+WaPFjQ4Wds
	AhtMSlU30HRSgnlI5j8EWluhn191Pp/duHr64zyWBQbwMsSH33cKeQpjK6UOvuJovXaFFYx3aGVYO
	HQdycAXr6PnO1cYMLf0erAd60eVX8FSKcySDeodNGpx0D764bPsc2O5uZs/MvlUUfM8+9tfqwfU8Z
	bIn4wV4qnMW79r/BopDrs0bZT2wy6a0+Zj/O3Wr2qToJf5p5c0VTphmVxPIvwTgeOr+FxBNrTtVuN
	UDRUlnyqiYd5xPhpVwPK7jzkmXfGM7q/680bRedgCA98a+4++o1TUSYk2tXkonxHh+sRw1a3AijbL
	pY6+bJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srJAf-0000000AYdI-2AHs
	for ath12k@archiver.kernel.org;
	Thu, 19 Sep 2024 15:34:17 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srJAc-0000000AYcy-36CV
	for ath12k@lists.infradead.org;
	Thu, 19 Sep 2024 15:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726760055; x=1758296055;
  h=date:from:to:cc:subject:message-id;
  bh=A5VVficgg4+/KelLsJ/wdbQWBFjcbRT5Z5mypj2tPW8=;
  b=WK/PWa/XOA+E2CxPm69E1s3UvTzZ4rRtg3UbOGPuTfj2QHqGmRGLeHQF
   wnG+Zt8e2YpoFaBlJ4SB6kp9VP6nJIAdr1TcBD73910mp0zKA6kaRb8NX
   DwAR4iiov+4f+ByfCqJQ/UEf9dZvOitD0cF59amaRiwJCQKWzk1CyxePP
   c5jgZpg6cnpcHv/aIi8s00CJJq8rS1UhRfGAWXB6MRk0krr/ZCAJz65CI
   PCmnSfwufYHnxqSjJV/KwvnDP/P9N4dZxpHviYs1U5zkmGGFVGnsRvQXM
   9KdfMzZnkqCo5l1TQJFT8vlW46ziF0PtAfG1e7vjCL0HG4Yi5bE80V58E
   A==;
X-CSE-ConnectionGUID: 9mfU5KpwQ7m+MWTZpc8OgA==
X-CSE-MsgGUID: 8VheWyN/RLSYuEGYs0VL7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="28637019"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="28637019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 08:34:05 -0700
X-CSE-ConnectionGUID: 4myueqhKQ/yJXV0Jf2xmlA==
X-CSE-MsgGUID: FqoxuyV7R8e8eJR7gS6Wag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="69983709"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Sep 2024 08:34:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srJAP-000DPt-33;
	Thu, 19 Sep 2024 15:34:01 +0000
Date: Thu, 19 Sep 2024 23:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 1e091776c1aa4894a9b3d25d5a2e5e4fc3489cfd
Message-ID: <202409192337.IAypcX3Q-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_083414_816755_CB672AD4 
X-CRM114-Status: UNSURE (   4.44  )
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
branch HEAD: 1e091776c1aa4894a9b3d25d5a2e5e4fc3489cfd  Merge branch 'pending' into main-pending

elapsed time: 1256m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          exynos_defconfig    clang-14
arm                         wpcm450_defconfig    clang-14
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240919    clang-18
i386        buildonly-randconfig-002-20240919    clang-18
i386        buildonly-randconfig-003-20240919    clang-18
i386        buildonly-randconfig-004-20240919    clang-18
i386        buildonly-randconfig-005-20240919    clang-18
i386        buildonly-randconfig-006-20240919    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240919    clang-18
i386                  randconfig-002-20240919    clang-18
i386                  randconfig-003-20240919    clang-18
i386                  randconfig-004-20240919    clang-18
i386                  randconfig-005-20240919    clang-18
i386                  randconfig-006-20240919    clang-18
i386                  randconfig-011-20240919    clang-18
i386                  randconfig-012-20240919    clang-18
i386                  randconfig-013-20240919    clang-18
i386                  randconfig-014-20240919    clang-18
i386                  randconfig-015-20240919    clang-18
i386                  randconfig-016-20240919    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip22_defconfig    clang-14
mips                     loongson2k_defconfig    clang-14
mips                      maltaaprp_defconfig    clang-14
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-14
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    clang-14
powerpc                         ps3_defconfig    clang-14
powerpc                     stx_gp3_defconfig    clang-14
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                       zfcpdump_defconfig    clang-14
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    clang-14
sh                          kfr2r09_defconfig    clang-14
sh                      rts7751r2d1_defconfig    clang-14
sh                           se7751_defconfig    clang-14
sh                              ul2_defconfig    clang-14
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240919    clang-18
x86_64      buildonly-randconfig-002-20240919    clang-18
x86_64      buildonly-randconfig-003-20240919    clang-18
x86_64      buildonly-randconfig-004-20240919    clang-18
x86_64      buildonly-randconfig-005-20240919    clang-18
x86_64      buildonly-randconfig-006-20240919    clang-18
x86_64                              defconfig    clang-18
x86_64                randconfig-001-20240919    clang-18
x86_64                randconfig-002-20240919    clang-18
x86_64                randconfig-003-20240919    clang-18
x86_64                randconfig-004-20240919    clang-18
x86_64                randconfig-005-20240919    clang-18
x86_64                randconfig-006-20240919    clang-18
x86_64                randconfig-011-20240919    clang-18
x86_64                randconfig-012-20240919    clang-18
x86_64                randconfig-013-20240919    clang-18
x86_64                randconfig-014-20240919    clang-18
x86_64                randconfig-015-20240919    clang-18
x86_64                randconfig-016-20240919    clang-18
x86_64                randconfig-071-20240919    clang-18
x86_64                randconfig-072-20240919    clang-18
x86_64                randconfig-073-20240919    clang-18
x86_64                randconfig-074-20240919    clang-18
x86_64                randconfig-075-20240919    clang-18
x86_64                randconfig-076-20240919    clang-18
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

