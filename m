Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0450FCA0FE2
	for <ath12k@archiver.kernel.org>; Fri, 22 Aug 2025 03:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m6RhEqGtNAcihRwpDcbWOA4gZKCnQg1ytckWuL49/FY=; b=FUs6dgCegEnA4SERlSOXG+U9+1
	+BzsHo7dPNHXxoU67U+JErCEMmisR+dXeoRbYn2dkgGo8MFQ6qPF9Z4FtBOWnewdqnGUiwMNLbyl2
	FrUU0AtGeubyWjO58vkXBkP8RBXqkH5xSOrNWv+pu0kJTgShpaLAAKh8PBCB6Zwn2OV7O24QYvh/u
	QfDjs6bDhBnE4aK7ldtCzfCeNqurL/294e1pDHueC1q7r3FDARdp/r73CyZ0shPfGqF6zxExzY3bZ
	f1RR4c7o2K1brwn3WBycmS+rlelH/mw/Qq7/Oh6B7xDc1Nd3Ks/do4cLVJo5g68Ra6cYEpRAV7CJ0
	W4XR+20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIal-00000001Pcd-3BIT;
	Fri, 22 Aug 2025 03:37:27 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upE6m-00000000rrB-20eQ
	for ath12k@lists.infradead.org;
	Thu, 21 Aug 2025 22:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755816613; x=1787352613;
  h=date:from:to:cc:subject:message-id;
  bh=8bwhERU1CtTSLsIH8vEH6bd9AX99o7e+h/41Rn6TwpI=;
  b=kwO5FoRyi8HE66T460/rh+TeAaU5rhh/tE12xU/8vBRSm6QxeD//rKWT
   bCso3kZRVOah5m1U1iOTculAMQ9f9xiK4PW9MuSB7HaSgbbGp6QA6cNY6
   t9A28p0F6feRvxgY55xjlx8yflJ2D+JXviRrRcT2JQqiOyqehXniXXe1W
   3uzoMUKTAdjL52n4pcT/Z4fA1XyY0W4bS0eqnembsJOQI1p8p0FqZbMM+
   LWFD+VUT7Z4YF5+IU98LCE4PyOFNeDWDRf/XOBrWLyixn2hrYoMFENfMe
   Sbj3KsHN0yXIa+fdhNBSl8FhZRnFFGr4DdLljmYRQ13m9I7H/AGcKWRV/
   w==;
X-CSE-ConnectionGUID: bfi0TViDT+mcyvPxBGctGQ==
X-CSE-MsgGUID: kuSxVHmLQ1alGLf3TWQYFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57832618"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57832618"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 15:50:12 -0700
X-CSE-ConnectionGUID: syPfKqFvTQ28mNIf1ApDaA==
X-CSE-MsgGUID: sFQ4XrYkSjiS6JggEF38sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173812327"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Aug 2025 15:50:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upE6h-000Kjv-1p;
	Thu, 21 Aug 2025 22:50:07 +0000
