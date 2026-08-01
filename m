Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7038C54FCD
	for <ath12k@archiver.kernel.org>; Sat,  1 Aug 2026 06:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dSSoRK/XrcPfKtRHbLTdJJPBxH7vcnIRBS2iWLlS+NI=; b=OWwQ70xL9FywQi1Kk54x5WkpHe
	vkdRidSWRnhRWkc4JPFox+RkVJ64D2K7WJ1HeNR1SbHcMKbEvA+MnQucytAy3B9HP+5yAuH5I3fF4
	w1jzzjiQFjEgvYuh2qaEkGSlvW7PSPV9RSN2zBfr5qwmhGt0a5O3Dfg/NqKA8fwA2fhxUM+tSl8Hi
	aPRsxxLN6Ty2Zg7EYN8Cn/KGEYkZrx94DQqt5ChGXjQbe0Dv/g36D3x/dzESh8pe9Y4EZ24ioJePp
	GZsphc12ms2TGSjvXE4YvCmPBvLtEGh2pmxTzJDbSIJb3S/3iIA79nmbBUWRgkEb7ns/9A8lpc6AO
	8xVVVWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq2nS-0000000DvSk-0gio;
	Sat, 01 Aug 2026 06:02:10 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq2nP-0000000DvSC-0MSm
	for ath12k@lists.infradead.org;
	Sat, 01 Aug 2026 06:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785564127; x=1817100127;
  h=date:from:to:cc:subject:message-id;
  bh=6UnMVwzQjezhkyhFppyeHDL6Uuf9BXs/WDSKdfMUFzM=;
  b=nFAPgHhwR4BiiDpqLRUbXX6ig06RzKX5e0j5e/uNxfv/PC+C93TaM/xo
   vWmiq2vfVAugrpYt+YNiJbID2hVV28dYZFg0OqFYk9YpXwrm9deCWPsBZ
   u2nmQyCMq1J/4uHXiciK4Xavv2As8Vv+E+/aUIZnDnPgMTIcdL+B7+t+B
   tMOhjYRi4Kdw5Uczr16WncRBzO554ZzNHQIc6jf4i2Y3U7hZ0Qzg0k6Jl
   X2r8savBm8tD+Fj1/eBFF55rUb5g9kPTJo4A2RanywFMHnxTn5tX1poSd
   kfCFaBNniQtXMoIGDL8aUmxd17t5ZuocTd1uzs7JgfRjvHCPGmjjA0Ehu
   w==;
X-CSE-ConnectionGUID: NSIiKkUDS+abuVoxUaYfyQ==
X-CSE-MsgGUID: WdNRCAaPTKO/IOAYlWPf5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="88715418"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="88715418"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 23:02:00 -0700
X-CSE-ConnectionGUID: cLH/z/qvTDqfjLEM0FJY5g==
X-CSE-MsgGUID: jcLqvlizSDaWQQE9kWqfew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="262709422"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2026 23:01:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq2nE-000000002qf-3AIC;
	Sat, 01 Aug 2026 06:01:56 +0000
Date: Sat, 01 Aug 2026 14:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 3bbd05723d15dd06f0560bcd94fbf9a91b5f5613
Message-ID: <202608011428.nKgl2D11-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_230207_592401_D81CD475 
X-CRM114-Status: UNSURE (   3.91  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 3bbd05723d15dd06f0560bcd94fbf9a91b5f5613  wifi: ath6kl: clamp assoc request/response lengths before subtracting IE offsets

elapsed time: 774m

configs tested: 84
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260801    gcc-14.3.0
arc                  randconfig-002-20260801    gcc-12.5.0
arm                  randconfig-001-20260801    clang-24
arm                  randconfig-002-20260801    gcc-8.5.0
arm                  randconfig-003-20260801    gcc-12.5.0
arm                  randconfig-004-20260801    clang-18
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260801    clang-21
arm64                randconfig-002-20260801    clang-21
arm64                randconfig-003-20260801    gcc-14.3.0
arm64                randconfig-004-20260801    clang-17
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260801    gcc-12.5.0
csky                 randconfig-002-20260801    gcc-10.5.0
hexagon              randconfig-001-20260801    clang-24
hexagon              randconfig-002-20260801    clang-17
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260801    clang-22
i386       buildonly-randconfig-002-20260801    clang-22
i386       buildonly-randconfig-003-20260801    clang-22
i386       buildonly-randconfig-004-20260801    clang-22
i386       buildonly-randconfig-005-20260801    gcc-14
i386       buildonly-randconfig-006-20260801    gcc-14
i386                 randconfig-011-20260801    clang-22
i386                 randconfig-012-20260801    gcc-14
i386                 randconfig-013-20260801    gcc-14
i386                 randconfig-014-20260801    clang-22
i386                 randconfig-015-20260801    clang-22
i386                 randconfig-016-20260801    gcc-14
i386                 randconfig-017-20260801    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260801    clang-18
loongarch            randconfig-002-20260801    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260801    gcc-8.5.0
nios2                randconfig-002-20260801    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260801    gcc-11.5.0
parisc               randconfig-002-20260801    gcc-9.5.0
powerpc                     bamboo_defconfig    clang-21
powerpc              mpc834x_itxgp_defconfig    clang-24
powerpc              randconfig-001-20260801    clang-20
powerpc              randconfig-002-20260801    gcc-10.5.0
powerpc64            randconfig-001-20260801    clang-24
powerpc64            randconfig-002-20260801    clang-24
riscv                randconfig-001-20260801    gcc-14.3.0
riscv                randconfig-002-20260801    clang-20
s390                 randconfig-001-20260801    gcc-15.2.0
s390                 randconfig-002-20260801    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260801    gcc-16.1.0
sh                   randconfig-002-20260801    gcc-16.1.0
x86_64     buildonly-randconfig-001-20260801    clang-22
x86_64     buildonly-randconfig-002-20260801    clang-22
x86_64     buildonly-randconfig-003-20260801    gcc-13
x86_64     buildonly-randconfig-004-20260801    clang-22
x86_64     buildonly-randconfig-005-20260801    clang-22
x86_64     buildonly-randconfig-006-20260801    clang-22
x86_64               randconfig-001-20260801    clang-22
x86_64               randconfig-002-20260801    gcc-14
x86_64               randconfig-003-20260801    gcc-14
x86_64               randconfig-004-20260801    clang-22
x86_64               randconfig-005-20260801    gcc-14
x86_64               randconfig-006-20260801    gcc-14
x86_64               randconfig-011-20260801    clang-22
x86_64               randconfig-012-20260801    gcc-14
x86_64               randconfig-013-20260801    clang-22
x86_64               randconfig-014-20260801    gcc-14
x86_64               randconfig-015-20260801    clang-22
x86_64               randconfig-016-20260801    clang-22
x86_64               randconfig-071-20260801    gcc-14
x86_64               randconfig-072-20260801    gcc-14
x86_64               randconfig-073-20260801    clang-22
x86_64               randconfig-074-20260801    gcc-14
x86_64               randconfig-075-20260801    clang-22
x86_64               randconfig-076-20260801    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

