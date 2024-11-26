Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742E3D65526
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j+On3J931zOohRcEctYIGp1WA+fUydbvL/43rc/tseU=; b=TEmZykq4382mIp0eQJUoGRW+vt
	8iCEcH9Oa8e3XM4JOSA0J9ux22+t2KGX3tRNtDF+sV4uhMzfGWq+Fpjq7ba2kz2pOdWDJzFTnILG5
	Qg8PBCet12O4OF8DjR+M9xH+CpTgfVM3Uo1X1qyZ6R+mUL2V+Geq3PYa1xhI1yGkQl2u+3u/GAsH+
	xLVnQuK2vwv0YZLp4Aew+RkuRPIarl1/1cEdXfKVkzJicWjs8ceG1yo5G4N1BMG/OoyKXPkouAdVD
	j3dfhd1L4lFOcp1BfnOX201W+e97rXA721U823ubCoCUBIhRXjFy4LchftWwMb+OFlx1EsXYdH6vW
	V3CjJT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFykV-0000000BDSF-11w4
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 16:49:15 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFykS-0000000BDRg-2nhn
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 16:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732639752; x=1764175752;
  h=date:from:to:cc:subject:message-id;
  bh=9I5bULunYqWXTcU5Rn6eoK3pufxfQXBxra8hSVc0dmg=;
  b=KtHhRWKXqs3+SlnAiWR9o2XrHGznOxd4dqDZ+liVMVQMpB7/4Zh++3A+
   jb/Rw5YrGz93Y0MVCW89yJ1FEELcruaGpm4pok861blk8XE97YwiHyKps
   QDJ7i7gKR6BfcWwaPjagHYEBurUyexr9kpdJRMMKJtgpuDWpDsXvw/eHJ
   bUt00AdZ9abajRq1+ePsf71FkSJEJ4Z7MhlyV29PGNGoIvKSEE41KeXTM
   iAP7G2eXC4rDoRvxj1u2NAojRcdRhkvpryj5GzC3KGqooT494RSGvEfuA
   iXp1l1GfrZyGBYGnzf7EFtisfbzWBLDL3T6GCe/Eh2GsFdL7+tzI9HGjo
   w==;
X-CSE-ConnectionGUID: 47hnPYjMQwaG3Wyu1lstcQ==
X-CSE-MsgGUID: /LyP1XHMQk29uulbG4OhcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32760738"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="32760738"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 08:49:12 -0800
X-CSE-ConnectionGUID: TRgbLzJpQR63VeIlhVwIRg==
X-CSE-MsgGUID: kuy6zpx4Q2WHEJo8nkGePg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="96099983"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2024 08:49:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFykO-0007Q5-2h;
	Tue, 26 Nov 2024 16:49:08 +0000
Date: Wed, 27 Nov 2024 00:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 63fdb90642eec9439dd13c93c4b5c184b60a50cd
Message-ID: <202411270018.5951vb3e-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_084912_723679_123A472E 
X-CRM114-Status: UNSURE (   4.41  )
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
branch HEAD: 63fdb90642eec9439dd13c93c4b5c184b60a50cd  wifi: ath12k: Use mac80211 sta's link_sta instead of deflink

elapsed time: 1392m

