Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A67AC3DA4A
	for <ath12k@archiver.kernel.org>; Fri, 16 Aug 2024 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W7E6ocmgezyajEfonG+9MdqqGOchPcb53jmvFtvjgaE=; b=bXRxqsUe7s6aImDlXB5DQsVV3b
	ZITgrrDzLw6qZR97Hs9cWWCVnQ5QtL7aerExNv/iwResI8z0EEk1wS4pjKx9Bs0l+pj/9Ra7XiPtG
	nYmSU1Lzt9QI+DgbqRA4aonIdGZ3qJsqTzb3tSw950ahOvrk5PEChoZGoR7K6INY2aaVmf1RsbPFW
	4yVdsC6ZyOAJaw7Um1qU3lWXTs9aRg3MiIZy29BKoojAftKh/K58NbUjeAUBgKeU28F3nYv7ZnoFL
	mXom3vsji5VhIWEvBjmNc6D8qIjK/Rrb8y2gXjcUXG/xBm3t1fADm2IRmIrkJsUOE8NslYjhLgmVn
	LsOTqo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuEQ-0000000CaxY-0CPr
	for ath12k@archiver.kernel.org;
	Fri, 16 Aug 2024 10:30:54 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuEN-0000000Cax6-3MHD
	for ath12k@lists.infradead.org;
	Fri, 16 Aug 2024 10:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723804252; x=1755340252;
  h=date:from:to:cc:subject:message-id;
  bh=qYqI4sawu4Xb1iSDyV8qzaKpQfnwWeuLEBVA/fdQJXs=;
  b=AwYXIA6+y+bIl/OMnrLN6qA4juksna0h2tp26sCjHIM5qhM9Tjekg800
   QMm1/5pNtLGuLUzfgvUsHL2P4btMkKf1GNgIBW090T1M0Ebms+1J5LcUU
   MetGaKGFVK18FfLomdBzm70JG4Ymj/KsKKMMjBoHNHZWlJkxEnGwa+lIc
   44Xu4UqVzEr7XWMv0kb/qK50EgvB/9Cy3UUnXMpCyQr6ScGpEFvVWfZPU
   qyCu45OjBUrX9ljLhP1S0vKC1aNohtqaimb5xxnJXlJEi/L/VEGNqmozl
   TT3cTE8yeH+MN0XhheyTrKWyCDiCVfugU0zZFbTMSWOLPrnwaLT4Lo4pU
   Q==;
X-CSE-ConnectionGUID: g1UCzVVkS8WPUFQPVn2Kmw==
X-CSE-MsgGUID: 1vSod5q+QE6/SZI0RWdriw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32770321"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="32770321"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 03:30:50 -0700
X-CSE-ConnectionGUID: HXbK7XRbSjSmB6MrhHQEFA==
X-CSE-MsgGUID: 0JrnTk0XRPaj2Ec8rpzZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="64581282"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2024 03:30:49 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seuEI-0006Ig-0j;
	Fri, 16 Aug 2024 10:30:46 +0000
Date: Fri, 16 Aug 2024 18:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 5e15b8555b2e464426a66f2dda3496b193ef2b76
Message-ID: <202408161847.JNfac6PE-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_033051_911199_9EA05854 
X-CRM114-Status: UNSURE (   3.79  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: 5e15b8555b2e464426a66f2dda3496b193ef2b76  Add localversion-wireless-testing-ath

elapsed time: 1038m

configs tested: 108
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240816   gcc-13.2.0
arc                   randconfig-002-20240816   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240816   clang-20
arm                   randconfig-002-20240816   clang-20
arm                   randconfig-003-20240816   clang-20
arm                   randconfig-004-20240816   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240816   clang-20
arm64                 randconfig-002-20240816   clang-20
arm64                 randconfig-003-20240816   clang-20
arm64                 randconfig-004-20240816   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240816   gcc-14.1.0
csky                  randconfig-002-20240816   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240816   clang-20
hexagon               randconfig-002-20240816   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240816   gcc-12
i386         buildonly-randconfig-002-20240816   clang-18
i386         buildonly-randconfig-003-20240816   clang-18
i386         buildonly-randconfig-004-20240816   clang-18
i386         buildonly-randconfig-005-20240816   gcc-11
i386         buildonly-randconfig-006-20240816   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240816   clang-18
i386                  randconfig-002-20240816   gcc-12
i386                  randconfig-003-20240816   gcc-11
i386                  randconfig-004-20240816   gcc-12
i386                  randconfig-005-20240816   clang-18
i386                  randconfig-006-20240816   gcc-11
i386                  randconfig-011-20240816   gcc-12
i386                  randconfig-012-20240816   clang-18
i386                  randconfig-013-20240816   clang-18
i386                  randconfig-014-20240816   gcc-12
i386                  randconfig-015-20240816   gcc-12
i386                  randconfig-016-20240816   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240816   gcc-14.1.0
loongarch             randconfig-002-20240816   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240816   gcc-14.1.0
nios2                 randconfig-002-20240816   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                randconfig-001-20240816   gcc-14.1.0
parisc                randconfig-002-20240816   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-001-20240816   gcc-14.1.0
powerpc               randconfig-002-20240816   clang-20
powerpc               randconfig-003-20240816   gcc-14.1.0
powerpc64             randconfig-001-20240816   gcc-14.1.0
powerpc64             randconfig-002-20240816   clang-20
powerpc64             randconfig-003-20240816   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                 randconfig-001-20240816   clang-20
riscv                 randconfig-002-20240816   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                  randconfig-001-20240816   gcc-14.1.0
s390                  randconfig-002-20240816   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                    randconfig-001-20240816   gcc-14.1.0
sh                    randconfig-002-20240816   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64               randconfig-001-20240816   gcc-14.1.0
sparc64               randconfig-002-20240816   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                    randconfig-001-20240816   clang-20
um                    randconfig-002-20240816   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

