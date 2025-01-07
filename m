Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD93EE77198
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cqTbO6QGR0h9FxZ8RLiIc7SmA06eKu/8cwA6ZYFSNRk=; b=C2td2sVcIhXmmJUoxd9hrCBb76
	fRebPmTbjs9FqSWAe/9zB1ly4uroaPg4K8sJ50zkNVh0ZHZ0vzSw6gxsOeXKVAiv0DOXzxLN9/NDR
	vewI2HTxNGpRWXXDEyB2zGdYByGustLixVqTaaymJfbm+6WHmFJIzc8ot7FM21EdOvf0xvDvA8fys
	G9s5yLBN7ggTH/MAoyNJ+Kpf0vpS+/iZq/AIgl0AV2NF0nH4n50a3f51Y+niNA65qeolqLLwbC6m+
	JENyPkWfgHujtsiXrbyuFy5h/cGDvAFwBPdpoCIHD9Um7OjP+FkNAXyjSYxSxW7QM5A7zV8FCqHCl
	94Ze+oeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDCf-00000005p50-1zoT
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 17:17:17 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCut-00000005juf-0XNn
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 16:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736269135; x=1767805135;
  h=date:from:to:cc:subject:message-id;
  bh=zP/Vh1hvcnMY8XIGE1ldRnMGmWzkOX7KlkBqL5iTAhM=;
  b=DnyrRbyAUkFRm71z7f2BV00YLaghze+FqPYszB8D6Al0bQAWOVbJQNxK
   KZgMXIRQ2ZYAKDT6wguEcgra4VbC7KsFGlnooPUawXKEEgd2+h+GWKSVm
   1gA6yV2FU9E9x63TlOz7uitUc27IplTa/gluPg6Y7AxKSY461HXrfbE1D
   4lKFpwnGbNI0gnhuE9sq/bNWNgQ9aaYRNOGRaK7TC3Il3bcTKupGXnzAH
   ewJ8gs8X5sgnpp9fWYDfO+eatA7whD7yGOz5bNlGNSKDqzEqUrBxrcZxN
   6Wl9mTvixfm3c2PezErGea+yCC9hQ0cExVgwYEV9XERQ/mcRGSSeVP8Ht
   w==;
X-CSE-ConnectionGUID: UpfByWrRSdynPr8C1F9C5g==
X-CSE-MsgGUID: gC2mDYUUTZy0Zka4yxJUgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47042070"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47042070"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 08:58:54 -0800
X-CSE-ConnectionGUID: 3Q7oBlJvTcygJ9YYWtGANg==
X-CSE-MsgGUID: umbLcYn2Tf6N4LiRBLGksQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="102639283"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jan 2025 08:58:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVCua-000F11-2y;
	Tue, 07 Jan 2025 16:58:36 +0000
Date: Wed, 08 Jan 2025 00:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 c7833d32403ac312619e829b29fe2071274d0463
Message-ID: <202501080042.U19hsaCP-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_085855_209604_A7D95585 
X-CRM114-Status: UNSURE (   4.14  )
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
branch HEAD: c7833d32403ac312619e829b29fe2071274d0463  Merge branch 'pending' into main-pending

elapsed time: 1162m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250107    gcc-13.2.0
arc                   randconfig-002-20250107    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250107    clang-20
arm                   randconfig-002-20250107    clang-19
arm                   randconfig-003-20250107    clang-20
arm                   randconfig-004-20250107    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250107    clang-15
arm64                 randconfig-002-20250107    clang-20
arm64                 randconfig-003-20250107    gcc-14.2.0
arm64                 randconfig-004-20250107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250107    gcc-14.2.0
csky                  randconfig-002-20250107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250107    clang-20
hexagon               randconfig-002-20250107    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250107    clang-19
i386        buildonly-randconfig-002-20250107    clang-19
i386        buildonly-randconfig-003-20250107    clang-19
i386        buildonly-randconfig-004-20250107    gcc-12
i386        buildonly-randconfig-005-20250107    gcc-12
i386        buildonly-randconfig-006-20250107    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250107    gcc-14.2.0
loongarch             randconfig-002-20250107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250107    gcc-14.2.0
nios2                 randconfig-002-20250107    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250107    gcc-14.2.0
parisc                randconfig-002-20250107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250107    gcc-14.2.0
powerpc               randconfig-002-20250107    gcc-14.2.0
powerpc               randconfig-003-20250107    clang-20
powerpc64             randconfig-001-20250107    clang-15
powerpc64             randconfig-002-20250107    clang-20
powerpc64             randconfig-003-20250107    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250107    clang-15
riscv                 randconfig-002-20250107    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250107    gcc-14.2.0
s390                  randconfig-002-20250107    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250107    gcc-14.2.0
sh                    randconfig-002-20250107    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250107    gcc-14.2.0
sparc                 randconfig-002-20250107    gcc-14.2.0
sparc64               randconfig-001-20250107    gcc-14.2.0
sparc64               randconfig-002-20250107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250107    gcc-12
um                    randconfig-002-20250107    clang-20
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250107    clang-19
x86_64      buildonly-randconfig-002-20250107    gcc-12
x86_64      buildonly-randconfig-003-20250107    clang-19
x86_64      buildonly-randconfig-004-20250107    gcc-12
x86_64      buildonly-randconfig-005-20250107    clang-19
x86_64      buildonly-randconfig-006-20250107    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250107    gcc-14.2.0
xtensa                randconfig-002-20250107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

