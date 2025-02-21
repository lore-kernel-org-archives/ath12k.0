Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235A1C021B3
	for <ath12k@archiver.kernel.org>; Fri, 21 Feb 2025 21:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hI0kDP3PmJ6eeDrclWjHAibufXGX7p5ntLcrqRwbcUk=; b=0hfsv5pK0m2vDZ0tkjqstLSxn4
	p6CPzDwZVSsQwV+hWbK/salGkNlfnQJDpYCbHOaK+7Hby4ZPIFgXSW/bBPM1lKIMfTRrE1qrU0nbX
	zTkP2gcn/cyN5ReazRJpRRKNn66MsFMuDw87s0U2+noA5e6ANrrgINI63hjoCpWXYezZQnYtnwFrh
	dwz1Mfcc4rw5XBnDMJ0qPg6FwHaPuvbdftFH+1wTp+iyQudhrfEdVeXc1N7RJkFTLSCzhiG7T9Rqd
	yxye8aBcC/kVx5hVYHXlDnaLmPRfjD0sEGpnnY9YKhPx9qITZ661hzyRA9G3EuSmaaqkttayaoxSu
	Go+ETxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaiN-00000006vec-3npe
	for ath12k@archiver.kernel.org;
	Fri, 21 Feb 2025 21:37:43 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaiL-00000006vd3-3o6E
	for ath12k@lists.infradead.org;
	Fri, 21 Feb 2025 21:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740173862; x=1771709862;
  h=date:from:to:cc:subject:message-id;
  bh=RLqKXlAGLKEY0mh6P6Y4jTJJiHFzark87yof/CQKlBE=;
  b=fAWMqo4nMut1fZBXy/snQoTOA40pu2ER5ZzAXzbo0PigdaNzoGF1RanE
   hhv3FxgkWusQtm9ej91U9eUl9a9S52ITauH3w2n/2Q+D+knhBCzzywmjf
   h1H2ilcaKeh8oE5bN/jTVphSxTjma1a2ABs+NX8UuiWBZlvMWhGWisvd4
   zFlZgkxA1UblR2AasrTLQoM8Bg94AlerhYIMk2NJRh7FRAMkb+hsMZpRC
   BK4YG9/TvVusc0TDqgGAy1/lCFpXK0mWpgeJWxAgwsUhBv/Hd5bBAXkcD
   fYJlUQeS/HKnM2uQI1Sxqd4iU7+FtFm6rcHP1tk3wmd8Rm1j9JRUfBXId
   g==;
X-CSE-ConnectionGUID: LlVqx1HgQAqNWJ8s/IzUrw==
X-CSE-MsgGUID: QBjwWTTcSX6cdVR+Rxne1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41128876"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="41128876"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 13:37:41 -0800
X-CSE-ConnectionGUID: 7usnWqvoTk+HYoP5SuwZGg==
X-CSE-MsgGUID: 5M0xpEqLRkabDmtZfUMn2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120579204"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Feb 2025 13:37:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlaiD-00062d-2j;
	Fri, 21 Feb 2025 21:37:36 +0000
Date: Sat, 22 Feb 2025 05:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 4025faffaff08e7dab4834e8232d1977d27cdd66
Message-ID: <202502220558.ffxWpENB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_133741_990009_2500FF22 
X-CRM114-Status: UNSURE (   3.51  )
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
branch HEAD: 4025faffaff08e7dab4834e8232d1977d27cdd66  Merge branch 'pending' into main-pending

elapsed time: 1444m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250221    gcc-13.2.0
arc                   randconfig-002-20250221    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250221    gcc-14.2.0
arm                   randconfig-002-20250221    clang-19
arm                   randconfig-003-20250221    gcc-14.2.0
arm                   randconfig-004-20250221    clang-21
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250221    clang-15
arm64                 randconfig-002-20250221    clang-21
arm64                 randconfig-003-20250221    clang-21
arm64                 randconfig-004-20250221    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250221    gcc-14.2.0
csky                  randconfig-002-20250221    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250221    clang-21
hexagon               randconfig-002-20250221    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250221    gcc-12
i386        buildonly-randconfig-002-20250221    gcc-12
i386        buildonly-randconfig-003-20250221    gcc-12
i386        buildonly-randconfig-004-20250221    gcc-12
i386        buildonly-randconfig-005-20250221    clang-19
i386        buildonly-randconfig-006-20250221    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250221    gcc-14.2.0
loongarch             randconfig-002-20250221    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250221    gcc-14.2.0
nios2                 randconfig-002-20250221    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250221    gcc-14.2.0
parisc                randconfig-002-20250221    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                  mpc885_ads_defconfig    clang-18
powerpc               randconfig-001-20250221    clang-21
powerpc               randconfig-002-20250221    clang-21
powerpc               randconfig-003-20250221    clang-17
powerpc64             randconfig-001-20250221    clang-21
powerpc64             randconfig-002-20250221    clang-21
powerpc64             randconfig-003-20250221    clang-19
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250221    clang-21
riscv                 randconfig-002-20250221    clang-21
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250221    gcc-14.2.0
s390                  randconfig-002-20250221    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250221    gcc-14.2.0
sh                    randconfig-002-20250221    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250221    gcc-14.2.0
sparc                 randconfig-002-20250221    gcc-14.2.0
sparc64               randconfig-001-20250221    gcc-14.2.0
sparc64               randconfig-002-20250221    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250221    gcc-12
um                    randconfig-002-20250221    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250221    gcc-12
x86_64      buildonly-randconfig-002-20250221    clang-19
x86_64      buildonly-randconfig-003-20250221    clang-19
x86_64      buildonly-randconfig-004-20250221    clang-19
x86_64      buildonly-randconfig-005-20250221    clang-19
x86_64      buildonly-randconfig-006-20250221    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250221    gcc-14.2.0
xtensa                randconfig-002-20250221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

