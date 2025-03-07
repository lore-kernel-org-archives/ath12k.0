Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2521C282DE
	for <ath12k@archiver.kernel.org>; Fri,  7 Mar 2025 23:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p88GQjdN89X1zDffQztSBMYXJ2Wyt4n/his4Gl+XK2U=; b=SmHtaoeXFM/u/bVcngs2fuFcvt
	CB+6LCNwv3nLkWHNeL1ReXOhXSnZZCr75AFqfcZQW+HoSkw0KhEgTlbJI9bLH0cleA7T3CP+wsByN
	brYrQ+WsBgU/+tK63HR7vPl64hxOEazkouRWzBjkUzsfs8LbALt/NF/HEqjwrm4QS6ItVLNwsD6SS
	+gZY3oqZTsqZg1QDMYD1UVRoPN17FTw/8lKcUGtFc+KFC0hCA8I0qAEY6GaSCTHegElI0Hf6ao1nd
	p/isD+V1ltsZPJpYpzYV9uvXjzsGTVWWbLwJfjlTJC0+xGB4G+EDiF+dNkPDuYCrbOCt0y3b5EtN1
	xjzAAhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqh3d-0000000FnLc-2HLI
	for ath12k@archiver.kernel.org;
	Fri, 07 Mar 2025 23:24:45 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqh2j-0000000FnGZ-24Cs
	for ath12k@lists.infradead.org;
	Fri, 07 Mar 2025 23:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741389829; x=1772925829;
  h=date:from:to:cc:subject:message-id;
  bh=iMyVxBCEuxVwFROa1ax2Fon2syixAKUZLfbaAvuJW2E=;
  b=fgPbRxcIQwEPJzR4bb3UF6xUewTHrkCLw0jiaUyMTvGbCHVLWa4xwgnw
   njI7xC2BFtQWz03NvzrWfZGpC3jduP8TiRje5GOpBN+jCREG6uTXdMxcN
   rhHq3BDwsmbbBaaPD+SuIs6lXBT1VkSHL101AOKNeZFNE5zCIPx0I49KM
   Gphb+GLKrOVsVMOfHRz0y4uerqy1qFCEC1o+6Mm2ncbokevko6+mlzfu5
   LgYJqy/8IQ5vLGkCCLR7QFtzvINbmlG/AF6bwBdGc86LmPbZDLvq44Oi+
   tK92iJ85S9E2Rt9+FEw+YiYJCUt8u61lz/fmP4Zd7b6+V6AN5kGVxVvXG
   Q==;
X-CSE-ConnectionGUID: IkIEPWT/QjiVXcE13Xxg1A==
X-CSE-MsgGUID: EJSe+VVcSRi4harf105dBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42578171"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="42578171"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 15:23:47 -0800
X-CSE-ConnectionGUID: UCzMykjiTParEoGv2yXx7w==
X-CSE-MsgGUID: gyIVVbVJSE6jaPZumiH2Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="150246832"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2025 15:23:46 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqh2e-0001BH-01;
	Fri, 07 Mar 2025 23:23:44 +0000
Date: Sat, 08 Mar 2025 07:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 b2725c67174e4e3fdd2b3b72be6408dd82ed3a52
Message-ID: <202503080726.Q1hEHCvG-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_152349_566195_1399F91E 
X-CRM114-Status: UNSURE (   3.96  )
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
branch HEAD: b2725c67174e4e3fdd2b3b72be6408dd82ed3a52  Merge branch 'pending' into main-pending

elapsed time: 1443m

configs tested: 85
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                              allnoconfig    gcc-13.2.0
arc                  randconfig-001-20250307    gcc-13.2.0
arc                  randconfig-002-20250307    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                           dove_defconfig    gcc-14.2.0
arm                  randconfig-001-20250307    clang-21
arm                  randconfig-002-20250307    gcc-14.2.0
arm                  randconfig-003-20250307    clang-19
arm                  randconfig-004-20250307    clang-21
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250307    gcc-14.2.0
arm64                randconfig-002-20250307    clang-15
arm64                randconfig-003-20250307    gcc-14.2.0
arm64                randconfig-004-20250307    clang-15
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250307    gcc-14.2.0
csky                 randconfig-002-20250307    gcc-14.2.0
hexagon                          allnoconfig    clang-21
hexagon              randconfig-001-20250307    clang-21
hexagon              randconfig-002-20250307    clang-21
i386       buildonly-randconfig-001-20250307    clang-19
i386       buildonly-randconfig-002-20250307    clang-19
i386       buildonly-randconfig-003-20250307    gcc-11
i386       buildonly-randconfig-004-20250307    clang-19
i386       buildonly-randconfig-005-20250307    gcc-12
i386       buildonly-randconfig-006-20250307    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250307    gcc-14.2.0
loongarch            randconfig-002-20250307    gcc-14.2.0
m68k                           mac_defconfig    gcc-14.2.0
mips                       bcm47xx_defconfig    clang-21
mips                         rb532_defconfig    clang-17
nios2                randconfig-001-20250307    gcc-14.2.0
nios2                randconfig-002-20250307    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
openrisc                           defconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc                             defconfig    gcc-14.2.0
parisc               randconfig-001-20250307    gcc-14.2.0
parisc               randconfig-002-20250307    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-16
powerpc              randconfig-001-20250307    gcc-14.2.0
powerpc              randconfig-002-20250307    clang-21
powerpc              randconfig-003-20250307    clang-19
powerpc64            randconfig-001-20250307    clang-21
powerpc64            randconfig-002-20250307    gcc-14.2.0
powerpc64            randconfig-003-20250307    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                              defconfig    clang-19
riscv                randconfig-001-20250307    gcc-14.2.0
riscv                randconfig-002-20250307    clang-19
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-15
s390                            allyesconfig    gcc-14.2.0
s390                               defconfig    clang-15
s390                 randconfig-001-20250307    gcc-14.2.0
s390                 randconfig-002-20250307    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250307    gcc-14.2.0
sh                   randconfig-002-20250307    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250307    gcc-14.2.0
sparc                randconfig-002-20250307    gcc-14.2.0
sparc64              randconfig-001-20250307    gcc-14.2.0
sparc64              randconfig-002-20250307    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20250307    clang-17
um                   randconfig-002-20250307    clang-21
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250307    clang-19
x86_64     buildonly-randconfig-002-20250307    gcc-12
x86_64     buildonly-randconfig-003-20250307    clang-19
x86_64     buildonly-randconfig-004-20250307    clang-19
x86_64     buildonly-randconfig-005-20250307    clang-19
x86_64     buildonly-randconfig-006-20250307    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250307    gcc-14.2.0
xtensa               randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

