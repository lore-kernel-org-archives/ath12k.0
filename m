Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657CAC43458
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 04:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zo+YdLR/R4Lls1ph+kJbTN9ggT1b6ZpBXRmlO3reSOE=; b=tNVesp1gEUQnU/a2t2VpVGXenB
	tC97z1CmRZ5J56G+ksJkpSZYJYS1tswRWiOy+9aURrnkPQAsnA16Eda2Nj1x9lVeH8lvQzA+TtvGh
	HVWVEfRDsuAYDqTADP3Hlve5WJD3rGWhKs0naHcmDuMuVIzBHbTpVqiD/AN2b+dTiN3bWuTdT1PhD
	SRhvnVFEySCHfsCJhsH3odg8YDY87hA0NpA+buoHWrQEMkM5XiUO1rzx8vkE+dMWxAGUB9XMRPeCQ
	gvW5lycaGD5mC0WOCT0HbmPEQkZeX/uqbsjH0mGJxol/7GxHDrMZXYlYF42spfu/E6C4hY0zc961m
	YrRJu6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUYB-0000000ArNT-0OFF;
	Tue, 14 Jul 2026 04:15:19 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUY7-0000000ArMW-3hvB
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 04:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784002515; x=1815538515;
  h=date:from:to:cc:subject:message-id;
  bh=/V50FrCM/eFO2FHUge0VCnk0Gl+duM05dPt9I7lkCdk=;
  b=nfMsNPzx4bH+GT5I0ymW3UHEWf5EpyPBN3X6SvLs66s1x27/XVrjpF8M
   AFYwsM3gyjX4i83fGUzvHnw5bR3Klzf6vnQbuEzK0Adl1e2gPVTBmODkH
   YQC7R+pspvek6ft+Gkpq1/pGLPGumGSAlfAYvlB5LHhKAYypraVmXKQnB
   xVgahjzOK8Zs8OvljFV5FzPHnqDQ6+V6WMQ87xutVgmnA8WE8woHshATk
   b/E7TxU0eZ4Vv2Q8PaHc7isN64IKESIADLmQ8WAcK744eLrANqnLoTDo+
   BcenXS6Y+eUgHpljSB7WBO8TAhpytrmAMvCEnCC/Tm/bXAaUEHV4lXPe3
   A==;
X-CSE-ConnectionGUID: OsAaG2crRPab17iSksxr6g==
X-CSE-MsgGUID: eOUQWetMRAOeoQ0R/jid4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84580051"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84580051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 21:15:14 -0700
X-CSE-ConnectionGUID: lddPwsKZRemoxIrOrRyGHw==
X-CSE-MsgGUID: 5s/BOMkeROmEmwjFUon3sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251792064"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jul 2026 21:15:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjUY0-00000000MOT-0x9I;
	Tue, 14 Jul 2026 04:15:08 +0000
Date: Tue, 14 Jul 2026 12:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:for-current] BUILD SUCCESS
 a1a21995c2e1cc2ca6b2226cfe4f5f018370182a
