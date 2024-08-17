Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6888BC52D7D
	for <ath12k@archiver.kernel.org>; Sat, 17 Aug 2024 10:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LYJZRJjXlsTRf+xMZD0djv/QyDBolOt9aWsIm6MkqDI=; b=lV8THKAdTyb86fmb85t8g7rZLi
	3AFYiYHfG0jF3aucSfNGShRxJZAcxCW5ZfaLEF1+q2TL09bpPuYzbKA0Vz+3GqlfAKio+LLSMea6Y
	WC1TAjuYU1jniIsjBL2x7qlr7c/HUUcKat68+5RVS3vf24ntvCYC9F3a3WRc1dttn5o22YLvPTNHi
	a0J202NsTPX5YTdRsSGffeh+su7TuWkojfXuK7cWW2uhPhoBT6yPbb556ph44neNSoeT2u/rsktJB
	34AZ2qP10n7ypZ/ZfrQ+6y+X5Kexyjeg9/FB5gN0R/51HZIVCeAbXdrWv2NqzOEILBK/DWn2p7CkD
	JhloGa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfGsS-0000000F5sZ-0AlM
	for ath12k@archiver.kernel.org;
	Sat, 17 Aug 2024 10:41:44 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfGsN-0000000F5s7-2v4i
	for ath12k@lists.infradead.org;
	Sat, 17 Aug 2024 10:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723891299; x=1755427299;
  h=date:from:to:cc:subject:message-id;
  bh=nbIg9zxatzcZ5+EDOUXVISwa1fgeZsP7sUzl/SsAW8o=;
  b=EVoMZwXCLxC5vUYw5rk4LQDDIvEnnrG+N/Qb4cFdjINnrD8AlaU0OS1r
   otfO/8JH3sDck0qK3CTTBJSJKMzQXG+TpGThUfMsRoLyi4BI9z/VRtVG4
   P/gjYjLHA/kDBCHXUNcQ/9lJNofzmtECd8GqinLeTcHukyynlVQR9p67B
   LEf6SdFdJK5YPiwWDkfrrHlSFNq8iPPgaVrel9XX9SI3t5wmY4DOrC5F7
   vb5cq0eI08UXA0MNhEwPzypuJCIKaCBG19qBfWu5JQgy2HPm2Nly0E8rS
   DYO6wJCzM1CrneT1DOY/0zWiyH48B6cepYD3LqpmM/kwQM5VXIj6O+9dY
   Q==;
X-CSE-ConnectionGUID: iN+zaX/UQFemB6fNdvCccA==
X-CSE-MsgGUID: vd/NXo6FRGi8TKEfNkMoyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39693893"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="39693893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 03:41:34 -0700
X-CSE-ConnectionGUID: EcA13EKhRG2+LQ8hOIfPbQ==
X-CSE-MsgGUID: H/wEuo5uSU2VKkboZPEEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="83117203"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Aug 2024 03:41:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfGsE-0007MI-2Z;
	Sat, 17 Aug 2024 10:41:30 +0000
Date: Sat, 17 Aug 2024 18:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 8a864cd949c0f9d796c3a34602357def151f8546
Message-ID: <202408171810.nNd1daka-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_034139_786941_FC56271A 
X-CRM114-Status: UNSURE (   3.19  )
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
branch HEAD: 8a864cd949c0f9d796c3a34602357def151f8546  Merge branch 'pending' into main-pending

elapsed time: 1399m