Date: Fri, 22 Aug 2025 06:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 0e487f03c6e5d8dd5b076b8b061e50e736ab2196
Message-ID: <202508220629.xEUyIAZ5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_155012_629623_9A1C4550 
X-CRM114-Status: UNSURE (   3.99  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-ath12k-ng
branch HEAD: 0e487f03c6e5d8dd5b076b8b061e50e736ab2196  wifi: ath12k: Remove HAL define dependencies from shared AHB code

elapsed time: 1447m

configs tested: 321
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                        nsimosci_defconfig    gcc-15.1.0
arc                   randconfig-001-20250821    clang-22
arc                   randconfig-001-20250821    gcc-9.5.0
arc                   randconfig-001-20250822    clang-22
arc                   randconfig-002-20250821    clang-22
arc                   randconfig-002-20250821    gcc-13.4.0
arc                   randconfig-002-20250822    clang-22
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                         mv78xx0_defconfig    gcc-15.1.0
arm                   randconfig-001-20250821    clang-22
arm                   randconfig-001-20250821    gcc-13.4.0
arm                   randconfig-001-20250822    clang-22
arm                   randconfig-002-20250821    clang-22
arm                   randconfig-002-20250822    clang-22
arm                   randconfig-003-20250821    clang-22
arm                   randconfig-003-20250822    clang-22
arm                   randconfig-004-20250821    clang-22
arm                   randconfig-004-20250822    clang-22
arm                           sama7_defconfig    gcc-15.1.0
arm                          sp7021_defconfig    gcc-15.1.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm                           spitz_defconfig    gcc-15.1.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250821    clang-22
arm64                 randconfig-001-20250822    clang-22
arm64                 randconfig-002-20250821    clang-22
arm64                 randconfig-002-20250822    clang-22
arm64                 randconfig-003-20250821    clang-22
arm64                 randconfig-003-20250821    gcc-11.5.0
arm64                 randconfig-003-20250822    clang-22
arm64                 randconfig-004-20250821    clang-22
arm64                 randconfig-004-20250821    gcc-13.4.0
arm64                 randconfig-004-20250822    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250821    clang-22
csky                  randconfig-001-20250821    gcc-13.4.0
csky                  randconfig-001-20250822    clang-22
csky                  randconfig-002-20250821    clang-22
csky                  randconfig-002-20250821    gcc-15.1.0
csky                  randconfig-002-20250822    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250821    clang-20
hexagon               randconfig-001-20250821    clang-22
hexagon               randconfig-001-20250822    clang-22
hexagon               randconfig-002-20250821    clang-22
hexagon               randconfig-002-20250822    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250821    gcc-12
i386        buildonly-randconfig-001-20250822    clang-20
i386        buildonly-randconfig-002-20250821    gcc-12
i386        buildonly-randconfig-002-20250822    clang-20
i386        buildonly-randconfig-003-20250821    clang-20
i386        buildonly-randconfig-003-20250822    clang-20
i386        buildonly-randconfig-004-20250821    gcc-12
i386        buildonly-randconfig-004-20250822    clang-20
i386        buildonly-randconfig-005-20250821    gcc-12
i386        buildonly-randconfig-005-20250822    clang-20
i386        buildonly-randconfig-006-20250821    clang-20
i386        buildonly-randconfig-006-20250822    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250821    gcc-11
i386                  randconfig-001-20250822    clang-20
i386                  randconfig-002-20250821    gcc-11
i386                  randconfig-002-20250822    clang-20
i386                  randconfig-003-20250821    gcc-11
i386                  randconfig-003-20250822    clang-20
i386                  randconfig-004-20250821    gcc-11
i386                  randconfig-004-20250822    clang-20
i386                  randconfig-005-20250821    gcc-11
i386                  randconfig-005-20250822    clang-20
i386                  randconfig-006-20250821    gcc-11
i386                  randconfig-006-20250822    clang-20
i386                  randconfig-007-20250821    gcc-11
i386                  randconfig-007-20250822    clang-20
i386                  randconfig-011-20250821    gcc-12
i386                  randconfig-011-20250822    gcc-12
i386                  randconfig-012-20250821    gcc-12
i386                  randconfig-012-20250822    gcc-12
i386                  randconfig-013-20250821    gcc-12
i386                  randconfig-013-20250822    gcc-12
i386                  randconfig-014-20250821    gcc-12
i386                  randconfig-014-20250822    gcc-12
i386                  randconfig-015-20250821    gcc-12
i386                  randconfig-015-20250822    gcc-12
i386                  randconfig-016-20250821    gcc-12
i386                  randconfig-016-20250822    gcc-12
i386                  randconfig-017-20250821    gcc-12
i386                  randconfig-017-20250822    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250821    clang-22
loongarch             randconfig-001-20250821    gcc-14.3.0
loongarch             randconfig-001-20250822    clang-22
loongarch             randconfig-002-20250821    clang-22
loongarch             randconfig-002-20250821    gcc-15.1.0
loongarch             randconfig-002-20250822    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       alldefconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250821    clang-22
nios2                 randconfig-001-20250821    gcc-9.5.0
nios2                 randconfig-001-20250822    clang-22
nios2                 randconfig-002-20250821    clang-22
nios2                 randconfig-002-20250821    gcc-10.5.0
nios2                 randconfig-002-20250822    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250821    clang-22
parisc                randconfig-001-20250821    gcc-12.5.0
parisc                randconfig-001-20250822    clang-22
parisc                randconfig-002-20250821    clang-22
parisc                randconfig-002-20250821    gcc-8.5.0
parisc                randconfig-002-20250822    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   currituck_defconfig    gcc-15.1.0
powerpc                       ebony_defconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                 mpc8315_rdb_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250821    clang-17
powerpc               randconfig-001-20250821    clang-22
powerpc               randconfig-001-20250822    clang-22
powerpc               randconfig-002-20250821    clang-22
powerpc               randconfig-002-20250822    clang-22
powerpc               randconfig-003-20250821    clang-22
powerpc               randconfig-003-20250821    gcc-9.5.0
powerpc               randconfig-003-20250822    clang-22
powerpc64             randconfig-001-20250821    gcc-14.3.0
powerpc64             randconfig-001-20250822    clang-22
powerpc64             randconfig-002-20250821    clang-22
powerpc64             randconfig-002-20250822    clang-22
powerpc64             randconfig-003-20250821    clang-22
powerpc64             randconfig-003-20250822    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250821    clang-17
riscv                 randconfig-001-20250821    clang-18
riscv                 randconfig-001-20250822    clang-22
riscv                 randconfig-002-20250821    clang-18
riscv                 randconfig-002-20250821    gcc-9.5.0
riscv                 randconfig-002-20250822    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250821    clang-18
s390                  randconfig-001-20250821    gcc-14.3.0
s390                  randconfig-001-20250822    clang-22
s390                  randconfig-002-20250821    clang-18
s390                  randconfig-002-20250822    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250821    clang-18
sh                    randconfig-001-20250821    gcc-15.1.0
sh                    randconfig-001-20250822    clang-22
sh                    randconfig-002-20250821    clang-18
sh                    randconfig-002-20250821    gcc-13.4.0
sh                    randconfig-002-20250822    clang-22
sh                          rsk7203_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250821    clang-18
sparc                 randconfig-001-20250821    gcc-14.3.0
sparc                 randconfig-001-20250822    clang-22
sparc                 randconfig-002-20250821    clang-18
sparc                 randconfig-002-20250821    gcc-15.1.0
sparc                 randconfig-002-20250822    clang-22
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250821    clang-18
sparc64               randconfig-001-20250821    gcc-8.5.0
sparc64               randconfig-001-20250822    clang-22
sparc64               randconfig-002-20250821    clang-18
sparc64               randconfig-002-20250821    clang-22
sparc64               randconfig-002-20250822    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250821    clang-18
um                    randconfig-001-20250821    clang-19
um                    randconfig-001-20250822    clang-22
um                    randconfig-002-20250821    clang-18
um                    randconfig-002-20250821    clang-22
um                    randconfig-002-20250822    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250821    clang-20
x86_64      buildonly-randconfig-001-20250822    clang-20
x86_64      buildonly-randconfig-002-20250821    clang-20
x86_64      buildonly-randconfig-002-20250822    clang-20
x86_64      buildonly-randconfig-003-20250821    clang-20
x86_64      buildonly-randconfig-003-20250822    clang-20
x86_64      buildonly-randconfig-004-20250821    clang-20
x86_64      buildonly-randconfig-004-20250821    gcc-12
x86_64      buildonly-randconfig-004-20250822    clang-20
x86_64      buildonly-randconfig-005-20250821    clang-20
x86_64      buildonly-randconfig-005-20250822    clang-20
x86_64      buildonly-randconfig-006-20250821    clang-20
x86_64      buildonly-randconfig-006-20250822    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250821    clang-20
x86_64                randconfig-001-20250822    clang-20
x86_64                randconfig-002-20250821    clang-20
x86_64                randconfig-002-20250822    clang-20
x86_64                randconfig-003-20250821    clang-20
x86_64                randconfig-003-20250822    clang-20
x86_64                randconfig-004-20250821    clang-20
x86_64                randconfig-004-20250822    clang-20
x86_64                randconfig-005-20250821    clang-20
x86_64                randconfig-005-20250822    clang-20
x86_64                randconfig-006-20250821    clang-20
x86_64                randconfig-006-20250822    clang-20
x86_64                randconfig-007-20250821    clang-20
x86_64                randconfig-007-20250822    clang-20
x86_64                randconfig-008-20250821    clang-20
x86_64                randconfig-008-20250822    clang-20
x86_64                randconfig-071-20250821    clang-20
x86_64                randconfig-071-20250822    clang-20
x86_64                randconfig-072-20250821    clang-20
x86_64                randconfig-072-20250822    clang-20
x86_64                randconfig-073-20250821    clang-20
x86_64                randconfig-073-20250822    clang-20
x86_64                randconfig-074-20250821    clang-20
x86_64                randconfig-074-20250822    clang-20
x86_64                randconfig-075-20250821    clang-20
x86_64                randconfig-075-20250822    clang-20
x86_64                randconfig-076-20250821    clang-20
x86_64                randconfig-076-20250822    clang-20
x86_64                randconfig-077-20250821    clang-20
x86_64                randconfig-077-20250822    clang-20
x86_64                randconfig-078-20250821    clang-20
x86_64                randconfig-078-20250822    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250821    clang-18
xtensa                randconfig-001-20250821    gcc-11.5.0
xtensa                randconfig-001-20250822    clang-22
xtensa                randconfig-002-20250821    clang-18
xtensa                randconfig-002-20250821    gcc-10.5.0
xtensa                randconfig-002-20250822    clang-22
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

