Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CC5C44508
	for <ath12k@archiver.kernel.org>; Wed, 15 Jul 2026 07:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VmJkzOgqf4BmjBsVf2vpvVHutUAXt7RSq+nSqU7KCDA=; b=1XdbZCtDpKa53ilbb0FIAI69nn
	nr3yEIktykhZ1iHhKJMSr9yLi2Yks4pwXemC7bmuBtx2siooLlS7zBjZZtKCw7uElAHrjnQot3Bmi
	sADzBS0zB1nferPPM2+s2qTodG+Xge0WCtsvuCOz0J/YfRzeYzduaD0LVCfNDxpzyrwprck5th7dm
	REhI+RoQyvT9ecFFl5GhVmchWZekr7Zdt3hMEEbYNb/RxQCi+03p13VoaZaxSgFMr6UVd//d2fsbc
	t/IcavGFtEHQI3NGi+OlW8H4KgW72alsnbdh0b9LuFQZespGZu+vqBiw+mrn5RaTKmZ8lrJH8ofTR
	Tnt8Mecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtjS-0000000DymN-0kQj;
	Wed, 15 Jul 2026 07:08:38 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtjP-0000000DylN-0W5G
	for ath12k@lists.infradead.org;
	Wed, 15 Jul 2026 07:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784099316; x=1815635316;
  h=date:from:to:cc:subject:message-id;
  bh=j3iUlDYHDwywpiRhwR4wYMk3xVHbivkdxHKeTSFiQLQ=;
  b=SNI2UEeEkVIQ6HBtnvcaIIunhbWqmfZeKuf4UbFcWhHZYmR5R65Hs6uv
   1BJ0ukLUX3azVFljgcMRt9/xm4ksNJMdHt9PL1a1W83l5Uz0yv8omQLUk
   Fa+1FW5qNXEmI/v4e9FpnzA8ZjKAKDYbl7oyQZJ5MITnMk5w+Q2ERBHn5
   AIiuMNvH483QogCUYkbMOnQ6hmJedrlPNO4kcLyUjGvjqp1k3tqbR7Zlb
   iR6rY8QGDDRTm8+wrFaQiwpRhuwzVQN1u4NkqMUBHoYuYP7DEvCJrqU+T
   qrHzUNYWK9G4yo5OqBKTxauV9lj3HnQyNeUChDkUXcN4kot3Owuw8jLbG
   w==;
X-CSE-ConnectionGUID: 9qnUOUyLTG+kmv4pTMhr/w==
X-CSE-MsgGUID: pFcH3ct6QaymTAijtfxG0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96241286"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="96241286"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 00:08:35 -0700
X-CSE-ConnectionGUID: kwLnMSs8QpK9qNC4GctdKw==
X-CSE-MsgGUID: QhwIjiaRRfeZyiht3/pLAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="256131384"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Jul 2026 00:08:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjtjK-00000000NOV-0fP8;
	Wed, 15 Jul 2026 07:08:30 +0000
