Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781D4C021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7FS09QBEUOqLKcAsz2LvxwSIRKATFWJGG3nZkjxWrGI=; b=3CpSAtxISsCksT95MF7AEyImnc
	DgOAm0rIQOtoDP11ik+o0YqARMKNH8m7H0Bqv3SdQOqpf0OUDiTZHKI6gpgGft9vFrEkAjoMHKgdO
	xLyMNGXWWHLkMqAPZqksrIMYeRsBtkLKHj8cnHKPKqDIrF/1xoySzLGp+TdL4R7bZYHzSda0AdHEp
	03ptddvpF65ZWk7QwMEA+wAvUBRzn+XVEKgfq+4O0JsBP1DCH1BBG90flTSqzWwBxCxGmFyulzoKf
	exGsgSLbV2pDqz95GkrhI8RCa9rKwrLKP61jSONvGLH9Qz0AEhD3lQl+8HSQYAWHBHi38+BQJt42u
	sEURykwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toTsA-0000000Ewxu-0zLv
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 20:55:46 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toTs7-0000000EwxM-2H6D
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 20:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740862544; x=1772398544;
  h=date:from:to:cc:subject:message-id;
  bh=EVLlxZJt3zr8WsE4D/AJ+pCEiJtNq5alnvjCFDx4HfU=;
  b=gTPel+Ms6nW5Yog2WMuroUEbP4MDfmK8+8dLLLs9pcjNiEM7ofGtZF49
   4AB1wzTVLg4fChUQXlPd1xxBa1/hwNAeVf6zOd89cUYGhTp23APudkHvy
   Tfpa2jRLe3pgZyMHWz9z1TarnlBhagvB0HphMOr5IB3YxH67z8xJ/Gy7F
   gb0hequoVE+tKfb4VXqbG9Tj+l9hhv0eibutQH35mDBTSYI5WMAwj90qI
   O5/cMC7w+fJto57nEWOCuQiBOtPQogrQLWI+xB+TBBolhOSQecTnn0Ql1
   GeOobj2s3UDFDCe8cxvopGZgyqymVQAxn/I3c8XlOPlI7IBRMpSS9ZsbE
   A==;
X-CSE-ConnectionGUID: u3jgNaQcTNSOfPcaS3uCzA==
X-CSE-MsgGUID: MFs6pKaxQKC0Sjr9y8Nyjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41892984"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41892984"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 12:55:43 -0800
X-CSE-ConnectionGUID: HtV8mbhUSAuOI0nZMW2BlA==
X-CSE-MsgGUID: K8/K1P3lQZC/lYN9nOltgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117423636"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Mar 2025 12:55:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toTs3-000GhW-1T;
	Sat, 01 Mar 2025 20:55:39 +0000
Date: Sun, 02 Mar 2025 04:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 3148fc3cf193dbbd2e14eee59468a510a38bf604
Message-ID: <202503020447.OSeYl5Fc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_125543_620344_FD8F5023 
X-CRM114-Status: UNSURE (   3.88  )
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
branch HEAD: 3148fc3cf193dbbd2e14eee59468a510a38bf604  Add localversion-wireless-testing-ath

elapsed time: 1449m

