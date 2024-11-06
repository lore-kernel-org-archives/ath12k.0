Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6617BD29F9D
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 07:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+cN3gQ+WLVh+dp+QZad5Mf9sScpAqb4Ke7/DNdqKd8=; b=KRLXUw8O4nUOVBzxZy0x1jQAMm
	bW9UaM3q+ucJl7ur9RDPvf4x5DBccrbdV3gevmD9aCe5A3c37c+CeZGxqnza2P3+3Nnkh7iVmlwic
	lqrwczRfPPA+QPBuycSeF9kWBdHCh/xKhqvqrymh8TtnuIMKnqt2kHZ0ILpTNU1Qm5BaEKdR9eSbw
	5Oxs69eO3FuhZilpqtVmhc5OB/snX3S1dj0TdRRjq1NJJIE1sXyxJBG+BrrSuk/dlwWKyGjqrBfA4
	5xuYDe9VFmzxbZCNemXR8rXfBlG0zWdl6jJ1DOSUUqc0gGAlfW4MA9U7s/jckIbitRqt7TrxcUCZs
	9pwpH2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aCG-000000024ju-0QEf
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 07:11:20 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aBH-000000024cn-11Vj
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 07:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730877020; x=1762413020;
  h=date:from:to:cc:subject:message-id;
  bh=SG+W+0zsev9K2Rg3AmdjCZtFk2jaRZLmCvHvyosNB6o=;
  b=n3Wqbg176EqYYoDA2HoreE8QTSmAUpp1MI1YBfvZgBmDX4w0GoBRjcUa
   CB6qyAqBWTuRwKqCPfewOuMJ6e5fGpzvvDhkMQcf8i0PoiPKOAoV0LPrM
   b07nB7pegD5nDvgRnG+UvI/bN4YKQnRrORgWQIsShYE/shYECPFJPFeTD
   8cdgC5FGASy4PhtWcolozBw82mNy1mqnX+Q80Llox9y7d9rSFf40YhseE
   4eJGJlkiQMsnx/5We6UUKdK2XovfgoKWeAXymnN3DOGFZTboR76SgKC+m
   VmaqRsmIl8V50eU2phZkUgKaesZlj1gwtQhOXDDM+G0kOOApD6zsjvkVU
   g==;
X-CSE-ConnectionGUID: Zc6FRfKmS06SNApLpC3QJA==
X-CSE-MsgGUID: NIuX2BDhRZaLhpUeu0bS2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30511772"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30511772"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 23:10:17 -0800
X-CSE-ConnectionGUID: kcSPNGOhQjCk+RynAXB4CA==
X-CSE-MsgGUID: tJ9bxjlgQmaMWA6Q59QXyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="115165746"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2024 23:10:12 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8aB8-000n2Q-15;
	Wed, 06 Nov 2024 07:10:10 +0000
Date: Wed, 06 Nov 2024 15:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 4203532030ae4aeeb9dad8a21f1bd84661c9cb49
Message-ID: <202411061519.M14ufypx-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_231019_474290_4B5CB4D1 
X-CRM114-Status: UNSURE (   4.03  )
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
branch HEAD: 4203532030ae4aeeb9dad8a21f1bd84661c9cb49  wifi: ath11k: Add firmware coredump collection support

elapsed time: 744m

configs tested: 199
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.1.0
arc                   randconfig-001-20241106    gcc-14.2.0
arc                   randconfig-002-20241106    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         axm55xx_defconfig    gcc-14.1.0
arm                         axm55xx_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                             mxs_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20241106    gcc-14.2.0
arm                   randconfig-002-20241106    gcc-14.2.0
arm                   randconfig-003-20241106    gcc-14.2.0
arm                   randconfig-004-20241106    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.1.0
arm                        shmobile_defconfig    gcc-14.1.0
arm                         socfpga_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241106    gcc-14.2.0
arm64                 randconfig-002-20241106    gcc-14.2.0
arm64                 randconfig-003-20241106    gcc-14.2.0
arm64                 randconfig-004-20241106    gcc-14.2.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241106    gcc-14.2.0
csky                  randconfig-002-20241106    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241106    gcc-14.2.0
hexagon               randconfig-002-20241106    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241106    gcc-12
i386        buildonly-randconfig-002-20241106    gcc-12
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-004-20241106    gcc-12
i386        buildonly-randconfig-005-20241106    gcc-12
i386        buildonly-randconfig-006-20241106    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241106    gcc-12
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-005-20241106    gcc-12
i386                  randconfig-006-20241106    gcc-12
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-015-20241106    gcc-12
i386                  randconfig-016-20241106    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241106    gcc-14.2.0
loongarch             randconfig-002-20241106    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.1.0
mips                           gcw0_defconfig    gcc-14.2.0
mips                            gpr_defconfig    gcc-14.2.0
mips                        vocore2_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241106    gcc-14.2.0
nios2                 randconfig-002-20241106    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241106    gcc-14.2.0
parisc                randconfig-002-20241106    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.1.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241106    gcc-14.2.0
powerpc               randconfig-002-20241106    gcc-14.2.0
powerpc               randconfig-003-20241106    gcc-14.2.0
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.1.0
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241106    gcc-14.2.0
powerpc64             randconfig-002-20241106    gcc-14.2.0
powerpc64             randconfig-003-20241106    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241106    gcc-14.2.0
riscv                 randconfig-002-20241106    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241106    gcc-14.2.0
s390                  randconfig-002-20241106    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                    randconfig-001-20241106    gcc-14.2.0
sh                    randconfig-002-20241106    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.1.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241106    gcc-14.2.0
sparc64               randconfig-002-20241106    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241106    gcc-14.2.0
um                    randconfig-002-20241106    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241106    gcc-11
x86_64      buildonly-randconfig-002-20241106    gcc-11
x86_64      buildonly-randconfig-003-20241106    gcc-11
x86_64      buildonly-randconfig-004-20241106    gcc-11
x86_64      buildonly-randconfig-005-20241106    gcc-11
x86_64      buildonly-randconfig-006-20241106    gcc-11
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241106    gcc-11
x86_64                randconfig-002-20241106    gcc-11
x86_64                randconfig-003-20241106    gcc-11
x86_64                randconfig-004-20241106    gcc-11
x86_64                randconfig-005-20241106    gcc-11
x86_64                randconfig-006-20241106    gcc-11
x86_64                randconfig-011-20241106    gcc-11
x86_64                randconfig-012-20241106    gcc-11
x86_64                randconfig-013-20241106    gcc-11
x86_64                randconfig-014-20241106    gcc-11
x86_64                randconfig-015-20241106    gcc-11
x86_64                randconfig-016-20241106    gcc-11
x86_64                randconfig-071-20241106    gcc-11
x86_64                randconfig-072-20241106    gcc-11
x86_64                randconfig-073-20241106    gcc-11
x86_64                randconfig-074-20241106    gcc-11
x86_64                randconfig-075-20241106    gcc-11
x86_64                randconfig-076-20241106    gcc-11
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241106    gcc-14.2.0
xtensa                randconfig-002-20241106    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

