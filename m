Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFEECF9C64
	for <ath12k@archiver.kernel.org>; Sun, 22 Sep 2024 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IhFY3YXTfvIMtl49LCAsLwqJYaGPf8W+j6ZByRX/FqI=; b=z35y5fxzYnZ7bFk7Q2y5vrIRRm
	RhcX0qDi4lzmXCjMzmXIgGrIvHtnQ/9GxB5uVORf90G7bTsJVc4U/j5OO6fib11uB3Xv/fB2ZlpRW
	VkXH4oIP/EINaA4f0s1czfaY1wiVJdypB9CoN2EWwfQWLwJqBZLFnLpMnij3SfcNYORR0JadlFc6I
	82j5U2UPd33FG5uPIPrSy/Jnq2i2TcWpK5yiulYJvCNIToBr4Yk5uU5UylehQxsYD0yQqoEj08jYw
	M/9QHRdVq+Uen2qZxwzn7Dn78AUToRxFD0d17codSEClW2Lbc3Vu88EHYw6SWTfpNI9hh1IwCl8Rv
	J8owD4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssKJk-0000000F1jt-3wiV
	for ath12k@archiver.kernel.org;
	Sun, 22 Sep 2024 10:59:52 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssKJi-0000000F1jP-0yp4
	for ath12k@lists.infradead.org;
	Sun, 22 Sep 2024 10:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727002790; x=1758538790;
  h=date:from:to:cc:subject:message-id;
  bh=fsQcPvZCj9KOfvhrpzlIivZ/Z/tTC8leLv1LcDwSifU=;
  b=kHil3zeVGJJbeztKTVeaVLCZ5YlyS7uqNL0zwG6rTNwGCpugh8MQy5Or
   peHPRar+ZGOc40Hh3r9erR5P+FmK4oDIxYh+WZtmAxte2aA6hrphJLNfM
   XMCe5teDZpR5TZZpy8qqXW8rd6wQBercXrsquVVhLCTGR4PywpIfCZu0g
   zYT6BEeaVSKcg3d419Z3ZYkmKfSazF4sKkXHSiQ0E2Gpz0/8G1cDzIpBZ
   Qr/1cPZly+3IiS6wsVBN7BYJ+YBM5tpdmL76pzGiiLUq+N7dnZKJgGbhS
   hScW2/bWsMIJOWZG/ELNUTrAWhwV4QFF8njQbJrn+SkCS/6pyKn4GVr5c
   g==;
X-CSE-ConnectionGUID: /NB19I9DTByiTtdEArFEkQ==
X-CSE-MsgGUID: 4cAQFvw6TNeNOL9o2ieo0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36544914"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36544914"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 03:59:49 -0700
X-CSE-ConnectionGUID: DtfQVxO2QSGEMmmzi/Z57Q==
X-CSE-MsgGUID: /mUOrS41SRu77YGpCNwd4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="71093849"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Sep 2024 03:59:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssKJd-000GEY-2m;
	Sun, 22 Sep 2024 10:59:45 +0000
Date: Sun, 22 Sep 2024 18:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 71a66ca2c46d815d17e234a10726ca6c94af5272
Message-ID: <202409221856.8mu802Fi-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_035950_315154_32CF9A4F 
X-CRM114-Status: UNSURE (   3.88  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
branch HEAD: 71a66ca2c46d815d17e234a10726ca6c94af5272  wifi: ath12k: pass link ID during MLO while delivering skb

Unverified Warning (likely false positive, kindly check if interested):

    net/wireless/core.c:719 wiphy_verify_combinations() error: uninitialized symbol 'ret'.

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-161-20240922
    `-- net-wireless-core.c-wiphy_verify_combinations()-error:uninitialized-symbol-ret-.

elapsed time: 2539m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                            hsdk_defconfig    gcc-13.2.0
arc                   randconfig-001-20240922    gcc-13.2.0
arc                   randconfig-002-20240922    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                         axm55xx_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                   randconfig-001-20240922    gcc-14.1.0
arm                   randconfig-002-20240922    clang-20
arm                   randconfig-003-20240922    clang-16
arm                   randconfig-004-20240922    gcc-14.1.0
arm                             rpc_defconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240922    gcc-14.1.0
arm64                 randconfig-002-20240922    clang-20
arm64                 randconfig-003-20240922    gcc-14.1.0
arm64                 randconfig-004-20240922    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240922    gcc-14.1.0
csky                  randconfig-002-20240922    gcc-14.1.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20240922    clang-20
hexagon               randconfig-002-20240922    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240922    clang-18
i386        buildonly-randconfig-002-20240922    clang-18
i386        buildonly-randconfig-003-20240922    clang-18
i386        buildonly-randconfig-004-20240922    clang-18
i386        buildonly-randconfig-005-20240922    clang-18
i386        buildonly-randconfig-006-20240922    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240922    clang-18
i386                  randconfig-002-20240922    gcc-12
i386                  randconfig-003-20240922    gcc-12
i386                  randconfig-004-20240922    clang-18
i386                  randconfig-005-20240922    gcc-12
i386                  randconfig-006-20240922    gcc-12
i386                  randconfig-011-20240922    gcc-12
i386                  randconfig-012-20240922    clang-18
i386                  randconfig-013-20240922    gcc-12
i386                  randconfig-014-20240922    clang-18
i386                  randconfig-015-20240922    clang-18
i386                  randconfig-016-20240922    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240922    gcc-14.1.0
loongarch             randconfig-002-20240922    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                   sb1250_swarm_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240922    gcc-14.1.0
nios2                 randconfig-002-20240922    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20240922    gcc-14.1.0
parisc                randconfig-002-20240922    gcc-14.1.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-002-20240922    gcc-14.1.0
powerpc64             randconfig-002-20240922    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                  defconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

