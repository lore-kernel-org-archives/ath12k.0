Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48036CCD1AA
	for <ath12k@archiver.kernel.org>; Tue, 21 Oct 2025 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pEcfV2Go6mBIvgY2hYphnHaW4Whg05pPWbG9F+7p04s=; b=lAtV/SeTJ3VjqAtqhlcb1ODbuC
	8RjsBioPdykWYXHjtZGBJkWnlFtTLNLMO1EtYlzr0UFX154UIkDwLA97ASXW9dgAvgWl2hBMupZ93
	D3/x++vcL1LvsC00ZJNiqzHsAsUJaoSvf3oVClAb4j6EneEuDo69w0mTqmTA03aGsoXt3v+DYVhQJ
	phhTx8CLpmx+ySe3o0PS2Xo0u5OAwzqgX6SkdrwGi16+FTStu924oBSX/Q+AKHRPmqRgZMX6AyixD
	8MQZeh4yWoiwITrCJUHmetRXK7zgoES5bkOuD2qAOBCVVCYPzL6Cc88k3tkct5/d0dszjZyfvc6Ry
	SCop7+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKSJ-00000000lHe-4836;
	Tue, 21 Oct 2025 22:03:47 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKSH-00000000lH4-33Pn
	for ath12k@lists.infradead.org;
	Tue, 21 Oct 2025 22:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761084226; x=1792620226;
  h=date:from:to:cc:subject:message-id;
  bh=c2sTKlNUflFzJBpJgf9LZD4BN5MAzizDjAN6AG2QJhI=;
  b=DXBiRImHAKiieL2yfmIHZOpBdo0GTpiRCO4dLr3kiXitq7N7Fpvftp+t
   Xvbylz1VifwUR1sQMarB9K75nnNvRoOMmexWLveZWhmuOBX2631b/zSGZ
   h7tPraF6yi/d2b+xPqlaoSSIn6L8MDtQrZzfDyC3Iwsv2bf8fo7ODW6cS
   0+Mod1TxmoMUpEfClFZuQHH3qKyW+zO4ONBeWQAgXW2DH11Fmext9HMIT
   O37A/qbpme4qmVhwDv2u8hIq1DPI3Oo6MVR0PkDtMBJGoIy9DEIxD8Zsh
   lw+q6YBIHPUIvoOs82+YcgaoEfTq94Cec/f+aqUiN8H9CYESEWzoZAd9P
   w==;
X-CSE-ConnectionGUID: 7jm9a714SkC+RwDZWmVvQA==
X-CSE-MsgGUID: CG6KcdYFQPSk3f5Hr5vqpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85846985"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="85846985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 15:03:45 -0700
X-CSE-ConnectionGUID: jg2ZNXnjSzmx9zCxb4F3bA==
X-CSE-MsgGUID: dTonNRPwQXmXRN8FsRAVXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183403698"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2025 15:03:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBKSD-000Bn7-2X;
	Tue, 21 Oct 2025 22:03:41 +0000
Date: Wed, 22 Oct 2025 06:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 2b306fc6b1d00dfe85b3b80eb257256e2b5ba610
Message-ID: <202510220642.Fr60oaju-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_150345_882343_6B7A1842 
X-CRM114-Status: UNSURE (   4.17  )
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
branch HEAD: 2b306fc6b1d00dfe85b3b80eb257256e2b5ba610  spi: amlogic: fix spifc build error

elapsed time: 1448m

