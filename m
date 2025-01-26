Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68A4C02181
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 10:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=axsyln9Y6MiZzd2Mr2Bebr6Ur0R4X/IxzDq+hKu0FZQ=; b=kfNQ/Xpru4Kxg66h6uLgE8fK9Z
	Y3dNR2C5oHIVstLRi5HoHOCUlif+dO8qEg95Ne8MQvM93nrze6D5RUwWgXdSYAye3og3uH+OkiyXR
	TomKEGxbsPvS9jg8+7umjVvfABM8MP52ZyBjUE8TWxYu9CGHxD5iEf9GLSB1fawbuYAsWnphON1Tn
	BtUTIRQxBPgxwdvGD2/65NA3EX/JK7UqAnk3druhc3p3r7HusokMdTXof3glkZs4X7FAeuy3wGS9s
	A/B3vfezJD/UHdhUGoaV6Mrbc+FMXTNSvitAnS61tTg7/1W4qm8aQCGBfAf1cT9tgdtrHliW0xyjR
	fM1/VVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbzpW-0000000HKDj-23jZ
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 10:25:26 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbzpS-0000000HKDO-3iUc
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 10:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737887123; x=1769423123;
  h=date:from:to:cc:subject:message-id;
  bh=1u6S6X9pWnAa7SbTLkdhnBUM28ETkUzODE5uJjsfVcY=;
  b=bNsf4o+kubDh/Czox8NgDVlCloyVtjk7afk3rrcVOvhFqzFe7KouIHLJ
   BFxlS312Eh05sGYiPqdvYUBS1q5NmIotfdPFAg0KB81xVBNqhVlRYAWZf
   JcKk5Wo1iAnj0vu87FJqgNRToC6V8q/s9FCfu66O1cVp1+ITvA81Hr6u1
   TK7W1zimKMvhl+fE7mNDD6T8xfJwDiS4K5LokPBMfixlPg7cHwpjtnAzG
   +72L1TksR8anNmEIYCKE9gvBk77CsKtKSJgd1Hn0lMRf/cx/XC5YjrCPB
   Fo+vNaLcnma+qtPn0iP81k7AveNmkhbRdG53WxxTLv3VY4ALR9+zrct45
   g==;
X-CSE-ConnectionGUID: sHR4GjGOR9uw+H/tDmcWlw==
X-CSE-MsgGUID: JM5UCz1cRBOhKpee1/m2Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38468648"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38468648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 02:25:19 -0800
X-CSE-ConnectionGUID: CirpJo+oSKiIE7sytf2g7Q==
X-CSE-MsgGUID: aMnU5Z3IQeanxJIzQgZuIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="113196366"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2025 02:25:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbzpL-000fH5-33;
	Sun, 26 Jan 2025 10:25:16 +0000
Date: Sun, 26 Jan 2025 18:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 bdacb3671ec1498758eb089d89419d7f0176e7d1
Message-ID: <202501261829.9zA9Q1AG-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_022523_001169_CD498FFC 
X-CRM114-Status: UNSURE (   4.20  )
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
branch HEAD: bdacb3671ec1498758eb089d89419d7f0176e7d1  wifi: ath12k: Request pdev stats from firmware

elapsed time: 942m

configs tested: 126
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250126    gcc-13.2.0
arc                   randconfig-002-20250126    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-16
arm                         orion5x_defconfig    clang-20
arm                   randconfig-001-20250126    gcc-14.2.0
arm                   randconfig-002-20250126    clang-20
arm                   randconfig-003-20250126    clang-20
arm                   randconfig-004-20250126    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250126    clang-20
arm64                 randconfig-002-20250126    gcc-14.2.0
arm64                 randconfig-003-20250126    clang-20
arm64                 randconfig-004-20250126    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250126    gcc-14.2.0
csky                  randconfig-002-20250126    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250126    clang-20
hexagon               randconfig-002-20250126    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250126    clang-19
i386        buildonly-randconfig-002-20250126    clang-19
i386        buildonly-randconfig-003-20250126    gcc-12
i386        buildonly-randconfig-004-20250126    gcc-12
i386        buildonly-randconfig-005-20250126    gcc-12
i386        buildonly-randconfig-006-20250126    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250126    gcc-14.2.0
loongarch             randconfig-002-20250126    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250126    gcc-14.2.0
nios2                 randconfig-002-20250126    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250126    gcc-14.2.0
parisc                randconfig-002-20250126    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250126    clang-20
powerpc               randconfig-002-20250126    clang-17
powerpc               randconfig-003-20250126    gcc-14.2.0
powerpc64             randconfig-001-20250126    gcc-14.2.0
powerpc64             randconfig-002-20250126    gcc-14.2.0
powerpc64             randconfig-003-20250126    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250126    clang-20
riscv                 randconfig-002-20250126    clang-19
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250126    gcc-14.2.0
s390                  randconfig-002-20250126    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250126    gcc-14.2.0
sh                    randconfig-002-20250126    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250126    gcc-14.2.0
sparc                 randconfig-002-20250126    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250126    gcc-14.2.0
sparc64               randconfig-002-20250126    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250126    clang-20
um                    randconfig-002-20250126    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250126    clang-19
x86_64      buildonly-randconfig-002-20250126    clang-19
x86_64      buildonly-randconfig-003-20250126    clang-19
x86_64      buildonly-randconfig-004-20250126    gcc-12
x86_64      buildonly-randconfig-005-20250126    clang-19
x86_64      buildonly-randconfig-006-20250126    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250126    gcc-14.2.0
xtensa                randconfig-002-20250126    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

