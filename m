Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED74C0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 18:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3xDMTXX21/bi9PozmjaiY75HYrBdJbsyANC3qAq71nU=; b=BJLzcBhZjVAmK/C7UKCcM8FdY6
	NZebVyrrRwVWCDebGSfXgWkFyE11MrdnLW06qe/GuNlEDPtTYTp9O5mb+bplvgWVg/dt8L8ITW/e6
	A65e/W14PnUhVFdV1gSxTCmALj1xLJzTEXPLXX4PTVRQmvTvaQ85Ap+tosYqK1THKIxryb0ccSFey
	2XAmSyO+VaT+X4SB+94cp/auItkhStUKI+/bTvqXYySnyTlFDoCopelcSCfOCoQl63UtlBYVePzJM
	/5enaaQ2Kdu/iRLOj8uDgMoAEFGMxxycW/TvY9NIAU+m3owHLYYrwhHKnAEtigFIZbMXKRfd09BII
	vEr2gYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvgu-0000000BCM7-2XUb
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 18:24:32 +0000
Received: from [192.198.163.10] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvfJ-0000000BCFH-0ITp
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 18:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738347773; x=1769883773;
  h=date:from:to:cc:subject:message-id;
  bh=aMnDY6D+0+jxAQdUyxXFDa8H7mxAQlN2q+PV7arJKBw=;
  b=cut1TNQYWazF7iIE+xBO416cvrXQbhfrGmcSG8oozCIeaADH12GzDFkm
   VEIY/S5wy27IehLm01lIAsyMLI1y8kYA6cyiD95XUzp0WdFNJPrkk0gBl
   8Dxktxtf/Y9l5dGVZQWHCeaAS6YKOvZE62YcImlZu1oHsnN2SVC00xOy+
   LGsRLxd1qgigG5DPyks+Eu/q7Bnz0X58bZQGa+oxsWtIsyYd7zMQ3COlw
   82L6raq25gqOx3uwZeNEfDqWNmKWqHazJwanGuQ0kC5qylJOcm1uLMNhm
   XHkRX36ae2ul7NDvVkWzKYtanJGldRa6j0Gs61pzjumdkpzN5HPlh7q1E
   A==;
X-CSE-ConnectionGUID: 8tt4RiTRQBS0FVezTNPiTg==
X-CSE-MsgGUID: yfMGMvG3TXih5j5mzpwshw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50342177"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50342177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 10:22:48 -0800
X-CSE-ConnectionGUID: lffBdYVmQOy7BR9EgqlfcQ==
X-CSE-MsgGUID: auV3suNjRLmGIfWCJ9BbVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146888305"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2025 10:22:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdvfA-000miv-0i;
	Fri, 31 Jan 2025 18:22:44 +0000
Date: Sat, 01 Feb 2025 02:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 c7b9df20d6a48a279f4b537920049094701da14b
Message-ID: <202502010242.Vuul2c4z-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_102253_155902_0191B84B 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: c7b9df20d6a48a279f4b537920049094701da14b  wifi: ath12k: remove return for empty tx bitrate in mac_op_sta_statistics

elapsed time: 1347m

configs tested: 229
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250131    gcc-13.2.0
arc                   randconfig-002-20250131    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250131    clang-17
arm                   randconfig-002-20250131    clang-15
arm                   randconfig-003-20250131    gcc-14.2.0
arm                   randconfig-004-20250131    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250131    clang-15
arm64                 randconfig-002-20250131    gcc-14.2.0
arm64                 randconfig-003-20250131    clang-21
arm64                 randconfig-004-20250131    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250131    clang-21
csky                  randconfig-001-20250131    gcc-14.2.0
csky                  randconfig-002-20250131    clang-21
csky                  randconfig-002-20250131    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250131    clang-21
hexagon               randconfig-002-20250131    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250131    clang-19
i386        buildonly-randconfig-002-20250131    clang-19
i386        buildonly-randconfig-003-20250131    gcc-12
i386        buildonly-randconfig-004-20250131    gcc-12
i386        buildonly-randconfig-005-20250131    clang-19
i386        buildonly-randconfig-006-20250131    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250131    clang-19
i386                  randconfig-002-20250131    clang-19
i386                  randconfig-003-20250131    clang-19
i386                  randconfig-004-20250131    clang-19
i386                  randconfig-005-20250131    clang-19
i386                  randconfig-006-20250131    clang-19
i386                  randconfig-007-20250131    clang-19
i386                  randconfig-011-20250131    gcc-12
i386                  randconfig-012-20250131    gcc-12
i386                  randconfig-013-20250131    gcc-12
i386                  randconfig-014-20250131    gcc-12
i386                  randconfig-015-20250131    gcc-12
i386                  randconfig-016-20250131    gcc-12
i386                  randconfig-017-20250131    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250131    clang-21
loongarch             randconfig-001-20250131    gcc-14.2.0
loongarch             randconfig-002-20250131    clang-21
loongarch             randconfig-002-20250131    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250131    clang-21
nios2                 randconfig-001-20250131    gcc-14.2.0
nios2                 randconfig-002-20250131    clang-21
nios2                 randconfig-002-20250131    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250131    clang-21
parisc                randconfig-001-20250131    gcc-14.2.0
parisc                randconfig-002-20250131    clang-21
parisc                randconfig-002-20250131    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250131    clang-21
powerpc               randconfig-001-20250131    gcc-14.2.0
powerpc               randconfig-002-20250131    clang-15
powerpc               randconfig-002-20250131    clang-21
powerpc               randconfig-003-20250131    clang-21
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250131    clang-15
powerpc64             randconfig-001-20250131    clang-21
powerpc64             randconfig-002-20250131    clang-17
powerpc64             randconfig-002-20250131    clang-21
powerpc64             randconfig-003-20250131    clang-15
powerpc64             randconfig-003-20250131    clang-21
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                               defconfig    gcc-14.2.0
riscv                 randconfig-001-20250131    gcc-14.2.0
riscv                 randconfig-002-20250131    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250131    gcc-14.2.0
s390                  randconfig-002-20250131    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250131    gcc-14.2.0
sparc                 randconfig-002-20250131    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250131    gcc-14.2.0
sparc64               randconfig-002-20250131    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    gcc-14.2.0
um                    randconfig-002-20250131    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250131    gcc-11
x86_64      buildonly-randconfig-002-20250131    clang-19
x86_64      buildonly-randconfig-003-20250131    gcc-12
x86_64      buildonly-randconfig-004-20250131    gcc-12
x86_64      buildonly-randconfig-005-20250131    clang-19
x86_64      buildonly-randconfig-006-20250131    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250131    clang-19
x86_64                randconfig-002-20250131    clang-19
x86_64                randconfig-003-20250131    clang-19
x86_64                randconfig-004-20250131    clang-19
x86_64                randconfig-005-20250131    clang-19
x86_64                randconfig-006-20250131    clang-19
x86_64                randconfig-007-20250131    clang-19
x86_64                randconfig-008-20250131    clang-19
x86_64                randconfig-071-20250131    clang-19
x86_64                randconfig-072-20250131    clang-19
x86_64                randconfig-073-20250131    clang-19
x86_64                randconfig-074-20250131    clang-19
x86_64                randconfig-075-20250131    clang-19
x86_64                randconfig-076-20250131    clang-19
x86_64                randconfig-077-20250131    clang-19
x86_64                randconfig-078-20250131    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                randconfig-002-20250131    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

