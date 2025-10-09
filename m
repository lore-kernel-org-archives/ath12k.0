Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55227CCD184
	for <ath12k@archiver.kernel.org>; Thu,  9 Oct 2025 22:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+X1I4IzoufczpTK2HgQT/exUJRb3oZFCODGZrLUbmRA=; b=gt0oSjZicvbMX4+MyFp74Neb0C
	UEnZYFhgwtI7UYF45NUE2qGNHF8xRIrumr4wD34QmSwe5tPWKutOOlYN6pb9jXVswmCjcekJkUw3Y
	lcc2UgacyiASAcykeOR7bOTUvL3zw+1a9vWpjSDPrNTdn78r3UXt5rtq9i6XcBcSAO7cpMpOlCCDl
	j/qY21HL6VhOkkmqZGvJG6MJXdGFqN/X/ebnpt0wp1z+Y8GLWodjfGNC9XfOw2K7Ji5fLcFaNEVek
	6go2j9R3UFAEIwIhWDGwEfWV1OHrkNpQ5mpUFwLNNe0bQFlksPQN5fMRGO3mGTd6AY+/ZcEvDhUCp
	gTOLdvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ywb-00000007Ddn-0Kxg;
	Thu, 09 Oct 2025 22:17:05 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ywY-00000007DcT-2Ak6
	for ath12k@lists.infradead.org;
	Thu, 09 Oct 2025 22:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760048222; x=1791584222;
  h=date:from:to:cc:subject:message-id;
  bh=FmaBo8cEd1CEInm6/lPLbderYf5jNdM93P8j8XmtTB4=;
  b=WHfG/aiTrm65QfUk5+S+DbzZCdZFav+HEQzZFxLEYIS0xvfMPSjUyXXU
   e5s9FGqdhBUNRCeXM2srI4mLXWpjCbwdfPN6vOPi7gnwejxCcDXQ4LyIS
   ODdyH1EJH+DP4fjDfQ0D0kf7kle87wyFIZ1EjfjxxASg7VN0bQMYhL6l9
   Y1D4+2eikqu2vVYbfWPrCFZvQG/wjLYeIcdWUaMKZEiWlU/0s2hQcpso+
   EukuLnoYKdFtcXgR0HrkvX1mFDVWiuzqlDXqCXL/+XD+sP0izvPHr2UC+
   JR4n9afLwnsN7kn9o8ptw0Ce9mIEZMAwd1aIvDvr7LEmlBqBk93fUGPnN
   w==;
X-CSE-ConnectionGUID: 5V82zAweTSieO6CUhRVDvg==
X-CSE-MsgGUID: rAzZFk96Rbiw16DYyOwBrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="61475639"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="61475639"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:17:00 -0700
X-CSE-ConnectionGUID: PSuI+wc2QqqONRegiLg1tQ==
X-CSE-MsgGUID: VRfJcXYfS2CT1FW3FrY11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="211470017"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 15:16:59 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6ywS-0001Y1-14;
	Thu, 09 Oct 2025 22:16:56 +0000
Date: Fri, 10 Oct 2025 06:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-current] BUILD SUCCESS
 9c78e747dd4fee6c36fcc926212e20032055cf9d
