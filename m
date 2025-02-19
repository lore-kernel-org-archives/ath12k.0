Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE3EC021AA
	for <ath12k@archiver.kernel.org>; Wed, 19 Feb 2025 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MmoT+8+ZelQ7r322fPZv/TC+hsehrPWObsUa19AofBU=; b=JI+ecEaSvBEt2K596J91YddOLJ
	2QU5cvL822jJ4BF3FI8y0XhmVexckivZqGm9O4A03mOpRLDLHkDPgxDgHucfSqYXMZ+xCyaTo8yJ+
	ohIgm3VBCIa++ktMNRo+heycElLnzaIozRGL2X2MhXTtT0ucmpPe6KM7r2ihiOPrs/a/J84EwjVKX
	xOM82l5vVOP/QbK5jWY1hXPJnkeF68CHs76dxBbWCRwi9eZ0cPEr2FLhVnc6AQK49RAP3ahOAbl1r
	KwUDT76dDC8fthvBfq216PhAtx8iE7kOVA3jOfcxNZwo/M6T50zwkBPs6OB4HPneDJ6WnB/g4Cn/Z
	MjgBbCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkov9-0000000EOpS-45o4
	for ath12k@archiver.kernel.org;
	Wed, 19 Feb 2025 18:35:43 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkov5-0000000EOn5-366X
	for ath12k@lists.infradead.org;
	Wed, 19 Feb 2025 18:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739990139; x=1771526139;
  h=date:from:to:cc:subject:message-id;
  bh=TiPD4ZVxbBqK5oDPCsq8lYJpco+WQclhjf1/jyu06Ik=;
  b=Z+ayP/fXoBiY2mYJUgs84OD+tWkuY0CebFijGToTTFPlwK9EntiNYvZi
   CWnT/Zf2OexVuwlULuXLEyYqgKXQwaWuXB0D6c57RB3qJXk+SQprzMTJV
   yb9KSX2yXHKoJAelbZlF9+wJRJxvDvRPeyOJYkD2Z57mowub+JcMoRVwx
   RNqAEimQFjq6Q0FCr0EZ1uJP1E6tJJ+HxTxlo5YCKD/RRmWiThcPmliJA
   QUXxHRQfBH/7wE8Zq28UDiXQoWDHmMO14V63AwrWz3YDZoCM+e+tNEy+n
   DUqegq/DFZFcBi6U/oWUbS92M5XQ38j94f58pTLdkFI9EF2baCbV5fZWM
   w==;
X-CSE-ConnectionGUID: F/Um1hwlR++DwCQ0gyWCrw==
X-CSE-MsgGUID: RkzryTIASTO1C0hOm6Eg+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="63220150"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="63220150"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 10:35:35 -0800
X-CSE-ConnectionGUID: 9CbC5eSXQUq7U6QTfzfG8Q==
X-CSE-MsgGUID: 1KPhVwKDTNOSeUIZyx64Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="115326226"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Feb 2025 10:21:17 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkoh7-0003Ij-29;
	Wed, 19 Feb 2025 18:21:13 +0000
Date: Thu, 20 Feb 2025 02:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 f22471c17f5849b2f20e2c56ec9fcd9dd8d5bf28
Message-ID: <202502200256.06t7XksC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_103539_814769_8EAC3219 
X-CRM114-Status: UNSURE (   4.31  )
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
branch HEAD: f22471c17f5849b2f20e2c56ec9fcd9dd8d5bf28  Add localversion-wireless-testing-ath

elapsed time: 1454m

configs tested: 112
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250219    gcc-13.2.0
arc                   randconfig-002-20250219    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                        multi_v5_defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-21
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20250219    gcc-14.2.0
arm                   randconfig-002-20250219    clang-17
arm                   randconfig-003-20250219    clang-15
arm                   randconfig-004-20250219    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250219    clang-21
arm64                 randconfig-002-20250219    gcc-14.2.0
arm64                 randconfig-003-20250219    gcc-14.2.0
arm64                 randconfig-004-20250219    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250219    gcc-14.2.0
csky                  randconfig-002-20250219    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250219    clang-14
hexagon               randconfig-002-20250219    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250219    clang-19
i386        buildonly-randconfig-002-20250219    clang-19
i386        buildonly-randconfig-003-20250219    gcc-12
i386        buildonly-randconfig-004-20250219    clang-19
i386        buildonly-randconfig-005-20250219    clang-19
i386        buildonly-randconfig-006-20250219    gcc-12
i386                                defconfig    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250219    gcc-14.2.0
loongarch             randconfig-002-20250219    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250219    gcc-14.2.0
nios2                 randconfig-002-20250219    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250219    gcc-14.2.0
parisc                randconfig-002-20250219    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-21
powerpc               randconfig-001-20250219    clang-15
powerpc               randconfig-002-20250219    clang-17
powerpc               randconfig-003-20250219    gcc-14.2.0
powerpc64             randconfig-001-20250219    gcc-14.2.0
powerpc64             randconfig-002-20250219    gcc-14.2.0
powerpc64             randconfig-003-20250219    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250219    clang-21
riscv                 randconfig-002-20250219    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250219    clang-18
s390                  randconfig-002-20250219    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250219    gcc-14.2.0
sh                    randconfig-002-20250219    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250219    gcc-14.2.0
sparc                 randconfig-002-20250219    gcc-14.2.0
sparc64               randconfig-001-20250219    gcc-14.2.0
sparc64               randconfig-002-20250219    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250219    clang-21
um                    randconfig-002-20250219    clang-21
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250219    gcc-12
x86_64      buildonly-randconfig-002-20250219    clang-19
x86_64      buildonly-randconfig-003-20250219    gcc-12
x86_64      buildonly-randconfig-004-20250219    clang-19
x86_64      buildonly-randconfig-005-20250219    gcc-12
x86_64      buildonly-randconfig-006-20250219    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250219    gcc-14.2.0
xtensa                randconfig-002-20250219    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

