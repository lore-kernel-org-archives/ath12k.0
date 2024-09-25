Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E149CCF9C71
	for <ath12k@archiver.kernel.org>; Wed, 25 Sep 2024 04:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iS9PKw9a2cjw/M+rqYwtvlX0FcH8CB/cs9MP5FiL4nM=; b=c4NQzskIWmZD7XYTBPZSZi+vx/
	bIXRcWLXD7GAH6m8hQ2oZgAhlfWrZ/TXsi9Z9EG9ZHtBL2dbCQSEMqgDxKALNXxe9c9ON9jsILqKN
	6IZd8WBvMd/WC9Dz+mimS0T2itxal5yJqxDON+6PzGQiWObhJF+PtzPFHnOMgK24RFAdmB81CLw2d
	9hBnYOX0WQnBQeniNGIoY5+2rbuuRJIm2xu7DBY4SxSffHoLXCJiR1BJK0XqOJta7GI+7w4mdEjEK
	8mLCU/b9eC+l8xHwOBcQMCsFewtdP9yQiUSSPCl+9tYDq2oHgSldc0yn1upmjl8LGDVRlhPtCCkp4
	ymNg23pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stJcH-00000003zDj-1zHx
	for ath12k@archiver.kernel.org;
	Wed, 25 Sep 2024 04:27:05 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stJcE-00000003zD7-021f
	for ath12k@lists.infradead.org;
	Wed, 25 Sep 2024 04:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727238422; x=1758774422;
  h=date:from:to:cc:subject:message-id;
  bh=K/B3U+llJsJsT0FdudrWLdp1z1qf+ENuORp8Rf9qAjg=;
  b=RHzPASPDjoqQx1KgJ06VShDlA12sJ67rCB1WBSOVRuOPuD9wZKu+K3fI
   OOTrHQT5ncXxEUbdT4zN//rnG71b+mlJCWQAwlfqh/xtOOh+NSjOYMB+f
   D9/J2ugxDzHg+sgPl+xAwIdLAHHfKMXe3AVO0QpDEILYP8SZaAQrfwJJk
   LsevHHX124ctlZJhZnR07VlX74IVjfUHXQNYhT38cyo1AKBgooZwVAUoJ
   +gthkWy/RuTI6uDSmGQ8SdFILe28L4Z2/2V/rJSDY3/hKJIkfO/jxkmJb
   apsKW6sX7K9zjS3ZAPAeSw66CsFlJGEoKJ9/Q9BRTkUGN2tL15n6haAvK
   w==;
X-CSE-ConnectionGUID: NhpLm13ERiiIJTyCNmsaYg==
X-CSE-MsgGUID: 0Cu61P9GRmCwcZMGVjeKdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26084959"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26084959"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 21:26:59 -0700
X-CSE-ConnectionGUID: F0CVV4YuRG6TXsFFPAYZBQ==
X-CSE-MsgGUID: Dej1/0IIRvyAaBBVepVOOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="76034258"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2024 21:26:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stJc7-000J87-0h;
	Wed, 25 Sep 2024 04:26:55 +0000
Date: Wed, 25 Sep 2024 12:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 7f03e1b207bd7763f8e02113d43f19bb4bd92851
Message-ID: <202409251253.y0IlXHSt-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_212702_185051_A7EBED6E 
X-CRM114-Status: UNSURE (   4.04  )
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
branch HEAD: 7f03e1b207bd7763f8e02113d43f19bb4bd92851  wifi: ath12k: remove warning print in htt mlo offset event message

elapsed time: 877m

