Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4BAC36012
	for <ath12k@archiver.kernel.org>; Tue, 25 Mar 2025 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yp53FwxoUDIhlULPjnhVzZS6ClxIgxyvbNH3m3GcTfk=; b=JrIwYh2GxFh7vtPrCdji/UAPaX
	7wdGdfjjcw1sJ9TYVOe6dPr00TivMGbHJU64uGs3KyMPjg0GG0f24+otSll4kLKOeo9+aZk7DYbCt
	vy7g5XYVomgfOw2UeDYJ1MM0xNgWYY/fY9nrUAaFLNS0MKxQbzigXf98A1H5kJ6OTsszC5t1oKkEq
	fwacdoU/AtdZSGdRLpUoQ9Sr5EcCehmCNsBFHfrlX/lK0unNX3jX/mlb0pBUj0bwZaqh1Ui0YgQQj
	GXNdoxQq2hjVZP3ym60XHeZPL37gZkJSicaG9jHQ2pcqr3W4RJfq1IHw/SX74zecpn5N2VAaotkoH
	HKMUqPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6yw-00000006SXR-0nep
	for ath12k@archiver.kernel.org;
	Tue, 25 Mar 2025 16:18:26 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6pj-00000006R9F-2Gsf
	for ath12k@lists.infradead.org;
	Tue, 25 Mar 2025 16:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742918935; x=1774454935;
  h=date:from:to:cc:subject:message-id;
  bh=yXhQsHN6nmNTDIt4R15lMwW+rOwmhYRH6wiif+pxWug=;
  b=NqZRL9+OviWonmFCyc+0+Qna0i2Zvuh8q6g35LbfENN87CTtD1fy9M6Q
   7D33y5OkkuGSwqSxV971lkQlRQ4FWhaGWbUWERFYmSjuYhpH5Gu1ikr/f
   zGLQlsfB7USR12mJtehqS9DSipUzP3d7ahUCytFRMKbKyOKYVr/icb/cB
   iwfCk/cKEEOedAKaKiUZ6KME93sV/jxfSIN50ZkGe38H0HwY2FBpYQfNy
   dm+mjnGi8v02f27vo01IjBL6+sV378/wVxpvjclmCme7DT6x0/ToV5yx7
   mTrYaqkwUz40bwAK5PhXGfhUledkMjU6FUBSXuWNo/SfXFGVS0sDNXSfL
   g==;
X-CSE-ConnectionGUID: 81FGew+AQzu12Y2DvdDLRw==
X-CSE-MsgGUID: m6qOOGmlRYGF7r8+iKlcJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="66630601"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="66630601"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:08:50 -0700
X-CSE-ConnectionGUID: xWJ1xQjqTs+twnRth2PUdA==
X-CSE-MsgGUID: 7weaQn1ZSTqpek3g9/DUYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="129261786"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2025 09:08:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx6pX-00050P-2U;
	Tue, 25 Mar 2025 16:08:44 +0000
Date: Wed, 26 Mar 2025 00:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 727c52413f940cd7ee87ff057cb3753b3b87584c
Message-ID: <202503260008.EHHoCXGA-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_090855_652300_10424010 
X-CRM114-Status: UNSURE (   3.78  )
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
branch HEAD: 727c52413f940cd7ee87ff057cb3753b3b87584c  Merge branch 'pending' into main-pending

elapsed time: 1446m

configs tested: 141
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250325    gcc-14.2.0
arc                   randconfig-002-20250325    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-15
arm                            mmp2_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250325    gcc-5.5.0
arm                   randconfig-002-20250325    gcc-5.5.0
arm                   randconfig-003-20250325    gcc-5.5.0
arm                   randconfig-004-20250325    clang-21
arm                           spitz_defconfig    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250325    gcc-9.5.0
arm64                 randconfig-002-20250325    clang-18
arm64                 randconfig-003-20250325    gcc-7.5.0
arm64                 randconfig-004-20250325    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250325    gcc-13.3.0
csky                  randconfig-002-20250325    gcc-14.2.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250325    clang-16
hexagon               randconfig-002-20250325    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250325    gcc-12
i386        buildonly-randconfig-002-20250325    clang-20
i386        buildonly-randconfig-003-20250325    gcc-12
i386        buildonly-randconfig-004-20250325    clang-20
i386        buildonly-randconfig-005-20250325    gcc-12
i386        buildonly-randconfig-006-20250325    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250325    gcc-14.2.0
loongarch             randconfig-002-20250325    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-14
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250325    gcc-7.5.0
nios2                 randconfig-002-20250325    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250325    gcc-12.4.0
parisc                randconfig-002-20250325    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc                 linkstation_defconfig    clang-20
powerpc               randconfig-001-20250325    clang-21
powerpc               randconfig-002-20250325    clang-21
powerpc               randconfig-003-20250325    gcc-9.3.0
powerpc                     sequoia_defconfig    clang-17
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250325    clang-15
powerpc64             randconfig-002-20250325    clang-21
powerpc64             randconfig-003-20250325    gcc-9.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250325    gcc-9.3.0
riscv                 randconfig-002-20250325    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250325    clang-18
s390                  randconfig-002-20250325    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250325    gcc-5.5.0
sh                    randconfig-002-20250325    gcc-11.5.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250325    gcc-8.5.0
sparc                 randconfig-002-20250325    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250325    gcc-8.5.0
sparc64               randconfig-002-20250325    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250325    clang-21
um                    randconfig-002-20250325    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250325    gcc-12
x86_64      buildonly-randconfig-002-20250325    clang-20
x86_64      buildonly-randconfig-003-20250325    gcc-12
x86_64      buildonly-randconfig-004-20250325    gcc-12
x86_64      buildonly-randconfig-005-20250325    clang-20
x86_64      buildonly-randconfig-006-20250325    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250325    gcc-8.5.0
xtensa                randconfig-002-20250325    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

