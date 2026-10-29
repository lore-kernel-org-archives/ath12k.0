Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC66606A321
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AwVsOzqn;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drdSHfN6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HM7hEOQ5n8RDsJjAO4whdO0OvHipOVc+pGURIvRUh18=; b=AwVsOzqnkRHitZROCc4kAKA/Ml
	zqXY2Toz8AiI3kl5rGOHcRIC8R+DcVpaSynvZJ1MdDfrFlmM9Os7aRWx+fSN4lX/PxQsJ5J0guiAq
	SII1u6CtzmiDlxImzS21lWSSMA5zM80p/8ioo3waau1F0hrtV3H7jFrsqfjjfRtGYljNzFTj12Z+1
	mZeQ9oKr6oaMXe/jJlXrDSvowyLx19OKvfTe7rdVfTaYVhJiHGxCtqEC76Q1CcXhbupJ4jaEgbUmJ
	6AKBs1p6YG3sEkUhnLeWqDKTWIpAsSo1xTYg9iyLAtzphwI9adCO35rUSLEFBxVp4KwtunJpPF0th
	i9eELZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTy4-00000009yo2-0xi3;
	Thu, 29 Oct 2026 17:31:12 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTy0-00000009ykW-0bCX
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 17:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793295069; x=1824831069;
  h=date:from:to:cc:subject:message-id;
  bh=1jEqMtb1i4N5A/LAVkc9VrTmrimNRr7GUrOkX3S0CCU=;
  b=drdSHfN6CeM/8d2eiKsx3RF46VLDcc/rCpcRetzIhYP+GlNpDT/VRCS8
   wy3O3Xhzlpr7GiytMWfHWH593hT6uYB6FAhtTZXcsQRUTmV/h2ra3V/Ln
   AbK7AIb1HcB5kRVzdVRj68i31EKEvwR4+BH8PeeQjkhay1/9cg3lf0a/T
   NWYDMfbZ43iWYmiFPFPzD88LL6p5eqOBZ6lIpDb4UsQQYxXliYjS/W6aZ
   0CU336VkzbvWKPCobpMu7Db5wJF/+qVQM7ub3HNCpJ4w8EAbrX/Bdhqfb
   A15Xx8FD8xKhloU9Bmrma/KbvxjB95c83HGkaUps8o8eLeaVx9CbUw7/k
   g==;
X-CSE-ConnectionGUID: oY8ZarJcRTGtYoXX04jblA==
X-CSE-MsgGUID: hVLefClGQ0OdJjIExx29Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2139406"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2139406"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 10:31:07 -0700
X-CSE-ConnectionGUID: C4ZYFh5YTKWQJYfSuc1kCA==
X-CSE-MsgGUID: fw//fJG2Sb2FzsKJHVGKtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5224369"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2026 10:31:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMTxv-00000000abD-10Jb;
	Thu, 29 Oct 2026 17:31:03 +0000
