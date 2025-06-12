Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64436C71136
	for <ath12k@archiver.kernel.org>; Thu, 12 Jun 2025 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fN4WKPCWTGPyCN+DEr39t/SkaE7Ax3CVvj/FxamMMz0=; b=4iQ5avyYit/RcUOHFPs1hajLFv
	wg4PtyHaT/vmWEY5/P1UXsvBREXtJnpv5JdU5DHcJksfSUtuAhTVXicDoEJMzGrd0U2aJBbJakNni
	UHoWDPSjM1iXEfdPVzzV+vkgBrfniAqNtxgG5DkhlQhdalLE0tDKS+eYRPOuP3QXmnsjuFU5mjLnk
	hPaWRPDVAb124I22wp0/roU8qOzH4hPADKuFtjo/E2qgKcGQRHCBVj9B3IV/YB3tSu599bXKLfw1/
	/gVThcWciku347xCkenmqYXgglUP17oIODFi0YQFaqvaPp2WbrkcpRIDgPgw1YalWmAMagjSdzaeS
	wSNVJT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhts-0000000DRJc-0czc;
	Thu, 12 Jun 2025 13:23:24 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhQe-0000000DJAg-2xt9
	for ath12k@lists.infradead.org;
	Thu, 12 Jun 2025 12:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749732792; x=1781268792;
  h=date:from:to:cc:subject:message-id;
  bh=9kdmeYQE0J/fkiYUHyNx0IUxdv+UHUpJ0TjezysYdDU=;
  b=hlLO42l3YEW89J6nJuzskrEqIQXidXWuGwt6BZB5b9P412RfMEknoTSY
   097y3L72EN8CYa5IQlUp8tcmcrLUdly2qX4X4lM/7UNjtXbi+CncZTZVv
   yWFVKGvDyfZCDvQlBPkYg4kEl+5M+EYKTB5QQa6Zu86owAj0cQMfFmpGl
   jIbdLqAYT2/0I5bIAp5MR2qXeJNTCnT9I98nd98DIIFRv1xjMbtw3n3aq
   pNNkyuGzUB+0dA3pQr38rsXlqbkm7s8Y90deDGyE4xJts7+Rr5XfdRsWC
   QOLMkDuxvYODdtFEAR/kI4v0ybjYxyv5Q6pMw6iuddLsBqCaRoU9i0G/h
   g==;
X-CSE-ConnectionGUID: OhczWm5sQ8GIx6mWKcouUg==
X-CSE-MsgGUID: vuWNO3fTQ1Shx6xPhtEBcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52056646"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="52056646"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:53:12 -0700
X-CSE-ConnectionGUID: rOa67p2XQuap9Lq8b/zf5w==
X-CSE-MsgGUID: Ry8hob4hRZmMvw0XVkHjXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="148404546"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jun 2025 05:53:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPhQa-000BXi-39;
	Thu, 12 Jun 2025 12:53:08 +0000
Date: Thu, 12 Jun 2025 20:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending-deferred] BUILD SUCCESS
 da3d1404b46ca28072ff36082d45fd99fbd3ac9d
