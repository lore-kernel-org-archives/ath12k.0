Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB302C2D0CD
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 04:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f1mpEgHh62JHE9ls9vssNPSZ+SpePdp/glCh4DpkJ0Q=; b=Tp2keOFXyvsOlp5WyadsM2AYQu
	yjGzd/YkS2L0uXLyCN+Tydd6LtfCx2xiG6lxFxFiL2mzCvhAGZ0f17YXN5ZAfSz9QT/vKgzK0ZD1n
	98vtxdeWaxNXH/sg3QyR/xDaHJIQ2gpH57OlYwOiqN/DMhk9Pl0uGicoifJuGSzHbByfJLYT4rXIH
	xHY9SW+MV8NjzTqGbwIt7vuqVdW2DaOBta6fUIsWqDQhjxTyfQBfhFOja9rMCOrUtQWalxa9BFxXY
	3zhgLE1teSjH8reGgEb7v79TmjZaSkdRpGtdrLfFXN6X39dqtH0uGGGrn9A8sgUZOOuUU8sRIgQ4D
	L2fbL+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHb9o-0000000ElPR-0ugW;
	Wed, 21 May 2025 04:34:20 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHb9l-0000000ElP6-1l3k
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 04:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747802057; x=1779338057;
  h=date:from:to:cc:subject:message-id;
  bh=bk7wrjqH0tzt1/srAAh9tLicGqY174k7MH5b8L6qNUo=;
  b=jAiuIhtG/wvKXxlvNYkFjU6PP3F3KdxVqpTWVDyd74mH/WzEnsVZR1cL
   L/ikFTivphQjyiUSw5V8SLa3hXmPYIQi92Uk8tZzjPj+muQSA5zXDBHA4
   bcoSNwMWYsY49vSlWulLD73avJVmHA9UVpYbkH9cnZFLlmlDxBDUp4bC0
   dZ3zIvkIpQIAl4nVz5cjDKt75wxVq0kfRwtUvSn7Od2h2aYmuVi3ESbXr
   WyQiULmlz6T8i38FsE7PxpJnlOgHtIAqBIwXr5Ev/R9e0/TcCI/A7RNa+
   1D2FY5AuHWCNZaaOjEL9N774XTT4WZ/YMxw6RIp0BZJbvkpCn4xJ+GUpB
   A==;
X-CSE-ConnectionGUID: t/rbrpQHSuy4Wqfx19o/1Q==
X-CSE-MsgGUID: H/NylnReQY+78s2TkC2TIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48880670"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="48880670"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 21:34:16 -0700
X-CSE-ConnectionGUID: pAh6aB+BSIqpMzevF/QSRw==
X-CSE-MsgGUID: Uspi7n3/S4a1FDAeChO7fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139741940"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2025 21:34:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHb9g-000Nra-0f;
	Wed, 21 May 2025 04:34:12 +0000
Date: Wed, 21 May 2025 12:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-ng] BUILD SUCCESS
 d1c8b7118523f4d5c4a9a346037d69b4f2491a3b
