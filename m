Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5168CC3DA4A
	for <ath12k@archiver.kernel.org>; Sun, 11 Aug 2024 05:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P9ZVkK4ejGNvSXQ5UGg5lEvMqIzd+kIv9x4aeqIHoXU=; b=c39Qg58Ej6AysNf+3Eru4j3Jds
	0mvIHJ0OH0OTBj5oFgobXd0Mj0KHmAKyuvz9VWkyvpGOak3LiqAX26376US9zcS/jqO9q7JRO+0OA
	JL2yDruG7lEjc+FjAMcBRHtY+8TcBGQRO/kWgfQQBYvS2wRLuROTBlOT/bBZRKBMF9HV/Vy5iVWNQ
	qvQMJ/FdlpM5jYBK/wMG3fKACI3MKDC96sXD7VCYOk4hr/laWM76an5vI3TEUx/xd1IoHfIhtH8uY
	7VxwHiCDQFEX72P+oP1ulWWJRNvAc2f+OAla+R43e3nwg401pyDooU3J8Pbl5Dp9B7YvbVdQCMgVF
	C4n0ns4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sd0vT-0000000F3Ju-3huq
	for ath12k@archiver.kernel.org;
	Sun, 11 Aug 2024 05:15:31 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sd0vP-0000000F3Il-3jfT
	for ath12k@lists.infradead.org;
	Sun, 11 Aug 2024 05:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723353328; x=1754889328;
  h=date:from:to:cc:subject:message-id;
  bh=0f52XMMQaJyRqNieT8naSoASeTRrRB2He48a3FsbQ84=;
  b=N4+u+OdbcnVHmqgAII6/xKQiECFMnpDknC7zmg1PSwHevPhre37QF7ap
   safkhI/Z5i2skFxJ9am6HL/wU+9BLKDJpaK3C4TforXEvWUDfJvo8oA6p
   KhSMPVTCzHfobEJBWvy268t+p3yaNzXLpLKumLMLhBqG94wa1vf/fy769
   KqKtk5uwGgaA5310NW8hoc7wCzg6PsRrtYM0dBJX0GgaLBSnSSKLF4GV8
   tXJJ+v4IUUG0yYvksVQTqVUcLJLV6JSJDoNCa68SDdxiRt/cmN4rAlZFn
   bAO8UXkz4bhBiA4jxTJVlLFaPUvNyFvWbZADQk2X6xRyUrVe6BMRZhzyf
   w==;
X-CSE-ConnectionGUID: A096CLB2RzyPzHHkAjdu9g==
X-CSE-MsgGUID: 0zo6z9ZARWqglNgsgr+a6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21294193"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21294193"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 22:15:23 -0700
X-CSE-ConnectionGUID: 0LWLJ1eESouBKsS3CXrXJQ==
X-CSE-MsgGUID: 0ln1iPJOSfyPjeWh/RkLwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="57838466"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 10 Aug 2024 22:15:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd0vG-000Abr-33;
	Sun, 11 Aug 2024 05:15:18 +0000
Date: Sun, 11 Aug 2024 13:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 153155eb5de9f448174d58378eb4e4c31e493a33
Message-ID: <202408111357.3CT6sRt9-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_221528_052088_9EFFBA3A 
X-CRM114-Status: UNSURE (   3.55  )
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
branch HEAD: 153155eb5de9f448174d58378eb4e4c31e493a33  wifi: ath12k: fix the stack frame size warning in ath12k_mac_op_hw_scan

elapsed time: 1235m