Date: Fri, 30 Oct 2026 01:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 56257d487ae528667aea118e72d63b07374c6136
Message-ID: <202610300109.Y7mHkoGM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_103108_492780_1F516747 
X-CRM114-Status: UNSURE (   3.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: 56257d487ae528667aea118e72d63b07374c6136  MIPS: generic: Remove undefined image 'ramdisk'

elapsed time: 2551m

configs tested: 312
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-19
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                             hsdk_defconfig    clang-24
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261028    gcc-8.5.0
arc                   randconfig-1000-20261029    clang-24
arc                   randconfig-1001-20261028    gcc-8.5.0
arc                   randconfig-1001-20261029    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                            h3600_defconfig    clang-24
arm                            imxrt_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                             mps2_defconfig    clang-24
arm                         multi_v5_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261028    gcc-8.5.0
arm                   randconfig-1000-20261029    clang-24
arm                   randconfig-1001-20261028    gcc-8.5.0
arm                   randconfig-1001-20261029    clang-24
arm                   randconfig-1002-20261028    gcc-8.5.0
arm                   randconfig-1002-20261029    clang-24
arm                   randconfig-1003-20261028    gcc-8.5.0
arm                   randconfig-1003-20261029    clang-24
arm                        spear13xx_defconfig    clang-24
arm                         spear3xx_defconfig    gcc-16.2.0
arm                     vt8500_v6_v7_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261028    clang-22
arm64                 randconfig-1000-20261029    gcc-8.5.0
arm64                 randconfig-1001-20261028    clang-22
arm64                 randconfig-1001-20261029    gcc-8.5.0
arm64                 randconfig-1002-20261028    clang-22
arm64                 randconfig-1002-20261029    gcc-8.5.0
arm64                 randconfig-1003-20261028    clang-22
arm64                 randconfig-1003-20261029    gcc-8.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261028    clang-22
csky                  randconfig-1000-20261029    gcc-8.5.0
csky                  randconfig-1001-20261028    clang-22
csky                  randconfig-1001-20261029    gcc-8.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261028    clang-17
hexagon               randconfig-1000-20261029    clang-24
hexagon               randconfig-1001-20261028    clang-17
hexagon               randconfig-1001-20261029    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261028    clang-22
i386        buildonly-randconfig-1000-20261029    gcc-14
i386        buildonly-randconfig-1001-20261028    clang-22
i386        buildonly-randconfig-1001-20261029    gcc-14
i386        buildonly-randconfig-1002-20261028    clang-22
i386        buildonly-randconfig-1002-20261029    gcc-14
i386        buildonly-randconfig-1003-20261028    clang-22
i386        buildonly-randconfig-1003-20261029    gcc-14
i386        buildonly-randconfig-1004-20261028    clang-22
i386        buildonly-randconfig-1004-20261029    gcc-14
i386        buildonly-randconfig-1005-20261028    clang-22
i386        buildonly-randconfig-1005-20261029    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261028    gcc-14
i386                  randconfig-1000-20261029    clang-22
i386                  randconfig-1001-20261028    gcc-14
i386                  randconfig-1001-20261029    clang-22
i386                  randconfig-1002-20261028    gcc-14
i386                  randconfig-1002-20261029    clang-22
i386                  randconfig-1003-20261028    gcc-14
i386                  randconfig-1003-20261029    clang-22
i386                  randconfig-1004-20261028    gcc-14
i386                  randconfig-1004-20261029    clang-22
i386                  randconfig-1005-20261028    gcc-14
i386                  randconfig-1005-20261029    clang-22
i386                  randconfig-1006-20261028    gcc-14
i386                  randconfig-1006-20261029    clang-22
i386                  randconfig-1007-20261028    clang-22
i386                  randconfig-1007-20261029    clang-22
i386                  randconfig-1008-20261028    clang-22
i386                  randconfig-1008-20261029    clang-22
i386                  randconfig-1009-20261028    clang-22
i386                  randconfig-1009-20261029    clang-22
i386                  randconfig-1010-20261028    clang-22
i386                  randconfig-1010-20261029    clang-22
i386                  randconfig-1011-20261028    clang-22
i386                  randconfig-1011-20261029    clang-22
i386                  randconfig-1012-20261028    clang-22
i386                  randconfig-1012-20261029    clang-22
i386                  randconfig-1013-20261028    clang-22
i386                  randconfig-1013-20261029    clang-22
loongarch                         allmodconfig    clang-19
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261028    clang-17
loongarch             randconfig-1000-20261029    clang-24
loongarch             randconfig-1001-20261028    clang-17
loongarch             randconfig-1001-20261029    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-22
m68k                        bvme6000_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    clang-24
m68k                        m5275evb_defconfig    clang-22
m68k                        m5282evb_defconfig    clang-24
m68k                         stmark2_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                            ip32_defconfig    gcc-16.2.0
mips                        lemote2f_defconfig    clang-22
mips                            mtx1_defconfig    gcc-16.2.0
mips                           rm200_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261028    clang-17
nios2                 randconfig-1000-20261029    clang-24
nios2                 randconfig-1001-20261028    clang-17
nios2                 randconfig-1001-20261029    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    clang-24
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261028    clang-19
parisc                randconfig-1000-20261029    clang-17
parisc                randconfig-1001-20261028    clang-19
parisc                randconfig-1001-20261029    clang-17
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                       bamboo_defconfig    gcc-16.2.0
powerpc                  canyonlands_defconfig    clang-22
powerpc                       cm5200_defconfig    clang-24
powerpc                      ep8248e_defconfig    clang-22
powerpc                           g5_defconfig    clang-24
powerpc                     ge_imp3a_defconfig    clang-24
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                    motionpro_defconfig    clang-24
powerpc                  mpc8315_rdb_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    clang-24
powerpc                       pasemi_defconfig    clang-24
powerpc                       ppc44x_defconfig    clang-24
powerpc               randconfig-1000-20261028    clang-19
powerpc               randconfig-1000-20261029    clang-17
powerpc               randconfig-1001-20261028    clang-19
powerpc               randconfig-1001-20261029    clang-17
powerpc                     sam440ep_defconfig    clang-22
powerpc                     socrates_defconfig    gcc-16.2.0
powerpc                   storcenter_defconfig    clang-24
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261028    clang-19
powerpc64             randconfig-1000-20261029    clang-17
powerpc64             randconfig-1001-20261028    clang-19
powerpc64             randconfig-1001-20261029    clang-17
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261028    gcc-11.5.0
riscv                 randconfig-1000-20261029    gcc-10.5.0
riscv                 randconfig-1001-20261028    gcc-11.5.0
riscv                 randconfig-1001-20261029    gcc-10.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261028    gcc-11.5.0
s390                  randconfig-1000-20261029    gcc-10.5.0
s390                  randconfig-1001-20261028    gcc-11.5.0
s390                  randconfig-1001-20261029    gcc-10.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                          ap325rxa_defconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    clang-22
sh                             hp6xx_defconfig    clang-24
sh                                j2_defconfig    clang-24
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261028    gcc-11.5.0
sh                    randconfig-1000-20261029    gcc-10.5.0
sh                    randconfig-1001-20261028    gcc-11.5.0
sh                    randconfig-1001-20261029    gcc-10.5.0
sh                           rsk7201_defconfig    clang-22
sh                            se7619_defconfig    clang-24
sh                            se7721_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                    sh7724_generic_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sh                             titan_defconfig    clang-24
sparc                             alldefconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261028    gcc-12
sparc                 randconfig-1000-20261029    clang-24
sparc                 randconfig-1001-20261028    gcc-12
sparc                 randconfig-1001-20261029    clang-24
sparc                        sparc64_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261028    gcc-12
sparc64               randconfig-1000-20261029    clang-24
sparc64               randconfig-1001-20261028    gcc-12
sparc64               randconfig-1001-20261029    clang-24
um                                alldefconfig    gcc-16.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261028    gcc-12
um                    randconfig-1000-20261029    clang-24
um                    randconfig-1001-20261028    gcc-12
um                    randconfig-1001-20261029    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261028    clang-22
x86_64      buildonly-randconfig-1000-20261029    gcc-14
x86_64      buildonly-randconfig-1001-20261028    clang-22
x86_64      buildonly-randconfig-1001-20261029    gcc-14
x86_64      buildonly-randconfig-1002-20261028    clang-22
x86_64      buildonly-randconfig-1002-20261029    gcc-14
x86_64      buildonly-randconfig-1003-20261028    clang-22
x86_64      buildonly-randconfig-1003-20261029    gcc-14
x86_64      buildonly-randconfig-1004-20261028    clang-22
x86_64      buildonly-randconfig-1004-20261029    gcc-14
x86_64      buildonly-randconfig-1005-20261028    clang-22
x86_64      buildonly-randconfig-1005-20261029    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261028    clang-22
x86_64                randconfig-1000-20261029    clang-22
x86_64                randconfig-1001-20261028    clang-22
x86_64                randconfig-1001-20261029    clang-22
x86_64                randconfig-1002-20261028    clang-22
x86_64                randconfig-1002-20261029    clang-22
x86_64                randconfig-1003-20261028    clang-22
x86_64                randconfig-1003-20261029    clang-22
x86_64                randconfig-1004-20261028    clang-22
x86_64                randconfig-1004-20261029    clang-22
x86_64                randconfig-1005-20261028    clang-22
x86_64                randconfig-1005-20261029    clang-22
x86_64                randconfig-1006-20261028    gcc-14
x86_64                randconfig-1006-20261029    gcc-14
x86_64                randconfig-1007-20261028    gcc-14
x86_64                randconfig-1007-20261029    gcc-14
x86_64                randconfig-1008-20261028    gcc-14
x86_64                randconfig-1008-20261029    gcc-14
x86_64                randconfig-1009-20261028    gcc-14
x86_64                randconfig-1009-20261029    gcc-14
x86_64                randconfig-1010-20261028    gcc-14
x86_64                randconfig-1010-20261029    gcc-14
x86_64                randconfig-1011-20261028    gcc-14
x86_64                randconfig-1011-20261029    gcc-14
x86_64                randconfig-1012-20261028    gcc-12
x86_64                randconfig-1012-20261029    clang-22
x86_64                randconfig-1013-20261028    gcc-12
x86_64                randconfig-1013-20261029    clang-22
x86_64                randconfig-1014-20261028    gcc-12
x86_64                randconfig-1014-20261029    clang-22
x86_64                randconfig-1015-20261028    gcc-12
x86_64                randconfig-1015-20261029    clang-22
x86_64                randconfig-1016-20261028    gcc-12
x86_64                randconfig-1016-20261029    clang-22
x86_64                randconfig-1017-20261028    gcc-12
x86_64                randconfig-1017-20261029    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   cadence_csp_defconfig    clang-24
xtensa                randconfig-1000-20261028    gcc-12
xtensa                randconfig-1000-20261029    clang-24
xtensa                randconfig-1001-20261028    gcc-12
xtensa                randconfig-1001-20261029    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

