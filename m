Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCFEC3ABBE
	for <ath12k@archiver.kernel.org>; Thu,  8 May 2025 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NsnYBz6ZUIEK7uwd90qepz+jqH2C7oA65kKeKrTeAgc=; b=qnCf4OACm2K6MlT5yn7nqtfQEj
	h8kfnK/mPBCd+ycF4QZ1AtlIHYx/E5ubwvLuJvm1FAp8zJFxkOyv/R8mbV5MppFXng95IyaMjlxsG
	9rir7As5SwDsisFhV+OIEsu7HWY8ROoZVF6miYYV8KiBnaVGKBHbcqm4guF2U5PWj6/yuvdioSSX1
	URzlM/aiV/9yaBM37aJSH0M9t2k91nf/D/A63SJDMtP3QXMdMUxu4291wUoQc/qHN2+94ZF0bJdqU
	C0wA868o+M8bfynb/kE9s+CBa7oosxmmmsctROVy0xPOWEYp78ov+wFixZEHyN9uuUM1c1p5brd9h
	RdwAr3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4wA-00000001NmF-3K0E;
	Thu, 08 May 2025 17:21:34 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4lU-00000001Lnn-2zJh
	for ath12k@lists.infradead.org;
	Thu, 08 May 2025 17:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746724232; x=1778260232;
  h=date:from:to:cc:subject:message-id;
  bh=tqiEg6/d1jVfNvE8r9qipoon6tcahegdV9WJ33vva7w=;
  b=gci4Wc1eaWjAvHHWt1lBCZ1cGN+K1OesHzeAWVpst5aMWo1ORZ8cMiHq
   DJo8oF8B4Q6NtbC8jOy+HnzaKpa/QK5p0zE14OTKa4wjiCf/TdZok8euF
   m3AxDshWB2XV/fDWU1qYhXgnOFxoerDiHqs446il/GnFDt1hX9hHEUrkD
   CvA0PMt3tsQrBgdG49iY7iG+iGLM96AE747TmP6oxLcgHnKi27h7UY4es
   hLzGEZP3A5tuxxYHo6MCvBSA8pAtOM7sszs0fMU/CqrgPuGsogTrWkVUH
   67eUUWEw25agz0KbBtG9JIc7RfVaJTPOUxj6e8fOWMzzXT1RZU0SpcYrM
   w==;
X-CSE-ConnectionGUID: XyM5LImFTguKdzK4eWozPA==
X-CSE-MsgGUID: ceqaBKVtSHOulnpD5RyQrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59922615"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59922615"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 10:10:24 -0700
X-CSE-ConnectionGUID: xQYjou2pRM+fMk3V1s57rw==
X-CSE-MsgGUID: u2eG9FtwRAmnKypxA+/WpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="141317679"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 May 2025 10:10:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD4lJ-000BCN-1I;
	Thu, 08 May 2025 17:10:21 +0000
Date: Fri, 09 May 2025 01:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 72c6feb45f22089b209099aca544ae2af7cbc7df
Message-ID: <202505090140.DOWSvIXb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_101032_798734_5CB74256 
X-CRM114-Status: UNSURE (   3.42  )
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
branch HEAD: 72c6feb45f22089b209099aca544ae2af7cbc7df  wifi: ath12k: fix ring-buffer corruption

elapsed time: 1364m

configs tested: 147
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250508    gcc-8.5.0
arc                   randconfig-002-20250508    gcc-8.5.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250508    gcc-8.5.0
arm                   randconfig-002-20250508    gcc-8.5.0
arm                   randconfig-003-20250508    gcc-8.5.0
arm                   randconfig-004-20250508    gcc-8.5.0
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                 randconfig-001-20250508    gcc-8.5.0
arm64                 randconfig-002-20250508    gcc-8.5.0
arm64                 randconfig-003-20250508    gcc-8.5.0
arm64                 randconfig-004-20250508    gcc-8.5.0
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                  randconfig-001-20250508    gcc-10.5.0
csky                  randconfig-002-20250508    gcc-10.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon               randconfig-001-20250508    gcc-10.5.0
hexagon               randconfig-002-20250508    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250508    clang-20
i386        buildonly-randconfig-002-20250508    clang-20
i386        buildonly-randconfig-003-20250508    clang-20
i386        buildonly-randconfig-004-20250508    clang-20
i386        buildonly-randconfig-005-20250508    clang-20
i386        buildonly-randconfig-006-20250508    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20250508    clang-20
i386                  randconfig-012-20250508    clang-20
i386                  randconfig-013-20250508    clang-20
i386                  randconfig-014-20250508    clang-20
i386                  randconfig-015-20250508    clang-20
i386                  randconfig-016-20250508    clang-20
i386                  randconfig-017-20250508    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch             randconfig-001-20250508    gcc-10.5.0
loongarch             randconfig-002-20250508    gcc-10.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250508    gcc-10.5.0
nios2                 randconfig-002-20250508    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250508    gcc-10.5.0
parisc                randconfig-002-20250508    gcc-10.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                       ebony_defconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250508    gcc-10.5.0
powerpc               randconfig-002-20250508    gcc-10.5.0
powerpc               randconfig-003-20250508    gcc-10.5.0
powerpc64             randconfig-001-20250508    gcc-10.5.0
powerpc64             randconfig-002-20250508    gcc-10.5.0
powerpc64             randconfig-003-20250508    gcc-10.5.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20250508    gcc-7.5.0
riscv                 randconfig-002-20250508    gcc-7.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250508    gcc-7.5.0
s390                  randconfig-002-20250508    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250508    gcc-7.5.0
sh                    randconfig-002-20250508    gcc-7.5.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250508    gcc-7.5.0
sparc                 randconfig-002-20250508    gcc-7.5.0
sparc64               randconfig-001-20250508    gcc-7.5.0
sparc64               randconfig-002-20250508    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                             i386_defconfig    gcc-14.2.0
um                    randconfig-001-20250508    gcc-7.5.0
um                    randconfig-002-20250508    gcc-7.5.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250508    clang-20
x86_64      buildonly-randconfig-002-20250508    clang-20
x86_64      buildonly-randconfig-003-20250508    clang-20
x86_64      buildonly-randconfig-004-20250508    clang-20
x86_64      buildonly-randconfig-005-20250508    clang-20
x86_64      buildonly-randconfig-006-20250508    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250508    gcc-7.5.0
xtensa                randconfig-002-20250508    gcc-7.5.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

