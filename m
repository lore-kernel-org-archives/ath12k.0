Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED892C87FCA
	for <ath12k@archiver.kernel.org>; Sun,  3 Aug 2025 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OGhMzLh/bw61PwFQ5BYS9GUXxLVB1of1rtYNzBNPCNo=; b=XQV1YK1Nb9Dm56xi1ozaxGYDvM
	fUR0WqNeu/DblE8gcm2fODmXJ7IgbT6p4lHpfAQgNLei7Strs5c0lSmr6wO25+n2N1T0qvBxqDKH5
	x8cySbtyow4yZ2RUTwkowKaHjOXgc2oOVsS3gU5G4b46bWSlqu4cRQ2/9Y3E+kn98YhlmiOxu8gRy
	kbrDT0qcnuzRyZd6lRB/0+/jhNHvpSgMhfAOSIeYBIYadXW7ylDxLHoMAqvwZhBQgYm2Wq/YpvklF
	lMIerpw7tdd3scCsatCVz735CqrAM75/IqqNxbFGe+adhcCP3y4UxCS5EvFboJiWDY73V/fjFLyhS
	mXDLVTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiWb5-00000008dY7-2DX8;
	Sun, 03 Aug 2025 11:09:47 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiWb2-00000008dX5-3kKT
	for ath12k@lists.infradead.org;
	Sun, 03 Aug 2025 11:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754219384; x=1785755384;
  h=date:from:to:cc:subject:message-id;
  bh=sTXwCwC70rVdMiveWJzTOiUMquAKaHBr3F2imlicOhI=;
  b=amM5FrQaHNPcPteT0D4tTis011OIK8x2Vea2l/IPQJnjPGCRisPa+JoT
   dpLmO0/AQBUPnr/CHBJB1k7nx4R21uz2LocabMB10s2ZeowTzh8H4PsJA
   lNCZUgtGUe3ZDzeOsak69Wx5bZ0ENOczvKhPm9fciZbjgLSueUQHMxkI6
   wHXL/5k0Z25KBM0mhh+0c6bJ1HCedj6OzIOfDtOXYqg/6Huttox0gFJ/a
   h927MWXGp4bn14nTTqTtknH8AJYIlBhwSHqajZfpzpYYIsKg3KIPesz3Q
   VwjePDTworeGDDrvm34k1MtDAFGN7ppDcHQmzYezGhfRnlUXTMzq3tZJO
   w==;
X-CSE-ConnectionGUID: YxAtQD/VSSSvyBUK+bHd/w==
X-CSE-MsgGUID: tpl/TXHsTjetpHNaDdvQLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="55701580"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="55701580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 04:09:35 -0700
X-CSE-ConnectionGUID: wcuKSCf5Sf2FSV0KHvecmQ==
X-CSE-MsgGUID: 5TDYu4ELQtqVrmLzfU3jAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194880456"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Aug 2025 04:09:35 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiWap-0006RQ-2v;
	Sun, 03 Aug 2025 11:09:31 +0000
Date: Sun, 03 Aug 2025 19:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:main-ath12k-ng] BUILD SUCCESS
 db81e046e074a41a82eb3ef16d3c68316047b71c
Message-ID: <202508031905.ZmcYIYbn-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_040944_941534_59DB1198 
X-CRM114-Status: UNSURE (   3.74  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-ath12k-ng
branch HEAD: db81e046e074a41a82eb3ef16d3c68316047b71c  Add localversion-wireless-testing-ath12k-ng

elapsed time: 1031m

configs tested: 131
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250803    gcc-15.1.0
arc                   randconfig-002-20250803    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                        keystone_defconfig    gcc-15.1.0
arm                             mxs_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                   randconfig-001-20250803    gcc-8.5.0
arm                   randconfig-002-20250803    gcc-8.5.0
arm                   randconfig-003-20250803    clang-22
arm                   randconfig-004-20250803    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250803    gcc-8.5.0
arm64                 randconfig-002-20250803    gcc-11.5.0
arm64                 randconfig-003-20250803    clang-17
arm64                 randconfig-004-20250803    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250803    gcc-11.5.0
csky                  randconfig-002-20250803    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250803    clang-22
hexagon               randconfig-002-20250803    clang-22
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250803    gcc-12
i386        buildonly-randconfig-002-20250803    clang-20
i386        buildonly-randconfig-003-20250803    gcc-12
i386        buildonly-randconfig-004-20250803    gcc-12
i386        buildonly-randconfig-005-20250803    clang-20
i386        buildonly-randconfig-006-20250803    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250803    gcc-15.1.0
loongarch             randconfig-002-20250803    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250803    gcc-8.5.0
nios2                 randconfig-002-20250803    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250803    gcc-13.4.0
parisc                randconfig-002-20250803    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250803    gcc-8.5.0
powerpc               randconfig-002-20250803    gcc-8.5.0
powerpc               randconfig-003-20250803    gcc-13.4.0
powerpc64             randconfig-001-20250803    clang-17
powerpc64             randconfig-002-20250803    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250803    clang-22
riscv                 randconfig-002-20250803    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250803    gcc-13.4.0
s390                  randconfig-002-20250803    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250803    gcc-15.1.0
sh                    randconfig-002-20250803    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250803    gcc-8.5.0
sparc                 randconfig-002-20250803    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250803    clang-22
sparc64               randconfig-002-20250803    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250803    clang-22
um                    randconfig-002-20250803    clang-16
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250803    gcc-12
x86_64      buildonly-randconfig-002-20250803    clang-20
x86_64      buildonly-randconfig-003-20250803    gcc-12
x86_64      buildonly-randconfig-004-20250803    gcc-12
x86_64      buildonly-randconfig-005-20250803    gcc-12
x86_64      buildonly-randconfig-006-20250803    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250803    gcc-12.5.0
xtensa                randconfig-002-20250803    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

