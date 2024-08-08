Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8928AC52D71
	for <ath12k@archiver.kernel.org>; Thu,  8 Aug 2024 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bmwghuoMwwYUYwnp91dD072VjAi8o+xt1mw6iB6Y5CU=; b=ApHi/rPN/Btks2dD/lU4BN9Rj1
	ELXBvtw/W+C40/oF0kq1nkZTTHrszYypdNp3uqceSepz/Pag4sIPeZUzU3TJpIpf7RphI4K8XeFm7
	3WvNnH9cNTR9qENuGUQYyTTpFwRwHdS8J+jCdtv7nyd/9npBfCz1TtJto4IO4TLa/Z/7jM8N7hrJF
	84YbhtNHNUxvIiMuh24I+XGnOKhEfhDPoatNqIOMaRtX0nb6qeW1T8FgeZRaqq/Qpv//sK2WzdAOL
	wJEljiHUzhnb8IuTHTWMPosNZSowHB0e08Cj7Bvi+7C6LrJ0/zf+H8mPfuY7pqIoDRjZXxtZ9GWoP
	7z1WGanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzhH-00000007lDl-07e8
	for ath12k@archiver.kernel.org;
	Thu, 08 Aug 2024 09:44:39 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzhE-00000007lD4-253H
	for ath12k@lists.infradead.org;
	Thu, 08 Aug 2024 09:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723110277; x=1754646277;
  h=date:from:to:cc:subject:message-id;
  bh=PUR2PNPN7NX6ySpQMitzpT/h5rf9UmebCMCyDZpEhU4=;
  b=Cpc61LYVqOxenmvzogXwajVKY7ehMAnrWRwf8hARHbl3yya7ssfyfzdi
   21hEfKpSN+Pbvb56RAV/qUNiRioIUtSRhLxGYTU+cRbubOEUNEXLz1qb3
   90GKklCPJ4gpde4+7I+eiY2dcB0MFWRO+pw8wHU4Fh+bwhRqw37xDoHfI
   4aukT2YqpW/cCuR6iOQ4B/kwalY+vrgQ+p7bM3+0PMLPfrafmXMkILvdB
   TRIpJ2grtX1GWh6/WF+rCnW5ZWrf0u5XSiUfpKvRMCDNqb2GyO1j1jnXI
   tSz0vwznCy/v3bzq4x9EYR363jo6AUVNck6Nii/o+5dS8jsZozr8WwKhQ
   A==;
X-CSE-ConnectionGUID: jTDBVET1Rv2tOuRFN+a1Hg==
X-CSE-MsgGUID: ldt3tx0BTty+i7F3wukStw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32371549"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="32371549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 02:44:34 -0700
X-CSE-ConnectionGUID: zvthJVh2SlqO91La5oNSZw==
X-CSE-MsgGUID: hSXD+u3TT72RuMN1kX6t7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="57122105"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Aug 2024 02:44:32 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbzg6-00065e-04;
	Thu, 08 Aug 2024 09:43:42 +0000
