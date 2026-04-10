Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E730DF36BAA
	for <ath12k@archiver.kernel.org>; Fri, 10 Apr 2026 05:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qz/zMibCZrmXOprr3g4m6n0cC51GGzZxSO2GK9ald0I=; b=rpTSQ/i4eg0ihHV6bKSXi9fJa4
	NJiYpqyu0jUD5znHhFkjeJdnZqdCtKHNgScV+xDN0ICa5tbvGJ4A1c7XGFSss3Q/U6Cb0cTtmgSv1
	CWy1d853JyucF6ouHz+3B/2uODhMmB+jQGKqghlRQoSn5txO8+EJ+yuwpRSYtXTfdm2ShU50rKa6P
	cG2cU6c+N263MIx5QKLW9NAbWMnpPi59cajKBR9AA+wVk+lb/H4CLVjhycEhrIhdT1rkp9BzxusVF
	lhX+oczrKtfPQiEmw10huvxLESKCO8eJYa+gX3G4ia7hYpTfVyUCYCOCPHdWJJZuOa4+/MTe1jShV
	DSb2qv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4Lj-0000000Bd7H-2aQ6;
	Fri, 10 Apr 2026 05:24:11 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4Lg-0000000Bd6x-2Bh2
	for ath12k@lists.infradead.org;
	Fri, 10 Apr 2026 05:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775798648; x=1807334648;
  h=date:from:to:cc:subject:message-id;
  bh=a+Vf4pIG8tlH8TU+h+K2wBMNO7XBFNZYBdrueJdFehc=;
  b=fduw8/ccm8xBxXsjoDUWTREBFISrPOeJYGj5fm+QeV8mD3yZFz2iZ89l
   Tx7OQAt7ZI7V+ou1pzEgWry9xEjrPVZTKcnSaCqcvfBuymv4QoFUZGwcN
   qhXwobROEjuUNUse0rQEefYDC1BUpmPyIwPuZPDxUSIS8ziX3Bvk465rD
   2NC7qNf1OS79EDdOtgbswzMfFHS6utoFykrSOAUYeeUDhLHIh23PUWwiP
   AhFJ6VFfYhv0LWFMf7kGfqkE3Lu9RFBz00xqAHYSLDSo7xhSMCesUOdYH
   jYTzBoRi+E397u4Pfh5ddesCC+LE+BoUdh/RT6EFc125PKn/Ud7Ibpz/y
   Q==;
X-CSE-ConnectionGUID: 84sYKg7xR/Kn2LCTpSGYpQ==
X-CSE-MsgGUID: QXpAY0uSSKiMCjAww2uSuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76529446"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76529446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:24:05 -0700
X-CSE-ConnectionGUID: K4D28L9XSaOzD6ZID49TBw==
X-CSE-MsgGUID: 21C1GIYcQ16gMD7zx9G8sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="227982180"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2026 22:24:04 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB4LZ-000000003H7-0pLR;
	Fri, 10 Apr 2026 05:24:01 +0000
Date: Fri, 10 Apr 2026 13:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 492a87efef09fb2f2cdd4b3dc3f3e4a8232f8498
Message-ID: <202604101301.NfcECyYG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_222408_602954_3393F52F 
X-CRM114-Status: UNSURE (   3.67  )
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
branch HEAD: 492a87efef09fb2f2cdd4b3dc3f3e4a8232f8498  Add localversion-wireless-testing-ath

elapsed time: 3096m

