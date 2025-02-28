Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B008EC282C6
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 19:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tmMTzER9tif2RaRADWaLC6MElyBfLR+JUk+BdNoHHQg=; b=Bn1xBHDtIlgyjtDYd3XJTy0XVO
	jlwUWXSrUYRYO+z1sSOhSpfl8FQoizLNiQ8WPkAH0YKbgD/j5rHBKCMqZ/AERIXJpCyPwl8CGKL+o
	xlM4EFnBrnzKMuDFT8VLsACwWLA1VfhsU4bXYRZ3F0RnJ6aVTqdTH7wt2Af5NV/K+HdkTTeTzrcW1
	CdeE5SGt7Nk4ccpmVh/nXRRbIj2hg+rHbXv37lL4/vyJHgskakZ+NUY+Cp7NyK/h0h1ykT+Qw7xHq
	9qSNS1Sl2XUzhcSIvQqLJSeT5ZMHNaC2FvpReWpZvPjGUNHOlveamjzW7rNUY8EMdQlK+CyKOOpFv
	ffnBK/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5qG-0000000CKes-20kj
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 19:16:12 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5qE-0000000CKeI-0MXE
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 19:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740770170; x=1772306170;
  h=date:from:to:cc:subject:message-id;
  bh=nLBA5f2jptNPPnZVZv4P+UVhS7m7zlybQHhdGIJHkwI=;
  b=MJrreCVGEj4Hxb+VP/hQ86Xkjs3u3qKbsAkYnYfVllhROu+idfRbHly3
   5BdyNnwRGqY4xND6Y9W4+dMX7MXstCyEMvEQSt2A6xoMA0ntVh2sBCoOr
   6spG+WnX9ymXUREMcQIvW21Xjie/e1WBorKYNSxvlvPQmgyKWKS2u/7Te
   yiPIiVT2pGzj4v7EJHV845+MkGPw6yQLlusDQ9JDtuJtiWD6cROfS4tls
   XH0vSNiftTwGMWTiRDF6jW9P6HnY7t3CeYPUMHKkU8Rmgb/0AAHipMEhE
   OoA0yQeKRTgQ0yIl1DJeOezTI2tpIaVJ5YzRmpmAOI66T6zrg0NezHhPG
   A==;
X-CSE-ConnectionGUID: G3Fh0BM2RwiQ8FOMc0ybYw==
X-CSE-MsgGUID: 28lvL1ZlR2us5NY6yNoNJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41595706"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="41595706"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 11:16:07 -0800
X-CSE-ConnectionGUID: cBLNWAm3SY++c2yw6JWLwA==
X-CSE-MsgGUID: fMjskEScQNSBbUXOtQ9PMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118322482"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Feb 2025 11:16:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to5q7-000FOM-1E;
	Fri, 28 Feb 2025 19:16:03 +0000
Date: Sat, 01 Mar 2025 03:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 4d915d21b1229287286f9d400839b65ecaf0e006
Message-ID: <202503010326.1DRpeUhK-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_111610_132666_8EFAB12C 
X-CRM114-Status: UNSURE (   3.49  )
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
branch HEAD: 4d915d21b1229287286f9d400839b65ecaf0e006  Add localversion-wireless-testing-ath

elapsed time: 1471m

configs tested: 62
configs skipped: 2

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

