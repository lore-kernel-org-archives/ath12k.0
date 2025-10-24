Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2D2CCF9E3
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vCoAX5/BIwJPsZXbbInp+X60Ev+C33HD5g/QV/ccLYo=; b=VGUeg8OUYcLc3PcK4xmXupgxQ+
	0H2TN15M7twOQgr/bymQcmz5SFNoBYP5K/mBRzo9nInSjw3DxvWVaRcHtQkrVuEEUjiKB7R1nKgEi
	jK5kdhtOY38Vmq+9CFUwScE/XR1nuD7av/IV5gwUYul5bw6n0fdvxOBJgjK36Pf7wqErlqXF6xmRo
	oHhLqft4K3HhMcJyoKiwmVYa95VqQj7tLztebX8PwLN3RkFJYeVFqNYSA71hnRtCEXDcBD+7PuH3R
	RZb0ZABJz1ji5zGMwYvWRwTXZqZfAgAcJenvoqYhZ1gPlGWe1e2F3sZgapFe+16gSwHw/WXQAHdNx
	4VC4HXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ1m-00000009hD7-35jH;
	Fri, 24 Oct 2025 14:44:26 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ1j-00000009hCk-37Xy
	for ath12k@lists.infradead.org;
	Fri, 24 Oct 2025 14:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761317063; x=1792853063;
  h=date:from:to:cc:subject:message-id;
  bh=xs4b2ednjBzN9Y0VKAHjXPuH8YAI64rPKDpvjdrJXp4=;
  b=bfj17Ku66QSu7CsSNideAybqfOPoks1CrV0w+u/+wXjUhuivPbSeuGbe
   kqpLU/ZxQAOKeIb0evPVIXQzLduQb0eSrj3MtMiBCAniC5zKx5IsZUTfH
   3KQuUUxQuAAk81GttLRpiVFq9bhDTNnO2h+HwBP4WYmWypPPA+kV9nk8H
   tDtzQ5YuP58dgtxsbvG15YCE0BKSYBBU9WPIN7kKKGMT4X1sHiaYYMuHh
   +GlQ8fYTXpJWPx2koG+XcGQ9nossaVK5knhuX9ncw3saKO2T8xgiTprxN
   ADYwuk8/ovJ47qNetEwLBXrByxfH7lH5Bpt78ftCbPcKaovPVcVMbH8+0
   g==;
X-CSE-ConnectionGUID: 8dmJvjQZRIqKM28bi/BAJw==
X-CSE-MsgGUID: EUacA1cIRCKXXTQLwwkZYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74618878"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="74618878"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 07:44:23 -0700
X-CSE-ConnectionGUID: +7GSl+vmTFKrZHNsD+jxHQ==
X-CSE-MsgGUID: cwiJgbq6Rjy70sNCYWRvHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="189689910"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2025 07:44:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCJ1f-000EZG-1H;
	Fri, 24 Oct 2025 14:44:19 +0000
Date: Fri, 24 Oct 2025 22:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending-deferred] BUILD SUCCESS
 af4362cb53829896d7d656f74a22b6398ab5b9ef
