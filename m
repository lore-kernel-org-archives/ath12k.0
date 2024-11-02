Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21EAE677F5
	for <ath12k@archiver.kernel.org>; Sat,  2 Nov 2024 09:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BP6qjuTnJ/QcVdxUbc4RpGL8Joy3HIqhlxPCmqcn0Eg=; b=qK/okbU15X5TPajBS/zWFW7ml5
	riCetgWekGGGcMW/DT7X8/7PIIfthBudzl2lrUhKSmuw7zPp2hKNSYERCcN8HKQFf9mrfvlmK/qJ1
	q/7RQ5YhyRpK3FhH+86XBn4cgne9qI1uDO1sYh9CxHGCNxP3CFFeKEWN2NnMM3Vh6NTFiwLiyBlc5
	hBArXEdglDiOxo+Gv2L0iVFyc9ggX20y7BkX4irCfn8EN0K1xICRoqaQjGdPLhK25h1n8RRON6F1x
	2/naSXw2+kq3vQOI3EceUCxPraYbaoEM+tladCBBl+YBSGVaJ9sl5lv/n4kMxuVA474U+3sHYWmmP
	4X0S1Q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AHC-00000009MxO-1o5A
	for ath12k@archiver.kernel.org;
	Sat, 02 Nov 2024 09:18:34 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AH9-00000009Mwx-1jvS
	for ath12k@lists.infradead.org;
	Sat, 02 Nov 2024 09:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730539111; x=1762075111;
  h=date:from:to:cc:subject:message-id;
  bh=Q9xdW/aiyKsTDLDb5yEc9iKYE/Pca8waiJT4sAUSJrE=;
  b=oIUy2rgHot47AoDl8lqFBtMZUpXv/oPBdFASyVuNSqs56o1qWhSrLQhU
   L6YBvJ6RxQEzcGPNlpPJXu+fTMomAaXtTBObIxIf966qcXrSy1hjxzdE3
   MjNdFHxvZEgYXqMZ8jo+FZ3aPvVBnODJ2JxFM0sUG0OxSt1JyUm93DXsg
   E5vWAzr7us3U+GWGCjfYOLuNnAk2zSIbJzPES765Vi/iOFqMURCHCln23
   528M1EFFqjkXvCzJv+iysJd+GZx5/0SV49zWdtM/KikmOwpJhgOf8OoAE
   14IGvQ2xfi7xc1absvCpkfU+nkMYTIYy89zySA8qpdmWTss4XI4W7i4gi
   w==;
X-CSE-ConnectionGUID: i0gzVxHmRp24XYPZ82PNfw==
X-CSE-MsgGUID: lAsr6gGZTeKUbId361Trfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30457378"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30457378"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 02:18:27 -0700
X-CSE-ConnectionGUID: L66P8zwnSIKvFXbBwhIHKg==
X-CSE-MsgGUID: MF7K0InoTUOegD/Py3QfEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83299394"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Nov 2024 02:18:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7AH1-000ifR-2F;
	Sat, 02 Nov 2024 09:18:23 +0000
