Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60C8C3DA7F
	for <ath12k@archiver.kernel.org>; Sat, 10 Aug 2024 23:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6a0T/LbnHY5L//8LluDIU3dGDF1O4dn3Io5BfTSsVE0=; b=o9B6CZcYvLEnkHD6iqB2cGwxvw
	2wvDeM+kUZpxJfwKeeqgs3A4SqWXv74E+iqdW9VGdNMdAUNeKwcxIZEzpfBDf4HnuQNgMhwgwRvTG
	WMOuc5c/msaKE4/omA4pASkBnT1rJMGcml2S9hm+A8zXC8zUrqnl0QmAoPhRXGZEPpcrg+gGMNBde
	Migy6/+Z6AlKdI/AI6uovdYpFMh8FoTHSn8pgQEHzpCTjpxsxu+uKGOnM/A8WdxNz4vrIp70enP0n
	XbdM3iHyAIfk/cDuZfTJAlixRIHlLMWYOW7rqDmJkv+D42C47qNoIR98HV7T0mSmUugJeGiNw9mN1
	YtaNRGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scvSY-0000000EjID-1NaS
	for ath12k@archiver.kernel.org;
	Sat, 10 Aug 2024 23:25:18 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scvSU-0000000EjHm-3vMc
	for ath12k@lists.infradead.org;
	Sat, 10 Aug 2024 23:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723332315; x=1754868315;
  h=date:from:to:cc:subject:message-id;
  bh=uGvbVhCm9z4SXaXaGlaFlhe9E1i/nZy9Gqu88Yv183Q=;
  b=BBNhrX25DFyl8oVH2dVntW9PGpME6YIUhtpB7k0BRrI6Cfk22a1t96vO
   KJQHWZbfIaaC9CnkUI0sWmM5y1cv76Z7zJo2uP5obOBPR2/R6NHWzWppy
   zY2Oiaof21Idb31ZMNsJOqzeLeHSr5lvprSzs85J60WG1Vq/RwN7r1yZy
   vqY38uHELJ07pzocQA8pT42+oaV9sUfFWjlC5uELEvOQ8uaQx8BCAY5rR
   8vIJiFl1zKLY/XXqDDVKYqY884nhBIxuK/Q772Ed4yP4nfq/0ZwacerXL
   88Ol4Qlm9PVp0Z9Nct70pdKgrew1ZavO1hxlsZ1Rnf0kEtTmXEj/NBCeR
   A==;
X-CSE-ConnectionGUID: n3w7tYrHTWuXcaJMOwOvtw==
X-CSE-MsgGUID: gmm690GiSY6JUWREpfmJiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="25340921"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="25340921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 16:25:10 -0700
X-CSE-ConnectionGUID: f3BWAlhBQCyu2RkvMRW5kA==
X-CSE-MsgGUID: gJCFzkkfRr6W39CQ1YwH7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="62833693"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Aug 2024 16:25:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scvSM-000ANw-1C;
	Sat, 10 Aug 2024 23:25:06 +0000
Date: Sun, 11 Aug 2024 07:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 89fbe672bd0e5e5c39600fcc7a3bca0b8a212d23
Message-ID: <202408110721.N1ziH08D-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_162515_017174_557C5BDC 
X-CRM114-Status: UNSURE (   3.21  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: 89fbe672bd0e5e5c39600fcc7a3bca0b8a212d23  Revert "wifi: ath9k: use devm for request_irq()"

elapsed time: 886m

configs tested: 166
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240810   gcc-13.2.0
arc                   randconfig-002-20240810   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                   randconfig-001-20240810   gcc-14.1.0
arm                   randconfig-002-20240810   clang-20
arm                   randconfig-003-20240810   gcc-14.1.0
arm                   randconfig-004-20240810   gcc-14.1.0
arm                        shmobile_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240810   gcc-14.1.0
arm64                 randconfig-002-20240810   clang-20
arm64                 randconfig-003-20240810   clang-20
arm64                 randconfig-004-20240810   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240810   gcc-14.1.0
csky                  randconfig-002-20240810   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240810   clang-20
hexagon               randconfig-002-20240810   clang-14
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240810   clang-18
i386         buildonly-randconfig-002-20240810   clang-18
i386         buildonly-randconfig-003-20240810   clang-18
i386         buildonly-randconfig-004-20240810   clang-18
i386         buildonly-randconfig-005-20240810   gcc-12
i386         buildonly-randconfig-006-20240810   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240810   clang-18
i386                  randconfig-002-20240810   gcc-12
i386                  randconfig-003-20240810   clang-18
i386                  randconfig-004-20240810   gcc-12
i386                  randconfig-005-20240810   gcc-12
i386                  randconfig-006-20240810   clang-18
i386                  randconfig-011-20240810   gcc-12
i386                  randconfig-012-20240810   gcc-12
i386                  randconfig-013-20240810   clang-18
i386                  randconfig-014-20240810   gcc-12
i386                  randconfig-015-20240810   gcc-12
i386                  randconfig-016-20240810   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240810   gcc-14.1.0
loongarch             randconfig-002-20240810   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                         bigsur_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240810   gcc-14.1.0
nios2                 randconfig-002-20240810   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240810   gcc-14.1.0
parisc                randconfig-002-20240810   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                 mpc834x_itx_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240810   clang-20
powerpc               randconfig-002-20240810   clang-20
powerpc               randconfig-003-20240810   gcc-14.1.0
powerpc                     tqm8541_defconfig   gcc-13.2.0
powerpc64                        alldefconfig   gcc-13.2.0
powerpc64             randconfig-001-20240810   gcc-14.1.0
powerpc64             randconfig-002-20240810   clang-20
powerpc64             randconfig-003-20240810   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240810   clang-20
riscv                 randconfig-002-20240810   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240810   gcc-14.1.0
s390                  randconfig-002-20240810   clang-15
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-13.2.0
sh                    randconfig-001-20240810   gcc-14.1.0
sh                    randconfig-002-20240810   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240810   gcc-14.1.0
sparc64               randconfig-002-20240810   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240810   gcc-12
um                    randconfig-002-20240810   gcc-12
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240810   gcc-14.1.0
xtensa                randconfig-002-20240810   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