Message-ID: <202510242225.i9h12sU4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_074423_857120_CEFBE90D 
X-CRM114-Status: UNSURE (   3.65  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
branch HEAD: af4362cb53829896d7d656f74a22b6398ab5b9ef  wifi: ath12k: Assert base_lock is held before allocating REO update element

elapsed time: 1448m

configs tested: 177
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251023    gcc-8.5.0
arc                   randconfig-001-20251024    clang-22
arc                   randconfig-002-20251023    gcc-8.5.0
arc                   randconfig-002-20251024    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20251023    clang-22
arm                   randconfig-001-20251024    clang-22
arm                   randconfig-002-20251023    clang-19
arm                   randconfig-002-20251024    clang-22
arm                   randconfig-003-20251023    gcc-8.5.0
arm                   randconfig-003-20251024    clang-22
arm                   randconfig-004-20251023    gcc-8.5.0
arm                   randconfig-004-20251024    clang-22
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251023    clang-22
arm64                 randconfig-001-20251024    clang-22
arm64                 randconfig-002-20251023    gcc-8.5.0
arm64                 randconfig-002-20251024    clang-22
arm64                 randconfig-003-20251023    gcc-8.5.0
arm64                 randconfig-003-20251024    clang-22
arm64                 randconfig-004-20251023    clang-17
arm64                 randconfig-004-20251024    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251023    gcc-11.5.0
csky                  randconfig-001-20251024    gcc-8.5.0
csky                  randconfig-002-20251023    gcc-13.4.0
csky                  randconfig-002-20251024    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251023    clang-22
hexagon               randconfig-001-20251024    gcc-8.5.0
hexagon               randconfig-002-20251023    clang-22
hexagon               randconfig-002-20251024    gcc-8.5.0
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251023    clang-20
i386        buildonly-randconfig-002-20251023    clang-20
i386        buildonly-randconfig-003-20251023    gcc-14
i386        buildonly-randconfig-004-20251023    clang-20
i386        buildonly-randconfig-005-20251023    clang-20
i386        buildonly-randconfig-006-20251023    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20251024    clang-20
i386                  randconfig-012-20251024    clang-20
i386                  randconfig-013-20251024    clang-20
i386                  randconfig-014-20251024    clang-20
i386                  randconfig-015-20251024    clang-20
i386                  randconfig-016-20251024    clang-20
i386                  randconfig-017-20251024    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251023    clang-22
loongarch             randconfig-001-20251024    gcc-8.5.0
loongarch             randconfig-002-20251023    clang-18
loongarch             randconfig-002-20251024    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-22
mips                         rt305x_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251023    gcc-8.5.0
nios2                 randconfig-001-20251024    gcc-8.5.0
nios2                 randconfig-002-20251023    gcc-8.5.0
nios2                 randconfig-002-20251024    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251023    gcc-9.5.0
parisc                randconfig-001-20251024    gcc-8.5.0
parisc                randconfig-002-20251023    gcc-8.5.0
parisc                randconfig-002-20251024    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251023    gcc-12.5.0
powerpc               randconfig-001-20251024    gcc-8.5.0
powerpc               randconfig-002-20251023    clang-22
powerpc               randconfig-002-20251024    gcc-8.5.0
powerpc               randconfig-003-20251023    clang-22
powerpc               randconfig-003-20251024    gcc-8.5.0
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251023    clang-22
powerpc64             randconfig-001-20251024    gcc-8.5.0
powerpc64             randconfig-002-20251023    gcc-10.5.0
powerpc64             randconfig-002-20251024    gcc-8.5.0
powerpc64             randconfig-003-20251023    gcc-10.5.0
powerpc64             randconfig-003-20251024    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251023    gcc-8.5.0
riscv                 randconfig-002-20251023    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251023    clang-19
s390                  randconfig-002-20251023    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251023    gcc-15.1.0
sh                    randconfig-002-20251023    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251023    gcc-12.5.0
sparc                 randconfig-002-20251023    gcc-8.5.0
sparc64               randconfig-001-20251023    clang-22
sparc64               randconfig-002-20251023    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251023    gcc-13
um                    randconfig-002-20251023    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251023    clang-20
x86_64      buildonly-randconfig-002-20251023    gcc-13
x86_64      buildonly-randconfig-003-20251023    clang-20
x86_64      buildonly-randconfig-004-20251023    gcc-14
x86_64      buildonly-randconfig-005-20251023    clang-20
x86_64      buildonly-randconfig-006-20251023    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251024    clang-20
x86_64                randconfig-072-20251024    clang-20
x86_64                randconfig-073-20251024    clang-20
x86_64                randconfig-074-20251024    clang-20
x86_64                randconfig-075-20251024    clang-20
x86_64                randconfig-076-20251024    clang-20
x86_64                randconfig-077-20251024    clang-20
x86_64                randconfig-078-20251024    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251023    gcc-8.5.0
xtensa                randconfig-002-20251023    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

