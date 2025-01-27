Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6639BC02188
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+NyHZI1bNd4jP6Zr+PYdwagnPODt9RI1V39EEIJuSqI=; b=glJ17tfd3lgj/w/2ez4TC1GWy5
	cI0hK1S+YPXLzQXwnOTCpdsXiQqWA8ZkhvHolBJs3D0PCsbf8HyucaccldIrk4y77Ml3f/kIoNLUb
	MVPy4E+5l5A5TmimfVYvK/Gypbbauvf08mgdiPCwJo8f1ukcIFwS9RDk2B43fQwRM3WHd5duTszs5
	8BVuIJOH9+/fzAfPlI0oK9gefi33LuiaNwSj8mCBTSPnOL/KycM23r0CTBXbP339KgSQDM+xWDwOd
	rvcFhvvxBCdsN9D4GLDV9WLtdacEs+bW8mK8o+PKRszB4m9G3WGuoj0YXWiAI1DynrvuRYRG9LtRH
	1En9mk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcONV-00000002HuO-0kOk
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 12:38:09 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcONS-00000002Hu6-1eCZ
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 12:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737981486; x=1769517486;
  h=date:from:to:cc:subject:message-id;
  bh=IA8wEjTEgrtNKO0ZD3ChMaPj7G/DoPsLS/Gx78d6VUg=;
  b=dYoApHGFLQMwN28rjDV82mivv65TS9Oyosbfvlk/+ly4+Zxs5lB32e/D
   c+YTmqbcQQByRDn2h77foivAlRbR1hAwH6ZST9APvnQvoEW+qkOCxcBdb
   bbdX0g+kUdtSxOnYOIEj7Nu0VmvO/fzpm7AqUktLUNp1/lO4uSFhieQZa
   tUJh/huZyaYePnd+tjTC+VqBvEuhTT6GMPTnscOonh0KEF7d5vFsQLflR
   gjCDc1e7ol5sxEj/20xUYDYHP6pzaTy6pSGN++IxUzKzmZjczuGkGoZ97
   rOVuN3Ko+b3e8BJ3luLakVDHwa2Zrq7qlvWcSD37aWRvjnxYoI9d42Rox
   A==;
X-CSE-ConnectionGUID: 4t5OcuAQTzSDDSVWJcxG/w==
X-CSE-MsgGUID: p9uXWrC3T/SjL8cvyPUjfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38608485"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38608485"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 04:38:00 -0800
X-CSE-ConnectionGUID: rGjPFWEoRl6y2pnJGaq3WA==
X-CSE-MsgGUID: qgtOoutQTmmcZrMoXveZiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="108323966"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jan 2025 04:37:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcONJ-000glL-07;
	Mon, 27 Jan 2025 12:37:57 +0000
Date: Mon, 27 Jan 2025 20:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 5e40b6ac64339a78a5fbf1009581aa43eb46c352
Message-ID: <202501272039.TzYh2dsh-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_043806_446392_701319D6 
X-CRM114-Status: UNSURE (   4.00  )
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
branch HEAD: 5e40b6ac64339a78a5fbf1009581aa43eb46c352  Add localversion-wireless-testing-ath

elapsed time: 723m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250127    gcc-13.2.0
arc                   randconfig-002-20250127    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250127    gcc-14.2.0
arm                   randconfig-002-20250127    gcc-14.2.0
arm                   randconfig-003-20250127    clang-16
arm                   randconfig-004-20250127    clang-18
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250127    gcc-14.2.0
arm64                 randconfig-002-20250127    gcc-14.2.0
arm64                 randconfig-003-20250127    gcc-14.2.0
arm64                 randconfig-004-20250127    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250127    gcc-14.2.0
csky                  randconfig-002-20250127    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20250127    clang-17
hexagon               randconfig-002-20250127    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250127    gcc-12
i386        buildonly-randconfig-002-20250127    clang-19
i386        buildonly-randconfig-003-20250127    gcc-12
i386        buildonly-randconfig-004-20250127    gcc-12
i386        buildonly-randconfig-005-20250127    gcc-12
i386        buildonly-randconfig-006-20250127    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250127    gcc-14.2.0
loongarch             randconfig-002-20250127    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250127    gcc-14.2.0
nios2                 randconfig-002-20250127    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250127    gcc-14.2.0
parisc                randconfig-002-20250127    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                    gamecube_defconfig    clang-16
powerpc                     mpc5200_defconfig    clang-20
powerpc               randconfig-001-20250127    clang-16
powerpc               randconfig-002-20250127    gcc-14.2.0
powerpc               randconfig-003-20250127    gcc-14.2.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc                     taishan_defconfig    clang-17
powerpc                     tqm8541_defconfig    clang-15
powerpc64             randconfig-001-20250127    gcc-14.2.0
powerpc64             randconfig-002-20250127    gcc-14.2.0
powerpc64             randconfig-003-20250127    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250127    clang-20
riscv                 randconfig-002-20250127    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250127    clang-20
s390                  randconfig-002-20250127    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250127    gcc-14.2.0
sh                    randconfig-002-20250127    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250127    gcc-14.2.0
sparc                 randconfig-002-20250127    gcc-14.2.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250127    gcc-14.2.0
sparc64               randconfig-002-20250127    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250127    clang-20
um                    randconfig-002-20250127    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250127    clang-19
x86_64      buildonly-randconfig-002-20250127    clang-19
x86_64      buildonly-randconfig-003-20250127    clang-19
x86_64      buildonly-randconfig-004-20250127    clang-19
x86_64      buildonly-randconfig-005-20250127    gcc-12
x86_64      buildonly-randconfig-006-20250127    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250127    gcc-14.2.0
xtensa                randconfig-002-20250127    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

