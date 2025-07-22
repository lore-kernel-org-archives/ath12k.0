Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502BDC83F34
	for <ath12k@archiver.kernel.org>; Tue, 22 Jul 2025 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=np7PuajZfK879SDdzHvQYBzfLr32QsnPX0ADqQkaBNg=; b=O/FN0KQqzyvesKPAiAmxc9KXn6
	tew7aEr1PwB7EIrPyKhapVaroiHusPsvX3dW6DCgJ1mwViMymO8y8beQi/D6unUUeYucRVUdO7Qan
	++AlchjGSBYLkRjfK8B8XSO0hDVMGl/hB1Y1htNWvd1ziMnnypvFUqdiLdtzjQrspJTu/XF+EZG27
	vNHb7QZi+3OqbwA0QvO916YiBiYVpSYiNEmq3kamJ5mVFKx1Z5q/jDORqoSp3Fg05sFdCHn6uZbSg
	wzAxCSnIRJHWHcSEc+fVyBz7XAWMJZQXFFGfAlFH0OqkvXJ1QUuJTWEpEzGSear59eNgQepYbpGyH
	WdcVqz1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDPi-00000002bQ5-0DWx;
	Tue, 22 Jul 2025 13:52:14 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCSU-00000002Tzy-3tLq
	for ath12k@lists.infradead.org;
	Tue, 22 Jul 2025 12:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753188663; x=1784724663;
  h=date:from:to:cc:subject:message-id;
  bh=YsR9EVpAYhlIm6k74lqpe107JvoY5cU60fmVeV4MWgw=;
  b=Vj0Q+A2oIsYJOKFSVwniG/19xJ9j5woEdagBp2OgK7D5lQRHfFKTbjig
   jA7Ev22B91UC1NAXFGRDb6JcTjYmEOrTD3pxgv/g1zYjwLrp3ovOSvPLv
   c3Sb3hQtCRNpqFYSUCo8YCdu920heQD96A7wf0ghViUwA07CzvZn9RQ/i
   e1cOsWVEFhlxfg1K/VZo3xsmvvAzo29HjoL6MuzVf6/tlShR02O0Ai9bz
   uUpmH2aI6Qo8nr5VQWUaS8EuWexCqowmGlk3zccDO/orSjPIGBSJTG44R
   tYAOudIb1T8t22T2r4WT8yfdkv1iEqAK38A0y6LMu2Q2cphBItevSYy82
   g==;
X-CSE-ConnectionGUID: WfDVkJavRTmkleDbcBg4MA==
X-CSE-MsgGUID: VndN3JbwQ7CCgo+iVbsPSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55594032"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55594032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 05:50:59 -0700
X-CSE-ConnectionGUID: G9v0sx0PT7yqE0R+yPIIBw==
X-CSE-MsgGUID: l2lIfHH2Tgm/nGqJWhnMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="164801693"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2025 05:50:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueCSN-000HnP-3C;
	Tue, 22 Jul 2025 12:50:55 +0000
Date: Tue, 22 Jul 2025 20:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 4a2bf707270f897ab8077baee8ed5842a5321686
Message-ID: <202507222022.GhR588ee-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_055103_013675_629F0B27 
X-CRM114-Status: UNSURE (   3.97  )
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
branch HEAD: 4a2bf707270f897ab8077baee8ed5842a5321686  wifi: ath12k: Correct tid cleanup when tid setup fails

elapsed time: 842m

configs tested: 120
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsimosci_defconfig    gcc-15.1.0
arc                   randconfig-001-20250722    gcc-10.5.0
arc                   randconfig-002-20250722    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                   randconfig-001-20250722    gcc-12.5.0
arm                   randconfig-002-20250722    clang-22
arm                   randconfig-003-20250722    gcc-8.5.0
arm                   randconfig-004-20250722    clang-17
arm                           spitz_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250722    clang-22
arm64                 randconfig-002-20250722    clang-22
arm64                 randconfig-003-20250722    clang-22
arm64                 randconfig-004-20250722    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250722    gcc-11.5.0
csky                  randconfig-002-20250722    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250722    clang-20
hexagon               randconfig-002-20250722    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250722    gcc-12
i386        buildonly-randconfig-002-20250722    gcc-12
i386        buildonly-randconfig-003-20250722    clang-20
i386        buildonly-randconfig-004-20250722    gcc-12
i386        buildonly-randconfig-005-20250722    clang-20
i386        buildonly-randconfig-006-20250722    clang-20
i386                                defconfig    clang-20
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250722    gcc-15.1.0
loongarch             randconfig-002-20250722    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250722    gcc-11.5.0
nios2                 randconfig-002-20250722    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250722    gcc-8.5.0
parisc                randconfig-002-20250722    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    clang-22
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc                  mpc885_ads_defconfig    clang-22
powerpc               randconfig-001-20250722    gcc-13.4.0
powerpc               randconfig-002-20250722    clang-22
powerpc               randconfig-003-20250722    gcc-14.3.0
powerpc64             randconfig-001-20250722    gcc-8.5.0
powerpc64             randconfig-002-20250722    clang-22
powerpc64             randconfig-003-20250722    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250722    clang-16
riscv                 randconfig-002-20250722    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250722    clang-22
s390                  randconfig-002-20250722    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250722    gcc-15.1.0
sh                    randconfig-002-20250722    gcc-15.1.0
sh                           se7206_defconfig    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250722    gcc-13.4.0
sparc                 randconfig-002-20250722    gcc-15.1.0
sparc64               randconfig-001-20250722    gcc-8.5.0
sparc64               randconfig-002-20250722    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250722    gcc-12
um                    randconfig-002-20250722    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250722    gcc-12
x86_64      buildonly-randconfig-002-20250722    gcc-12
x86_64      buildonly-randconfig-003-20250722    gcc-12
x86_64      buildonly-randconfig-004-20250722    clang-20
x86_64      buildonly-randconfig-005-20250722    gcc-12
x86_64      buildonly-randconfig-006-20250722    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                       common_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250722    gcc-15.1.0
xtensa                randconfig-002-20250722    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

