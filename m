Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A998C77B7C
	for <ath12k@archiver.kernel.org>; Thu,  3 Jul 2025 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uzwFL/T3UmnRufykUgVKe++3lredeKg1euE62MSiqlY=; b=OEeA5aJlP2gAgawlBcGCmAajKg
	YS4zzZi+7W0Yg8iIc2v4XC0HTcCLkKiGx+X6LVm4Lcq3Xfi6ZKD0tJEnhNouYI23212gMwIeB3E2g
	lYCI7CE4AP/PLteH0GwcOxzKaQwf7maIneGzLKNb/Y1YLKdzWtioS8I+apWN5P/llWVKmO/ZlEF6a
	+IM+0guDvyrn423MAkTHB80PZTSXX4XNBzg1GygXX83XqTbFVmYbUYC+UbMTcOY8bltIkBFaYDOTh
	DTfNc644a25wNzqxaTTy5sHku0p/4JlUKdKrekEkF8wubvqTMri2p8S5ULmIE6lCYfII7Wgha6s0f
	h+D1CMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKSI-0000000BZNg-1ATG;
	Thu, 03 Jul 2025 13:58:26 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIyL-0000000BJZQ-3cEX
	for ath12k@lists.infradead.org;
	Thu, 03 Jul 2025 12:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751545406; x=1783081406;
  h=date:from:to:cc:subject:message-id;
  bh=UwzLdgiVnGFipl8dQJohV0JYovnDDu7QyrivR/WKES4=;
  b=MG4FUUsBfgTwnHGxxT/mK+QRJQLKAiLt2DdlYN6mu5vYO5VKKD1x0yyS
   3iqHMK4y6UXyikKahzm1bM7dMF/4hi8W7RKakIaRjOIf75Un9A9Q6lq1Z
   sHILuYYkJOrQ6Ct54Q6oxPGgFjY6cqS6O859xoU474vyqQknqVZaH0iOr
   XbU9TZMB2KfHsbL13kVuJ9uaDR+xOab8EoiR1BX7IDQaEZjJnrFve4PU4
   AAB7O0krUSBzOFUrsnUGAdo/B4DPXCTl56jelcb1vA49MkkL5jg1/37io
   ozoo5QS+BHWqap3lGoZS03BETXezJ+c2yY8h7p8bxH3ndm3DbenII695i
   Q==;
X-CSE-ConnectionGUID: lFwFZtwaQWeu1aW4GjNykA==
X-CSE-MsgGUID: dSI/A0wERzWfltYZwEOmnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57643873"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="57643873"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 05:23:24 -0700
X-CSE-ConnectionGUID: pkUEUH9yTEWu6nPseneLAA==
X-CSE-MsgGUID: CjCanzHeQ56O99m+qRPAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="158917635"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Jul 2025 05:23:22 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXIyG-0001og-10;
	Thu, 03 Jul 2025 12:23:20 +0000
Date: Thu, 03 Jul 2025 20:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 a82ce08775bc5b50613d48ab7e41b25fc46825af
Message-ID: <202507032047.OmleugrN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_052325_971785_F39CC8D6 
X-CRM114-Status: UNSURE (   3.88  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: a82ce08775bc5b50613d48ab7e41b25fc46825af  wifi: ath12k: add extended NSS bandwidth support for 160 MHz

elapsed time: 1324m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250702    gcc-10.5.0
arc                   randconfig-002-20250702    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                      integrator_defconfig    clang-21
arm                   randconfig-001-20250702    clang-17
arm                   randconfig-002-20250702    clang-19
arm                   randconfig-003-20250702    clang-21
arm                   randconfig-004-20250702    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250702    clang-21
arm64                 randconfig-002-20250702    clang-21
arm64                 randconfig-003-20250702    clang-21
arm64                 randconfig-004-20250702    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250702    gcc-15.1.0
csky                  randconfig-002-20250702    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250702    clang-21
hexagon               randconfig-002-20250702    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250702    clang-20
i386        buildonly-randconfig-002-20250702    gcc-12
i386        buildonly-randconfig-003-20250702    clang-20
i386        buildonly-randconfig-004-20250702    clang-20
i386        buildonly-randconfig-005-20250702    gcc-12
i386        buildonly-randconfig-006-20250702    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250702    gcc-15.1.0
loongarch             randconfig-002-20250702    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250702    gcc-14.2.0
nios2                 randconfig-002-20250702    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250702    gcc-12.4.0
parisc                randconfig-002-20250702    gcc-9.3.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250702    gcc-11.5.0
powerpc               randconfig-002-20250702    gcc-11.5.0
powerpc               randconfig-003-20250702    clang-21
powerpc64             randconfig-001-20250702    clang-21
powerpc64             randconfig-002-20250702    clang-19
powerpc64             randconfig-003-20250702    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250702    clang-21
riscv                 randconfig-002-20250702    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250702    gcc-10.5.0
s390                  randconfig-002-20250702    clang-21
sh                               alldefconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250702    gcc-15.1.0
sh                    randconfig-002-20250702    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250702    gcc-12.4.0
sparc                 randconfig-002-20250702    gcc-15.1.0
sparc64               randconfig-001-20250702    gcc-9.3.0
sparc64               randconfig-002-20250702    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250702    clang-21
um                    randconfig-002-20250702    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250702    gcc-12
x86_64      buildonly-randconfig-002-20250702    gcc-11
x86_64      buildonly-randconfig-003-20250702    clang-20
x86_64      buildonly-randconfig-004-20250702    clang-20
x86_64      buildonly-randconfig-005-20250702    clang-20
x86_64      buildonly-randconfig-006-20250702    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250702    gcc-14.3.0
xtensa                randconfig-002-20250702    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

