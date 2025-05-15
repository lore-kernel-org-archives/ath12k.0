Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59543C3ABC9
	for <ath12k@archiver.kernel.org>; Thu, 15 May 2025 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TqyfRhmdztqUVZuvB7CZWiUpCT9sdON1Q9XYxqwHuyU=; b=UxPE+ofdYA6+L3vV6H+1POizq6
	9jrYejtEtlZtNAvhyFBgqD2Ov7xUnD7JEwJyWPlBlWnHJDBrXc+PzlqBJ7OBJGC7CmvEYFeEKX61o
	QIBbCWMG16a6tXfiQCe9av0hRoI5dtGUbjh98gAKT34YuY0RK9fPC56kJB9Lgd4xKNlzlGteuSNT5
	5M6G+xEuP7HHARmt15Lw+VkASTzIYAwoTAlcdCfdPFbb3dl3sp4CwSjaEKE56s9xz75yZpft9MKl9
	FXyBSNR0kggl1a8aICvPcguJ2rbDGFtva/eUs7D/m/4v2Ox9ugvNYQj1OOzwNMtDKfH4vkiSAKkB4
	qBupgrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXyi-00000000bgG-46Px;
	Thu, 15 May 2025 12:46:24 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXw4-00000000b1P-3qg5
	for ath12k@lists.infradead.org;
	Thu, 15 May 2025 12:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747313021; x=1778849021;
  h=date:from:to:cc:subject:message-id;
  bh=wqJTo99F+iI3oRMc3/HM8AB5LKCG5zKsds3oeimQzGA=;
  b=fGYu1HqF6WN1i4mGe6gk0KWjGeANDa6ZoqQXP6znw6bn2m0XU3D97eOm
   K5KlPmbelx1WMXfYIADqLAxe2XmEml9ckuOes5TY1k2lV8io9tnJRBIVv
   N5/KlQpWfNyuneaGnQ3IYh6h+vo9AYD3Hpd7/gjfQ0IM4HhbwylFdoOKb
   29wBqMB83ZeXS3VWhFpXzhTx3vRWy8MiP8DberkSGeOoKNt+WM2noy3d/
   ail9kM0RsbY/YUiElXa0bLIL1dkRmYvOuODPP8PQ+ZHN6AHQ4epA74J9h
   lEOEnmyAVgtJootbf8uk2SGR2R1wBPQVGiTvOdI1hcWhKdXvPWQA3DG54
   g==;
X-CSE-ConnectionGUID: UB65p3ZjSny8+c4S1kchhw==
X-CSE-MsgGUID: 0D0YkvW2T+2xZbiYb9cwpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48930448"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48930448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:43:40 -0700
X-CSE-ConnectionGUID: rC1vsdS/Ts+bpssdPSa7ZA==
X-CSE-MsgGUID: FgOHU0CzTwih7KezKUh7ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143126663"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 May 2025 05:43:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFXw0-000INv-1W;
	Thu, 15 May 2025 12:43:36 +0000
Date: Thu, 15 May 2025 20:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 262410b82adaae553de0e4a66ce71859aeb6d263
Message-ID: <202505152025.dpkP1Ral-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_054340_990042_DBD604EE 
X-CRM114-Status: UNSURE (   3.59  )
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
branch HEAD: 262410b82adaae553de0e4a66ce71859aeb6d263  Merge branch 'pending' into main-pending

elapsed time: 1297m

configs tested: 117
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250514    gcc-13.3.0
arc                   randconfig-001-20250515    gcc-12.4.0
arc                   randconfig-002-20250514    gcc-14.2.0
arc                   randconfig-002-20250515    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250514    clang-21
arm                   randconfig-001-20250515    clang-21
arm                   randconfig-002-20250514    clang-21
arm                   randconfig-002-20250515    gcc-8.5.0
arm                   randconfig-003-20250514    gcc-7.5.0
arm                   randconfig-003-20250515    gcc-8.5.0
arm                   randconfig-004-20250514    gcc-7.5.0
arm                   randconfig-004-20250515    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250514    clang-17
arm64                 randconfig-001-20250515    clang-21
arm64                 randconfig-002-20250514    gcc-5.5.0
arm64                 randconfig-002-20250515    clang-21
arm64                 randconfig-003-20250514    gcc-5.5.0
arm64                 randconfig-003-20250515    clang-20
arm64                 randconfig-004-20250514    clang-21
arm64                 randconfig-004-20250515    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250515    gcc-14.2.0
csky                  randconfig-002-20250515    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250515    clang-16
hexagon               randconfig-002-20250515    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250514    clang-20
i386        buildonly-randconfig-002-20250514    gcc-12
i386        buildonly-randconfig-003-20250514    clang-20
i386        buildonly-randconfig-004-20250514    clang-20
i386        buildonly-randconfig-005-20250514    gcc-12
i386        buildonly-randconfig-006-20250514    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250515    gcc-12.4.0
loongarch             randconfig-002-20250515    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250515    gcc-12.4.0
nios2                 randconfig-002-20250515    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250515    gcc-13.3.0
parisc                randconfig-002-20250515    gcc-13.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250515    gcc-8.5.0
powerpc               randconfig-002-20250515    gcc-6.5.0
powerpc               randconfig-003-20250515    clang-21
powerpc64             randconfig-001-20250515    clang-21
powerpc64             randconfig-002-20250515    gcc-8.5.0
powerpc64             randconfig-003-20250515    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250515    gcc-8.5.0
riscv                 randconfig-002-20250515    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250515    clang-21
s390                  randconfig-002-20250515    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250515    gcc-14.2.0
sh                    randconfig-002-20250515    gcc-10.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250515    gcc-6.5.0
sparc                 randconfig-002-20250515    gcc-10.3.0
sparc64               randconfig-001-20250515    gcc-9.3.0
sparc64               randconfig-002-20250515    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250515    gcc-12
um                    randconfig-002-20250515    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250515    clang-20
x86_64      buildonly-randconfig-002-20250515    clang-20
x86_64      buildonly-randconfig-003-20250515    clang-20
x86_64      buildonly-randconfig-004-20250515    clang-20
x86_64      buildonly-randconfig-005-20250515    clang-20
x86_64      buildonly-randconfig-006-20250515    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250515    gcc-14.2.0
xtensa                randconfig-002-20250515    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

