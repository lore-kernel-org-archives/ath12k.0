Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B42D75E3D
	for <ath12k@archiver.kernel.org>; Fri, 22 Nov 2024 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cy4t7olYHYcTez2ZN3eilhMdOWmmAaGVby4PQokojLo=; b=Fz+NZ9LA4z1Dyh7O71pw2KjQM0
	PsnpGSvHCarGZ4yowMMoLpjBPLvCNJPkERfowrJaeKP1UvJ3UcRETtRRxPubbeHUqs88VY0kaFAvD
	R8mQjGb4uc2nTnKcftnQO9DHuMddLtafnmKYvqPnZb5FOR6kWI9HFAcGsoFuFIkYFtammZprJhB93
	LzVzS72BVFW5F5DUj8pSf4h3/EfBhhVCBX2xvoxqWjWFn5pNaSDCrphhitf3suQ/VezHQdk6X7nlh
	oww8KmPCaTjLBYOW85k3ORIH2JNvg7SouFLez4incJlZuGmK5F/d7YlqsInsDiaT6p/yjIxeC4nHO
	AnOEVrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tETk6-00000002Xh2-1Mtk
	for ath12k@archiver.kernel.org;
	Fri, 22 Nov 2024 13:30:38 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tETk3-00000002Xgd-2v4q
	for ath12k@lists.infradead.org;
	Fri, 22 Nov 2024 13:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732282236; x=1763818236;
  h=date:from:to:cc:subject:message-id;
  bh=Sx3Y1buXF2p1vm8eodTvWIn8kQD5Ao4f41vbJFWE7/Y=;
  b=hx5T/derQ9HfB1lm+1y/Gl5NTL1sYAink0hYZTYbiv6COHPR1Xc8O7vF
   6pW4fHZvuKOgAU17YrBVYQHc1Y2abkCSa1GzigwvHMxHtDpFeelstQjnm
   WnsGdtuIR0YHiCO9FSMOdzhBdSdeqnKLB/RBYsopNO3PkXTpnJfMcf8vk
   K9/phP3fWAmfYDWTVBG2dKVqrTjIBEbj08D70L35dHOA4B2aYf8pIBxTK
   USH+mM2wx1f3Tjl1pGm+j3fZnr7K1qiweYa5fa2IvMRywipmhWhgDkslA
   J4EPye9WsWINKsP11TmddtXoBSIHF0lcjpq0fDACT9/cXEWUnPqrd4TSi
   Q==;
X-CSE-ConnectionGUID: IIvdm1TyQEu+Fb3T/Oqkxw==
X-CSE-MsgGUID: rTme9+DwSa6jY4K7SZLpRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31824324"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="31824324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 05:30:31 -0800
X-CSE-ConnectionGUID: JolDWnwTQYeYllq7KwB9yg==
X-CSE-MsgGUID: Ojm8ZkZiTIOJcl/AStbB8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="95665859"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Nov 2024 05:30:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tETjv-0003wJ-0F;
	Fri, 22 Nov 2024 13:30:27 +0000
Date: Fri, 22 Nov 2024 21:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 6d5072194d167fed6d3991271df08398a19d7963
Message-ID: <202411222144.tyhEMEVX-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_053035_773102_BCCB94AB 
X-CRM114-Status: UNSURE (   3.92  )
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
branch HEAD: 6d5072194d167fed6d3991271df08398a19d7963  Merge branch 'pending' into main-pending

elapsed time: 1020m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241122    gcc-13.2.0
arc                   randconfig-002-20241122    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241122    clang-17
arm                   randconfig-002-20241122    gcc-14.2.0
arm                   randconfig-003-20241122    clang-20
arm                   randconfig-004-20241122    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                 randconfig-001-20241122    gcc-14.2.0
arm64                 randconfig-002-20241122    gcc-14.2.0
arm64                 randconfig-003-20241122    gcc-14.2.0
arm64                 randconfig-004-20241122    gcc-14.2.0
csky                  randconfig-001-20241122    gcc-14.2.0
csky                  randconfig-002-20241122    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241122    clang-20
hexagon               randconfig-002-20241122    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241122    clang-19
i386        buildonly-randconfig-002-20241122    clang-19
i386        buildonly-randconfig-003-20241122    clang-19
i386        buildonly-randconfig-004-20241122    clang-19
i386        buildonly-randconfig-005-20241122    gcc-12
i386        buildonly-randconfig-006-20241122    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241122    gcc-12
i386                  randconfig-002-20241122    clang-19
i386                  randconfig-003-20241122    gcc-12
i386                  randconfig-004-20241122    clang-19
i386                  randconfig-005-20241122    gcc-12
i386                  randconfig-006-20241122    gcc-12
i386                  randconfig-011-20241122    gcc-12
i386                  randconfig-012-20241122    gcc-12
i386                  randconfig-013-20241122    gcc-12
i386                  randconfig-014-20241122    gcc-12
i386                  randconfig-015-20241122    gcc-12
i386                  randconfig-016-20241122    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20241122    gcc-14.2.0
loongarch             randconfig-002-20241122    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20241122    gcc-14.2.0
nios2                 randconfig-002-20241122    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241122    gcc-14.2.0
parisc                randconfig-002-20241122    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241122    gcc-14.2.0
powerpc               randconfig-002-20241122    clang-20
powerpc               randconfig-003-20241122    clang-20
powerpc64             randconfig-001-20241122    gcc-14.2.0
powerpc64             randconfig-002-20241122    gcc-14.2.0
powerpc64             randconfig-003-20241122    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241122    gcc-14.2.0
riscv                 randconfig-002-20241122    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241122    clang-20
s390                  randconfig-002-20241122    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241122    gcc-14.2.0
sh                    randconfig-002-20241122    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241122    gcc-14.2.0
sparc64               randconfig-002-20241122    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                    randconfig-001-20241122    clang-17
um                    randconfig-002-20241122    gcc-11
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                randconfig-001-20241122    gcc-14.2.0
xtensa                randconfig-002-20241122    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

