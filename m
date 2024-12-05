Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B17E7716C
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fkVwccyJjh4LPG3us8iDqWvsMytY94omg5MTfv84Rrs=; b=Liv/QdiW+xEx7urhGPi7tnwDw+
	Uc3237WsLs64vuvyNhk+ajqHsK2A0pa5Ipp2E4wAn08H88y4ElO0lQUKxd1gSAHrN5DwL+e3BlJUZ
	gsu/7YSNE/1uu3S/akgh9tls0IYf9dlyDNA3dFB2aZU3wALuVAhjuL+HooDXa1d9qECITfVdn8R3o
	X/joCozPLwpEYG76P8K7xgJMmhoI02By9n3yRKjk5Nrkc7U1Bq0FeIk5rwpf6k3O9H8eOqmdq8To4
	X1/MfSKv2rWG8TJvSOTS89cGclRY2IE/gFNd3Wgh3sRav8FrfzM+Si+c5jbJUjGFD1Il+YpQ/3zGd
	7LSzRPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5dQ-0000000EvHk-0dbu
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 06:46:48 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5dO-0000000EvHJ-1KCl
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 06:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733381206; x=1764917206;
  h=date:from:to:cc:subject:message-id;
  bh=GQADGXub/fyuVYW1ZNgVx054RJQ0jLLcwtR7s+m3Vus=;
  b=ihbwXUZ1vJh3WKfLPpMUspc3DJ+EWm6+zi4UN067NuldxrmXrR7i65Uy
   CITJDdMbNftdv9iRjHTXGDbPP5nu2GPS/mpJNN31kXfYksEfOifn270My
   0YZWeoIpwc7M0K5VeXCAzZ4oQ1ZWSmoR48UlNp7O6O4tUYKbSLdGe05IK
   ceFHXXVylNR1+vZY96ReKbdQ2lOKeQhhydhuaEcLgg0TloQ6KAbEcx2yg
   7dvqTWBVmG9FS/5mJwPcW+MRpk5Grl0ejB7aJ1W/Ggjt7qqS65x/CezvO
   cfJF7KDeSw43HvdpP1tHmAln5vtWWAAOcUIHD2KRZcqzBEG/GQbPhjpVn
   A==;
X-CSE-ConnectionGUID: MJ+SLgCcTJu6arnh6V8uVg==
X-CSE-MsgGUID: a0X7XxgSSHGnKNrAO3Rsrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33921449"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33921449"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 22:46:43 -0800
X-CSE-ConnectionGUID: BzJb+s6PTpSIR0Fg9zLQ4g==
X-CSE-MsgGUID: 307JGfRZS3S+eiDhMvlSQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="131443313"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Dec 2024 22:46:42 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ5dH-0003tp-1O;
	Thu, 05 Dec 2024 06:46:39 +0000
Date: Thu, 05 Dec 2024 14:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 cea6667b73496a9f56b527009f4b7080d63e8df2
Message-ID: <202412051403.9ceF6e3d-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_224646_374984_6562624F 
X-CRM114-Status: UNSURE (   3.41  )
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
branch HEAD: cea6667b73496a9f56b527009f4b7080d63e8df2  wifi: ath12k: introduce mlo_capable flag for device group

elapsed time: 764m

