Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3F9C2D0CD
	for <ath12k@archiver.kernel.org>; Sun, 18 May 2025 00:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BWKT/DxTYiIdjlmJy+ydkEZ5b2HKkEKBfc7gWoyW7mY=; b=djW8V7b6BWnbxJkAgHylIcX/FU
	Re/t0dASEr4mjHO/3p/blYMFpmvj51zxm1A6M9Et3ZNRC/DZHqW9mbhMEgAYwHxpdX0rR+j19wcL2
	j/IAwtSGM1dS/qkd99QVMIQ9GJyeB5xr7NR/qt0ol5PlQjdF/8JGMxv4ydbX7hQqqzU1IlgjBDT8V
	cI2Ub23lJFj2DE53POq6epj2KApb7ixURY43oplXTVGowD/hKiKFLDXYexuAXBBgtqQ/2Uwm7R+n9
	1HrOTgazXWiXd4NLovPL/VEnI8YxDU8U/zm3QExcEI7dEHrvmRQJL0RSzAVzXzQ1JzJ8gifmLd67P
	nIE6ZV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGSDr-00000006Trm-19rq;
	Sun, 18 May 2025 00:49:47 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGSDo-00000006TrO-1rdu
	for ath12k@lists.infradead.org;
	Sun, 18 May 2025 00:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747529385; x=1779065385;
  h=date:from:to:cc:subject:message-id;
  bh=sjVwzUYpNqhT6ETwBr8ELAKDHBH0TEZjoOXQEGEFRwA=;
  b=WIEXUqBothhuco3Yk4bNjGnvJSigOUZUXhiznT7TheUMNeYlc2eAPpVi
   +G3Pm+TekzQQ5eAVEpemEJJi3C+0O3y7NylnFGFdugD//lqrl8rqORe+Y
   lQteJDRqf+eBbD7pW33KGG2fFKBl7Eccii7Kij4crdNiMR3ZWTlUhTeOo
   YdzOsO51kQU9dg4+MHiaU2cVJx9NH1GLtq/9MScNPYJQmfeMf9avBxEqJ
   3rFy1/FXq6rEYxzQpHgstGeTPxx2n9Kb1rpV8fO2kyYouhnC04/q4Cn2D
   DwviQIqAbHI+qMmRr9Hj0JB/pFRVlg3mc7XRdzoPp18WJlJx/fqJ/z+8T
   w==;
X-CSE-ConnectionGUID: 0YZXa6bmSQeFJB1WXHCgZQ==
X-CSE-MsgGUID: ttzOzFAlSJysgPMm7JX9OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="53137342"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="53137342"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 17:49:38 -0700
X-CSE-ConnectionGUID: OEAwf8r+TyK8Yq/D8T07gQ==
X-CSE-MsgGUID: WEsJLPHIRGiyWee35xYBlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="140045195"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 May 2025 17:49:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGSDe-000KWl-1k;
	Sun, 18 May 2025 00:49:34 +0000
Date: Sun, 18 May 2025 08:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending-deferred] BUILD SUCCESS
 52c1e49f8c69a630f3dbe7dd79c52979cdad19d2
