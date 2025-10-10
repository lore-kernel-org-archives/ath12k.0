Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A457CCD184
	for <ath12k@archiver.kernel.org>; Fri, 10 Oct 2025 01:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3wxSB7Nv8K1lIQbYQSaMwKNPdLabpfkajoIdfD9Y10=; b=xcOBm6TPRrwgfF6LbM+aDGdpzx
	CuAVpRHkUqtx9zYQfxHLTk2ihp83m0MRKh7eL36iQPLtDp2AFcMNO7Qn57RSM/dWWqDx/flboZdLk
	CVgW2t3be7jc5OV9n+FtzVIYsnPahpwe3TTICUAd6V7WbiHig6O5iYF1/deUuvQY3/7NwtPEaRu8P
	NZjqt4mPlj3+eEqIS5iJyKCSo1He3iu26uSNuAxnBbVVcij6osr+iLONFHcwq0L1g40sQzg/SPRVI
	UHCL028toOfLjqVLG1hTbPSXhcjOdlZlQ3gKTTlxIBVcv7QIxpxMPBQncd4WCD/IC+ZraKzErBfFa
	FIiIbusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v726Z-00000007RqD-0B6h;
	Fri, 10 Oct 2025 01:39:35 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v726W-00000007Rpu-3Yw2
	for ath12k@lists.infradead.org;
	Fri, 10 Oct 2025 01:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760060373; x=1791596373;
  h=date:from:to:cc:subject:message-id;
  bh=wN8q0Y7mVJP13hwcGqda4C5jPqcu5AGAPcPdLnCDc3Y=;
  b=YhhbiDP0QNyFlyBR2j04RFLcIfGJWZzJMetagFwAfgDkKiYuFT7bnuIn
   BHgKHfr/eiivxrISY4zuWidSz7lgio8UFFhcH+C/03zISbou5PAwFa/ak
   Cx9aqTKTwAvurE1KdGxmpug6uQLAv79DoUwLNOyVv8xDwj2fPCKdcOGkY
   ln76GBbrj2sPqbq/5NXVUEHUCBvP1FOsE6pe3yK1T2Up0Kti+WLC2KRLS
   hRL0axq+jukXaZOgt/BnLHR9aXEXkc4S+sBy4N8E161PRVSdXCoiUV8zu
   CE39baBMPTSppPlkhQulL7LPCPNRF4r5Tvun0UeCSDsn6FqbeRoeVO+GN
   g==;
X-CSE-ConnectionGUID: VCTaq44aSZWP1ZVHvWDwxg==
X-CSE-MsgGUID: L7b+D3XOQfCvHEPcwcI4tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72961466"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="72961466"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 18:39:31 -0700
X-CSE-ConnectionGUID: NoChkFnYSM2gBflmb7PXcg==
X-CSE-MsgGUID: rgOuaRBUTjW0kzNBOIkZcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="180104943"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2025 18:39:29 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v726Q-0001op-2O;
	Fri, 10 Oct 2025 01:39:26 +0000
Date: Fri, 10 Oct 2025 09:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 21364a5e57d4f6f28e8bed962488ed34538dbfcb
Message-ID: <202510100952.RK4n0MIW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_183932_942017_28AD7654 
X-CRM114-Status: UNSURE (   3.98  )
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
branch HEAD: 21364a5e57d4f6f28e8bed962488ed34538dbfcb  Merge branch 'pending' into main-pending

elapsed time: 1127m