configs tested: 160
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250301    gcc-13.2.0
arc                   randconfig-001-20250302    gcc-14.2.0
arc                   randconfig-002-20250301    gcc-13.2.0
arc                   randconfig-002-20250302    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-15
arm                        mvebu_v7_defconfig    clang-15
arm                            qcom_defconfig    clang-15
arm                   randconfig-001-20250301    gcc-14.2.0
arm                   randconfig-001-20250302    gcc-14.2.0
arm                   randconfig-002-20250301    gcc-14.2.0
arm                   randconfig-002-20250302    gcc-14.2.0
arm                   randconfig-003-20250301    clang-21
arm                   randconfig-003-20250302    gcc-14.2.0
arm                   randconfig-004-20250301    clang-21
arm                   randconfig-004-20250302    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250301    gcc-14.2.0
arm64                 randconfig-001-20250302    gcc-14.2.0
arm64                 randconfig-002-20250301    clang-21
arm64                 randconfig-002-20250302    gcc-14.2.0
arm64                 randconfig-003-20250301    clang-15
arm64                 randconfig-003-20250302    gcc-14.2.0
arm64                 randconfig-004-20250301    clang-17
arm64                 randconfig-004-20250302    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250301    gcc-14.2.0
csky                  randconfig-002-20250301    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250301    clang-21
hexagon               randconfig-002-20250301    clang-21
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250301    clang-19
i386        buildonly-randconfig-001-20250302    gcc-12
i386        buildonly-randconfig-002-20250301    clang-19
i386        buildonly-randconfig-002-20250302    gcc-12
i386        buildonly-randconfig-003-20250301    clang-19
i386        buildonly-randconfig-003-20250302    gcc-12
i386        buildonly-randconfig-004-20250301    clang-19
i386        buildonly-randconfig-004-20250302    gcc-12
i386        buildonly-randconfig-005-20250301    gcc-12
i386        buildonly-randconfig-005-20250302    gcc-12
i386        buildonly-randconfig-006-20250301    clang-19
i386        buildonly-randconfig-006-20250302    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250302    gcc-12
i386                  randconfig-002-20250302    gcc-12
i386                  randconfig-003-20250302    gcc-12
i386                  randconfig-004-20250302    gcc-12
i386                  randconfig-005-20250302    gcc-12
i386                  randconfig-006-20250302    gcc-12
i386                  randconfig-007-20250302    gcc-12
i386                  randconfig-011-20250302    gcc-11
i386                  randconfig-012-20250302    gcc-11
i386                  randconfig-013-20250302    gcc-11
i386                  randconfig-014-20250302    gcc-11
i386                  randconfig-015-20250302    gcc-11
i386                  randconfig-016-20250302    gcc-11
i386                  randconfig-017-20250302    gcc-11
loongarch                        alldefconfig    clang-15
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250301    gcc-14.2.0
loongarch             randconfig-002-20250301    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250301    gcc-14.2.0
nios2                 randconfig-002-20250301    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                generic-32bit_defconfig    clang-15
parisc                randconfig-001-20250301    gcc-14.2.0
parisc                randconfig-002-20250301    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                 mpc832x_rdb_defconfig    clang-15
powerpc               randconfig-001-20250301    clang-17
powerpc               randconfig-002-20250301    clang-19
powerpc               randconfig-003-20250301    clang-21
powerpc64             randconfig-001-20250301    gcc-14.2.0
powerpc64             randconfig-002-20250301    clang-21
powerpc64             randconfig-003-20250301    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                 randconfig-001-20250301    gcc-14.2.0
riscv                 randconfig-002-20250301    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250301    clang-15
s390                  randconfig-002-20250301    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250301    gcc-14.2.0
sh                    randconfig-002-20250301    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250301    gcc-14.2.0
sparc                 randconfig-002-20250301    gcc-14.2.0
sparc64               randconfig-001-20250301    gcc-14.2.0
sparc64               randconfig-002-20250301    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                               allyesconfig    gcc-12
um                    randconfig-001-20250301    gcc-12
um                    randconfig-002-20250301    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250301    clang-19
x86_64      buildonly-randconfig-001-20250302    gcc-12
x86_64      buildonly-randconfig-002-20250301    clang-19
x86_64      buildonly-randconfig-002-20250302    gcc-12
x86_64      buildonly-randconfig-003-20250301    gcc-11
x86_64      buildonly-randconfig-003-20250302    gcc-12
x86_64      buildonly-randconfig-004-20250301    gcc-12
x86_64      buildonly-randconfig-004-20250302    gcc-12
x86_64      buildonly-randconfig-005-20250301    gcc-12
x86_64      buildonly-randconfig-005-20250302    gcc-12
x86_64      buildonly-randconfig-006-20250301    clang-19
x86_64      buildonly-randconfig-006-20250302    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250302    clang-19
x86_64                randconfig-002-20250302    clang-19
x86_64                randconfig-003-20250302    clang-19
x86_64                randconfig-004-20250302    clang-19
x86_64                randconfig-005-20250302    clang-19
x86_64                randconfig-006-20250302    clang-19
x86_64                randconfig-007-20250302    clang-19
x86_64                randconfig-008-20250302    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-18
x86_64                          rhel-9.4-func    clang-19
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250301    gcc-14.2.0
xtensa                randconfig-002-20250301    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