configs tested: 207
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    clang-18
arc                          axs101_defconfig    clang-20
arc                          axs103_defconfig    clang-20
arc                        nsimosci_defconfig    clang-20
arc                            randconfig-001    clang-20
arc                            randconfig-001    gcc-13.2.0
arc                   randconfig-001-20241205    clang-20
arc                            randconfig-002    clang-20
arc                            randconfig-002    gcc-13.2.0
arc                   randconfig-002-20241205    clang-20
arc                           tb10x_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                         assabet_defconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                            dove_defconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-18
arm                           imxrt_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                          ixp4xx_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                        multi_v7_defconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    clang-17
arm                          pxa910_defconfig    clang-20
arm                          pxa910_defconfig    gcc-14.2.0
arm                            randconfig-001    clang-20
arm                            randconfig-001    gcc-14.2.0
arm                   randconfig-001-20241205    clang-20
arm                            randconfig-002    clang-20
arm                            randconfig-002    gcc-14.2.0
arm                   randconfig-002-20241205    clang-20
arm                            randconfig-003    clang-20
arm                   randconfig-003-20241205    clang-20
arm                            randconfig-004    clang-20
arm                            randconfig-004    gcc-14.2.0
arm                   randconfig-004-20241205    clang-20
arm                        realview_defconfig    clang-20
arm                        spear3xx_defconfig    clang-20
arm                           spitz_defconfig    gcc-14.2.0
arm                           stm32_defconfig    clang-20
arm                    vt8500_v6_v7_defconfig    clang-20
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-20
arm64                          randconfig-001    clang-20
arm64                          randconfig-001    gcc-14.2.0
arm64                 randconfig-001-20241205    clang-20
arm64                          randconfig-002    clang-20
arm64                          randconfig-002    gcc-14.2.0
arm64                 randconfig-002-20241205    clang-20
arm64                          randconfig-003    clang-15
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20241205    clang-20
arm64                          randconfig-004    clang-20
arm64                 randconfig-004-20241205    clang-20
csky                              allnoconfig    gcc-14.2.0
hexagon                          alldefconfig    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20241205    clang-19
i386                 buildonly-randconfig-002    clang-19
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20241205    clang-19
i386                 buildonly-randconfig-003    clang-19
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20241205    clang-19
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20241205    clang-19
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20241205    clang-19
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20241205    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                         bigsur_defconfig    clang-17
mips                          eyeq6_defconfig    clang-20
mips                            gpr_defconfig    clang-20
mips                           jazz_defconfig    clang-20
mips                          rb532_defconfig    clang-17
mips                   sb1250_swarm_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    clang-20
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    clang-20
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                   currituck_defconfig    clang-20
powerpc                       ebony_defconfig    clang-18
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    clang-18
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                        icon_defconfig    clang-20
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-20
powerpc                 linkstation_defconfig    clang-18
powerpc                   lite5200b_defconfig    clang-20
powerpc                      mgcoge_defconfig    clang-20
powerpc                     mpc5200_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    clang-20
powerpc                    mvme5100_defconfig    clang-20
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    clang-20
powerpc                     redwood_defconfig    clang-20
powerpc                     skiroot_defconfig    clang-20
powerpc                     tqm8548_defconfig    clang-20
powerpc                     tqm8555_defconfig    clang-20
powerpc                        warp_defconfig    clang-17
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    clang-17
sh                ecovec24-romimage_defconfig    clang-18
sh                          landisk_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                          rsk7201_defconfig    clang-20
sh                          rsk7264_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    clang-20
sh                           se7206_defconfig    clang-17
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7722_defconfig    clang-17
sh                             sh03_defconfig    clang-20
sh                   sh7724_generic_defconfig    clang-20
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                            titan_defconfig    clang-20
sh                          urquell_defconfig    gcc-14.2.0
sparc                            alldefconfig    clang-18
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                           x86_64_defconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20241205    clang-19
x86_64               buildonly-randconfig-002    gcc-12
x86_64      buildonly-randconfig-002-20241205    clang-19
x86_64               buildonly-randconfig-003    gcc-12
x86_64      buildonly-randconfig-003-20241205    clang-19
x86_64               buildonly-randconfig-004    gcc-12
x86_64      buildonly-randconfig-004-20241205    clang-19
x86_64               buildonly-randconfig-005    gcc-12
x86_64      buildonly-randconfig-005-20241205    clang-19
x86_64      buildonly-randconfig-005-20241205    gcc-12
x86_64               buildonly-randconfig-006    gcc-12
x86_64      buildonly-randconfig-006-20241205    clang-19
x86_64      buildonly-randconfig-006-20241205    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    clang-20
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    clang-20
xtensa                          iss_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