Message-ID: <202506122036.QPd3LhN8-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_055312_803760_8CBF4E83 
X-CRM114-Status: UNSURE (   4.05  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
branch HEAD: da3d1404b46ca28072ff36082d45fd99fbd3ac9d  wifi: ath12k: Decrement TID on RX peer frag setup error handling

elapsed time: 1202m

configs tested: 217
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250612    gcc-8.5.0
arc                   randconfig-002-20250612    gcc-10.5.0
arc                   randconfig-002-20250612    gcc-8.5.0
arc                        vdk_hs38_defconfig    clang-21
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                            mmp2_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250612    clang-21
arm                   randconfig-001-20250612    gcc-8.5.0
arm                   randconfig-002-20250612    clang-18
arm                   randconfig-002-20250612    gcc-8.5.0
arm                   randconfig-003-20250612    clang-21
arm                   randconfig-003-20250612    gcc-8.5.0
arm                   randconfig-004-20250612    clang-21
arm                   randconfig-004-20250612    gcc-8.5.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250612    clang-19
arm64                 randconfig-001-20250612    gcc-8.5.0
arm64                 randconfig-002-20250612    clang-17
arm64                 randconfig-002-20250612    gcc-8.5.0
arm64                 randconfig-003-20250612    clang-21
arm64                 randconfig-003-20250612    gcc-8.5.0
arm64                 randconfig-004-20250612    clang-18
arm64                 randconfig-004-20250612    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250612    gcc-10.5.0
csky                  randconfig-001-20250612    gcc-11.5.0
csky                  randconfig-002-20250612    gcc-10.5.0
csky                  randconfig-002-20250612    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250612    clang-21
hexagon               randconfig-001-20250612    gcc-10.5.0
hexagon               randconfig-002-20250612    clang-21
hexagon               randconfig-002-20250612    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250612    clang-20
i386        buildonly-randconfig-002-20250612    clang-20
i386        buildonly-randconfig-002-20250612    gcc-12
i386        buildonly-randconfig-003-20250612    clang-20
i386        buildonly-randconfig-004-20250612    clang-20
i386        buildonly-randconfig-005-20250612    clang-20
i386        buildonly-randconfig-006-20250612    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250612    gcc-12
i386                  randconfig-002-20250612    gcc-12
i386                  randconfig-003-20250612    gcc-12
i386                  randconfig-004-20250612    gcc-12
i386                  randconfig-005-20250612    gcc-12
i386                  randconfig-006-20250612    gcc-12
i386                  randconfig-007-20250612    gcc-12
i386                  randconfig-011-20250612    gcc-12
i386                  randconfig-012-20250612    gcc-12
i386                  randconfig-013-20250612    gcc-12
i386                  randconfig-014-20250612    gcc-12
i386                  randconfig-015-20250612    gcc-12
i386                  randconfig-016-20250612    gcc-12
i386                  randconfig-017-20250612    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250612    gcc-10.5.0
loongarch             randconfig-001-20250612    gcc-13.3.0
loongarch             randconfig-002-20250612    gcc-10.5.0
loongarch             randconfig-002-20250612    gcc-12.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    clang-21
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip28_defconfig    clang-21
mips                           jazz_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250612    gcc-10.5.0
nios2                 randconfig-001-20250612    gcc-14.2.0
nios2                 randconfig-002-20250612    gcc-10.5.0
nios2                 randconfig-002-20250612    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250612    gcc-10.5.0
parisc                randconfig-001-20250612    gcc-8.5.0
parisc                randconfig-002-20250612    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250612    clang-21
powerpc               randconfig-001-20250612    gcc-10.5.0
powerpc               randconfig-002-20250612    gcc-10.5.0
powerpc               randconfig-002-20250612    gcc-8.5.0
powerpc               randconfig-003-20250612    clang-17
powerpc               randconfig-003-20250612    gcc-10.5.0
powerpc                  storcenter_defconfig    clang-21
powerpc                     taishan_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250612    gcc-10.5.0
powerpc64             randconfig-001-20250612    gcc-12.4.0
powerpc64             randconfig-002-20250612    clang-21
powerpc64             randconfig-002-20250612    gcc-10.5.0
powerpc64             randconfig-003-20250612    clang-21
powerpc64             randconfig-003-20250612    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250612    clang-21
riscv                 randconfig-001-20250612    gcc-12.4.0
riscv                 randconfig-002-20250612    clang-21
riscv                 randconfig-002-20250612    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250612    clang-21
s390                  randconfig-001-20250612    gcc-12.4.0
s390                  randconfig-002-20250612    gcc-11.5.0
s390                  randconfig-002-20250612    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250612    gcc-12.4.0
sh                    randconfig-002-20250612    gcc-12.4.0
sh                    randconfig-002-20250612    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                          urquell_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250612    gcc-12.4.0
sparc                 randconfig-001-20250612    gcc-14.3.0
sparc                 randconfig-002-20250612    gcc-10.3.0
sparc                 randconfig-002-20250612    gcc-12.4.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250612    gcc-12.4.0
sparc64               randconfig-001-20250612    gcc-13.3.0
sparc64               randconfig-002-20250612    gcc-12.4.0
sparc64               randconfig-002-20250612    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250612    clang-17
um                    randconfig-001-20250612    gcc-12.4.0
um                    randconfig-002-20250612    clang-21
um                    randconfig-002-20250612    gcc-12.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250612    clang-20
x86_64      buildonly-randconfig-001-20250612    gcc-12
x86_64      buildonly-randconfig-002-20250612    clang-20
x86_64      buildonly-randconfig-003-20250612    clang-20
x86_64      buildonly-randconfig-003-20250612    gcc-12
x86_64      buildonly-randconfig-004-20250612    clang-20
x86_64      buildonly-randconfig-004-20250612    gcc-12
x86_64      buildonly-randconfig-005-20250612    clang-20
x86_64      buildonly-randconfig-006-20250612    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250612    clang-20
x86_64                randconfig-002-20250612    clang-20
x86_64                randconfig-003-20250612    clang-20
x86_64                randconfig-004-20250612    clang-20
x86_64                randconfig-005-20250612    clang-20
x86_64                randconfig-006-20250612    clang-20
x86_64                randconfig-007-20250612    clang-20
x86_64                randconfig-008-20250612    clang-20
x86_64                randconfig-071-20250612    gcc-12
x86_64                randconfig-072-20250612    gcc-12
x86_64                randconfig-073-20250612    gcc-12
x86_64                randconfig-074-20250612    gcc-12
x86_64                randconfig-075-20250612    gcc-12
x86_64                randconfig-076-20250612    gcc-12
x86_64                randconfig-077-20250612    gcc-12
x86_64                randconfig-078-20250612    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250612    gcc-10.5.0
xtensa                randconfig-001-20250612    gcc-12.4.0
xtensa                randconfig-002-20250612    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

