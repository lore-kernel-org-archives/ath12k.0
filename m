Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5980CAC5B5
	for <ath12k@archiver.kernel.org>; Mon, 29 Sep 2025 04:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BAjQFn0CegtSwokA7GwqXi/SX3stO+NeWeqAGpumdbk=; b=t2t2HWWQOwG3LWQFKfpq5hEaP+
	0CLgpQeAY6Oe5c2SNApqQZ2mdcWx+ib/VXyZNtm574CHv2KPBBkYGSujyXm3IddJmpySCDgfY5Mi2
	72cR9+7VWIy7tcPCn4D0fSLfgIgZYnCaF7zneEzMXSDJtgqBuKdjWsexy5te74TEPTsFgYLjBZnQA
	9DjDZqyGXkqcxV7Gu8fNHoTrkDaB/qGXy23ruZlYOj14f5owziUm2wmAt8F4660vMrleOIy3yU17f
	xKFXwb02C4VfyTDEpcvTb8AhelD1Wrwp5T9icJRE7GPWImLSxCSwmbqBykdMLbINzh8IthtaBuYTA
	VlDW/3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v35WH-00000001JQd-2V0w;
	Mon, 29 Sep 2025 04:29:49 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v35WF-00000001JPM-2sHP
	for ath12k@lists.infradead.org;
	Mon, 29 Sep 2025 04:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759120188; x=1790656188;
  h=date:from:to:cc:subject:message-id;
  bh=SnLPY3g+afpr256KiuHGlGrtGhJTMMXYszMqRfRj0jk=;
  b=LbvMoWJbJmE9XhA5iTjbAnymQ6qnvUOZWLeDIzYOXg92a9Vkn5agRDi5
   UCnHVSzWgMwPtAcf1n5Ow5GnBi7/2DXoJ8Abt2h9x3JrRDft2NLP1KAZd
   mdaBekmZkSkhrnKEDKw91G7mAI+PLI9KBBMpV2DEmm6kAs3or8M0bW7k2
   69mQ9InieiGFAvf9lBrSljbkSbP0JD4jIc6+054o3Zkrdf998y9xh/Ndy
   Qo2OjqEEqCZEN0xjkqtU+dT9ViEz8HHsJMDXvk0KQG2iM9bZfTcYZdFqn
   6yhQTRvYr5R2yPjrZw3anrBfr9CqBVXR6CTLelR+tQ3gG+pi40/8IXMYS
   w==;
X-CSE-ConnectionGUID: iRcnjQAVSNmYKG2EoJco7g==
X-CSE-MsgGUID: AUW9AHH2SxGTpqzlk/aJGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61525621"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="61525621"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 21:29:46 -0700
X-CSE-ConnectionGUID: 9e2iBcYeT4mGsKKU17ZVaw==
X-CSE-MsgGUID: ee8zqyztQvqu5zIqegTevA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO a2c9da549b7f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Sep 2025 21:29:44 -0700
Received: from kbuild by a2c9da549b7f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v35WA-00002h-0F;
	Mon, 29 Sep 2025 04:29:42 +0000
Date: Mon, 29 Sep 2025 12:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 1be247ffcb69db7f4ab3e85a74fcb93b5ab235a4
Message-ID: <202509291217.dtm1pmDl-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_212947_809207_21C35B89 
X-CRM114-Status: UNSURE (   3.81  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-ath12k-ng
branch HEAD: 1be247ffcb69db7f4ab3e85a74fcb93b5ab235a4  wifi: ath12k: Refactor ath12k_vif structure

elapsed time: 725m

configs tested: 123
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250929    gcc-8.5.0
arc                   randconfig-002-20250929    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250929    gcc-8.5.0
arm                   randconfig-002-20250929    gcc-14.3.0
arm                   randconfig-003-20250929    clang-22
arm                   randconfig-004-20250929    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250929    gcc-8.5.0
arm64                 randconfig-002-20250929    gcc-13.4.0
arm64                 randconfig-003-20250929    clang-22
arm64                 randconfig-004-20250929    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250929    gcc-9.5.0
csky                  randconfig-002-20250929    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250929    clang-22
hexagon               randconfig-002-20250929    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250929    gcc-14
i386        buildonly-randconfig-002-20250929    clang-20
i386        buildonly-randconfig-003-20250929    gcc-14
i386        buildonly-randconfig-004-20250929    gcc-14
i386        buildonly-randconfig-005-20250929    gcc-14
i386        buildonly-randconfig-006-20250929    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250929    gcc-12.5.0
loongarch             randconfig-002-20250929    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250929    gcc-11.5.0
nios2                 randconfig-002-20250929    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250929    gcc-14.3.0
parisc                randconfig-002-20250929    gcc-14.3.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250929    gcc-15.1.0
powerpc               randconfig-002-20250929    gcc-8.5.0
powerpc               randconfig-003-20250929    gcc-13.4.0
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250929    clang-18
powerpc64             randconfig-002-20250929    clang-22
powerpc64             randconfig-003-20250929    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250929    gcc-9.5.0
riscv                 randconfig-002-20250929    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250929    gcc-11.5.0
s390                  randconfig-002-20250929    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250929    gcc-15.1.0
sh                    randconfig-002-20250929    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250929    gcc-8.5.0
sparc                 randconfig-002-20250929    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250929    clang-22
sparc64               randconfig-002-20250929    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250929    gcc-14
um                    randconfig-002-20250929    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250929    gcc-14
x86_64      buildonly-randconfig-002-20250929    gcc-14
x86_64      buildonly-randconfig-003-20250929    clang-20
x86_64      buildonly-randconfig-004-20250929    gcc-14
x86_64      buildonly-randconfig-005-20250929    gcc-14
x86_64      buildonly-randconfig-006-20250929    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250929    gcc-8.5.0
xtensa                randconfig-002-20250929    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

