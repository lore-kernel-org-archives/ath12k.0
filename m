Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA56C5B543
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S4KHsIW1J8+aVoPlebIZmTWXNDQeX0N7hb2GAPH9+s8=; b=JDqiGLrWbFsfQju3aTl0D8+093
	o5Y41LEt6pLUrfQQixOTudKLJ4++xHU+7yW9eQN52K60mTa1YMMtB9/WMuVa0Bu/VmzCxOvJRhZ2s
	qhj8LsFGIflpOiNj2a/xXtytO/H0TNwf0fdJM94pAuNumBLPkkjWgCTBoY2+qIoXGTML7EEq6JCWq
	+Iv9WUHvBQd5+ceYKfP5+e6g8SkST2/nGoSxTAKyZZ+QCt0XdRu0w/OkYYvGh5O11G8KyhZIbxdUh
	gPzlzHG8n4DBIzZltumC2ePAOHLR7lPJX4TzJPRFiliRlxHw80qMTmI63tqaxGcoCCQhVIZ2jY9vb
	KDxdR7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCyB-0000000FxXb-3DRt;
	Thu, 05 Jun 2025 15:57:31 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCwj-0000000FxNS-1Z3B
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 15:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749138961; x=1780674961;
  h=date:from:to:cc:subject:message-id;
  bh=BSL4TJMnKp1vX0rN+Sm85vaZ0KHHsCHaLOLdfOUngEs=;
  b=LF7GOwx1LaANhHDJeaK/BvnJ1YswPgLNs/1EAvAiGw/kx05PQSSFAAWH
   TADWTz5imvySJEo/JSH2s9u4R/rh9zzzQ3jCavGIh5GDQv6QmKftZ+KzE
   iwFpRO9JQb9PvZHwKInp6fp8m9UrP1FkJJSu4Q16Y1UQGJKShlZYkaG1z
   mc6MMOHhxDrB8dWXr5vJGDLgww+ILTZpm66E1Vldi3+9ZeSEFnrKgCcsO
   jpsQ7Ps6A5/cjOrhJh87ElpLp4uP+AAfEKp2g7dpLvsfaaMiwF6cX1EKR
   fpkJ1Omzcqv6Gobd9XWjePVR2X1LutAuVjfbsCM6glI9xP3uR68sS9L8J
   w==;
X-CSE-ConnectionGUID: YT4l0Jx0RHmmPq+Sznj4Uw==
X-CSE-MsgGUID: CMMnhm3NTJqa6OM2cvZa3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61885685"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="61885685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 08:55:58 -0700
X-CSE-ConnectionGUID: cZppURYjQqeJU6tobLDqNA==
X-CSE-MsgGUID: N9YfBlEeTf+h6MENQrjYXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="145510020"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2025 08:55:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNCwc-0004Ej-2r;
	Thu, 05 Jun 2025 15:55:54 +0000
Date: Thu, 05 Jun 2025 23:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending-deferred] BUILD SUCCESS
 7526d6be619115a1ccc7cf74b022eb68c92a8193
