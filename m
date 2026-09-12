Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38C4C79FB6
	for <ath12k@archiver.kernel.org>; Sat, 12 Sep 2026 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xh8B1oSCsbuQgMflrIP24SyMUEaNiC+XW8ivLDhAgQU=; b=xLosVN+VnOiqLJjS/cUJGVS2j0
	HO21aVy6//zUAUZHg/SCHgf0DF+nWlaVhx4R0Xyi7hkOkrFJxP5D17ngDqT3YVqdZO7AgT6CtP76T
	JU0ssf6EN3fPxfjDK4Hk8nVzZKnZgysssgW4DzBbtn6B8+TBbd2OyfTos4BpmxYQB9124FxX4gRNp
	sTQIyLK9K/uPSfuLMtX+wG22h/Rb+FKKdfr3FfWWFCp7uFYjX2ZVFADrLxzW/upW9u4GWCWLplSWz
	gdARqExBph9xzfhrTPaMcWpWh1kvpGoyujHPFKWH1d4OKn1T+jlmMoUCFbhkR9+h7INcXpSQ6UmGw
	cDmz/Yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LVb-00000000oCh-1JMQ;
	Sat, 12 Sep 2026 11:02:59 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LVY-00000000oCL-0NPP
	for ath12k@lists.infradead.org;
	Sat, 12 Sep 2026 11:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789210976; x=1820746976;
  h=date:from:to:cc:subject:message-id;
  bh=d763tiQsgyCNYdlCb2S9XMB9TWdsD7yCeM3aHt1/HiQ=;
  b=KVOZRRlPs+zvtzgdeUyGO0fEGZ6Gj29eXJwUawuriwxCjr5jN+4Wjal7
   i+XI1VkTP1bt+cQsDV///0dvRrwHTixfUTAaLjuSTcsaBwjyRU4NOlRPO
   OtRJQCPyEokMQM5PLaXQOB445/IgTVoqJ4YTxKfDcV52U20HWwxI6s5ar
   ZGU07NckBFp1oASk/uFmKMmbZzbt33+7s1D3I89HXR5xNhpWqWMaNLO42
   8/VEmzK2OTNRn/rW83KZGCNwldgECwDMjipTsk91GYRTcHHnP0oD3EPIG
   eZmjeGMAGta8J9GKSw0g+DB4thXlOUAlrvddD5ri4DF8b6mkp5Tp0JqaD
   g==;
X-CSE-ConnectionGUID: E/MsHCnlSiG1cMn14qedYg==
X-CSE-MsgGUID: upCQm4ISTa+zzVRuSiVSIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89530731"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89530731"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:02:54 -0700
X-CSE-ConnectionGUID: NC5v7WXbRjqZnXlUL9f6BQ==
X-CSE-MsgGUID: eb+5JOflTHW5P2WBH6B4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="271675312"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Sep 2026 04:02:53 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5LU8-000000002sz-1q5Q;
	Sat, 12 Sep 2026 11:01:57 +0000
Date: Sat, 12 Sep 2026 19:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 6b6cdb336d5a5db551c89d4419372776f2c45ebc
Message-ID: <202609121903.veLiDJFu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_040256_169267_CA8D0845 
X-CRM114-Status: UNSURE (   4.18  )
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
branch HEAD: 6b6cdb336d5a5db551c89d4419372776f2c45ebc  wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()

