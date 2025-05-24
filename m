Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFD3C54ED1
	for <ath12k@archiver.kernel.org>; Sat, 24 May 2025 19:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fwDXOXhZPt7g1HzTTZUmQWsWljg1HVgJMix+C4TTEF4=; b=Bkpg2mq7DEbrLz833GjnMMlTaA
	h9/h6iqhiTZgF2l7t3JUJvBAb/NEfVm2PyGYoi2UwN3X2aTZs4KMBFhOSRcpANynRSDCpJ0hKJaoQ
	+4N24YXPIGcosHLweMOQ6n7L8Wh70lJa2t4mDibkwADaWoVOT30Jhn+lGw8bR9RRjxbSZ2/8DVY0u
	zquenZWrffSIc5KCSZmOo/eX3WpbYqKBM8tx5i4TF2yqtXp/ltkZGKJThbzqqlHGyjwjaVLhBRmK7
	MP+q4N5gk2T/YGYtnw0pfahXJu02jRfhy5nb2baei8q1jRhGhyzrRcdo9uHCUcgLVpYso9lBBSQIM
	PqucSpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIupN-00000006Cxp-2d7M;
	Sat, 24 May 2025 19:46:41 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIupK-00000006CwM-1OUY
	for ath12k@lists.infradead.org;
	Sat, 24 May 2025 19:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748115998; x=1779651998;
  h=date:from:to:cc:subject:message-id;
  bh=QLq7X76AnmhOd7vxIUoBhljiBxg5HJFpTLeN+/mnu/4=;
  b=lUSGI+JsqQHmvUYRpy1jWGsBYgUIl10vLrXwp2BbkWxPDxJ2bRg5oLqS
   i8ZAcOY+ve/LhCrV/jcOiaiOvXsCxoWMCvbvLmPXEhDeSR3vMboadlH0S
   kwZiwNJyxNFMgzoktID7lLjcecdjekINGoGDwc9X/+hMvKbG+rrLwm8Y+
   1IGLTs8MkphfpDVjGCp8gSbvsL3wnAXOF1O4p/KPFPtNcXUpyRgdV2FYf
   YlaGjbJkDFolwGVKgGYAHhq1M/ArN8bbWo2ATdnaaEBgJXB/aLzm9Erx/
   voCaqmyENgVb23UwheL4sD0yZ8ogYdRbj8j8Cl3PT0d9f/O6+1zvBKxz9
   w==;
X-CSE-ConnectionGUID: qwveW1rlQMWhqLhMLNHFTg==
X-CSE-MsgGUID: I5VQWoCCRTeZpIXEGHuMAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="53945713"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="53945713"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 12:46:31 -0700
X-CSE-ConnectionGUID: O5PEfeK3RmSg0ogHOsEQ8w==
X-CSE-MsgGUID: KjcmTMzKRQedBfZ/YiAeUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141552287"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 May 2025 12:46:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIup9-000RQu-2w;
	Sat, 24 May 2025 19:46:27 +0000
Date: Sun, 25 May 2025 03:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-ng] BUILD SUCCESS WITH WARNING
 5bac8411df2e147f11875a88c4d6c36fcedd27df
Message-ID: <202505250308.gx0BKaNK-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_124638_446944_82B0E458 
X-CRM114-Status: UNSURE (   2.63  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-ng
branch HEAD: 5bac8411df2e147f11875a88c4d6c36fcedd27df  wifi: ath12k: Use dp objects in performance critical paths

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202505240842.3pOJN2OV-lkp@intel.com

    drivers/net/wireless/ath/ath12k/dp_htt.c:192:24: warning: variable 'sta' set but not used [-Wunused-but-set-variable]
    drivers/net/wireless/ath/ath12k/dp_htt.c:192:31: warning: variable 'sta' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- alpha-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- arc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- arm-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- arm64-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- i386-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- loongarch-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- loongarch-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- microblaze-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- microblaze-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- openrisc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- parisc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- riscv-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- sparc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
|-- x86_64-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used
`-- x86_64-allyesconfig
    `-- drivers-net-wireless-ath-ath12k-dp_htt.c:warning:variable-sta-set-but-not-used

elapsed time: 1425m

configs tested: 126
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arc                   randconfig-001-20250524    gcc-15.1.0
arc                   randconfig-002-20250524    gcc-15.1.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-19
arm                         nhk8815_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250524    gcc-7.5.0
arm                   randconfig-002-20250524    gcc-7.5.0
arm                   randconfig-003-20250524    clang-20
arm                   randconfig-004-20250524    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250524    gcc-5.5.0
arm64                 randconfig-002-20250524    gcc-7.5.0
arm64                 randconfig-003-20250524    clang-19
arm64                 randconfig-004-20250524    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250524    gcc-11.5.0
csky                  randconfig-002-20250524    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250524    clang-21
hexagon               randconfig-002-20250524    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250524    clang-20
i386        buildonly-randconfig-002-20250524    gcc-12
i386        buildonly-randconfig-003-20250524    gcc-12
i386        buildonly-randconfig-004-20250524    gcc-12
i386        buildonly-randconfig-005-20250524    clang-20
i386        buildonly-randconfig-006-20250524    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250524    gcc-13.3.0
loongarch             randconfig-002-20250524    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250524    gcc-13.3.0
nios2                 randconfig-002-20250524    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250524    gcc-6.5.0
parisc                randconfig-002-20250524    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                      pasemi_defconfig    clang-21
powerpc                      pcm030_defconfig    clang-21
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250524    gcc-5.5.0
powerpc               randconfig-002-20250524    gcc-7.5.0
powerpc               randconfig-003-20250524    clang-21
powerpc64             randconfig-001-20250524    gcc-7.5.0
powerpc64             randconfig-002-20250524    gcc-10.5.0
powerpc64             randconfig-003-20250524    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250524    clang-21
riscv                 randconfig-002-20250524    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250524    clang-17
s390                  randconfig-002-20250524    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250524    gcc-13.3.0
sh                    randconfig-002-20250524    gcc-7.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250524    gcc-6.5.0
sparc                 randconfig-002-20250524    gcc-6.5.0
sparc64               randconfig-001-20250524    gcc-8.5.0
sparc64               randconfig-002-20250524    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250524    gcc-12
um                    randconfig-002-20250524    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250524    gcc-12
x86_64      buildonly-randconfig-002-20250524    gcc-12
x86_64      buildonly-randconfig-003-20250524    gcc-12
x86_64      buildonly-randconfig-004-20250524    gcc-12
x86_64      buildonly-randconfig-005-20250524    gcc-11
x86_64      buildonly-randconfig-006-20250524    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250524    gcc-8.5.0
xtensa                randconfig-002-20250524    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

