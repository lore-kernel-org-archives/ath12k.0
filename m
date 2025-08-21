Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971B8CA0EFA
	for <ath12k@archiver.kernel.org>; Fri, 22 Aug 2025 03:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MiasBN8an0liCorP2YsvYNshwopwPIqfFz+Up/ab+j4=; b=dLK179n5rGnA/HYYlRSFGu0FcR
	jtI45Q016Qj7vWdT0/1GRP04dRvFjb9jZlGC6b9NHvDRTtMt5wCNtQdkNB33ehs/ThuzJcu1Pg6qm
	i4EpdMlkgYwopLYASnoqFdJqDiJ0ZRibcijQ5PwIS/8l2ov6wIzAowLo/5a1WO6yUDSz2ht09Sara
	1bPPuksdnw9fh0rL1iacysjqSRqYd5WA9d+7LR5LkZzbHWMb1+VbVcB+qVAcVP2a/q99FklCqFqwW
	xL4EoljblK/3SxM9k1/A+v+5Qrb/FRhcqHNxPaaF7aGMWa3CNe85gJt/pPThCbJcTxcAQBTvqQ6MH
	q10QGm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI4Y-00000001Kd7-0rvk;
	Fri, 22 Aug 2025 03:04:10 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upC0F-00000000Ugz-2V4Z
	for ath12k@lists.infradead.org;
	Thu, 21 Aug 2025 20:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755808520; x=1787344520;
  h=date:from:to:cc:subject:message-id;
  bh=9/T2fwsWAQXPsHoC+M1xTywKhOBq6jCMYbPAoO5TMOA=;
  b=Kkh3ayGwrHs2UOiizzKxw6l+hkKVxwJgKjweTyDB9lmuLS/2icMu/fql
   ulOisiAygNjR7uw3hGONkty4KQl5SPE1paLxvb8FTEhSCKmUQEI9WqDcO
   BIb8xlm4srbJN71QY6R7/Dn5q1+xKcap/dMxIz1W4P4qZdS/FqK0v3WlN
   qJk2tHML0xBf6Tk2XreUhUVcMw0GnWvZ3bWFZhLE1VPlOarTtVrJxYu4I
   Z6YUWaG+mW+E1JIynh4r2uz59S89vBJfWmxuVRAldQpGi45oRYax9YILN
   CWMw7qGYoQLW+JpHBpPZdWO3SVn+N2yp3aKMYI3FVjUDNgHB141sNa11t
   Q==;
X-CSE-ConnectionGUID: pAdjVRMhQEaa68/II+cm8w==
X-CSE-MsgGUID: evWz7920QMyC7U3DRPX6PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58179819"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58179819"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 13:35:19 -0700
X-CSE-ConnectionGUID: ZIKFG6XATCOhFD8MK1YGpw==
X-CSE-MsgGUID: M5pp0S4sSS2b+PQbYcWwfA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Aug 2025 13:35:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upC0A-000Ke3-32;
	Thu, 21 Aug 2025 20:35:14 +0000
Date: Fri, 22 Aug 2025 04:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:main-ath12k-ng] BUILD SUCCESS
 d12522ad9e26e3dea4672f0a814f85dd27ffedcf
Message-ID: <202508220422.ohazEwia-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_133519_655577_88C911F5 
X-CRM114-Status: UNSURE (   3.58  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-ath12k-ng
branch HEAD: d12522ad9e26e3dea4672f0a814f85dd27ffedcf  Add localversion-wireless-testing-ath12k-ng

elapsed time: 1312m

configs tested: 279
configs skipped: 6

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
arc                   randconfig-001-20250821    clang-22
arc                   randconfig-001-20250821    gcc-9.5.0
arc                   randconfig-001-20250822    clang-22
arc                   randconfig-002-20250821    clang-22
arc                   randconfig-002-20250821    gcc-13.4.0
arc                   randconfig-002-20250822    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
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
arm                       spear13xx_defconfig    gcc-15.1.0
arm                           spitz_defconfig    gcc-15.1.0
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
i386        buildonly-randconfig-003-20250821    gcc-12
i386        buildonly-randconfig-003-20250822    clang-20
i386        buildonly-randconfig-004-20250821    gcc-12
i386        buildonly-randconfig-004-20250822    clang-20
i386        buildonly-randconfig-005-20250821    gcc-12
i386        buildonly-randconfig-005-20250822    clang-20
i386        buildonly-randconfig-006-20250821    clang-20
i386        buildonly-randconfig-006-20250821    gcc-12
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
i386                  randconfig-012-20250821    gcc-12
i386                  randconfig-013-20250821    gcc-12
i386                  randconfig-014-20250821    gcc-12
i386                  randconfig-015-20250821    gcc-12
i386                  randconfig-016-20250821    gcc-12
i386                  randconfig-017-20250821    gcc-12
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
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
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
riscv                 randconfig-002-20250821    clang-18
riscv                 randconfig-002-20250821    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250821    clang-18
s390                  randconfig-001-20250821    gcc-14.3.0
s390                  randconfig-002-20250821    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250821    clang-18
sh                    randconfig-001-20250821    gcc-15.1.0
sh                    randconfig-002-20250821    clang-18
sh                    randconfig-002-20250821    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250821    clang-18
sparc                 randconfig-001-20250821    gcc-14.3.0
sparc                 randconfig-002-20250821    clang-18
sparc                 randconfig-002-20250821    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250821    clang-18
sparc64               randconfig-001-20250821    gcc-8.5.0
sparc64               randconfig-002-20250821    clang-18
sparc64               randconfig-002-20250821    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250821    clang-18
um                    randconfig-001-20250821    clang-19
um                    randconfig-002-20250821    clang-18
um                    randconfig-002-20250821    clang-22
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
x86_64                randconfig-072-20250821    clang-20
x86_64                randconfig-073-20250821    clang-20
x86_64                randconfig-074-20250821    clang-20
x86_64                randconfig-075-20250821    clang-20
x86_64                randconfig-076-20250821    clang-20
x86_64                randconfig-077-20250821    clang-20
x86_64                randconfig-078-20250821    clang-20
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
xtensa                randconfig-002-20250821    clang-18
xtensa                randconfig-002-20250821    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

