Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA15D6EBE2
	for <ath12k@archiver.kernel.org>; Fri, 29 Nov 2024 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cec3zJsxC5GPS11rmlHRWiBiX4j9cRIvVgFqkvtUl30=; b=XAF9//dl9E1IG+ZfjiqEeLaidA
	pAgO+baHsqqeF2T6leBlfrPYjGa4Iv42BuIUPLPLnagmorp5sZUh5s7HuBWDaAYOzrM7Wmk7utwrr
	NSulBfwj/ukrGFCoQkiJTLL8qECfwHkaob7JAM/h/WOdhZ7J5gnjH5ycAkgQbIKQeLwudmkADbaCU
	/BVpDDUvRvC3DBhex/mpXEwBB07BmnOnqqmwVhMYWhs83RdsINYk8wMTpxd4zOz/cwiH/1Ms73Qim
	hWDDvz1A3M0YnaYGbolWJZBOSvFYY6NmIr8r1U9CkEVIhmz5CDxxvU/E22R7gbFLpcWVzjSd6cWre
	MxWXuhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGv4A-0000000H2oH-2SLg
	for ath12k@archiver.kernel.org;
	Fri, 29 Nov 2024 07:05:26 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGv48-0000000H2nv-0bd6
	for ath12k@lists.infradead.org;
	Fri, 29 Nov 2024 07:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732863924; x=1764399924;
  h=date:from:to:cc:subject:message-id;
  bh=xmpWci2b5O97rnYEecC4iTNP8UTpSs+xYEb9khlvRRo=;
  b=LKfVZYQzH1SeCxXVdRBrxSYrm2R1Lt9mITdRUc1dLdOEXoj9EOm96c2X
   q16pi1Vc3MYe1/CR1JstVrAnJ61CaEAroCMQ0OeHH1W/kS+AQnPBDxbMB
   R1BVasxBoFP1iwdr2fqTAnn7V+eR8O/97yPhXtvhvJg2v6C9ua2T2TEQu
   ZirJ7Lo/Ci0nopEQgMCKOVnaKeyoaVkONJWk4mFXxwKjbP/k/kxdzNA6J
   MFt6zlG1rMOBc2r36Yws7siNAtq5Ck5lcGn3aQR9pPjHx0/sKY9hcjqsO
   BncXMWc0NM/6BEW0dEMHe2QSik75RMaeqOnDiyn/Nw2fa+6Us/Wa89esQ
   A==;
X-CSE-ConnectionGUID: y5xrqbmTTVOJOAbZuYv9sw==
X-CSE-MsgGUID: PtNb+ToMSiu/CJT7S/Rg/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43762538"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="43762538"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 23:05:24 -0800
X-CSE-ConnectionGUID: U501u35WRrS0AXlyATBcOg==
X-CSE-MsgGUID: BNOeDr83Qra33oactvoVkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92877831"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2024 23:05:22 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGv43-000071-3B;
	Fri, 29 Nov 2024 07:05:19 +0000
Date: Fri, 29 Nov 2024 15:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 aa2347d7524c84479cf52b9c915b4696031747d4
Message-ID: <202411291552.Z8UGm8SS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_230524_245014_E00F3570 
X-CRM114-Status: UNSURE (   3.51  )
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
branch HEAD: aa2347d7524c84479cf52b9c915b4696031747d4  wifi: ath12k: introduce QMI firmware ready flag

Unverified Warning (likely false positive, kindly check if interested):

    drivers/net/wireless/ath/ath12k/wmi.c:6882 ath12k_wmi_process_csa_switch_count_event() error: buffer overflow 'ahvif->vif->link_conf' 15 <= 15

Warning ids grouped by kconfigs:

recent_errors
`-- riscv-randconfig-r073-20241111
    `-- drivers-net-wireless-ath-ath12k-wmi.c-ath12k_wmi_process_csa_switch_count_event()-error:buffer-overflow-ahvif-vif-link_conf

elapsed time: 771m

configs tested: 153
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20241129    clang-20
arc                   randconfig-002-20241129    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    gcc-14.2.0
arm                         orion5x_defconfig    clang-14
arm                          pxa3xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20241129    clang-20
arm                   randconfig-002-20241129    clang-20
arm                   randconfig-003-20241129    clang-20
arm                   randconfig-004-20241129    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241129    clang-20
arm64                 randconfig-002-20241129    clang-20
arm64                 randconfig-003-20241129    clang-20
arm64                 randconfig-004-20241129    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241129    clang-20
csky                  randconfig-002-20241129    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241129    clang-20
hexagon               randconfig-002-20241129    clang-20
i386        buildonly-randconfig-001-20241129    clang-19
i386        buildonly-randconfig-001-20241129    gcc-12
i386        buildonly-randconfig-002-20241129    clang-19
i386        buildonly-randconfig-003-20241129    clang-19
i386        buildonly-randconfig-003-20241129    gcc-12
i386        buildonly-randconfig-004-20241129    clang-19
i386        buildonly-randconfig-005-20241129    clang-19
i386        buildonly-randconfig-006-20241129    clang-19
i386        buildonly-randconfig-006-20241129    gcc-12
i386                  randconfig-001-20241129    clang-19
i386                  randconfig-001-20241129    gcc-12
i386                  randconfig-002-20241129    clang-19
i386                  randconfig-003-20241129    clang-19
i386                  randconfig-003-20241129    gcc-12
i386                  randconfig-004-20241129    clang-19
i386                  randconfig-005-20241129    clang-19
i386                  randconfig-006-20241129    clang-19
i386                  randconfig-006-20241129    gcc-12
i386                  randconfig-011-20241129    clang-19
i386                  randconfig-011-20241129    gcc-12
i386                  randconfig-012-20241129    clang-19
i386                  randconfig-013-20241129    clang-19
i386                  randconfig-014-20241129    clang-19
i386                  randconfig-015-20241129    clang-19
i386                  randconfig-015-20241129    gcc-12
i386                  randconfig-016-20241129    clang-19
i386                  randconfig-016-20241129    gcc-12
loongarch                        alldefconfig    clang-14
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241129    clang-20
loongarch             randconfig-002-20241129    clang-20
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-14
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                          eyeq5_defconfig    clang-14
mips                           ip27_defconfig    clang-14
mips                      maltaaprp_defconfig    clang-14
mips                   sb1250_swarm_defconfig    gcc-14.2.0
mips                           xway_defconfig    clang-14
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241129    clang-20
nios2                 randconfig-002-20241129    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241129    clang-20
parisc                randconfig-002-20241129    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20241129    clang-20
powerpc               randconfig-002-20241129    clang-20
powerpc               randconfig-003-20241129    clang-20
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241129    clang-20
powerpc64             randconfig-002-20241129    clang-20
powerpc64             randconfig-003-20241129    clang-20
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    clang-14
riscv                 randconfig-001-20241129    clang-20
riscv                 randconfig-002-20241129    clang-20
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241129    clang-20
s390                  randconfig-002-20241129    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241129    clang-20
sh                    randconfig-002-20241129    clang-20
sh                           se7751_defconfig    clang-14
sh                   sh7770_generic_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241129    clang-20
sparc64               randconfig-002-20241129    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20241129    clang-20
um                    randconfig-002-20241129    clang-20
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-14
xtensa                randconfig-001-20241129    clang-20
xtensa                randconfig-002-20241129    clang-20
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

