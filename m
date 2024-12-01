Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E988BD73619
	for <ath12k@archiver.kernel.org>; Sun,  1 Dec 2024 00:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJZIk1VWiIcBaCyoePikljC91skwDk8Pb09aurMziew=; b=eMpYv2c4BMN1qPPB4obb6J4wv5
	jD7Jwe3jotW/coCxqGzAj4DV01iL/yun2M2jIv5K7HkWRedVLqyJJ9Kxboz7IE3fpvdByC9341Pfx
	ukK4jo1CUAshBqE68fZZkEMnXrlKSXkNM+Fy/eHA4IWp9n+hOoAoDS6jiJ/XedMcw0MogHYPK/zes
	HrnAv2DZSwxLcewLLSGxkx6kuP0HUbDTM1ufFTEe5Jx7vTDsJtj5d2xuAtbB6C4L4ygCNy9TuiyqU
	kVUbypa8NE4hkEwVm5PwDZviwvOrwkSMMkBLbMdxYR2cQJV2RAyCsw1IZGTmoPaK83+2YBXKstRMx
	oQxsHpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXio-00000002nON-2o6W
	for ath12k@archiver.kernel.org;
	Sun, 01 Dec 2024 00:21:58 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXil-00000002nNx-3IE9
	for ath12k@lists.infradead.org;
	Sun, 01 Dec 2024 00:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733012516; x=1764548516;
  h=date:from:to:cc:subject:message-id;
  bh=h3cSox36rurEcT5Omgp0FZEx5xmrVwXlXuuNhOnwGqQ=;
  b=G9SuI5AEuGL4M4PfOsFEUJzE2Pjsmdq8hxLtSv+8ox2n9YiDxf1I+6E4
   6M0bWWteS7TvP5WXXHyJxcdSr7umOsjWwze59JlZsKgnYMmwHgi7D51Uu
   FCaK3rR1X9wRk9l+d8r5B5nCBs/sh6Q+C78ZUr1zAieLup6m8bVgqxbg7
   UChwQSL/0eemAz6Ez6Qd6R+r+Y6Rw2P1xMpkDiIc6dGOK3FKEno8n1+15
   1MQjG4kO9IjDOiv8ORObsCCSMz1U5707ugCp95cyo9GjlhWrwYoby6AOe
   vy28Xq9B9Da9OMZIPvVZET9PvlOTgK+r1CBuCkVRq9UEls9etOS/ifUhR
   w==;
X-CSE-ConnectionGUID: kla699YfSF6WRT9ETURKjw==
X-CSE-MsgGUID: V/M6ElEUSYe6dPwrcFx3UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33132854"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33132854"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 16:21:51 -0800
X-CSE-ConnectionGUID: vZKwMJIkSSibYLGKDDJm2g==
X-CSE-MsgGUID: TX0J/TWhRYyLFa1IDEkg3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="96842168"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Nov 2024 16:21:50 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHXid-00014H-23;
	Sun, 01 Dec 2024 00:21:47 +0000
Date: Sun, 01 Dec 2024 08:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 45e72c306c08d59d0dc42238a8571bbbf04823f5
Message-ID: <202412010831.wkMBLuEg-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_162155_867882_78BBFF4B 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 45e72c306c08d59d0dc42238a8571bbbf04823f5  wifi: ath12k: introduce QMI firmware ready flag

elapsed time: 721m

configs tested: 145
configs skipped: 16

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
arc                          axs101_defconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                   randconfig-001-20241130    gcc-13.2.0
arc                   randconfig-002-20241130    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                     davinci_all_defconfig    clang-20
arm                       imx_v4_v5_defconfig    clang-20
arm                           imxrt_defconfig    clang-20
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                        multi_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20241130    gcc-14.2.0
arm                   randconfig-002-20241130    gcc-14.2.0
arm                   randconfig-003-20241130    gcc-14.2.0
arm                   randconfig-004-20241130    gcc-14.2.0
arm                           sama7_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241130    gcc-14.2.0
arm64                 randconfig-002-20241130    clang-20
arm64                 randconfig-003-20241130    clang-17
arm64                 randconfig-004-20241130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241130    clang-19
i386        buildonly-randconfig-002-20241130    clang-19
i386        buildonly-randconfig-003-20241130    gcc-12
i386        buildonly-randconfig-004-20241130    gcc-12
i386        buildonly-randconfig-005-20241130    clang-19
i386        buildonly-randconfig-006-20241130    clang-19
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
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-20
mips                           ci20_defconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-15
mips                           mtx1_defconfig    clang-16
mips                        qi_lb60_defconfig    gcc-14.2.0
mips                           xway_defconfig    clang-20
mips                           xway_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                     mpc5200_defconfig    clang-14
powerpc                      pasemi_defconfig    clang-20
powerpc                       ppc64_defconfig    clang-20
powerpc                      ppc64e_defconfig    clang-20
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    clang-20
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    clang-20
sh                 kfr2r09-romimage_defconfig    clang-20
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                           x86_64_defconfig    clang-15
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

