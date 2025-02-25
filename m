Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1688C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 16:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5etv4BEkEnwndsdYkf3WY4ReVRQX1NkdPfx3jQVvt6E=; b=rsrqLlUeu94QqKUCJTo+5q7Hz1
	pG1wBel6qelG5GqfPr1nzM8mhdpdGw//E0x+B5K1JGjpYAwtxQpow5uNK5FtcsdE3EzMGTr3nNlTc
	gLdJVc0Mm1lR9xcOwVBoOE1Ez0QusZtEW0E7vl8ZlMCycfyesuYkPL8cIS6kuVGD7iS53/RHHcgXu
	ReYZ4DY6YnBRXhUo7F1GyeJZI4hfRUczSmbgQj5nrM3rzCe/pv/Bbbxlzi8OFUu5MO1hnRgqnPrLn
	JxIFQvjOeweIRGAw78vBW1FOXX6cYXeMtrPvX18VofSWgpdoVQfRQKlOcgzdfauzi/kuKOX5j5uuC
	EPFoJBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy5P-00000000RhM-1hqD
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 16:47:11 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxsW-00000000EFL-3w52
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 16:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740501233; x=1772037233;
  h=date:from:to:cc:subject:message-id;
  bh=JAKQWh5LYhuHhHhDd6Eb7nlhP2u29TCARXAAd7veiXQ=;
  b=HuMgK85g8dT8t/xwLpGLB9P+Htuz7wddL24OkhO6/+56imqXC4toeHiB
   mBrbwfBoI6Qf9ZLRfQ/+bIlgfgwk4b+H1owvmwyZw5QJkTuVnQDPBSN4q
   ZYp1Ad/L8lKYIgdORoSFFbMUqxjFCMzTyvqHwgylA5b63oIvO0EV4rVsB
   oFVR94X28HuiITEYwx0W4NdR6wXM5AlRsdr+4jL6q8ecOeXOPd5FXkLzE
   bMlppvPxykX4BG0v4Aj4PnKebD8bfsZCiyAnWGZFzZqtkCr6wvyWJWC9V
   tGJ24aMHk0ykxREFJosFHmQicxdRcioMbu0zbdDzVJuyV1pyvHP/Lkz3Z
   g==;
X-CSE-ConnectionGUID: /sWTluenSVeGSRi1dXg8fA==
X-CSE-MsgGUID: HVZ8dX9BQeyzyqU3hks0Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52739544"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52739544"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 08:33:49 -0800
X-CSE-ConnectionGUID: OE6xebMKSvSxm27HVfJ1zg==
X-CSE-MsgGUID: cw8SvWIORN6ssQbeGu6ZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116240539"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Feb 2025 08:33:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmxsL-000ATr-2F;
	Tue, 25 Feb 2025 16:33:42 +0000
Date: Wed, 26 Feb 2025 00:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 e180a01bf2c4a67db13d70d2d91410a8c6f74be3
Message-ID: <202502260034.1WDmqglG-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_083352_988379_BBFB4A8F 
X-CRM114-Status: UNSURE (   4.08  )
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
branch HEAD: e180a01bf2c4a67db13d70d2d91410a8c6f74be3  wifi: ath12k: Add NULL check to validate tpc_stats

elapsed time: 1408m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250225    gcc-13.2.0
arc                   randconfig-002-20250225    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-21
arm                            dove_defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-21
arm                      integrator_defconfig    clang-15
arm                        mvebu_v7_defconfig    clang-15
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250225    gcc-14.2.0
arm                   randconfig-002-20250225    gcc-14.2.0
arm                   randconfig-003-20250225    gcc-14.2.0
arm                   randconfig-004-20250225    clang-15
arm                          sp7021_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250225    clang-19
arm64                 randconfig-002-20250225    clang-17
arm64                 randconfig-003-20250225    clang-15
arm64                 randconfig-004-20250225    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250225    gcc-14.2.0
csky                  randconfig-002-20250225    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250225    clang-21
hexagon               randconfig-002-20250225    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250225    clang-19
i386        buildonly-randconfig-002-20250225    gcc-11
i386        buildonly-randconfig-003-20250225    clang-19
i386        buildonly-randconfig-004-20250225    clang-19
i386        buildonly-randconfig-005-20250225    gcc-12
i386        buildonly-randconfig-006-20250225    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250225    gcc-14.2.0
loongarch             randconfig-002-20250225    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-21
mips                          rb532_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250225    gcc-14.2.0
nios2                 randconfig-002-20250225    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250225    gcc-14.2.0
parisc                randconfig-002-20250225    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      chrp32_defconfig    clang-21
powerpc                       ebony_defconfig    clang-18
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250225    gcc-14.2.0
powerpc               randconfig-002-20250225    clang-19
powerpc               randconfig-003-20250225    clang-21
powerpc64             randconfig-001-20250225    gcc-14.2.0
powerpc64             randconfig-002-20250225    gcc-14.2.0
powerpc64             randconfig-003-20250225    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250225    clang-15
riscv                 randconfig-002-20250225    clang-21
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                  randconfig-001-20250225    clang-15
s390                  randconfig-002-20250225    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250225    gcc-14.2.0
sh                    randconfig-002-20250225    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250225    gcc-14.2.0
sparc                 randconfig-002-20250225    gcc-14.2.0
sparc64               randconfig-001-20250225    gcc-14.2.0
sparc64               randconfig-002-20250225    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250225    clang-21
um                    randconfig-002-20250225    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250225    gcc-12
x86_64      buildonly-randconfig-002-20250225    clang-19
x86_64      buildonly-randconfig-003-20250225    clang-19
x86_64      buildonly-randconfig-004-20250225    gcc-11
x86_64      buildonly-randconfig-005-20250225    gcc-12
x86_64      buildonly-randconfig-006-20250225    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250225    gcc-14.2.0
xtensa                randconfig-002-20250225    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

