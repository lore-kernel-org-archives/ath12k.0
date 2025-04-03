Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2BDC3600C
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 16:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dP2UiirOOLBwJBDTtvRqkkUbLkB2LHWAJ+bmpiZV1Nk=; b=PH1VPn9/NW9o/JXu74bA3W1vcZ
	mvYB02KIffJl60fJfEtxWxqmV+l833YOV3Yqzoqw52+HJ5YVUucPIZXtUe1pCa4ACsYl/hmKV3Yfz
	66xbhH9POOQRqhz6NquIg4tNj+5yXnYQ1Xxdi9Y0z6MC8NHvosCdYHA9Idn3t8hguG4I/1DiiGZ0D
	qodWvQT18IFq1lur0yb99RiyXG0w3mn1LBWcWn6vJsYj7Zo2S9dxKfnHchUgWBQxmFjv2jD72YNA1
	YEsI4cmoV9wmaCAe69hpa9LEZ5/dK4Fz95W5hGpg+nUfCLIgUl/odNzelxmdCnzLvpYH4+uKpQITa
	KDAA+14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NSg-00000009MxP-2nMa
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 16:30:38 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NSd-00000009MwQ-33de
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 16:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743697836; x=1775233836;
  h=date:from:to:cc:subject:message-id;
  bh=C+NlHB9KjIgzHEj4e/Pf50+3OKLCoJVGPcOvjH/v7Ys=;
  b=Eipb+gCeSiuIGoDiCZS7tbROtpS4Aasv9xx/3OqUGUhCH+269h8t7N0K
   Dwm48ecGWMOnP6/EQrMBfsY6U3h8mqct+wVg3Pret2vVSA1aXfMI+hQYe
   SG2Y8tSnxSYmfjNIR8qXigRaqgxfMiAyAAk/+Ie1Zfl0YJOfrH1GQYIpV
   d2ADO0MXouXxmJwM0Jh+/fCrchrakRK+JvlmM57PXM++pnjeqNxl67Zv6
   xMbWD7+mkXC/NYNKMEud0g6ie8Juc2dixidV6grdVzHZK0BNPzBevhEL4
   L5tdYdAaYr+dsciiCPSK/APJszs5NuxQdW0i/5Ix0UN0dMBfwC7zcusez
   w==;
X-CSE-ConnectionGUID: blqlqRW0Qa+8vg0ImCjZig==
X-CSE-MsgGUID: d5he0C+NSN+mTDiUEA8F1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62520881"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="62520881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 09:30:35 -0700
X-CSE-ConnectionGUID: wpOpTgL6RPmZ03X8PcXSSQ==
X-CSE-MsgGUID: STT62jleRga40KBb04C6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126839596"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Apr 2025 09:30:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0NSY-0000fb-1M;
	Thu, 03 Apr 2025 16:30:30 +0000
Date: Fri, 04 Apr 2025 00:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 31e98e277ae47f56632e4d663b1d4fd12ba33ea8
Message-ID: <202504040054.XJucfnGZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_093035_812166_8A10ADF5 
X-CRM114-Status: UNSURE (   3.91  )
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
branch HEAD: 31e98e277ae47f56632e4d663b1d4fd12ba33ea8  wifi: ath11k: fix node corruption in ar->arvifs list

elapsed time: 1450m

configs tested: 130
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arc                   randconfig-001-20250403    gcc-14.2.0
arc                   randconfig-002-20250403    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-21
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250403    clang-21
arm                   randconfig-002-20250403    gcc-8.5.0
arm                   randconfig-003-20250403    clang-21
arm                   randconfig-004-20250403    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250403    gcc-6.5.0
arm64                 randconfig-002-20250403    clang-16
arm64                 randconfig-003-20250403    clang-17
arm64                 randconfig-004-20250403    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250403    gcc-14.2.0
csky                  randconfig-002-20250403    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250403    clang-21
hexagon               randconfig-002-20250403    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250403    clang-20
i386        buildonly-randconfig-002-20250403    clang-20
i386        buildonly-randconfig-003-20250403    clang-20
i386        buildonly-randconfig-004-20250403    gcc-12
i386        buildonly-randconfig-005-20250403    gcc-12
i386        buildonly-randconfig-006-20250403    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250403    gcc-12.4.0
loongarch             randconfig-002-20250403    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250403    gcc-10.5.0
nios2                 randconfig-002-20250403    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250403    gcc-13.3.0
parisc                randconfig-002-20250403    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-15
powerpc               randconfig-001-20250403    clang-16
powerpc               randconfig-002-20250403    gcc-6.5.0
powerpc               randconfig-003-20250403    clang-21
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20250403    clang-19
powerpc64             randconfig-002-20250403    clang-17
powerpc64             randconfig-003-20250403    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250403    clang-21
riscv                 randconfig-002-20250403    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250403    gcc-9.3.0
s390                  randconfig-002-20250403    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250403    gcc-6.5.0
sh                    randconfig-002-20250403    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250403    gcc-11.5.0
sparc                 randconfig-002-20250403    gcc-13.3.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250403    gcc-7.5.0
sparc64               randconfig-002-20250403    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250403    clang-19
um                    randconfig-002-20250403    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250403    clang-20
x86_64      buildonly-randconfig-002-20250403    clang-20
x86_64      buildonly-randconfig-003-20250403    clang-20
x86_64      buildonly-randconfig-004-20250403    clang-20
x86_64      buildonly-randconfig-005-20250403    gcc-11
x86_64      buildonly-randconfig-006-20250403    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250403    gcc-11.5.0
xtensa                randconfig-002-20250403    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

