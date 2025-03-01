Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BF1C021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 20:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TSEd3bI6lA4G6MRDZWuwTBMsx+TlwRAzIODGbDMpyb4=; b=QiXDFJ43LxhmiMkLiaTEZigPmM
	jnxVyUs8FR1+dQTUnLTR1UTE3Ha+8vS8LIVxycYrAgpfKo2febvnYEMFB91KR0Ol75yif5jaHfRPW
	mELUGTqCYa2ymEmuynNa/iuP2mNPWTplbJoPKWpF1N3JnjS5yvxoUFBJ8Xl1n8wRzLGBrTlihGUHI
	FD4H6K4YNp5MFlZFrqSpOWHpLvF3Q7TF8crl2MndrOh7chGKfwnjNR6H3h8tY4MASIFbvFssFe+FQ
	sdC/IyYSzFrLListf8FD/P61Pol4yiF7TVwrCP799uLC6O8ojJkU4xuQKjfED4EqzN1dbY1JZjPon
	m1i6G6qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toTrF-0000000Ewoj-3Obt
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 20:54:49 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toTrD-0000000EwoA-1s54
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 20:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740862488; x=1772398488;
  h=date:from:to:cc:subject:message-id;
  bh=DmTmAMCc7wAyC3rNfgva2eOl3PceCRXu3V2gumMOTtM=;
  b=KeNXhAKPb5XsTl1rYrZS/NwU5VxOaiGhghEO8r950g49AVrF2DIuqFqv
   mOiStgOTIiRvo3X0mZCzZkxMwOBTUA3+8nuNlcnAl7dPlvBhBSuQE1sc9
   atQj2/YP4VeSp8Ip6pQAqEbUOlv43RaE4BDGFqUjeoeGzLABGG8q/K/jy
   yR01rR8gaB0+evR0wBNbYhsGA3Swf8gtXYqoPkW3lmy+A2gqvjrYUVrwd
   wNdAWlVPoLwCZ/bkNNoZi33Ls4BzZgD1tJUCyS6FEJbTMtFG/R9wIzon8
   DAcsTe9B7BwUmnTdcfmTPD437TU7+aRkseSsIBHec2I048qLRB7WoIwEz
   g==;
X-CSE-ConnectionGUID: xzEKchN1R2uQ+J88xoXcTQ==
X-CSE-MsgGUID: U6Z5ucpbRBmqGfzxeC1DRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="45552050"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="45552050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 12:54:44 -0800
X-CSE-ConnectionGUID: oSAdxuOoRWap0YWKdDPhZw==
X-CSE-MsgGUID: L71B82NkTAW48LF70mA6Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="122646965"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Mar 2025 12:54:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toTr5-000Gh8-0f;
	Sat, 01 Mar 2025 20:54:39 +0000
Date: Sun, 02 Mar 2025 04:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 9a0dddfb30f120db3851627935851d262e4e7acb
Message-ID: <202503020454.9K9GUbfo-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_125447_522952_A9CEECA9 
X-CRM114-Status: UNSURE (   4.18  )
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
branch HEAD: 9a0dddfb30f120db3851627935851d262e4e7acb  wifi: ath12k: Fix invalid data access in ath12k_dp_rx_h_undecap_nwifi

elapsed time: 1449m

configs tested: 155
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                   randconfig-001-20250301    gcc-13.2.0
arc                   randconfig-001-20250302    gcc-14.2.0
arc                   randconfig-002-20250301    gcc-13.2.0
arc                   randconfig-002-20250302    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
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

