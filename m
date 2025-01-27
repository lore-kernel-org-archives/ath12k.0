Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7B9C02188
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/xXzMzCDluRQtgpyEFw4FUZ2YjctkNnbhppkuCIWdY=; b=Ayn1u8MRRNbzLz4qRuJ1kT1Tiq
	U4KjzK5hLKCkvsNKZB4p8p4/x7UTwKb//lVofkxRASyF06p9F7udqFmJtZaE8a+/6me9uG5cgB0dZ
	mndUWufKDMGXexiRD8Cs0OK1t3PlVzEsBu0Nlqr8NTyDg97zT9hc7ct7Q9GMtHkip0NQAgQxgvIwE
	EIDcZHT7EWQrCQ3Rns+8vXv+i9BpVpFEuCw2xgickrTSgDDgrgnst1+RuQccePgoumkpuO3SfBL/f
	neryCJNqBHxtI88zXLgNrWM34pXxPYjG0PshkWHhklYjm52cGK9fdkTKZmkCpwM7ycXoUvfAQuVdi
	NYeSnBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcQdw-00000002YF5-1TJW
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 15:03:16 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcQdu-00000002YEm-0f7R
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 15:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737990194; x=1769526194;
  h=date:from:to:cc:subject:message-id;
  bh=uSEN+y77uCuPZEAlXpNGIfbYoTIEPJ8vSgINrsMVgYM=;
  b=lKKfh8cjmC23JWbUYxSgGZOpkVhnxxQ50qkk8n16QG7BLz1oeTOAfuqF
   6+itYpg2nlkgHJLNYEiBFDEYRTpHK3Sa3+OPt7Dd+wUSI+svFh02ucPcl
   R7egS9CM+EIa9THZ/wZGQnBTZ9L6HruYDYgTM11wKYKhnCTJO8XCh+rZo
   Et5zeiQwyd8f+chwjfD2mlDUUMrvL5sh+ez0yD+E8pWYwYDLZI5kfOHUG
   i0PnC7/Nm/oEVg3aGzke/KOWimc3apHf/+kNUW7QyOu2s6gc6UxDC0top
   544jA6A8xFNwBAG1Ty6MXUBm5+MbnJ71II2+EC9qKzpDcS0gDub62CeNe
   Q==;
X-CSE-ConnectionGUID: 1SCRDBgDSri8YT9ZZ81eAg==
X-CSE-MsgGUID: P5Bp1hvPR/S1a27QH3ei8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42208654"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="42208654"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 07:03:13 -0800
X-CSE-ConnectionGUID: dwEjNNX+T92R8t7Txha7HA==
X-CSE-MsgGUID: guavD8RuQCqSs654Dfw5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139313950"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2025 07:03:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcQdp-000gs5-36;
	Mon, 27 Jan 2025 15:03:09 +0000
Date: Mon, 27 Jan 2025 23:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 30cfef18ac9412a239ead848ed36cec2bb754b25
Message-ID: <202501272329.8hAZ0eLS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_070314_241694_9E32724F 
X-CRM114-Status: UNSURE (   4.00  )
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
branch HEAD: 30cfef18ac9412a239ead848ed36cec2bb754b25  wifi: ath12k: reset MLO global memory during recovery

elapsed time: 720m

configs tested: 129
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250127    gcc-13.2.0
arc                   randconfig-002-20250127    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250127    gcc-14.2.0
arm                   randconfig-002-20250127    gcc-14.2.0
arm                   randconfig-003-20250127    clang-16
arm                   randconfig-004-20250127    clang-18
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250127    gcc-14.2.0
arm64                 randconfig-002-20250127    gcc-14.2.0
arm64                 randconfig-003-20250127    gcc-14.2.0
arm64                 randconfig-004-20250127    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250127    gcc-14.2.0
csky                  randconfig-002-20250127    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250127    clang-17
hexagon               randconfig-002-20250127    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250127    gcc-12
i386        buildonly-randconfig-002-20250127    clang-19
i386        buildonly-randconfig-003-20250127    gcc-12
i386        buildonly-randconfig-004-20250127    gcc-12
i386        buildonly-randconfig-005-20250127    gcc-12
i386        buildonly-randconfig-006-20250127    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250127    gcc-14.2.0
loongarch             randconfig-002-20250127    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250127    gcc-14.2.0
nios2                 randconfig-002-20250127    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250127    gcc-14.2.0
parisc                randconfig-002-20250127    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   currituck_defconfig    clang-17
powerpc                       eiger_defconfig    clang-17
powerpc                    gamecube_defconfig    clang-16
powerpc                     mpc5200_defconfig    clang-20
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250127    clang-16
powerpc               randconfig-002-20250127    gcc-14.2.0
powerpc               randconfig-003-20250127    gcc-14.2.0
powerpc                     taishan_defconfig    clang-17
powerpc                     tqm8541_defconfig    clang-15
powerpc64                        alldefconfig    clang-20
powerpc64             randconfig-001-20250127    gcc-14.2.0
powerpc64             randconfig-002-20250127    gcc-14.2.0
powerpc64             randconfig-003-20250127    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250127    clang-20
riscv                 randconfig-002-20250127    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250127    clang-20
s390                  randconfig-002-20250127    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250127    gcc-14.2.0
sh                    randconfig-002-20250127    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250127    gcc-14.2.0
sparc                 randconfig-002-20250127    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250127    gcc-14.2.0
sparc64               randconfig-002-20250127    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250127    clang-20
um                    randconfig-002-20250127    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250127    clang-19
x86_64      buildonly-randconfig-002-20250127    clang-19
x86_64      buildonly-randconfig-003-20250127    clang-19
x86_64      buildonly-randconfig-004-20250127    clang-19
x86_64      buildonly-randconfig-005-20250127    gcc-12
x86_64      buildonly-randconfig-006-20250127    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250127    gcc-14.2.0
xtensa                randconfig-002-20250127    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

