Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DFFD59F52
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WVwFuntX4xbrIBZnvw8HyCXKhgVVb/0xxf49ZrUCJIA=; b=L/m7/jJtc03x28mY2cVjG+Ad/G
	FfA/bg1PW+tevl0V/jDaiOW2tvw6k54G6iLsT6jnxmZBaIQ2k9AWyY3Dc1/Hjm9S63I/mZVuHw2JO
	hBv966+WmFEPW3+yU5EyBdcOsfKf82XHpYngjG/kwqZNZeFYC8xsE6vM2I+4gEaMoVIpvhraG/eJm
	pPOHx4A/a4wzCO/koI7AYPNOdT3GHt62SmRO+4IHKhgwA6THsDFcEWQ+8knTsB1Yc+nxufv6Ww5Sk
	fEYFnIdH8NAgRI6gqNPKXnIX7Jp/eg+UPnYLfeYUpNLtMmZkMuq9vX8kxBMJwiJDoE8cAz9CBctS2
	tiIrIhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8izF-000000042mH-3lXe
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 16:34:29 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8izC-000000042li-2tAC
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 16:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730910867; x=1762446867;
  h=date:from:to:cc:subject:message-id;
  bh=eeMbyBde67pIZOJYgZa7OFR4JVHTWtz2fzepfDjFchY=;
  b=PiEXNZXCz6rlpLbu6n+D6XSpzstboNGEZldYmyWie+95yeVtb56lAeuc
   mIbnH0igVZn8PWJz2R1ZOmkvE+c2iboxcWDrFmbOSeOnJzI81xuQ8mpDc
   +N9VkfL+yE7PyMgqS4Ac3/RZ9IMW1ytsQOI+T0stknYOTvwLuL/E+TJe1
   OI15ILVk2P+0bdJI9vc7Ur1+i2v7cAqQAILw+2Lw7351YzB25WI0vIXDM
   s2zfoBIw+fkLDkgAZnC3an8Cp7u3E1Mqo1qt4D7Nv3jWLMX/N1xlkPZyT
   hsC/exWSsHWKXrnathyZ/WZXpdrm5uTB+CFNB4Jhq/xBrgagxG0Ycdok5
   w==;
X-CSE-ConnectionGUID: 3hjmaV6cTYea+kvNvZcx6A==
X-CSE-MsgGUID: ZTfcv7DQRR66ECBvVpBKJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30576815"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30576815"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:34:24 -0800
X-CSE-ConnectionGUID: tQpNSu9NTmaGMAuVHWiznA==
X-CSE-MsgGUID: E+jjYYypSUinyDtYgwTf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89221054"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2024 08:34:23 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8iz7-000p8M-0F;
	Wed, 06 Nov 2024 16:34:21 +0000
Date: Thu, 07 Nov 2024 00:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 7cc33d31e0b34413c2850787fd13c41da1e6a245
Message-ID: <202411070006.9KKbzdRR-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_083426_801318_28A3585C 
X-CRM114-Status: UNSURE (   4.28  )
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
branch HEAD: 7cc33d31e0b34413c2850787fd13c41da1e6a245  wifi: ath12k: advertise MLO support and capabilities

elapsed time: 1236m

configs tested: 149
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                            hsdk_defconfig    gcc-13.2.0
arc                   randconfig-001-20241106    gcc-13.2.0
arc                   randconfig-002-20241106    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-20
arm                   randconfig-001-20241106    gcc-14.2.0
arm                   randconfig-002-20241106    clang-20
arm                   randconfig-003-20241106    clang-20
arm                   randconfig-004-20241106    clang-17
arm                           sama5_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241106    gcc-14.2.0
arm64                 randconfig-002-20241106    gcc-14.2.0
arm64                 randconfig-003-20241106    clang-20
arm64                 randconfig-004-20241106    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241106    gcc-14.2.0
csky                  randconfig-002-20241106    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241106    clang-14
hexagon               randconfig-002-20241106    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241106    clang-19
i386        buildonly-randconfig-002-20241106    clang-19
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-004-20241106    clang-19
i386        buildonly-randconfig-005-20241106    clang-19
i386        buildonly-randconfig-006-20241106    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241106    clang-19
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-005-20241106    clang-19
i386                  randconfig-006-20241106    clang-19
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-015-20241106    clang-19
i386                  randconfig-016-20241106    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241106    gcc-14.2.0
loongarch             randconfig-002-20241106    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241106    gcc-14.2.0
nios2                 randconfig-002-20241106    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241106    gcc-14.2.0
parisc                randconfig-002-20241106    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241106    gcc-14.2.0
powerpc               randconfig-002-20241106    gcc-14.2.0
powerpc               randconfig-003-20241106    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241106    clang-20
powerpc64             randconfig-002-20241106    clang-20
powerpc64             randconfig-003-20241106    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241106    gcc-14.2.0
riscv                 randconfig-002-20241106    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                  randconfig-001-20241106    gcc-14.2.0
s390                  randconfig-002-20241106    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.1.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20241106    gcc-14.2.0
sh                    randconfig-002-20241106    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241106    gcc-14.2.0
sparc64               randconfig-002-20241106    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                    randconfig-001-20241106    clang-20
um                    randconfig-002-20241106    clang-17
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241106    clang-19
x86_64      buildonly-randconfig-002-20241106    clang-19
x86_64      buildonly-randconfig-003-20241106    clang-19
x86_64      buildonly-randconfig-004-20241106    gcc-12
x86_64      buildonly-randconfig-005-20241106    gcc-12
x86_64      buildonly-randconfig-006-20241106    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241106    clang-19
x86_64                randconfig-002-20241106    gcc-11
x86_64                randconfig-003-20241106    gcc-12
x86_64                randconfig-004-20241106    gcc-12
x86_64                randconfig-005-20241106    clang-19
x86_64                randconfig-006-20241106    gcc-11
x86_64                randconfig-011-20241106    gcc-11
x86_64                randconfig-012-20241106    gcc-12
x86_64                randconfig-013-20241106    clang-19
x86_64                randconfig-014-20241106    gcc-12
x86_64                randconfig-015-20241106    gcc-12
x86_64                randconfig-016-20241106    gcc-12
x86_64                randconfig-071-20241106    gcc-12
x86_64                randconfig-072-20241106    gcc-12
x86_64                randconfig-073-20241106    clang-19
x86_64                randconfig-074-20241106    gcc-12
x86_64                randconfig-075-20241106    clang-19
x86_64                randconfig-076-20241106    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241106    gcc-14.2.0
xtensa                randconfig-002-20241106    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