configs tested: 234
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240817   gcc-13.2.0
arc                   randconfig-002-20240817   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                        clps711x_defconfig   gcc-13.2.0
arm                         lpc32xx_defconfig   gcc-13.2.0
arm                        multi_v5_defconfig   gcc-13.2.0
arm                   randconfig-001-20240817   gcc-13.2.0
arm                   randconfig-001-20240817   gcc-14.1.0
arm                   randconfig-002-20240817   clang-20
arm                   randconfig-002-20240817   gcc-13.2.0
arm                   randconfig-003-20240817   clang-20
arm                   randconfig-003-20240817   gcc-13.2.0
arm                   randconfig-004-20240817   gcc-13.2.0
arm                   randconfig-004-20240817   gcc-14.1.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                       spear13xx_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240817   clang-20
arm64                 randconfig-001-20240817   gcc-13.2.0
arm64                 randconfig-002-20240817   gcc-13.2.0
arm64                 randconfig-002-20240817   gcc-14.1.0
arm64                 randconfig-003-20240817   gcc-13.2.0
arm64                 randconfig-003-20240817   gcc-14.1.0
arm64                 randconfig-004-20240817   gcc-13.2.0
arm64                 randconfig-004-20240817   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240817   gcc-13.2.0
csky                  randconfig-001-20240817   gcc-14.1.0
csky                  randconfig-002-20240817   gcc-13.2.0
csky                  randconfig-002-20240817   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240817   clang-20
hexagon               randconfig-002-20240817   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240816   gcc-12
i386         buildonly-randconfig-001-20240817   gcc-12
i386         buildonly-randconfig-002-20240816   clang-18
i386         buildonly-randconfig-002-20240817   gcc-12
i386         buildonly-randconfig-003-20240816   clang-18
i386         buildonly-randconfig-003-20240817   gcc-12
i386         buildonly-randconfig-004-20240816   clang-18
i386         buildonly-randconfig-004-20240817   gcc-12
i386         buildonly-randconfig-005-20240816   gcc-11
i386         buildonly-randconfig-005-20240817   gcc-12
i386         buildonly-randconfig-006-20240816   gcc-12
i386         buildonly-randconfig-006-20240817   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240816   clang-18
i386                  randconfig-001-20240817   gcc-12
i386                  randconfig-002-20240816   gcc-12
i386                  randconfig-002-20240817   gcc-12
i386                  randconfig-003-20240816   gcc-11
i386                  randconfig-003-20240817   gcc-12
i386                  randconfig-004-20240816   gcc-12
i386                  randconfig-004-20240817   gcc-12
i386                  randconfig-005-20240816   clang-18
i386                  randconfig-005-20240817   gcc-12
i386                  randconfig-006-20240816   gcc-11
i386                  randconfig-006-20240817   gcc-12
i386                  randconfig-011-20240816   gcc-12
i386                  randconfig-011-20240817   gcc-12
i386                  randconfig-012-20240816   clang-18
i386                  randconfig-012-20240817   gcc-12
i386                  randconfig-013-20240816   clang-18
i386                  randconfig-013-20240817   gcc-12
i386                  randconfig-014-20240816   gcc-12
i386                  randconfig-014-20240817   gcc-12
i386                  randconfig-015-20240816   gcc-12
i386                  randconfig-015-20240817   gcc-12
i386                  randconfig-016-20240816   gcc-12
i386                  randconfig-016-20240817   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240817   gcc-13.2.0
loongarch             randconfig-001-20240817   gcc-14.1.0
loongarch             randconfig-002-20240817   gcc-13.2.0
loongarch             randconfig-002-20240817   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                          eyeq5_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-13.2.0
mips                           rs90_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240817   gcc-13.2.0
nios2                 randconfig-001-20240817   gcc-14.1.0
nios2                 randconfig-002-20240817   gcc-13.2.0
nios2                 randconfig-002-20240817   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240817   gcc-13.2.0
parisc                randconfig-001-20240817   gcc-14.1.0
parisc                randconfig-002-20240817   gcc-13.2.0
parisc                randconfig-002-20240817   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240817   clang-14
powerpc               randconfig-001-20240817   gcc-13.2.0
powerpc               randconfig-002-20240817   gcc-13.2.0
powerpc               randconfig-002-20240817   gcc-14.1.0
powerpc               randconfig-003-20240817   clang-20
powerpc                     skiroot_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240817   gcc-13.2.0
powerpc64             randconfig-001-20240817   gcc-14.1.0
powerpc64             randconfig-002-20240817   clang-16
powerpc64             randconfig-002-20240817   gcc-13.2.0
powerpc64             randconfig-003-20240817   clang-20
powerpc64             randconfig-003-20240817   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240817   gcc-13.2.0
riscv                 randconfig-001-20240817   gcc-14.1.0
riscv                 randconfig-002-20240817   clang-17
riscv                 randconfig-002-20240817   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240817   gcc-13.2.0
s390                  randconfig-001-20240817   gcc-14.1.0
s390                  randconfig-002-20240817   clang-20
s390                  randconfig-002-20240817   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240817   gcc-13.2.0
sh                    randconfig-001-20240817   gcc-14.1.0
sh                    randconfig-002-20240817   gcc-13.2.0
sh                    randconfig-002-20240817   gcc-14.1.0
sh                             sh03_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240817   gcc-13.2.0
sparc64               randconfig-001-20240817   gcc-14.1.0
sparc64               randconfig-002-20240817   gcc-13.2.0
sparc64               randconfig-002-20240817   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240817   gcc-12
um                    randconfig-001-20240817   gcc-13.2.0
um                    randconfig-002-20240817   gcc-12
um                    randconfig-002-20240817   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240817   gcc-12
x86_64       buildonly-randconfig-002-20240817   gcc-12
x86_64       buildonly-randconfig-003-20240817   gcc-12
x86_64       buildonly-randconfig-004-20240817   gcc-12
x86_64       buildonly-randconfig-005-20240817   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240817   gcc-12
x86_64                randconfig-002-20240817   gcc-12
x86_64                randconfig-003-20240817   gcc-12
x86_64                randconfig-004-20240817   gcc-12
x86_64                randconfig-005-20240817   gcc-12
x86_64                randconfig-006-20240817   gcc-12
x86_64                randconfig-011-20240817   gcc-12
x86_64                randconfig-012-20240817   gcc-12
x86_64                randconfig-013-20240817   gcc-12
x86_64                randconfig-014-20240817   gcc-12
x86_64                randconfig-015-20240817   gcc-12
x86_64                randconfig-016-20240817   gcc-12
x86_64                randconfig-071-20240817   gcc-12
x86_64                randconfig-072-20240817   gcc-12
x86_64                randconfig-073-20240817   gcc-12
x86_64                randconfig-074-20240817   gcc-12
x86_64                randconfig-075-20240817   gcc-12
x86_64                randconfig-076-20240817   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240817   gcc-13.2.0
xtensa                randconfig-001-20240817   gcc-14.1.0
xtensa                randconfig-002-20240817   gcc-13.2.0
xtensa                randconfig-002-20240817   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

