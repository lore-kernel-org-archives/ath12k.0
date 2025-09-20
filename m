Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940FECAC59A
	for <ath12k@archiver.kernel.org>; Sat, 20 Sep 2025 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=79FBzcQhyGWDMa2GiM61zbZEwcJISiz4muua+q20H3Q=; b=sZ+CWURKULgTqWtEQXKEg/EQNN
	s9RBYbQbc18abXfw+YFocsRmg9keuMKeMdRAP5InsYTpQ7tELqJKANBtT8xJEGwH5FeRDIA54dMcV
	/+x1BAWoLhnOwEpMYmNtKvHjkzkYLmgnMq45D859WKvfowf4NwZe6YI2nEsZzhWmZ7706QHRuldqU
	BV3bRb+SYSxdWf93RAhUiTG+QGbF6aS+8z0cchH91sU5WzZrSsRlMhj9iHo4N3ssHT4+GoY8aXDMG
	Wvp9erqE9AwN7fXLFvPDXMJNLt5il/ZS6KgfOrIGsEVSfHSh3P+IMstOHPAGFvzJK3sum3c9aiGTT
	Ddr1+Jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzl8o-00000004NSX-1PCf;
	Sat, 20 Sep 2025 00:07:50 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzl8l-00000004NRY-397h
	for ath12k@lists.infradead.org;
	Sat, 20 Sep 2025 00:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758326868; x=1789862868;
  h=date:from:to:cc:subject:message-id;
  bh=nGdb4WBsE3upCR9h/Tk/qH8ryY5B94FqsEB0yxZ5t0g=;
  b=lkW5q3DLjy71yaPONmT2a4gYkoQ3e5BHNLco04BpGTy7wGIyt4fRem/W
   0SdYP01KrUVBiypOdXd2JvslzMvOaqcWdC1VXnUTPrkv/yJpMH5XVVD2F
   WKxn/hoWkb5nHawhKrmZB8RbGoCVzE1andJpdJGfuX77P5DlxFf7mQGD9
   Ud/BVRxjICXg972qtdqa/9/0sjfEfypqdWMygXpESeTX6PeDMsZxB7Pd7
   9ozfzAPAQ2tCyLz0xIAwmxoiUKadxhsvIVB4bSqYumYPW5n/179xAoZcJ
   F3ojN2Sued2OTKwOnQbaLstfNrjYFMmTfwpmdQfXCLQmaF2EEVdx5Py7c
   g==;
X-CSE-ConnectionGUID: n75U38NIQi2t1uUrsiGEZQ==
X-CSE-MsgGUID: U6lRc9CYS+qtaaOVdO+3sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59896996"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="59896996"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 17:07:46 -0700
X-CSE-ConnectionGUID: CRDOUeA3R92n23RJ2Mg2Fg==
X-CSE-MsgGUID: OOZcLPHtQ+eb//gqPHrUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="181218182"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Sep 2025 17:07:44 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzl8g-0004uh-04;
	Sat, 20 Sep 2025 00:07:42 +0000
Date: Sat, 20 Sep 2025 08:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 dcdb05a43df9d2e40116a1ddd1460846bd98a6e0
Message-ID: <202509200818.9ZwLBr2C-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_170747_813697_FE62BEAD 
X-CRM114-Status: UNSURE (   3.85  )
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
branch HEAD: dcdb05a43df9d2e40116a1ddd1460846bd98a6e0  wifi: ath12k: Extend beacon miss handling for MLO non-AP STA

elapsed time: 1449m

