Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5121CD7361B
	for <ath12k@archiver.kernel.org>; Sun,  1 Dec 2024 00:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5at3/8WBR3fH3h74nq0oPGFTZr5Hkf8d5JQH9WHQtrM=; b=LAvMk4ekjMNBXpL68psZnr0Mn1
	6UgpyEEaj1VQYL2KnOhN3ipOKv95pWQi2Kwg3O9ZRw2lPS6Ks5wSWahuJDTKDv4crcmCZlVrP1Mc5
	UcWGbo3+2sdSsYrY/TJKm+fBXRsa9yAlRpHtye00F39qjnr1FD0hqLggaLzXObGpRjCLPLhb3dt+L
	NBvYGV7QvfBEIHdgWFV/5K1fjdbUFnzcKiAkTWg4CsVBuSijaHCupjvTobYXcViLDcztl0jHtWCHX
	NLf/kSPhtqE/FwOejVWWkfEP4UPc0EYZZPe3D5rfI2eWE3pOAVooi51YH5oXDiYKUWjooZWlVfV3B
	qI/dRKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXjk-00000002nSR-0Kwh
	for ath12k@archiver.kernel.org;
	Sun, 01 Dec 2024 00:22:56 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXjh-00000002nS6-2q9T
	for ath12k@lists.infradead.org;
	Sun, 01 Dec 2024 00:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733012574; x=1764548574;
  h=date:from:to:cc:subject:message-id;
  bh=y2Y/pSSlmh8NXfFd0T5Nr26O4HgMVWPsr4v/OsdI8wE=;
  b=GJJ7O4+xiWejdQ3eHs7o0ppTKbqQ2sMyZH9MU3pcFAu+82bPhXRcAChT
   ly7xSCXjchhRcqfztQEBfKTbzSXJ+5TW6VbewmM7+r/zweMwvwJVEPUl8
   xfYpFqDj/FEHQ/pdmjXyePlClV1KYXK+ABqYXnAMtK6hYSTXzJsmBxNte
   wTdIQooOs7G6xVq8OfdZ8yGm0gXhtYURwFeh+crvpNHGsnkIAPX1sltQ9
   5ecHFcxe8GC+ND+qEG6NQTL50siDfCUfeQtnOlTOw3CJfxF+0MJS+s7hW
   aZIjA0W88OhEWft6b8o1pGOFnlPdD3iayfjpu9EYNqRncxpxfu4ljXsAz
   w==;
X-CSE-ConnectionGUID: +sAq0sULT0ufzsgRuazQlA==
X-CSE-MsgGUID: xsSLGyOBSXSniah0gRQpxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36863480"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="36863480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 16:22:51 -0800
X-CSE-ConnectionGUID: tfDo2pzzQW+Vp63CsYGEsg==
X-CSE-MsgGUID: ItNq+OQAQpy+T+tpVXRCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92926264"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Nov 2024 16:22:49 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHXjb-00014L-2H;
	Sun, 01 Dec 2024 00:22:47 +0000
Date: Sun, 01 Dec 2024 08:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 088e305243e1b3ca74c0c11862ae92e383dc4e76
Message-ID: <202412010847.4mpDPdQU-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_162253_759950_36527E66 
X-CRM114-Status: UNSURE (   3.54  )
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
branch HEAD: 088e305243e1b3ca74c0c11862ae92e383dc4e76  Add localversion-wireless-testing-ath

elapsed time: 721m

configs tested: 158
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20241130    gcc-13.2.0
arc                   randconfig-002-20241130    gcc-13.2.0
arc                           tb10x_defconfig    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-20
arm                       imx_v4_v5_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                        multi_v5_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20241130    gcc-14.2.0
arm                   randconfig-002-20241130    gcc-14.2.0
arm                   randconfig-003-20241130    gcc-14.2.0
arm                   randconfig-004-20241130    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                           sama7_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241130    gcc-14.2.0
arm64                 randconfig-002-20241130    clang-20
arm64                 randconfig-003-20241130    clang-17
arm64                 randconfig-004-20241130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          alldefconfig    clang-15
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241130    clang-19
i386        buildonly-randconfig-002-20241130    clang-19
i386        buildonly-randconfig-003-20241130    gcc-12
i386        buildonly-randconfig-004-20241130    gcc-12
i386        buildonly-randconfig-005-20241130    clang-19
i386        buildonly-randconfig-006-20241130    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-20
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-20
mips                          ath79_defconfig    gcc-14.2.0
mips                           ci20_defconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-15
mips                        qi_lb60_defconfig    gcc-14.2.0
mips                           xway_defconfig    gcc-14.2.0
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-20
powerpc                       ppc64_defconfig    clang-20
powerpc                      ppc64e_defconfig    clang-20
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     taishan_defconfig    clang-20
powerpc                     tqm8541_defconfig    clang-15
powerpc                        warp_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    clang-20
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    clang-20
sh                        edosk7705_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    clang-20
sh                          landisk_defconfig    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
x86_64      buildonly-randconfig-001-20241130    gcc-12
x86_64      buildonly-randconfig-002-20241130    clang-19
x86_64      buildonly-randconfig-003-20241130    gcc-12
x86_64      buildonly-randconfig-004-20241130    clang-19
x86_64      buildonly-randconfig-005-20241130    gcc-12
x86_64      buildonly-randconfig-006-20241130    gcc-12
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-20
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

