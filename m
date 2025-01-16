Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FB3C02180
	for <ath12k@archiver.kernel.org>; Thu, 16 Jan 2025 02:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iu7om/SebUCXo6ziRpBfBedV/9GUWjYb6Kv8eQ2mZVM=; b=EQmpMfnEdY6Vc530zq5mfD5+rl
	AfA7VTu8Hc3PN2bYU+3yoH8fRl7pLDIIHlrleSTk1Am7DUsDA9CtwktIxzrkvLe86eJPwGi3egxUT
	cGb7WSZFSP3XKK5rDvVzU/PuZLIiaWAvekpC4gtFzSRt+9/l8/RvPVrGkkLXezMtDP75+NFCBMj7f
	j8/Vy8tTHOjWFMlIyvJqqFhCZj6GJqacWhF7cWbHiywpLvXwltPiHg6NCQ1qU5lV8ByxNBtj06QAm
	NgEaWRyy6t38Qv0huIyFsu+Wk5S653eZ6ERPDhbpBaHIb9QAv9W+qvbmyQ/r63PG5Hm0wHWEGxblf
	7WsIn/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFZi-0000000DdYH-0zQG
	for ath12k@archiver.kernel.org;
	Thu, 16 Jan 2025 02:25:38 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFZM-0000000DdWv-47yD
	for ath12k@lists.infradead.org;
	Thu, 16 Jan 2025 02:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736994317; x=1768530317;
  h=date:from:to:cc:subject:message-id;
  bh=3kqF1qkhrTTxyjWogEpj56jPcz91BgXKcWRzASYixvQ=;
  b=Ny44xN24aI+kgM9JCHq3YbVUxWE5p+5zN/VJli8I6DnXTPsC4kjHyI2u
   RW49sJZlpOxKfRQ5oxF7DYJDc5bdjb7jvs6N7PXHlkQ8bm01Irofgj2gH
   33IUk1O2bgmdHttYNVsdAnbc+bdKmyby1K8Dj3RAuwggX2F7yKEpOW2gk
   wgmXWY4EoznoQ3//2SxsjvDYzM/DIl2wjTu+E9oeTYWbxW1d84MkartdP
   5iLfoLq1QvvZKz78VhKxiPOTXWvIFXZuHfN16jHHFzgc/cJgWxuq5UKPg
   9arHAiQGHIaOTJHGQiIXjK8dR3i857NDfgneGDoMhOv6ZTiZ1fqLp601v
   A==;
X-CSE-ConnectionGUID: Ttl64DlYRCifMy0FE3U1hA==
X-CSE-MsgGUID: 3pBWrZvpS1+aquO4bCYFMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="54899297"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="54899297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 18:25:16 -0800
X-CSE-ConnectionGUID: eD1Xb42nSr62r1q5Hrh4mQ==
X-CSE-MsgGUID: MJCoAX2yTie6XgbuYxbJHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128590752"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jan 2025 18:25:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYFZI-000R9U-3C;
	Thu, 16 Jan 2025 02:25:12 +0000
Date: Thu, 16 Jan 2025 10:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 2d17dd7f1c17c36e0354a7e14c00875424506be6
Message-ID: <202501161034.AUd40lgf-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_182517_085695_280CB3B6 
X-CRM114-Status: UNSURE (   3.89  )
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
branch HEAD: 2d17dd7f1c17c36e0354a7e14c00875424506be6  Merge branch 'pending' into main-pending

elapsed time: 1456m

configs tested: 114
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250115    gcc-13.2.0
arc                   randconfig-002-20250115    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-20
arm                          exynos_defconfig    clang-20
arm                            mmp2_defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-20
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250115    clang-16
arm                   randconfig-002-20250115    clang-20
arm                   randconfig-003-20250115    clang-20
arm                   randconfig-004-20250115    clang-20
arm                         s3c6400_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250115    clang-20
arm64                 randconfig-002-20250115    gcc-14.2.0
arm64                 randconfig-003-20250115    clang-18
arm64                 randconfig-004-20250115    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250115    gcc-14.2.0
csky                  randconfig-002-20250115    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250115    clang-20
hexagon               randconfig-002-20250115    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250115    clang-19
i386        buildonly-randconfig-002-20250115    gcc-12
i386        buildonly-randconfig-003-20250115    gcc-12
i386        buildonly-randconfig-004-20250115    gcc-12
i386        buildonly-randconfig-005-20250115    gcc-12
i386        buildonly-randconfig-006-20250115    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250115    gcc-14.2.0
loongarch             randconfig-002-20250115    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250115    gcc-14.2.0
nios2                 randconfig-002-20250115    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250115    gcc-14.2.0
parisc                randconfig-002-20250115    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 canyonlands_defconfig    clang-19
powerpc               randconfig-001-20250115    gcc-14.2.0
powerpc               randconfig-002-20250115    gcc-14.2.0
powerpc               randconfig-003-20250115    gcc-14.2.0
powerpc64             randconfig-001-20250115    gcc-14.2.0
powerpc64             randconfig-002-20250115    gcc-14.2.0
powerpc64             randconfig-003-20250115    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250115    gcc-14.2.0
riscv                 randconfig-002-20250115    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250115    clang-20
s390                  randconfig-002-20250115    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250115    gcc-14.2.0
sh                    randconfig-002-20250115    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250115    gcc-14.2.0
sparc                 randconfig-002-20250115    gcc-14.2.0
sparc64               randconfig-001-20250115    gcc-14.2.0
sparc64               randconfig-002-20250115    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250115    clang-18
um                    randconfig-002-20250115    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250115    gcc-12
x86_64      buildonly-randconfig-002-20250115    gcc-12
x86_64      buildonly-randconfig-003-20250115    clang-19
x86_64      buildonly-randconfig-004-20250115    clang-19
x86_64      buildonly-randconfig-005-20250115    gcc-12
x86_64      buildonly-randconfig-006-20250115    clang-19
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250115    gcc-14.2.0
xtensa                randconfig-002-20250115    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