configs tested: 209
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20240925    gcc-14.1.0
arc                   randconfig-002-20240925    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                     am200epdkit_defconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    gcc-14.1.0
arm                      jornada720_defconfig    clang-20
arm                             mxs_defconfig    clang-20
arm                        neponset_defconfig    gcc-14.1.0
arm                   randconfig-001-20240925    gcc-14.1.0
arm                   randconfig-002-20240925    gcc-14.1.0
arm                   randconfig-003-20240925    gcc-14.1.0
arm                   randconfig-004-20240925    gcc-14.1.0
arm                         s3c6400_defconfig    clang-20
arm                         s3c6400_defconfig    gcc-14.1.0
arm                         s5pv210_defconfig    gcc-14.1.0
arm                         socfpga_defconfig    gcc-14.1.0
arm                        spear3xx_defconfig    gcc-14.1.0
arm                           tegra_defconfig    clang-20
arm                        vexpress_defconfig    clang-20
arm                        vexpress_defconfig    gcc-14.1.0
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    clang-20
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240925    gcc-14.1.0
arm64                 randconfig-002-20240925    gcc-14.1.0
arm64                 randconfig-003-20240925    gcc-14.1.0
arm64                 randconfig-004-20240925    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240925    gcc-14.1.0
csky                  randconfig-002-20240925    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240925    gcc-14.1.0
hexagon               randconfig-002-20240925    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240925    clang-18
i386        buildonly-randconfig-002-20240925    clang-18
i386        buildonly-randconfig-003-20240925    clang-18
i386        buildonly-randconfig-004-20240925    clang-18
i386        buildonly-randconfig-004-20240925    gcc-12
i386        buildonly-randconfig-005-20240925    clang-18
i386        buildonly-randconfig-006-20240925    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240925    clang-18
i386                  randconfig-001-20240925    gcc-12
i386                  randconfig-002-20240925    clang-18
i386                  randconfig-003-20240925    clang-18
i386                  randconfig-003-20240925    gcc-12
i386                  randconfig-004-20240925    clang-18
i386                  randconfig-005-20240925    clang-18
i386                  randconfig-006-20240925    clang-18
i386                  randconfig-006-20240925    gcc-12
i386                  randconfig-011-20240925    clang-18
i386                  randconfig-011-20240925    gcc-12
i386                  randconfig-012-20240925    clang-18
i386                  randconfig-012-20240925    gcc-12
i386                  randconfig-013-20240925    clang-18
i386                  randconfig-014-20240925    clang-18
i386                  randconfig-015-20240925    clang-18
i386                  randconfig-016-20240925    clang-18
i386                  randconfig-016-20240925    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch                 loongson3_defconfig    clang-20
loongarch             randconfig-001-20240925    gcc-14.1.0
loongarch             randconfig-002-20240925    gcc-14.1.0
m68k                             alldefconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5208evb_defconfig    clang-20
m68k                        m5272c3_defconfig    clang-20
m68k                        m5407c3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    clang-20
mips                        bcm47xx_defconfig    clang-20
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                         cobalt_defconfig    gcc-14.1.0
mips                           ip28_defconfig    clang-20
mips                      malta_kvm_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    clang-20
mips                        qi_lb60_defconfig    gcc-14.1.0
mips                          rb532_defconfig    gcc-14.1.0
mips                           rs90_defconfig    clang-20
mips                   sb1250_swarm_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240925    gcc-14.1.0
nios2                 randconfig-002-20240925    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20240925    gcc-14.1.0
parisc                randconfig-002-20240925    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    clang-20
powerpc                     asp8347_defconfig    clang-20
powerpc                       eiger_defconfig    gcc-14.1.0
powerpc                        icon_defconfig    gcc-14.1.0
powerpc                 linkstation_defconfig    gcc-14.1.0
powerpc                   microwatt_defconfig    clang-20
powerpc                     rainier_defconfig    clang-20
powerpc                     rainier_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240925    gcc-14.1.0
powerpc               randconfig-002-20240925    gcc-14.1.0
powerpc                    sam440ep_defconfig    clang-20
powerpc                     skiroot_defconfig    clang-20
powerpc                     skiroot_defconfig    gcc-14.1.0
powerpc                     tqm8540_defconfig    gcc-14.1.0
powerpc                        warp_defconfig    clang-20
powerpc                        warp_defconfig    gcc-14.1.0
powerpc64             randconfig-002-20240925    gcc-14.1.0
powerpc64             randconfig-003-20240925    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-20
riscv                    nommu_k210_defconfig    gcc-14.1.0
riscv                 randconfig-001-20240925    gcc-14.1.0
riscv                 randconfig-002-20240925    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                                defconfig    gcc-12
s390                  randconfig-001-20240925    gcc-14.1.0
s390                  randconfig-002-20240925    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    clang-20
sh                             espt_defconfig    gcc-14.1.0
sh                            hp6xx_defconfig    clang-20
sh                               j2_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    gcc-14.1.0
sh                     magicpanelr2_defconfig    clang-20
sh                    randconfig-001-20240925    gcc-14.1.0
sh                    randconfig-002-20240925    gcc-14.1.0
sh                      rts7751r2d1_defconfig    gcc-14.1.0
sh                            titan_defconfig    gcc-14.1.0
sparc                            alldefconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                          alldefconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240925    gcc-14.1.0
sparc64               randconfig-002-20240925    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240925    gcc-14.1.0
um                    randconfig-002-20240925    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                           alldefconfig    gcc-14.1.0
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                  nommu_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20240925    gcc-14.1.0
xtensa                randconfig-002-20240925    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

