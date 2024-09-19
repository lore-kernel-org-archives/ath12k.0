Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F3DCF395D
	for <ath12k@archiver.kernel.org>; Thu, 19 Sep 2024 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVSuGadaTDKoJq6z6b2/Z9kCt267ARbTHrUX81ik4sQ=; b=HwFeJvZozKwy6rPQWIbfHDIINc
	+n1yEl+50CkI2lvLx9qQ5Jy+henpMTgDiIod2UP2HF0rV3ECViUFAqqDSRR80/404n6i4nZoZUFPN
	gVThD2e1qw3vwN9mGih+dfJcrG7NTrLLaFOdf6O1S5r5WkuL+B48wbdrT1tS9dahvvjAcRfyxJki/
	k2it3kFqiLd+CWtgu5fbOqwCDwdP9Lt/E5dGHcr2A1AE8uowYPZuVTY0nyD6HIn5DRM1WGwnedRsb
	b2t/Wcaur+lDWcB7V1T75ob1yC/bTdwh6FIm2BLvRlhQFhP2YmQFpkRHC7GiTQglPrVyRNKZ/+0NV
	R6VDxlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srJGL-0000000AZ3H-1dcD
	for ath12k@archiver.kernel.org;
	Thu, 19 Sep 2024 15:40:09 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srJGH-0000000AZ2x-43AT
	for ath12k@lists.infradead.org;
	Thu, 19 Sep 2024 15:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726760405; x=1758296405;
  h=date:from:to:cc:subject:message-id;
  bh=9oRh/HLwUmMpsuZrQBSJPa50USm1u4vC/QPNgh6oxXw=;
  b=A/OQupgzHEKKQy5c9tfxIlI5zJwxz4AFU8rWeABEQbIQ5LlVVO1dp0G7
   DaPuYm8FwNRW+kcYM7ZZ3jrxIEUZis13MOCR99Ab3MuntYy3iEOWJYrxu
   0t89v0gULuWMXRdfJZjf60mLW8k2qsb5LQV7tTV7HvOK5LodSys68Sb+L
   AGIwZLFUY+P4IJPN9+Q1+rQcwJfCvSRwq+JsdX2yNeg7HdHZ5qtV/Muhr
   D1Zcml0UzyoMffgFR8beW6SXjRX3nbAASNyKF2KoXHBiHUco50zQDup17
   TcA+BY3eXqxZqN6BV4U/1Y34l2fE8yLZnykm4RrIVc8A7CJ78iJ1BMb8D
   Q==;
X-CSE-ConnectionGUID: FymunXrdTRWrczC7v+UT8w==
X-CSE-MsgGUID: xilOOAHHT4KpQ+FfPSeAMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36320329"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="36320329"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 08:40:05 -0700
X-CSE-ConnectionGUID: Sf4hxhjTT860ek84Ls+erA==
X-CSE-MsgGUID: w2X2XlOpRlaMl29cYvxFEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="70228420"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2024 08:40:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srJGE-000DQK-0r;
	Thu, 19 Sep 2024 15:40:02 +0000
Date: Thu, 19 Sep 2024 23:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 d3e7ed3829f9e54e8bcddd1881d7edcf38b94268
Message-ID: <202409192332.TG52ZVgS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_084006_099153_B4ADDCA2 
X-CRM114-Status: UNSURE (   4.57  )
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
branch HEAD: d3e7ed3829f9e54e8bcddd1881d7edcf38b94268  wifi: ath6kl: fix typos in struct wmi_rssi_threshold_params_cmd and wmi_snr_threshold_params_cmd comments

elapsed time: 1261m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          exynos_defconfig    clang-14
arm                         wpcm450_defconfig    clang-14
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240919    clang-18
i386        buildonly-randconfig-002-20240919    clang-18
i386        buildonly-randconfig-003-20240919    clang-18
i386        buildonly-randconfig-004-20240919    clang-18
i386        buildonly-randconfig-005-20240919    clang-18
i386        buildonly-randconfig-006-20240919    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240919    clang-18
i386                  randconfig-002-20240919    clang-18
i386                  randconfig-003-20240919    clang-18
i386                  randconfig-004-20240919    clang-18
i386                  randconfig-005-20240919    clang-18
i386                  randconfig-006-20240919    clang-18
i386                  randconfig-011-20240919    clang-18
i386                  randconfig-012-20240919    clang-18
i386                  randconfig-013-20240919    clang-18
i386                  randconfig-014-20240919    clang-18
i386                  randconfig-015-20240919    clang-18
i386                  randconfig-016-20240919    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip22_defconfig    clang-14
mips                     loongson2k_defconfig    clang-14
mips                      maltaaprp_defconfig    clang-14
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-14
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    clang-14
powerpc                         ps3_defconfig    clang-14
powerpc                     stx_gp3_defconfig    clang-14
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                       zfcpdump_defconfig    clang-14
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    clang-14
sh                          kfr2r09_defconfig    clang-14
sh                      rts7751r2d1_defconfig    clang-14
sh                           se7751_defconfig    clang-14
sh                              ul2_defconfig    clang-14
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240919    clang-18
x86_64      buildonly-randconfig-002-20240919    clang-18
x86_64      buildonly-randconfig-003-20240919    clang-18
x86_64      buildonly-randconfig-004-20240919    clang-18
x86_64      buildonly-randconfig-005-20240919    clang-18
x86_64      buildonly-randconfig-006-20240919    clang-18
x86_64                              defconfig    clang-18
x86_64                randconfig-001-20240919    clang-18
x86_64                randconfig-002-20240919    clang-18
x86_64                randconfig-003-20240919    clang-18
x86_64                randconfig-004-20240919    clang-18
x86_64                randconfig-005-20240919    clang-18
x86_64                randconfig-006-20240919    clang-18
x86_64                randconfig-011-20240919    clang-18
x86_64                randconfig-012-20240919    clang-18
x86_64                randconfig-013-20240919    clang-18
x86_64                randconfig-014-20240919    clang-18
x86_64                randconfig-015-20240919    clang-18
x86_64                randconfig-016-20240919    clang-18
x86_64                randconfig-071-20240919    clang-18
x86_64                randconfig-072-20240919    clang-18
x86_64                randconfig-073-20240919    clang-18
x86_64                randconfig-074-20240919    clang-18
x86_64                randconfig-075-20240919    clang-18
x86_64                randconfig-076-20240919    clang-18
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

