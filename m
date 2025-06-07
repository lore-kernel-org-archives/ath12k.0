Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22E7C61CE7
	for <ath12k@archiver.kernel.org>; Sat,  7 Jun 2025 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BuP1VhMJKu/ahCqywCf6/RoWKX7IhYHSyzlUkUcloM8=; b=ZSI7C+HL9uJpH9fjtUPwI3+KRW
	7HV0GXFEtzZn/crA5zBKelG18ekV1Pm2J+iXGzAx/M/1SG1PEcwOpV3EnnQjNcGDmgLbE4hkzpl/I
	RQMEzEwSoUnwIdJh7ukl8cJXOvcRqhdxN1vxQDUry8248r5Yu2yRmeuzXGETC6yt/wMmKQO/V+YFV
	zc5zNlUDaNHpQFv6MFJry74KykT8Apt44cHRI862GJsQipBroqxE9P4/yaHafONGvalwDwXbCMPlb
	SPneiibNHXOboivFfB9YWEW3kc7lxRoAQN7/KEBYExFs+eqDXqr8cCC5hSS2mMO6u0SRql/e2XoLF
	Qri13mEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqDN-00000001VpG-1sce;
	Sat, 07 Jun 2025 09:51:49 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNq5P-00000001V9E-1keU
	for ath12k@lists.infradead.org;
	Sat, 07 Jun 2025 09:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749289416; x=1780825416;
  h=date:from:to:cc:subject:message-id;
  bh=U2FP6hGEs4BznIAq5TDaproCr6dO2MpMZPmy96wrTwU=;
  b=NRSgaVBB8UeYkCb5jrd93aMZYBqyh6h2/5I149F76WAMksfg/gpk+y2A
   Gns37N9ttlVkHCwMpzkQhvaCdInxIPRttjnNKPbPUl+Q5bM/9fFhr8tfx
   aRMhdyOyAiGLsm/AGc+4NqSLDBkTaiu8fkTAPVVOQx5ySFvuaPTpyl39f
   TnsUuB+x85nvte6y6wrpcqT2a9EdDHy254R4Fs26IObysRerWquyymsOl
   49k+wzPRkMAgaPNRD9vx03NNfze/jX7JycdGpRqril+yLhKyNSSYspTu+
   jnqMBjYVbkjO9ga8ZpYJ0Ul2UOnPMKUyTUxrBJLksNvtY1RmlJH+C6rKK
   w==;
X-CSE-ConnectionGUID: 9JK7Jaf5QOixb32mVoNPwg==
X-CSE-MsgGUID: SNV/zy0wTlKs35cDhN6KRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51338286"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="51338286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 02:43:34 -0700
X-CSE-ConnectionGUID: 1E3FrBYYRYaaYRKu9RqmOg==
X-CSE-MsgGUID: uM8xFtGUQLyzKu6ZI8fWMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="151296111"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jun 2025 02:43:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNq5J-0005bJ-3C;
	Sat, 07 Jun 2025 09:43:29 +0000
Date: Sat, 07 Jun 2025 17:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 986cb3f8d8f690f085c14c549fa2c859df78a7a7
Message-ID: <202506071754.MMnyhwjg-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_024335_508558_74CBBE74 
X-CRM114-Status: UNSURE (   3.66  )
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
branch HEAD: 986cb3f8d8f690f085c14c549fa2c859df78a7a7  Merge branch 'pending' into main-pending

elapsed time: 728m

