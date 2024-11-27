Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B34D609A1
	for <ath12k@archiver.kernel.org>; Wed, 27 Nov 2024 06:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8WcVwgvPbMcsvpK+ttU0qdQhlC3Gh/nImjFhBU1kkzo=; b=AXM7T+74CJ8jeMVdVewVMaLOdh
	PHg1YAi+wl27m7hDC6bo3DNDL4jJlhfWJwG9UjUuPytxUZVHpyzZWahX041LhKRzivqBXuW29wlYg
	+chghLVnTbrDSJIcrzR4OjLHb2Dru76FLVEjwaO7671k3mcbA4gZKJ2mXrtNhpra4BrH6f+0G4mNS
	ez3PhSdbBb+4QEZthUXe9svOxDFfLcwHBUerGE2mQqUgYyTQrGTzu2vX9+NXTtVHAcxB20exdUpuW
	yyRyR0LM72BewcM4grim2/tbQjUYRV8CwY4575QnrJpiP9v1M/ns39FgiWntFBoS+ishe7Lal8SZs
	qkZtfphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGB7d-0000000CIXd-1tIs
	for ath12k@archiver.kernel.org;
	Wed, 27 Nov 2024 06:01:57 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGB7a-0000000CIWF-25oI
	for ath12k@lists.infradead.org;
	Wed, 27 Nov 2024 06:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732687314; x=1764223314;
  h=date:from:to:cc:subject:message-id;
  bh=yd9ZtkT7g5N1Eo248zSNjapqdL/YvCfxImpmr6jn1hE=;
  b=JcugUYss5uYvDCjprX6A1y+W+aFVPbCcR+3IA/0+xdAfeK5uE4cu2K3q
   APa1cKatpxgquX+rynysQbWU/8LQNFxL8k+A8b+1iT9CXwG2LSalpTRdX
   whiafwUlEJTVoJlZVH4ot5cCsPX+ELd9cpgV882pATnjLq6FoLJcrMFSd
   wcp+nURh8I8M9k+9IAPVfOXHorAFoH6sXdPXltfu8ffLjTPayGyfTSCpM
   wc/y2M8/OoKXJprlfRP4ePyOgCmKmwJxECIkDA/hH2sAYn0ihA5JXZtP7
   Y+3zu4LUxRXoTCfh8ga5JheG7M8aXHPmP6PfgRN8vPJhqKbPfWjyHZCNd
   A==;
X-CSE-ConnectionGUID: ag5BRCtIRLyXMGskZ3DZBg==
X-CSE-MsgGUID: BTYrKeKjSHyG76ImgnwkKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="20473108"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="20473108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 22:01:52 -0800
X-CSE-ConnectionGUID: P+ZvcDjvTRmyD29KaIqF/Q==
X-CSE-MsgGUID: WDtexdaES/68E/bg9dzh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="91789788"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2024 22:01:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGB7U-0007l5-39;
	Wed, 27 Nov 2024 06:01:48 +0000
Date: Wed, 27 Nov 2024 13:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 1d65ca5c771dda54676cc0f735ecd044718d4439
Message-ID: <202411271317.3DBUQuGM-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_220154_545309_05EFE2DF 
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
branch HEAD: 1d65ca5c771dda54676cc0f735ecd044718d4439  wifi: ath12k: ath12k_mac_op_sta_rc_update(): use mac80211 provided link id

elapsed time: 723m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    gcc-14.2.0
arc                   randconfig-001-20241127    gcc-14.2.0
arc                   randconfig-002-20241127    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                         mv78xx0_defconfig    gcc-14.2.0
arm                   randconfig-001-20241127    gcc-14.2.0
arm                   randconfig-002-20241127    gcc-14.2.0
arm                   randconfig-003-20241127    gcc-14.2.0
arm                   randconfig-004-20241127    gcc-14.2.0
arm                        realview_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241127    gcc-14.2.0
arm64                 randconfig-002-20241127    gcc-14.2.0
arm64                 randconfig-003-20241127    gcc-14.2.0
arm64                 randconfig-004-20241127    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241127    gcc-14.2.0
csky                  randconfig-002-20241127    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241127    gcc-14.2.0
hexagon               randconfig-002-20241127    gcc-14.2.0
i386        buildonly-randconfig-001-20241127    clang-19
i386        buildonly-randconfig-002-20241127    clang-19
i386        buildonly-randconfig-003-20241127    clang-19
i386        buildonly-randconfig-004-20241127    clang-19
i386        buildonly-randconfig-005-20241127    clang-19
i386        buildonly-randconfig-006-20241127    clang-19
i386                  randconfig-001-20241127    clang-19
i386                  randconfig-002-20241127    clang-19
i386                  randconfig-003-20241127    clang-19
i386                  randconfig-004-20241127    clang-19
i386                  randconfig-005-20241127    clang-19
i386                  randconfig-006-20241127    clang-19
i386                  randconfig-011-20241127    clang-19
i386                  randconfig-012-20241127    clang-19
i386                  randconfig-013-20241127    clang-19
i386                  randconfig-014-20241127    clang-19
i386                  randconfig-015-20241127    clang-19
i386                  randconfig-016-20241127    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241127    gcc-14.2.0
loongarch             randconfig-002-20241127    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241127    gcc-14.2.0
nios2                 randconfig-002-20241127    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241127    gcc-14.2.0
parisc                randconfig-002-20241127    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                       ppc64_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241127    gcc-14.2.0
powerpc               randconfig-002-20241127    gcc-14.2.0
powerpc               randconfig-003-20241127    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241127    gcc-14.2.0
powerpc64             randconfig-002-20241127    gcc-14.2.0
powerpc64             randconfig-003-20241127    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241127    gcc-14.2.0
riscv                 randconfig-002-20241127    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241127    gcc-14.2.0
s390                  randconfig-002-20241127    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20241127    gcc-14.2.0
sh                    randconfig-002-20241127    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241127    gcc-14.2.0
sparc64               randconfig-002-20241127    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                    randconfig-001-20241127    gcc-14.2.0
um                    randconfig-002-20241127    gcc-14.2.0
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                          rhel-9.4-func    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241127    gcc-14.2.0
xtensa                randconfig-002-20241127    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

