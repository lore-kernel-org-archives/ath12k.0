Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467DDC52D7F
	for <ath12k@archiver.kernel.org>; Sat, 17 Aug 2024 05:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/u06AThVkd0m6cqetkpCTLv/GGUMAKZOhvOk9P2cApU=; b=FdoV5T2POiZnwquDcREDkMzb/p
	RtPWrXH8rspjwNKswTeWpQdAtA0S6Dj/bndkNO6POHkr5Zr/E+AnuYRGgBX49ki8KiK3eziU7nY2X
	SgKJKnBfIcQMBRtFLBzAF3/vhzeb/Vd989VVfquAheFsB/EPsm+pKUdTx53GmwxSNgqmSNjt4kZXc
	BOhpRl/bvoEsgNoOvnbGdnxTZl9FDfsKLFBKllGkiJXwtyshsPHObrLYCwtpnBWzp1016etaAmKCH
	4n8tNA+2zey+mP09axP0x4TuKv2uGYL4CWJ/1xwpcv/dx8mrEd/sqfZ8CsRLfGhKt8OsdDN+jWq92
	nZ1vwSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfBZJ-0000000Ef4Z-3ATg
	for ath12k@archiver.kernel.org;
	Sat, 17 Aug 2024 05:01:37 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfBZF-0000000Ef42-3Hh1
	for ath12k@lists.infradead.org;
	Sat, 17 Aug 2024 05:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723870894; x=1755406894;
  h=date:from:to:cc:subject:message-id;
  bh=rsdYl3H1W+CHGiAV4DzJkYRI7dyNX5SIP/3zAhzY0EY=;
  b=gpriZ6d+DRPx/iQxn3dP8qPLyAwrSSZN0RW9pgzMv8HmxD66M73iXBaz
   Th4qYBppmYLsJL0QS9x3R+XbrpBQ2Av6R1UBjwgMDgYHrIkNn1pmfM4YC
   ayN6uJjaHQRRqnJpbatmBUPzGUA3zWvRRDnWnOH3SLh65TK9gyWvAQDSG
   yq153tNZnJXwklUN7ZsYBQBjw3HrBAGmhKBE5PwNDPskBxbot/JSnCyd0
   NeZ4Qyc8llJTbh1xx4oHwzRficfc3bac2StVsYIkmYOkRxNUFSvh8crzl
   fMn1zrvEM4B8O29ulA4D+Rzv+Cd9BO0a6kf73RN2sGWcAHM2rkMAGfzPI
   g==;
X-CSE-ConnectionGUID: kHR+77IRTliX9gSxuql1Ww==
X-CSE-MsgGUID: fWhjQyZKRH299nTAPfX3nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33557173"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="33557173"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 22:01:28 -0700
X-CSE-ConnectionGUID: ORvt3rYPStOUbddxhgPA6Q==
X-CSE-MsgGUID: 7ho01sCIQQC37asnOAzgAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="60418247"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2024 22:01:28 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfBZ6-0007C6-2n;
	Sat, 17 Aug 2024 05:01:24 +0000
Date: Sat, 17 Aug 2024 13:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 13894b6aaced62537f63e957e35acc783c58269e
Message-ID: <202408171354.CjlJlV1x-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_220134_169808_E687593E 
X-CRM114-Status: UNSURE (   3.32  )
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
branch HEAD: 13894b6aaced62537f63e957e35acc783c58269e  wifi: ath12k: Advertise multi device iface combination

elapsed time: 1058m