configs tested: 238
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250607    clang-21
arc                   randconfig-001-20250607    gcc-15.1.0
arc                   randconfig-002-20250607    clang-21
arc                   randconfig-002-20250607    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-21
arm                       imx_v4_v5_defconfig    clang-21
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250607    clang-21
arm                   randconfig-002-20250607    clang-21
arm                   randconfig-002-20250607    gcc-13.3.0
arm                   randconfig-003-20250607    clang-21
arm                   randconfig-003-20250607    gcc-15.1.0
arm                   randconfig-004-20250607    clang-21
arm                   randconfig-004-20250607    gcc-14.3.0
arm                        spear3xx_defconfig    clang-17
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250607    clang-21
arm64                 randconfig-002-20250607    clang-21
arm64                 randconfig-003-20250607    clang-21
arm64                 randconfig-004-20250607    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250607    clang-21
csky                  randconfig-001-20250607    gcc-12.4.0
csky                  randconfig-002-20250607    clang-21
csky                  randconfig-002-20250607    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250607    clang-21
hexagon               randconfig-002-20250607    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250607    clang-20
i386        buildonly-randconfig-002-20250607    gcc-12
i386        buildonly-randconfig-003-20250607    gcc-12
i386        buildonly-randconfig-004-20250607    gcc-12
i386        buildonly-randconfig-005-20250607    clang-20
i386        buildonly-randconfig-006-20250607    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250607    gcc-12
i386                  randconfig-002-20250607    gcc-12
i386                  randconfig-003-20250607    gcc-12
i386                  randconfig-004-20250607    gcc-12
i386                  randconfig-005-20250607    gcc-12
i386                  randconfig-006-20250607    gcc-12
i386                  randconfig-007-20250607    gcc-12
i386                  randconfig-011-20250607    gcc-12
i386                  randconfig-012-20250607    gcc-12
i386                  randconfig-013-20250607    gcc-12
i386                  randconfig-014-20250607    gcc-12
i386                  randconfig-015-20250607    gcc-12
i386                  randconfig-016-20250607    gcc-12
i386                  randconfig-017-20250607    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250607    clang-21
loongarch             randconfig-001-20250607    gcc-13.3.0
loongarch             randconfig-002-20250607    clang-21
loongarch             randconfig-002-20250607    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  decstation_64_defconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
mips                           jazz_defconfig    clang-17
mips                      maltasmvp_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    gcc-15.1.0
mips                           rs90_defconfig    gcc-15.1.0
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250607    clang-21
nios2                 randconfig-001-20250607    gcc-10.5.0
nios2                 randconfig-002-20250607    clang-21
nios2                 randconfig-002-20250607    gcc-5.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250607    clang-21
parisc                randconfig-001-20250607    gcc-12.4.0
parisc                randconfig-002-20250607    clang-21
parisc                randconfig-002-20250607    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    clang-21
powerpc                       eiger_defconfig    clang-21
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-21
powerpc                      ppc64e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250607    clang-21
powerpc               randconfig-001-20250607    gcc-10.5.0
powerpc               randconfig-002-20250607    clang-21
powerpc               randconfig-003-20250607    clang-21
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250607    clang-19
powerpc64             randconfig-001-20250607    clang-21
powerpc64             randconfig-002-20250607    clang-21
powerpc64             randconfig-003-20250607    clang-21
powerpc64             randconfig-003-20250607    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250607    clang-21
riscv                 randconfig-001-20250607    gcc-12
riscv                 randconfig-002-20250607    clang-16
riscv                 randconfig-002-20250607    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250607    clang-16
s390                  randconfig-001-20250607    gcc-12
s390                  randconfig-002-20250607    gcc-12
s390                  randconfig-002-20250607    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250607    gcc-12
sh                    randconfig-001-20250607    gcc-14.3.0
sh                    randconfig-002-20250607    gcc-12
sh                    randconfig-002-20250607    gcc-9.3.0
sh                          rsk7264_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250607    gcc-10.3.0
sparc                 randconfig-001-20250607    gcc-12
sparc                 randconfig-002-20250607    gcc-12
sparc                 randconfig-002-20250607    gcc-12.4.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250607    gcc-12
sparc64               randconfig-001-20250607    gcc-9.3.0
sparc64               randconfig-002-20250607    gcc-12
sparc64               randconfig-002-20250607    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250607    clang-21
um                    randconfig-001-20250607    gcc-12
um                    randconfig-002-20250607    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250607    clang-20
x86_64      buildonly-randconfig-002-20250607    clang-20
x86_64      buildonly-randconfig-003-20250607    clang-20
x86_64      buildonly-randconfig-004-20250607    gcc-12
x86_64      buildonly-randconfig-005-20250607    gcc-12
x86_64      buildonly-randconfig-006-20250607    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250607    clang-20
x86_64                randconfig-002-20250607    clang-20
x86_64                randconfig-003-20250607    clang-20
x86_64                randconfig-004-20250607    clang-20
x86_64                randconfig-005-20250607    clang-20
x86_64                randconfig-006-20250607    clang-20
x86_64                randconfig-007-20250607    clang-20
x86_64                randconfig-008-20250607    clang-20
x86_64                randconfig-071-20250607    clang-20
x86_64                randconfig-072-20250607    clang-20
x86_64                randconfig-073-20250607    clang-20
x86_64                randconfig-074-20250607    clang-20
x86_64                randconfig-075-20250607    clang-20
x86_64                randconfig-076-20250607    clang-20
x86_64                randconfig-077-20250607    clang-20
x86_64                randconfig-078-20250607    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250607    gcc-10.5.0
xtensa                randconfig-001-20250607    gcc-12
xtensa                randconfig-002-20250607    gcc-12
xtensa                randconfig-002-20250607    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

