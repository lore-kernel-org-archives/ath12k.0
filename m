Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47639C36018
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 20:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZpnUF8jFnQI3XLGmUlJuwB8xW5VPX9WjhlF/x6Un6o=; b=MHdPzCLRmhdZtnBlDHWWPc3feN
	2bTybQXm0BpiwBQapdwxETEQYtbpalmsTR7Lr7HQrHb4ufQh9q7e6pmWdHDwZ+GB9KqVmC2TVdfxW
	xuhBG4us3H3WW2+RXNFhvuTgjdD+jiW6fZB/PhaEUatnQvjPJLUQGhirNMCK4sgLzOyL0NqDY0F70
	AzltnKlA8ryzFN6mHOKilKo3m9lae5qtj7JEjIDgdK/em7JiN4MV3G7+NTEad2SjK/T8pkD7+lrrm
	gHqdHBhnVgICvkDNp+uy7ikycCrIbaUX0XfKk7qeasCyq5aAMQr8K3O0dyBhVhrwRXeqXi8HYzdN+
	FTU6/4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04XM-000000077lZ-3v4C
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 20:18:12 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04XK-000000077kn-2BZW
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 20:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743625090; x=1775161090;
  h=date:from:to:cc:subject:message-id;
  bh=oDvdLJp2d8DPU54MyhrfdMXeK+fQ64l35frpwbg8XSA=;
  b=nWJDMjfY/zCgeWpWBowznVQTHPC79lh6jqlagVAmDmIfFHC+AA2f4I2Y
   5hvgQQiZychSAJWA5VhcM4fQn91XNG/YBwx5G4zZPfsfv4ZpTGk45/FeX
   8gGFHqgsFW5hPx5nJrO3fvH0SI9lGhakYizTEvJjWghmDhyWdB445Dl+L
   DEzIBxRQHxsiiIqzouNM8ucOblJ8sQASrxTSkpiJf/3MU7mnlfkZdjOWV
   jk8mAkA337OtWagw93qPWj3nivqyF0srJ5wG65xMsBIHwETeqyqWEU+qO
   cP6nN9U6n9TBHLQgzvyDCdB9p/dtsJUstF98ax9YMVZ+x9TsxFF2qkPIG
   w==;
X-CSE-ConnectionGUID: gHPbziAhTeuDA85aPcJl/A==
X-CSE-MsgGUID: k8fPodiOR6KnEtZfbSZDCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48884028"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="48884028"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 13:18:08 -0700
X-CSE-ConnectionGUID: I2clk032TM2+KXGx4bnvnA==
X-CSE-MsgGUID: O1w0qUQHTpC7NNIPx3je/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="127708171"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Apr 2025 13:18:08 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u04XF-000B0U-0S;
	Wed, 02 Apr 2025 20:18:05 +0000
Date: Thu, 03 Apr 2025 04:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 50afcd9a825a7d542d456942c2eac2d64e9b8875
Message-ID: <202504030431.DtpYwSBz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_131810_599482_FDBCDCE4 
X-CRM114-Status: UNSURE (   3.80  )
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
branch HEAD: 50afcd9a825a7d542d456942c2eac2d64e9b8875  Merge branch 'pending' into main-pending

elapsed time: 1448m

configs tested: 144
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250402    gcc-14.2.0
arc                   randconfig-002-20250402    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-21
arm                   milbeaut_m10v_defconfig    clang-19
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250402    clang-20
arm                   randconfig-002-20250402    clang-16
arm                   randconfig-003-20250402    clang-20
arm                   randconfig-004-20250402    clang-16
arm                        spear6xx_defconfig    clang-15
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250402    gcc-5.5.0
arm64                 randconfig-002-20250402    gcc-7.5.0
arm64                 randconfig-003-20250402    gcc-9.5.0
arm64                 randconfig-004-20250402    clang-17
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250402    gcc-9.3.0
csky                  randconfig-002-20250402    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250402    clang-21
hexagon               randconfig-002-20250402    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250402    gcc-12
i386        buildonly-randconfig-002-20250402    gcc-12
i386        buildonly-randconfig-003-20250402    gcc-12
i386        buildonly-randconfig-004-20250402    gcc-12
i386        buildonly-randconfig-005-20250402    gcc-11
i386        buildonly-randconfig-006-20250402    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250402    gcc-14.2.0
loongarch             randconfig-002-20250402    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
mips                         bigsur_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250402    gcc-7.5.0
nios2                 randconfig-002-20250402    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250402    gcc-14.2.0
parisc                randconfig-002-20250402    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250402    clang-21
powerpc               randconfig-002-20250402    gcc-9.3.0
powerpc               randconfig-003-20250402    clang-21
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250402    clang-21
powerpc64             randconfig-002-20250402    clang-21
powerpc64             randconfig-003-20250402    gcc-5.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250402    gcc-9.3.0
riscv                 randconfig-002-20250402    gcc-7.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250402    clang-15
s390                  randconfig-002-20250402    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250402    gcc-7.5.0
sh                    randconfig-002-20250402    gcc-7.5.0
sh                           se7343_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250402    gcc-12.4.0
sparc                 randconfig-002-20250402    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250402    gcc-14.2.0
sparc64               randconfig-002-20250402    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250402    gcc-12
um                    randconfig-002-20250402    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250402    clang-20
x86_64      buildonly-randconfig-002-20250402    gcc-12
x86_64      buildonly-randconfig-003-20250402    clang-20
x86_64      buildonly-randconfig-004-20250402    gcc-12
x86_64      buildonly-randconfig-005-20250402    clang-20
x86_64      buildonly-randconfig-006-20250402    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250402    gcc-8.5.0
xtensa                randconfig-002-20250402    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