configs tested: 282
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251009    gcc-11.5.0
arc                   randconfig-001-20251010    gcc-8.5.0
arc                   randconfig-002-20251009    gcc-14.3.0
arc                   randconfig-002-20251010    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                         bcm2835_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                       imx_v4_v5_defconfig    gcc-15.1.0
arm                      integrator_defconfig    gcc-15.1.0
arm                   randconfig-001-20251009    gcc-10.5.0
arm                   randconfig-001-20251010    gcc-8.5.0
arm                   randconfig-002-20251009    gcc-11.5.0
arm                   randconfig-002-20251010    gcc-8.5.0
arm                   randconfig-003-20251009    gcc-11.5.0
arm                   randconfig-003-20251010    gcc-8.5.0
arm                   randconfig-004-20251009    gcc-12.5.0
arm                   randconfig-004-20251010    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251009    gcc-8.5.0
arm64                 randconfig-001-20251010    gcc-8.5.0
arm64                 randconfig-002-20251009    gcc-14.3.0
arm64                 randconfig-002-20251010    gcc-8.5.0
arm64                 randconfig-003-20251009    gcc-9.5.0
arm64                 randconfig-003-20251010    gcc-8.5.0
arm64                 randconfig-004-20251009    gcc-8.5.0
arm64                 randconfig-004-20251010    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251009    clang-16
csky                  randconfig-001-20251009    gcc-13.4.0
csky                  randconfig-001-20251010    gcc-14.3.0
csky                  randconfig-002-20251009    clang-16
csky                  randconfig-002-20251009    gcc-15.1.0
csky                  randconfig-002-20251010    gcc-14.3.0
hexagon                          alldefconfig    clang-22
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251009    clang-16
hexagon               randconfig-001-20251010    gcc-14.3.0
hexagon               randconfig-002-20251009    clang-16
hexagon               randconfig-002-20251009    clang-19
hexagon               randconfig-002-20251010    gcc-14.3.0
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
loongarch             randconfig-001-20251010    gcc-14.3.0
loongarch             randconfig-002-20251009    clang-16
loongarch             randconfig-002-20251009    gcc-15.1.0
loongarch             randconfig-002-20251010    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    clang-22
mips                           gcw0_defconfig    gcc-15.1.0
mips                           ip22_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251009    clang-16
nios2                 randconfig-001-20251009    gcc-8.5.0
nios2                 randconfig-001-20251010    gcc-14.3.0
nios2                 randconfig-002-20251009    clang-16
nios2                 randconfig-002-20251009    gcc-11.5.0
nios2                 randconfig-002-20251010    gcc-14.3.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                  or1klitex_defconfig    clang-22
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251009    clang-16
parisc                randconfig-001-20251009    gcc-8.5.0
parisc                randconfig-001-20251010    gcc-14.3.0
parisc                randconfig-002-20251009    clang-16
parisc                randconfig-002-20251009    gcc-9.5.0
parisc                randconfig-002-20251010    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                      mgcoge_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20251009    clang-16
powerpc               randconfig-001-20251009    gcc-8.5.0
powerpc               randconfig-001-20251010    gcc-14.3.0
powerpc               randconfig-002-20251009    clang-16
powerpc               randconfig-002-20251009    gcc-11.5.0
powerpc               randconfig-002-20251010    gcc-14.3.0
powerpc               randconfig-003-20251009    clang-16
powerpc               randconfig-003-20251009    gcc-8.5.0
powerpc               randconfig-003-20251010    gcc-14.3.0
powerpc64             randconfig-001-20251009    gcc-10.5.0
powerpc64             randconfig-001-20251010    gcc-14.3.0
powerpc64             randconfig-002-20251009    clang-16
powerpc64             randconfig-002-20251009    clang-22
powerpc64             randconfig-002-20251010    gcc-14.3.0
powerpc64             randconfig-003-20251009    clang-16
powerpc64             randconfig-003-20251009    clang-22
powerpc64             randconfig-003-20251010    gcc-14.3.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                    nommu_k210_defconfig    gcc-15.1.0
riscv                 randconfig-001-20251009    clang-22
riscv                 randconfig-001-20251009    gcc-8.5.0
riscv                 randconfig-001-20251010    gcc-9.5.0
riscv                 randconfig-002-20251009    clang-19
riscv                 randconfig-002-20251009    clang-22
riscv                 randconfig-002-20251010    gcc-9.5.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251009    clang-22
s390                  randconfig-001-20251010    gcc-9.5.0
s390                  randconfig-002-20251009    clang-22
s390                  randconfig-002-20251010    gcc-9.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                         ecovec24_defconfig    gcc-15.1.0
sh                    randconfig-001-20251009    clang-22
sh                    randconfig-001-20251009    gcc-15.1.0
sh                    randconfig-001-20251010    gcc-9.5.0
sh                    randconfig-002-20251009    clang-22
sh                    randconfig-002-20251009    gcc-12.5.0
sh                    randconfig-002-20251010    gcc-9.5.0
sh                           se7721_defconfig    clang-22
sh                            shmin_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251009    clang-22
sparc                 randconfig-001-20251009    gcc-8.5.0
sparc                 randconfig-001-20251010    gcc-9.5.0
sparc                 randconfig-002-20251009    clang-22
sparc                 randconfig-002-20251009    gcc-8.5.0
sparc                 randconfig-002-20251010    gcc-9.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251009    clang-22
sparc64               randconfig-001-20251010    gcc-9.5.0
sparc64               randconfig-002-20251009    clang-22
sparc64               randconfig-002-20251010    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251009    clang-17
um                    randconfig-001-20251009    clang-22
um                    randconfig-001-20251010    gcc-9.5.0
um                    randconfig-002-20251009    clang-22
um                    randconfig-002-20251009    gcc-14
um                    randconfig-002-20251010    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-15.1.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251009    clang-20
x86_64      buildonly-randconfig-001-20251010    gcc-14
x86_64      buildonly-randconfig-002-20251009    clang-20
x86_64      buildonly-randconfig-002-20251010    gcc-14
x86_64      buildonly-randconfig-003-20251009    clang-20
x86_64      buildonly-randconfig-003-20251010    gcc-14
x86_64      buildonly-randconfig-004-20251009    clang-20
x86_64      buildonly-randconfig-004-20251010    gcc-14
x86_64      buildonly-randconfig-005-20251009    clang-20
x86_64      buildonly-randconfig-005-20251010    gcc-14
x86_64      buildonly-randconfig-006-20251009    clang-20
x86_64      buildonly-randconfig-006-20251010    gcc-14
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
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251009    clang-22
xtensa                randconfig-001-20251009    gcc-11.5.0
xtensa                randconfig-001-20251010    gcc-9.5.0
xtensa                randconfig-002-20251009    clang-22
xtensa                randconfig-002-20251009    gcc-8.5.0
xtensa                randconfig-002-20251010    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

