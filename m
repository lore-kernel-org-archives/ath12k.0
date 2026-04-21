Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB62F327AD
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OAiB2hdFlk7eBooBQQijEOAvWxIIwODaYVEypCGLL8s=; b=eTfoe73Bw0teZpuT6LAveXggMm
	VPrn69BzCZFeNaK7CZEqtoKk/9t03opl/G1KfsSYIfiKEA/ZnQYIZNWkggHo/DjRHtk9LkoJQWkD7
	IyaC5nBQIOLeiW/Fciqh0pXnx/tlgWz1b71Mwn7nzx6Hr3XqF02q3iYpxV69c+tkDGKYYf+Zpepd6
	edDOesl8TyOijbcUtb7MjSchFGutTzwZf1HUmfuDbyoXe/P24sOU/zZMuyBa7voWtA0BgC+WmgP48
	CFiC3Rz87PWHCvbRvAaL58OP/TlATJayjTJop9uoEGVocz7IdclzmJ95ygKaT2GS/rj+A5mJehcUQ
	skp1uTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Ii-0000000896o-3FOX;
	Tue, 21 Apr 2026 07:13:40 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5If-0000000895E-2C2x
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 07:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776755617; x=1808291617;
  h=date:from:to:cc:subject:message-id;
  bh=KawemqnySlc/8g2DgBouknthniqOXwi5qLeeReQkINc=;
  b=SGb9yEzL5NqwhWGW4MBFeafMU6TvnXntSX5OeIgf79Ug+Ez64OH7vdpN
   7QpqAcsyFDsuyb3rl9Yqt/mlGO3lODjiy4kA9fx3zxuAg2LRbCvx345F3
   dPClexOIrXEPh+8BNqywdooMxLUNjy2b1xOuFlFLwWkj2zJYptnndbwBa
   4xqbUDfvvv7IfMg2e54iKRdwoQqkBDM1j6b03e/mN4HERye64672CNlXN
   xtLSpcD+vMZANUrKXBGDjtWIM/6uh+tgBLcpG3ifRDwx41eA30cHVcOgz
   GfwA/HV6nV1VjrLcl5HzIlBCvW06bHBAu5w3fNV4ZiRGgADMBaWLm/ewO
   Q==;
X-CSE-ConnectionGUID: XaWPx8C+TSuwzfNXy4j+nA==
X-CSE-MsgGUID: ITpI5eOjSMquuHedqdzDdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77382899"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77382899"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 00:13:34 -0700
X-CSE-ConnectionGUID: MABy1HGPRTCdSj4eyJLPUg==
X-CSE-MsgGUID: rZVPd2ikRWegs18k7m1R5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="255407477"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Apr 2026 00:13:33 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF5IY-000000003JQ-3EsJ;
	Tue, 21 Apr 2026 07:13:30 +0000
Date: Tue, 21 Apr 2026 15:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 ae219489251f5abc0a6b100892fa33eecaad8913
Message-ID: <202604211553.CUPVl5l2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_001337_612262_00429922 
X-CRM114-Status: UNSURE (   4.22  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: ae219489251f5abc0a6b100892fa33eecaad8913  wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path

elapsed time: 835m

configs tested: 113
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260421    gcc-10.5.0
arc                   randconfig-002-20260421    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260421    clang-23
arm                   randconfig-002-20260421    gcc-8.5.0
arm                   randconfig-003-20260421    clang-23
arm                   randconfig-004-20260421    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260421    clang-23
arm64                 randconfig-002-20260421    gcc-13.4.0
arm64                 randconfig-003-20260421    clang-18
arm64                 randconfig-004-20260421    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260421    gcc-13.4.0
csky                  randconfig-002-20260421    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260421    gcc-14
i386        buildonly-randconfig-002-20260421    gcc-14
i386        buildonly-randconfig-003-20260421    clang-20
i386        buildonly-randconfig-004-20260421    clang-20
i386        buildonly-randconfig-005-20260421    clang-20
i386        buildonly-randconfig-006-20260421    clang-20
i386                  randconfig-001-20260421    clang-20
i386                  randconfig-002-20260421    clang-20
i386                  randconfig-003-20260421    clang-20
i386                  randconfig-004-20260421    clang-20
i386                  randconfig-005-20260421    clang-20
i386                  randconfig-006-20260421    clang-20
i386                  randconfig-011-20260421    gcc-14
i386                  randconfig-012-20260421    gcc-14
i386                  randconfig-013-20260421    gcc-14
i386                  randconfig-014-20260421    clang-20
i386                  randconfig-015-20260421    clang-20
i386                  randconfig-016-20260421    gcc-14
i386                  randconfig-017-20260421    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260421    gcc-15.2.0
parisc                randconfig-002-20260421    gcc-9.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260421    clang-20
powerpc               randconfig-002-20260421    clang-23
powerpc64             randconfig-001-20260421    gcc-13.4.0
powerpc64             randconfig-002-20260421    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                            migor_defconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260421    gcc-15.2.0
sparc                 randconfig-002-20260421    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64               randconfig-001-20260421    gcc-9.5.0
sparc64               randconfig-002-20260421    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                    randconfig-001-20260421    clang-23
um                    randconfig-002-20260421    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260421    gcc-14
x86_64      buildonly-randconfig-002-20260421    clang-20
x86_64      buildonly-randconfig-003-20260421    gcc-14
x86_64      buildonly-randconfig-004-20260421    gcc-14
x86_64      buildonly-randconfig-005-20260421    gcc-13
x86_64      buildonly-randconfig-006-20260421    clang-20
x86_64                randconfig-013-20260421    gcc-14
x86_64                randconfig-071-20260421    clang-20
x86_64                randconfig-072-20260421    gcc-14
x86_64                randconfig-073-20260421    clang-20
x86_64                randconfig-074-20260421    clang-20
x86_64                randconfig-075-20260421    clang-20
x86_64                randconfig-076-20260421    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260421    gcc-15.2.0
xtensa                randconfig-002-20260421    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