elapsed time: 2078m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                         haps_hs_defconfig    gcc-16.1.0
arc                   randconfig-001-20260912    gcc-11.5.0
arc                   randconfig-002-20260912    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                         assabet_defconfig    clang-22
arm                         lpc18xx_defconfig    clang-24
arm                            mmp2_defconfig    gcc-16.1.0
arm                   randconfig-001-20260912    gcc-10.5.0
arm                   randconfig-002-20260912    clang-18
arm                   randconfig-003-20260912    gcc-13.4.0
arm                   randconfig-004-20260912    clang-17
arm                         s5pv210_defconfig    gcc-16.1.0
arm                           stm32_defconfig    gcc-16.1.0
arm64                             allnoconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-24
hexagon               randconfig-001-20260912    clang-22
hexagon               randconfig-002-20260912    clang-17
i386                              allnoconfig    gcc-14
i386                  randconfig-001-20260912    gcc-14
i386                  randconfig-002-20260912    gcc-14
i386                  randconfig-003-20260912    clang-22
i386                  randconfig-004-20260912    gcc-14
i386                  randconfig-005-20260912    gcc-12
i386                  randconfig-006-20260912    gcc-12
i386                  randconfig-007-20260912    clang-22
i386                  randconfig-011-20260912    clang-22
i386                  randconfig-012-20260912    gcc-13
i386                  randconfig-013-20260912    gcc-14
i386                  randconfig-014-20260912    clang-22
i386                  randconfig-015-20260912    clang-22
i386                  randconfig-017-20260912    gcc-14
loongarch                        alldefconfig    clang-24
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260912    clang-24
loongarch             randconfig-002-20260912    gcc-13.4.0
m68k                              allnoconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                          eyeq5_defconfig    gcc-16.1.0
mips                          malta_defconfig    gcc-16.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260912    gcc-8.5.0
nios2                 randconfig-002-20260912    gcc-11.5.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260912    gcc-8.5.0
parisc                randconfig-002-20260912    gcc-8.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc                        fsp2_defconfig    gcc-16.1.0
powerpc                 mpc836x_rdk_defconfig    clang-24
powerpc               randconfig-001-20260912    gcc-13.4.0
powerpc               randconfig-002-20260912    clang-24
powerpc64             randconfig-001-20260912    clang-24
powerpc64             randconfig-002-20260912    gcc-8.5.0
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-24
riscv                               defconfig    clang-24
riscv                 randconfig-001-20260912    gcc-15.2.0
riscv                 randconfig-002-20260912    clang-24
s390                             allmodconfig    clang-24
s390                              allnoconfig    clang-24
s390                                defconfig    clang-18
s390                  randconfig-001-20260912    clang-24
s390                  randconfig-002-20260912    clang-17
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                               j2_defconfig    gcc-16.1.0
sh                     magicpanelr2_defconfig    gcc-16.1.0
sh                    randconfig-001-20260912    gcc-9.5.0
sh                    randconfig-002-20260912    gcc-11.5.0
sh                           se7343_defconfig    gcc-16.1.0
sh                        sh7785lcr_defconfig    gcc-16.1.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260912    gcc-12.5.0
sparc                 randconfig-002-20260912    gcc-14.3.0
sparc64                             defconfig    clang-24
sparc64               randconfig-001-20260912    clang-24
sparc64               randconfig-002-20260912    clang-20
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                  defconfig    clang-24
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260912    gcc-14
um                    randconfig-002-20260912    clang-24
um                           x86_64_defconfig    clang-24
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260912    gcc-14
x86_64      buildonly-randconfig-002-20260912    gcc-14
x86_64      buildonly-randconfig-003-20260912    gcc-14
x86_64      buildonly-randconfig-004-20260912    gcc-14
x86_64      buildonly-randconfig-005-20260912    clang-22
x86_64      buildonly-randconfig-006-20260912    gcc-12
x86_64                              defconfig    gcc-14
x86_64                randconfig-013-20260912    gcc-14
x86_64                randconfig-071-20260912    gcc-14
x86_64                randconfig-072-20260912    gcc-14
x86_64                randconfig-073-20260912    gcc-14
x86_64                randconfig-074-20260912    clang-22
x86_64                randconfig-075-20260912    gcc-14
x86_64                randconfig-076-20260912    gcc-14
xtensa                            allnoconfig    gcc-16.1.0
xtensa                randconfig-001-20260912    gcc-16.1.0
xtensa                randconfig-002-20260912    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