configs tested: 175
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260408    gcc-8.5.0
arc                   randconfig-002-20260408    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                     am200epdkit_defconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20260408    gcc-8.5.0
arm                   randconfig-002-20260408    clang-23
arm                   randconfig-003-20260408    clang-18
arm                   randconfig-004-20260408    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260408    gcc-12.5.0
arm64                 randconfig-002-20260408    gcc-12.5.0
arm64                 randconfig-003-20260408    gcc-15.2.0
arm64                 randconfig-004-20260408    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260408    gcc-13.4.0
csky                  randconfig-002-20260408    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260408    clang-23
hexagon               randconfig-002-20260408    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260408    gcc-13
i386        buildonly-randconfig-002-20260408    gcc-13
i386        buildonly-randconfig-003-20260408    gcc-14
i386        buildonly-randconfig-004-20260408    clang-20
i386        buildonly-randconfig-005-20260408    clang-20
i386        buildonly-randconfig-006-20260408    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260408    gcc-14
i386                  randconfig-001-20260409    clang-20
i386                  randconfig-002-20260408    clang-20
i386                  randconfig-002-20260409    gcc-14
i386                  randconfig-003-20260408    clang-20
i386                  randconfig-003-20260409    gcc-14
i386                  randconfig-004-20260408    gcc-14
i386                  randconfig-004-20260409    gcc-14
i386                  randconfig-005-20260408    gcc-14
i386                  randconfig-005-20260409    gcc-14
i386                  randconfig-006-20260408    clang-20
i386                  randconfig-006-20260409    gcc-14
i386                  randconfig-007-20260408    gcc-14
i386                  randconfig-007-20260409    gcc-14
i386                  randconfig-011-20260408    gcc-14
i386                  randconfig-012-20260408    gcc-14
i386                  randconfig-013-20260408    clang-20
i386                  randconfig-014-20260408    clang-20
i386                  randconfig-015-20260408    gcc-14
i386                  randconfig-016-20260408    clang-20
i386                  randconfig-017-20260408    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260408    clang-23
loongarch             randconfig-002-20260408    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260408    gcc-8.5.0
nios2                 randconfig-002-20260408    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260408    gcc-15.2.0
parisc                randconfig-001-20260410    gcc-10.5.0
parisc                randconfig-002-20260408    gcc-8.5.0
parisc                randconfig-002-20260410    gcc-14.3.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260408    gcc-9.5.0
powerpc               randconfig-001-20260410    gcc-8.5.0
powerpc               randconfig-002-20260408    gcc-14.3.0
powerpc               randconfig-002-20260410    gcc-10.5.0
powerpc64             randconfig-001-20260408    clang-18
powerpc64             randconfig-001-20260410    gcc-15.2.0
powerpc64             randconfig-002-20260408    gcc-8.5.0
powerpc64             randconfig-002-20260410    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260408    gcc-12.5.0
riscv                 randconfig-002-20260408    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260408    clang-23
s390                  randconfig-002-20260408    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260408    gcc-15.2.0
sh                    randconfig-002-20260408    gcc-11.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260408    gcc-8.5.0
sparc                 randconfig-002-20260408    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260408    gcc-12.5.0
sparc64               randconfig-002-20260408    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260408    gcc-14
um                    randconfig-002-20260408    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260408    clang-20
x86_64      buildonly-randconfig-002-20260408    clang-20
x86_64      buildonly-randconfig-003-20260408    clang-20
x86_64      buildonly-randconfig-004-20260408    gcc-13
x86_64      buildonly-randconfig-005-20260408    gcc-14
x86_64      buildonly-randconfig-006-20260408    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260408    gcc-14
x86_64                randconfig-002-20260408    gcc-14
x86_64                randconfig-003-20260408    gcc-14
x86_64                randconfig-004-20260408    gcc-14
x86_64                randconfig-005-20260408    gcc-14
x86_64                randconfig-006-20260408    gcc-12
x86_64                randconfig-011-20260408    clang-20
x86_64                randconfig-012-20260408    clang-20
x86_64                randconfig-013-20260408    gcc-14
x86_64                randconfig-014-20260408    clang-20
x86_64                randconfig-015-20260408    clang-20
x86_64                randconfig-016-20260408    clang-20
x86_64                randconfig-071-20260408    clang-20
x86_64                randconfig-072-20260408    clang-20
x86_64                randconfig-073-20260408    clang-20
x86_64                randconfig-074-20260408    gcc-14
x86_64                randconfig-075-20260408    gcc-14
x86_64                randconfig-076-20260408    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260408    gcc-8.5.0
xtensa                randconfig-002-20260408    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