Date: Wed, 15 Jul 2026 15:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 00cfdf51e08de2a450116ec2c6839be09e7bf598
Message-ID: <202607151557.nPqtxVVz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_000835_254586_ADF7E53B 
X-CRM114-Status: UNSURE (   3.74  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: 00cfdf51e08de2a450116ec2c6839be09e7bf598  Merge branch 'pending' into main-pending

elapsed time: 959m

configs tested: 203
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-10.5.0
arc                   randconfig-001-20260715    gcc-10.5.0
arc                            randconfig-002    gcc-10.5.0
arc                   randconfig-002-20260715    gcc-10.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                             pxa_defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-10.5.0
arm                   randconfig-001-20260715    gcc-10.5.0
arm                            randconfig-002    gcc-10.5.0
arm                   randconfig-002-20260715    gcc-10.5.0
arm                            randconfig-003    gcc-10.5.0
arm                   randconfig-003-20260715    gcc-10.5.0
arm                            randconfig-004    gcc-10.5.0
arm                   randconfig-004-20260715    gcc-10.5.0
arm                         socfpga_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260715    gcc-16.1.0
arm64                 randconfig-002-20260715    gcc-16.1.0
arm64                 randconfig-003-20260715    gcc-16.1.0
arm64                 randconfig-004-20260715    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260715    gcc-16.1.0
csky                  randconfig-002-20260715    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260715    gcc-11.5.0
hexagon               randconfig-001-20260715    gcc-16.1.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260715    gcc-11.5.0
hexagon               randconfig-002-20260715    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260715    clang-22
i386        buildonly-randconfig-002-20260715    clang-22
i386        buildonly-randconfig-003-20260715    clang-22
i386        buildonly-randconfig-004-20260715    clang-22
i386        buildonly-randconfig-005-20260715    clang-22
i386        buildonly-randconfig-006-20260715    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260715    clang-22
i386                  randconfig-002-20260715    clang-22
i386                  randconfig-003-20260715    clang-22
i386                  randconfig-004-20260715    clang-22
i386                  randconfig-005-20260715    clang-22
i386                  randconfig-006-20260715    clang-22
i386                  randconfig-007-20260715    clang-22
i386                  randconfig-011-20260715    gcc-14
i386                  randconfig-012-20260715    gcc-14
i386                  randconfig-013-20260715    gcc-14
i386                  randconfig-014-20260715    gcc-14
i386                  randconfig-015-20260715    gcc-14
i386                  randconfig-016-20260715    gcc-14
i386                  randconfig-017-20260715    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260715    gcc-11.5.0
loongarch             randconfig-001-20260715    gcc-16.1.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260715    gcc-11.5.0
loongarch             randconfig-002-20260715    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        bcm63xx_defconfig    clang-23
mips                      maltaaprp_defconfig    clang-17
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260715    gcc-11.5.0
nios2                 randconfig-001-20260715    gcc-16.1.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260715    gcc-11.5.0
nios2                 randconfig-002-20260715    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260715    clang-23
parisc                randconfig-002-20260715    clang-23
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260715    clang-23
powerpc               randconfig-002-20260715    clang-23
powerpc64             randconfig-001-20260715    clang-23
powerpc64             randconfig-002-20260715    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260715    gcc-15.2.0
riscv                 randconfig-002-20260715    gcc-15.2.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260715    gcc-15.2.0
s390                  randconfig-002-20260715    gcc-15.2.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260715    gcc-15.2.0
sh                    randconfig-002-20260715    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260715    gcc-16.1.0
sparc                 randconfig-002-20260715    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260715    gcc-16.1.0
sparc64               randconfig-002-20260715    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260715    gcc-16.1.0
um                    randconfig-002-20260715    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260715    gcc-14
x86_64      buildonly-randconfig-002-20260715    gcc-14
x86_64      buildonly-randconfig-003-20260715    gcc-14
x86_64      buildonly-randconfig-004-20260715    gcc-14
x86_64      buildonly-randconfig-005-20260715    gcc-14
x86_64      buildonly-randconfig-006-20260715    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260715    clang-22
x86_64                randconfig-002-20260715    clang-22
x86_64                randconfig-003-20260715    clang-22
x86_64                randconfig-004-20260715    clang-22
x86_64                randconfig-005-20260715    clang-22
x86_64                randconfig-006-20260715    clang-22
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260715    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260715    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260715    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260715    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260715    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260715    clang-22
x86_64                randconfig-071-20260715    gcc-14
x86_64                randconfig-072-20260715    gcc-14
x86_64                randconfig-073-20260715    gcc-14
x86_64                randconfig-074-20260715    gcc-14
x86_64                randconfig-075-20260715    gcc-14
x86_64                randconfig-076-20260715    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260715    gcc-16.1.0
xtensa                randconfig-002-20260715    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

