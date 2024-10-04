Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A67CF8843
	for <ath12k@archiver.kernel.org>; Fri,  4 Oct 2024 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PPkEEubB+Qn7f17MVY71oPegIujKTX2Ut2BdJPkA/4Q=; b=Ta4t5/nBWPbt71PeQVE7BxJlkM
	RkjDG43yaPcfNnr1bQWqGQE7m19twGdLA8LpXahXyMV/s+hL6w8lrY7VsX2kTeSGAU0jh22cqNczv
	atb+h3ubpD4RwrcG7twQf562nVrp9PRzJNm7OAQ6x7JGWaPkp2cMSFXPy3VTWURkCNC2vb1uYObs1
	tD3tCLbkUx7QyYLKJ3g2YCGt834iKH6e0pc4L3ynef7Wz1O6AzoqSYoGMVPyouWI5NF/xTSdklVie
	hHoRyV8AxC3R+9LLBEtFcMftYl4w+pIQLxef9zvjYflt9A1Od3dWDC6CbjhcRsW+nnQ5QOFdAh5aG
	5V1Foasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swjlx-0000000CtpS-3W3A
	for ath12k@archiver.kernel.org;
	Fri, 04 Oct 2024 14:59:13 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swjhN-0000000CsYb-3gjr
	for ath12k@lists.infradead.org;
	Fri, 04 Oct 2024 14:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728053670; x=1759589670;
  h=date:from:to:cc:subject:message-id;
  bh=9F5AHuu+sbAUK5drU3ocyMY9zJqjwca5NYKdMVDUd3c=;
  b=dKIC0509KGbeV/2wwinzcYZOzlmWIpbIq9Unno3MI3xi1wBiMHtC5oIE
   f3jyPZwJ6JT8lzLKI+EEsThTBpH1URSIfFGKI39p8tkqr6zeYdlETrzXO
   UCPuDZjjUBhQE/u2FKsMp8t/qtwoMZaJ5aZKHFnsBO9+NI4f27O2K5FUs
   XLgdsdIEk4U5c0JBFJlbxDO8aslF1c6A0IzMsJztYKOsURoduknzWm2d9
   DtW2g05Sy5mP5liX82tUwNt6uHmuL9FDOUb4zXdB7JmoBToKWcdk8+LHq
   sbBpD73/N2P67Vkiu0kPNecW1wOUyvRwSo8PYbyjIox29ZVQDX08pjgr+
   Q==;
X-CSE-ConnectionGUID: 7wU2P+4kS6imYlnX/7+hGQ==
X-CSE-MsgGUID: mrykupecSk+gwkCigEHjFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26746439"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="26746439"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:54:24 -0700
X-CSE-ConnectionGUID: xJdWFBdwTt2bMbwnc+JYhg==
X-CSE-MsgGUID: muVHTYR9Tz+Mdejpp3s9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74719627"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Oct 2024 07:54:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swjhE-0001ms-2y;
	Fri, 04 Oct 2024 14:54:20 +0000
Date: Fri, 04 Oct 2024 22:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-preparation] BUILD SUCCESS
 33d69326329ca2646b5d2d9e990b9e536149d789
Message-ID: <202410042240.RpgMsMRu-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_075429_964683_71D6CFF1 
X-CRM114-Status: UNSURE (   3.46  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-preparation
branch HEAD: 33d69326329ca2646b5d2d9e990b9e536149d789  wifi: cfg80211: check radio iface combination for multi radio per wiphy

elapsed time: 1592m

configs tested: 123
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20241004    gcc-13.2.0
arc                   randconfig-002-20241004    gcc-13.2.0
arm                              alldefconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                          gemini_defconfig    clang-20
arm                        multi_v5_defconfig    gcc-14.1.0
arm                   randconfig-001-20241004    clang-20
arm                   randconfig-002-20241004    clang-20
arm                   randconfig-003-20241004    clang-20
arm                   randconfig-004-20241004    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20241004    gcc-14.1.0
arm64                 randconfig-002-20241004    gcc-14.1.0
arm64                 randconfig-003-20241004    gcc-14.1.0
arm64                 randconfig-004-20241004    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20241004    gcc-14.1.0
csky                  randconfig-002-20241004    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241004    clang-20
hexagon               randconfig-002-20241004    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241004    clang-18
i386        buildonly-randconfig-002-20241004    gcc-12
i386        buildonly-randconfig-003-20241004    gcc-12
i386        buildonly-randconfig-004-20241004    gcc-12
i386        buildonly-randconfig-005-20241004    clang-18
i386        buildonly-randconfig-006-20241004    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241004    gcc-12
i386                  randconfig-002-20241004    clang-18
i386                  randconfig-003-20241004    gcc-12
i386                  randconfig-004-20241004    gcc-12
i386                  randconfig-005-20241004    gcc-12
i386                  randconfig-006-20241004    gcc-12
i386                  randconfig-011-20241004    clang-18
i386                  randconfig-012-20241004    clang-18
i386                  randconfig-013-20241004    clang-18
i386                  randconfig-014-20241004    gcc-12
i386                  randconfig-015-20241004    clang-18
i386                  randconfig-016-20241004    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20241004    gcc-14.1.0
loongarch             randconfig-002-20241004    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           jazz_defconfig    clang-20
mips                    maltaup_xpa_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20241004    gcc-14.1.0
nios2                 randconfig-002-20241004    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20241004    gcc-14.1.0
parisc                randconfig-002-20241004    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                 mpc836x_rdk_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-20
powerpc               randconfig-001-20241004    clang-20
powerpc               randconfig-002-20241004    gcc-14.1.0
powerpc               randconfig-003-20241004    clang-20
powerpc                     tqm8560_defconfig    gcc-14.1.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241004    gcc-14.1.0
powerpc64             randconfig-002-20241004    clang-16
powerpc64             randconfig-003-20241004    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                               j2_defconfig    gcc-14.1.0
sh                          rsk7264_defconfig    gcc-14.1.0
sh                          sdk7786_defconfig    gcc-14.1.0
sh                           se7751_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

