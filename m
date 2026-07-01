Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA979C43602
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=spWMxXlpStz+BE7lP5ChRvOR05acj9aGWgg1CGsF7rs=; b=3oGZI3GOZVNLt544XlQin1MqnP
	eu2awpc9TElmLFAMyxsRjilpbxtEpoMfHofG6FYAnP9yI0at4YBJWmRi1lr3B74d8zZkxhREeRkL7
	w1hn8nvh3VE5+WOecTQrUhkX2l4Wu5JsGKr2YIgzgtKPZp5lBgH2KlWOc7gMkUbyqIFbEwUqU5hi5
	gF5ntK8kj9A+lAdIoTmepltnRexPiZC5fUP1XH88rHHGR7rQN33w/hNjLW8j6zVXWJtZENDkgAaCP
	7svukxPudCzCf9d9IBnveTIz9rMYDtOC4sGghUa8LdkY4UWOJcoohFsCi6e+giyz16aGmJXOQoeLu
	9lg++89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weupt-00000002AKj-26i9;
	Wed, 01 Jul 2026 13:18:41 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weupq-00000002AKL-3Xpc
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 13:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782911919; x=1814447919;
  h=date:from:to:cc:subject:message-id;
  bh=Qe/UtOyKiGtoOgf5DLnr/HPso1WBQwevTIGIt212lrM=;
  b=h2WF8CXpj8yqxAfsp9fNykgD5f43PWXXgaFrtlSy9C2HlOvHJFPwM+l9
   oA2Oo7J6BIsGsOXjVLhfnPH6xRpJnMYa8UWqrm9v00/WI9N6XGYciYcsJ
   OWqL52+5jJbMXKML6ab0mwnCh91eCMZ8BDCGXGjmtvW7/n/601giunsCR
   E7BvuFGCksWQ2tdPBRIy9xvEn1jK0Q1MAILJJGwdRBg1MaaJ1Dlxa8CVF
   CehRgaZ87BOgs3cENs909q3Tybw01oY7nKIZ9h3KUr8BALiG1DxOjTRGy
   NPKGhkGuXJS1UyLn8e67A6PUsYCU7ZB9moaIhGoASBSZao8IOQeBWPdOx
   w==;
X-CSE-ConnectionGUID: zjlhJCVRQvuZpnkTzFSV6Q==
X-CSE-MsgGUID: ntf6CU5wS4G+fJaULqi6zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94244271"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94244271"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 06:18:38 -0700
X-CSE-ConnectionGUID: kdz69UO7Svq1QcQnTSyW5w==
X-CSE-MsgGUID: sf4aiisIQmSHpSzyFEXoSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="256145004"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 06:18:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weupf-000000009Jv-0N8t;
	Wed, 01 Jul 2026 13:18:31 +0000
Date: Wed, 01 Jul 2026 21:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 3e874ada6e026e8c67b8545ecb3759bb648bb28d
Message-ID: <202607012132.LcSmuljZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_061838_899532_7EC2BC5B 
X-CRM114-Status: UNSURE (   4.38  )
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
branch HEAD: 3e874ada6e026e8c67b8545ecb3759bb648bb28d  wifi: ath9k: hif_usb: don't dereference hif_dev after re-arming firmware request

elapsed time: 723m

configs tested: 220
configs skipped: 2

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
arc                         haps_hs_defconfig    gcc-16.1.0
arc                   randconfig-001-20260701    gcc-12.5.0
arc                   randconfig-002-20260701    gcc-12.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260701    gcc-12.5.0
arm                   randconfig-002-20260701    gcc-12.5.0
arm                   randconfig-003-20260701    gcc-12.5.0
arm                   randconfig-004-20260701    gcc-12.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-12.5.0
arm64                 randconfig-001-20260701    gcc-12.5.0
arm64                          randconfig-002    gcc-12.5.0
arm64                 randconfig-002-20260701    gcc-12.5.0
arm64                          randconfig-003    gcc-12.5.0
arm64                 randconfig-003-20260701    gcc-12.5.0
arm64                          randconfig-004    gcc-12.5.0
arm64                 randconfig-004-20260701    gcc-12.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-12.5.0
csky                  randconfig-001-20260701    gcc-12.5.0
csky                           randconfig-002    gcc-12.5.0
csky                  randconfig-002-20260701    gcc-12.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260701    clang-23
hexagon               randconfig-002-20260701    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260701    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260701    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260701    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260701    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260701    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260701    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260701    clang-22
i386                  randconfig-002-20260701    clang-22
i386                  randconfig-003-20260701    clang-22
i386                  randconfig-004-20260701    clang-22
i386                  randconfig-005-20260701    clang-22
i386                  randconfig-006-20260701    clang-22
i386                  randconfig-007-20260701    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260701    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260701    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260701    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260701    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260701    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260701    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260701    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260701    clang-23
loongarch             randconfig-002-20260701    clang-23
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
mips                          rb532_defconfig    clang-23
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260701    clang-23
nios2                 randconfig-002-20260701    clang-23
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-17
parisc                randconfig-001-20260701    clang-17
parisc                         randconfig-002    clang-17
parisc                randconfig-002-20260701    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                     asp8347_defconfig    clang-23
powerpc                        randconfig-001    clang-17
powerpc               randconfig-001-20260701    clang-17
powerpc                        randconfig-002    clang-17
powerpc               randconfig-002-20260701    clang-17
powerpc                     redwood_defconfig    clang-23
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260701    clang-17
powerpc64                      randconfig-002    clang-17
powerpc64             randconfig-002-20260701    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-23
riscv                 randconfig-001-20260701    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260701    clang-23
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-23
s390                  randconfig-001-20260701    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260701    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-23
sh                    randconfig-001-20260701    clang-23
sh                             randconfig-002    clang-23
sh                    randconfig-002-20260701    clang-23
sh                           se7206_defconfig    gcc-16.1.0
sh                           se7750_defconfig    gcc-16.1.0
sh                   secureedge5410_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260701    gcc-13.4.0
sparc                 randconfig-002-20260701    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260701    gcc-13.4.0
sparc64               randconfig-002-20260701    gcc-13.4.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260701    gcc-13.4.0
um                    randconfig-002-20260701    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260701    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260701    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260701    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260701    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260701    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260701    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260701    gcc-14
x86_64                randconfig-002-20260701    gcc-14
x86_64                randconfig-003-20260701    gcc-14
x86_64                randconfig-004-20260701    gcc-14
x86_64                randconfig-005-20260701    gcc-14
x86_64                randconfig-006-20260701    gcc-14
x86_64                randconfig-011-20260701    gcc-14
x86_64                randconfig-012-20260701    gcc-14
x86_64                randconfig-013-20260701    gcc-14
x86_64                randconfig-014-20260701    gcc-14
x86_64                randconfig-015-20260701    gcc-14
x86_64                randconfig-016-20260701    gcc-14
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260701    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260701    gcc-14
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260701    gcc-14
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260701    gcc-14
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260701    gcc-14
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260701    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260701    gcc-13.4.0
xtensa                randconfig-002-20260701    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

