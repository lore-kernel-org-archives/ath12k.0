Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598DDE674A7
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 05:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AgexwulswGUrFj8HUekFY5ZolWfr8xPWdKbr+SaMwI8=; b=aDg+J+6Qq2xKZV8uWIRwidqfkw
	uT2T0iujb2Qphp/VHL8QXUMXlDte0/kVYUynktwnzba4MqbukC/JQqBsg5ygSOVyiad/klsltZJ7s
	nx1mcmxLcLQP9OHdNVM/aDMhxrSjTDQVsxIdLfXj5kFmRtw6exc1iApV3KCyXorr9kSgERMEMuRHy
	aErCcn6J7lV8n33nuqr4b3OkuCje1ARmBl6IZMYoVVI9in0e89g1stDIK1BuXXQwe+3A31/6dErV4
	Gk7Q9PEJAdoZVg5h+b0Tf05RYMtuI63aUd6r2FzFWA8WB/MmIMvpmdScKzLG75Kxj0uL9MU4xCeoS
	ke3w7KVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kaz-00000005shX-3Zwg
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 05:53:17 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kaw-00000005sgo-19P9
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 05:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730440395; x=1761976395;
  h=date:from:to:cc:subject:message-id;
  bh=lqOiCfbk8iRgiDnaEIWcE1zn5P44y5WyicHJViLzqYw=;
  b=ZZJJ/hu6TrPvyVfGlzDVvyHNcUZniPneYkX6dJc+FtD+NbV2qmDBiH+8
   qi714t906izQ08vifO1Tdu4x17gUA96qXpxfoqL/PA+G9jeA+d9B7YceK
   cdK7c46Kn+dy0feFQVHCeNt2J2xXDi4/wx0Rts4u4WzyLwgjlh3kX2YED
   tNppWMvvAgvCiwzxAtN7zmDUlQrvEn3uoYH1nxJa4VXHJ9dk7PUhHqu99
   2gpvpA9PJuVk+ifuUJDOGaYB0pRn1wjkZvrA5gAEmf6p1o8pSjxiY8sCm
   9NnjUqaLppU4lTGy/aZ1+qGNkFsTooWQ7VmE1Ie0XYb0Ksava0JQnT/xY
   w==;
X-CSE-ConnectionGUID: XTIf2uTXRQyG1ZxkOTtDfg==
X-CSE-MsgGUID: wiqyIZMESWSwdSihUlIzVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30316381"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="30316381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 22:53:11 -0700
X-CSE-ConnectionGUID: XBBDqN3oSli/0Bj7+K+d0A==
X-CSE-MsgGUID: MN79FmtJQnuNF05Bo1wDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="83298093"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Oct 2024 22:53:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6kap-000hCH-0i;
	Fri, 01 Nov 2024 05:53:07 +0000
Date: Fri, 01 Nov 2024 13:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 b8ef20ee33a6d1cfd8b6da1ff51455a0ef95f10e
Message-ID: <202411011352.H8YmOGTH-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_225314_388775_D2D9CF6A 
X-CRM114-Status: UNSURE (   3.89  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: b8ef20ee33a6d1cfd8b6da1ff51455a0ef95f10e  wifi: ath12k: advertise MLO support and capabilities

elapsed time: 1982m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241101    clang-19
i386        buildonly-randconfig-001-20241101    gcc-12
i386        buildonly-randconfig-002-20241101    gcc-12
i386        buildonly-randconfig-003-20241101    clang-19
i386        buildonly-randconfig-003-20241101    gcc-12
i386        buildonly-randconfig-004-20241101    gcc-12
i386        buildonly-randconfig-005-20241101    clang-19
i386        buildonly-randconfig-005-20241101    gcc-12
i386        buildonly-randconfig-006-20241101    clang-19
i386        buildonly-randconfig-006-20241101    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241101    clang-19
i386                  randconfig-001-20241101    gcc-12
i386                  randconfig-002-20241101    gcc-12
i386                  randconfig-003-20241101    gcc-11
i386                  randconfig-003-20241101    gcc-12
i386                  randconfig-004-20241101    gcc-12
i386                  randconfig-005-20241101    clang-19
i386                  randconfig-005-20241101    gcc-12
i386                  randconfig-006-20241101    gcc-12
i386                  randconfig-011-20241101    gcc-12
i386                  randconfig-012-20241101    gcc-12
i386                  randconfig-013-20241101    clang-19
i386                  randconfig-013-20241101    gcc-12
i386                  randconfig-014-20241101    gcc-11
i386                  randconfig-014-20241101    gcc-12
i386                  randconfig-015-20241101    clang-19
i386                  randconfig-015-20241101    gcc-12
i386                  randconfig-016-20241101    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                      mmu_defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ci20_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                    or1ksim_defconfig    gcc-14.1.0
openrisc                 simple_smp_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                      ppc44x_defconfig    gcc-14.1.0
powerpc                         wii_defconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                            titan_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
x86_64                           alldefconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241101    gcc-12
x86_64      buildonly-randconfig-002-20241101    clang-19
x86_64      buildonly-randconfig-003-20241101    gcc-12
x86_64      buildonly-randconfig-004-20241101    clang-19
x86_64      buildonly-randconfig-005-20241101    gcc-12
x86_64      buildonly-randconfig-006-20241101    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241101    gcc-12
x86_64                randconfig-002-20241101    clang-19
x86_64                randconfig-003-20241101    gcc-12
x86_64                randconfig-004-20241101    clang-19
x86_64                randconfig-005-20241101    clang-19
x86_64                randconfig-006-20241101    gcc-12
x86_64                randconfig-011-20241101    clang-19
x86_64                randconfig-012-20241101    clang-19
x86_64                randconfig-013-20241101    clang-19
x86_64                randconfig-014-20241101    gcc-12
x86_64                randconfig-015-20241101    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                         virt_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

