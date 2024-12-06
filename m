Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FCBE77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qz2RhmM1CaV3WcVL6qPt3LKuCi6NP+4yt3/okz/Z7r4=; b=MLCIvsKVryKFBzIhJs7XHIGhHy
	kSF2nWtZRFH3pkNXbqWjGuSMLNZurNP8Af0xzI7RJq7oWPvrRlSNXJGjA0SotkahXL/4pMqVXPkS+
	WVX+EN+qUq34/Dj6VGmNJY1lvG8dn3MOFCXEnF/JRULnvWODCUU0tZ1uEhihKPC9c6AfmnEJCceF+
	ReCJqRdLD4i7w16F8e7FKGnAwJVxWVRkVAYYGqWHZHO1ydte+PoOXK8VAVipcJSXxUgwMxwZXYmws
	z/qZBe3+MYExYK1B6urPSTV0KWmNR2OueCxxWGsmIr9O3D7wZwDSq0ylxJkx3k9xnoU7Sq0pPudjL
	r5/MAFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJamT-000000024eg-1uHB
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 16:02:13 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJam4-000000024Sd-49yB
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 16:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733500909; x=1765036909;
  h=date:from:to:cc:subject:message-id;
  bh=AxgO35Ty3SZQ5nzuuQ/JxyYofuE8dXS34oiNehclrQk=;
  b=KZVC1/UyP+tGsg34YEaPb0ozDGKoeEu5/Iix909vn1+xs6CHb+X90AYP
   8giZaBsvuW5twxzVd8cYmSPTfM1jIB13Zg4nrtiOAWETKeFEoGt6niY4O
   ZkOVA3mxdc+XiJw1LU2ijyh7mtgUfW8kiIvCLCKypR4MfrAcEsRFUOeI4
   +i5ON91qtw9p9iDX9htf9K5iJks2ftKOBTVIIlNTzGLNQOky2YPbN+wYI
   hwiATxZdCNsCADIjyXEnRcPPeiEn9jlYrfhKdZJIRqEy7A2xm+vOoFJy4
   JyunziKIhPRbvdP+0IzZOD5NeCQi4fORsgfY3q07I5f4MMM8EUOtUWeyE
   w==;
X-CSE-ConnectionGUID: mx+i6ORITQq/5dwBzw7p7Q==
X-CSE-MsgGUID: U2N+cEMLQka7rX8fUhMVfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="34006396"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="34006396"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 08:01:48 -0800
X-CSE-ConnectionGUID: W/l2arHCSpiI/Z9/7Mtd4Q==
X-CSE-MsgGUID: Mloy1tiFTh6ew+TZHe0VAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="99502751"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Dec 2024 08:01:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJalz-00023X-2a;
	Fri, 06 Dec 2024 16:01:43 +0000
Date: Fri, 06 Dec 2024 23:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 48322e474f04f671dc4a57fa2063e9402ecdc51e
Message-ID: <202412062305.G73hIO1Q-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_080149_079121_11FEAB8F 
X-CRM114-Status: UNSURE (   3.18  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: 48322e474f04f671dc4a57fa2063e9402ecdc51e  wifi: ath12k: Decrease ath12k_mac_station_assoc() stack usage

elapsed time: 1173m

configs tested: 187
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                            randconfig-001    gcc-13.2.0
arc                   randconfig-001-20241206    gcc-14.2.0
arc                            randconfig-002    gcc-13.2.0
arc                   randconfig-002-20241206    gcc-14.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-20
arm                        multi_v5_defconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    gcc-14.2.0
arm                           omap1_defconfig    clang-20
arm                           omap1_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                            randconfig-001    gcc-14.2.0
arm                   randconfig-001-20241206    gcc-14.2.0
arm                            randconfig-002    gcc-14.2.0
arm                   randconfig-002-20241206    gcc-14.2.0
arm                            randconfig-003    clang-20
arm                   randconfig-003-20241206    gcc-14.2.0
arm                            randconfig-004    gcc-14.2.0
arm                   randconfig-004-20241206    gcc-14.2.0
arm                             rpc_defconfig    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                          randconfig-001    gcc-14.2.0
arm64                 randconfig-001-20241206    gcc-14.2.0
arm64                          randconfig-002    gcc-14.2.0
arm64                 randconfig-002-20241206    gcc-14.2.0
arm64                          randconfig-003    clang-15
arm64                 randconfig-003-20241206    gcc-14.2.0
arm64                          randconfig-004    clang-20
arm64                 randconfig-004-20241206    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20241206    clang-19
i386                 buildonly-randconfig-002    clang-19
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20241206    clang-19
i386                 buildonly-randconfig-003    clang-19
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20241206    clang-19
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20241206    clang-19
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20241206    clang-19
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20241206    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    clang-20
m68k                            mac_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    clang-20
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                           ci20_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
mips                           ip27_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-15
mips                        omega2p_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc64                         alldefconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    gcc-14.2.0
powerpc                       ebony_defconfig    clang-18
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    clang-20
powerpc                 linkstation_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    clang-20
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    clang-20
powerpc                       ppc64_defconfig    clang-18
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    clang-20
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc                     tqm8560_defconfig    clang-20
powerpc64                        alldefconfig    clang-18
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                    nommu_virt_defconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    clang-18
sh                         ecovec24_defconfig    clang-20
sh                        edosk7705_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    clang-18
sh                          rsk7269_defconfig    clang-18
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                           se7206_defconfig    clang-20
sh                           se7343_defconfig    clang-20
sh                           se7722_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    clang-18
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    clang-20
sh                        sh7763rdp_defconfig    clang-20
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                       sparc32_defconfig    clang-15
sparc                       sparc32_defconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
x86_64      buildonly-randconfig-001-20241206    clang-19
x86_64      buildonly-randconfig-001-20241206    gcc-12
x86_64      buildonly-randconfig-002-20241206    clang-19
x86_64      buildonly-randconfig-002-20241206    gcc-12
x86_64      buildonly-randconfig-003-20241206    clang-19
x86_64      buildonly-randconfig-003-20241206    gcc-12
x86_64      buildonly-randconfig-004-20241206    clang-19
x86_64      buildonly-randconfig-005-20241206    clang-19
x86_64      buildonly-randconfig-005-20241206    gcc-11
x86_64      buildonly-randconfig-006-20241206    clang-19
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

