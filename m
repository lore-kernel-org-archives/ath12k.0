Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F13C5B543
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+8eY2Lo8EPY26rvA1EKFLyYlfA+nGUmL6nMrT2iZ4Ts=; b=WjNcncZV4d3NimB2ojotbphOq9
	Uz+E1kdic9+iQvgSX6Sn0Zc5d0N41ZribDWIMGFNcsryFMbwRoPcNiNqvVO4pGw9o+T0+WMsGOtll
	w6pKMSmukP5T/AR8Vqr51JSEJZ2tDvhVbyesN/jQRdLT/3J2q6yPVtgZL0DeS4NfY8ME28+vcFGMB
	MmbHGeiOexU2RwRE/YBsM/xSi9iIWMJYn5GBomjOo5ugDfCzYKaFcOro3RKyrFt1tkqrTZrtEG8M8
	SdnayQxza2N8hqKet9fqlCZ8WEuhMH/hCPzbhJG6UXBHn5A72+e3UV9DDsUnPOuhOMm1GdJRMNs1L
	AGqA2jAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGWR-0000000GWVU-0rXi;
	Thu, 05 Jun 2025 19:45:07 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGTo-0000000GW7G-0mZG
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 19:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749152544; x=1780688544;
  h=date:from:to:cc:subject:message-id;
  bh=8eTwnz8nTjIz27tiWiPeUkr2xc8W6Di90tKg2MoEw60=;
  b=i0kxMg+8X+oOwJmUd0LQkPAtkIVteFCVuQxjxe+Eb4ZvcDiGM4kzdC/M
   IV0eeiFzXWJvdwn/7ffpo/ym+aBcp3q1T7Dt+uGfUsu/l/pHVg72cBhsO
   ofuKOfflDPwrOAV7mr1bY4dYS1WgtJNEQCVcozCBulVdDTBvBJU/cjq0L
   RsRfPzU/b/rNHeV0DQpQASBDb6DfZ7ghn/jS69xr7TahXPck0gzD3ZxSy
   lFTdsFfmOYmSbHHffVSE+VeYg3Y2jjbPhY7PqNM3qO4Qaa2uWAwdppVrf
   paqogzy/us1IjXcWJvGeA5fSrIh2j3t0uGaBt4DrpLPKr9ZlhoNhufxEB
   g==;
X-CSE-ConnectionGUID: UePsFaxqTiePvV8vanXcCA==
X-CSE-MsgGUID: cVYgnaUQRgee+1u88d64uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62336660"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="62336660"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 12:42:22 -0700
X-CSE-ConnectionGUID: 7w2G2vcGREydn+JGnBNG1Q==
X-CSE-MsgGUID: G1clvDICSMGlf+dEMSz2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="145643001"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Jun 2025 12:42:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNGTj-0004Q5-09;
	Thu, 05 Jun 2025 19:42:19 +0000
Date: Fri, 06 Jun 2025 03:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 6daff9143d25099ec20ba7b05d6b16c642370e01
Message-ID: <202506060334.IuzzobRj-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_124224_328571_BB07ADDF 
X-CRM114-Status: UNSURE (   3.75  )
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
branch HEAD: 6daff9143d25099ec20ba7b05d6b16c642370e01  wifi: ath12k: fix dest ring-buffer corruption when ring is full

elapsed time: 1179m