configs tested: 228
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                         haps_hs_defconfig    gcc-11.5.0
arc                   randconfig-001-20250919    gcc-11.5.0
arc                   randconfig-001-20250919    gcc-15.1.0
arc                   randconfig-002-20250919    gcc-11.5.0
arc                   randconfig-002-20250919    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          ep93xx_defconfig    gcc-11.5.0
arm                   randconfig-001-20250919    gcc-11.5.0
arm                   randconfig-001-20250919    gcc-12.5.0
arm                   randconfig-002-20250919    gcc-10.5.0
arm                   randconfig-002-20250919    gcc-11.5.0
arm                   randconfig-003-20250919    gcc-11.5.0
arm                   randconfig-003-20250919    gcc-12.5.0
arm                   randconfig-004-20250919    clang-22
arm                   randconfig-004-20250919    gcc-11.5.0
arm                        vexpress_defconfig    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250919    gcc-11.5.0
arm64                 randconfig-001-20250919    gcc-15.1.0
arm64                 randconfig-002-20250919    gcc-11.5.0
arm64                 randconfig-002-20250919    gcc-8.5.0
arm64                 randconfig-003-20250919    gcc-11.5.0
arm64                 randconfig-003-20250919    gcc-12.5.0
arm64                 randconfig-004-20250919    gcc-11.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250919    clang-22
csky                  randconfig-001-20250919    gcc-14.3.0
csky                  randconfig-002-20250919    clang-22
csky                  randconfig-002-20250919    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250919    clang-22
hexagon               randconfig-002-20250919    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250919    clang-20
i386        buildonly-randconfig-002-20250919    gcc-14
i386        buildonly-randconfig-003-20250919    gcc-14
i386        buildonly-randconfig-004-20250919    gcc-14
i386        buildonly-randconfig-005-20250919    clang-20
i386        buildonly-randconfig-006-20250919    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250919    gcc-14
i386                  randconfig-002-20250919    gcc-14
i386                  randconfig-003-20250919    gcc-14
i386                  randconfig-004-20250919    gcc-14
i386                  randconfig-005-20250919    gcc-14
i386                  randconfig-006-20250919    gcc-14
i386                  randconfig-007-20250919    gcc-14
i386                  randconfig-011-20250919    clang-20
i386                  randconfig-012-20250919    clang-20
i386                  randconfig-013-20250919    clang-20
i386                  randconfig-014-20250919    clang-20
i386                  randconfig-015-20250919    clang-20
i386                  randconfig-016-20250919    clang-20
i386                  randconfig-017-20250919    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250919    clang-22
loongarch             randconfig-001-20250919    gcc-15.1.0
loongarch             randconfig-002-20250919    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            alldefconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250919    clang-22
nios2                 randconfig-001-20250919    gcc-10.5.0
nios2                 randconfig-002-20250919    clang-22
nios2                 randconfig-002-20250919    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-11.5.0
parisc                randconfig-001-20250919    clang-22
parisc                randconfig-001-20250919    gcc-15.1.0
parisc                randconfig-002-20250919    clang-22
parisc                randconfig-002-20250919    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-11.5.0
powerpc               randconfig-001-20250919    clang-22
powerpc               randconfig-001-20250919    gcc-10.5.0
powerpc               randconfig-002-20250919    clang-22
powerpc               randconfig-002-20250919    gcc-8.5.0
powerpc               randconfig-003-20250919    clang-18
powerpc               randconfig-003-20250919    clang-22
powerpc                     tqm8560_defconfig    gcc-11.5.0
powerpc64             randconfig-001-20250919    clang-22
powerpc64             randconfig-001-20250919    gcc-8.5.0
powerpc64             randconfig-002-20250919    clang-22
powerpc64             randconfig-002-20250919    gcc-13.4.0
powerpc64             randconfig-003-20250919    clang-18
powerpc64             randconfig-003-20250919    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250919    gcc-10.5.0
riscv                 randconfig-002-20250919    gcc-10.5.0
riscv                 randconfig-002-20250919    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250919    gcc-10.5.0
s390                  randconfig-001-20250919    gcc-8.5.0
s390                  randconfig-002-20250919    gcc-10.5.0
s390                  randconfig-002-20250919    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250919    gcc-10.5.0
sh                    randconfig-001-20250919    gcc-12.5.0
sh                    randconfig-002-20250919    gcc-10.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250919    gcc-10.5.0
sparc                 randconfig-001-20250919    gcc-14.3.0
sparc                 randconfig-002-20250919    gcc-10.5.0
sparc                 randconfig-002-20250919    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250919    clang-22
sparc64               randconfig-001-20250919    gcc-10.5.0
sparc64               randconfig-002-20250919    gcc-10.5.0
sparc64               randconfig-002-20250919    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250919    gcc-10.5.0
um                    randconfig-001-20250919    gcc-12
um                    randconfig-002-20250919    clang-22
um                    randconfig-002-20250919    gcc-10.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250919    clang-20
x86_64      buildonly-randconfig-002-20250919    gcc-14
x86_64      buildonly-randconfig-003-20250919    gcc-14
x86_64      buildonly-randconfig-004-20250919    clang-20
x86_64      buildonly-randconfig-005-20250919    clang-20
x86_64      buildonly-randconfig-006-20250919    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250919    clang-20
x86_64                randconfig-002-20250919    clang-20
x86_64                randconfig-003-20250919    clang-20
x86_64                randconfig-004-20250919    clang-20
x86_64                randconfig-005-20250919    clang-20
x86_64                randconfig-006-20250919    clang-20
x86_64                randconfig-007-20250919    clang-20
x86_64                randconfig-008-20250919    clang-20
x86_64                randconfig-071-20250919    gcc-14
x86_64                randconfig-072-20250919    gcc-14
x86_64                randconfig-073-20250919    gcc-14
x86_64                randconfig-074-20250919    gcc-14
x86_64                randconfig-075-20250919    gcc-14
x86_64                randconfig-076-20250919    gcc-14
x86_64                randconfig-077-20250919    gcc-14
x86_64                randconfig-078-20250919    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250919    gcc-10.5.0
xtensa                randconfig-001-20250919    gcc-11.5.0
xtensa                randconfig-002-20250919    gcc-10.5.0
xtensa                randconfig-002-20250919    gcc-8.5.0
xtensa                    xip_kc705_defconfig    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