Date: Thu, 08 Aug 2024 17:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 805781bdcbc4dd736770542e1d8da80d05a2e121
Message-ID: <202408081717.d7DrjaPz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_024436_643576_458BE0EF 
X-CRM114-Status: UNSURE (   3.51  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: 805781bdcbc4dd736770542e1d8da80d05a2e121  Add localversion-wireless-testing-ath

elapsed time: 1461m

configs tested: 338
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240807   gcc-13.2.0
arc                   randconfig-001-20240808   gcc-13.2.0
arc                   randconfig-002-20240807   gcc-13.2.0
arc                   randconfig-002-20240808   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            mmp2_defconfig   gcc-14.1.0
arm                          moxart_defconfig   gcc-14.1.0
arm                        neponset_defconfig   gcc-13.2.0
arm                       netwinder_defconfig   gcc-14.1.0
arm                   randconfig-001-20240807   clang-20
arm                   randconfig-001-20240807   gcc-13.2.0
arm                   randconfig-001-20240808   gcc-13.2.0
arm                   randconfig-002-20240807   gcc-13.2.0
arm                   randconfig-002-20240807   gcc-14.1.0
arm                   randconfig-002-20240808   gcc-13.2.0
arm                   randconfig-003-20240807   gcc-13.2.0
arm                   randconfig-003-20240807   gcc-14.1.0
arm                   randconfig-003-20240808   gcc-13.2.0
arm                   randconfig-004-20240807   gcc-13.2.0
arm                   randconfig-004-20240807   gcc-14.1.0
arm                   randconfig-004-20240808   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                           spitz_defconfig   gcc-14.1.0
arm                           stm32_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240807   gcc-13.2.0
arm64                 randconfig-001-20240807   gcc-14.1.0
arm64                 randconfig-001-20240808   gcc-13.2.0
arm64                 randconfig-002-20240807   clang-17
arm64                 randconfig-002-20240807   gcc-13.2.0
arm64                 randconfig-002-20240808   gcc-13.2.0
arm64                 randconfig-003-20240807   clang-15
arm64                 randconfig-003-20240807   gcc-13.2.0
arm64                 randconfig-003-20240808   gcc-13.2.0
arm64                 randconfig-004-20240807   clang-20
arm64                 randconfig-004-20240807   gcc-13.2.0
arm64                 randconfig-004-20240808   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240807   gcc-13.2.0
csky                  randconfig-001-20240807   gcc-14.1.0
csky                  randconfig-001-20240808   gcc-13.2.0
csky                  randconfig-002-20240807   gcc-13.2.0
csky                  randconfig-002-20240807   gcc-14.1.0
csky                  randconfig-002-20240808   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240807   clang-14
hexagon               randconfig-002-20240807   clang-20
i386                             alldefconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240807   clang-18
i386         buildonly-randconfig-001-20240808   clang-18
i386         buildonly-randconfig-002-20240807   clang-18
i386         buildonly-randconfig-002-20240808   clang-18
i386         buildonly-randconfig-003-20240807   clang-18
i386         buildonly-randconfig-003-20240807   gcc-12
i386         buildonly-randconfig-003-20240808   clang-18
i386         buildonly-randconfig-004-20240807   clang-18
i386         buildonly-randconfig-004-20240808   clang-18
i386         buildonly-randconfig-005-20240807   clang-18
i386         buildonly-randconfig-005-20240808   clang-18
i386         buildonly-randconfig-006-20240807   clang-18
i386         buildonly-randconfig-006-20240807   gcc-12
i386         buildonly-randconfig-006-20240808   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240807   clang-18
i386                  randconfig-001-20240807   gcc-12
i386                  randconfig-001-20240808   clang-18
i386                  randconfig-002-20240807   clang-18
i386                  randconfig-002-20240808   clang-18
i386                  randconfig-003-20240807   clang-18
i386                  randconfig-003-20240808   clang-18
i386                  randconfig-004-20240807   clang-18
i386                  randconfig-004-20240807   gcc-12
i386                  randconfig-004-20240808   clang-18
i386                  randconfig-005-20240807   clang-18
i386                  randconfig-005-20240807   gcc-12
i386                  randconfig-005-20240808   clang-18
i386                  randconfig-006-20240807   clang-18
i386                  randconfig-006-20240808   clang-18
i386                  randconfig-011-20240807   clang-18
i386                  randconfig-011-20240808   clang-18
i386                  randconfig-012-20240807   clang-18
i386                  randconfig-012-20240807   gcc-11
i386                  randconfig-012-20240808   clang-18
i386                  randconfig-013-20240807   clang-18
i386                  randconfig-013-20240808   clang-18
i386                  randconfig-014-20240807   clang-18
i386                  randconfig-014-20240808   clang-18
i386                  randconfig-015-20240807   clang-18
i386                  randconfig-015-20240808   clang-18
i386                  randconfig-016-20240807   clang-18
i386                  randconfig-016-20240807   gcc-12
i386                  randconfig-016-20240808   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240807   gcc-13.2.0
loongarch             randconfig-001-20240807   gcc-14.1.0
loongarch             randconfig-001-20240808   gcc-13.2.0
loongarch             randconfig-002-20240807   gcc-13.2.0
loongarch             randconfig-002-20240807   gcc-14.1.0
loongarch             randconfig-002-20240808   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-14.1.0
m68k                       m5475evb_defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-14.1.0
m68k                        mvme16x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                        bcm47xx_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-14.1.0
mips                     decstation_defconfig   gcc-14.1.0
mips                           ip30_defconfig   gcc-14.1.0
mips                     loongson1b_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
mips                   sb1250_swarm_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240807   gcc-13.2.0
nios2                 randconfig-001-20240807   gcc-14.1.0
nios2                 randconfig-001-20240808   gcc-13.2.0
nios2                 randconfig-002-20240807   gcc-13.2.0
nios2                 randconfig-002-20240807   gcc-14.1.0
nios2                 randconfig-002-20240808   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                       virt_defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-32bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240807   gcc-13.2.0
parisc                randconfig-001-20240807   gcc-14.1.0
parisc                randconfig-001-20240808   gcc-13.2.0
parisc                randconfig-002-20240807   gcc-13.2.0
parisc                randconfig-002-20240807   gcc-14.1.0
parisc                randconfig-002-20240808   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      arches_defconfig   gcc-14.1.0
powerpc                      chrp32_defconfig   gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240807   clang-20
powerpc               randconfig-001-20240807   gcc-13.2.0
powerpc               randconfig-001-20240808   gcc-13.2.0
powerpc               randconfig-002-20240807   clang-20
powerpc               randconfig-002-20240808   gcc-13.2.0
powerpc               randconfig-003-20240807   gcc-13.2.0
powerpc               randconfig-003-20240807   gcc-14.1.0
powerpc                     redwood_defconfig   gcc-14.1.0
powerpc                     sequoia_defconfig   gcc-14.1.0
powerpc                     skiroot_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240807   clang-15
powerpc64             randconfig-001-20240807   gcc-13.2.0
powerpc64             randconfig-001-20240808   gcc-13.2.0
powerpc64             randconfig-002-20240807   gcc-13.2.0
powerpc64             randconfig-002-20240807   gcc-14.1.0
powerpc64             randconfig-002-20240808   gcc-13.2.0
powerpc64             randconfig-003-20240807   gcc-13.2.0
powerpc64             randconfig-003-20240807   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240807   clang-20
riscv                 randconfig-001-20240807   gcc-13.2.0
riscv                 randconfig-001-20240808   gcc-13.2.0
riscv                 randconfig-002-20240807   clang-20
riscv                 randconfig-002-20240807   gcc-13.2.0
riscv                 randconfig-002-20240808   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240807   gcc-13.2.0
s390                  randconfig-001-20240807   gcc-14.1.0
s390                  randconfig-001-20240808   gcc-13.2.0
s390                  randconfig-002-20240807   gcc-13.2.0
s390                  randconfig-002-20240807   gcc-14.1.0
s390                  randconfig-002-20240808   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240807   gcc-13.2.0
sh                    randconfig-001-20240807   gcc-14.1.0
sh                    randconfig-001-20240808   gcc-13.2.0
sh                    randconfig-002-20240807   gcc-13.2.0
sh                    randconfig-002-20240807   gcc-14.1.0
sh                    randconfig-002-20240808   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-14.1.0
sh                           se7705_defconfig   gcc-14.1.0
sh                           se7721_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-14.1.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sparc                            alldefconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240807   gcc-13.2.0
sparc64               randconfig-001-20240807   gcc-14.1.0
sparc64               randconfig-001-20240808   gcc-13.2.0
sparc64               randconfig-002-20240807   gcc-13.2.0
sparc64               randconfig-002-20240807   gcc-14.1.0
sparc64               randconfig-002-20240808   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240807   gcc-12
um                    randconfig-001-20240807   gcc-13.2.0
um                    randconfig-001-20240808   gcc-13.2.0
um                    randconfig-002-20240807   clang-20
um                    randconfig-002-20240807   gcc-13.2.0
um                    randconfig-002-20240808   gcc-13.2.0
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240807   clang-18
x86_64       buildonly-randconfig-001-20240808   gcc-12
x86_64       buildonly-randconfig-002-20240807   clang-18
x86_64       buildonly-randconfig-002-20240808   gcc-12
x86_64       buildonly-randconfig-003-20240807   clang-18
x86_64       buildonly-randconfig-003-20240808   gcc-12
x86_64       buildonly-randconfig-004-20240807   clang-18
x86_64       buildonly-randconfig-004-20240808   gcc-12
x86_64       buildonly-randconfig-005-20240807   clang-18
x86_64       buildonly-randconfig-005-20240808   gcc-12
x86_64       buildonly-randconfig-006-20240807   clang-18
x86_64       buildonly-randconfig-006-20240808   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240807   clang-18
x86_64                randconfig-001-20240808   gcc-12
x86_64                randconfig-002-20240807   clang-18
x86_64                randconfig-002-20240807   gcc-12
x86_64                randconfig-002-20240808   gcc-12
x86_64                randconfig-003-20240807   clang-18
x86_64                randconfig-003-20240808   gcc-12
x86_64                randconfig-004-20240807   clang-18
x86_64                randconfig-004-20240807   gcc-12
x86_64                randconfig-004-20240808   gcc-12
x86_64                randconfig-005-20240807   clang-18
x86_64                randconfig-005-20240807   gcc-12
x86_64                randconfig-005-20240808   gcc-12
x86_64                randconfig-006-20240807   clang-18
x86_64                randconfig-006-20240807   gcc-12
x86_64                randconfig-006-20240808   gcc-12
x86_64                randconfig-011-20240807   clang-18
x86_64                randconfig-011-20240808   gcc-12
x86_64                randconfig-012-20240807   clang-18
x86_64                randconfig-012-20240807   gcc-12
x86_64                randconfig-012-20240808   gcc-12
x86_64                randconfig-013-20240807   clang-18
x86_64                randconfig-013-20240807   gcc-12
x86_64                randconfig-013-20240808   gcc-12
x86_64                randconfig-014-20240807   clang-18
x86_64                randconfig-014-20240807   gcc-12
x86_64                randconfig-014-20240808   gcc-12
x86_64                randconfig-015-20240807   clang-18
x86_64                randconfig-015-20240808   gcc-12
x86_64                randconfig-016-20240807   clang-18
x86_64                randconfig-016-20240808   gcc-12
x86_64                randconfig-071-20240807   clang-18
x86_64                randconfig-071-20240808   gcc-12
x86_64                randconfig-072-20240807   clang-18
x86_64                randconfig-072-20240808   gcc-12
x86_64                randconfig-073-20240807   clang-18
x86_64                randconfig-073-20240807   gcc-12
x86_64                randconfig-073-20240808   gcc-12
x86_64                randconfig-074-20240807   clang-18
x86_64                randconfig-074-20240808   gcc-12
x86_64                randconfig-075-20240807   clang-18
x86_64                randconfig-075-20240807   gcc-12
x86_64                randconfig-075-20240808   gcc-12
x86_64                randconfig-076-20240807   clang-18
x86_64                randconfig-076-20240808   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                       common_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240807   gcc-13.2.0
xtensa                randconfig-001-20240807   gcc-14.1.0
xtensa                randconfig-001-20240808   gcc-13.2.0
xtensa                randconfig-002-20240807   gcc-13.2.0
xtensa                randconfig-002-20240807   gcc-14.1.0
xtensa                randconfig-002-20240808   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

