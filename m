Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E33C3ABDD
	for <ath12k@archiver.kernel.org>; Tue, 20 May 2025 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f5A+IgHCqz5GRvFSbp60vqFCm3OLNgrui8tvXYEk1mw=; b=LS3O7Qkc3Yk7DEAojfPH2rBKtu
	HOQWuPeIhh+DKLY+nmdgn4ouHNJJ8Jw2al6QqjCtU0Cm5kR6njy0D2wV0q8R6XVBtzHpX4/CMQdog
	wf/6lg7rOWfSW/103gkmgpbcHeutSqzq3+Go9J03lfDeNk5n7Z1CfdC0dd9+vqoVdLvOzu0spVAfG
	5Y1injc8zDXqU8Q2ympLg6GGU6cgqBmsMeClLHdB8I3PSk8cODUyJch5aHViNgVeAjPpyaXKbPcpK
	wFPngn0syk4r50YY3Biy2MtG8oXplswrhU+4PF6tO0DpNEmfpdbo6fEA/d+8aU2D74Y2tZBiqHql/
	/+vKkuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHI8e-0000000BzFy-06GE;
	Tue, 20 May 2025 08:15:52 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHI6z-0000000Bz2O-2i3H
	for ath12k@lists.infradead.org;
	Tue, 20 May 2025 08:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747728849; x=1779264849;
  h=date:from:to:cc:subject:message-id;
  bh=XGWYNAxhJYP3KATiMUXehD52BzhKlw0g9cqrmspPRwQ=;
  b=i8JfoURoRFxt+dWpsCrJxBvTZ13TJs13OIpA7G1ZVJxGusfg6uTGMs2q
   fNecMo90poo0g7guTO6GKrfWejtj976SmWW8ncrK2ybPmcjFeXmVvAunp
   BM4/+quWY0uHXyTZefFb7HV2V2EvwsG/hQb/xtqx4H0LgnmP1eC10VJ0N
   ViBTBnBvlMnxO1wMQdA+6GNhdBZyd5n33XhOAOW69uF2674XiVOZup0uZ
   wJqYbhOhGDUetFH5S5f7Vcrw6bCPPqIVT9gaeFwFfJ2H1c3FTIF5QBWff
   OTEgUr9ROC+BSSuFogYrR229sdrppvnFLaYXyk+82+8x9chl33sbXVs0U
   Q==;
X-CSE-ConnectionGUID: ZlF2a1qcRNGo9YdVOoN1Ug==
X-CSE-MsgGUID: oZNoSN3CQ+62HI118ldBVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53464897"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="53464897"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:14:08 -0700
X-CSE-ConnectionGUID: EyK6t0IRRvmgo9p03AzDuQ==
X-CSE-MsgGUID: 5LffiVM7QeqsAMg1FiB9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140148175"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2025 01:14:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHI6v-000MK4-2G;
	Tue, 20 May 2025 08:14:05 +0000
Date: Tue, 20 May 2025 16:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 241dfac96279ce9de47a6d4478dd3d41f262835f
Message-ID: <202505201654.KLCYjmRy-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_011409_721466_CF2F4FA3 
X-CRM114-Status: UNSURE (   3.94  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: 241dfac96279ce9de47a6d4478dd3d41f262835f  wifi: ath12k: Fix scan initiation failure handling

elapsed time: 851m

configs tested: 107
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250520    gcc-11.5.0
arc                   randconfig-002-20250520    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250520    gcc-6.5.0
arm                   randconfig-002-20250520    gcc-10.5.0
arm                   randconfig-003-20250520    clang-19
arm                   randconfig-004-20250520    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250520    clang-21
arm64                 randconfig-002-20250520    gcc-9.5.0
arm64                 randconfig-003-20250520    clang-18
arm64                 randconfig-004-20250520    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250520    gcc-14.2.0
csky                  randconfig-002-20250520    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250520    clang-21
hexagon               randconfig-002-20250520    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250520    gcc-12
i386        buildonly-randconfig-002-20250520    gcc-12
i386        buildonly-randconfig-003-20250520    clang-20
i386        buildonly-randconfig-004-20250520    gcc-12
i386        buildonly-randconfig-005-20250520    clang-20
i386        buildonly-randconfig-006-20250520    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250520    gcc-14.2.0
loongarch             randconfig-002-20250520    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250520    gcc-9.3.0
nios2                 randconfig-002-20250520    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250520    gcc-10.5.0
parisc                randconfig-002-20250520    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250520    gcc-5.5.0
powerpc               randconfig-002-20250520    clang-17
powerpc               randconfig-003-20250520    gcc-7.5.0
powerpc64             randconfig-001-20250520    clang-21
powerpc64             randconfig-002-20250520    gcc-7.5.0
powerpc64             randconfig-003-20250520    gcc-5.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250520    gcc-9.3.0
riscv                 randconfig-002-20250520    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250520    clang-21
s390                  randconfig-002-20250520    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250520    gcc-9.3.0
sh                    randconfig-002-20250520    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250520    gcc-8.5.0
sparc                 randconfig-002-20250520    gcc-12.4.0
sparc64               randconfig-001-20250520    gcc-8.5.0
sparc64               randconfig-002-20250520    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250520    clang-21
um                    randconfig-002-20250520    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250520    gcc-12
x86_64      buildonly-randconfig-002-20250520    gcc-12
x86_64      buildonly-randconfig-003-20250520    gcc-12
x86_64      buildonly-randconfig-004-20250520    gcc-12
x86_64      buildonly-randconfig-005-20250520    gcc-12
x86_64      buildonly-randconfig-006-20250520    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250520    gcc-6.5.0
xtensa                randconfig-002-20250520    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

