Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E94D79759
	for <ath12k@archiver.kernel.org>; Sat, 31 Jan 2026 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yFIjClHh6+BtOmVUykptmRAupVX5Ul0XYMFI7vsSadE=; b=tdTukIkQhKuZ/ZGMcP/tH/b+Oq
	Fi0TgZdg4qT4FlKZ0M8luM0fNNhyoiqdRmrMxWREHjBq1F2rpB+4C6R/LIK2cdheuTcpYURFUYhob
	nctLVpUt/BCdUBeiH5wTVnfY1pUL2HmveKd7sEoPulO3P+qG6vytG5Lc6YPDV/SXcmxbHyS7iN1HY
	JE2lMMSi6XZ1A7xD/84EpeWtc2saPOExo+n9Aq7Ainsx22IbiziiwM4KFrBH8KQIL/Kmuwa15ZY+L
	lj3stsimSn/Eg9f2Ba4s90OMHiT0XpFdz/LG6LZNHBpyhE4MDc7Has6bpjJnK32sP4VR56uC5sc0Y
	f5bpxG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm61T-00000002P4G-1BIF;
	Sat, 31 Jan 2026 08:08:03 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm61Q-00000002P3u-1tXl
	for ath12k@lists.infradead.org;
	Sat, 31 Jan 2026 08:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769846880; x=1801382880;
  h=date:from:to:cc:subject:message-id;
  bh=X4hILhsbkuHCtb535g9X658KqBHIvt8660Ixr6kaOcI=;
  b=O0V0Rp8S+0DB2aU2pGpVn6oX9qMyg+JxzmI3Kua6uFlnK4byASDTS2gg
   88i4lJ1LYNNDfIlAfDQDJdr4i2kgsgg8LuSL0HtcY969fiWEx+ErX1BQH
   BB8SrYhglPWtEPqzUQR+7AC4sFUasBy9lbjh6ic4Q6K8o5Fv+nTQY1YPa
   n40Aq5EwQE2aq9rm/FiISJ1iMTNgarEttH7H6gn6fQTahfgS+3rr63lnH
   URJ4a0nqeZzUnXX42qDWFNnwQqf4JophF6GvbjMA1LfA7brIwYG1ZSAJA
   bDJkAeuDCEbCpkjbva64c7PndIqrrS+LLAHX3SeKUPaUs5K3+zPCqgAzd
   g==;
X-CSE-ConnectionGUID: 1GpXe6mDSI64TU/Zo2PqXA==
X-CSE-MsgGUID: DcsE6kXWRmKn4pb5cLcQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="96547606"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="96547606"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 00:07:56 -0800
X-CSE-ConnectionGUID: ftvLgOXCQmOu/QLNRwVtwQ==
X-CSE-MsgGUID: JgzZa/9US32E15MPXSaWVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209403023"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2026 00:07:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm61J-00000000doQ-0S2f;
	Sat, 31 Jan 2026 08:07:53 +0000
Date: Sat, 31 Jan 2026 16:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 2c1ba9c2adf0fda96eaaebd8799268a7506a8fc9
Message-ID: <202601311644.dZhazUdb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_000800_539015_C934BA43 
X-CRM114-Status: UNSURE (   4.10  )
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
branch HEAD: 2c1ba9c2adf0fda96eaaebd8799268a7506a8fc9  wifi: ath12k: clear stale link mapping of ahvif->links_map

elapsed time: 1001m

