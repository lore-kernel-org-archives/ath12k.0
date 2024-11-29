Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79436D6EBE0
	for <ath12k@archiver.kernel.org>; Fri, 29 Nov 2024 07:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eavSmrj9t6rdnOcf02CpwgKH3uMRVLDN4bJDpfG8v14=; b=t0yOwVywlBkGYCwoRwo5M5WU0n
	Z8d/cNHFCo23u/Zo4J8M7QpbdDokyq8x4bFNJ3M4uonvEqY415o/xZOcptWS68VDiCHS0Iswbrc/a
	NjA5zcro6y5905mB5xwreJGoEnEmsN+7K57AJk5qneaC8B4gNPET/KLwzGmYgHuAlcWytprRs8dsS
	FaaJ/dcn6Bv7GyIQ419VgNEK3o8QCJBqfiG5WCXE50GbTa+/XejZehMVhF8fky5lu5TUZLLZF4yoB
	X/5ECP1hR2M3seThSTbpXqKbO+FkvxN+RDxjhJR6gOulMbUUmpHVM+7yn/v63tbPSWEt6V+EcQ4J5
	wGBwuiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGv3D-0000000H2j6-0S9W
	for ath12k@archiver.kernel.org;
	Fri, 29 Nov 2024 07:04:27 +0000
Received: from [198.175.65.17] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGv39-0000000H2iS-3wUr
	for ath12k@lists.infradead.org;
	Fri, 29 Nov 2024 07:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732863864; x=1764399864;
  h=date:from:to:cc:subject:message-id;
  bh=ALL9ujlYy33qGhOhq5nd2+DssvOIX3/bRvcUai0OtHY=;
  b=QrWyfHOPnNeUx2VzqdBgy3KxYuhmpDa7uik6rUejImqrDAPTc9Y/yvEO
   MIsSl7oeylZiAEs8te6oL0IRvT4u6xl2lDnJnPuApSqEU8bl894QXu+z4
   Sq6pLaXyriSTk5zDDfIx1VJcouMQ4RIayZkbh93h3e4obFn8QeaS9A7Ez
   ec8LAeWi9+alpDE7GyNRlVwTVt9Xj5hwSF64g1DDh4zlLEUjabrFU1suf
   Z5fyqHMP/HuXMWeCQiTBmlwN7CAYb4wFVK/QYOAEEZbO/+siPhW0dUaKU
   TN8YPUfZ7lGS/tgD8aZ2yYIXfjrwdqAjj1QI20KO/nfSL0GO1QwTXvv41
   A==;
X-CSE-ConnectionGUID: Zriza7C3QhWO3CFbT0Bb/A==
X-CSE-MsgGUID: swC1cReCQNi1G1XI9jHr7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33149148"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33149148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 23:04:24 -0800
X-CSE-ConnectionGUID: UsMkyXVYRomYP49VYJOHgQ==
X-CSE-MsgGUID: k64luOyFQYWwuA5hOZ6EUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97459874"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Nov 2024 23:04:22 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGv35-00006s-1t;
	Fri, 29 Nov 2024 07:04:19 +0000
Date: Fri, 29 Nov 2024 15:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 33791127703c11690f909e6a72528fa9d28cc8d2
Message-ID: <202411291522.MWVYl4ho-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_230424_031155_56B593E7 
X-CRM114-Status: UNSURE (   3.50  )
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
branch HEAD: 33791127703c11690f909e6a72528fa9d28cc8d2  Merge branch 'pending' into main-pending

elapsed time: 770m

configs tested: 166
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20241129    clang-20
arc                   randconfig-002-20241129    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                          ixp4xx_defconfig    clang-20
arm                         lpc18xx_defconfig    gcc-14.2.0
arm                       omap2plus_defconfig    clang-20
arm                         orion5x_defconfig    clang-14
arm                          pxa3xx_defconfig    gcc-14.2.0
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241129    clang-20
arm                   randconfig-002-20241129    clang-20
arm                   randconfig-003-20241129    clang-20
arm                   randconfig-004-20241129    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-20
arm64                 randconfig-001-20241129    clang-20
arm64                 randconfig-002-20241129    clang-20
arm64                 randconfig-003-20241129    clang-20
arm64                 randconfig-004-20241129    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241129    clang-20
csky                  randconfig-002-20241129    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241129    clang-20
hexagon               randconfig-002-20241129    clang-20
i386        buildonly-randconfig-001-20241129    clang-19
i386        buildonly-randconfig-001-20241129    gcc-12
i386        buildonly-randconfig-002-20241129    clang-19
i386        buildonly-randconfig-003-20241129    clang-19
i386        buildonly-randconfig-003-20241129    gcc-12
i386        buildonly-randconfig-004-20241129    clang-19
i386        buildonly-randconfig-005-20241129    clang-19
i386        buildonly-randconfig-006-20241129    clang-19
i386        buildonly-randconfig-006-20241129    gcc-12
i386                  randconfig-001-20241129    clang-19
i386                  randconfig-001-20241129    gcc-12
i386                  randconfig-002-20241129    clang-19
i386                  randconfig-003-20241129    clang-19
i386                  randconfig-003-20241129    gcc-12
i386                  randconfig-004-20241129    clang-19
i386                  randconfig-005-20241129    clang-19
i386                  randconfig-006-20241129    clang-19
i386                  randconfig-006-20241129    gcc-12
i386                  randconfig-011-20241129    clang-19
i386                  randconfig-011-20241129    gcc-12
i386                  randconfig-012-20241129    clang-19
i386                  randconfig-013-20241129    clang-19
i386                  randconfig-014-20241129    clang-19
i386                  randconfig-015-20241129    clang-19
i386                  randconfig-015-20241129    gcc-12
i386                  randconfig-016-20241129    clang-19
i386                  randconfig-016-20241129    gcc-12
loongarch                        alldefconfig    clang-14
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241129    clang-20
loongarch             randconfig-002-20241129    clang-20
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                           virt_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-14
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                          eyeq5_defconfig    clang-14
mips                           ip27_defconfig    clang-14
mips                      maltaaprp_defconfig    clang-14
mips                        qi_lb60_defconfig    clang-20
mips                   sb1250_swarm_defconfig    gcc-14.2.0
mips                           xway_defconfig    clang-14
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241129    clang-20
nios2                 randconfig-002-20241129    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241129    clang-20
parisc                randconfig-002-20241129    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-20
powerpc                      ppc64e_defconfig    clang-20
powerpc               randconfig-001-20241129    clang-20
powerpc               randconfig-002-20241129    clang-20
powerpc               randconfig-003-20241129    clang-20
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241129    clang-20
powerpc64             randconfig-002-20241129    clang-20
powerpc64             randconfig-003-20241129    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    clang-14
riscv                 randconfig-001-20241129    clang-20
riscv                 randconfig-002-20241129    clang-20
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241129    clang-20
s390                  randconfig-002-20241129    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241129    clang-20
sh                    randconfig-002-20241129    clang-20
sh                          rsk7201_defconfig    clang-20
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7751_defconfig    clang-14
sh                   sh7724_generic_defconfig    clang-20
sh                   sh7770_generic_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241129    clang-20
sparc64               randconfig-002-20241129    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20241129    clang-20
um                    randconfig-002-20241129    clang-20
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-14
xtensa                randconfig-001-20241129    clang-20
xtensa                randconfig-002-20241129    clang-20
xtensa                         virt_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

