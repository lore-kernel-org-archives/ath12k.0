Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA13D44D64
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S6CYIgSSWblK7fg5rCeONpIb8zvjX8CZvBzmIWczdOc=; b=sFCPC9IhXVbrAPangi+DxwQN/J
	69gbckKblVwaGjZFlYGmZ6ZKDWtISQ/VXS5P+59s+2WkJsHwsGiiyODkjs56b8UrulOi8N7hEjfLv
	X7yR9ooROz4uxRdIt3Rx2d0yiYXsFvXDFPWsF0dW8cJ5H6awxgQwv051lg7GCI/8LoWLHEr2WpfsY
	vDFhRK37U5VSvbhGUWw7o0CznC//F6HnXsQzBJy8b9QiYiVTD4ZFxOfUQMZhxaQ8lW5G+CyEIZEMX
	eY+XxSDxFcq8LbWi8V80dgxiE2HFeuPA8f03eutvROIEgHumJNB3ZCuEcFSz0BYyjlEkNfsPUcY2+
	v2yIUUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gOl-00000003UFU-2JlL
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 13:48:39 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8g09-00000003PFT-0oox
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 13:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730899393; x=1762435393;
  h=date:from:to:cc:subject:message-id;
  bh=zWJAJK3rYxMoC+DKShKQYTbVZbipJVYQu6WJRQfZ9Ac=;
  b=Lk98rr1/HDxuq9CxNujmyvwR7m96ku5PIiXXU7BLoSbpJS89NbQvl/e5
   h4Yys003ZcSTYGxCRseugvkWirwekQdx+tNxsIsEsfr6d1V3c5mSdd8CT
   +Dk3RHvK2KBC2W2gGVPADrk3jX6S+ez6HHKWreNtlVImestsce8SI74fw
   toSUsNQS2FzNpv5S6X7STnFwbYJembUEr3npfnq3Clpop4v1sTT5FiYgf
   z/9XT4zjhWRP4rADOZE8lofG4GKyE2FLHPl33ZFXkLDir4biBgXmA6Dro
   86GqKbJlDvl4+RjpoujrU8Qs2LA/DGcFJ/TPh6R4uZRV2govYJ009mlaQ
   A==;
X-CSE-ConnectionGUID: HVS/O6cSR9CZBChSor6XMQ==
X-CSE-MsgGUID: 2pde9pBDQu+OeRiLGAy0xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42095344"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42095344"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:23:10 -0800
X-CSE-ConnectionGUID: DbdaK9D4TWSDHAgbLkOe0g==
X-CSE-MsgGUID: D2k8ziqvStC8ZhydSeOddQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84894621"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 05:23:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8g02-000ol6-1F;
	Wed, 06 Nov 2024 13:23:06 +0000
Date: Wed, 06 Nov 2024 21:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 f27e4f14a5788bb3a63af76455576307e181c1e3
Message-ID: <202411062100.55xuScvb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_052313_309078_0B9D04F2 
X-CRM114-Status: UNSURE (   4.26  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
branch HEAD: f27e4f14a5788bb3a63af76455576307e181c1e3  wifi: ath12k: ath12k_mac_op_sta_rc_update(): use mac80211 provided link id

elapsed time: 1045m

configs tested: 142
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                   randconfig-001-20241106    gcc-13.2.0
arc                   randconfig-002-20241106    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-20
arm                   randconfig-001-20241106    gcc-14.2.0
arm                   randconfig-002-20241106    clang-20
arm                   randconfig-003-20241106    clang-20
arm                   randconfig-004-20241106    clang-17
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241106    gcc-14.2.0
arm64                 randconfig-002-20241106    gcc-14.2.0
arm64                 randconfig-003-20241106    clang-20
arm64                 randconfig-004-20241106    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241106    gcc-14.2.0
csky                  randconfig-002-20241106    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241106    clang-14
hexagon               randconfig-002-20241106    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241106    clang-19
i386        buildonly-randconfig-002-20241106    clang-19
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-004-20241106    clang-19
i386        buildonly-randconfig-005-20241106    clang-19
i386        buildonly-randconfig-006-20241106    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241106    clang-19
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-005-20241106    clang-19
i386                  randconfig-006-20241106    clang-19
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-015-20241106    clang-19
i386                  randconfig-016-20241106    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241106    gcc-14.2.0
loongarch             randconfig-002-20241106    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241106    gcc-14.2.0
nios2                 randconfig-002-20241106    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241106    gcc-14.2.0
parisc                randconfig-002-20241106    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                      bamboo_defconfig    clang-20
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241106    gcc-14.2.0
powerpc               randconfig-002-20241106    gcc-14.2.0
powerpc               randconfig-003-20241106    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241106    clang-20
powerpc64             randconfig-002-20241106    clang-20
powerpc64             randconfig-003-20241106    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20241106    gcc-14.2.0
riscv                 randconfig-002-20241106    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                  randconfig-001-20241106    gcc-14.2.0
s390                  randconfig-002-20241106    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.1.0
sh                    randconfig-001-20241106    gcc-14.2.0
sh                    randconfig-002-20241106    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241106    gcc-14.2.0
sparc64               randconfig-002-20241106    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                    randconfig-001-20241106    clang-20
um                    randconfig-002-20241106    clang-17
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241106    clang-19
x86_64      buildonly-randconfig-002-20241106    clang-19
x86_64      buildonly-randconfig-003-20241106    clang-19
x86_64      buildonly-randconfig-004-20241106    gcc-12
x86_64      buildonly-randconfig-005-20241106    gcc-12
x86_64      buildonly-randconfig-006-20241106    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241106    clang-19
x86_64                randconfig-002-20241106    gcc-11
x86_64                randconfig-003-20241106    gcc-12
x86_64                randconfig-004-20241106    gcc-12
x86_64                randconfig-005-20241106    clang-19
x86_64                randconfig-006-20241106    gcc-11
x86_64                randconfig-011-20241106    gcc-11
x86_64                randconfig-012-20241106    gcc-12
x86_64                randconfig-013-20241106    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241106    gcc-14.2.0
xtensa                randconfig-002-20241106    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

