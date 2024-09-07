Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF05E6FE53
	for <ath12k@archiver.kernel.org>; Sat,  7 Sep 2024 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CXp2rAdLk4dVgatDndEMdbpcXFaCRhX46s+tQJNi3B4=; b=1avSm3Ut7yE4jMhNMHZQVHUgO5
	8uo4BxwT20TGB6hxvSXPdV2q5u+P/EzaWgst749/X3m7b6yR4Giaw3KQv5qkbVgmURfxctvqowaX/
	Eu7C/OBd/5eDrFcu3x9EEtDZmKRpxAuV9zcyCFHBSMypzlQujE4e3+eE5zK2SSlLMapDOlYlwARdU
	+sMLZ02Pyt2C8lcxTj3tbWnGS1VNWRoqUIcUtpofvC1ofwrIqvQNowM4TGX0fPaomZaRnPwYDRXqB
	beCx/ZJVpE43uEnu4bwu0y3r/duWO9C41EWyZRNeF18v+9rAskAShrbV5OjXwQVVBjvIOIx6d7VLQ
	mmOwTUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smqc6-0000000EdIU-3Nrk
	for ath12k@archiver.kernel.org;
	Sat, 07 Sep 2024 08:16:10 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smqc1-0000000EdHv-0i3X
	for ath12k@lists.infradead.org;
	Sat, 07 Sep 2024 08:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725696965; x=1757232965;
  h=date:from:to:cc:subject:message-id;
  bh=k5BJgXlSoaaIwcj8FrSAzUJLw5KdpAwBDbr1Gh5sOgo=;
  b=PTFBFWzRJTuKITFHgUKiC893xM/gUBi1CbFPu59NBOFpjDtMx+lfVeA7
   EkPLcfpNLzFGuOAWA1pstd4rxkV6fLBacYqfE4wrQsPq71VR3lnE09HaX
   mM9h6ugDmkFvGwtKYFO91G4qKPs/fuvwZZ/QMLO1Kus9zX2ED6Ob918Qk
   DmnIJzhscIn99KH787gilNB6jISB+xe6eJxtbtdw2yZZjRBJOXqVxgfN5
   XlYGTkTpEVsz3XztQOun2ckYbJn41LmqLDArhwt39jK5w/QUWq72sLZOJ
   kO7U8z4fbMgApAz6hdSqqBMiXTKQbv/ZyCdVTizrGuU38nbT6pWCbjw/S
   g==;
X-CSE-ConnectionGUID: RseiSjkvQzuKitfMsf/8kw==
X-CSE-MsgGUID: 84aLQ+60QDeXyLOFp1v6NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35807102"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35807102"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 01:16:03 -0700
X-CSE-ConnectionGUID: n5FYnTgcQf2rrNwiyqT7Og==
X-CSE-MsgGUID: A9VZV5zXSluM43PYlOtwCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="65861427"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Sep 2024 01:16:01 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smqbv-000CKN-1h;
	Sat, 07 Sep 2024 08:15:59 +0000
Date: Sat, 07 Sep 2024 16:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 903aaf66edc97dd5b9e3118d19677291051a9c40
Message-ID: <202409071617.ogLNZ2Y1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_011605_330315_7F579573 
X-CRM114-Status: UNSURE (   3.70  )
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
branch HEAD: 903aaf66edc97dd5b9e3118d19677291051a9c40  Add localversion-wireless-testing-ath

elapsed time: 2311m

configs tested: 133
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240907   gcc-13.2.0
arc                   randconfig-002-20240907   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                        neponset_defconfig   gcc-14.1.0
arm                          pxa168_defconfig   clang-20
arm                   randconfig-001-20240907   gcc-14.1.0
arm                   randconfig-002-20240907   gcc-14.1.0
arm                   randconfig-003-20240907   gcc-14.1.0
arm                   randconfig-004-20240907   clang-16
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240907   gcc-14.1.0
arm64                 randconfig-002-20240907   gcc-14.1.0
arm64                 randconfig-003-20240907   gcc-14.1.0
arm64                 randconfig-004-20240907   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240907   gcc-14.1.0
csky                  randconfig-002-20240907   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240907   clang-20
hexagon               randconfig-002-20240907   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240907   clang-18
i386         buildonly-randconfig-002-20240907   gcc-12
i386         buildonly-randconfig-003-20240907   gcc-12
i386         buildonly-randconfig-004-20240907   clang-18
i386         buildonly-randconfig-005-20240907   clang-18
i386         buildonly-randconfig-006-20240907   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240907   clang-18
i386                  randconfig-002-20240907   clang-18
i386                  randconfig-003-20240907   clang-18
i386                  randconfig-004-20240907   gcc-12
i386                  randconfig-005-20240907   gcc-12
i386                  randconfig-006-20240907   gcc-12
i386                  randconfig-011-20240907   clang-18
i386                  randconfig-012-20240907   gcc-12
i386                  randconfig-013-20240907   clang-18
i386                  randconfig-014-20240907   clang-18
i386                  randconfig-015-20240907   clang-18
i386                  randconfig-016-20240907   clang-18
loongarch                        alldefconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240907   gcc-14.1.0
loongarch             randconfig-002-20240907   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240907   gcc-14.1.0
nios2                 randconfig-002-20240907   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240907   gcc-14.1.0
parisc                randconfig-002-20240907   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc               randconfig-001-20240907   clang-20
powerpc               randconfig-002-20240907   gcc-14.1.0
powerpc               randconfig-003-20240907   clang-14
powerpc64             randconfig-001-20240907   clang-16
powerpc64             randconfig-002-20240907   clang-20
powerpc64             randconfig-003-20240907   gcc-13.2.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240907   gcc-14.1.0
riscv                 randconfig-002-20240907   clang-14
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240907   clang-20
s390                  randconfig-002-20240907   clang-15
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240907   gcc-14.1.0
sh                    randconfig-002-20240907   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240907   gcc-14.1.0
sparc64               randconfig-002-20240907   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240907   gcc-12
um                    randconfig-002-20240907   clang-14
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240907   gcc-12
x86_64       buildonly-randconfig-002-20240907   gcc-12
x86_64       buildonly-randconfig-003-20240907   gcc-11
x86_64       buildonly-randconfig-004-20240907   clang-18
x86_64       buildonly-randconfig-005-20240907   gcc-12
x86_64       buildonly-randconfig-006-20240907   gcc-12
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240907   clang-18
x86_64                randconfig-002-20240907   gcc-12
x86_64                randconfig-003-20240907   gcc-12
x86_64                randconfig-004-20240907   clang-18
x86_64                randconfig-005-20240907   gcc-12
x86_64                randconfig-006-20240907   gcc-11
x86_64                randconfig-011-20240907   gcc-12
x86_64                randconfig-012-20240907   gcc-12
x86_64                randconfig-013-20240907   gcc-12
x86_64                randconfig-014-20240907   gcc-12
x86_64                randconfig-015-20240907   clang-18
x86_64                randconfig-016-20240907   gcc-12
x86_64                randconfig-071-20240907   clang-18
x86_64                randconfig-072-20240907   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240907   gcc-14.1.0
xtensa                randconfig-002-20240907   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