configs tested: 215
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251021    clang-22
arc                   randconfig-001-20251021    gcc-8.5.0
arc                   randconfig-002-20251021    clang-22
arc                   randconfig-002-20251021    gcc-9.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20251021    clang-22
arm                   randconfig-002-20251021    clang-22
arm                   randconfig-003-20251021    clang-22
arm                   randconfig-004-20251021    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251021    clang-22
arm64                 randconfig-001-20251021    gcc-15.1.0
arm64                 randconfig-002-20251021    clang-22
arm64                 randconfig-003-20251021    clang-22
arm64                 randconfig-003-20251021    gcc-12.5.0
arm64                 randconfig-004-20251021    clang-18
arm64                 randconfig-004-20251021    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251021    gcc-15.1.0
csky                  randconfig-001-20251021    gcc-8.5.0
csky                  randconfig-002-20251021    gcc-11.5.0
csky                  randconfig-002-20251021    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251021    clang-22
hexagon               randconfig-001-20251021    gcc-8.5.0
hexagon               randconfig-002-20251021    clang-17
hexagon               randconfig-002-20251021    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251021    clang-20
i386        buildonly-randconfig-002-20251021    clang-20
i386        buildonly-randconfig-003-20251021    clang-20
i386        buildonly-randconfig-004-20251021    clang-20
i386        buildonly-randconfig-004-20251021    gcc-14
i386        buildonly-randconfig-005-20251021    clang-20
i386        buildonly-randconfig-005-20251021    gcc-14
i386        buildonly-randconfig-006-20251021    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251021    gcc-14
i386                  randconfig-002-20251021    gcc-14
i386                  randconfig-003-20251021    gcc-14
i386                  randconfig-004-20251021    gcc-14
i386                  randconfig-005-20251021    gcc-14
i386                  randconfig-006-20251021    gcc-14
i386                  randconfig-007-20251021    gcc-14
i386                  randconfig-011-20251021    clang-20
i386                  randconfig-012-20251021    clang-20
i386                  randconfig-013-20251021    clang-20
i386                  randconfig-014-20251021    clang-20
i386                  randconfig-015-20251021    clang-20
i386                  randconfig-016-20251021    clang-20
i386                  randconfig-017-20251021    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251021    clang-22
loongarch             randconfig-001-20251021    gcc-8.5.0
loongarch             randconfig-002-20251021    clang-22
loongarch             randconfig-002-20251021    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251021    gcc-10.5.0
nios2                 randconfig-001-20251021    gcc-8.5.0
nios2                 randconfig-002-20251021    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251021    gcc-8.5.0
parisc                randconfig-002-20251021    gcc-15.1.0
parisc                randconfig-002-20251021    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251021    clang-22
powerpc               randconfig-001-20251021    gcc-8.5.0
powerpc               randconfig-002-20251021    clang-19
powerpc               randconfig-002-20251021    gcc-8.5.0
powerpc               randconfig-003-20251021    clang-22
powerpc               randconfig-003-20251021    gcc-8.5.0
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251021    clang-22
powerpc64             randconfig-001-20251021    gcc-8.5.0
powerpc64             randconfig-002-20251021    gcc-12.5.0
powerpc64             randconfig-002-20251021    gcc-8.5.0
powerpc64             randconfig-003-20251021    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251021    gcc-8.5.0
riscv                 randconfig-002-20251021    clang-22
riscv                 randconfig-002-20251021    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251021    clang-22
s390                  randconfig-001-20251021    gcc-8.5.0
s390                  randconfig-002-20251021    gcc-11.5.0
s390                  randconfig-002-20251021    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251021    gcc-8.5.0
sh                    randconfig-001-20251021    gcc-9.5.0
sh                    randconfig-002-20251021    gcc-10.5.0
sh                    randconfig-002-20251021    gcc-8.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251021    gcc-8.5.0
sparc                 randconfig-002-20251021    gcc-14.3.0
sparc                 randconfig-002-20251021    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251021    gcc-8.5.0
sparc64               randconfig-002-20251021    gcc-10.5.0
sparc64               randconfig-002-20251021    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251021    gcc-14
um                    randconfig-001-20251021    gcc-8.5.0
um                    randconfig-002-20251021    gcc-14
um                    randconfig-002-20251021    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251021    clang-20
x86_64      buildonly-randconfig-001-20251021    gcc-13
x86_64      buildonly-randconfig-002-20251021    clang-20
x86_64      buildonly-randconfig-003-20251021    clang-20
x86_64      buildonly-randconfig-004-20251021    clang-20
x86_64      buildonly-randconfig-005-20251021    clang-20
x86_64      buildonly-randconfig-005-20251021    gcc-14
x86_64      buildonly-randconfig-006-20251021    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251021    gcc-14
x86_64                randconfig-002-20251021    gcc-14
x86_64                randconfig-003-20251021    gcc-14
x86_64                randconfig-004-20251021    gcc-14
x86_64                randconfig-005-20251021    gcc-14
x86_64                randconfig-006-20251021    gcc-14
x86_64                randconfig-007-20251021    gcc-14
x86_64                randconfig-008-20251021    gcc-14
x86_64                randconfig-071-20251021    gcc-14
x86_64                randconfig-072-20251021    gcc-14
x86_64                randconfig-073-20251021    gcc-14
x86_64                randconfig-074-20251021    gcc-14
x86_64                randconfig-075-20251021    gcc-14
x86_64                randconfig-076-20251021    gcc-14
x86_64                randconfig-077-20251021    gcc-14
x86_64                randconfig-078-20251021    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251021    gcc-8.5.0
xtensa                randconfig-002-20251021    gcc-13.4.0
xtensa                randconfig-002-20251021    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

