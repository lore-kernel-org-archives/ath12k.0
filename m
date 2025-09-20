Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA9BCAC59A
	for <ath12k@archiver.kernel.org>; Sat, 20 Sep 2025 01:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NmgDvRS2dmeSvuaIAoZVAJzW7BoPHMR69NWeLFGcM4k=; b=P3ehUlI1g49NQoi/ISAvjR9/ka
	k7KKLTO0ynX8eMevTcEEON+E9Tb2qo1BQ9jrazV0QwaA9ZSz8KdJgC9k3vfEEDmOlBD2i4huiYwXP
	bPg548MI6eYKgQbE4+LMVLb594aeck/CJIViUwNosZ2mep+T5uPcs1/xGepcXXwhtIhyYOO0RH5Qn
	GOQbJjyoX9R+31nlcfw3TygJd3I4+6HLEOATgprP4y40+X4NUMdNluEhVFAZsLeNOnrWQGOS1ML4o
	bN/Cok0jybSu//5tKlrN9SKLIID03NZHxpkWfrZeU0/fJ6M1VlZjwnml0z7lXQlgvnv+K8FBpPejR
	wiYbhf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzmPI-00000004Ugs-0WIR;
	Sat, 20 Sep 2025 01:28:56 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzmPF-00000004UgV-2UlP
	for ath12k@lists.infradead.org;
	Sat, 20 Sep 2025 01:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758331734; x=1789867734;
  h=date:from:to:cc:subject:message-id;
  bh=u2CPl4SI1dnxFXoT0q6F4qAejT8Js6vbnbJyCD697NQ=;
  b=IovRDEd4QT4hSV2pc63PenlYBlQEXru5YN221/ctVqYqrOj0/Idrhs/0
   9mCMGQ6DkS4Ng8EN+rOsFHll0a2KbX3L28p/DKKFH9xmjckwBA/TEe4Fc
   mL0UMTkMowRDCo94+gRW1nOKP+3UCT9GNtmg0jVc1yf4ocbxZVa3h/Ign
   W3qckPaCRqR3ECNfjwrtk+k5omleSYDHEHp95Oajii16AUOMsBn7kKJbs
   x+JHvqNlUoI+SF4kY8vBnwEX6Usjs5X+Dt+62MqyW9a44WdyVH+084lvq
   OZ/klB72WmG7zJhCHK4x8eH8SenQL8VHUI1e0SRmcwA5EaKfjDsjKtVTJ
   A==;
X-CSE-ConnectionGUID: Rppyrkn7SwSV/8LRbB7hvA==
X-CSE-MsgGUID: kTRMe6XfSnWH0JJxDH8G9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="48258142"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="48258142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 18:28:53 -0700
X-CSE-ConnectionGUID: pbHpwnrMRziY42F5UB9/Pg==
X-CSE-MsgGUID: 78hRTjKQTvKfMxPUdE8bhg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Sep 2025 18:28:51 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzmPB-0004wh-0r;
	Sat, 20 Sep 2025 01:28:49 +0000
Date: Sat, 20 Sep 2025 09:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 91bfab306bdaa4607dcddba4f8d299b408e5119b
Message-ID: <202509200949.suL3cKjM-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_182853_675697_476A65C4 
X-CRM114-Status: UNSURE (   3.52  )
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
branch HEAD: 91bfab306bdaa4607dcddba4f8d299b408e5119b  Add localversion-wireless-testing-ath

elapsed time: 1383m

configs tested: 138
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
arc                   randconfig-001-20250919    gcc-15.1.0
arc                   randconfig-002-20250919    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                            mmp2_defconfig    gcc-15.1.0
arm                           omap1_defconfig    gcc-15.1.0
arm                       omap2plus_defconfig    gcc-15.1.0
arm                   randconfig-001-20250919    gcc-12.5.0
arm                   randconfig-002-20250919    gcc-10.5.0
arm                   randconfig-003-20250919    gcc-12.5.0
arm                   randconfig-004-20250919    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250919    gcc-15.1.0
arm64                 randconfig-002-20250919    gcc-8.5.0
arm64                 randconfig-003-20250919    gcc-12.5.0
arm64                 randconfig-004-20250919    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250919    gcc-14.3.0
csky                  randconfig-002-20250919    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250919    clang-22
hexagon               randconfig-002-20250919    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250919    clang-20
i386        buildonly-randconfig-002-20250919    gcc-14
i386        buildonly-randconfig-003-20250919    gcc-14
i386        buildonly-randconfig-004-20250919    gcc-14
i386        buildonly-randconfig-005-20250919    clang-20
i386        buildonly-randconfig-006-20250919    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250919    gcc-15.1.0
loongarch             randconfig-002-20250919    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250919    gcc-10.5.0
nios2                 randconfig-002-20250919    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250919    gcc-15.1.0
parisc                randconfig-002-20250919    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 linkstation_defconfig    clang-20
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    clang-22
powerpc               randconfig-001-20250919    gcc-10.5.0
powerpc               randconfig-002-20250919    gcc-8.5.0
powerpc               randconfig-003-20250919    clang-18
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250919    gcc-8.5.0
powerpc64             randconfig-002-20250919    gcc-13.4.0
powerpc64             randconfig-003-20250919    clang-18
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250919    gcc-10.5.0
riscv                 randconfig-002-20250919    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250919    gcc-8.5.0
s390                  randconfig-002-20250919    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250919    gcc-12.5.0
sh                    randconfig-002-20250919    gcc-10.5.0
sh                           se7780_defconfig    gcc-15.1.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250919    gcc-14.3.0
sparc                 randconfig-002-20250919    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250919    clang-22
sparc64               randconfig-002-20250919    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250919    gcc-12
um                    randconfig-002-20250919    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250919    clang-20
x86_64      buildonly-randconfig-002-20250919    gcc-14
x86_64      buildonly-randconfig-003-20250919    gcc-14
x86_64      buildonly-randconfig-004-20250919    clang-20
x86_64      buildonly-randconfig-005-20250919    clang-20
x86_64      buildonly-randconfig-006-20250919    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250919    gcc-11.5.0
xtensa                randconfig-002-20250919    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

