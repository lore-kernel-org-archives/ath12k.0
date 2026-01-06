Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FDACEFD15
	for <ath12k@archiver.kernel.org>; Tue,  6 Jan 2026 21:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6yirvSOWS/6cBWfD9J3WBVjWBDnC1wsiFg1itNOFVEc=; b=oMhVOrHWg6ulymHmxkWzW2wrEo
	ke/A5SpvBwpF6PRCaXut0mkT0IoII6jd+8r6c9ZIbiERawQN7uxtd/8zNgJ80LhXHLaL3fndXcxZl
	ojTc9tUqRpGsRumxe7XNtaaOF7BoEgIUjgCGzn8h2d6b9v+QZmhHP+yqvuC58/Fn50dUlYPYD7bsH
	PNN43d/6EoIxe6CNMz+uzihp23Dqk9Ic/PMBCczRDqmbtuRBs85t0fEh1dEdBar31TWHwRh9aNhkk
	B78+hbSg3BFAf7T4fPupXPimDVntZOgBgCfN9OJbzeJ+PCQeybnk1gieWxGtSk0OwL4yUuIAKfgRC
	4UnzThDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEqY-0000000Dsfn-03fH;
	Tue, 06 Jan 2026 21:44:10 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEqU-0000000DseA-2czS
	for ath12k@lists.infradead.org;
	Tue, 06 Jan 2026 21:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767735846; x=1799271846;
  h=date:from:to:cc:subject:message-id;
  bh=unMCTN1p1Ekuo/4Zx9pk0MQQ/WwS8zh1AwXjyLhID/k=;
  b=O1ebkhr+0PWPan81dJuq6ZS+1KWklJEhbPQSE4oX5Ocydjo8LTUIB8uz
   spsfBGP2E9ib5VvahNCsdAmtIJR5+CcOINkR/SOA1pdbCIJcUmPfAvFp/
   wDNTxN97TlPsrCe/TkaQQfPLKvbMe4h55CUK2GKkS4TmfIcXno3OGVpoA
   V643TY7gx+k2s0vhqp8Ki/p9+R/6h5iujaQ55FihsOYTTFqmkltP9nKSe
   pT+sGxNGhylDfZ0gP0Zpd8BF0bx0dFToFF18YXKyPy4MijEUfAwCCOtEn
   7HySwRbR7QaLVedburLIKy7BKmibndZ4nG95Go288YXSxTvzOpO6YeLE0
   w==;
X-CSE-ConnectionGUID: L24KuuHUQK+JHSGzCqsb3Q==
X-CSE-MsgGUID: 8zt2lMQ4Qteuos+siWWs1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69156937"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69156937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 13:44:05 -0800
X-CSE-ConnectionGUID: b4uMwxXbTAOeCS+SM4uR7g==
X-CSE-MsgGUID: hZcK2nVNRj+OkRhuoz/PCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="226277841"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2026 13:44:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdEqP-000000003Fl-1KN1;
	Tue, 06 Jan 2026 21:44:01 +0000
Date: Wed, 07 Jan 2026 05:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 e33fc1c6d54ee1569a57255e11c2978ba9a42ffc
Message-ID: <202601070542.XPZQwiBX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_134406_711325_775F738A 
X-CRM114-Status: UNSURE (   4.43  )
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
branch HEAD: e33fc1c6d54ee1569a57255e11c2978ba9a42ffc  Add localversion-wireless-testing-ath

