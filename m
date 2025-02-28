Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEACAC282C5
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 22:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iecdldvz5BIep+XWZQSa0ne8dCwhrhgHkzAz8sx1MKk=; b=Frv3Di94KjlofcQ5X1pXwcDFDe
	PbN77YFkPqCQevCuNrKE3LaNCgxLX3trE2WfqJlhbAtHl2WTCXwCo6BmBPJgpvvToIvWF4ykgNKpa
	bMqVgU6iliAm170QOYsRRWC+aBw8uCmqsL0QJdzAv+kd/oOAW4cd1dDrjFlx/aSvYzUaBo5qikU0n
	aFbTdRvavxV6fHqXBcNs93E/Xb8tT8oiKmVMr0k2P+QYtxlrf7I+Ma4N73r0Z4fW3BEQyvmCrfi2G
	PWTKPoUJemXupQJe2Sh35kNZ6cMZ8JlnTddtYwcuYVH2UmaDStqlOFUTR1J53Op9qUPxBPXcYLFZF
	5lM6UYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to90g-0000000Csyv-35Cy
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 22:39:10 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to90d-0000000CsxJ-1Tiv
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 22:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740782348; x=1772318348;
  h=date:from:to:cc:subject:message-id;
  bh=BHq06EhYo4/0pPTG200yP4I+Mu9O0e/ITj997ymW7jE=;
  b=h4o4l7j+XXluMUdFZmiG/JGwPUtm0qus/nowp1yi/1ilP5n/okq1Adtk
   ZVJ4x/u93P9mT4/Wc0cIhy05ItZyxbCei1Vp6f8kg/HKbXKhvMNUKlqj5
   etih7rcxoRVdiVKMV7pkEMVXIZ0T4SAsHNI9j2KM9+7O3WK2qjZUoqLLx
   OHhNHwYeGiBs50MK+QZTZLW2yDaRKqkOAi7QugRD0JghuOyLgMrYB4aGJ
   e9Op5N/czCHNEECbtSRZVHUg/z55szkKX2GBYlBcrqPzJae8QY+rhHm58
   mCVcgiXycZa02j9vMhQSGBH4lFlUQwwnTl9wyyhdxr05vvI9lmdRRtNCg
   A==;
X-CSE-ConnectionGUID: nT0hnQgcQo+MDzdy949M/Q==
X-CSE-MsgGUID: JA1fbSZnTRys6rjo8yNtjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41919822"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41919822"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 14:39:00 -0800
X-CSE-ConnectionGUID: NJ7zWdxeQRiZ6bvlLXsxcw==
X-CSE-MsgGUID: gHwTP9TMQVanq4u2ev+sgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154635576"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Feb 2025 14:38:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to90S-000Fao-17;
	Fri, 28 Feb 2025 22:38:56 +0000
Date: Sat, 01 Mar 2025 06:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 6d52628f1afa15584b61c5701089b4faf089630e
Message-ID: <202503010607.nRHAmLxD-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_143907_491236_D67B6699 
X-CRM114-Status: UNSURE (   3.60  )
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
branch HEAD: 6d52628f1afa15584b61c5701089b4faf089630e  Merge branch 'pending' into main-pending

elapsed time: 1454m

configs tested: 62
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                  randconfig-001-20250228    gcc-13.2.0
arc                  randconfig-002-20250228    gcc-13.2.0
arm                  randconfig-001-20250228    clang-21
arm                  randconfig-002-20250228    gcc-14.2.0
arm                  randconfig-003-20250228    gcc-14.2.0
arm                  randconfig-004-20250228    gcc-14.2.0
arm64                randconfig-001-20250228    gcc-14.2.0
arm64                randconfig-002-20250228    clang-21
arm64                randconfig-003-20250228    clang-16
arm64                randconfig-004-20250228    gcc-14.2.0
csky                 randconfig-001-20250228    gcc-14.2.0
csky                 randconfig-002-20250228    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250228    clang-19
hexagon              randconfig-002-20250228    clang-21
i386       buildonly-randconfig-001-20250228    clang-19
i386       buildonly-randconfig-002-20250228    clang-19
i386       buildonly-randconfig-003-20250228    gcc-12
i386       buildonly-randconfig-004-20250228    clang-19
i386       buildonly-randconfig-005-20250228    clang-19
i386       buildonly-randconfig-006-20250228    clang-19
loongarch            randconfig-001-20250228    gcc-14.2.0
loongarch            randconfig-002-20250228    gcc-14.2.0
nios2                randconfig-001-20250228    gcc-14.2.0
nios2                randconfig-002-20250228    gcc-14.2.0
parisc               randconfig-001-20250228    gcc-14.2.0
parisc               randconfig-002-20250228    gcc-14.2.0
powerpc              randconfig-001-20250228    gcc-14.2.0
powerpc              randconfig-002-20250228    clang-16
powerpc              randconfig-003-20250228    clang-18
powerpc64            randconfig-001-20250228    clang-16
powerpc64            randconfig-002-20250228    clang-18
powerpc64            randconfig-003-20250228    gcc-14.2.0
riscv                randconfig-001-20250228    gcc-14.2.0
riscv                randconfig-002-20250228    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250228    gcc-14.2.0
s390                 randconfig-002-20250228    clang-17
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250228    gcc-14.2.0
sh                   randconfig-002-20250228    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250228    gcc-14.2.0
sparc                randconfig-002-20250228    gcc-14.2.0
sparc64              randconfig-001-20250228    gcc-14.2.0
sparc64              randconfig-002-20250228    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250228    clang-21
um                   randconfig-002-20250228    clang-21
x86_64     buildonly-randconfig-001-20250228    clang-19
x86_64     buildonly-randconfig-002-20250228    clang-19
x86_64     buildonly-randconfig-003-20250228    gcc-12
x86_64     buildonly-randconfig-004-20250228    clang-19
x86_64     buildonly-randconfig-005-20250228    gcc-12
x86_64     buildonly-randconfig-006-20250228    gcc-12
xtensa               randconfig-001-20250228    gcc-14.2.0
xtensa               randconfig-002-20250228    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