configs tested: 199
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240817   gcc-13.2.0
arc                   randconfig-002-20240817   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                        clps711x_defconfig   gcc-13.2.0
arm                         lpc32xx_defconfig   gcc-13.2.0
arm                        multi_v5_defconfig   gcc-13.2.0
arm                   randconfig-001-20240817   gcc-14.1.0
arm                   randconfig-002-20240817   clang-20
arm                   randconfig-003-20240817   clang-20
arm                   randconfig-004-20240817   gcc-14.1.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                       spear13xx_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240817   clang-20
arm64                 randconfig-002-20240817   gcc-14.1.0
arm64                 randconfig-003-20240817   gcc-14.1.0
arm64                 randconfig-004-20240817   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240817   gcc-14.1.0
csky                  randconfig-002-20240817   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240817   clang-20
hexagon               randconfig-002-20240817   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240816   gcc-12
i386         buildonly-randconfig-001-20240817   gcc-12
i386         buildonly-randconfig-002-20240816   clang-18
i386         buildonly-randconfig-002-20240817   gcc-12
i386         buildonly-randconfig-003-20240816   clang-18
i386         buildonly-randconfig-003-20240817   gcc-12
i386         buildonly-randconfig-004-20240816   clang-18
i386         buildonly-randconfig-004-20240817   gcc-12
i386         buildonly-randconfig-005-20240816   gcc-11
i386         buildonly-randconfig-005-20240817   gcc-12
i386         buildonly-randconfig-006-20240816   gcc-12
i386         buildonly-randconfig-006-20240817   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240816   clang-18
i386                  randconfig-001-20240817   gcc-12
i386                  randconfig-002-20240816   gcc-12
i386                  randconfig-002-20240817   gcc-12
i386                  randconfig-003-20240816   gcc-11
i386                  randconfig-003-20240817   gcc-12
i386                  randconfig-004-20240816   gcc-12
i386                  randconfig-004-20240817   gcc-12
i386                  randconfig-005-20240816   clang-18
i386                  randconfig-005-20240817   gcc-12
i386                  randconfig-006-20240816   gcc-11
i386                  randconfig-006-20240817   gcc-12
i386                  randconfig-011-20240816   gcc-12
i386                  randconfig-011-20240817   gcc-12
i386                  randconfig-012-20240816   clang-18
i386                  randconfig-012-20240817   gcc-12
i386                  randconfig-013-20240816   clang-18
i386                  randconfig-013-20240817   gcc-12
i386                  randconfig-014-20240816   gcc-12
i386                  randconfig-014-20240817   gcc-12
i386                  randconfig-015-20240816   gcc-12
i386                  randconfig-015-20240817   gcc-12
i386                  randconfig-016-20240816   gcc-12
i386                  randconfig-016-20240817   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240817   gcc-14.1.0
loongarch             randconfig-002-20240817   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                          eyeq5_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-13.2.0
mips                           rs90_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240817   gcc-14.1.0
nios2                 randconfig-002-20240817   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240817   gcc-14.1.0
parisc                randconfig-002-20240817   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240817   clang-14
powerpc               randconfig-002-20240817   gcc-14.1.0
powerpc                     skiroot_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240817   gcc-14.1.0
powerpc64             randconfig-002-20240817   clang-16
powerpc64             randconfig-003-20240817   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240817   gcc-14.1.0
riscv                 randconfig-002-20240817   clang-17
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240817   gcc-14.1.0
s390                  randconfig-002-20240817   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240817   gcc-14.1.0
sh                    randconfig-002-20240817   gcc-14.1.0
sh                             sh03_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240817   gcc-12
x86_64       buildonly-randconfig-002-20240817   gcc-12
x86_64       buildonly-randconfig-003-20240817   gcc-12
x86_64       buildonly-randconfig-004-20240817   gcc-12
x86_64       buildonly-randconfig-005-20240817   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240817   gcc-12
x86_64                randconfig-002-20240817   gcc-12
x86_64                randconfig-003-20240817   gcc-12
x86_64                randconfig-004-20240817   gcc-12
x86_64                randconfig-005-20240817   gcc-12
x86_64                randconfig-006-20240817   gcc-12
x86_64                randconfig-011-20240817   gcc-12
x86_64                randconfig-012-20240817   gcc-12
x86_64                randconfig-013-20240817   gcc-12
x86_64                randconfig-014-20240817   gcc-12
x86_64                randconfig-015-20240817   gcc-12
x86_64                randconfig-016-20240817   gcc-12
x86_64                randconfig-071-20240817   gcc-12
x86_64                randconfig-072-20240817   gcc-12
x86_64                randconfig-073-20240817   gcc-12
x86_64                randconfig-074-20240817   gcc-12
x86_64                randconfig-075-20240817   gcc-12
x86_64                randconfig-076-20240817   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

