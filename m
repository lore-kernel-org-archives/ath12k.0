Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8771B606A31F
	for <ath12k@archiver.kernel.org>; Wed, 28 Oct 2026 04:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNh2FJwY;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dO54kGh/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GtDZlqG/7XCNMCc/CBOrXLYZy2kPOMoBMOX+fF71Qes=; b=cNh2FJwYRy53QRMrOz1j3LBMwY
	PbaRL5UODlU1MWyxqbNvFUUaZmyaVC3p/kAPaGU4Od7vvJ3BNMBfDV4b9H4zFmR5CopcmfVIABoCU
	hw7P/K+bQ3/buMTDwk4+rGadHKNX99KaAADZ8j/4O8BbdC2JbauhOHSEtmjMcK0qN96lB7pA3iSdj
	frqoIooXhlG1iiqBmTVUu3B/LjRu63QEuNqbUWLTSySK8s4A4iQRNB2bVVzsVcEnc/sWy8bD6cdcx
	d0gI2MnGrQOMaFfJDw3tkxprcHxE0lKMnDbRd9cBAsfSe5ygr+uilpYbkkqrq3kgY0b/VypUTJFj9
	5UMUpcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvBx-00000006H1V-1YoM;
	Wed, 28 Oct 2026 04:23:13 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvBt-00000006GzH-43GS
	for ath12k@lists.infradead.org;
	Wed, 28 Oct 2026 04:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793161390; x=1824697390;
  h=date:from:to:cc:subject:message-id;
  bh=LzrVNibiMEoggeDSNipi8NraFypqj/I2SZ2dK7GUqPs=;
  b=dO54kGh/e5kvG47rOAO5CFcFCZeYPH250A6ioRRwgayKBkLabeLCzx26
   9FsaAWqjybnQGlHeyRq9FUBPqG4d912BDkR082xeBu2Bbwj0ATHyIecKM
   KUsro6cIxXl5vqveS3tRdAMhx/jVeos/QpVCvel/suhND52n6WSAAKzfL
   lQ5gQEnTpedgXDNc/ZEJjw5W1XBTdxP4iocwpc7WACMt4PIXImxbYhsvN
   5dOJtRCToRapByBLI9orKk2YBZ1mnfkZCCor29RIF2y6ej0X90c/LrhfR
   v63+ZxDKD1gYaxZocb4FeXCStFXslKxAuheqUISxdP7UKWgXEX6CqggsN
   Q==;
X-CSE-ConnectionGUID: rCB4DsgVQQykZliUcBhAqw==
X-CSE-MsgGUID: KaVYCygMQNWAPmUXeLdjJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1902335"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1902335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 21:23:07 -0700
X-CSE-ConnectionGUID: FE0cJQwyRkqBuF9p+T5Wkg==
X-CSE-MsgGUID: wFZYhb7mTg28k2WaGXlC6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4815848"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2026 21:23:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvBn-00000000Y9z-1ptH;
	Wed, 28 Oct 2026 04:23:03 +0000
Date: Wed, 28 Oct 2026 12:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-current] BUILD SUCCESS
 9d8ec0b5b5295bd23d979d1b2b905de25c36fff2
