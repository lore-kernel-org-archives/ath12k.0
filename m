Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A015FC0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cp475zng68yaB2lHl6ELqH1LEoBnZEw/gAuQjZ6/XkI=; b=Kb5WIRONPSSGvm4lVsDgVIGko2
	1cx04vg4xxKbrfonhffKIRc0IqeKMp7881Ms4KHFp1f1f4hNtWAJSNCZgNanluZWQ3unsdDMbSL3E
	znVr/Eks2tQZZT6buh6utkncfCQTYeZxWza8X62wKt/1tAmIm+JUJdzpHXmMxRZUjpQiYayHMUjVT
	ONjseSGhdFDe0FWhqCOEz4+QzcPBClnIsMbR3hS3TFMZ643UDt2dQWrn8HrbZ5a2ot1+jhy7hSLJi
	XHa0AOEfTGEKer5XyuZNbvvdkbs6yVbb6n/xcNTyfmoeXGwHNyKyCUXiLlUln6aid771jXZgaB693
	Z2IE+jYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdU7w-00000008npj-1TM0
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 12:58:36 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdU7u-00000008npM-19te
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 12:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738241914; x=1769777914;
  h=date:from:to:cc:subject:message-id;
  bh=XvekN2g0HxY+OKiPudeQie9+VWxfLYtPGikR90Vhp+4=;
  b=SdwET0Wz2UEJ/UI4NVgakyzSgTuLl8FiJrfPOetkroD1YWIPxWixAUqO
   OXAuelv06YPf3B7kjFWpp0My0+qi8+AsHw9i692AFHwW8+qCUWrdgqDRB
   yx55/31napfpzRu68LBk3FBhVWgSPYFQx8ie8lbJhmVr9o9czQ0YQLv8C
   pMAvjF8wC1BpuWibveo6iK2yWuAfdoYx1hxdGp1ZzsfYqvqTQio6w8J7E
   EdeYvZVLZ3u/MOSXKGCiwlg9XwsOQW7MmUS1mrLUPeH9RIHdpDDWHDrIj
   g9TodYnboaFBF/+jwEqwHFTCb6nJuE8ugLMLC4wldrAVztnAVpbg1gz35
   g==;
X-CSE-ConnectionGUID: Vt4G+SuOQhmwcz/62jnPpA==
X-CSE-MsgGUID: Ltz4XIZYRmiaDxu8BrGLjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49436320"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="49436320"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 04:58:33 -0800
X-CSE-ConnectionGUID: Q/qG7XQIRa2cWpF9D2gN4Q==
X-CSE-MsgGUID: LnPhKZ0+TvSR3CXr0g9Idg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110226041"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Jan 2025 04:58:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdU7q-000k4B-0u;
	Thu, 30 Jan 2025 12:58:30 +0000
Date: Thu, 30 Jan 2025 20:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 bee577165a0a375a1d47d8ddef1c321e0f7dd6c8
Message-ID: <202501302014.D3nEg6TH-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_045834_329242_800723FB 
X-CRM114-Status: UNSURE (   4.08  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: bee577165a0a375a1d47d8ddef1c321e0f7dd6c8  wifi: ath11k: remove peer extra rssi update

elapsed time: 1154m

configs tested: 121
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250130    gcc-13.2.0
arc                   randconfig-002-20250130    gcc-13.2.0
arc                           tb10x_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                        mvebu_v7_defconfig    clang-15
arm                   randconfig-001-20250130    gcc-14.2.0
arm                   randconfig-002-20250130    clang-20
arm                   randconfig-003-20250130    gcc-14.2.0
arm                   randconfig-004-20250130    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250130    clang-20
arm64                 randconfig-002-20250130    gcc-14.2.0
arm64                 randconfig-003-20250130    clang-20
arm64                 randconfig-004-20250130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250130    gcc-14.2.0
csky                  randconfig-002-20250130    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250130    clang-20
hexagon               randconfig-002-20250130    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250130    clang-19
i386        buildonly-randconfig-002-20250130    clang-19
i386        buildonly-randconfig-003-20250130    gcc-11
i386        buildonly-randconfig-004-20250130    gcc-12
i386        buildonly-randconfig-005-20250130    gcc-12
i386        buildonly-randconfig-006-20250130    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250130    gcc-14.2.0
loongarch             randconfig-002-20250130    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250130    gcc-14.2.0
nios2                 randconfig-002-20250130    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250130    gcc-14.2.0
parisc                randconfig-002-20250130    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250130    gcc-14.2.0
powerpc               randconfig-002-20250130    clang-16
powerpc               randconfig-003-20250130    gcc-14.2.0
powerpc64             randconfig-001-20250130    gcc-14.2.0
powerpc64             randconfig-002-20250130    clang-20
powerpc64             randconfig-003-20250130    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250130    clang-20
riscv                 randconfig-002-20250130    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250130    gcc-14.2.0
s390                  randconfig-002-20250130    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250130    gcc-14.2.0
sh                    randconfig-002-20250130    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250130    gcc-14.2.0
sparc                 randconfig-002-20250130    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250130    gcc-14.2.0
sparc64               randconfig-002-20250130    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250130    gcc-12
um                    randconfig-002-20250130    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250130    clang-19
x86_64      buildonly-randconfig-002-20250130    gcc-12
x86_64      buildonly-randconfig-003-20250130    gcc-12
x86_64      buildonly-randconfig-004-20250130    clang-19
x86_64      buildonly-randconfig-005-20250130    gcc-12
x86_64      buildonly-randconfig-006-20250130    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250130    gcc-14.2.0
xtensa                randconfig-002-20250130    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