configs tested: 222
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240811   gcc-13.2.0
arc                   randconfig-002-20240811   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         axm55xx_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                   randconfig-001-20240811   gcc-13.2.0
arm                   randconfig-002-20240811   gcc-13.2.0
arm                   randconfig-003-20240811   gcc-13.2.0
arm                   randconfig-004-20240811   gcc-13.2.0
arm                        shmobile_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240811   gcc-13.2.0
arm64                 randconfig-002-20240811   gcc-13.2.0
arm64                 randconfig-003-20240811   gcc-13.2.0
arm64                 randconfig-004-20240811   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240811   gcc-13.2.0
csky                  randconfig-002-20240811   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240810   clang-18
i386         buildonly-randconfig-001-20240811   gcc-12
i386         buildonly-randconfig-002-20240810   clang-18
i386         buildonly-randconfig-002-20240811   gcc-12
i386         buildonly-randconfig-003-20240810   clang-18
i386         buildonly-randconfig-003-20240811   gcc-12
i386         buildonly-randconfig-004-20240810   clang-18
i386         buildonly-randconfig-004-20240811   gcc-12
i386         buildonly-randconfig-005-20240810   gcc-12
i386         buildonly-randconfig-005-20240811   gcc-12
i386         buildonly-randconfig-006-20240810   gcc-12
i386         buildonly-randconfig-006-20240811   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240810   clang-18
i386                  randconfig-001-20240811   gcc-12
i386                  randconfig-002-20240810   gcc-12
i386                  randconfig-002-20240811   gcc-12
i386                  randconfig-003-20240810   clang-18
i386                  randconfig-003-20240811   gcc-12
i386                  randconfig-004-20240810   gcc-12
i386                  randconfig-004-20240811   gcc-12
i386                  randconfig-005-20240810   gcc-12
i386                  randconfig-005-20240811   gcc-12
i386                  randconfig-006-20240810   clang-18
i386                  randconfig-006-20240811   gcc-12
i386                  randconfig-011-20240810   gcc-12
i386                  randconfig-011-20240811   gcc-12
i386                  randconfig-012-20240810   gcc-12
i386                  randconfig-012-20240811   gcc-12
i386                  randconfig-013-20240810   clang-18
i386                  randconfig-013-20240811   gcc-12
i386                  randconfig-014-20240810   gcc-12
i386                  randconfig-014-20240811   gcc-12
i386                  randconfig-015-20240810   gcc-12
i386                  randconfig-015-20240811   gcc-12
i386                  randconfig-016-20240810   gcc-12
i386                  randconfig-016-20240811   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240811   gcc-13.2.0
loongarch             randconfig-002-20240811   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                         bigsur_defconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                          eyeq6_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                        vocore2_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240811   gcc-13.2.0
nios2                 randconfig-002-20240811   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240811   gcc-13.2.0
parisc                randconfig-002-20240811   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240811   gcc-13.2.0
powerpc               randconfig-003-20240811   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc                     tqm8541_defconfig   gcc-13.2.0
powerpc64                        alldefconfig   gcc-13.2.0
powerpc64             randconfig-001-20240811   gcc-13.2.0
powerpc64             randconfig-002-20240811   gcc-13.2.0
powerpc64             randconfig-003-20240811   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240811   gcc-13.2.0
riscv                 randconfig-002-20240811   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240811   gcc-13.2.0
s390                  randconfig-002-20240811   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-13.2.0
sh                    randconfig-001-20240811   gcc-13.2.0
sh                    randconfig-002-20240811   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-13.2.0
sparc64                          alldefconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240811   gcc-13.2.0
sparc64               randconfig-002-20240811   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240811   gcc-13.2.0
um                    randconfig-002-20240811   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240811   gcc-12
x86_64       buildonly-randconfig-002-20240811   gcc-12
x86_64       buildonly-randconfig-003-20240811   gcc-12
x86_64       buildonly-randconfig-004-20240811   gcc-12
x86_64       buildonly-randconfig-005-20240811   gcc-12
x86_64       buildonly-randconfig-006-20240811   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240811   gcc-12
x86_64                randconfig-002-20240811   gcc-12
x86_64                randconfig-003-20240811   gcc-12
x86_64                randconfig-004-20240811   gcc-12
x86_64                randconfig-005-20240811   gcc-12
x86_64                randconfig-006-20240811   gcc-12
x86_64                randconfig-011-20240811   gcc-12
x86_64                randconfig-012-20240811   gcc-12
x86_64                randconfig-013-20240811   gcc-12
x86_64                randconfig-014-20240811   gcc-12
x86_64                randconfig-015-20240811   gcc-12
x86_64                randconfig-016-20240811   gcc-12
x86_64                randconfig-071-20240811   gcc-12
x86_64                randconfig-072-20240811   gcc-12
x86_64                randconfig-073-20240811   gcc-12
x86_64                randconfig-074-20240811   gcc-12
x86_64                randconfig-075-20240811   gcc-12
x86_64                randconfig-076-20240811   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240811   gcc-13.2.0
xtensa                randconfig-002-20240811   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