Message-ID: <202505180826.N9dGx1C4-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_174944_583238_87DA77A4 
X-CRM114-Status: UNSURE (   3.55  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
branch HEAD: 52c1e49f8c69a630f3dbe7dd79c52979cdad19d2  wifi: ath12k: Fix scan initiation failure handling

Unverified Warning (likely false positive, kindly check if interested):

    drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
    drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-161-20250518
    |-- drivers-net-wireless-ath-ath12k-mac.c-ath12k_mac_parse_tx_pwr_env()-error:buffer-overflow-local_non_psd-power
    `-- drivers-net-wireless-ath-ath12k-mac.c-ath12k_mac_parse_tx_pwr_env()-error:buffer-overflow-reg_non_psd-power

elapsed time: 1420m

configs tested: 238
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250517    gcc-10.5.0
arc                   randconfig-001-20250517    gcc-8.5.0
arc                   randconfig-002-20250517    gcc-14.2.0
arc                   randconfig-002-20250517    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                          moxart_defconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    gcc-14.2.0
arm                   randconfig-001-20250517    clang-21
arm                   randconfig-001-20250517    gcc-8.5.0
arm                   randconfig-002-20250517    gcc-8.5.0
arm                   randconfig-003-20250517    gcc-8.5.0
arm                   randconfig-004-20250517    clang-21
arm                   randconfig-004-20250517    gcc-8.5.0
arm                        realview_defconfig    gcc-14.2.0
arm                             rpc_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250517    clang-17
arm64                 randconfig-001-20250517    gcc-8.5.0
arm64                 randconfig-002-20250517    clang-16
arm64                 randconfig-002-20250517    gcc-8.5.0
arm64                 randconfig-003-20250517    gcc-6.5.0
arm64                 randconfig-003-20250517    gcc-8.5.0
arm64                 randconfig-004-20250517    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250517    clang-21
csky                  randconfig-001-20250517    gcc-10.5.0
csky                  randconfig-002-20250517    clang-21
csky                  randconfig-002-20250517    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250517    clang-21
hexagon               randconfig-002-20250517    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250517    clang-20
i386        buildonly-randconfig-002-20250517    clang-20
i386        buildonly-randconfig-003-20250517    clang-20
i386        buildonly-randconfig-004-20250517    clang-20
i386        buildonly-randconfig-004-20250517    gcc-12
i386        buildonly-randconfig-005-20250517    clang-20
i386        buildonly-randconfig-006-20250517    clang-20
i386        buildonly-randconfig-006-20250517    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250517    clang-20
i386                  randconfig-002-20250517    clang-20
i386                  randconfig-003-20250517    clang-20
i386                  randconfig-004-20250517    clang-20
i386                  randconfig-005-20250517    clang-20
i386                  randconfig-006-20250517    clang-20
i386                  randconfig-007-20250517    clang-20
i386                  randconfig-011-20250517    gcc-12
i386                  randconfig-012-20250517    gcc-12
i386                  randconfig-013-20250517    gcc-12
i386                  randconfig-014-20250517    gcc-12
i386                  randconfig-015-20250517    gcc-12
i386                  randconfig-016-20250517    gcc-12
i386                  randconfig-017-20250517    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250517    clang-21
loongarch             randconfig-001-20250517    gcc-14.2.0
loongarch             randconfig-002-20250517    clang-21
loongarch             randconfig-002-20250517    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-14.2.0
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250517    clang-21
nios2                 randconfig-001-20250517    gcc-14.2.0
nios2                 randconfig-002-20250517    clang-21
nios2                 randconfig-002-20250517    gcc-10.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250517    clang-21
parisc                randconfig-001-20250517    gcc-5.5.0
parisc                randconfig-002-20250517    clang-21
parisc                randconfig-002-20250517    gcc-11.5.0
parisc64                         alldefconfig    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250517    clang-21
powerpc               randconfig-001-20250517    gcc-6.5.0
powerpc               randconfig-002-20250517    clang-21
powerpc               randconfig-002-20250517    gcc-6.5.0
powerpc               randconfig-003-20250517    clang-16
powerpc               randconfig-003-20250517    clang-21
powerpc                     redwood_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250517    clang-21
powerpc64             randconfig-002-20250517    clang-21
powerpc64             randconfig-002-20250517    gcc-6.5.0
powerpc64             randconfig-003-20250517    clang-21
powerpc64             randconfig-003-20250517    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250517    clang-21
riscv                 randconfig-001-20250517    gcc-9.3.0
riscv                 randconfig-002-20250517    clang-21
riscv                 randconfig-002-20250517    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250517    gcc-7.5.0
s390                  randconfig-001-20250517    gcc-9.3.0
s390                  randconfig-002-20250517    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250517    gcc-12.4.0
sh                    randconfig-001-20250517    gcc-9.3.0
sh                    randconfig-002-20250517    gcc-10.5.0
sh                    randconfig-002-20250517    gcc-9.3.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250517    gcc-11.5.0
sparc                 randconfig-001-20250517    gcc-9.3.0
sparc                 randconfig-002-20250517    gcc-7.5.0
sparc                 randconfig-002-20250517    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250517    gcc-7.5.0
sparc64               randconfig-001-20250517    gcc-9.3.0
sparc64               randconfig-002-20250517    gcc-5.5.0
sparc64               randconfig-002-20250517    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250517    gcc-12
um                    randconfig-001-20250517    gcc-9.3.0
um                    randconfig-002-20250517    gcc-12
um                    randconfig-002-20250517    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250517    clang-20
x86_64      buildonly-randconfig-001-20250517    gcc-12
x86_64      buildonly-randconfig-001-20250518    clang-20
x86_64      buildonly-randconfig-002-20250517    clang-20
x86_64      buildonly-randconfig-002-20250517    gcc-12
x86_64      buildonly-randconfig-002-20250518    clang-20
x86_64      buildonly-randconfig-003-20250517    clang-20
x86_64      buildonly-randconfig-003-20250518    clang-20
x86_64      buildonly-randconfig-004-20250517    clang-20
x86_64      buildonly-randconfig-004-20250518    clang-20
x86_64      buildonly-randconfig-005-20250517    clang-20
x86_64      buildonly-randconfig-005-20250518    clang-20
x86_64      buildonly-randconfig-006-20250517    clang-20
x86_64      buildonly-randconfig-006-20250518    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250518    clang-20
x86_64                randconfig-002-20250518    clang-20
x86_64                randconfig-003-20250518    clang-20
x86_64                randconfig-004-20250518    clang-20
x86_64                randconfig-005-20250518    clang-20
x86_64                randconfig-006-20250518    clang-20
x86_64                randconfig-007-20250518    clang-20
x86_64                randconfig-008-20250518    clang-20
x86_64                randconfig-071-20250518    gcc-12
x86_64                randconfig-072-20250518    gcc-12
x86_64                randconfig-073-20250518    gcc-12
x86_64                randconfig-074-20250518    gcc-12
x86_64                randconfig-075-20250518    gcc-12
x86_64                randconfig-076-20250518    gcc-12
x86_64                randconfig-077-20250518    gcc-12
x86_64                randconfig-078-20250518    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250517    gcc-9.3.0
xtensa                randconfig-002-20250517    gcc-13.3.0
xtensa                randconfig-002-20250517    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

