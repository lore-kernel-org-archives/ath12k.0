Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FDDC28B20
	for <ath12k@archiver.kernel.org>; Sat, 29 Mar 2025 00:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mojUrPdVCjV7iM+BfpjFt03mHvnQkE0+jRBI3hi/CsE=; b=i+OP/6HRV/OtlvqbB7GqolVulv
	3hvKqpp8UAOZPZ2s0MjLtLUdismphnFN4TnJgw4zuUt4eu/AsqSeBxWhOaeXWPR/cSpWJnOK0PLDG
	GxpKciENav8zCHF/fesUT/6X7lEcFqD5c1lsjFxO9UPPRRHSKSGPGu9MDLgBwEf7PzfzQgSn3r6fy
	140IIyF6pmglr29DQeVbHDYT+fizShnbKgYBSxZTTD2jLWUXk7j+diU4bRDUr5Kf3Du1/Grw6f/pK
	3rnZZNmgl9LLJ/PP/K+ldbbHnoPPbg0G1Nz5zimrrln14qtM63axgCk+tit/7iKFOGEAL1LkMtm1s
	NbVfUUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJud-0000000EXY1-3nNs
	for ath12k@archiver.kernel.org;
	Sat, 29 Mar 2025 00:18:59 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJuY-0000000EXXi-2xzw
	for ath12k@lists.infradead.org;
	Sat, 29 Mar 2025 00:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743207534; x=1774743534;
  h=date:from:to:cc:subject:message-id;
  bh=0HE9/H58TifXfIN108ImSWtJh8T590UG1Yj9vSCu8d4=;
  b=lP3HM6HJdLsTdYeReJQYRAeTp8vny0ihzDuCWgmkLJDLl9ur58tm4dck
   /q2oEXt+0dyHv8ntI6muVCkZ4eFvLEzzRzjvWabWffQ/Xl6GEx+KOf/HA
   iXue+gCkCY0KmN5AN6QqAcTtQYztljnppNA41IIBCf63p2EcDaRffhY0y
   rZMkiFh1mXKDkMFNNzqiF7oDrPNfFFfHmKI2KZP7noBgtokXRXHuYOlHW
   vfmYdC6AI9WFy3/86N7zfkng07ncmARw1tktvGmVompoRq+khS1W3SXql
   FmDcIGpiEwwjqUTmdfCJDSnXSDK+3X/miRae8Pr0PB9GWNDcVkDkduOcM
   g==;
X-CSE-ConnectionGUID: DA9PaSDPQ6GBEtzKQeqcSg==
X-CSE-MsgGUID: oDT/L/HRQAm7BDWS6O+kgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="43739945"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="43739945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 17:18:53 -0700
X-CSE-ConnectionGUID: 8JShvlzuTYm12yT+5XBoaA==
X-CSE-MsgGUID: zM8Fc3xeTdaF+6IZMK83QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="162831094"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2025 17:18:51 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyJuT-0007nN-1q;
	Sat, 29 Mar 2025 00:18:49 +0000
Date: Sat, 29 Mar 2025 08:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 c34fb584f35846b9e0d6bb8e2418a7152ec3499c
Message-ID: <202503290834.Vs4HVJ6k-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_171854_788867_21C0CD13 
X-CRM114-Status: UNSURE (   3.76  )
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
branch HEAD: c34fb584f35846b9e0d6bb8e2418a7152ec3499c  Add localversion-wireless-testing-ath

elapsed time: 1442m

configs tested: 146
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250328    gcc-12.4.0
arc                   randconfig-002-20250328    gcc-14.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-16
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250328    clang-18
arm                   randconfig-002-20250328    gcc-8.5.0
arm                   randconfig-003-20250328    clang-18
arm                   randconfig-004-20250328    gcc-8.5.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                       spear13xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250328    gcc-8.5.0
arm64                 randconfig-002-20250328    clang-15
arm64                 randconfig-003-20250328    clang-16
arm64                 randconfig-004-20250328    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250328    gcc-12.4.0
csky                  randconfig-002-20250328    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250328    clang-21
hexagon               randconfig-002-20250328    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250328    gcc-12
i386        buildonly-randconfig-002-20250328    gcc-12
i386        buildonly-randconfig-003-20250328    clang-20
i386        buildonly-randconfig-004-20250328    gcc-12
i386        buildonly-randconfig-005-20250328    clang-20
i386        buildonly-randconfig-006-20250328    gcc-12
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250328    gcc-14.2.0
loongarch             randconfig-002-20250328    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250328    gcc-6.5.0
nios2                 randconfig-002-20250328    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250328    gcc-9.3.0
parisc                randconfig-002-20250328    gcc-13.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      mgcoge_defconfig    clang-21
powerpc               randconfig-001-20250328    clang-21
powerpc               randconfig-002-20250328    clang-21
powerpc               randconfig-003-20250328    clang-21
powerpc                     redwood_defconfig    clang-21
powerpc                     taishan_defconfig    clang-17
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250328    clang-16
powerpc64             randconfig-002-20250328    clang-21
powerpc64             randconfig-003-20250328    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250328    gcc-8.5.0
riscv                 randconfig-002-20250328    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250328    gcc-6.5.0
s390                  randconfig-002-20250328    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250328    gcc-10.5.0
sh                    randconfig-002-20250328    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250328    gcc-13.3.0
sparc                 randconfig-002-20250328    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250328    gcc-11.5.0
sparc64               randconfig-002-20250328    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250328    clang-17
um                    randconfig-002-20250328    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250328    clang-20
x86_64      buildonly-randconfig-002-20250328    clang-20
x86_64      buildonly-randconfig-003-20250328    clang-20
x86_64      buildonly-randconfig-004-20250328    clang-20
x86_64      buildonly-randconfig-005-20250328    clang-20
x86_64      buildonly-randconfig-006-20250328    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250328    gcc-9.3.0
xtensa                randconfig-002-20250328    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