configs tested: 276
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-12
arc                   randconfig-001-20250605    gcc-15.1.0
arc                   randconfig-001-20250606    gcc-15.1.0
arc                   randconfig-002-20250605    gcc-15.1.0
arc                   randconfig-002-20250606    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    gcc-15.1.0
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                      integrator_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250605    clang-21
arm                   randconfig-001-20250606    gcc-15.1.0
arm                   randconfig-002-20250605    clang-17
arm                   randconfig-002-20250606    gcc-15.1.0
arm                   randconfig-003-20250605    clang-21
arm                   randconfig-003-20250606    gcc-15.1.0
arm                   randconfig-004-20250605    clang-21
arm                   randconfig-004-20250606    gcc-15.1.0
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250605    clang-21
arm64                 randconfig-001-20250606    gcc-15.1.0
arm64                 randconfig-002-20250605    clang-21
arm64                 randconfig-002-20250606    gcc-15.1.0
arm64                 randconfig-003-20250605    clang-21
arm64                 randconfig-003-20250606    gcc-15.1.0
arm64                 randconfig-004-20250605    clang-21
arm64                 randconfig-004-20250606    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250605    gcc-10.5.0
csky                  randconfig-001-20250606    gcc-13.3.0
csky                  randconfig-002-20250605    gcc-15.1.0
csky                  randconfig-002-20250606    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250605    clang-21
hexagon               randconfig-001-20250606    gcc-13.3.0
hexagon               randconfig-002-20250605    clang-20
hexagon               randconfig-002-20250606    gcc-13.3.0
i386                             alldefconfig    gcc-12
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250605    gcc-12
i386        buildonly-randconfig-001-20250606    gcc-12
i386        buildonly-randconfig-002-20250605    clang-20
i386        buildonly-randconfig-002-20250606    gcc-12
i386        buildonly-randconfig-003-20250605    gcc-12
i386        buildonly-randconfig-003-20250606    gcc-12
i386        buildonly-randconfig-004-20250605    clang-20
i386        buildonly-randconfig-004-20250606    gcc-12
i386        buildonly-randconfig-005-20250605    clang-20
i386        buildonly-randconfig-005-20250606    gcc-12
i386        buildonly-randconfig-006-20250605    gcc-11
i386        buildonly-randconfig-006-20250606    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250606    clang-20
i386                  randconfig-002-20250606    clang-20
i386                  randconfig-003-20250606    clang-20
i386                  randconfig-004-20250606    clang-20
i386                  randconfig-005-20250606    clang-20
i386                  randconfig-006-20250606    clang-20
i386                  randconfig-007-20250606    clang-20
i386                  randconfig-011-20250606    clang-20
i386                  randconfig-012-20250606    clang-20
i386                  randconfig-013-20250606    clang-20
i386                  randconfig-014-20250606    clang-20
i386                  randconfig-015-20250606    clang-20
i386                  randconfig-016-20250606    clang-20
i386                  randconfig-017-20250606    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250605    gcc-12.4.0
loongarch             randconfig-001-20250606    gcc-13.3.0
loongarch             randconfig-002-20250605    gcc-15.1.0
loongarch             randconfig-002-20250606    gcc-13.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                     decstation_defconfig    gcc-12
mips                      fuloong2e_defconfig    gcc-15.1.0
mips                           ip22_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    gcc-12
mips                         rt305x_defconfig    gcc-12
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250605    gcc-14.2.0
nios2                 randconfig-001-20250606    gcc-13.3.0
nios2                 randconfig-002-20250605    gcc-11.5.0
nios2                 randconfig-002-20250606    gcc-13.3.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250605    gcc-9.3.0
parisc                randconfig-001-20250606    gcc-13.3.0
parisc                randconfig-002-20250605    gcc-11.5.0
parisc                randconfig-002-20250606    gcc-13.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-21
powerpc                        icon_defconfig    gcc-12
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    clang-21
powerpc                         ps3_defconfig    gcc-12
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250605    clang-21
powerpc               randconfig-001-20250606    gcc-13.3.0
powerpc               randconfig-002-20250605    clang-21
powerpc               randconfig-002-20250606    gcc-13.3.0
powerpc               randconfig-003-20250605    clang-21
powerpc               randconfig-003-20250606    gcc-13.3.0
powerpc64             randconfig-001-20250605    clang-18
powerpc64             randconfig-001-20250606    gcc-13.3.0
powerpc64             randconfig-002-20250605    clang-21
powerpc64             randconfig-002-20250606    gcc-13.3.0
powerpc64             randconfig-003-20250605    clang-21
powerpc64             randconfig-003-20250606    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250605    clang-21
riscv                 randconfig-001-20250606    gcc-12
riscv                 randconfig-002-20250605    clang-21
riscv                 randconfig-002-20250606    gcc-12
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20250605    clang-21
s390                  randconfig-001-20250606    gcc-12
s390                  randconfig-002-20250605    clang-21
s390                  randconfig-002-20250606    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250605    gcc-12.4.0
sh                    randconfig-001-20250606    gcc-12
sh                    randconfig-002-20250605    gcc-12.4.0
sh                    randconfig-002-20250606    gcc-12
sh                           se7619_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250605    gcc-11.5.0
sparc                 randconfig-001-20250606    gcc-12
sparc                 randconfig-002-20250605    gcc-7.5.0
sparc                 randconfig-002-20250606    gcc-12
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250605    gcc-12.4.0
sparc64               randconfig-001-20250606    gcc-12
sparc64               randconfig-002-20250605    gcc-15.1.0
sparc64               randconfig-002-20250606    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250605    clang-21
um                    randconfig-001-20250606    gcc-12
um                    randconfig-002-20250605    clang-21
um                    randconfig-002-20250606    gcc-12
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250605    clang-20
x86_64      buildonly-randconfig-001-20250606    gcc-12
x86_64      buildonly-randconfig-002-20250605    gcc-12
x86_64      buildonly-randconfig-002-20250606    gcc-12
x86_64      buildonly-randconfig-003-20250605    clang-20
x86_64      buildonly-randconfig-003-20250606    gcc-12
x86_64      buildonly-randconfig-004-20250605    clang-20
x86_64      buildonly-randconfig-004-20250606    gcc-12
x86_64      buildonly-randconfig-005-20250605    gcc-12
x86_64      buildonly-randconfig-005-20250606    gcc-12
x86_64      buildonly-randconfig-006-20250605    clang-20
x86_64      buildonly-randconfig-006-20250606    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250606    gcc-11
x86_64                randconfig-002-20250606    gcc-11
x86_64                randconfig-003-20250606    gcc-11
x86_64                randconfig-004-20250606    gcc-11
x86_64                randconfig-005-20250606    gcc-11
x86_64                randconfig-006-20250606    gcc-11
x86_64                randconfig-007-20250606    gcc-11
x86_64                randconfig-008-20250606    gcc-11
x86_64                randconfig-071-20250606    gcc-12
x86_64                randconfig-072-20250606    gcc-12
x86_64                randconfig-073-20250606    gcc-12
x86_64                randconfig-074-20250606    gcc-12
x86_64                randconfig-075-20250606    gcc-12
x86_64                randconfig-076-20250606    gcc-12
x86_64                randconfig-077-20250606    gcc-12
x86_64                randconfig-078-20250606    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250605    gcc-7.5.0
xtensa                randconfig-001-20250606    gcc-12
xtensa                randconfig-002-20250605    gcc-12.4.0
xtensa                randconfig-002-20250606    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

