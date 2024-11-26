Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDCCD5A6F2
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/dZYrsonGuXQhmXLMmGtJphMVV5rQaN7+02kvf5wlno=; b=3ySGATIPnGzDG8rsjUfleErY87
	wHsIhHz31n8e834yg+yw7A44akht/BI+EkYznzfVGarAu+YLjU7d71/29fvTe8vkivCEfGviTitkn
	/Ob3jIn0idCxU2SJxa/y5RAkhvZzWUuC7gWLoW1KcZRJ8mMTJ2Jzvc1J/g5TMB/PJQMyZTcIaSzYi
	gPKmO9cY7A9lgqEcPafwVahZ+pCq4p04q9BWMUfdUVbN84R5nATOccfegTaL6dp0n2n/qfJD5YA+6
	KAodk+FwVx/ZJ1i8HqVMgd/tX9Ihu7Lki+9oe4BaGWjFbRCUYrxqe1HSAWneY3MKKaDLxNGbm2xf8
	nODSs2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqcK-00000009vh7-3WG8
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 08:08:16 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqUL-00000009u9x-3UQw
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 08:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732608002; x=1764144002;
  h=date:from:to:cc:subject:message-id;
  bh=JNM5bi1npwRnuW3M2QzcyMp/9WtChFGrNEGqCKPcaOU=;
  b=LdIOuzJc8hTR0HlrdMOm/ywcG9ssoS47ociyoCv10X2rXWp4jJ54UU0E
   8dLA1BiuCoYsXgVb0pIiTSqSMBSqLREdzSpJOUylocbNIrXYAEip+7OSk
   eZ1dfmppYCaux8QB1k8C0f1XzrzdwFlpsObeshvthGxtrmyS5dWP6+PJd
   oUWSM4uxhWrVw44Zwhjdzz8bnGpYNevCJH7djbzGumUGnZ3SVhRlziWu/
   9YN5VyzrDMCwtnZVrYtly4Y27rjM+9OORue/yQrGkTSoi19IuB6CL6ZDP
   7U4RHeNkPg52fpy09gjdbkRakTu/DPdkWWQQ3qwJY94n/3BwvNPR8n3pr
   A==;
X-CSE-ConnectionGUID: gxj7P5UITmGQXRTNPKhjmQ==
X-CSE-MsgGUID: Byowb/MCTh67wynhGdBCLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43246155"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="43246155"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 23:59:58 -0800
X-CSE-ConnectionGUID: Oehw6ROxS9uwy2bqH4gNNA==
X-CSE-MsgGUID: dzfk64IcSZq6dT1PpXaCcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="129049917"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2024 23:59:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFqUE-0007AH-0o;
	Tue, 26 Nov 2024 07:59:54 +0000
Date: Tue, 26 Nov 2024 15:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 175616a7658cd5d53389d1f9c1ce22debd4595a5
Message-ID: <202411261554.hXnly05W-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_000001_970362_8E81A8B2 
X-CRM114-Status: UNSURE (   4.49  )
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
branch HEAD: 175616a7658cd5d53389d1f9c1ce22debd4595a5  Add localversion-wireless-testing-ath

elapsed time: 862m

configs tested: 230
configs skipped: 5

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
arm                        shmobile_defconfig    gcc-14.2.0
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
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241126    gcc-12
i386        buildonly-randconfig-002-20241126    gcc-12
i386        buildonly-randconfig-003-20241126    gcc-12
i386        buildonly-randconfig-004-20241126    gcc-12
i386        buildonly-randconfig-005-20241126    gcc-12
i386        buildonly-randconfig-006-20241126    gcc-12
i386                                defconfig    clang-19
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
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241126    gcc-14.2.0
powerpc               randconfig-002-20241126    gcc-14.2.0
powerpc               randconfig-003-20241126    gcc-14.2.0
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
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241126    clang-19
x86_64      buildonly-randconfig-002-20241126    clang-19
x86_64      buildonly-randconfig-003-20241126    clang-19
x86_64      buildonly-randconfig-004-20241126    clang-19
x86_64      buildonly-randconfig-005-20241126    clang-19
x86_64      buildonly-randconfig-006-20241126    clang-19
x86_64                              defconfig    gcc-11
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