Date: Sat, 02 Nov 2024 17:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 8dfb4266fb43a62702d6e86c3bdd6713eee8d2a3
Message-ID: <202411021725.MXJELeRA-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_021831_534628_D21C8CB2 
X-CRM114-Status: UNSURE (   3.69  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: 8dfb4266fb43a62702d6e86c3bdd6713eee8d2a3  Merge branch 'pending' into main-pending

elapsed time: 910m

configs tested: 190
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241102    gcc-14.1.0
arc                   randconfig-002-20241102    gcc-14.1.0
arc                           tb10x_defconfig    clang-14
arc                           tb10x_defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    clang-14
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    gcc-14.1.0
arm                       imx_v4_v5_defconfig    clang-14
arm                        multi_v5_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    clang-14
arm                   randconfig-001-20241102    gcc-14.1.0
arm                   randconfig-002-20241102    gcc-14.1.0
arm                   randconfig-003-20241102    gcc-14.1.0
arm                   randconfig-004-20241102    gcc-14.1.0
arm                           sunxi_defconfig    clang-14
arm                           tegra_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241102    gcc-14.1.0
arm64                 randconfig-002-20241102    gcc-14.1.0
arm64                 randconfig-003-20241102    gcc-14.1.0
arm64                 randconfig-004-20241102    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241102    gcc-14.1.0
csky                  randconfig-002-20241102    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241102    gcc-14.1.0
hexagon               randconfig-002-20241102    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241102    gcc-12
i386        buildonly-randconfig-002-20241102    gcc-12
i386        buildonly-randconfig-003-20241102    gcc-12
i386        buildonly-randconfig-004-20241102    gcc-12
i386        buildonly-randconfig-005-20241102    gcc-12
i386        buildonly-randconfig-006-20241102    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241102    gcc-12
i386                  randconfig-002-20241102    gcc-12
i386                  randconfig-003-20241102    gcc-12
i386                  randconfig-004-20241102    gcc-12
i386                  randconfig-005-20241102    gcc-12
i386                  randconfig-006-20241102    gcc-12
i386                  randconfig-011-20241102    gcc-12
i386                  randconfig-012-20241102    gcc-12
i386                  randconfig-013-20241102    gcc-12
i386                  randconfig-014-20241102    gcc-12
i386                  randconfig-015-20241102    gcc-12
i386                  randconfig-016-20241102    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241102    gcc-14.1.0
loongarch             randconfig-002-20241102    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    clang-14
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    clang-14
mips                           ip30_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    clang-14
nios2                            alldefconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241102    gcc-14.1.0
nios2                 randconfig-002-20241102    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-14
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241102    gcc-14.1.0
parisc                randconfig-002-20241102    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    clang-14
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                      pasemi_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241102    gcc-14.1.0
powerpc               randconfig-002-20241102    gcc-14.1.0
powerpc               randconfig-003-20241102    gcc-14.1.0
powerpc64             randconfig-001-20241102    gcc-14.1.0
powerpc64             randconfig-002-20241102    gcc-14.1.0
powerpc64             randconfig-003-20241102    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241102    gcc-14.1.0
riscv                 randconfig-002-20241102    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241102    gcc-14.1.0
s390                  randconfig-002-20241102    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    clang-14
sh                          r7785rp_defconfig    clang-14
sh                    randconfig-001-20241102    gcc-14.1.0
sh                    randconfig-002-20241102    gcc-14.1.0
sh                           se7619_defconfig    clang-14
sh                           se7750_defconfig    clang-14
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241102    gcc-14.1.0
sparc64               randconfig-002-20241102    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-14
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241102    gcc-14.1.0
um                    randconfig-002-20241102    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241102    clang-19
x86_64      buildonly-randconfig-002-20241102    clang-19
x86_64      buildonly-randconfig-003-20241102    clang-19
x86_64      buildonly-randconfig-004-20241102    clang-19
x86_64      buildonly-randconfig-005-20241102    clang-19
x86_64      buildonly-randconfig-006-20241102    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241102    clang-19
x86_64                randconfig-002-20241102    clang-19
x86_64                randconfig-003-20241102    clang-19
x86_64                randconfig-004-20241102    clang-19
x86_64                randconfig-005-20241102    clang-19
x86_64                randconfig-006-20241102    clang-19
x86_64                randconfig-011-20241102    clang-19
x86_64                randconfig-012-20241102    clang-19
x86_64                randconfig-013-20241102    clang-19
x86_64                randconfig-014-20241102    clang-19
x86_64                randconfig-015-20241102    clang-19
x86_64                randconfig-016-20241102    clang-19
x86_64                randconfig-071-20241102    clang-19
x86_64                randconfig-072-20241102    clang-19
x86_64                randconfig-073-20241102    clang-19
x86_64                randconfig-074-20241102    clang-19
x86_64                randconfig-075-20241102    clang-19
x86_64                randconfig-076-20241102    clang-19
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-14
xtensa                          iss_defconfig    gcc-14.1.0
xtensa                randconfig-001-20241102    gcc-14.1.0
xtensa                randconfig-002-20241102    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

