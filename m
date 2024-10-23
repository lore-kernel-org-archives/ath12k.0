Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92254CF5366
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vjnsVWtXd7q/h8hWEAp7Q7++HeeSoIs5pYqpkZfCtK8=; b=pmQFNkc45YBQb2pZlB1fRHOqET
	7BU9fPniU+W48gqKmnzkVCG810qmk/4H+PzcbA1RkCMjWR6ttdtJ51spH2JSGLfEvyz3PfLsRxlq3
	wcphRIyu9dLnUd2cXQxVjQYVfGTWdfQZVotoJbDQ86gosTtp9dZ9ZV0KfdIuLUAvIsjx4ptnM7Xdg
	EMm0e+akwb+zkuVf5k1abO+7DUGF7kHjrNFdhnuD3J4XI24cxsV5EOcVO/qWOfY6m3+JUZykZjTVu
	nVhWJ+aP0lgIyxiyH+RNfT+U9F3lqUqzv5TR9AGTEu/qVge+VQszlTZesMlpBlu6zTqgf1QLmBZX+
	YzCzjAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLy-0000000EIxI-3PH1
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 12:20:42 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3a8a-0000000EGNk-2kFj
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 12:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729685213; x=1761221213;
  h=date:from:to:cc:subject:message-id;
  bh=8CmrnF2hIFJO92jOEbFg7D4MwzTa8c1X66XOM33ukBw=;
  b=TDIUr+bK3lPEPpyKnYif//cUwEx/9aDuqgC52WBiclu9UErbUnEgsBuY
   td9hlYC672kgOhflcY421uGSpTewhOSnUTCcnURfOnm1K9eEsqliaEizi
   0/tnJSP8w+9ZmAWMRXohPPm7zEnays5HDdr4LqZficpDhA2KAwaRkHqOV
   jFxtxrwpYEOwwSjpusgPUV5+PAps96CbJtJuXXy5PWjC/+1s6bE4FMWOT
   bapceCl+gdjqJs/xQ+/ix1Ofgnk16JUk1rhFnHZHyQLZ+3vxsJrL6AzyP
   or8C/8xFIH4tE6N1wwas/W/wJ9sS0wyvNI6jnRyI+ofzMUeU1kODULU4v
   g==;
X-CSE-ConnectionGUID: l/fV6qK+Sf2wSQI64W1veg==
X-CSE-MsgGUID: KdHDVrrTQvC2Ovc7WQ83NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29426696"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29426696"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 05:06:52 -0700
X-CSE-ConnectionGUID: fjLn93rnQM2QMV3MCtMYGw==
X-CSE-MsgGUID: iLAlnPiOTxOll7jgToJApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80110724"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 05:06:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3a8W-000UsW-0Y;
	Wed, 23 Oct 2024 12:06:48 +0000
Date: Wed, 23 Oct 2024 20:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 52cca6057b82fdfc9350c4815be5ba21dfe27759
Message-ID: <202410232030.DvxYQ0RO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_050652_772958_176BD3EA 
X-CRM114-Status: UNSURE (   3.48  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
branch HEAD: 52cca6057b82fdfc9350c4815be5ba21dfe27759  wifi: ath12k: handle ath12k_bss_assoc for MLO

elapsed time: 1010m

configs tested: 146
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                       imx_v4_v5_defconfig    clang-20
arm                        shmobile_defconfig    clang-20
arm                    vt8500_v6_v7_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241023    clang-18
i386        buildonly-randconfig-002-20241023    clang-18
i386        buildonly-randconfig-003-20241023    clang-18
i386        buildonly-randconfig-004-20241023    clang-18
i386        buildonly-randconfig-005-20241023    clang-18
i386        buildonly-randconfig-006-20241023    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241023    clang-18
i386                  randconfig-002-20241023    clang-18
i386                  randconfig-003-20241023    clang-18
i386                  randconfig-004-20241023    clang-18
i386                  randconfig-005-20241023    clang-18
i386                  randconfig-006-20241023    clang-18
i386                  randconfig-011-20241023    clang-18
i386                  randconfig-012-20241023    clang-18
i386                  randconfig-013-20241023    clang-18
i386                  randconfig-014-20241023    clang-18
i386                  randconfig-015-20241023    clang-18
i386                  randconfig-016-20241023    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             alldefconfig    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    clang-20
mips                            gpr_defconfig    clang-20
mips                           ip28_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       holly_defconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-20
sh                          kfr2r09_defconfig    clang-20
sh                           se7724_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241023    gcc-12
x86_64      buildonly-randconfig-002-20241023    gcc-12
x86_64      buildonly-randconfig-003-20241023    gcc-12
x86_64      buildonly-randconfig-004-20241023    gcc-12
x86_64      buildonly-randconfig-005-20241023    gcc-12
x86_64      buildonly-randconfig-006-20241023    gcc-12
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241023    gcc-12
x86_64                randconfig-002-20241023    gcc-12
x86_64                randconfig-003-20241023    gcc-12
x86_64                randconfig-004-20241023    gcc-12
x86_64                randconfig-005-20241023    gcc-12
x86_64                randconfig-006-20241023    gcc-12
x86_64                randconfig-011-20241023    gcc-12
x86_64                randconfig-012-20241023    gcc-12
x86_64                randconfig-013-20241023    gcc-12
x86_64                randconfig-014-20241023    gcc-12
x86_64                randconfig-015-20241023    gcc-12
x86_64                randconfig-016-20241023    gcc-12
x86_64                randconfig-071-20241023    gcc-12
x86_64                randconfig-072-20241023    gcc-12
x86_64                randconfig-073-20241023    gcc-12
x86_64                randconfig-074-20241023    gcc-12
x86_64                randconfig-075-20241023    gcc-12
x86_64                randconfig-076-20241023    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

