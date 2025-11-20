Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59190CFA459
	for <ath12k@archiver.kernel.org>; Thu, 20 Nov 2025 23:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gp7Gc9157Z2hnclM44AFFltVXrqWVpkq+2G/jbHZ+0Q=; b=RRv4YGHjWtaPGPQVhQq8cEuCzY
	aMCbdeERY5XDgmSFQFC9lz9WC4VTT8V5cpbtL8liezjJN2vknF3OOstX/8l/wGikbMqJGIGBS27Pr
	dbZE6TJXrLiX74Lceaatr3M0B0Jgr7Txyn6NW2gHX6/0K0LcQnbnc35yeAUncX+uoUe8PdTJm4p+m
	conz8rSKf71P4DZWKnWWV5kg1iiYELIPZW+wYUNXrvRU/rjiwGqgj8ZxjSlnJwjh6/NeinJroye0i
	CvxGOxR0q1NmHJk+TiaGvVHvNMoGDI2a5gzoZfwicKlroxmk8JtKIPczHcwV8PiqmIZpITB0KDXfe
	GCrDWLIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMEAj-00000007Zqc-0RBh;
	Thu, 20 Nov 2025 23:34:41 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMEAf-00000007ZqH-3CYX
	for ath12k@lists.infradead.org;
	Thu, 20 Nov 2025 23:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763681677; x=1795217677;
  h=date:from:to:cc:subject:message-id;
  bh=oQzxlPMt21jLavZL5fnJnwsLOTjKO4S/xdYYXFrMa1c=;
  b=dAQQhSQEIvKXR/HDAscgpNiIFBxVK+W5shM+M9rvaqpdGwnaicKOtOx1
   OCvJcMMDkxUo85t/MFAqiR2FvpFWXg7nBEgq26+iqojYkiLwQBkDserqW
   NWOtemTuldeL3uvz4LA9IJfeE8b4Lj9cqdUxi0szEBgJQySZ2uydBidjl
   9+OWpToj4bgO7XTUgnxGRyAW3fjOMD9TjQRTaMJ0KfSr7GgAk8QfqYjrc
   0JRpoIXlKY6GUgLT3JNWa+x/WhPzYJz/eL8yaCxsNDRPYfLptQE+U1ctQ
   pemJSAY1q7mW9MX9QDJeMmacedV+dIVFn48MdfmzwbelAHHaTw177iiwe
   A==;
X-CSE-ConnectionGUID: nwP3gZ77QY2hoULTHnURAQ==
X-CSE-MsgGUID: 93bUoun2TFmwZ0FxAHm0Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76382702"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="76382702"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 15:34:36 -0800
X-CSE-ConnectionGUID: ZScmNStsQuSKxV5gfCSapg==
X-CSE-MsgGUID: jfrNeXuAR/G8u985WIJpaA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2025 15:34:36 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMEAb-0004iF-11;
	Thu, 20 Nov 2025 23:34:33 +0000
Date: Fri, 21 Nov 2025 07:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 a1e19289932aeef26085feb97597d624da6302ab
Message-ID: <202511210710.8XH2SKAp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_153437_845271_A9838529 
X-CRM114-Status: UNSURE (   3.57  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-ath12k-ng
branch HEAD: a1e19289932aeef26085feb97597d624da6302ab  wifi: ath12k: move firmware stats request outside of atomic context

elapsed time: 1598m

configs tested: 116
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251120    gcc-15.1.0
arc                   randconfig-002-20251120    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                       aspeed_g4_defconfig    clang-22
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-001-20251120    gcc-13.4.0
arm                   randconfig-002-20251120    gcc-14.3.0
arm                   randconfig-003-20251120    clang-17
arm                   randconfig-004-20251120    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251121    gcc-8.5.0
arm64                 randconfig-002-20251121    clang-22
arm64                 randconfig-003-20251121    gcc-8.5.0
arm64                 randconfig-004-20251121    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251121    gcc-14.3.0
csky                  randconfig-002-20251121    gcc-11.5.0
hexagon                           allnoconfig    clang-22
hexagon              randconfig-6001-20251120    clang-20
hexagon              randconfig-6002-20251120    clang-22
i386                              allnoconfig    gcc-14
i386                  randconfig-001-20251121    gcc-14
i386                  randconfig-002-20251121    clang-20
i386                  randconfig-003-20251121    gcc-14
i386                  randconfig-004-20251121    clang-20
i386                  randconfig-005-20251121    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch            randconfig-6001-20251120    clang-20
loongarch            randconfig-6002-20251120    clang-18
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
mips                           jazz_defconfig    clang-17
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                randconfig-6001-20251120    gcc-11.5.0
nios2                randconfig-6002-20251120    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251120    gcc-11.5.0
parisc                randconfig-002-20251120    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 canyonlands_defconfig    clang-22
powerpc                     mpc5200_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20251120    clang-22
powerpc               randconfig-002-20251120    clang-22
powerpc                     tqm8541_defconfig    clang-22
powerpc64             randconfig-001-20251120    clang-22
powerpc64             randconfig-002-20251120    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251120    gcc-8.5.0
riscv                 randconfig-002-20251120    clang-22
s390                             alldefconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251120    clang-22
s390                  randconfig-002-20251120    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251120    gcc-12.5.0
sh                    randconfig-002-20251120    gcc-15.1.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251121    gcc-13.4.0
sparc                 randconfig-002-20251120    gcc-8.5.0
sparc                 randconfig-002-20251121    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251121    clang-22
sparc64               randconfig-002-20251120    clang-22
sparc64               randconfig-002-20251121    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251121    clang-22
um                    randconfig-002-20251121    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251121    gcc-14
x86_64      buildonly-randconfig-002-20251121    gcc-14
x86_64      buildonly-randconfig-003-20251121    gcc-14
x86_64      buildonly-randconfig-004-20251121    clang-20
x86_64      buildonly-randconfig-005-20251121    gcc-14
x86_64      buildonly-randconfig-006-20251121    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251121    clang-20
x86_64                randconfig-012-20251121    gcc-14
x86_64                randconfig-013-20251121    gcc-14
x86_64                randconfig-014-20251121    gcc-14
x86_64                randconfig-015-20251121    gcc-14
x86_64                randconfig-016-20251121    gcc-14
x86_64                randconfig-071-20251121    gcc-14
x86_64                randconfig-072-20251121    gcc-14
x86_64                randconfig-073-20251121    gcc-12
x86_64                randconfig-074-20251121    clang-20
x86_64                randconfig-075-20251121    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251121    gcc-11.5.0
xtensa                randconfig-002-20251121    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

