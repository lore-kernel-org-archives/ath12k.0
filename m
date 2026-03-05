Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45093F33A6F
	for <ath12k@archiver.kernel.org>; Thu,  5 Mar 2026 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Zkelt0Ci84dbbz1RzV7wO/XFNppGSsU26NanpFVfUs=; b=BABm92+q8VTTTwE00PW8t1xOgQ
	R6db0/O2LiehGJi0tI0E2LUO2bQeIIcm0GmalyUZJw1qFBBJNPiufQlZg74c/wKpJRbRPYXRfchnd
	gq6XO/McYmyQTm+cQpBFW9STkPtKwRfopTO/3O10AYkS8y7NT/2adrRh6qRzL2uWUQoyt4d9DAcOu
	fVz1LlaEjvffl2pHisY48cFpAfFvDyH/XTjNmzQrfl1//HhHc0DfB/Sz/rPTk8LDy4rGkcqjxNMfC
	97d/4vJmHtDaW5Z+TddRqor9SWlWVG6M/6S5v1dXgTHSatpxp8pdp1Dy/ylUX7YkWoloyR8Obw4K2
	tPxuWCEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9kL-00000001zkv-3WQ0;
	Thu, 05 Mar 2026 14:32:13 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9kI-00000001zk7-2JrW
	for ath12k@lists.infradead.org;
	Thu, 05 Mar 2026 14:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772721130; x=1804257130;
  h=date:from:to:cc:subject:message-id;
  bh=OXFR2EnwEv0HqDdMSjGhv7bR+HKoOYp1owd9NiReN3Y=;
  b=eSznnkRAaGCXACJRRXVACEzs8V2+kxPjXi+Q1OygEOJAGYe0qKsNZDbT
   sVs4j8KaxD0uZ8YAAAmNJeDjy2vHQpj5Y0m+1ifLbXCnwAWgiKEC6eLrG
   g/60BxTa/3AWh2S6VYA93i82QGz/opBTBYanJk0QT4AW9kr7xyagf6X0x
   jsu2HuDSzB1WLz4t82BYJWnVCGZKmDA7DTt1mXuhzM2QszsG3x0hKpLCM
   kNIfU35dfzpwvK8fP6eJ7VstvLsJJS/Kph/4nPjZvDApz7bVYzFeULy7l
   MT6VBKMumRipHAJ83d6YyyKMiZpMg5Wy27tmZLd9nyjBqrMxpqKMLQQhL
   g==;
X-CSE-ConnectionGUID: GI8iMAsRQHOVQv73EA2eUA==
X-CSE-MsgGUID: 86ErIuD/QZeYC/M7QNqCKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61380652"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="61380652"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:32:10 -0800
X-CSE-ConnectionGUID: c8O7MiZ+RjiXw+6o8xq57A==
X-CSE-MsgGUID: SbUYQ7hMSSKbIqQNiQ72kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="221568034"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 06:32:09 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy9kC-000000000jy-2GSZ;
	Thu, 05 Mar 2026 14:32:04 +0000
Date: Thu, 05 Mar 2026 22:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 9942b3f80f4ebe6852663e0d35ecaf6b7a97c8da
Message-ID: <202603052239.MOgtADZR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_063210_609343_8A934A8F 
X-CRM114-Status: UNSURE (   3.72  )
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
branch HEAD: 9942b3f80f4ebe6852663e0d35ecaf6b7a97c8da  Add localversion-wireless-testing-ath

elapsed time: 1386m

configs tested: 162
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                   randconfig-001-20260305    clang-19
arc                   randconfig-002-20260305    clang-19
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                   randconfig-001-20260305    clang-19
arm                   randconfig-002-20260305    clang-19
arm                   randconfig-003-20260305    clang-19
arm                   randconfig-004-20260305    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260305    gcc-8.5.0
arm64                 randconfig-002-20260305    gcc-8.5.0
arm64                 randconfig-003-20260305    gcc-8.5.0
arm64                 randconfig-004-20260305    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260305    gcc-8.5.0
csky                  randconfig-002-20260305    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260305    clang-20
i386        buildonly-randconfig-002-20260305    clang-20
i386        buildonly-randconfig-003-20260305    clang-20
i386        buildonly-randconfig-004-20260305    clang-20
i386        buildonly-randconfig-005-20260305    clang-20
i386        buildonly-randconfig-006-20260305    clang-20
i386                  randconfig-001-20260305    gcc-14
i386                  randconfig-002-20260305    gcc-14
i386                  randconfig-003-20260305    gcc-14
i386                  randconfig-004-20260305    gcc-14
i386                  randconfig-005-20260305    gcc-14
i386                  randconfig-006-20260305    gcc-14
i386                  randconfig-007-20260305    gcc-14
i386                  randconfig-011-20260305    clang-20
i386                  randconfig-012-20260305    clang-20
i386                  randconfig-013-20260305    clang-20
i386                  randconfig-014-20260305    clang-20
i386                  randconfig-015-20260305    clang-20
i386                  randconfig-016-20260305    clang-20
i386                  randconfig-017-20260305    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        mvme16x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260305    gcc-9.5.0
parisc                randconfig-002-20260305    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               mpc834x_itxgp_defconfig    clang-23
powerpc               randconfig-001-20260305    gcc-9.5.0
powerpc               randconfig-002-20260305    gcc-9.5.0
powerpc64             randconfig-001-20260305    gcc-9.5.0
powerpc64             randconfig-002-20260305    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260305    clang-23
riscv                 randconfig-002-20260305    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260305    clang-23
s390                  randconfig-002-20260305    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260305    clang-23
sh                    randconfig-002-20260305    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260305    gcc-14.3.0
sparc                 randconfig-002-20260305    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260305    gcc-14.3.0
sparc64               randconfig-002-20260305    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260305    gcc-14.3.0
um                    randconfig-002-20260305    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260305    clang-20
x86_64      buildonly-randconfig-002-20260305    clang-20
x86_64      buildonly-randconfig-003-20260305    clang-20
x86_64      buildonly-randconfig-004-20260305    clang-20
x86_64      buildonly-randconfig-005-20260305    clang-20
x86_64      buildonly-randconfig-006-20260305    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260305    clang-20
x86_64                randconfig-002-20260305    clang-20
x86_64                randconfig-003-20260305    clang-20
x86_64                randconfig-004-20260305    clang-20
x86_64                randconfig-005-20260305    clang-20
x86_64                randconfig-006-20260305    clang-20
x86_64                randconfig-011-20260305    clang-20
x86_64                randconfig-012-20260305    clang-20
x86_64                randconfig-013-20260305    clang-20
x86_64                randconfig-014-20260305    clang-20
x86_64                randconfig-015-20260305    clang-20
x86_64                randconfig-016-20260305    clang-20
x86_64                randconfig-071-20260305    gcc-14
x86_64                randconfig-072-20260305    gcc-14
x86_64                randconfig-073-20260305    gcc-14
x86_64                randconfig-074-20260305    gcc-14
x86_64                randconfig-075-20260305    gcc-14
x86_64                randconfig-076-20260305    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260305    gcc-14.3.0
xtensa                randconfig-002-20260305    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

