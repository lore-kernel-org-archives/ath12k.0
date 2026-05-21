Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418E9CD5BAC
	for <ath12k@archiver.kernel.org>; Thu, 21 May 2026 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xLr9qcr3YLUJUonel0c0uKZDUevYilsC5PeUm0NWqn8=; b=C/z099NLz3b06MUmGYJk5BdR6i
	X3JOXCf/56xUkN9rkfa3uGscQyeGgDhgME7LVq0fCoEPoB3WTBNet+KxUey2m/fm5EV+oTMI2MRma
	HdBG08TlFMgDtJrhTom2zS7C4uosdu165vZ0Ml9qi1VjqiYWFkg5kIYxbolVGwM6EMahOWCocKkIj
	FXMJ+sw3ijTtUrzDENkWWv7wC2G5VRYrU5QYfS2XzeotYfeG13Vb0o6hZ0tfF42gyQqH23nT4HRXu
	lirjSQBCw8uyMUY7UVhnQtY6td5Vq+b6HKE9PQfjJLf2gdbMn9gGGVkCAC96Mxwq64T+v4NZYMcvs
	o3+bA2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ43j-00000007zjP-46gl;
	Thu, 21 May 2026 14:07:35 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ43h-00000007ziB-2s1f
	for ath12k@lists.infradead.org;
	Thu, 21 May 2026 14:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779372453; x=1810908453;
  h=date:from:to:cc:subject:message-id;
  bh=lbm3VJ3at7Gn70eH0GbNwSyhfc6E/htpjI85FF4syEc=;
  b=bJRTOkSxpTl4Ga5br9MJB+bMcBjk06nCK3y4aLVMDs7K1hge+OcdGwSL
   E4C5e5k/OmQf3/EHy3RmevtmOXyN5JlQw8bm1Fhm3Mq0ekK7z4tl8+CNA
   9tvNptYtBHaQKqwuXpTfiIIjmPz47v7dabAyaII3Z0mpP4y4so6kcw9hL
   +8UIkAc3DCMdb+rhx/FnmyPqhdSc8N4tMgWoQ4w0Y1lSQFi2YaxZ7VM2l
   iKrmu56eUQ7OoBV06FUONLv45bj5TIZ+WFrpfy+BbcgaYj9LL2gYN/89A
   /FlcjE6/vbAX9O2qn4fPv3+XRNmebgofRriBF20AJv7MQXtx6H6+Xwx4K
   g==;
X-CSE-ConnectionGUID: Ud/ojqnzQcaDeeJ55/xbZw==
X-CSE-MsgGUID: SfOCDpNcRBWh1dEv8kNoEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84174427"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="84174427"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 07:07:33 -0700
X-CSE-ConnectionGUID: jEKGPU21TSO7z9K9KEazUw==
X-CSE-MsgGUID: 0cHmLwI3RSWUrk5AY2EX8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="245573566"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 May 2026 07:07:31 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ43d-000000000Ov-21Vf;
	Thu, 21 May 2026 14:07:29 +0000
Date: Thu, 21 May 2026 22:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 2e9422a6a2d8bf4036287c2fd3b034392af64048
Message-ID: <202605212208.4rO2wWv6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_070733_847652_0B030221 
X-CRM114-Status: UNSURE (   3.98  )
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
branch HEAD: 2e9422a6a2d8bf4036287c2fd3b034392af64048  Add localversion-wireless-testing-ath

elapsed time: 1237m

configs tested: 220
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260521    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260521    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                      footbridge_defconfig    clang-17
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260521    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260521    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260521    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260521    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260521    gcc-8.5.0
arm64                 randconfig-002-20260521    gcc-8.5.0
arm64                 randconfig-003-20260521    gcc-8.5.0
arm64                 randconfig-004-20260521    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260521    gcc-8.5.0
csky                  randconfig-002-20260521    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260521    gcc-11.5.0
hexagon               randconfig-002-20260521    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260521    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260521    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260521    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260521    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260521    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260521    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260521    clang-20
i386                  randconfig-002-20260521    clang-20
i386                  randconfig-003-20260521    clang-20
i386                  randconfig-004-20260521    clang-20
i386                  randconfig-005-20260521    clang-20
i386                  randconfig-006-20260521    clang-20
i386                  randconfig-007-20260521    clang-20
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260521    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260521    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260521    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260521    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260521    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260521    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260521    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260521    gcc-11.5.0
loongarch             randconfig-002-20260521    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                         rt305x_defconfig    clang-23
nios2                         10m50_defconfig    gcc-11.5.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260521    gcc-11.5.0
nios2                 randconfig-002-20260521    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260521    gcc-12.5.0
parisc                randconfig-002-20260521    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      mgcoge_defconfig    clang-23
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260521    gcc-12.5.0
powerpc               randconfig-002-20260521    gcc-12.5.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260521    gcc-12.5.0
powerpc64             randconfig-002-20260521    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-15.2.0
riscv                 randconfig-001-20260521    gcc-15.2.0
riscv                          randconfig-002    gcc-15.2.0
riscv                 randconfig-002-20260521    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260521    gcc-15.2.0
s390                           randconfig-002    gcc-15.2.0
s390                  randconfig-002-20260521    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260521    gcc-15.2.0
sh                             randconfig-002    gcc-15.2.0
sh                    randconfig-002-20260521    gcc-15.2.0
sh                          rsk7264_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260521    gcc-8.5.0
sparc                 randconfig-002-20260521    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260521    gcc-8.5.0
sparc64               randconfig-002-20260521    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260521    gcc-8.5.0
um                    randconfig-002-20260521    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260521    clang-20
x86_64      buildonly-randconfig-002-20260521    clang-20
x86_64      buildonly-randconfig-003-20260521    clang-20
x86_64      buildonly-randconfig-004-20260521    clang-20
x86_64      buildonly-randconfig-005-20260521    clang-20
x86_64      buildonly-randconfig-006-20260521    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260521    clang-20
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260521    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260521    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260521    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260521    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260521    clang-20
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260521    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260521    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260521    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260521    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260521    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260521    gcc-14
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260521    clang-20
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260521    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260521    clang-20
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260521    clang-20
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260521    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260521    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260521    gcc-8.5.0
xtensa                randconfig-002-20260521    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

