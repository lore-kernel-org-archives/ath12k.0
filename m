Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBE9CCF9F8
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5fpOJE8u0sqYbRtnlzn3SLG9hElKQE3ZiO+egt1uycw=; b=BISA2uFIxXvUi7RMscaXEE1xAt
	+CC6zWygGL2dlXHiW0N7t6hKzoEEsXZr7rJ360W8L0B6a6C1NSrYQJWwFhV8w8hepEYBfQJKBZjAI
	w+pcg7ZoVSe6SuStPYzXYaxb+GRziiefAp5hv2oxEfC4fwbOI8NLPnvF1ye9rgPWstMUb9gnjPV3D
	zhXY3F+bSPEJ2yELqNgbfvJaaaVVo18WRVQg0glT/SHUTWQHdfluuHR9beuFAt6bYb0Pk4E8HGHsF
	KQX43GDzDyIrmyUjpulSQLLigji6Mjc3DBSsn3XcbwR065JeUvurA+2OB0UBUn29h/VRjFBzDUTTZ
	mVDtjnaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVSp-00000004SZ3-1kOF;
	Thu, 30 Oct 2025 16:25:27 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVSm-00000004SYf-3DqN
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 16:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761841524; x=1793377524;
  h=date:from:to:cc:subject:message-id;
  bh=rCYlpn4TK29HtmH2TrBmiX9xVbmpvp53efo48xPcJek=;
  b=MZd5RvAkT+P5c0RnY/+qKgyEw5xPkog3kgKpyH2Mo5FP+QHdgnY01LxZ
   W/lQAQW42cfY7tfPCZnBzmzVxKWFAzlbMBRYRMeaTe3aGVeBTeDjPPJg0
   Q+Is/cf+TDkwWuvNgfcxDoHg+UP680Sc3eKghkSb6QgDv8ACN5vIhvbHg
   D9xglgMDT1tSNZM/fF2kZWR1x98A5q0Ld3szz26/8iYfI1NvnGTh/zbff
   ZVdycKIoFwSyGlb3ahR6RdH2r6621Lic/tLkUO80O5cOTKDfVkpE5qLkM
   sJYEDknSQ9ClkgbUmlb53UbujUbRQNIXwp/mBj1xTMt4+cfKYxQGratXT
   A==;
X-CSE-ConnectionGUID: 5D7QzPQXSFW4nEBlQUCJdA==
X-CSE-MsgGUID: QkjdAIRZTlqZq9+JNTSHAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67825098"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67825098"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 09:25:22 -0700
X-CSE-ConnectionGUID: SRmkT4LtSZe8RDydaSZ0cg==
X-CSE-MsgGUID: bh/YGCFDQ52M+hfeXCBR5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186733302"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Oct 2025 09:25:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEVSE-000MDU-35;
	Thu, 30 Oct 2025 16:24:56 +0000
Date: Fri, 31 Oct 2025 00:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 43d31f3f26f766f357e95513ba75c5126ce17d4b
Message-ID: <202510310036.eBUldYlY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_092524_845099_A0FF5FEB 
X-CRM114-Status: UNSURE (   3.98  )
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
branch HEAD: 43d31f3f26f766f357e95513ba75c5126ce17d4b  spi: amlogic: fix spifc build error

elapsed time: 1448m

configs tested: 113
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20251030    gcc-11.5.0
arc                   randconfig-002-20251030    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                        keystone_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-001-20251030    gcc-10.5.0
arm                   randconfig-002-20251030    clang-19
arm                   randconfig-003-20251030    clang-22
arm                   randconfig-004-20251030    clang-22
arm                           sama7_defconfig    clang-22
arm64                            alldefconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251030    gcc-12.5.0
arm64                 randconfig-002-20251030    gcc-8.5.0
arm64                 randconfig-003-20251030    clang-17
arm64                 randconfig-004-20251030    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251030    gcc-13.4.0
csky                  randconfig-002-20251030    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251030    clang-22
hexagon               randconfig-002-20251030    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251030    clang-20
i386        buildonly-randconfig-002-20251030    gcc-14
i386        buildonly-randconfig-003-20251030    clang-20
i386        buildonly-randconfig-004-20251030    clang-20
i386        buildonly-randconfig-005-20251030    gcc-14
i386        buildonly-randconfig-006-20251030    clang-20
i386                  randconfig-001-20251030    gcc-14
i386                  randconfig-002-20251030    gcc-14
i386                  randconfig-003-20251030    clang-20
i386                  randconfig-004-20251030    clang-20
i386                  randconfig-005-20251030    clang-20
i386                  randconfig-006-20251030    clang-20
i386                  randconfig-007-20251030    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251030    clang-22
loongarch             randconfig-002-20251030    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-22
mips                       bmips_be_defconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251030    gcc-8.5.0
nios2                 randconfig-002-20251030    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251030    gcc-8.5.0
parisc                randconfig-002-20251030    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    clang-19
powerpc                    gamecube_defconfig    clang-22
powerpc               randconfig-001-20251030    clang-22
powerpc               randconfig-002-20251030    clang-22
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251030    gcc-8.5.0
powerpc64             randconfig-002-20251030    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20251030    gcc-13.4.0
riscv                 randconfig-002-20251030    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251030    clang-17
s390                  randconfig-002-20251030    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251030    gcc-15.1.0
sh                    randconfig-002-20251030    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251030    gcc-8.5.0
sparc                 randconfig-002-20251030    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251030    gcc-11.5.0
sparc64               randconfig-002-20251030    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251030    gcc-14
um                    randconfig-002-20251030    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251030    clang-20
x86_64      buildonly-randconfig-002-20251030    gcc-14
x86_64      buildonly-randconfig-003-20251030    gcc-13
x86_64      buildonly-randconfig-004-20251030    gcc-14
x86_64      buildonly-randconfig-005-20251030    clang-20
x86_64      buildonly-randconfig-006-20251030    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251030    clang-20
x86_64                randconfig-012-20251030    clang-20
x86_64                randconfig-013-20251030    gcc-13
x86_64                randconfig-014-20251030    gcc-14
x86_64                randconfig-015-20251030    clang-20
x86_64                randconfig-016-20251030    clang-20
x86_64                randconfig-071-20251030    gcc-14
x86_64                randconfig-072-20251030    gcc-14
x86_64                randconfig-073-20251030    clang-20
x86_64                randconfig-074-20251030    clang-20
x86_64                randconfig-075-20251030    gcc-13
x86_64                randconfig-076-20251030    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251030    gcc-10.5.0
xtensa                randconfig-002-20251030    gcc-13.4.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

