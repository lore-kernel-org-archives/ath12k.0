Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68B1CD4F49
	for <ath12k@archiver.kernel.org>; Fri, 14 Nov 2025 04:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cXb7EVTRA5Vep6vi9bA5lY0xIAjZlIRLTYEZdVhrSWk=; b=hYUcbEaWzFk58VarGhTR98EZmU
	mLvEIsqe05e/isESQKJ6UjJRQMclLayzzAr1OWQI4u59Hy5APCxBiP7p6O2mElHykLSpRU172g3cw
	KWP+ptTm74Ru2LSmaTPd7Okh2WV/bSK/fBDDyu9ziilVEQZnmmk/MeOT+k0ngcFjuDJjsgd1Lh+Je
	hVO0wUmBDqmzE/+CSCactCGROVRjmOgFdbPrDa5PvVOqMbE8ghMYR9mvDJxPX3BVBd7SGaXNaFmso
	Uedk349CCFDUGPLQzg7U563mb5b8Nxwc5JvuHe/XUA0HKF0xqMDxKnAX2qvQXZa5hTlIVikgQrZ9Z
	kP2i+Svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJl0R-0000000BWJl-1EzK;
	Fri, 14 Nov 2025 04:01:51 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJl0O-0000000BWJT-4Av8
	for ath12k@lists.infradead.org;
	Fri, 14 Nov 2025 04:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763092909; x=1794628909;
  h=date:from:to:cc:subject:message-id;
  bh=PIWo1VvGVwS1w2KldwC7zqkNwjemiuswy7+v0CxsegE=;
  b=fa7WRmeiq0A0/XLJkU/1aO0dRhY1A0SEgDI3lOdx/w+utmVrONiyMKzS
   9ygcO46VTM2g9kZ7wO8jJmMcYWtOoBrIeZSsRDWI6j+Oj/Swf4RKAMW6C
   0ABOuWeojjxJoS8J/lwDuOCxhYJTFt8BLIhUJtZ1hTX0/cG8YqVdXxMlA
   kbCLa4WzsKDB8qdCGDpj2HxPWDJlUVkoZhBHl4+dc7mUOEHSXVzVcjjEI
   sMBPXldCL5MmEmjVzD5mv0hZkFkW2NWDZltLwGuXhdqgXAkR66qUuQgKC
   bUH48Ok7Dzc7AB8cpNdRxq+cPM+OT6rRPt1bj5KeYbAIQLEklInRvXPOX
   Q==;
X-CSE-ConnectionGUID: Rxbz/NWMSI+5jMCf8YbMOA==
X-CSE-MsgGUID: eRxtphHZSa2/R6xzT1xvzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65114647"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65114647"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 20:01:46 -0800
X-CSE-ConnectionGUID: 216t4/DWSw248av66RGizQ==
X-CSE-MsgGUID: h3HSHZeFTg2nVkPW7nBhAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189686386"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2025 20:01:46 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJl0J-00069T-0j;
	Fri, 14 Nov 2025 04:01:43 +0000
Date: Fri, 14 Nov 2025 12:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 5f07195676a5123da1cd27a7f0b1eeb5f534245b
Message-ID: <202511141249.NKNONL7r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_200149_098638_27028984 
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
branch HEAD: 5f07195676a5123da1cd27a7f0b1eeb5f534245b  kbuild: Strip trailing padding bytes from modules.builtin.modinfo

elapsed time: 1766m

configs tested: 121
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                        nsimosci_defconfig    gcc-15.1.0
arc                   randconfig-001-20251113    gcc-8.5.0
arc                   randconfig-002-20251113    gcc-8.5.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251113    gcc-10.5.0
arm                   randconfig-002-20251113    clang-22
arm                   randconfig-003-20251113    clang-22
arm                   randconfig-004-20251113    clang-22
arm                           sunxi_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251114    gcc-8.5.0
arm64                 randconfig-002-20251114    clang-22
arm64                 randconfig-003-20251114    clang-22
arm64                 randconfig-004-20251114    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251114    gcc-10.5.0
csky                  randconfig-002-20251114    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251113    clang-22
hexagon               randconfig-001-20251114    clang-22
hexagon               randconfig-002-20251114    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251114    gcc-14
i386        buildonly-randconfig-003-20251114    clang-20
i386        buildonly-randconfig-004-20251114    gcc-14
i386                  randconfig-001-20251114    clang-20
i386                  randconfig-002-20251114    clang-20
i386                  randconfig-003-20251114    clang-20
i386                  randconfig-004-20251114    gcc-14
i386                  randconfig-005-20251114    gcc-14
i386                  randconfig-006-20251114    clang-20
i386                  randconfig-007-20251114    clang-20
i386                  randconfig-011-20251114    gcc-12
i386                  randconfig-012-20251114    gcc-14
i386                  randconfig-013-20251114    gcc-14
i386                  randconfig-014-20251114    clang-20
i386                  randconfig-015-20251114    gcc-14
i386                  randconfig-016-20251114    gcc-14
i386                  randconfig-017-20251114    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251114    clang-18
loongarch             randconfig-002-20251114    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251113    gcc-8.5.0
nios2                 randconfig-001-20251114    gcc-10.5.0
nios2                 randconfig-002-20251114    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251113    gcc-8.5.0
parisc                randconfig-002-20251113    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                       ebony_defconfig    clang-22
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251113    clang-22
powerpc               randconfig-002-20251113    clang-22
powerpc                     taishan_defconfig    clang-17
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251113    clang-22
powerpc64             randconfig-002-20251113    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251114    gcc-13.4.0
riscv                 randconfig-002-20251114    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251114    gcc-8.5.0
s390                  randconfig-002-20251114    gcc-11.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        dreamcast_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20251114    gcc-10.5.0
sh                    randconfig-002-20251114    gcc-15.1.0
sh                          rsk7203_defconfig    gcc-15.1.0
sh                           se7206_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251114    gcc-14.3.0
sparc                 randconfig-002-20251114    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251114    gcc-8.5.0
sparc64               randconfig-002-20251114    gcc-14.3.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251114    gcc-13
um                    randconfig-002-20251114    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251114    clang-20
x86_64      buildonly-randconfig-002-20251114    gcc-14
x86_64      buildonly-randconfig-003-20251114    gcc-14
x86_64      buildonly-randconfig-004-20251114    clang-20
x86_64      buildonly-randconfig-005-20251114    clang-20
x86_64      buildonly-randconfig-006-20251114    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251114    clang-20
x86_64                randconfig-072-20251114    clang-20
x86_64                randconfig-073-20251114    clang-20
x86_64                randconfig-074-20251114    clang-20
x86_64                randconfig-075-20251114    gcc-14
x86_64                randconfig-076-20251114    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251114    gcc-14.3.0
xtensa                randconfig-002-20251114    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

