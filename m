Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222CEC021B3
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 21:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XnQd3BZJoX9MXVKI1+Jtxn3yZCqjfuycaFwrQ8QddTU=; b=Jo8g4hsV8LvBPt137mflisAMWM
	qAarT0QesrGwo5lyE94JWWOvcjKaWarSc29B9d+VX+Jzj5Ir+YuXyDcsDh6Y/mwu1lbSaiJiUlzXy
	FxDarY/ipksVEpWDWcOAudSdLHln2P/cbqhehb6G4EydVeYmir45JkBdQjY3+A3lAxlXFOnMsWm4d
	WygOGlaxOiRzKlE1I3768aIzTJbhVZIMKLVWHKWbB11PS45rCrq3dmfYrWU/WGsB2wOENScqauPhK
	ERk3fH7wCBmU74pnTmUl/cS3vN0JolDzRj+ZZF3nbhlo4sRo7I9S4a3Q7kP9FEF9/PBSaaIj8/Wy2
	esaZJl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEFj-00000002zif-3kii
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 21:38:39 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE9D-00000002y1u-3t6l
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 21:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740087117; x=1771623117;
  h=date:from:to:cc:subject:message-id;
  bh=o3h07uSC0ZOe7sutmZFrWsq8nvrTwYs0iOlWwgVIezg=;
  b=bcaMTfpgFRxqljTDJP1cCLTA0cDUICY92HCswxVZt24+3ALoh9PEhFiZ
   N7IL0YqYdJHDwveZsbMQpDOE1SEAgGMnFpQapiYDe/G29n5kEHVl6iErT
   47Wi5mSS7osM4kxy8b4ER++W37SxxlZ4CIif2yTwiPKHTAkHAoqdaBw4W
   +vVvU/rc8v7gwc7g3aWADY3MvIcA2Njy5B8SGUSMmis4K0QallI/V1S4s
   hnR+TGx2hodtvCdI0cwZOhFgfN8PdxJ038eyMk5l/EwW2OIyGh2GD7wlM
   WAlb8zQVTRLn3JS5KJe4dvSV256lfYQIXYcwXD/DGJx9ENr8wXH+r9frS
   Q==;
X-CSE-ConnectionGUID: L4rpvmYpQYabr/E5gjYvTQ==
X-CSE-MsgGUID: EyKgDXnZQ6SzC2DxS9M7MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58299999"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="58299999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 13:31:52 -0800
X-CSE-ConnectionGUID: fF8vMNV/RUS0gxkz01EPiQ==
X-CSE-MsgGUID: kUAYGLqUR+uIOBzx9VDxGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="120106088"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Feb 2025 13:31:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlE95-0004mV-28;
	Thu, 20 Feb 2025 21:31:47 +0000
Date: Fri, 21 Feb 2025 05:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-split-phy] BUILD SUCCESS
 1195d20345c8fc01de23eefc69837b786b269796
Message-ID: <202502210511.vB6kC7WE-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_133156_005905_70F31999 
X-CRM114-Status: UNSURE (   4.05  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
branch HEAD: 1195d20345c8fc01de23eefc69837b786b269796  wifi: ath12k: Add support for 512 MB profile

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here
|-- um-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here
`-- x86_64-allyesconfig
    `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here

elapsed time: 1447m

configs tested: 74
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250220    gcc-13.2.0
arc                  randconfig-002-20250220    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250220    gcc-14.2.0
arm                  randconfig-002-20250220    gcc-14.2.0
arm                  randconfig-003-20250220    gcc-14.2.0
arm                  randconfig-004-20250220    gcc-14.2.0
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250220    gcc-14.2.0
arm64                randconfig-002-20250220    gcc-14.2.0
arm64                randconfig-003-20250220    clang-21
arm64                randconfig-004-20250220    gcc-14.2.0
csky                 randconfig-001-20250220    gcc-14.2.0
csky                 randconfig-002-20250220    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250220    clang-21
hexagon              randconfig-002-20250220    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250220    gcc-12
i386       buildonly-randconfig-002-20250220    gcc-12
i386       buildonly-randconfig-003-20250220    gcc-12
i386       buildonly-randconfig-004-20250220    clang-19
i386       buildonly-randconfig-005-20250220    clang-19
i386       buildonly-randconfig-006-20250220    clang-19
i386                               defconfig    clang-19
loongarch            randconfig-001-20250220    gcc-14.2.0
loongarch            randconfig-002-20250220    gcc-14.2.0
nios2                randconfig-001-20250220    gcc-14.2.0
nios2                randconfig-002-20250220    gcc-14.2.0
parisc               randconfig-001-20250220    gcc-14.2.0
parisc               randconfig-002-20250220    gcc-14.2.0
powerpc              randconfig-001-20250220    gcc-14.2.0
powerpc              randconfig-002-20250220    clang-16
powerpc              randconfig-003-20250220    clang-21
powerpc64            randconfig-001-20250220    clang-16
powerpc64            randconfig-002-20250220    clang-18
powerpc64            randconfig-003-20250220    gcc-14.2.0
riscv                randconfig-001-20250220    gcc-14.2.0
riscv                randconfig-002-20250220    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250220    clang-19
s390                 randconfig-002-20250220    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250220    gcc-14.2.0
sh                   randconfig-002-20250220    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250220    gcc-14.2.0
sparc                randconfig-002-20250220    gcc-14.2.0
sparc64              randconfig-001-20250220    gcc-14.2.0
sparc64              randconfig-002-20250220    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250220    gcc-12
um                   randconfig-002-20250220    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250220    gcc-12
x86_64     buildonly-randconfig-002-20250220    gcc-12
x86_64     buildonly-randconfig-003-20250220    gcc-12
x86_64     buildonly-randconfig-004-20250220    gcc-12
x86_64     buildonly-randconfig-005-20250220    gcc-12
x86_64     buildonly-randconfig-006-20250220    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250220    gcc-14.2.0
xtensa               randconfig-002-20250220    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