Message-ID: <202510100613.IKTEun4W-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_151702_575501_3C9E3D25 
X-CRM114-Status: UNSURE (   4.09  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
branch HEAD: 9c78e747dd4fee6c36fcc926212e20032055cf9d  wifi: ath11k: avoid bit operation on key flags

elapsed time: 925m

configs tested: 222
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                       imx_v4_v5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251009    clang-16
csky                  randconfig-001-20251009    gcc-13.4.0
csky                  randconfig-002-20251009    clang-16
csky                  randconfig-002-20251009    gcc-15.1.0
hexagon                          alldefconfig    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251009    clang-16
hexagon               randconfig-002-20251009    clang-16
hexagon               randconfig-002-20251009    clang-19
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251009    gcc-14
i386        buildonly-randconfig-001-20251010    gcc-14
i386        buildonly-randconfig-002-20251009    gcc-14
i386        buildonly-randconfig-002-20251010    gcc-14
i386        buildonly-randconfig-003-20251009    gcc-14
i386        buildonly-randconfig-003-20251010    gcc-14
i386        buildonly-randconfig-004-20251009    gcc-14
i386        buildonly-randconfig-004-20251010    gcc-14
i386        buildonly-randconfig-005-20251009    gcc-14
i386        buildonly-randconfig-005-20251010    gcc-14
i386        buildonly-randconfig-006-20251009    gcc-14
i386        buildonly-randconfig-006-20251010    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251010    clang-20
i386                  randconfig-002-20251010    clang-20
i386                  randconfig-003-20251010    clang-20
i386                  randconfig-004-20251010    clang-20
i386                  randconfig-005-20251010    clang-20
i386                  randconfig-006-20251010    clang-20
i386                  randconfig-007-20251010    clang-20
i386                  randconfig-011-20251009    clang-20
i386                  randconfig-011-20251010    gcc-14
i386                  randconfig-012-20251009    clang-20
i386                  randconfig-012-20251010    gcc-14
i386                  randconfig-013-20251009    clang-20
i386                  randconfig-013-20251010    gcc-14
i386                  randconfig-014-20251009    clang-20
i386                  randconfig-014-20251010    gcc-14
i386                  randconfig-015-20251009    clang-20
i386                  randconfig-015-20251010    gcc-14
i386                  randconfig-016-20251009    clang-20
i386                  randconfig-016-20251010    gcc-14
i386                  randconfig-017-20251009    clang-20
i386                  randconfig-017-20251010    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251009    clang-16
loongarch             randconfig-001-20251009    gcc-15.1.0
loongarch             randconfig-002-20251009    clang-16
loongarch             randconfig-002-20251009    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    clang-22
mips                           ip22_defconfig    clang-22
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251009    clang-16
nios2                 randconfig-001-20251009    gcc-8.5.0
nios2                 randconfig-002-20251009    clang-16
nios2                 randconfig-002-20251009    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    clang-22
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251009    clang-16
parisc                randconfig-001-20251009    gcc-8.5.0
parisc                randconfig-002-20251009    clang-16
parisc                randconfig-002-20251009    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                      mgcoge_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20251009    clang-16
powerpc               randconfig-001-20251009    gcc-8.5.0
powerpc               randconfig-002-20251009    clang-16
powerpc               randconfig-002-20251009    gcc-11.5.0
powerpc               randconfig-003-20251009    clang-16
powerpc               randconfig-003-20251009    gcc-8.5.0
powerpc64             randconfig-001-20251009    gcc-10.5.0
powerpc64             randconfig-002-20251009    clang-16
powerpc64             randconfig-002-20251009    clang-22
powerpc64             randconfig-003-20251009    clang-16
powerpc64             randconfig-003-20251009    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20251009    clang-22
riscv                 randconfig-001-20251009    gcc-8.5.0
riscv                 randconfig-001-20251010    gcc-9.5.0
riscv                 randconfig-002-20251009    clang-19
riscv                 randconfig-002-20251009    clang-22
riscv                 randconfig-002-20251010    gcc-9.5.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251009    clang-22
s390                  randconfig-001-20251010    gcc-9.5.0
s390                  randconfig-002-20251009    clang-22
s390                  randconfig-002-20251010    gcc-9.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                    randconfig-001-20251009    clang-22
sh                    randconfig-001-20251009    gcc-15.1.0
sh                    randconfig-001-20251010    gcc-9.5.0
sh                    randconfig-002-20251009    clang-22
sh                    randconfig-002-20251009    gcc-12.5.0
sh                    randconfig-002-20251010    gcc-9.5.0
sh                           se7721_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251009    clang-22
sparc                 randconfig-001-20251009    gcc-8.5.0
sparc                 randconfig-001-20251010    gcc-9.5.0
sparc                 randconfig-002-20251009    clang-22
sparc                 randconfig-002-20251009    gcc-8.5.0
sparc                 randconfig-002-20251010    gcc-9.5.0
sparc64               randconfig-001-20251009    clang-22
sparc64               randconfig-001-20251010    gcc-9.5.0
sparc64               randconfig-002-20251009    clang-22
sparc64               randconfig-002-20251010    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                    randconfig-001-20251009    clang-17
um                    randconfig-001-20251009    clang-22
um                    randconfig-001-20251010    gcc-9.5.0
um                    randconfig-002-20251009    clang-22
um                    randconfig-002-20251009    gcc-14
um                    randconfig-002-20251010    gcc-9.5.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251009    clang-20
x86_64      buildonly-randconfig-002-20251009    clang-20
x86_64      buildonly-randconfig-003-20251009    clang-20
x86_64      buildonly-randconfig-004-20251009    clang-20
x86_64      buildonly-randconfig-005-20251009    clang-20
x86_64      buildonly-randconfig-006-20251009    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251010    clang-20
x86_64                randconfig-002-20251010    clang-20
x86_64                randconfig-003-20251010    clang-20
x86_64                randconfig-004-20251010    clang-20
x86_64                randconfig-005-20251010    clang-20
x86_64                randconfig-006-20251010    clang-20
x86_64                randconfig-007-20251010    clang-20
x86_64                randconfig-008-20251010    clang-20
x86_64                randconfig-071-20251009    gcc-14
x86_64                randconfig-071-20251010    clang-20
x86_64                randconfig-072-20251009    gcc-14
x86_64                randconfig-072-20251010    clang-20
x86_64                randconfig-073-20251009    gcc-14
x86_64                randconfig-073-20251010    clang-20
x86_64                randconfig-074-20251009    gcc-14
x86_64                randconfig-074-20251010    clang-20
x86_64                randconfig-075-20251009    gcc-14
x86_64                randconfig-075-20251010    clang-20
x86_64                randconfig-076-20251009    gcc-14
x86_64                randconfig-076-20251010    clang-20
x86_64                randconfig-077-20251009    gcc-14
x86_64                randconfig-077-20251010    clang-20
x86_64                randconfig-078-20251009    gcc-14
x86_64                randconfig-078-20251010    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251009    clang-22
xtensa                randconfig-001-20251009    gcc-11.5.0
xtensa                randconfig-001-20251010    gcc-9.5.0
xtensa                randconfig-002-20251009    clang-22
xtensa                randconfig-002-20251009    gcc-8.5.0
xtensa                randconfig-002-20251010    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