Message-ID: <202506052328.GGwqUZPh-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_085601_428419_6E727D96 
X-CRM114-Status: UNSURE (   3.52  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
branch HEAD: 7526d6be619115a1ccc7cf74b022eb68c92a8193  wifi: ath12k: install pairwise key first

elapsed time: 1024m

configs tested: 217
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250605    clang-21
arc                   randconfig-001-20250605    gcc-15.1.0
arc                   randconfig-002-20250605    clang-21
arc                   randconfig-002-20250605    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                     davinci_all_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          gemini_defconfig    gcc-15.1.0
arm                      integrator_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    clang-21
arm                   randconfig-001-20250605    clang-21
arm                   randconfig-002-20250605    clang-17
arm                   randconfig-002-20250605    clang-21
arm                   randconfig-003-20250605    clang-21
arm                   randconfig-004-20250605    clang-21
arm                        spear6xx_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250605    clang-21
arm64                 randconfig-002-20250605    clang-21
arm64                 randconfig-003-20250605    clang-21
arm64                 randconfig-004-20250605    clang-21
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250605    clang-21
csky                  randconfig-001-20250605    gcc-10.5.0
csky                  randconfig-002-20250605    clang-21
csky                  randconfig-002-20250605    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250605    clang-21
hexagon               randconfig-002-20250605    clang-20
hexagon               randconfig-002-20250605    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250605    clang-20
i386        buildonly-randconfig-001-20250605    gcc-12
i386        buildonly-randconfig-002-20250605    clang-20
i386        buildonly-randconfig-003-20250605    clang-20
i386        buildonly-randconfig-003-20250605    gcc-12
i386        buildonly-randconfig-004-20250605    clang-20
i386        buildonly-randconfig-005-20250605    clang-20
i386        buildonly-randconfig-006-20250605    clang-20
i386        buildonly-randconfig-006-20250605    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250605    clang-20
i386                  randconfig-002-20250605    clang-20
i386                  randconfig-003-20250605    clang-20
i386                  randconfig-004-20250605    clang-20
i386                  randconfig-005-20250605    clang-20
i386                  randconfig-006-20250605    clang-20
i386                  randconfig-007-20250605    clang-20
i386                  randconfig-011-20250605    clang-20
i386                  randconfig-012-20250605    clang-20
i386                  randconfig-013-20250605    clang-20
i386                  randconfig-014-20250605    clang-20
i386                  randconfig-015-20250605    clang-20
i386                  randconfig-016-20250605    clang-20
i386                  randconfig-017-20250605    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250605    clang-21
loongarch             randconfig-001-20250605    gcc-12.4.0
loongarch             randconfig-002-20250605    clang-21
loongarch             randconfig-002-20250605    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip22_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250605    clang-21
nios2                 randconfig-001-20250605    gcc-14.2.0
nios2                 randconfig-002-20250605    clang-21
nios2                 randconfig-002-20250605    gcc-11.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250605    clang-21
parisc                randconfig-001-20250605    gcc-9.3.0
parisc                randconfig-002-20250605    clang-21
parisc                randconfig-002-20250605    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-21
powerpc               randconfig-001-20250605    clang-21
powerpc               randconfig-002-20250605    clang-21
powerpc               randconfig-003-20250605    clang-21
powerpc64             randconfig-001-20250605    clang-18
powerpc64             randconfig-001-20250605    clang-21
powerpc64             randconfig-002-20250605    clang-21
powerpc64             randconfig-003-20250605    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250605    clang-21
riscv                 randconfig-002-20250605    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250605    clang-21
s390                  randconfig-002-20250605    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-15.1.0
sh                          landisk_defconfig    clang-21
sh                    randconfig-001-20250605    clang-21
sh                    randconfig-001-20250605    gcc-12.4.0
sh                    randconfig-002-20250605    clang-21
sh                    randconfig-002-20250605    gcc-12.4.0
sh                          rsk7201_defconfig    clang-21
sh                          rsk7269_defconfig    clang-21
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250605    clang-21
sparc                 randconfig-001-20250605    gcc-11.5.0
sparc                 randconfig-002-20250605    clang-21
sparc                 randconfig-002-20250605    gcc-7.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250605    clang-21
sparc64               randconfig-001-20250605    gcc-12.4.0
sparc64               randconfig-002-20250605    clang-21
sparc64               randconfig-002-20250605    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250605    clang-21
um                    randconfig-002-20250605    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250605    clang-20
x86_64      buildonly-randconfig-002-20250605    clang-20
x86_64      buildonly-randconfig-002-20250605    gcc-12
x86_64      buildonly-randconfig-003-20250605    clang-20
x86_64      buildonly-randconfig-004-20250605    clang-20
x86_64      buildonly-randconfig-005-20250605    clang-20
x86_64      buildonly-randconfig-005-20250605    gcc-12
x86_64      buildonly-randconfig-006-20250605    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250605    gcc-12
x86_64                randconfig-002-20250605    gcc-12
x86_64                randconfig-003-20250605    gcc-12
x86_64                randconfig-004-20250605    gcc-12
x86_64                randconfig-005-20250605    gcc-12
x86_64                randconfig-006-20250605    gcc-12
x86_64                randconfig-007-20250605    gcc-12
x86_64                randconfig-008-20250605    gcc-12
x86_64                randconfig-071-20250605    clang-20
x86_64                randconfig-072-20250605    clang-20
x86_64                randconfig-073-20250605    clang-20
x86_64                randconfig-074-20250605    clang-20
x86_64                randconfig-075-20250605    clang-20
x86_64                randconfig-076-20250605    clang-20
x86_64                randconfig-077-20250605    clang-20
x86_64                randconfig-078-20250605    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250605    clang-21
xtensa                randconfig-001-20250605    gcc-7.5.0
xtensa                randconfig-002-20250605    clang-21
xtensa                randconfig-002-20250605    gcc-12.4.0
xtensa                    xip_kc705_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

