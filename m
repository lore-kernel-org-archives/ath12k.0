Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFE0D1CA11
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZC6q89VWKdeffqoGpIC+8OAgH6gXbwiIycceThNWHJg=; b=CWiwL5cCujd3h8mgEZsbbOuujw
	5v3muKw4pL/mnWRVJf6umpIolE8UW1cDx9Uzz8EaT0KoKScL7WWRlfGqdDr6atQ+sUCCX/jL3UBzl
	2Y3a3unF4n6Xa/ngCH6C+Oz/jMiaBKNAAGCKEWopfHHSnxBdZV3uWmKCoiaI9HcRvN9yTWJqV3IBh
	a4vejibDuGtBAc7ea0gOf6dTSvKTlexQrCYFmdVhpxYwiM3UKyOClZReIslAbAScFk9HZe++KfQkE
	9pBwqCcDbe/hTHvdDk1HfPjmCqWi3au5gpzfSGvXz+koQw0RHS7Tw+ARbUH3mePkengfF330n/sQ/
	9fOdZprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Djd-0000000GA2I-0Qh9
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 07:12:17 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Dja-0000000GA1u-0dD7
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 07:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730790734; x=1762326734;
  h=date:from:to:cc:subject:message-id;
  bh=xsKBi0p4YB88jpn8cno43TUJe8gk/tJImf/QjLIXnt4=;
  b=nGJDSJBMOoZwKThWPjCxPnxq9zfJvLgrpKAjHme6+euU5VGvkmwtQ7h1
   l3dkUzSRnsIO7wFCjGJmpD/IGvmjPuq93aZbS4SmKLG58GYUVmWR+4Q6e
   55K5Dsk0rZgiC3NOmebsbbcYowYkcLa490+6TXP4Nunx6WBUGqrzW50/n
   4C+Op4dbh9DYnTI7Vxsw/T6yDwUkrA3aPURlaAZssYNI9Ds72FvyYflKm
   nnH/0ceuPVGmoxCWvvZPiVYOeMvxxKOhtR20GfBO9UTcLaL5Msupg1eCy
   p7/MUmwm2OyTHpMZN94lc5cScqe1Q3U8QMWsC5L0ourPp+eggH5RNcbk3
   w==;
X-CSE-ConnectionGUID: qF2jQOJtTe60wPeDc1Uc6Q==
X-CSE-MsgGUID: Amc6WALTR06EtcJMZjmXaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47982537"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47982537"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:12:12 -0800
X-CSE-ConnectionGUID: C4bDbCveQKupXDwgZmIM8Q==
X-CSE-MsgGUID: 6UsP4dKmR2+XeskoC5EA7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83556233"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2024 23:12:10 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8DjU-000lkH-0o;
	Tue, 05 Nov 2024 07:12:08 +0000
Date: Tue, 05 Nov 2024 15:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 d63fbff74ab1af1573c1dca20cfe1e876f8ffa62
Message-ID: <202411051502.iMKC0rKU-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_231214_301522_27C013C2 
X-CRM114-Status: UNSURE (   3.54  )
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
branch HEAD: d63fbff74ab1af1573c1dca20cfe1e876f8ffa62  Add localversion-wireless-testing-ath

elapsed time: 848m

configs tested: 112
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241105    gcc-13.2.0
arc                   randconfig-002-20241105    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                   randconfig-001-20241105    gcc-14.1.0
arm                   randconfig-002-20241105    clang-20
arm                   randconfig-003-20241105    gcc-14.1.0
arm                   randconfig-004-20241105    clang-16
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20241105    gcc-14.1.0
arm64                 randconfig-002-20241105    gcc-14.1.0
arm64                 randconfig-003-20241105    gcc-14.1.0
arm64                 randconfig-004-20241105    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20241105    gcc-14.1.0
csky                  randconfig-002-20241105    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241105    clang-20
hexagon               randconfig-002-20241105    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241105    clang-19
i386        buildonly-randconfig-002-20241105    gcc-12
i386        buildonly-randconfig-003-20241105    clang-19
i386        buildonly-randconfig-004-20241105    gcc-12
i386        buildonly-randconfig-005-20241105    clang-19
i386        buildonly-randconfig-006-20241105    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241105    gcc-12
i386                  randconfig-002-20241105    clang-19
i386                  randconfig-003-20241105    gcc-12
i386                  randconfig-004-20241105    clang-19
i386                  randconfig-005-20241105    clang-19
i386                  randconfig-006-20241105    gcc-12
i386                  randconfig-011-20241105    clang-19
i386                  randconfig-012-20241105    clang-19
i386                  randconfig-013-20241105    gcc-12
i386                  randconfig-014-20241105    gcc-12
i386                  randconfig-015-20241105    gcc-12
i386                  randconfig-016-20241105    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20241105    gcc-14.1.0
loongarch             randconfig-002-20241105    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20241105    gcc-14.1.0
nios2                 randconfig-002-20241105    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                randconfig-001-20241105    gcc-14.1.0
parisc                randconfig-002-20241105    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241105    gcc-14.1.0
powerpc               randconfig-002-20241105    gcc-14.1.0
powerpc               randconfig-003-20241105    gcc-14.1.0
powerpc64             randconfig-001-20241105    gcc-14.1.0
powerpc64             randconfig-002-20241105    clang-14
powerpc64             randconfig-003-20241105    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241105    gcc-14.1.0
riscv                 randconfig-002-20241105    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                  randconfig-001-20241105    clang-20
s390                  randconfig-002-20241105    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                    randconfig-001-20241105    gcc-14.1.0
sh                    randconfig-002-20241105    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64               randconfig-001-20241105    gcc-14.1.0
sparc64               randconfig-002-20241105    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                    randconfig-001-20241105    gcc-12
um                    randconfig-002-20241105    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-8.3    gcc-12
x86_64                    rhel-8.3-kselftests    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241105    gcc-14.1.0
xtensa                randconfig-002-20241105    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

