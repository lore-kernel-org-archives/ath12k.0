Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8EFD5D66F
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L9GpNEXNxscq/KnTV4AxBJ/Np7yS8J4o5j/9ESHJXSU=; b=sPC6ANd6N1aXzPPXJJgMkPtgr6
	4VUjKuO/RJY7JMgykhaGKo0lmS1OS6fqDXzQdMdH7lwhaswD6WG8dlScrdQQFMjDXACyDovGm6OWw
	2u7RJwM7qd91+cumqm284EjoVqxt/4sIHwPXoIMPqUKTYZq1xGeRZgWJ7Pdi6hINhW8XRurj8Wix7
	o9m/saNe4jDMfsFF1cVqDBVrbiBkqqI6L0tjo9U5O+YpEsXFXCnXTdfd3WFyDrmuAzzD0eDYrWQOS
	7fqjF2s9Z1R1CE1GOxQbTGxR2iS5/F3C89yUdxVkwJllwGubMLOcuUmkqNg7WIvBn2qVt+in6R752
	UC/VgiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96GE-00000007oMk-2tho
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 17:25:34 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t96GB-00000007oLp-0xAv
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 17:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731000331; x=1762536331;
  h=date:from:to:cc:subject:message-id;
  bh=Bgo/fkYmYRkfTAgia/8oBfFME515kjV31OlM9QYGd84=;
  b=kiTxON1erPCQHuFYTSBRfY4WSXB0yGEIIFyhZH5GBnhQcpbgiUePxsJB
   1TN5Khw2QbwgqEHHKrV9wLqMx4fACFOfmJxXkdJRMhmlgbRi0DzMae3yI
   bcX3ryK3QiQ7z4maNQLqzLWDQskgj8tow8AMH6sBHFFtfJG85m4FwwEUI
   ZHGf49eSSFD8pMWYXtSB4AQiaJyoA278vmGJ/sJVNQ/hroXlQoKaDe1XN
   AwHPyXKfXjZcI2OYWKNvrdehh4xRTe5SygkiFTjYuw5+K7HCzNmPJ0ZAG
   NILywSWr4xKV4efm//96dFDjgR4QrB2wjHE39r6rdvX+wWUKrg3TJxgVF
   A==;
X-CSE-ConnectionGUID: SrWJN3MJScuCOqWyk8hetQ==
X-CSE-MsgGUID: Hm3+Umr4SNKFdgPvgeHZiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30715047"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30715047"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 09:25:28 -0800
X-CSE-ConnectionGUID: +63cKKCVT8axLBOJi6obpQ==
X-CSE-MsgGUID: iu7pjLl5TNOTl7lguI+itw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="84688340"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 09:25:27 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t96G4-000qXa-2A;
	Thu, 07 Nov 2024 17:25:24 +0000
Date: Fri, 08 Nov 2024 01:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 ee6fd63563605832983a5c1ca228445d424aef50
Message-ID: <202411080132.sFM145T1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_092531_536938_CDC997B2 
X-CRM114-Status: UNSURE (   3.99  )
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
branch HEAD: ee6fd63563605832983a5c1ca228445d424aef50  Merge branch 'pending' into main-pending

elapsed time: 1120m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241107    gcc-13.2.0
arc                   randconfig-002-20241107    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241107    clang-16
arm                   randconfig-002-20241107    gcc-14.2.0
arm                   randconfig-003-20241107    gcc-14.2.0
arm                   randconfig-004-20241107    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241107    gcc-14.2.0
arm64                 randconfig-002-20241107    gcc-14.2.0
arm64                 randconfig-003-20241107    clang-20
arm64                 randconfig-004-20241107    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241107    gcc-14.2.0
csky                  randconfig-002-20241107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241107    clang-20
hexagon               randconfig-002-20241107    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241107    gcc-12
i386        buildonly-randconfig-002-20241107    gcc-12
i386        buildonly-randconfig-003-20241107    gcc-12
i386        buildonly-randconfig-004-20241107    gcc-12
i386        buildonly-randconfig-005-20241107    clang-19
i386        buildonly-randconfig-006-20241107    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241107    clang-19
i386                  randconfig-002-20241107    gcc-12
i386                  randconfig-003-20241107    gcc-12
i386                  randconfig-004-20241107    gcc-12
i386                  randconfig-005-20241107    gcc-12
i386                  randconfig-006-20241107    clang-19
i386                  randconfig-011-20241107    gcc-12
i386                  randconfig-012-20241107    clang-19
i386                  randconfig-013-20241107    clang-19
i386                  randconfig-014-20241107    gcc-12
i386                  randconfig-015-20241107    clang-19
i386                  randconfig-016-20241107    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241107    gcc-14.2.0
loongarch             randconfig-002-20241107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241107    gcc-14.2.0
nios2                 randconfig-002-20241107    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241107    gcc-14.2.0
parisc                randconfig-002-20241107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241107    clang-16
powerpc               randconfig-002-20241107    clang-20
powerpc               randconfig-003-20241107    gcc-14.2.0
powerpc64             randconfig-001-20241107    gcc-14.2.0
powerpc64             randconfig-002-20241107    gcc-14.2.0
powerpc64             randconfig-003-20241107    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241107    gcc-14.2.0
riscv                 randconfig-002-20241107    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241107    clang-20
s390                  randconfig-002-20241107    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241107    gcc-14.2.0
sh                    randconfig-002-20241107    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241107    gcc-14.2.0
sparc64               randconfig-002-20241107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                    randconfig-001-20241107    clang-20
um                    randconfig-002-20241107    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241107    clang-19
x86_64      buildonly-randconfig-002-20241107    gcc-12
x86_64      buildonly-randconfig-003-20241107    gcc-12
x86_64      buildonly-randconfig-004-20241107    clang-19
x86_64      buildonly-randconfig-005-20241107    gcc-12
x86_64      buildonly-randconfig-006-20241107    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241107    clang-19
x86_64                randconfig-002-20241107    clang-19
x86_64                randconfig-003-20241107    clang-19
x86_64                randconfig-004-20241107    gcc-12
x86_64                randconfig-005-20241107    clang-19
x86_64                randconfig-006-20241107    clang-19
x86_64                randconfig-011-20241107    gcc-12
x86_64                randconfig-012-20241107    clang-19
x86_64                randconfig-013-20241107    gcc-12
x86_64                randconfig-014-20241107    gcc-12
x86_64                randconfig-015-20241107    gcc-12
x86_64                randconfig-016-20241107    clang-19
x86_64                randconfig-071-20241107    clang-19
x86_64                randconfig-072-20241107    clang-19
x86_64                randconfig-073-20241107    clang-19
x86_64                randconfig-074-20241107    gcc-12
x86_64                randconfig-075-20241107    clang-19
x86_64                randconfig-076-20241107    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241107    gcc-14.2.0
xtensa                randconfig-002-20241107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

