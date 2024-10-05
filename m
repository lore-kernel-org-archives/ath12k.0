Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04874CFB421
	for <ath12k@archiver.kernel.org>; Sat,  5 Oct 2024 23:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a9pTPHr6R0byUI5qiSIiSD+Hu/ZaAgSc1KPtoWzvkUY=; b=IriqNETOutr5zYfOLmTr/KbIFE
	TdcHaVN0UKArGTnISVWL3hBa6/LKXLSwdZzMi8l4WwFkTEu0wVfz5lY3Pe/+PW0Re4JlPBpo0OW6g
	oaO8sfg3nQ/rotie/BHbDeyee/j0YEYQ5SE4s0jzcW2OR3sRQh/UQbf01tamNHhSkCjTySTPIOqWm
	7NEHG987odcfeZBJCu5WY0nVeGmtrjW0zH7YwKIb8X8lD2/KzgOrSt4QLb24JcfcxmUEaw/aii3NR
	rlooSsQuWTIPoSR/aNMqeqPgBF1XtZKDlN8FnJxhKiwAkvhsABFOO/Wtrsp7b67dD+9g0PhjjbqUS
	/eocl9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxEP2-0000000G6kZ-21PJ
	for ath12k@archiver.kernel.org;
	Sat, 05 Oct 2024 23:41:36 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxEOy-0000000G6k6-3adv
	for ath12k@lists.infradead.org;
	Sat, 05 Oct 2024 23:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728171693; x=1759707693;
  h=date:from:to:cc:subject:message-id;
  bh=Yug14PPDn3tOLD0Fj//GkccZGhJC2eoHRIR5cTsa8V8=;
  b=F0pBTiz+ne8FaBMZWrm2lQ5AO4ynK9vbgL/qzu8VbtWTUcEHk9IrKiE6
   oHEVDoctce0tSQSMJ7bufLml/ROLMvcs8GMzsm/t+mthIWYD/KpsLik+4
   zLuBo+KfgbuDDJQ8tB5Qd3xVGfjkVUaJI6tXsPcwieLRL+sgF1iPdJ/y5
   aluCihNSU0KMn41bfwQ15iOt/kb+xA1pPyi0Cur0IGht88d5hDydC8pr8
   sXPW0dHCrIkUBnizLKeDP6TozUDZUozGAk25vXD33qotFBqHMDTv4mTgS
   aqvn5MVs9U0KycLF5vxVz5NQ0tG+PF0WarKagGITfFKeNuY0HdWSYSP25
   w==;
X-CSE-ConnectionGUID: OkXWJEtzQYea6iT2r1xKaA==
X-CSE-MsgGUID: QhIynh0eQzyOUi8uEPtbAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="44827061"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="44827061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 16:41:32 -0700
X-CSE-ConnectionGUID: lwwrrFAYRimHqU/gTLhTGw==
X-CSE-MsgGUID: ANCHWSVVRM25fmjECnymoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="105913551"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Oct 2024 16:41:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxEOu-0003SA-1K;
	Sat, 05 Oct 2024 23:41:28 +0000
Date: Sun, 06 Oct 2024 07:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 b35245095197fead99d81d7a78c2cf9e11e298c3
Message-ID: <202410060746.WHZNaSI3-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_164132_963007_96DC37F9 
X-CRM114-Status: UNSURE (   3.20  )
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
branch HEAD: b35245095197fead99d81d7a78c2cf9e11e298c3  wifi: ath11k: Fix CE offset address calculation for WCN6750 in SSR

elapsed time: 1819m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241006    gcc-13.2.0
arc                   randconfig-002-20241006    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                          exynos_defconfig    clang-17
arm                        neponset_defconfig    gcc-14.1.0
arm                   randconfig-001-20241006    gcc-14.1.0
arm                   randconfig-002-20241006    clang-14
arm                   randconfig-003-20241006    gcc-14.1.0
arm                   randconfig-004-20241006    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20241006    gcc-14.1.0
arm64                 randconfig-002-20241006    gcc-14.1.0
arm64                 randconfig-003-20241006    gcc-14.1.0
arm64                 randconfig-004-20241006    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20241006    gcc-14.1.0
csky                  randconfig-002-20241006    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241006    clang-20
hexagon               randconfig-002-20241006    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241005    clang-18
i386        buildonly-randconfig-002-20241005    clang-18
i386        buildonly-randconfig-003-20241005    clang-18
i386        buildonly-randconfig-004-20241005    clang-18
i386        buildonly-randconfig-005-20241005    gcc-12
i386        buildonly-randconfig-006-20241005    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241005    gcc-11
i386                  randconfig-002-20241005    clang-18
i386                  randconfig-003-20241005    gcc-12
i386                  randconfig-004-20241005    clang-18
i386                  randconfig-005-20241005    clang-18
i386                  randconfig-006-20241005    clang-18
i386                  randconfig-011-20241005    gcc-12
i386                  randconfig-012-20241005    clang-18
i386                  randconfig-013-20241005    clang-18
i386                  randconfig-014-20241005    gcc-12
i386                  randconfig-015-20241005    gcc-12
i386                  randconfig-016-20241005    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20241006    gcc-14.1.0
loongarch             randconfig-002-20241006    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-002-20241006    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

