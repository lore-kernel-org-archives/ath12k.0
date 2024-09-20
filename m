Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9798CF58F1
	for <ath12k@archiver.kernel.org>; Fri, 20 Sep 2024 08:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FXxeLzyOgngD1ImWqHmI/fucHHFak52KOOkslt1IU4M=; b=cJtYkyCHgRTSCjauPHCgKl80fp
	+ccLSG9Nk1ulUJ98CbN+TjOZvSIfLZgXZshGXukTw3Dec8TLFjySoiSUN8v8P5yGBUoW+3hjssEj/
	dOy6eIpx0u0TiBvxxoMeOmlgbNCjAgBCrp0y5cj+Xn00TnMPVPG+RWiFPfUk+Mn4QkQVA14HExRrW
	5qgSPwRKGJFk5NGSnMYejUrl4leOw8R7wGnAl+PHEXXc99QDGBl9w3fgxm1Ik6r3CHPSXh1TKUibs
	9ZpKdwsDWhDPAc23a3H9GsbvfjkCwn0NiMW0zg7dTravmfEhyMxX/sebhg+3hkEo6QpoMCzdsJ9rP
	Eu09TpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZOa-0000000Bq1f-2F8Q
	for ath12k@archiver.kernel.org;
	Fri, 20 Sep 2024 08:53:44 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZ9u-0000000BnTu-43Jx
	for ath12k@lists.infradead.org;
	Fri, 20 Sep 2024 08:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726821515; x=1758357515;
  h=date:from:to:cc:subject:message-id;
  bh=10M9qvy7TuEYDf4sXN8FcAPIf+e+y7ZglJTit7c3DbU=;
  b=TtVbRAgKJkN4BC4VhPvqSyP/DxHqpqkswhLgoHqZ6cE3BRWOxu5M5D8N
   VV6FGFCF9PY1Zbo3F1YGsphlAen2AMMYjzT0VkZxiUAM8SreOEtAKUami
   bBI8L9KJZgZsk+AqFcELwQ8Dwtkqj0k6AXYCILOKXUT7UvuBMHV30yV9w
   7zSkblYFcfv6Me19nVSkoktOpd4uPk2JjD1HWOmYD/B6wvn8+4l5162OD
   kVbnQjWignXH+FBWMsKkW4nBQW4xhcaVRZV5LC6zEOKbvM/8b2phWtVSJ
   cpLFdzUR3BiD7h1j5RlzpzOPtVckh/tVgVh0ujuX+CreNgqStq1UursLH
   w==;
X-CSE-ConnectionGUID: iHE18XxTTI6nK0v3iOj2jw==
X-CSE-MsgGUID: +4hl7wqmSpWa3HXm5qz3GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25642249"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="25642249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 01:38:34 -0700
X-CSE-ConnectionGUID: N1q4m3vLRm+UC5PT9YI5sA==
X-CSE-MsgGUID: n7CMZGL2QSSPNzoDmUpiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="70674426"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Sep 2024 01:38:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srZ9r-000E8y-08;
	Fri, 20 Sep 2024 08:38:31 +0000
Date: Fri, 20 Sep 2024 16:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 d35bb26e150d7fb7434959fad9fcaeaac99906e6
Message-ID: <202409201605.8OJfYiZO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_013835_087902_68401D82 
X-CRM114-Status: UNSURE (   3.65  )
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
branch HEAD: d35bb26e150d7fb7434959fad9fcaeaac99906e6  Add localversion-wireless-testing-ath

elapsed time: 961m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        mvebu_v7_defconfig    gcc-14.1.0
arm                           spitz_defconfig    gcc-14.1.0
arm                           stm32_defconfig    gcc-14.1.0
arm                         vf610m4_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240920    gcc-12
i386        buildonly-randconfig-002-20240920    gcc-12
i386        buildonly-randconfig-003-20240920    gcc-12
i386        buildonly-randconfig-004-20240920    gcc-12
i386        buildonly-randconfig-005-20240920    gcc-12
i386        buildonly-randconfig-006-20240920    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240920    gcc-12
i386                  randconfig-002-20240920    gcc-12
i386                  randconfig-003-20240920    gcc-12
i386                  randconfig-004-20240920    gcc-12
i386                  randconfig-005-20240920    gcc-12
i386                  randconfig-006-20240920    gcc-12
i386                  randconfig-011-20240920    gcc-12
i386                  randconfig-012-20240920    gcc-12
i386                  randconfig-013-20240920    gcc-12
i386                  randconfig-014-20240920    gcc-12
i386                  randconfig-015-20240920    gcc-12
i386                  randconfig-016-20240920    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    gcc-14.1.0
mips                      fuloong2e_defconfig    gcc-14.1.0
mips                        qi_lb60_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-14.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          sdk7780_defconfig    gcc-14.1.0
sh                           se7206_defconfig    gcc-14.1.0
sh                           se7724_defconfig    gcc-14.1.0
sh                            titan_defconfig    gcc-14.1.0
sh                          urquell_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240920    gcc-12
x86_64      buildonly-randconfig-002-20240920    gcc-12
x86_64      buildonly-randconfig-003-20240920    gcc-12
x86_64      buildonly-randconfig-004-20240920    gcc-12
x86_64      buildonly-randconfig-005-20240920    gcc-12
x86_64      buildonly-randconfig-006-20240920    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20240920    gcc-12
x86_64                randconfig-002-20240920    gcc-12
x86_64                randconfig-003-20240920    gcc-12
x86_64                randconfig-004-20240920    gcc-12
x86_64                randconfig-005-20240920    gcc-12
x86_64                randconfig-006-20240920    gcc-12
x86_64                randconfig-011-20240920    gcc-12
x86_64                randconfig-012-20240920    gcc-12
x86_64                randconfig-013-20240920    gcc-12
x86_64                randconfig-014-20240920    gcc-12
x86_64                randconfig-015-20240920    gcc-12
x86_64                randconfig-016-20240920    gcc-12
x86_64                randconfig-071-20240920    gcc-12
x86_64                randconfig-072-20240920    gcc-12
x86_64                randconfig-073-20240920    gcc-12
x86_64                randconfig-074-20240920    gcc-12
x86_64                randconfig-075-20240920    gcc-12
x86_64                randconfig-076-20240920    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                    smp_lx200_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