elapsed time: 1475m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260106    gcc-13.4.0
arc                   randconfig-002-20260106    gcc-8.5.0
arm                                 defconfig    clang-22
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20260106    gcc-11.5.0
arm                   randconfig-002-20260106    clang-22
arm                   randconfig-003-20260106    gcc-10.5.0
arm                   randconfig-004-20260106    gcc-8.5.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260106    clang-22
arm64                 randconfig-002-20260106    gcc-8.5.0
arm64                 randconfig-003-20260106    gcc-9.5.0
arm64                 randconfig-004-20260106    gcc-10.5.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260106    gcc-10.5.0
csky                  randconfig-002-20260106    gcc-11.5.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260106    clang-22
hexagon               randconfig-002-20260106    clang-17
i386        buildonly-randconfig-001-20260106    clang-20
i386        buildonly-randconfig-002-20260106    clang-20
i386        buildonly-randconfig-003-20260106    gcc-14
i386        buildonly-randconfig-004-20260106    clang-20
i386        buildonly-randconfig-005-20260106    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260106    clang-20
i386                  randconfig-002-20260106    gcc-14
i386                  randconfig-003-20260106    clang-20
i386                  randconfig-004-20260106    clang-20
i386                  randconfig-005-20260106    clang-20
i386                  randconfig-006-20260106    clang-20
i386                  randconfig-007-20260106    clang-20
i386                  randconfig-011-20260106    clang-20
i386                  randconfig-012-20260106    gcc-14
i386                  randconfig-013-20260106    gcc-14
i386                  randconfig-014-20260106    clang-20
i386                  randconfig-015-20260106    gcc-14
i386                  randconfig-016-20260106    clang-20
i386                  randconfig-017-20260106    gcc-14
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260106    gcc-15.1.0
loongarch             randconfig-002-20260106    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-22
mips                       lemote2f_defconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260106    gcc-8.5.0
nios2                 randconfig-002-20260106    gcc-11.5.0
openrisc                            defconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260106    gcc-8.5.0
parisc                randconfig-002-20260106    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                  mpc885_ads_defconfig    clang-22
powerpc               randconfig-001-20260106    clang-22
powerpc               randconfig-002-20260106    gcc-8.5.0
powerpc                     tqm8541_defconfig    clang-22
powerpc64                        alldefconfig    clang-22
powerpc64             randconfig-001-20260106    gcc-8.5.0
powerpc64             randconfig-002-20260106    gcc-8.5.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260106    gcc-8.5.0
riscv                 randconfig-002-20260106    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20260106    gcc-8.5.0
s390                  randconfig-002-20260106    gcc-14.3.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20260106    gcc-15.1.0
sh                    randconfig-002-20260106    gcc-10.5.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260106    gcc-11.5.0
sparc                 randconfig-002-20260106    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260106    clang-22
sparc64               randconfig-002-20260106    gcc-15.1.0
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260106    clang-22
um                    randconfig-002-20260106    clang-22
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20260106    clang-20
x86_64      buildonly-randconfig-002-20260106    gcc-14
x86_64      buildonly-randconfig-003-20260106    clang-20
x86_64      buildonly-randconfig-004-20260106    gcc-14
x86_64      buildonly-randconfig-005-20260106    clang-20
x86_64      buildonly-randconfig-006-20260106    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260106    gcc-14
x86_64                randconfig-002-20260106    gcc-14
x86_64                randconfig-003-20260106    clang-20
x86_64                randconfig-004-20260106    clang-20
x86_64                randconfig-005-20260106    gcc-14
x86_64                randconfig-006-20260106    gcc-14
x86_64                randconfig-011-20260106    gcc-14
x86_64                randconfig-012-20260106    gcc-13
x86_64                randconfig-013-20260106    gcc-14
x86_64                randconfig-014-20260106    gcc-14
x86_64                randconfig-015-20260106    clang-20
x86_64                randconfig-016-20260106    clang-20
x86_64                randconfig-071-20260106    gcc-14
x86_64                randconfig-072-20260106    clang-20
x86_64                randconfig-073-20260106    clang-20
x86_64                randconfig-074-20260106    clang-20
x86_64                randconfig-075-20260106    gcc-14
x86_64                randconfig-076-20260106    clang-20
xtensa                randconfig-001-20260106    gcc-8.5.0
xtensa                randconfig-002-20260106    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