Message-ID: <202610281222.3VLZ6D8G-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_212310_033633_45F4FA0B 
X-CRM114-Status: UNSURE (   3.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-current
branch HEAD: 9d8ec0b5b5295bd23d979d1b2b905de25c36fff2  wifi: cfg80211: fix out-of-bounds read in valid_rule()

elapsed time: 6764m

configs tested: 639
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               alldefconfig    clang-17
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                           axs101_defconfig    gcc-16.2.0
arc                           axs103_defconfig    gcc-16.2.0
arc                       axs103_smp_defconfig    clang-17
arc                                  defconfig    gcc-16.2.0
arc                             hsdk_defconfig    clang-24
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261024    clang-24
arc                   randconfig-1000-20261025    clang-24
arc                   randconfig-1000-20261026    clang-24
arc                   randconfig-1000-20261027    gcc-10.5.0
arc                   randconfig-1001-20261024    clang-24
arc                   randconfig-1001-20261025    clang-24
arc                   randconfig-1001-20261026    clang-24
arc                   randconfig-1001-20261027    gcc-10.5.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                               allyesconfig    gcc-16.2.0
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                        aspeed_g4_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           exynos_defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                             hisi_defconfig    gcc-16.2.0
arm                        imx_v4_v5_defconfig    gcc-16.2.0
arm                            imxrt_defconfig    clang-17
arm                       integrator_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                             mmp2_defconfig    clang-24
arm                             mmp2_defconfig    gcc-16.2.0
arm                        multi_v4t_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    gcc-16.2.0
arm                              mxs_defconfig    clang-17
arm                            omap1_defconfig    clang-24
arm                          orion5x_defconfig    clang-17
arm                           pxa910_defconfig    gcc-16.2.0
arm                              pxa_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261024    clang-24
arm                   randconfig-1000-20261025    clang-24
arm                   randconfig-1000-20261026    clang-24
arm                   randconfig-1000-20261027    gcc-10.5.0
arm                   randconfig-1001-20261024    clang-24
arm                   randconfig-1001-20261025    clang-24
arm                   randconfig-1001-20261026    clang-24
arm                   randconfig-1001-20261027    gcc-10.5.0
arm                   randconfig-1002-20261024    clang-24
arm                   randconfig-1002-20261025    clang-24
arm                   randconfig-1002-20261026    clang-24
arm                   randconfig-1002-20261027    gcc-10.5.0
arm                   randconfig-1003-20261024    clang-24
arm                   randconfig-1003-20261025    clang-24
arm                   randconfig-1003-20261026    clang-24
arm                   randconfig-1003-20261027    gcc-10.5.0
arm                          s5pv210_defconfig    clang-24
arm                          socfpga_defconfig    gcc-16.2.0
arm                        spear13xx_defconfig    gcc-16.2.0
arm                         spear6xx_defconfig    gcc-16.2.0
arm                            stm32_defconfig    gcc-16.2.0
arm                            tegra_defconfig    clang-24
arm                        versatile_defconfig    clang-24
arm                        versatile_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    gcc-16.2.0
arm                     vt8500_v6_v7_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261023    gcc-8.5.0
arm64                 randconfig-1000-20261024    gcc-10.5.0
arm64                 randconfig-1000-20261025    clang-24
arm64                 randconfig-1000-20261026    clang-24
arm64                 randconfig-1000-20261027    gcc-8.5.0
arm64                 randconfig-1001-20261023    gcc-8.5.0
arm64                 randconfig-1001-20261024    gcc-10.5.0
arm64                 randconfig-1001-20261025    clang-24
arm64                 randconfig-1001-20261026    clang-24
arm64                 randconfig-1001-20261027    gcc-8.5.0
arm64                 randconfig-1002-20261023    gcc-8.5.0
arm64                 randconfig-1002-20261024    gcc-10.5.0
arm64                 randconfig-1002-20261025    clang-24
arm64                 randconfig-1002-20261026    clang-24
arm64                 randconfig-1002-20261027    gcc-8.5.0
arm64                 randconfig-1003-20261023    gcc-8.5.0
arm64                 randconfig-1003-20261024    gcc-10.5.0
arm64                 randconfig-1003-20261025    clang-24
arm64                 randconfig-1003-20261026    clang-24
arm64                 randconfig-1003-20261027    gcc-8.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261023    gcc-8.5.0
csky                  randconfig-1000-20261024    gcc-10.5.0
csky                  randconfig-1000-20261025    clang-24
csky                  randconfig-1000-20261026    clang-24
csky                  randconfig-1000-20261027    gcc-8.5.0
csky                  randconfig-1001-20261023    gcc-8.5.0
csky                  randconfig-1001-20261024    gcc-10.5.0
csky                  randconfig-1001-20261025    clang-24
csky                  randconfig-1001-20261026    clang-24
csky                  randconfig-1001-20261027    gcc-8.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261024    clang-24
hexagon               randconfig-1000-20261025    clang-24
hexagon               randconfig-1000-20261026    clang-24
hexagon               randconfig-1000-20261027    clang-24
hexagon               randconfig-1001-20261024    clang-24
hexagon               randconfig-1001-20261025    clang-24
hexagon               randconfig-1001-20261026    clang-24
hexagon               randconfig-1001-20261027    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261024    clang-22
i386        buildonly-randconfig-1000-20261025    gcc-14
i386        buildonly-randconfig-1000-20261026    clang-22
i386        buildonly-randconfig-1000-20261027    clang-22
i386        buildonly-randconfig-1001-20261024    clang-22
i386        buildonly-randconfig-1001-20261025    gcc-14
i386        buildonly-randconfig-1001-20261026    clang-22
i386        buildonly-randconfig-1001-20261027    clang-22
i386        buildonly-randconfig-1002-20261024    clang-22
i386        buildonly-randconfig-1002-20261025    gcc-14
i386        buildonly-randconfig-1002-20261026    clang-22
i386        buildonly-randconfig-1002-20261027    clang-22
i386        buildonly-randconfig-1003-20261024    clang-22
i386        buildonly-randconfig-1003-20261025    gcc-14
i386        buildonly-randconfig-1003-20261026    clang-22
i386        buildonly-randconfig-1003-20261027    clang-22
i386        buildonly-randconfig-1004-20261024    clang-22
i386        buildonly-randconfig-1004-20261025    gcc-14
i386        buildonly-randconfig-1004-20261026    clang-22
i386        buildonly-randconfig-1004-20261027    clang-22
i386        buildonly-randconfig-1005-20261024    clang-22
i386        buildonly-randconfig-1005-20261025    gcc-14
i386        buildonly-randconfig-1005-20261026    clang-22
i386        buildonly-randconfig-1005-20261027    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261023    gcc-14
i386                  randconfig-1000-20261024    clang-22
i386                  randconfig-1000-20261025    clang-22
i386                  randconfig-1000-20261026    gcc-14
i386                  randconfig-1000-20261027    gcc-14
i386                  randconfig-1001-20261023    gcc-14
i386                  randconfig-1001-20261024    clang-22
i386                  randconfig-1001-20261025    clang-22
i386                  randconfig-1001-20261026    gcc-14
i386                  randconfig-1001-20261027    gcc-14
i386                  randconfig-1002-20261023    gcc-14
i386                  randconfig-1002-20261024    clang-22
i386                  randconfig-1002-20261025    clang-22
i386                  randconfig-1002-20261026    gcc-14
i386                  randconfig-1002-20261027    gcc-14
i386                  randconfig-1003-20261023    gcc-14
i386                  randconfig-1003-20261024    clang-22
i386                  randconfig-1003-20261025    clang-22
i386                  randconfig-1003-20261026    gcc-14
i386                  randconfig-1003-20261027    gcc-14
i386                  randconfig-1004-20261023    gcc-14
i386                  randconfig-1004-20261024    clang-22
i386                  randconfig-1004-20261025    clang-22
i386                  randconfig-1004-20261026    gcc-14
i386                  randconfig-1004-20261027    gcc-14
i386                  randconfig-1005-20261023    gcc-14
i386                  randconfig-1005-20261024    clang-22
i386                  randconfig-1005-20261025    clang-22
i386                  randconfig-1005-20261026    gcc-14
i386                  randconfig-1005-20261027    gcc-14
i386                  randconfig-1006-20261023    gcc-14
i386                  randconfig-1006-20261024    clang-22
i386                  randconfig-1006-20261025    clang-22
i386                  randconfig-1006-20261026    gcc-14
i386                  randconfig-1006-20261027    gcc-14
i386                  randconfig-1007-20261024    gcc-14
i386                  randconfig-1007-20261025    gcc-14
i386                  randconfig-1007-20261026    clang-22
i386                  randconfig-1007-20261027    gcc-14
i386                  randconfig-1008-20261024    gcc-14
i386                  randconfig-1008-20261025    gcc-14
i386                  randconfig-1008-20261026    clang-22
i386                  randconfig-1008-20261027    gcc-14
i386                  randconfig-1009-20261024    gcc-14
i386                  randconfig-1009-20261025    gcc-14
i386                  randconfig-1009-20261026    clang-22
i386                  randconfig-1009-20261027    gcc-14
i386                  randconfig-1010-20261024    gcc-14
i386                  randconfig-1010-20261025    gcc-14
i386                  randconfig-1010-20261026    clang-22
i386                  randconfig-1010-20261027    gcc-14
i386                  randconfig-1011-20261024    gcc-14
i386                  randconfig-1011-20261025    gcc-14
i386                  randconfig-1011-20261026    clang-22
i386                  randconfig-1011-20261027    gcc-14
i386                  randconfig-1012-20261024    gcc-14
i386                  randconfig-1012-20261025    gcc-14
i386                  randconfig-1012-20261026    clang-22
i386                  randconfig-1012-20261027    gcc-14
i386                  randconfig-1013-20261024    gcc-14
i386                  randconfig-1013-20261025    gcc-14
i386                  randconfig-1013-20261026    clang-22
i386                  randconfig-1013-20261027    gcc-14
loongarch                         alldefconfig    gcc-16.2.0
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    gcc-11.5.0
loongarch             randconfig-1000-20261024    clang-24
loongarch             randconfig-1000-20261025    clang-24
loongarch             randconfig-1000-20261026    clang-24
loongarch             randconfig-1000-20261027    clang-24
loongarch             randconfig-1001-20261024    clang-24
loongarch             randconfig-1001-20261025    clang-24
loongarch             randconfig-1001-20261026    clang-24
loongarch             randconfig-1001-20261027    clang-24
m68k                              alldefconfig    gcc-16.2.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                          apollo_defconfig    clang-17
m68k                          apollo_defconfig    clang-24
m68k                        bvme6000_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    gcc-16.2.0
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                        m5275evb_defconfig    clang-17
m68k                        m5275evb_defconfig    gcc-16.2.0
m68k                        m5329evb_defconfig    clang-17
m68k                        m5475evb_defconfig    clang-24
m68k                             mac_defconfig    gcc-16.2.0
m68k                         mvme147_defconfig    gcc-16.2.0
m68k                             q40_defconfig    gcc-16.2.0
m68k                         stmark2_defconfig    gcc-16.2.0
m68k                            sun3_defconfig    clang-17
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    clang-17
mips                       bmips_stb_defconfig    clang-17
mips                            ci20_defconfig    clang-17
mips                            ci20_defconfig    gcc-16.2.0
mips                          cobalt_defconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                  decstation_r4k_defconfig    gcc-16.2.0
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    clang-17
mips                            gcw0_defconfig    clang-24
mips                       loongson1_defconfig    gcc-16.2.0
mips                           malta_defconfig    gcc-11.5.0
mips                 malta_qemu_32r6_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-17
mips                     maltaup_xpa_defconfig    gcc-11.5.0
mips                         omega2p_defconfig    gcc-16.2.0
mips                           rb532_defconfig    clang-24
mips                    sb1250_swarm_defconfig    gcc-16.2.0
mips                            xway_defconfig    clang-17
mips                            xway_defconfig    gcc-16.2.0
nios2                          3c120_defconfig    clang-24
nios2                             alldefconfig    gcc-11.5.0
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                              allnoconfig    gcc-16.2.0
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261024    clang-24
nios2                 randconfig-1000-20261025    clang-24
nios2                 randconfig-1000-20261026    clang-24
nios2                 randconfig-1000-20261027    clang-24
nios2                 randconfig-1001-20261024    clang-24
nios2                 randconfig-1001-20261025    clang-24
nios2                 randconfig-1001-20261026    clang-24
nios2                 randconfig-1001-20261027    clang-24
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                           allnoconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    gcc-16.2.0
openrisc                        virt_defconfig    clang-24
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                             allnoconfig    gcc-16.2.0
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.2.0
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261023    gcc-15.3.0
parisc                randconfig-1000-20261024    clang-24
parisc                randconfig-1000-20261025    clang-24
parisc                randconfig-1000-20261026    gcc-14.4.0
parisc                randconfig-1000-20261027    clang-22
parisc                randconfig-1001-20261023    gcc-15.3.0
parisc                randconfig-1001-20261024    clang-24
parisc                randconfig-1001-20261025    clang-24
parisc                randconfig-1001-20261026    gcc-14.4.0
parisc                randconfig-1001-20261027    clang-22
parisc64                          alldefconfig    clang-17
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                            allnoconfig    gcc-16.2.0
powerpc                     amigaone_defconfig    gcc-16.2.0
powerpc                       arches_defconfig    gcc-16.2.0
powerpc                      asp8347_defconfig    clang-24
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                       bamboo_defconfig    clang-17
powerpc                       bamboo_defconfig    clang-24
powerpc                       chrp32_defconfig    gcc-16.2.0
powerpc                        ebony_defconfig    gcc-11.5.0
powerpc                        eiger_defconfig    clang-24
powerpc                      ep8248e_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                  linkstation_defconfig    clang-17
powerpc                      mpc512x_defconfig    gcc-11.5.0
powerpc                      mpc5200_defconfig    clang-17
powerpc                      mpc5200_defconfig    clang-24
powerpc                  mpc8315_rdb_defconfig    clang-17
powerpc                  mpc836x_rdk_defconfig    clang-17
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    clang-24
powerpc                     mvme5100_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                      powernv_defconfig    gcc-16.2.0
powerpc                       ppc44x_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261023    gcc-15.3.0
powerpc               randconfig-1000-20261024    clang-24
powerpc               randconfig-1000-20261025    clang-24
powerpc               randconfig-1000-20261026    gcc-14.4.0
powerpc               randconfig-1000-20261027    clang-22
powerpc               randconfig-1001-20261023    gcc-15.3.0
powerpc               randconfig-1001-20261024    clang-24
powerpc               randconfig-1001-20261025    clang-24
powerpc               randconfig-1001-20261026    gcc-14.4.0
powerpc               randconfig-1001-20261027    clang-22
powerpc                     sam440ep_defconfig    clang-17
powerpc                      skiroot_defconfig    clang-24
powerpc                      skiroot_defconfig    gcc-11.5.0
powerpc                      skiroot_defconfig    gcc-16.2.0
powerpc                      tqm8540_defconfig    clang-24
powerpc                      tqm8540_defconfig    gcc-16.2.0
powerpc                      tqm8548_defconfig    gcc-16.2.0
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc                      tqm8560_defconfig    clang-17
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261023    gcc-15.3.0
powerpc64             randconfig-1000-20261024    clang-24
powerpc64             randconfig-1000-20261025    clang-24
powerpc64             randconfig-1000-20261026    gcc-14.4.0
powerpc64             randconfig-1000-20261027    clang-22
powerpc64             randconfig-1001-20261023    gcc-15.3.0
powerpc64             randconfig-1001-20261024    clang-24
powerpc64             randconfig-1001-20261025    clang-24
powerpc64             randconfig-1001-20261026    gcc-14.4.0
powerpc64             randconfig-1001-20261027    clang-22
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                              allnoconfig    gcc-16.2.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
riscv                     nommu_virt_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261023    gcc-16.2.0
riscv                 randconfig-1000-20261024    gcc-11.5.0
riscv                 randconfig-1000-20261025    gcc-10.5.0
riscv                 randconfig-1000-20261026    gcc-13.5.0
riscv                 randconfig-1000-20261027    gcc-16.2.0
riscv                 randconfig-1001-20261023    gcc-16.2.0
riscv                 randconfig-1001-20261024    gcc-11.5.0
riscv                 randconfig-1001-20261025    gcc-10.5.0
riscv                 randconfig-1001-20261026    gcc-13.5.0
riscv                 randconfig-1001-20261027    gcc-16.2.0
riscv                         rzfive_defconfig    gcc-16.2.0
s390                              alldefconfig    gcc-16.2.0
s390                              allmodconfig    clang-17
s390                              allmodconfig    gcc-16.2.0
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261023    gcc-16.2.0
s390                  randconfig-1000-20261024    gcc-11.5.0
s390                  randconfig-1000-20261025    gcc-10.5.0
s390                  randconfig-1000-20261026    gcc-13.5.0
s390                  randconfig-1000-20261027    gcc-16.2.0
s390                  randconfig-1001-20261023    gcc-16.2.0
s390                  randconfig-1001-20261024    gcc-11.5.0
s390                  randconfig-1001-20261025    gcc-10.5.0
s390                  randconfig-1001-20261026    gcc-13.5.0
s390                  randconfig-1001-20261027    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                 allnoconfig    gcc-16.2.0
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                          ap325rxa_defconfig    clang-24
sh                          apsh4a3a_defconfig    clang-17
sh                          apsh4a3a_defconfig    clang-24
sh                         apsh4ad0a_defconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                         edosk7705_defconfig    gcc-16.2.0
sh                                j2_defconfig    gcc-16.2.0
sh                             migor_defconfig    gcc-16.2.0
sh                           polaris_defconfig    gcc-16.2.0
sh                           r7780mp_defconfig    clang-17
sh                    randconfig-1000-20261023    gcc-16.2.0
sh                    randconfig-1000-20261024    gcc-11.5.0
sh                    randconfig-1000-20261025    gcc-10.5.0
sh                    randconfig-1000-20261026    gcc-13.5.0
sh                    randconfig-1000-20261027    gcc-16.2.0
sh                    randconfig-1001-20261023    gcc-16.2.0
sh                    randconfig-1001-20261024    gcc-11.5.0
sh                    randconfig-1001-20261025    gcc-10.5.0
sh                    randconfig-1001-20261026    gcc-13.5.0
sh                    randconfig-1001-20261027    gcc-16.2.0
sh                           rsk7201_defconfig    gcc-16.2.0
sh                           rsk7269_defconfig    gcc-16.2.0
sh                           sdk7786_defconfig    gcc-16.2.0
sh                            se7343_defconfig    clang-24
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7705_defconfig    clang-24
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7721_defconfig    gcc-16.2.0
sh                            se7722_defconfig    gcc-16.2.0
sh                            se7724_defconfig    gcc-11.5.0
sh                            se7724_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    clang-17
sh                            sh2007_defconfig    gcc-16.2.0
sh                    sh7724_generic_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    clang-17
sh                         sh7785lcr_defconfig    gcc-16.2.0
sh                             shmin_defconfig    gcc-16.2.0
sh                             titan_defconfig    gcc-16.2.0
sh                               ul2_defconfig    gcc-16.2.0
sh                           urquell_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                              allnoconfig    gcc-16.2.0
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261024    gcc-14
sparc                 randconfig-1000-20261025    gcc-14
sparc                 randconfig-1000-20261026    gcc-14
sparc                 randconfig-1000-20261027    clang-20
sparc                 randconfig-1001-20261024    gcc-14
sparc                 randconfig-1001-20261025    gcc-14
sparc                 randconfig-1001-20261026    gcc-14
sparc                 randconfig-1001-20261027    clang-20
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    gcc-16.2.0
sparc64                           alldefconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261024    gcc-14
sparc64               randconfig-1000-20261025    gcc-14
sparc64               randconfig-1000-20261026    gcc-14
sparc64               randconfig-1000-20261027    clang-20
sparc64               randconfig-1001-20261024    gcc-14
sparc64               randconfig-1001-20261025    gcc-14
sparc64               randconfig-1001-20261026    gcc-14
sparc64               randconfig-1001-20261027    clang-20
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                 allnoconfig    gcc-16.2.0
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261024    gcc-14
um                    randconfig-1000-20261025    gcc-14
um                    randconfig-1000-20261026    gcc-14
um                    randconfig-1000-20261027    clang-20
um                    randconfig-1001-20261024    gcc-14
um                    randconfig-1001-20261025    gcc-14
um                    randconfig-1001-20261026    gcc-14
um                    randconfig-1001-20261027    clang-20
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    clang-24
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                             allnoconfig    gcc-16.2.0
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261024    gcc-14
x86_64      buildonly-randconfig-1000-20261025    gcc-14
x86_64      buildonly-randconfig-1000-20261026    clang-22
x86_64      buildonly-randconfig-1000-20261027    gcc-14
x86_64      buildonly-randconfig-1001-20261024    gcc-14
x86_64      buildonly-randconfig-1001-20261025    gcc-14
x86_64      buildonly-randconfig-1001-20261026    clang-22
x86_64      buildonly-randconfig-1001-20261027    gcc-14
x86_64      buildonly-randconfig-1002-20261024    gcc-14
x86_64      buildonly-randconfig-1002-20261025    gcc-14
x86_64      buildonly-randconfig-1002-20261026    clang-22
x86_64      buildonly-randconfig-1002-20261027    gcc-14
x86_64      buildonly-randconfig-1003-20261024    gcc-14
x86_64      buildonly-randconfig-1003-20261025    gcc-14
x86_64      buildonly-randconfig-1003-20261026    clang-22
x86_64      buildonly-randconfig-1003-20261027    gcc-14
x86_64      buildonly-randconfig-1004-20261024    gcc-14
x86_64      buildonly-randconfig-1004-20261025    gcc-14
x86_64      buildonly-randconfig-1004-20261026    clang-22
x86_64      buildonly-randconfig-1004-20261027    gcc-14
x86_64      buildonly-randconfig-1005-20261024    gcc-14
x86_64      buildonly-randconfig-1005-20261025    gcc-14
x86_64      buildonly-randconfig-1005-20261026    clang-22
x86_64      buildonly-randconfig-1005-20261027    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261023    gcc-14
x86_64                randconfig-1000-20261024    gcc-14
x86_64                randconfig-1000-20261025    clang-22
x86_64                randconfig-1000-20261026    clang-22
x86_64                randconfig-1000-20261027    gcc-14
x86_64                randconfig-1001-20261023    gcc-14
x86_64                randconfig-1001-20261024    gcc-14
x86_64                randconfig-1001-20261025    clang-22
x86_64                randconfig-1001-20261026    clang-22
x86_64                randconfig-1001-20261027    gcc-14
x86_64                randconfig-1002-20261023    gcc-14
x86_64                randconfig-1002-20261024    gcc-14
x86_64                randconfig-1002-20261025    clang-22
x86_64                randconfig-1002-20261026    clang-22
x86_64                randconfig-1002-20261027    gcc-14
x86_64                randconfig-1003-20261023    gcc-14
x86_64                randconfig-1003-20261024    gcc-14
x86_64                randconfig-1003-20261025    clang-22
x86_64                randconfig-1003-20261026    clang-22
x86_64                randconfig-1003-20261027    gcc-14
x86_64                randconfig-1004-20261023    gcc-14
x86_64                randconfig-1004-20261024    gcc-14
x86_64                randconfig-1004-20261025    clang-22
x86_64                randconfig-1004-20261026    clang-22
x86_64                randconfig-1004-20261027    gcc-14
x86_64                randconfig-1005-20261023    gcc-14
x86_64                randconfig-1005-20261024    gcc-14
x86_64                randconfig-1005-20261025    clang-22
x86_64                randconfig-1005-20261026    clang-22
x86_64                randconfig-1005-20261027    gcc-14
x86_64                randconfig-1006-20261023    gcc-14
x86_64                randconfig-1006-20261024    gcc-13
x86_64                randconfig-1006-20261025    clang-22
x86_64                randconfig-1006-20261026    gcc-14
x86_64                randconfig-1006-20261027    clang-22
x86_64                randconfig-1007-20261023    gcc-14
x86_64                randconfig-1007-20261024    gcc-13
x86_64                randconfig-1007-20261025    clang-22
x86_64                randconfig-1007-20261026    gcc-14
x86_64                randconfig-1007-20261027    clang-22
x86_64                randconfig-1008-20261023    gcc-14
x86_64                randconfig-1008-20261024    gcc-13
x86_64                randconfig-1008-20261025    clang-22
x86_64                randconfig-1008-20261026    gcc-14
x86_64                randconfig-1008-20261027    clang-22
x86_64                randconfig-1009-20261023    gcc-14
x86_64                randconfig-1009-20261024    gcc-13
x86_64                randconfig-1009-20261025    clang-22
x86_64                randconfig-1009-20261026    gcc-14
x86_64                randconfig-1009-20261027    clang-22
x86_64                randconfig-1010-20261023    gcc-14
x86_64                randconfig-1010-20261024    gcc-13
x86_64                randconfig-1010-20261025    clang-22
x86_64                randconfig-1010-20261026    gcc-14
x86_64                randconfig-1010-20261027    clang-22
x86_64                randconfig-1011-20261023    gcc-14
x86_64                randconfig-1011-20261024    gcc-13
x86_64                randconfig-1011-20261025    clang-22
x86_64                randconfig-1011-20261026    gcc-14
x86_64                randconfig-1011-20261027    clang-22
x86_64                randconfig-1012-20261023    clang-22
x86_64                randconfig-1012-20261024    clang-22
x86_64                randconfig-1012-20261025    clang-22
x86_64                randconfig-1012-20261026    gcc-14
x86_64                randconfig-1012-20261027    clang-22
x86_64                randconfig-1013-20261023    clang-22
x86_64                randconfig-1013-20261024    clang-22
x86_64                randconfig-1013-20261025    clang-22
x86_64                randconfig-1013-20261026    gcc-14
x86_64                randconfig-1013-20261027    clang-22
x86_64                randconfig-1014-20261023    clang-22
x86_64                randconfig-1014-20261024    clang-22
x86_64                randconfig-1014-20261025    clang-22
x86_64                randconfig-1014-20261026    gcc-14
x86_64                randconfig-1014-20261027    clang-22
x86_64                randconfig-1015-20261023    clang-22
x86_64                randconfig-1015-20261024    clang-22
x86_64                randconfig-1015-20261025    clang-22
x86_64                randconfig-1015-20261026    gcc-14
x86_64                randconfig-1015-20261027    clang-22
x86_64                randconfig-1016-20261023    clang-22
x86_64                randconfig-1016-20261024    clang-22
x86_64                randconfig-1016-20261025    clang-22
x86_64                randconfig-1016-20261026    gcc-14
x86_64                randconfig-1016-20261027    clang-22
x86_64                randconfig-1017-20261023    clang-22
x86_64                randconfig-1017-20261024    clang-22
x86_64                randconfig-1017-20261025    clang-22
x86_64                randconfig-1017-20261026    gcc-14
x86_64                randconfig-1017-20261027    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                             allnoconfig    gcc-16.2.0
xtensa                            allyesconfig    clang-20
xtensa                   audio_kc705_defconfig    gcc-16.2.0
xtensa                   cadence_csp_defconfig    clang-17
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261024    gcc-14
xtensa                randconfig-1000-20261025    gcc-14
xtensa                randconfig-1000-20261026    gcc-14
xtensa                randconfig-1000-20261027    clang-20
xtensa                randconfig-1001-20261024    gcc-14
xtensa                randconfig-1001-20261025    gcc-14
xtensa                randconfig-1001-20261026    gcc-14
xtensa                randconfig-1001-20261027    clang-20
xtensa                          virt_defconfig    gcc-16.2.0
xtensa                     xip_kc705_defconfig    clang-17
xtensa                     xip_kc705_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

