Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AD7C3DA4A
	for <ath12k@archiver.kernel.org>; Sat, 10 Aug 2024 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=74O1Ii3XAJZHuMG5zMMBLC/RgnJicIALlalY7ruSFzE=; b=M9N7lGOAkhODLdJeBjtOETPWFM
	8Ejj7ZlxBpX4kO8sOgL0BbR3gDb55oojaiCt920fX28Soz+3ZFTVXYhZtDiZrNgMlYVyQClW1qSWN
	hnTrrXr1rz4r8zEQwe1hHuDQxygqnsbD3JzteKkjc4Me583eJz5TBRbhtnYipzhgtNSDFylZTFI5w
	6NxQR42jT9rzvSJVDtyR0cl+1jKfGePBrlFVmSMwrgip9yTJyaG7JW0+JSuze415xekErIaRByImY
	ZdClVEtqJGn/ZXv6UC2hkABXphryj3NtzXDe7dujg5w4uG/zi5M2jqxR57MknX4hwMb0Owte9oD5x
	kyJlyA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1schdK-0000000DdjP-3f6K
	for ath12k@archiver.kernel.org;
	Sat, 10 Aug 2024 08:39:30 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1schdI-0000000Ddin-0h6q
	for ath12k@lists.infradead.org;
	Sat, 10 Aug 2024 08:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723279168; x=1754815168;
  h=date:from:to:cc:subject:message-id;
  bh=2X6WZR4yUngwXspZDEPAE/M7RBNAL0W3B0NRn9gsKzM=;
  b=DgHFq3ijVxy94BFTcS3X+dH5pt3wza3uHlAa2WoRZQk8h5DEdKUUCRGn
   3qMdvgSDJqM0kpcGTSuw7h+ClmTj2iYsmKNqdx8TJipdI/ENLIP8t3bvD
   oy9SohiYqvYKe3KHT2unWRm9vdbimkqdbpzfeE0xXY/1gKABpH16yGDJS
   hYzXM9DB003hoqtFzi/3S2pjx7UEoqcmMvKTB5kZqi3ZbiMRzNEh3K7PK
   Qoq1XfZj4oFGMJW1fqiDJVqZYAdPV5OHao/wqXtj69y3iiqHx39fw7szW
   No1dWYyv72WeeyrhPZZ47Nt7I3LwdENxiDPw8ATGzJIwDD/gsCNKo+zUZ
   g==;
X-CSE-ConnectionGUID: zA/1oZM8Rz6Q0iwP4lbNFQ==
X-CSE-MsgGUID: c0w3yDEfQbq20zFdToD6Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32864331"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="32864331"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 01:39:28 -0700
X-CSE-ConnectionGUID: rrTWghhvQhS4B9nhuY6IkQ==
X-CSE-MsgGUID: d2BZvzsNR2O1Oh+TKOTzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="81011835"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Aug 2024 01:39:26 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1schdE-0009lt-0R;
	Sat, 10 Aug 2024 08:39:24 +0000
Date: Sat, 10 Aug 2024 16:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 62d7248c318d283e8b9f9cb298c2eb4d94b3662a
Message-ID: <202408101615.rj8WQ5xv-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_013928_279705_98AA3D0B 
X-CRM114-Status: UNSURE (   3.55  )
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
branch HEAD: 62d7248c318d283e8b9f9cb298c2eb4d94b3662a  wifi: ath12k: fix the stack frame size warning in ath12k_mac_op_hw_scan

elapsed time: 1323m

configs tested: 154
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240810   gcc-13.2.0
arc                   randconfig-002-20240810   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   clang-14
arm                            mps2_defconfig   clang-20
arm                   randconfig-001-20240810   gcc-14.1.0
arm                   randconfig-002-20240810   clang-20
arm                   randconfig-003-20240810   gcc-14.1.0
arm                   randconfig-004-20240810   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240810   gcc-14.1.0
arm64                 randconfig-002-20240810   clang-20
arm64                 randconfig-003-20240810   clang-20
arm64                 randconfig-004-20240810   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240810   gcc-14.1.0
csky                  randconfig-002-20240810   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   clang-20
hexagon               randconfig-001-20240810   clang-20
hexagon               randconfig-002-20240810   clang-14
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240809   gcc-12
i386         buildonly-randconfig-002-20240809   clang-18
i386         buildonly-randconfig-003-20240809   gcc-11
i386         buildonly-randconfig-004-20240809   clang-18
i386         buildonly-randconfig-005-20240809   clang-18
i386         buildonly-randconfig-006-20240809   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240809   gcc-12
i386                  randconfig-002-20240809   clang-18
i386                  randconfig-003-20240809   clang-18
i386                  randconfig-004-20240809   gcc-12
i386                  randconfig-005-20240809   clang-18
i386                  randconfig-006-20240809   gcc-12
i386                  randconfig-011-20240809   gcc-12
i386                  randconfig-012-20240809   gcc-12
i386                  randconfig-013-20240809   gcc-12
i386                  randconfig-014-20240809   gcc-12
i386                  randconfig-015-20240809   gcc-11
i386                  randconfig-016-20240809   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240810   gcc-14.1.0
loongarch             randconfig-002-20240810   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
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
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-001-20240810   clang-20
powerpc               randconfig-002-20240810   clang-20
powerpc               randconfig-003-20240810   gcc-14.1.0
powerpc64             randconfig-001-20240810   gcc-14.1.0
powerpc64             randconfig-002-20240810   clang-20
powerpc64             randconfig-003-20240810   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240810   clang-20
riscv                 randconfig-002-20240810   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240810   gcc-14.1.0
s390                  randconfig-002-20240810   clang-15
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240810   gcc-14.1.0
sh                    randconfig-002-20240810   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240810   gcc-14.1.0
sparc64               randconfig-002-20240810   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240810   gcc-12
um                    randconfig-002-20240810   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240810   gcc-12
x86_64       buildonly-randconfig-002-20240810   clang-18
x86_64       buildonly-randconfig-003-20240810   clang-18
x86_64       buildonly-randconfig-004-20240810   clang-18
x86_64       buildonly-randconfig-005-20240810   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240810   clang-18
x86_64                randconfig-002-20240810   clang-18
x86_64                randconfig-003-20240810   gcc-12
x86_64                randconfig-004-20240810   clang-18
x86_64                randconfig-005-20240810   clang-18
x86_64                randconfig-006-20240810   gcc-12
x86_64                randconfig-011-20240810   clang-18
x86_64                randconfig-012-20240810   gcc-12
x86_64                randconfig-013-20240810   clang-18
x86_64                randconfig-014-20240810   clang-18
x86_64                randconfig-015-20240810   clang-18
x86_64                randconfig-016-20240810   clang-18
x86_64                randconfig-071-20240810   clang-18
x86_64                randconfig-072-20240810   gcc-12
x86_64                randconfig-073-20240810   clang-18
x86_64                randconfig-074-20240810   clang-18
x86_64                randconfig-075-20240810   gcc-12
x86_64                randconfig-076-20240810   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240810   gcc-14.1.0
xtensa                randconfig-002-20240810   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

