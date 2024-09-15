Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E06C3ABA3
	for <ath12k@archiver.kernel.org>; Sun, 15 Sep 2024 18:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bSLZB7LD8CgOb39UYyGtzrMTuM2FeYB4EhHkBrWt67s=; b=tI8I5ATYBFPp+Z5FPZPgEsHbr4
	mGCmomuHfPP7sUHOsrMasKfL2aExMi1RqxMjLh+4sq3WtNQcrOOlJR6kwxS7YshbYFLZzY/VVzkIn
	ITFF12h3pnRQABYTwVx5QA8tSwVhaj5ng/gatpS55mRMxT2MT3a0soEG0tQNJYgn3SJqrZ7oliFov
	jsaHzGYR/SJ2Wif+i3whcJMpgO6yIjclRNKWuzkQSxHdUGXlUtQ+CdCP9JmKoBCaC/BEz52ZDPX+D
	AxTxqnV5uxxNx0Dtd/t18buBBKEkeiE/KOedqsDpl2RysnGcOF04hs8Q0O/TIwTyz1nqUpas5gxC/
	/PIj2agg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spu2W-00000002TOK-2wbB
	for ath12k@archiver.kernel.org;
	Sun, 15 Sep 2024 18:32:04 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spu2T-00000002TNv-2m5d
	for ath12k@lists.infradead.org;
	Sun, 15 Sep 2024 18:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726425121; x=1757961121;
  h=date:from:to:cc:subject:message-id;
  bh=4aOJqGIN+zKHgzxYvryjYhCL2pPx3tuUyeAz7t7tXoM=;
  b=f/N0K3hp5rvhPILs1njGosW1H+L/asnfV5HUA93b1xvnFaO0KzNIFdRT
   a1xAgvtsJ8BmZsja1t6QiPpM2Yhk+wyytah+YCbCfYRBCXcYIkJZm1iN0
   uk9IFw5BQOGmGOzA3Fs9MwCWFmTelKcoLUbScntYsA79Mk+taJ9tK39NZ
   NbSm6sgeIkoSp8FJd/YLcER8By+HU3LQv9KsUufxaPWSRufYu4Bq+Iv7q
   Bwe3dGuCEwZTkv3Ies34dPBqbVpWx72q/mGEX9q8LWF2HAvP9kanljIPX
   ryWvZhitlyi5Ur18SAPDPd+9tdJBJFSy/fbNOXtcgttvw1qHIm8e0HNPL
   w==;
X-CSE-ConnectionGUID: pWAaCvW7R3GZovNxBrkQBA==
X-CSE-MsgGUID: hwK0jCCWTTS6XLKhPho68g==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25390160"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25390160"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 11:31:58 -0700
X-CSE-ConnectionGUID: bS60NP0oST+13w1RxZhoXg==
X-CSE-MsgGUID: ILhekXYOTSqCK/ZoXs8PAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="69176106"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2024 11:31:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spu2M-0008v8-1Z;
	Sun, 15 Sep 2024 18:31:54 +0000
Date: Mon, 16 Sep 2024 02:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 f6b126deec76f157f05b9c1a4cd7fdcdd7f6026d
Message-ID: <202409160222.bEvUZccJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_113201_806904_B2B6B642 
X-CRM114-Status: UNSURE (   3.87  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: f6b126deec76f157f05b9c1a4cd7fdcdd7f6026d  Merge branch 'pending' into main-pending

elapsed time: 1805m

configs tested: 100
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20240915    gcc-13.2.0
arc                   randconfig-002-20240915    gcc-13.2.0
arm                               allnoconfig    clang-20
arm                   randconfig-001-20240915    gcc-14.1.0
arm                   randconfig-002-20240915    clang-17
arm                   randconfig-003-20240915    clang-20
arm                   randconfig-004-20240915    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240915    clang-20
arm64                 randconfig-002-20240915    gcc-14.1.0
arm64                 randconfig-003-20240915    clang-20
arm64                 randconfig-004-20240915    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240915    gcc-14.1.0
csky                  randconfig-002-20240915    gcc-14.1.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20240915    clang-20
hexagon               randconfig-002-20240915    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240915    gcc-12
i386        buildonly-randconfig-002-20240915    clang-18
i386        buildonly-randconfig-003-20240915    clang-18
i386        buildonly-randconfig-004-20240915    gcc-12
i386        buildonly-randconfig-005-20240915    clang-18
i386        buildonly-randconfig-006-20240915    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240915    clang-18
i386                  randconfig-002-20240915    clang-18
i386                  randconfig-003-20240915    clang-18
i386                  randconfig-004-20240915    clang-18
i386                  randconfig-005-20240915    clang-18
i386                  randconfig-006-20240915    clang-18
i386                  randconfig-011-20240915    clang-18
i386                  randconfig-012-20240915    gcc-12
i386                  randconfig-013-20240915    gcc-12
i386                  randconfig-014-20240915    clang-18
i386                  randconfig-015-20240915    gcc-12
i386                  randconfig-016-20240915    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240915    gcc-14.1.0
loongarch             randconfig-002-20240915    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240915    gcc-14.1.0
nios2                 randconfig-002-20240915    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20240915    gcc-14.1.0
parisc                randconfig-002-20240915    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc               randconfig-001-20240915    gcc-14.1.0
powerpc               randconfig-002-20240915    gcc-14.1.0
powerpc               randconfig-003-20240915    gcc-14.1.0
powerpc64             randconfig-001-20240915    clang-20
powerpc64             randconfig-002-20240915    clang-20
powerpc64             randconfig-003-20240915    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    clang-20
riscv                 randconfig-001-20240915    clang-15
riscv                 randconfig-002-20240915    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                  randconfig-001-20240915    clang-20
s390                  randconfig-002-20240915    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                    randconfig-001-20240915    gcc-14.1.0
sh                    randconfig-002-20240915    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
sparc64               randconfig-001-20240915    gcc-14.1.0
sparc64               randconfig-002-20240915    gcc-14.1.0
um                                allnoconfig    clang-17
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240915    clang-20
um                    randconfig-002-20240915    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240915    gcc-14.1.0
xtensa                randconfig-002-20240915    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

