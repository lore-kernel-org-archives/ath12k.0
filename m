Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD32BFF885A
	for <ath12k@archiver.kernel.org>; Sun,  3 May 2026 06:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HtFB1vcfsZc/leza1Q/ZkbUPPFNmVJwybvd9RYfczPU=; b=ShNAuUaEEK35Lol0gzhH/kTQ6B
	383vlW9rIQpbjOvgQE0ZmMn7NyS90qzRt1gxZft+IxGtYBLOJGnqjaKfl54mBcZb94DKzWjpwRHv+
	REMxjq/sHQOasNrfM44jZav57gfDKIU0lGZe6SuHACNngMHEulohmBkEEPHiZO567EegiYpW6P5F2
	kGQ36ez139d8JADImB3adQ72JTbysLRFBCYdRrGfq0qYjvCNWvrDJlb7Y5qXwG+sWUYFnU8ozQsgw
	1KbzhCV1czI7uo6txi4cxSHnZY11vvukSjG3GrYqfHsKKNE6cdn3GwLJka734vUi18hFKGCKzGw3X
	hagdghYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJQS5-0000000ATpG-1HeW;
	Sun, 03 May 2026 06:37:17 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJQS2-0000000ATok-2LDW
	for ath12k@lists.infradead.org;
	Sun, 03 May 2026 06:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777790235; x=1809326235;
  h=date:from:to:cc:subject:message-id;
  bh=uG6WKVVr3+ZnKSVTK8K2+T/w2HvUE+OlC0EEow3K3IY=;
  b=FM2iyJh7nAV3M7hQiVUdl/fl2oQwwI3DKOHcIJo1VrfrDYccZ3eXWZIQ
   aiWWNsR0UpRUfh1w1w39XZfIBIplG+R4kPocudcojP0YTv3ld5qRyuHxZ
   o9sfuCTCZTZ7T2xnEcdABZ2ZRVJZ7686y4G1E2CT/V0/gduuQFJf2GtcV
   G1psaF/5J13IxgdIQqBb61RSn5vMjHFm4Ai2nzx5pdnE1PiNl1RNiS8QK
   MahZNACD794vepTqfhU9YPtE528rJcXEBTScFDTYdjffiesNuzuQ4cQfM
   WkiB2ETQp4DOWQq76StM//iVnOQf+Gu/juMTLfAGKX8l4qdwvSMHYLOCq
   A==;
X-CSE-ConnectionGUID: +9d1pisrQZegWDpBwxvKZg==
X-CSE-MsgGUID: BUm6Rjo0RJaXqDU2mFnVsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78679307"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78679307"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 23:37:13 -0700
X-CSE-ConnectionGUID: E37DbDnnTp6+QYAAozCCSA==
X-CSE-MsgGUID: ZkivWOW9Rg+lDzsv2ior9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="234195917"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 May 2026 23:37:12 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJQRx-000000002GL-0AtY;
	Sun, 03 May 2026 06:37:09 +0000
Date: Sun, 03 May 2026 14:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 c4b5c4b3e468914778c98bb4ca8048d546d5a95e
Message-ID: <202605031400.NbNfJD3o-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_233714_643150_F9D2EB43 
X-CRM114-Status: UNSURE (   3.91  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: c4b5c4b3e468914778c98bb4ca8048d546d5a95e  wifi: ath5k: do not access array OOB

elapsed time: 1977m

configs tested: 167
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260503    gcc-10.5.0
arc                   randconfig-002-20260503    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260503    gcc-10.5.0
arm                   randconfig-002-20260503    gcc-10.5.0
arm                   randconfig-003-20260503    gcc-10.5.0
arm                   randconfig-004-20260503    gcc-10.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260503    gcc-15.2.0
arm64                 randconfig-002-20260503    gcc-15.2.0
arm64                 randconfig-003-20260503    gcc-15.2.0
arm64                 randconfig-004-20260503    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260503    gcc-15.2.0
csky                  randconfig-002-20260503    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260503    clang-23
hexagon               randconfig-002-20260503    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260503    clang-20
i386        buildonly-randconfig-002-20260503    clang-20
i386        buildonly-randconfig-003-20260503    clang-20
i386        buildonly-randconfig-004-20260503    clang-20
i386        buildonly-randconfig-005-20260503    clang-20
i386        buildonly-randconfig-006-20260503    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260503    clang-20
i386                  randconfig-002-20260503    clang-20
i386                  randconfig-003-20260503    clang-20
i386                  randconfig-004-20260503    clang-20
i386                  randconfig-005-20260503    clang-20
i386                  randconfig-006-20260503    clang-20
i386                  randconfig-007-20260503    clang-20
i386                  randconfig-011-20260503    clang-20
i386                  randconfig-012-20260503    clang-20
i386                  randconfig-013-20260503    clang-20
i386                  randconfig-014-20260503    clang-20
i386                  randconfig-015-20260503    clang-20
i386                  randconfig-016-20260503    clang-20
i386                  randconfig-017-20260503    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260503    clang-23
loongarch             randconfig-002-20260503    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260503    clang-23
nios2                 randconfig-002-20260503    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260503    gcc-15.2.0
parisc                randconfig-002-20260503    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260503    gcc-15.2.0
powerpc               randconfig-002-20260503    gcc-15.2.0
powerpc64             randconfig-001-20260503    gcc-15.2.0
powerpc64             randconfig-002-20260503    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260503    clang-23
riscv                 randconfig-002-20260503    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260503    clang-23
s390                  randconfig-002-20260503    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                    randconfig-001-20260503    clang-23
sh                    randconfig-002-20260503    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260503    gcc-15.2.0
sparc                 randconfig-002-20260503    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64               randconfig-001-20260503    gcc-15.2.0
sparc64               randconfig-002-20260503    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                    randconfig-001-20260503    gcc-15.2.0
um                    randconfig-002-20260503    gcc-15.2.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260503    clang-20
x86_64      buildonly-randconfig-002-20260503    clang-20
x86_64      buildonly-randconfig-003-20260503    clang-20
x86_64      buildonly-randconfig-004-20260503    clang-20
x86_64      buildonly-randconfig-005-20260503    clang-20
x86_64      buildonly-randconfig-006-20260503    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260503    clang-20
x86_64                randconfig-002-20260503    clang-20
x86_64                randconfig-003-20260503    clang-20
x86_64                randconfig-004-20260503    clang-20
x86_64                randconfig-005-20260503    clang-20
x86_64                randconfig-006-20260503    clang-20
x86_64                randconfig-011-20260503    clang-20
x86_64                randconfig-012-20260503    clang-20
x86_64                randconfig-013-20260503    clang-20
x86_64                randconfig-014-20260503    clang-20
x86_64                randconfig-015-20260503    clang-20
x86_64                randconfig-016-20260503    clang-20
x86_64                randconfig-071-20260503    clang-20
x86_64                randconfig-072-20260503    clang-20
x86_64                randconfig-073-20260503    clang-20
x86_64                randconfig-074-20260503    clang-20
x86_64                randconfig-075-20260503    clang-20
x86_64                randconfig-076-20260503    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260503    gcc-15.2.0
xtensa                randconfig-002-20260503    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