configs tested: 221
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    gcc-14
arc                   randconfig-001-20260131    gcc-8.5.0
arc                   randconfig-002-20260131    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                       aspeed_g4_defconfig    gcc-15.2.0
arm                         bcm2835_defconfig    gcc-15.2.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                            hisi_defconfig    gcc-14
arm                        mvebu_v5_defconfig    gcc-15.2.0
arm                   randconfig-001-20260131    gcc-8.5.0
arm                   randconfig-002-20260131    gcc-8.5.0
arm                   randconfig-003-20260131    gcc-8.5.0
arm                   randconfig-004-20260131    gcc-8.5.0
arm                         vf610m4_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260131    clang-22
arm64                 randconfig-002-20260131    clang-22
arm64                 randconfig-003-20260131    clang-22
arm64                 randconfig-004-20260131    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260131    clang-22
csky                  randconfig-002-20260131    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260131    clang-22
hexagon               randconfig-001-20260131    gcc-11.5.0
hexagon               randconfig-002-20260131    clang-22
hexagon               randconfig-002-20260131    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260131    clang-20
i386        buildonly-randconfig-002-20260131    clang-20
i386        buildonly-randconfig-003-20260131    clang-20
i386        buildonly-randconfig-004-20260131    clang-20
i386        buildonly-randconfig-005-20260131    clang-20
i386        buildonly-randconfig-006-20260131    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260131    gcc-14
i386                  randconfig-002-20260131    gcc-14
i386                  randconfig-003-20260131    gcc-14
i386                  randconfig-004-20260131    gcc-14
i386                  randconfig-005-20260131    gcc-14
i386                  randconfig-006-20260131    gcc-14
i386                  randconfig-007-20260131    gcc-14
i386                  randconfig-011-20260131    gcc-14
i386                  randconfig-012-20260131    gcc-14
i386                  randconfig-013-20260131    gcc-14
i386                  randconfig-014-20260131    gcc-14
i386                  randconfig-015-20260131    gcc-14
i386                  randconfig-016-20260131    gcc-14
i386                  randconfig-017-20260131    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260131    clang-22
loongarch             randconfig-001-20260131    gcc-11.5.0
loongarch             randconfig-002-20260131    clang-22
loongarch             randconfig-002-20260131    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    gcc-14
m68k                          sun3x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath25_defconfig    gcc-15.2.0
mips                      loongson1_defconfig    gcc-14
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260131    gcc-10.5.0
nios2                 randconfig-001-20260131    gcc-11.5.0
nios2                 randconfig-002-20260131    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260131    gcc-8.5.0
parisc                randconfig-002-20260131    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.2.0
powerpc                     mpc83xx_defconfig    gcc-15.2.0
powerpc                      pmac32_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260131    gcc-8.5.0
powerpc               randconfig-002-20260131    gcc-8.5.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc                      tqm8xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260131    gcc-8.5.0
powerpc64             randconfig-002-20260131    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_k210_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260131    gcc-8.5.0
riscv                 randconfig-002-20260131    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260131    gcc-8.5.0
s390                  randconfig-002-20260131    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260131    gcc-8.5.0
sh                    randconfig-002-20260131    gcc-8.5.0
sh                           se7750_defconfig    gcc-14
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                   sh7770_generic_defconfig    gcc-14
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260131    gcc-14
sparc                 randconfig-002-20260131    gcc-14
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260131    gcc-14
sparc64               randconfig-002-20260131    gcc-14
um                               alldefconfig    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260131    gcc-14
um                    randconfig-002-20260131    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260131    gcc-14
x86_64      buildonly-randconfig-002-20260131    gcc-14
x86_64      buildonly-randconfig-003-20260131    gcc-14
x86_64      buildonly-randconfig-004-20260131    gcc-14
x86_64      buildonly-randconfig-005-20260131    gcc-14
x86_64      buildonly-randconfig-006-20260131    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260131    clang-20
x86_64                randconfig-002-20260131    clang-20
x86_64                randconfig-003-20260131    clang-20
x86_64                randconfig-004-20260131    clang-20
x86_64                randconfig-005-20260131    clang-20
x86_64                randconfig-006-20260131    clang-20
x86_64                randconfig-011-20260131    clang-20
x86_64                randconfig-012-20260131    clang-20
x86_64                randconfig-013-20260131    clang-20
x86_64                randconfig-014-20260131    clang-20
x86_64                randconfig-015-20260131    clang-20
x86_64                randconfig-016-20260131    clang-20
x86_64                randconfig-071-20260131    gcc-14
x86_64                randconfig-072-20260131    gcc-14
x86_64                randconfig-073-20260131    gcc-14
x86_64                randconfig-074-20260131    gcc-14
x86_64                randconfig-075-20260131    gcc-14
x86_64                randconfig-076-20260131    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260131    gcc-14
xtensa                randconfig-002-20260131    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

