Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470B7D3C53D
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 00:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=anH24sadj6bRrc+Ecmchw2HYn0u1I2mBiN71H/QqkwI=; b=kBpBk1VaGSxPPXGI+22rlF9kId
	ramUI6la1ExJNbHGO3Rpwc7JRXCOerH21USIunK7RGMAzVCn5YdeljSju4DDM2QJI7qJCXXHCQzRV
	cVVwUbWt2nhGil9moAKYgkYoRAw04XCYWBNuOVcPV/hmiDTtFg5GjWnEBlj0qbqrRUfZqdmM869Uw
	ZnRre5nbgVdL8ifg70GkbOMPs5SwnIvtRCt8LtwkSgUoIxU5wVcBeKY1vBy9DYtmgrRUzyPnHFf8C
	iHCYzc8Ys6u5lLHMsEnYzr7BHB9o/rdUlZGs8L5tU4Ast+Er/36iTZFQ8vwC94UZu6cVqredcVI8u
	xaQ8SqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1bKc-0000000GXCY-3WiO
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 00:59:06 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1bKZ-0000000GXCB-1oEz
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 00:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729213143; x=1760749143;
  h=date:from:to:cc:subject:message-id;
  bh=HzIFndNnRdHSZKsYLDIaSoW9ZzgoHI/iUdn2cI931ek=;
  b=KEQquDccHrBTD8gzig3ucnvIhAWYa7cbpxXhSVNS7C0wU5XM+TmjlEeV
   BhKlgZW8X1rlLrGlNFdJI091YZt+AEl6B6bJHBAWfQVn0tORVyDsGfrvX
   BR33hRcNqTOvodQfTR82pEQl/DEqz/IVHcGvyljnG5qBZuXLLO/pot2sG
   srGa93L+mN0AtUcaK6yIGdc4LsvaguwGeW06NZLup4iv7y2X/y10IUiDg
   tiBCdH+x3ucvQEPEhEldaE4ExfhYNU7U/mqpgR9rruwAymSagu+PlH6a3
   17k20uDjCVzSCS/ft5Sx9ZAXkPZlhdvNDM3DXjYq2NE4yFhT30QX/uUeN
   Q==;
X-CSE-ConnectionGUID: 7DhpJ20EQuCiesaxyeW7DQ==
X-CSE-MsgGUID: cmCU02HTTImd8QyIBefqLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="46226828"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="46226828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 17:58:57 -0700
X-CSE-ConnectionGUID: sJkWy2PRQ7Gx7cMeFan8HQ==
X-CSE-MsgGUID: ALTBDyfFTN2VlMJjqDRPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="78764707"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Oct 2024 17:58:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1bKQ-000N5j-01;
	Fri, 18 Oct 2024 00:58:54 +0000
Date: Fri, 18 Oct 2024 08:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 fa934bf3e0a825ee09f035c6580af513187d59a2
Message-ID: <202410180817.1jx4JEmz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_175903_507975_D08B5334 
X-CRM114-Status: UNSURE (   3.73  )
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
branch HEAD: fa934bf3e0a825ee09f035c6580af513187d59a2  Add localversion-wireless-testing-ath

elapsed time: 1916m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                          exynos_defconfig    gcc-14.1.0
arm                       versatile_defconfig    gcc-14.1.0
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386                                defconfig    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                        m5272c3_defconfig    gcc-14.1.0
m68k                        stmark2_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                      mmu_defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    gcc-14.1.0
mips                           ip30_defconfig    gcc-14.1.0
nios2                            alldefconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                  iss476-smp_defconfig    gcc-14.1.0
powerpc                      pcm030_defconfig    gcc-14.1.0
powerpc                     redwood_defconfig    gcc-14.1.0
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
sh                            hp6xx_defconfig    gcc-14.1.0
sh                          sdk7786_defconfig    gcc-14.1.0
sh                           se7751_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241018    clang-18
x86_64      buildonly-randconfig-002-20241018    clang-18
x86_64      buildonly-randconfig-003-20241018    clang-18
x86_64      buildonly-randconfig-004-20241018    clang-18
x86_64      buildonly-randconfig-005-20241018    clang-18
x86_64      buildonly-randconfig-006-20241018    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241018    clang-18
x86_64                randconfig-002-20241018    clang-18
x86_64                randconfig-003-20241018    clang-18
x86_64                randconfig-004-20241018    clang-18
x86_64                randconfig-005-20241018    clang-18
x86_64                randconfig-006-20241018    clang-18
x86_64                randconfig-011-20241018    clang-18
x86_64                randconfig-012-20241018    clang-18
x86_64                randconfig-013-20241018    clang-18
x86_64                randconfig-014-20241018    clang-18
x86_64                randconfig-015-20241018    clang-18
x86_64                randconfig-016-20241018    clang-18
x86_64                randconfig-071-20241018    clang-18
x86_64                randconfig-072-20241018    clang-18
x86_64                randconfig-073-20241018    clang-18
x86_64                randconfig-074-20241018    clang-18
x86_64                randconfig-075-20241018    clang-18
x86_64                randconfig-076-20241018    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

