Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0994CAC5A5
	for <ath12k@archiver.kernel.org>; Sat, 20 Sep 2025 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aS+8iSRHayh+bzR8dEIGrUiPBQ7JqSJyW2rRkgrYBIo=; b=VPKAiOVFGxupNthy2U4Rovs+kq
	AmHYCsK58hTWDqeAVC4G4FhLick1uwSSIA/vJV8tL7RScutTu1ESNLXHLfbu02oTIBHWVaUpw9X+6
	hTzV2Oz0EDzyWBTojsUAeBVL9lt6TtwYYRYhEdbaG6CC6I5bHkfrpmofjgKhxC+voZCvt63Gv8Rm2
	k+O47KDxTOblAo/hjzaFusYBdAyphkaDMY8Z/2GEgC8aXzRkWt/iHu5DIksLWM1lqxTCy8/lLMJ/v
	KlDrEUbS13OQqhNYBAAyHJ9jJxTh5iESHoeQLB01MD2JwSBfgTwWDBCSuVkB/sYPOBtZYSG4px0mY
	iNYffg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v000f-00000005a4m-1yn6;
	Sat, 20 Sep 2025 16:00:25 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v000b-00000005a33-2bdG
	for ath12k@lists.infradead.org;
	Sat, 20 Sep 2025 16:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758384021; x=1789920021;
  h=date:from:to:cc:subject:message-id;
  bh=CEmJmjyy4A5K0GYxZC4HVGOVfKMRq7dkViL8kY3MNIA=;
  b=MiJf9U7BVMI7jLey3ilJPwo05y6Ph8bJA5pqW6ujHd95qrq4LD9Z0sDI
   rOSPlS/cqblaCqBRidzwx/roJNDd9vdQgnIDjP6bMUJ5qoY/dDO5mS1HL
   yiA7yAqd1uYTwHldobog4zKzgRGaLXJs3B9EGVXs5wGRQo3roPCdnbOvO
   Dh8WykcF6A/ie97ewgy5pMuw1zevZhymSy4uWHbR1/yin4FtPyWKTm+HK
   fYX9cW3Zvi18nKzEEjo9T7fAa87W0spW93fU17SL5/WM1GymwafmaP4J1
   Z5Vbz23z9iZANz5ekRVuJRfkhhIxgUYBKPxocC3C6FeSxkK0N24Tu7Zvl
   w==;
X-CSE-ConnectionGUID: ovT++gx4Rl6IubDXxFn5dQ==
X-CSE-MsgGUID: ftCUzZcDSF2eOWMmQhJo5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="83314514"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="83314514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 09:00:19 -0700
X-CSE-ConnectionGUID: JK0QLusnSR6n7F8ml8NMxw==
X-CSE-MsgGUID: YrKwIHHcSD6mZOJJ1iEAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="176143682"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Sep 2025 09:00:18 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v000U-0005UJ-1O;
	Sat, 20 Sep 2025 16:00:14 +0000
Date: Sat, 20 Sep 2025 23:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 9065f0cd2167e4ab637cbffc778f698c13757704
Message-ID: <202509202313.Xui8U69y-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_090021_730157_8221EF12 
X-CRM114-Status: UNSURE (   3.72  )
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
branch HEAD: 9065f0cd2167e4ab637cbffc778f698c13757704  wifi: ath12k: Fix peer lookup in ath12k_dp_mon_rx_deliver_msdu()

elapsed time: 1450m

configs tested: 108
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250920    gcc-9.5.0
arc                   randconfig-002-20250920    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250920    gcc-12.5.0
arm                   randconfig-002-20250920    clang-22
arm                   randconfig-003-20250920    clang-22
arm                   randconfig-004-20250920    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250920    clang-20
arm64                 randconfig-002-20250920    clang-22
arm64                 randconfig-003-20250920    clang-18
arm64                 randconfig-004-20250920    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250920    gcc-10.5.0
csky                  randconfig-002-20250920    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250920    clang-22
hexagon               randconfig-002-20250920    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20250920    clang-20
i386        buildonly-randconfig-002-20250920    clang-20
i386        buildonly-randconfig-003-20250920    clang-20
i386        buildonly-randconfig-004-20250920    gcc-13
i386        buildonly-randconfig-005-20250920    clang-20
i386        buildonly-randconfig-006-20250920    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250920    clang-22
loongarch             randconfig-002-20250920    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250920    gcc-9.5.0
nios2                 randconfig-002-20250920    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250920    gcc-8.5.0
parisc                randconfig-002-20250920    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250920    clang-17
powerpc               randconfig-002-20250920    clang-22
powerpc               randconfig-003-20250920    clang-22
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250920    clang-16
powerpc64             randconfig-002-20250920    gcc-10.5.0
powerpc64             randconfig-003-20250920    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20250920    clang-22
riscv                 randconfig-002-20250920    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250920    clang-20
s390                  randconfig-002-20250920    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250920    gcc-14.3.0
sh                    randconfig-002-20250920    gcc-12.5.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250920    gcc-8.5.0
sparc                 randconfig-002-20250920    gcc-14.3.0
sparc64               randconfig-001-20250920    gcc-8.5.0
sparc64               randconfig-002-20250920    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250920    clang-22
um                    randconfig-002-20250920    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250920    clang-20
x86_64      buildonly-randconfig-002-20250920    clang-20
x86_64      buildonly-randconfig-003-20250920    clang-20
x86_64      buildonly-randconfig-004-20250920    clang-20
x86_64      buildonly-randconfig-005-20250920    gcc-14
x86_64      buildonly-randconfig-006-20250920    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250920    gcc-8.5.0
xtensa                randconfig-002-20250920    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

