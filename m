Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AC7C83F20
	for <ath12k@archiver.kernel.org>; Sat, 12 Jul 2025 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/BewIpMaoXoHfZaki+ylWAwQ7NNNBg+kww0jtAJzqc=; b=SOXfWEsZIPAMcpQ8wHGsINIUef
	u9jSQu5iba4mbS9CyfIt1pP6ZoZAerBwyW6hzcmWLXd0vwLQgoQ9hmBphl6MpcUo1m4EKPFIJ3DsB
	X3IzqjrGQvYUV5A5wABmzmdiYGSeICBH2EPwDM6o4lfuwr0i2gOHSPn1/+qWkajFvnfNDWwAXi0nN
	VNMTuZS4z3ZPSRtzptAELBKQeghxSqtSFzwqcPWaRpHyHqJ4wEh1HxCqcggTI+ii+HioHJL21O5XU
	W9cfl1mGCg87Fc3UTG6U2TyBfl/L+P58wfkflOfqPRKOD4QLBSAYDEThzcHqRvMoHLuvqj5nhnI9S
	4a+rawwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaYNK-0000000Gb3o-3MbB;
	Sat, 12 Jul 2025 11:26:38 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaYNI-0000000Gb37-2umY
	for ath12k@lists.infradead.org;
	Sat, 12 Jul 2025 11:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752319597; x=1783855597;
  h=date:from:to:cc:subject:message-id;
  bh=WDQppHL3ZXDc0crNDqKBLAm1Jhot5/m9zWdI6xUQVzQ=;
  b=Ms/0SK+JlJjBDbLf+AsiQxSwd9uy0PYaNvcLxJFaLcvVYFrqicQf8RCx
   TlTrs19qFbAwrWkPR93F3WbJU4tE9EzlYPry6poj1cWvSrRnszYEEiPgM
   NUgocnIkMeyNnXvZXv2wlVtXkEQ1kOsD64S3p8W5w6Z1T5bAIoF2e711v
   5yAhmH6e0jR7TLQJyHpZITuZGCS/D+JA4bYsOG+TDtk5ji6sdw0/ddO7Y
   nQfFtUFxwF6iwQzb8/ytuKKLoCEEZJTmEp1xWycnaBpO5QC1MOtaXyqB5
   C1vvn/i2XfoGaT3Bl1NO/aX4xdoZDNewLYEWiiaAt75SzOe3TyOpEoXte
   w==;
X-CSE-ConnectionGUID: DpIw//xnTDGrScZFwGT+IQ==
X-CSE-MsgGUID: Rv9KG9FVR/GshXTJduk7SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77134011"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="77134011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 04:26:34 -0700
X-CSE-ConnectionGUID: jmBzc4qnR0eToPZUnZzyCA==
X-CSE-MsgGUID: 21w4AgX2Ti6vD+ex09qdNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="156646080"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2025 04:26:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaYNC-0007Ht-1i;
	Sat, 12 Jul 2025 11:26:30 +0000
Date: Sat, 12 Jul 2025 19:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 979c5ce4a37680063d87fe13d662ed68e06e77c3
Message-ID: <202507121933.3Gku3nFB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_042636_831528_1E08BC7C 
X-CRM114-Status: UNSURE (   4.28  )
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
branch HEAD: 979c5ce4a37680063d87fe13d662ed68e06e77c3  wifi: ath12k: support average ack rssi in station dump

elapsed time: 1092m

configs tested: 119
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250712    gcc-10.5.0
arc                   randconfig-002-20250712    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250712    gcc-8.5.0
arm                   randconfig-002-20250712    gcc-10.5.0
arm                   randconfig-003-20250712    clang-21
arm                   randconfig-004-20250712    clang-21
arm                        spear6xx_defconfig    clang-21
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250712    gcc-12.3.0
arm64                 randconfig-002-20250712    gcc-12.3.0
arm64                 randconfig-003-20250712    gcc-8.5.0
arm64                 randconfig-004-20250712    gcc-13.4.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250712    gcc-14.3.0
csky                  randconfig-002-20250712    gcc-11.5.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250712    clang-21
hexagon               randconfig-002-20250712    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250712    clang-20
i386        buildonly-randconfig-002-20250712    gcc-11
i386        buildonly-randconfig-003-20250712    gcc-12
i386        buildonly-randconfig-004-20250712    gcc-12
i386        buildonly-randconfig-005-20250712    gcc-12
i386        buildonly-randconfig-006-20250712    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250712    gcc-15.1.0
loongarch             randconfig-002-20250712    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250712    gcc-11.5.0
nios2                 randconfig-002-20250712    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250712    gcc-8.5.0
parisc                randconfig-002-20250712    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    clang-21
powerpc               randconfig-001-20250712    gcc-15.1.0
powerpc               randconfig-002-20250712    gcc-8.5.0
powerpc               randconfig-003-20250712    clang-21
powerpc                     sequoia_defconfig    clang-17
powerpc                     skiroot_defconfig    clang-21
powerpc64             randconfig-001-20250712    gcc-8.5.0
powerpc64             randconfig-002-20250712    clang-21
powerpc64             randconfig-003-20250712    clang-19
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250712    gcc-8.5.0
riscv                 randconfig-002-20250712    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250712    clang-21
s390                  randconfig-002-20250712    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250712    gcc-15.1.0
sh                    randconfig-002-20250712    gcc-14.3.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250712    gcc-13.4.0
sparc                 randconfig-002-20250712    gcc-15.1.0
sparc64               randconfig-001-20250712    clang-20
sparc64               randconfig-002-20250712    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250712    gcc-12
um                    randconfig-002-20250712    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250712    gcc-12
x86_64      buildonly-randconfig-002-20250712    gcc-12
x86_64      buildonly-randconfig-003-20250712    clang-20
x86_64      buildonly-randconfig-004-20250712    clang-20
x86_64      buildonly-randconfig-005-20250712    gcc-12
x86_64      buildonly-randconfig-006-20250712    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250712    gcc-8.5.0
xtensa                randconfig-002-20250712    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

