Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7B5C35FFC
	for <ath12k@archiver.kernel.org>; Sat, 22 Mar 2025 17:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7l13bYNR3P6gQpfBtAORua3xqKsWZEC8DboC7KZ+U38=; b=0MMniJdwa5SKk3Hs3l80/Lvudt
	9qkMX9SzAIVWZTM6YhxiWSe8y87FqE8gUpvhwk1nuo7Vplq9ZjjgqkAo1ZkI/L6K1eS0MGEcKSpjc
	IS8WWVi5OhXk8z+DA/0YAARYtXnT8B6lTEguapzTy1Cfs0vpfZy9Ii8Cd565IzZ8klotTAkcZ5CVW
	5KgyqT+Hcr7JXsy4pockC5EjAHECHFGDkJanIgV+OcXFr3dGKyzzwZjwNhiz/u2Z1eK+Noj/dOAb1
	ltV5EFVsYVP3S92c2K3Pzt4EYz/j9zAapWPriTmHgsyAwwiwE/K3aazWK8DSgcNfCrtcF0s3rpRej
	HBgryvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw37F-000000009bR-2uks
	for ath12k@archiver.kernel.org;
	Sat, 22 Mar 2025 17:58:37 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw37C-000000009b3-3T5v
	for ath12k@lists.infradead.org;
	Sat, 22 Mar 2025 17:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742666315; x=1774202315;
  h=date:from:to:cc:subject:message-id;
  bh=Eq6nRKLMOoqWpWjXCPth/f3jvdavBHimKZUpmWRIe6c=;
  b=BsfZtluzlNWzVyNQaYAO752MUr2k3QFI0esqrUSDGzZ65DmbqP4hZWZq
   FjzhZBZ5yc1JGY84UpwyuBL/ZOp0OR4skgsDtq3m4r2npqd9n2ZGdNFLz
   Z+AxBkl9xXiUF0gCH86zSJ7DwOGPyjbZHw3kYmzE+QaadUrUdAqDUQB2x
   nQdnI02pXslqeeE1QiWKmEYuF9V8cp3kJIi4KnzYF40c4UBM9Ei2ZUw+j
   zbgC2g9Dv6mSWS3PKPlJKcAheUVcQauuz6Ivrg3FYflxaTgmVSolOWfpi
   Tmfdqqx7CBSagF4h1BNTxEYRtG6vilH5H8Vwuqy8M+LJ4Rhrs/OFy/L1n
   A==;
X-CSE-ConnectionGUID: RVQ2idkzTKuEAMpEa+hTtw==
X-CSE-MsgGUID: pB5K5lH1QSKHhRot4668qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="31510064"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="31510064"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 10:58:29 -0700
X-CSE-ConnectionGUID: wlpISigXQCmN/yTbjPFF7Q==
X-CSE-MsgGUID: oLydlPDSQLunx87fqqkdVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="154685296"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Mar 2025 10:58:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw370-0002JV-0t;
	Sat, 22 Mar 2025 17:58:23 +0000
Date: Sun, 23 Mar 2025 01:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 56133b9a40bcaf765f8183cd33423e5091be9bef
Message-ID: <202503230109.IbxANbnz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_105834_917363_1E4E8191 
X-CRM114-Status: UNSURE (   3.61  )
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
branch HEAD: 56133b9a40bcaf765f8183cd33423e5091be9bef  wifi: ath12k: don't put ieee80211_chanctx_conf struct in ath12k_link_vif

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
|-- powerpc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
|-- riscv-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
|-- riscv-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
|-- um-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void
`-- x86_64-allyesconfig
    `-- drivers-net-wireless-ath-ath12k-ahb.c:warning:cast-to-smaller-integer-type-enum-ath12k_hw_rev-from-const-void

elapsed time: 1443m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-14.2.0
arc                              allnoconfig    gcc-14.2.0
arc                             allyesconfig    gcc-14.2.0
arc                  randconfig-001-20250322    gcc-10.5.0
arc                  randconfig-002-20250322    gcc-8.5.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-21
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250322    gcc-7.5.0
arm                  randconfig-002-20250322    gcc-7.5.0
arm                  randconfig-003-20250322    clang-21
arm                  randconfig-004-20250322    clang-19
arm64                           allmodconfig    clang-19
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250322    clang-21
arm64                randconfig-002-20250322    clang-21
arm64                randconfig-003-20250322    gcc-8.5.0
arm64                randconfig-004-20250322    clang-21
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250322    gcc-14.2.0
csky                 randconfig-002-20250322    gcc-14.2.0
hexagon                         allmodconfig    clang-17
hexagon                          allnoconfig    clang-21
hexagon                         allyesconfig    clang-21
hexagon              randconfig-001-20250322    clang-21
hexagon              randconfig-002-20250322    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250322    clang-20
i386       buildonly-randconfig-002-20250322    gcc-12
i386       buildonly-randconfig-003-20250322    gcc-12
i386       buildonly-randconfig-004-20250322    clang-20
i386       buildonly-randconfig-005-20250322    clang-20
i386       buildonly-randconfig-006-20250322    clang-20
i386                               defconfig    clang-20
loongarch                       allmodconfig    gcc-14.2.0
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250322    gcc-14.2.0
loongarch            randconfig-002-20250322    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
mips                          ip30_defconfig    gcc-14.2.0
nios2                randconfig-001-20250322    gcc-6.5.0
nios2                randconfig-002-20250322    gcc-10.5.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250322    gcc-5.5.0
parisc               randconfig-002-20250322    gcc-13.3.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-21
powerpc              randconfig-001-20250322    clang-21
powerpc              randconfig-002-20250322    gcc-8.5.0
powerpc              randconfig-003-20250322    clang-21
powerpc64            randconfig-001-20250322    clang-21
powerpc64            randconfig-002-20250322    gcc-8.5.0
powerpc64            randconfig-003-20250322    gcc-8.5.0
riscv                           allmodconfig    clang-21
riscv                            allnoconfig    gcc-14.2.0
riscv                           allyesconfig    clang-16
riscv                randconfig-001-20250322    gcc-8.5.0
riscv                randconfig-002-20250322    clang-21
s390                            allmodconfig    clang-18
s390                             allnoconfig    clang-15
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250322    gcc-9.3.0
s390                 randconfig-002-20250322    gcc-6.5.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250322    gcc-10.5.0
sh                   randconfig-002-20250322    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250322    gcc-9.3.0
sparc                randconfig-002-20250322    gcc-9.3.0
sparc64              randconfig-001-20250322    gcc-5.5.0
sparc64              randconfig-002-20250322    gcc-5.5.0
um                              allmodconfig    clang-19
um                               allnoconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250322    clang-21
um                   randconfig-002-20250322    gcc-12
x86_64                           allnoconfig    clang-20
x86_64                          allyesconfig    clang-20
x86_64     buildonly-randconfig-001-20250322    clang-20
x86_64     buildonly-randconfig-002-20250322    clang-20
x86_64     buildonly-randconfig-003-20250322    clang-20
x86_64     buildonly-randconfig-004-20250322    gcc-12
x86_64     buildonly-randconfig-005-20250322    clang-20
x86_64     buildonly-randconfig-006-20250322    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250322    gcc-14.2.0
xtensa               randconfig-002-20250322    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