Message-ID: <202505211217.K0r8oU5x-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_213417_508572_CB2EA1AA 
X-CRM114-Status: UNSURE (   3.98  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-ng
branch HEAD: d1c8b7118523f4d5c4a9a346037d69b4f2491a3b  wifi: ath12k: Remove the unused ring inits in wcn

elapsed time: 832m

configs tested: 239
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250520    gcc-11.5.0
arc                   randconfig-001-20250521    clang-21
arc                   randconfig-002-20250520    gcc-15.1.0
arc                   randconfig-002-20250521    clang-21
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                         bcm2835_defconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-21
arm                   randconfig-001-20250520    gcc-6.5.0
arm                   randconfig-001-20250521    clang-21
arm                   randconfig-002-20250520    gcc-10.5.0
arm                   randconfig-002-20250521    clang-21
arm                   randconfig-003-20250520    clang-19
arm                   randconfig-003-20250521    clang-21
arm                   randconfig-004-20250520    gcc-7.5.0
arm                   randconfig-004-20250521    clang-21
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250520    clang-21
arm64                 randconfig-001-20250521    clang-21
arm64                 randconfig-002-20250520    gcc-9.5.0
arm64                 randconfig-002-20250521    clang-21
arm64                 randconfig-003-20250520    clang-18
arm64                 randconfig-003-20250521    clang-21
arm64                 randconfig-004-20250520    gcc-9.5.0
arm64                 randconfig-004-20250521    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250521    gcc-10.5.0
csky                  randconfig-001-20250521    gcc-14.2.0
csky                  randconfig-002-20250521    gcc-12.4.0
csky                  randconfig-002-20250521    gcc-14.2.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250521    clang-20
hexagon               randconfig-001-20250521    gcc-14.2.0
hexagon               randconfig-002-20250521    clang-21
hexagon               randconfig-002-20250521    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250520    gcc-12
i386        buildonly-randconfig-001-20250521    clang-20
i386        buildonly-randconfig-002-20250520    gcc-12
i386        buildonly-randconfig-002-20250521    clang-20
i386        buildonly-randconfig-003-20250520    clang-20
i386        buildonly-randconfig-003-20250521    clang-20
i386        buildonly-randconfig-004-20250520    gcc-12
i386        buildonly-randconfig-004-20250521    clang-20
i386        buildonly-randconfig-005-20250520    clang-20
i386        buildonly-randconfig-005-20250521    clang-20
i386        buildonly-randconfig-006-20250520    gcc-12
i386        buildonly-randconfig-006-20250521    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250521    clang-20
i386                  randconfig-002-20250521    clang-20
i386                  randconfig-003-20250521    clang-20
i386                  randconfig-004-20250521    clang-20
i386                  randconfig-005-20250521    clang-20
i386                  randconfig-006-20250521    clang-20
i386                  randconfig-007-20250521    clang-20
i386                  randconfig-011-20250521    gcc-12
i386                  randconfig-012-20250521    gcc-12
i386                  randconfig-013-20250521    gcc-12
i386                  randconfig-014-20250521    gcc-12
i386                  randconfig-015-20250521    gcc-12
i386                  randconfig-016-20250521    gcc-12
i386                  randconfig-017-20250521    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250521    gcc-14.2.0
loongarch             randconfig-001-20250521    gcc-15.1.0
loongarch             randconfig-002-20250521    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250521    gcc-14.2.0
nios2                 randconfig-002-20250521    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250521    gcc-13.3.0
parisc                randconfig-001-20250521    gcc-14.2.0
parisc                randconfig-002-20250521    gcc-11.5.0
parisc                randconfig-002-20250521    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       ebony_defconfig    clang-21
powerpc                      katmai_defconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    clang-21
powerpc                     mpc83xx_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250521    clang-21
powerpc               randconfig-001-20250521    gcc-14.2.0
powerpc               randconfig-002-20250521    gcc-14.2.0
powerpc               randconfig-002-20250521    gcc-8.5.0
powerpc               randconfig-003-20250521    gcc-14.2.0
powerpc               randconfig-003-20250521    gcc-6.5.0
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250521    gcc-14.2.0
powerpc64             randconfig-001-20250521    gcc-8.5.0
powerpc64             randconfig-002-20250521    gcc-14.2.0
powerpc64             randconfig-002-20250521    gcc-6.5.0
powerpc64             randconfig-003-20250521    clang-21
powerpc64             randconfig-003-20250521    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250520    gcc-9.3.0
riscv                 randconfig-001-20250521    gcc-8.5.0
riscv                 randconfig-002-20250520    clang-21
riscv                 randconfig-002-20250521    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250520    clang-21
s390                  randconfig-001-20250521    gcc-8.5.0
s390                  randconfig-002-20250520    clang-21
s390                  randconfig-002-20250521    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250520    gcc-9.3.0
sh                    randconfig-001-20250521    gcc-8.5.0
sh                    randconfig-002-20250520    gcc-9.3.0
sh                    randconfig-002-20250521    gcc-8.5.0
sh                          rsk7201_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250520    gcc-8.5.0
sparc                 randconfig-001-20250521    gcc-8.5.0
sparc                 randconfig-002-20250520    gcc-12.4.0
sparc                 randconfig-002-20250521    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250520    gcc-8.5.0
sparc64               randconfig-001-20250521    gcc-8.5.0
sparc64               randconfig-002-20250520    gcc-12.4.0
sparc64               randconfig-002-20250521    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250520    clang-21
um                    randconfig-001-20250521    gcc-8.5.0
um                    randconfig-002-20250520    clang-21
um                    randconfig-002-20250521    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250520    gcc-12
x86_64      buildonly-randconfig-001-20250521    clang-20
x86_64      buildonly-randconfig-002-20250520    gcc-12
x86_64      buildonly-randconfig-002-20250521    clang-20
x86_64      buildonly-randconfig-003-20250520    gcc-12
x86_64      buildonly-randconfig-003-20250521    clang-20
x86_64      buildonly-randconfig-004-20250520    gcc-12
x86_64      buildonly-randconfig-004-20250521    clang-20
x86_64      buildonly-randconfig-005-20250520    gcc-12
x86_64      buildonly-randconfig-005-20250521    clang-20
x86_64      buildonly-randconfig-006-20250520    gcc-12
x86_64      buildonly-randconfig-006-20250521    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250521    gcc-12
x86_64                randconfig-002-20250521    gcc-12
x86_64                randconfig-003-20250521    gcc-12
x86_64                randconfig-004-20250521    gcc-12
x86_64                randconfig-005-20250521    gcc-12
x86_64                randconfig-006-20250521    gcc-12
x86_64                randconfig-007-20250521    gcc-12
x86_64                randconfig-008-20250521    gcc-12
x86_64                randconfig-071-20250521    clang-20
x86_64                randconfig-072-20250521    clang-20
x86_64                randconfig-073-20250521    clang-20
x86_64                randconfig-074-20250521    clang-20
x86_64                randconfig-075-20250521    clang-20
x86_64                randconfig-076-20250521    clang-20
x86_64                randconfig-077-20250521    clang-20
x86_64                randconfig-078-20250521    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250520    gcc-6.5.0
xtensa                randconfig-001-20250521    gcc-8.5.0
xtensa                randconfig-002-20250520    gcc-12.4.0
xtensa                randconfig-002-20250521    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

