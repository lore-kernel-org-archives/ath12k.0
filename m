Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8575BC36010
	for <ath12k@archiver.kernel.org>; Fri,  4 Apr 2025 19:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2yticOQ2vtWjH+9GFUONp2Pzxc/Gika/S3YkWLgWgh0=; b=4Dh1bX+NQaUiu13j2UKhzG79Yv
	2LQkjDt/GvmOg1OMr5SjzV1wSR61dBEtqSXtQsKQpI8rOivqKaLPdTC6R6XuDVBL4WSqR8FZ1oBgA
	kXeueB6VwMu2u8S1anSfRUF3Ad0IxyysSzBOrXWYcE7aX79878wE11STOnQvDadpoKDXhOQxhHUaC
	EXiW4aDKM3//15KLRrqvGu+u3Abv2oINF6EVN12TkwicP9QT8lvJ2EbAsZijXHntYipeBZ30fQUC4
	jyvxQtScMvnFybpuTAOoofya9kB8X9h80I55pEvktQf8S2ISq/ptt9ByRg6lyto/Gr+jaAqPHmhTY
	yvLkqlVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0n0P-0000000Cfkm-18jL
	for ath12k@archiver.kernel.org;
	Fri, 04 Apr 2025 19:47:09 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0n0H-0000000CfhS-06OZ
	for ath12k@lists.infradead.org;
	Fri, 04 Apr 2025 19:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743796021; x=1775332021;
  h=date:from:to:cc:subject:message-id;
  bh=h7NIgawjPCVzpJj0XzWs1hHKUFms5sVMNK9IuVgcMHw=;
  b=KXXZQZ84WUYJhmq9amMB9/IKXMB9E6VBSBNHDm4X5dbObjbhommnW7Fu
   tEvE7U0ygpk0YfccjAFf2j1NWEI+4+sqUR0CZmtBCT9dHZH3uy5ppOcJO
   2nJtv0+/8zfeXnG1XSg3XMw13w/Qqowy0bO4JLZ+HC+QM8vCOtPaUinEj
   TbuePStRvQDYgdNomNqK/3n3HcbkD3gdOquMVIHknkamHIPLZzArbPnMY
   u/2oqWhA5+5rNF9SreNIU28DP2+WWDkuYbeEDX/SaZ7SIY82k1vvmVtL8
   3zGjus7WPNe0DA2JF8STximtuGLz7X6PnS/g3yxXU2XYIKZcZgsV8SBi+
   Q==;
X-CSE-ConnectionGUID: lFi41lf6TViRQxhMLS81hA==
X-CSE-MsgGUID: IZJlb6I/QTii87IeqNrWYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44396008"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="44396008"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 12:46:59 -0700
X-CSE-ConnectionGUID: 7/6BvbzlQQmsAIIs+Yk3IA==
X-CSE-MsgGUID: yojkOzXxQKuTuhTlq9ttVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="128299752"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Apr 2025 12:46:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0n0A-0001Uh-2q;
	Fri, 04 Apr 2025 19:46:54 +0000
Date: Sat, 05 Apr 2025 03:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 89ac53e96217bd5525ee56eaa1b8ef2b398a9ad6
Message-ID: <202504050336.tHaN0puI-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_124701_118065_F8A94EC0 
X-CRM114-Status: UNSURE (   3.27  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 89ac53e96217bd5525ee56eaa1b8ef2b398a9ad6  wifi: ath12k: Enable REO queue lookup table feature on QCN9274

elapsed time: 1444m

configs tested: 115
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250404    gcc-14.2.0
arc                   randconfig-002-20250404    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-21
arm                   randconfig-001-20250404    clang-21
arm                   randconfig-002-20250404    gcc-7.5.0
arm                   randconfig-003-20250404    clang-21
arm                   randconfig-004-20250404    clang-21
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250404    gcc-5.5.0
arm64                 randconfig-002-20250404    gcc-7.5.0
arm64                 randconfig-003-20250404    gcc-9.5.0
arm64                 randconfig-004-20250404    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250404    gcc-13.3.0
csky                  randconfig-002-20250404    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250404    clang-15
hexagon               randconfig-002-20250404    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250404    gcc-12
i386        buildonly-randconfig-002-20250404    gcc-12
i386        buildonly-randconfig-003-20250404    gcc-12
i386        buildonly-randconfig-004-20250404    gcc-12
i386        buildonly-randconfig-005-20250404    gcc-12
i386        buildonly-randconfig-006-20250404    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250404    gcc-14.2.0
loongarch             randconfig-002-20250404    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250404    gcc-5.5.0
nios2                 randconfig-002-20250404    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250404    gcc-8.5.0
parisc                randconfig-002-20250404    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc                    gamecube_defconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-15
powerpc               randconfig-001-20250404    gcc-5.5.0
powerpc               randconfig-002-20250404    gcc-9.3.0
powerpc               randconfig-003-20250404    clang-21
powerpc                     tqm8541_defconfig    clang-21
powerpc64             randconfig-001-20250404    gcc-10.5.0
powerpc64             randconfig-002-20250404    clang-21
powerpc64             randconfig-003-20250404    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250404    gcc-14.2.0
riscv                 randconfig-002-20250404    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250404    clang-15
s390                  randconfig-002-20250404    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250404    gcc-5.5.0
sh                    randconfig-002-20250404    gcc-5.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250404    gcc-14.2.0
sparc                 randconfig-002-20250404    gcc-8.5.0
sparc64               randconfig-001-20250404    gcc-10.5.0
sparc64               randconfig-002-20250404    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250404    gcc-12
um                    randconfig-002-20250404    clang-21
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250404    clang-20
x86_64      buildonly-randconfig-002-20250404    clang-20
x86_64      buildonly-randconfig-003-20250404    clang-20
x86_64      buildonly-randconfig-004-20250404    gcc-12
x86_64      buildonly-randconfig-005-20250404    gcc-12
x86_64      buildonly-randconfig-006-20250404    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250404    gcc-14.2.0
xtensa                randconfig-002-20250404    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

