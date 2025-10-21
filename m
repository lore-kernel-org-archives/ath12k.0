Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D283CCD1A5
	for <ath12k@archiver.kernel.org>; Tue, 21 Oct 2025 20:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eP3rmk6Hf6rBk+h+xvYzULau/vQbxOZwaBDWhhqPUDo=; b=FT5iATeMeYtPntI9Edfwkhw6bt
	SvER9Hcuuw0Vu79Oo79BP0vJuIbqoCIPPhwq7IRNk64Gj0qCosE/HcllcqN8vgY6c+RrqNFW8eqt7
	g8R55l9TbJD+AH0jxdFbKMCyvHZjxwFDeTl5SNHYWHPtoBG/c5aelZRTf477ZipF7GFB8xl0DDgBH
	CByV15UTJd9nHKGxdjYQW9xpYhe6z8okekJ+EVeoxuvR/9qeYYkUf4uUPp8zqnyY1pVOf59HI1RfG
	ZP9rg3L5sWkGJ2CDOQetQGkwdUVPJDs3b363Pnxs5fELjq2f6fY3nSlInFEPBn+zZm229aq9Uu2iW
	4DAtlC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJEq-00000000cZM-3IpJ;
	Tue, 21 Oct 2025 20:45:48 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJEn-00000000cYx-2RQV
	for ath12k@lists.infradead.org;
	Tue, 21 Oct 2025 20:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761079546; x=1792615546;
  h=date:from:to:cc:subject:message-id;
  bh=YHcxbQuxN7IXrcHnZg9/HkzbBbMIpSsnoigdHMNDdwQ=;
  b=Vj5kLCLIftMnlBvRWEZrlp3ro98lOl1LJwpQ7SBexPjZurKGjrP/Uz31
   O1zTT8ZfzZK9/BFkJFqhhZ+d9lbah9SR4aQ2d/8p56GMHomrffAD+M1Oc
   4EjnXHlccxxywYup6Bl4k6PBJ0PuCcYitxQgGQxBoAgWoX5vM0uN61z1s
   ngbOsrvfiBNFsHVBYvay2Shs3DtPG9fim+zAnaS36QwZGNwmJ8vEwiD34
   UuGDchNvncTSBaZIO9RdA34+mW1a8tr4aKX/bN7+Q5DQMZ+JafDzlCb7I
   F2bmJKhlsZU1O9DZNOtxSoj9jzE13NcTiMYe5MSwlNARDAmUKGx1swpMR
   w==;
X-CSE-ConnectionGUID: ZNH+rb0+TtSd8u3d1Pg8BA==
X-CSE-MsgGUID: 4txXrpwNTReOoYQTeT9GyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63121151"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63121151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 13:45:45 -0700
X-CSE-ConnectionGUID: c8jDiZwhQz6DCptycCHgZw==
X-CSE-MsgGUID: 5CqhKcukRiW1iHRZeWYElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187954337"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Oct 2025 13:45:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBJEj-000BjV-0J;
	Tue, 21 Oct 2025 20:45:41 +0000
Date: Wed, 22 Oct 2025 04:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 51e8d86f0866283836cb07bea63ea9aff4ba43e6
Message-ID: <202510220428.6iFD1cRl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_134545_686860_C997C3C3 
X-CRM114-Status: UNSURE (   4.25  )
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
branch HEAD: 51e8d86f0866283836cb07bea63ea9aff4ba43e6  Merge branch 'pending' into main-pending

elapsed time: 1453m

configs tested: 132
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsimosci_defconfig    gcc-15.1.0
arc                   randconfig-001-20251021    gcc-8.5.0
arc                   randconfig-002-20251021    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20251021    clang-22
arm                   randconfig-002-20251021    clang-22
arm                   randconfig-003-20251021    clang-22
arm                   randconfig-004-20251021    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251021    gcc-15.1.0
arm64                 randconfig-002-20251021    clang-22
arm64                 randconfig-003-20251021    gcc-12.5.0
arm64                 randconfig-004-20251021    clang-18
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251021    gcc-15.1.0
csky                  randconfig-002-20251021    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251021    clang-22
hexagon               randconfig-002-20251021    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251021    clang-20
i386        buildonly-randconfig-002-20251021    clang-20
i386        buildonly-randconfig-003-20251021    clang-20
i386        buildonly-randconfig-004-20251021    gcc-14
i386        buildonly-randconfig-005-20251021    gcc-14
i386        buildonly-randconfig-006-20251021    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251021    clang-22
loongarch             randconfig-002-20251021    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251021    gcc-10.5.0
nios2                 randconfig-002-20251021    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251021    gcc-8.5.0
parisc                randconfig-002-20251021    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      chrp32_defconfig    clang-19
powerpc                 mpc8315_rdb_defconfig    clang-22
powerpc               randconfig-001-20251021    clang-22
powerpc               randconfig-002-20251021    clang-19
powerpc               randconfig-003-20251021    clang-22
powerpc64             randconfig-001-20251021    clang-22
powerpc64             randconfig-002-20251021    gcc-12.5.0
powerpc64             randconfig-003-20251021    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251021    gcc-8.5.0
riscv                 randconfig-002-20251021    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251021    clang-22
s390                  randconfig-002-20251021    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251021    gcc-9.5.0
sh                    randconfig-002-20251021    gcc-10.5.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251021    gcc-8.5.0
sparc                 randconfig-002-20251021    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251021    gcc-8.5.0
sparc64               randconfig-002-20251021    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251021    gcc-14
um                    randconfig-002-20251021    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251021    gcc-13
x86_64      buildonly-randconfig-002-20251021    clang-20
x86_64      buildonly-randconfig-003-20251021    clang-20
x86_64      buildonly-randconfig-004-20251021    clang-20
x86_64      buildonly-randconfig-005-20251021    gcc-14
x86_64      buildonly-randconfig-006-20251021    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251021    gcc-8.5.0
xtensa                randconfig-002-20251021    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

