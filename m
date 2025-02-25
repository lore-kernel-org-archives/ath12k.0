Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A296C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DTuKiU2B1QNm/e4zkm3xQ2Or+IKkFQd69RO74aH3BOk=; b=xC6eHum+Lrx5LdVFMXnNJwdCj/
	aqZvUVzJaFaWGN7A8A9YG3cGDHxlGNQ/mv773jko8q4SczmoiM3due6zPcJ63bmg5ncJpgNxUxmmT
	9wOwhKUS3uLAurqmpaF29XcxQ1zwX2VwmlbdHK02eF/UF6UYbmNJ0Ghj8Rr1hem/5c4peeOuO1hkU
	+kuswb36m1YtNIp/y6+oCpnE+gZntXyzRngDNeaNtLvaVBFdrwWuuTWzPPakfuXCKISNOEeeI10Yf
	5P6W6cfHS0KwkDNkXiuGN7LPJWoZwC1zjjt1LbYDYxhO35WStIQqe5MnPA3sYZEzbCVhcifrMCo7+
	qANpU3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1FT-00000001JDD-3xPH
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 20:09:47 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0ne-00000001CWz-17Jt
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 19:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740512462; x=1772048462;
  h=date:from:to:cc:subject:message-id;
  bh=Cvai4oBzmjzA42fopfxIxgWq92bR0XtZ9T3qFp5N6Jw=;
  b=HIw12Hc4eGHq0bZxhG+L3UwA/h12VFM7uiv+tyRBhzM+I+/xVPrwrPTk
   kFMv/3zWcq6Cc/dXo7S8jk7Zw41XZZ4xwudxgBc/5OujzffG1WnXKqnFl
   UNq31NMMy9p2n/5g+6lmJ8vEmMWGWMs2Hl0Yx4VvNohBCN39TuD4EIFBb
   GLlrf3JHpy0cC5zebHByeryzJEhPwVJXAW5ydiRisQy3shNPgEBomIJ8e
   F2xR5k7f94lwHxCdk8Q+CcPoSXr8qTC23am2UPB0q2SvaDmr0OCU6hL1H
   Hb4np/ixmoXgCizJA3Vuif0uLSQOYB7DSmtQwBCoiHcClsfVSJq990CA7
   A==;
X-CSE-ConnectionGUID: FAgFbuiBRPCEpda0i6Iiow==
X-CSE-MsgGUID: 0aGYyzNCQJWkqkCLbNFMtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41254263"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41254263"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 11:41:02 -0800
X-CSE-ConnectionGUID: nx8JWbHOSCaEfFDlRlhl3Q==
X-CSE-MsgGUID: 8yS4adu0SAOlUCULHHZJ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="121423610"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Feb 2025 11:41:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn0n5-000AgF-24;
	Tue, 25 Feb 2025 19:40:42 +0000
Date: Wed, 26 Feb 2025 03:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 73e97368a9c185114de63a5634f73ab6e5b053db
Message-ID: <202502260312.ViIcViIW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_114102_352095_BE978611 
X-CRM114-Status: UNSURE (   4.00  )
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
branch HEAD: 73e97368a9c185114de63a5634f73ab6e5b053db  wifi: ath12k: Improve BSS discovery with hidden SSID in 6 GHz band

elapsed time: 1449m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250225    gcc-13.2.0
arc                  randconfig-002-20250225    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250225    gcc-14.2.0
arm                  randconfig-002-20250225    gcc-14.2.0
arm                  randconfig-003-20250225    gcc-14.2.0
arm                  randconfig-004-20250225    clang-15
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250225    clang-19
arm64                randconfig-002-20250225    clang-17
arm64                randconfig-003-20250225    clang-15
arm64                randconfig-004-20250225    clang-21
csky                 randconfig-001-20250225    gcc-14.2.0
csky                 randconfig-002-20250225    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250225    clang-21
hexagon              randconfig-002-20250225    clang-21
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250225    clang-19
i386       buildonly-randconfig-002-20250225    gcc-11
i386       buildonly-randconfig-003-20250225    clang-19
i386       buildonly-randconfig-004-20250225    clang-19
i386       buildonly-randconfig-005-20250225    gcc-12
i386       buildonly-randconfig-006-20250225    clang-19
i386                               defconfig    clang-19
loongarch            randconfig-001-20250225    gcc-14.2.0
loongarch            randconfig-002-20250225    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
nios2                randconfig-001-20250225    gcc-14.2.0
nios2                randconfig-002-20250225    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250225    gcc-14.2.0
parisc               randconfig-002-20250225    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-16
powerpc              randconfig-001-20250225    gcc-14.2.0
powerpc              randconfig-002-20250225    clang-19
powerpc              randconfig-003-20250225    clang-21
powerpc64            randconfig-001-20250225    gcc-14.2.0
powerpc64            randconfig-002-20250225    gcc-14.2.0
powerpc64            randconfig-003-20250225    gcc-14.2.0
riscv                           allmodconfig    clang-21
riscv                           allyesconfig    clang-21
riscv                randconfig-001-20250225    clang-15
riscv                randconfig-002-20250225    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250225    clang-15
s390                 randconfig-002-20250225    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250225    gcc-14.2.0
sh                   randconfig-002-20250225    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250225    gcc-14.2.0
sparc                randconfig-002-20250225    gcc-14.2.0
sparc64              randconfig-001-20250225    gcc-14.2.0
sparc64              randconfig-002-20250225    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250225    clang-21
um                   randconfig-002-20250225    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250225    gcc-12
x86_64     buildonly-randconfig-002-20250225    clang-19
x86_64     buildonly-randconfig-003-20250225    clang-19
x86_64     buildonly-randconfig-004-20250225    gcc-11
x86_64     buildonly-randconfig-005-20250225    gcc-12
x86_64     buildonly-randconfig-006-20250225    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250225    gcc-14.2.0
xtensa               randconfig-002-20250225    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