configs tested: 225
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241126    gcc-14.2.0
arc                   randconfig-002-20241126    gcc-14.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-13.2.0
arm                         at91_dt_defconfig    clang-20
arm                          ep93xx_defconfig    clang-14
arm                      integrator_defconfig    gcc-13.2.0
arm                      integrator_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-14
arm                       multi_v4t_defconfig    gcc-13.2.0
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-13.2.0
arm                             mxs_defconfig    gcc-14.2.0
arm                             pxa_defconfig    clang-14
arm                   randconfig-001-20241126    gcc-14.2.0
arm                   randconfig-002-20241126    gcc-14.2.0
arm                   randconfig-003-20241126    gcc-14.2.0
arm                   randconfig-004-20241126    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                           sama7_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    clang-14
arm64                 randconfig-001-20241126    gcc-14.2.0
arm64                 randconfig-002-20241126    gcc-14.2.0
arm64                 randconfig-003-20241126    gcc-14.2.0
arm64                 randconfig-004-20241126    gcc-14.2.0
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                  randconfig-001-20241126    gcc-14.2.0
csky                  randconfig-002-20241126    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241126    gcc-14.2.0
hexagon               randconfig-002-20241126    gcc-14.2.0
i386        buildonly-randconfig-001-20241126    gcc-12
i386        buildonly-randconfig-002-20241126    gcc-12
i386        buildonly-randconfig-003-20241126    gcc-12
i386        buildonly-randconfig-004-20241126    gcc-12
i386        buildonly-randconfig-005-20241126    gcc-12
i386        buildonly-randconfig-006-20241126    gcc-12
i386                  randconfig-001-20241126    gcc-12
i386                  randconfig-002-20241126    gcc-12
i386                  randconfig-003-20241126    gcc-12
i386                  randconfig-004-20241126    gcc-12
i386                  randconfig-005-20241126    gcc-12
i386                  randconfig-006-20241126    gcc-12
i386                  randconfig-011-20241126    gcc-12
i386                  randconfig-012-20241126    gcc-12
i386                  randconfig-013-20241126    gcc-12
i386                  randconfig-014-20241126    gcc-12
i386                  randconfig-015-20241126    gcc-12
i386                  randconfig-016-20241126    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch             randconfig-001-20241126    gcc-14.2.0
loongarch             randconfig-002-20241126    gcc-14.2.0
m68k                             alldefconfig    clang-14
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-13.2.0
m68k                            q40_defconfig    gcc-13.2.0
m68k                        stmark2_defconfig    gcc-13.2.0
m68k                           sun3_defconfig    clang-20
m68k                          sun3x_defconfig    clang-14
m68k                           virt_defconfig    clang-14
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-13.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-14
mips                         db1xxx_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    gcc-13.2.0
mips                           jazz_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-13.2.0
mips                      maltaaprp_defconfig    clang-14
mips                         rt305x_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-13.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
mips                           xway_defconfig    clang-14
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241126    gcc-14.2.0
nios2                 randconfig-002-20241126    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241126    gcc-14.2.0
parisc                randconfig-002-20241126    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    gcc-13.2.0
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    gcc-13.2.0
powerpc                     mpc5200_defconfig    clang-14
powerpc                 mpc8313_rdb_defconfig    gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig    clang-14
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    clang-14
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241126    gcc-14.2.0
powerpc               randconfig-002-20241126    gcc-14.2.0
powerpc               randconfig-003-20241126    gcc-14.2.0
powerpc                     redwood_defconfig    clang-20
powerpc                    socrates_defconfig    gcc-13.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241126    gcc-14.2.0
powerpc64             randconfig-002-20241126    gcc-14.2.0
powerpc64             randconfig-003-20241126    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20241126    gcc-14.2.0
riscv                 randconfig-002-20241126    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241126    gcc-14.2.0
s390                  randconfig-002-20241126    gcc-14.2.0
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-13.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    clang-14
sh                               j2_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-13.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-13.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-13.2.0
sh                    randconfig-001-20241126    gcc-14.2.0
sh                    randconfig-002-20241126    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-13.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-13.2.0
sh                            shmin_defconfig    clang-14
sh                            titan_defconfig    gcc-13.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241126    gcc-14.2.0
sparc64               randconfig-002-20241126    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20241126    gcc-14.2.0
um                    randconfig-002-20241126    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241126    clang-19
x86_64      buildonly-randconfig-002-20241126    clang-19
x86_64      buildonly-randconfig-003-20241126    clang-19
x86_64      buildonly-randconfig-004-20241126    clang-19
x86_64      buildonly-randconfig-005-20241126    clang-19
x86_64      buildonly-randconfig-006-20241126    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241126    clang-19
x86_64                randconfig-002-20241126    clang-19
x86_64                randconfig-003-20241126    clang-19
x86_64                randconfig-004-20241126    clang-19
x86_64                randconfig-005-20241126    clang-19
x86_64                randconfig-006-20241126    clang-19
x86_64                randconfig-011-20241126    clang-19
x86_64                randconfig-012-20241126    clang-19
x86_64                randconfig-013-20241126    clang-19
x86_64                randconfig-014-20241126    clang-19
x86_64                randconfig-015-20241126    clang-19
x86_64                randconfig-016-20241126    clang-19
x86_64                randconfig-071-20241126    clang-19
x86_64                randconfig-072-20241126    clang-19
x86_64                randconfig-073-20241126    clang-19
x86_64                randconfig-074-20241126    clang-19
x86_64                randconfig-075-20241126    clang-19
x86_64                randconfig-076-20241126    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-13.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241126    gcc-14.2.0
xtensa                randconfig-002-20241126    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