Message-ID: <202607141207.T8eFf2fT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_211515_961012_4BB6E931 
X-CRM114-Status: UNSURE (   4.00  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
branch HEAD: a1a21995c2e1cc2ca6b2226cfe4f5f018370182a  wifi: carl9170: fix buffer overflow in rx_stream failover path

elapsed time: 743m

configs tested: 212
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              alldefconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    clang-23
arc                   randconfig-001-20260714    clang-23
arc                            randconfig-002    clang-23
arc                   randconfig-002-20260714    clang-23
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                          ixp4xx_defconfig    gcc-16.1.0
arm                            randconfig-001    clang-23
arm                   randconfig-001-20260714    clang-23
arm                            randconfig-002    clang-23
arm                   randconfig-002-20260714    clang-23
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260714    clang-23
arm                            randconfig-004    clang-23
arm                   randconfig-004-20260714    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260714    clang-17
arm64                 randconfig-001-20260714    gcc-16.1.0
arm64                 randconfig-002-20260714    gcc-16.1.0
arm64                 randconfig-003-20260714    clang-17
arm64                 randconfig-003-20260714    gcc-16.1.0
arm64                 randconfig-004-20260714    clang-23
arm64                 randconfig-004-20260714    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260714    gcc-16.1.0
csky                  randconfig-002-20260714    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260714    gcc-16.1.0
hexagon               randconfig-002-20260714    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260714    clang-22
i386        buildonly-randconfig-002-20260714    clang-22
i386        buildonly-randconfig-003-20260714    clang-22
i386        buildonly-randconfig-004-20260714    clang-22
i386        buildonly-randconfig-005-20260714    clang-22
i386        buildonly-randconfig-006-20260714    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260714    gcc-13
i386                  randconfig-002-20260714    gcc-13
i386                  randconfig-003-20260714    gcc-13
i386                  randconfig-004-20260714    gcc-13
i386                  randconfig-005-20260714    gcc-13
i386                  randconfig-006-20260714    gcc-13
i386                  randconfig-007-20260714    gcc-13
i386                  randconfig-011-20260714    clang-22
i386                  randconfig-012-20260714    clang-22
i386                  randconfig-013-20260714    clang-22
i386                  randconfig-014-20260714    clang-22
i386                  randconfig-015-20260714    clang-22
i386                  randconfig-016-20260714    clang-22
i386                  randconfig-017-20260714    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260714    gcc-16.1.0
loongarch             randconfig-002-20260714    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260714    gcc-16.1.0
nios2                 randconfig-002-20260714    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260714    clang-17
parisc                randconfig-002-20260714    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260714    clang-17
powerpc               randconfig-002-20260714    clang-17
powerpc64             randconfig-001-20260714    clang-17
powerpc64             randconfig-002-20260714    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260714    gcc-10.5.0
riscv                 randconfig-002-20260714    gcc-10.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260714    gcc-10.5.0
s390                  randconfig-002-20260714    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-16.1.0
sh                    randconfig-001-20260714    gcc-10.5.0
sh                    randconfig-002-20260714    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260714    gcc-8.5.0
sparc                 randconfig-002-20260714    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260714    gcc-8.5.0
sparc64               randconfig-002-20260714    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260714    gcc-8.5.0
um                    randconfig-002-20260714    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260714    gcc-14
x86_64      buildonly-randconfig-002-20260714    gcc-14
x86_64      buildonly-randconfig-003-20260714    gcc-14
x86_64      buildonly-randconfig-004-20260714    gcc-14
x86_64      buildonly-randconfig-005-20260714    gcc-14
x86_64      buildonly-randconfig-006-20260714    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260714    clang-22
x86_64                randconfig-001-20260714    gcc-14
x86_64                randconfig-002-20260714    clang-22
x86_64                randconfig-002-20260714    gcc-12
x86_64                randconfig-003-20260714    clang-22
x86_64                randconfig-003-20260714    gcc-14
x86_64                randconfig-004-20260714    clang-22
x86_64                randconfig-004-20260714    gcc-14
x86_64                randconfig-005-20260714    clang-22
x86_64                randconfig-006-20260714    clang-22
x86_64                randconfig-011-20260714    clang-22
x86_64                randconfig-012-20260714    clang-22
x86_64                randconfig-013-20260714    clang-22
x86_64                randconfig-014-20260714    clang-22
x86_64                randconfig-015-20260714    clang-22
x86_64                randconfig-016-20260714    clang-22
x86_64                randconfig-071-20260714    gcc-14
x86_64                randconfig-072-20260714    gcc-14
x86_64                randconfig-073-20260714    gcc-14
x86_64                randconfig-074-20260714    gcc-14
x86_64                randconfig-075-20260714    gcc-14
x86_64                randconfig-076-20260714    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260714    gcc-8.5.0
xtensa                randconfig-002-20260714    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

