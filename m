Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C88EE7718B
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 19:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/jdtza4J0HcLrg7dBw365Dk3J7qwblCOJKy5ujXz2vA=; b=R/viGtGZY3GyeFeYRCVLmUTcrz
	mz/qII27+Yh8x4NO4pxi3MW5utIFY2hSelwTQta56szdPy3FuVqH37S4KsbbCSlVMjtUz693WBB53
	kBmd8Jog/gZVji74wNyFSpcl5zuNnTOszbOhFMtTCH/Y1ONyF3lK1JE1CrtuCjf+Tc6HdJIOnavTZ
	4WilKKWC1u9gJ2u4CuG6/cyrYt5pIqy6UXNGYF3fe4boFZweBXVEaAdn/pRc/Vzho2pnASwO0FJPx
	YkPMekOEYBQ9UuGXgY4vI4BQF4RbmWIXEKaw0qF0YnDJy5WMoT9UXytQuOQ+GrGj8+iPmOnR/V+wS
	yhqZcdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP5CT-00000007M3t-14oX
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 19:31:45 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP5CQ-00000007M3J-0MP9
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 19:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734809502; x=1766345502;
  h=date:from:to:cc:subject:message-id;
  bh=4Y3ZpvIz2eREsLjOYS48eKkI+eugunPTZeCTmJIKS+o=;
  b=YsWNmEIfjEeRwB6FITx7bZWw5Dm6bYIAlyz5HzfCEhaXQeIBioMHrOxp
   L/phnz6L9X1MQ4jfkDQakGJ3Ehhu2pzuv9b8s77TOoMJ2Xyadsu0xZpt8
   3JiE8+bdSW8hy60OyL3s7sy1PVitqoBY6LFcbznVYGdfv8w495tR6wwtm
   hwvgtFPpNXIL3o6OiUlDjDZorYj6HmAq+UmI5o40h0EM0EmyAbTh2X+6O
   C1F5DsxXZ7SroicfAahfAmjkN/jZ+Q2q6SttE27NZIjhnRbtqjW4mOo/D
   OY+ea0bP6qBAxjkMDm59+Sz6Xij/8aFpltww/PIRCk+t6nCOEZ1OfC7j6
   Q==;
X-CSE-ConnectionGUID: QPspre+qTmGtUo/lXgt5iw==
X-CSE-MsgGUID: aIBrFPfpS6qN8zi2ncDepg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35221765"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35221765"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 11:31:37 -0800
X-CSE-ConnectionGUID: ZHrYjDtLQ9+C9k9fq914SA==
X-CSE-MsgGUID: Yk13KgppRwCS0SZVIBUitw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98633304"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2024 11:31:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP5CI-0002QR-0s;
	Sat, 21 Dec 2024 19:31:34 +0000
Date: Sun, 22 Dec 2024 03:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 c10402121a2490027ab116465ef088d4bf56d201
Message-ID: <202412220316.1ii3Offx-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_113142_181629_7B9FB529 
X-CRM114-Status: UNSURE (   3.18  )
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
branch HEAD: c10402121a2490027ab116465ef088d4bf56d201  wifi: ath12k: set flag for mgmt no-ack frames in Tx completion

elapsed time: 1444m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241221    gcc-13.2.0
arc                   randconfig-002-20241221    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-20
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20241221    gcc-14.2.0
arm                   randconfig-002-20241221    gcc-14.2.0
arm                   randconfig-003-20241221    gcc-14.2.0
arm                   randconfig-004-20241221    clang-18
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241221    clang-18
arm64                 randconfig-002-20241221    clang-16
arm64                 randconfig-003-20241221    clang-20
arm64                 randconfig-004-20241221    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241221    gcc-14.2.0
csky                  randconfig-002-20241221    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-002-20241221    clang-20
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20241221    gcc-12
i386        buildonly-randconfig-002-20241221    gcc-12
i386        buildonly-randconfig-003-20241221    clang-19
i386        buildonly-randconfig-004-20241221    clang-19
i386        buildonly-randconfig-005-20241221    clang-19
i386        buildonly-randconfig-006-20241221    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241221    gcc-14.2.0
loongarch             randconfig-002-20241221    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-20
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241221    gcc-14.2.0
nios2                 randconfig-002-20241221    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241221    gcc-14.2.0
parisc                randconfig-002-20241221    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        icon_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241221    gcc-14.2.0
powerpc               randconfig-002-20241221    gcc-14.2.0
powerpc               randconfig-003-20241221    gcc-14.2.0
powerpc64             randconfig-001-20241221    gcc-14.2.0
powerpc64             randconfig-002-20241221    gcc-14.2.0
powerpc64             randconfig-003-20241221    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241221    gcc-14.2.0
riscv                 randconfig-002-20241221    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241221    gcc-14.2.0
s390                  randconfig-002-20241221    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20241221    gcc-14.2.0
sh                    randconfig-002-20241221    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241221    gcc-14.2.0
sparc                 randconfig-002-20241221    gcc-14.2.0
sparc64               randconfig-001-20241221    gcc-14.2.0
sparc64               randconfig-002-20241221    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241221    clang-18
um                    randconfig-002-20241221    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20241221    gcc-12
x86_64      buildonly-randconfig-002-20241221    gcc-12
x86_64      buildonly-randconfig-003-20241221    gcc-12
x86_64      buildonly-randconfig-004-20241221    gcc-12
x86_64      buildonly-randconfig-005-20241221    gcc-11
x86_64      buildonly-randconfig-006-20241221    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241221    gcc-14.2.0
xtensa                randconfig-002-20241221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

