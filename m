Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90136C3ABDD
	for <ath12k@archiver.kernel.org>; Sat, 17 May 2025 18:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiC5UYAoGjDlp/WFu9kxACq/NNXqKOYZIwzT9yHPkUs=; b=HUvcqCJX/0KnkOYFjPQp/eYm61
	/L9ygDg/ku/xO7757ZXjeMH/z8V59RvPWEbhcaBNho2jYWp/uGIQkhtew7eplWICWaQLmA8DSe1H0
	GwUvQ5uQGyz0PGAalBjGm5pHQlYSJLr46fO68W+Qse+6GxwbrUepNOliKNxt2+/5DNPaKPd0lPGb7
	NPu4oqugNi8RU/YhWQebz6qwuy5V1l3Rr/q+WYEMbTp1CuR1AKXqWqaihPNQr/KfrLDlbFu/tWtnk
	VL/9cSRXDZxhqTHHZ9NkizQsyer9kfIPoFudlMHIjMcvEYFJZOkgFlpz5C6pLAiH/3uS7zUPzeynE
	RAnoA9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGLxE-000000065pA-1LdV;
	Sat, 17 May 2025 18:08:12 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGLxC-000000065og-0zW1
	for ath12k@lists.infradead.org;
	Sat, 17 May 2025 18:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747505290; x=1779041290;
  h=date:from:to:cc:subject:message-id;
  bh=YNsBC5PaifF8a9buhny4QO9DjprnOVev1us35ouZ0Tg=;
  b=eRCvpidEX3Ra54J3nHIehTwAmpJDnVujXcqyKt/SRy4coIlxIizLvEYN
   iOQJ8LjBZBZfAi0Zh72QfLocOUgytry4YN2WPmOC/VZ3njm7ZQZKIPHrD
   G+zVHFv1OdT7h8YjOgmNPwUYK4gy2VQ1tVW8wADGmN9yu2ndUiOisMnBq
   qzNUjZ+LorueVjsdcE5J6P340EQ5IvPj/aLllqmWDsQMFZDL7ec1BOtFZ
   ALZF0WUMIT78d3RxjIh8gZBuORmxbDRqURKA+nvZf5KnDL7hK35y+Rjgz
   mQq0W6rxsKYoh5jdV0uhG0skasgUs61nUIQb/9LQoFM1RkFZN46bqxt62
   w==;
X-CSE-ConnectionGUID: wqRnbp0/Q76S9u0j63OcjA==
X-CSE-MsgGUID: KBvgIxx+SrKVrbjcAH8Jgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="71957689"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="71957689"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 11:08:05 -0700
X-CSE-ConnectionGUID: s4znnngJRfmqVE+rbNtKbw==
X-CSE-MsgGUID: maeozWRCRtGrmDPhM/gdFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="138887452"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 May 2025 11:08:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGLx4-000KKV-0J;
	Sat, 17 May 2025 18:08:02 +0000
Date: Sun, 18 May 2025 02:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 172e1570e1d31260f11f43e828d98aff020726a8
Message-ID: <202505180234.M4FaxXSA-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_110810_356574_7A708F14 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: 172e1570e1d31260f11f43e828d98aff020726a8  wifi: ath12k: pass link_conf for tx_arvif retrieval

elapsed time: 1165m

configs tested: 129
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250517    gcc-10.5.0
arc                   randconfig-002-20250517    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250517    clang-21
arm                   randconfig-002-20250517    gcc-8.5.0
arm                   randconfig-003-20250517    gcc-8.5.0
arm                   randconfig-004-20250517    clang-21
arm                           sunxi_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250517    clang-17
arm64                 randconfig-002-20250517    clang-16
arm64                 randconfig-003-20250517    gcc-6.5.0
arm64                 randconfig-004-20250517    gcc-8.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250517    gcc-10.5.0
csky                  randconfig-002-20250517    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250517    clang-21
hexagon               randconfig-002-20250517    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250517    clang-20
i386        buildonly-randconfig-002-20250517    clang-20
i386        buildonly-randconfig-003-20250517    clang-20
i386        buildonly-randconfig-004-20250517    gcc-12
i386        buildonly-randconfig-005-20250517    clang-20
i386        buildonly-randconfig-006-20250517    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-011-20250517    gcc-12
i386                  randconfig-012-20250517    gcc-12
i386                  randconfig-013-20250517    gcc-12
i386                  randconfig-014-20250517    gcc-12
i386                  randconfig-015-20250517    clang-20
i386                  randconfig-016-20250517    gcc-12
i386                  randconfig-017-20250517    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250517    gcc-14.2.0
loongarch             randconfig-002-20250517    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        omega2p_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250517    gcc-14.2.0
nios2                 randconfig-002-20250517    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250517    gcc-5.5.0
parisc                randconfig-002-20250517    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250517    gcc-6.5.0
powerpc               randconfig-002-20250517    gcc-6.5.0
powerpc               randconfig-003-20250517    clang-16
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-21
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250517    clang-21
powerpc64             randconfig-002-20250517    gcc-6.5.0
powerpc64             randconfig-003-20250517    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250517    clang-21
riscv                 randconfig-002-20250517    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250517    gcc-7.5.0
s390                  randconfig-002-20250517    gcc-9.3.0
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250517    gcc-12.4.0
sh                    randconfig-002-20250517    gcc-10.5.0
sh                           se7343_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250517    gcc-11.5.0
sparc                 randconfig-002-20250517    gcc-7.5.0
sparc64               randconfig-001-20250517    gcc-7.5.0
sparc64               randconfig-002-20250517    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250517    gcc-12
um                    randconfig-002-20250517    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250517    gcc-12
x86_64      buildonly-randconfig-002-20250517    gcc-12
x86_64      buildonly-randconfig-003-20250517    clang-20
x86_64      buildonly-randconfig-004-20250517    clang-20
x86_64      buildonly-randconfig-005-20250517    clang-20
x86_64      buildonly-randconfig-006-20250517    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250517    gcc-9.3.0
xtensa                randconfig-002-20250517    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

