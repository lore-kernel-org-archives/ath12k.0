Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367A0C5AD49
	for <ath12k@archiver.kernel.org>; Fri, 23 May 2025 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ejkyEqyQykn+Qj9VsOIqlN4F2ExKds0DobatjkYiwg=; b=HlpWbFWlkdcclU6qpCCJvfD+GO
	EoOMAA6nEdwAN4FEXguIRt8y8nN/yryO+UevoE5ykE9/Mg20rf7TuIUrSY2EERkycecwuk1f74lqB
	sxfeCwWJ7NRGxeY2zv9M5XdG2wp0LKJSJQbxSHba8Bn2kD7hXHYFUCPB30jpdT1ZG85VG+h6qQDUp
	RX4Rybb/4nd+pHnKJ4lMFELh1QgsPdoZHMXWqWf3ILYTuozz/R/bvoHwPWtU17ErEjUUucDXrWiKT
	Yd7vjYfX703taI6gzNOQPgN364hkbygL0T/TDSmDIxHZbi4OT1G9z7QuBin4F3Iqa1fXRB3c/11bi
	LQp/Ps/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7S-00000004WrO-3qoe;
	Fri, 23 May 2025 17:23:42 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVvS-00000004UxJ-3YOC
	for ath12k@lists.infradead.org;
	Fri, 23 May 2025 17:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748020278; x=1779556278;
  h=date:from:to:cc:subject:message-id;
  bh=SOE5RT4pjdLK04Yzo/U0XBuDY/WA4EuAD1bLnmXkrZg=;
  b=JlZNRkm7eaZmoTTIwSWBmx95yw3PmHR3RxC9deKtP6AVHFGQiu/WS+Ms
   FQGcPzC9jMUfW/Tv6GqmTGi/4h/NTzS/KxcrMMCij7F/6LCuKNFCDU5aJ
   78it7dOi6Pie0ZX1vTMjdzerbAqwXjNnhp49tnIh53bXyrMbtafBeKYeh
   R7avNXnZIBTMmayNL97VYXOKKvcNS69/UQ7tQMApbkkkCzLW5tn0Gno87
   xCDEMhCRWhOvWOm4AHhHc6IIvCbVH82tups/ZiD7RWKZt2TU9lahVCA3g
   VoQEymWuqSp8QF533FokayD456OEQ2rrvE1lXA+vizOqMrE7OYacTcZ92
   A==;
X-CSE-ConnectionGUID: uMMCoAU3RxaqEN7Ecv3Q2Q==
X-CSE-MsgGUID: 92k3HakOSMC13Q8b2h2qQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60739038"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="60739038"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 10:11:16 -0700
X-CSE-ConnectionGUID: toGY28ArSwWUuwUFMoiPRQ==
X-CSE-MsgGUID: D5u4MDOETgiXfVhI9OUidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="146379485"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 May 2025 10:11:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIVvM-000Qbk-1r;
	Fri, 23 May 2025 17:11:12 +0000
Date: Sat, 24 May 2025 01:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 ed73728fd14e14714a86b4826fb7115d9dade1b6
Message-ID: <202505240112.EEGedbg4-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_101118_931309_D594C531 
X-CRM114-Status: UNSURE (   3.48  )
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
branch HEAD: ed73728fd14e14714a86b4826fb7115d9dade1b6  Merge tag 'mt76-next-2025-05-21' of https://github.com/nbd168/wireless

elapsed time: 1612m

configs tested: 136
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250522    gcc-15.1.0
arc                   randconfig-001-20250523    gcc-15.1.0
arc                   randconfig-002-20250522    gcc-15.1.0
arc                   randconfig-002-20250523    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250522    clang-21
arm                   randconfig-001-20250523    clang-16
arm                   randconfig-002-20250522    clang-21
arm                   randconfig-002-20250523    gcc-8.5.0
arm                   randconfig-003-20250522    clang-18
arm                   randconfig-003-20250523    gcc-7.5.0
arm                   randconfig-004-20250522    gcc-7.5.0
arm                   randconfig-004-20250523    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250522    clang-21
arm64                 randconfig-001-20250523    gcc-8.5.0
arm64                 randconfig-002-20250522    gcc-7.5.0
arm64                 randconfig-002-20250523    clang-16
arm64                 randconfig-003-20250522    clang-21
arm64                 randconfig-003-20250523    clang-21
arm64                 randconfig-004-20250522    gcc-5.5.0
arm64                 randconfig-004-20250523    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250523    gcc-10.5.0
csky                  randconfig-002-20250523    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250523    clang-21
hexagon               randconfig-002-20250523    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250522    clang-20
i386        buildonly-randconfig-001-20250523    clang-20
i386        buildonly-randconfig-002-20250522    gcc-12
i386        buildonly-randconfig-002-20250523    clang-20
i386        buildonly-randconfig-003-20250522    gcc-12
i386        buildonly-randconfig-003-20250523    clang-20
i386        buildonly-randconfig-004-20250522    gcc-12
i386        buildonly-randconfig-004-20250523    clang-20
i386        buildonly-randconfig-005-20250522    gcc-12
i386        buildonly-randconfig-005-20250523    clang-20
i386        buildonly-randconfig-006-20250522    clang-20
i386        buildonly-randconfig-006-20250523    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250523    gcc-15.1.0
loongarch             randconfig-002-20250523    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250523    gcc-10.5.0
nios2                 randconfig-002-20250523    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250523    gcc-9.3.0
parisc                randconfig-002-20250523    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250523    clang-21
powerpc               randconfig-002-20250523    clang-21
powerpc               randconfig-003-20250523    clang-20
powerpc64             randconfig-001-20250523    clang-21
powerpc64             randconfig-002-20250523    clang-19
powerpc64             randconfig-003-20250523    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250522    gcc-9.3.0
riscv                 randconfig-001-20250523    gcc-8.5.0
riscv                 randconfig-002-20250522    clang-18
riscv                 randconfig-002-20250523    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250522    clang-19
s390                  randconfig-001-20250523    gcc-6.5.0
s390                  randconfig-002-20250522    clang-18
s390                  randconfig-002-20250523    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250522    gcc-13.3.0
sh                    randconfig-001-20250523    gcc-12.4.0
sh                    randconfig-002-20250522    gcc-13.3.0
sh                    randconfig-002-20250523    gcc-6.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250522    gcc-14.2.0
sparc                 randconfig-001-20250523    gcc-10.3.0
sparc                 randconfig-002-20250522    gcc-6.5.0
sparc                 randconfig-002-20250523    gcc-10.3.0
sparc64               randconfig-001-20250522    gcc-14.2.0
sparc64               randconfig-001-20250523    gcc-9.3.0
sparc64               randconfig-002-20250522    gcc-12.4.0
sparc64               randconfig-002-20250523    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250522    gcc-12
um                    randconfig-001-20250523    gcc-12
um                    randconfig-002-20250522    gcc-12
um                    randconfig-002-20250523    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250522    clang-20
x86_64      buildonly-randconfig-001-20250523    gcc-12
x86_64      buildonly-randconfig-002-20250522    gcc-12
x86_64      buildonly-randconfig-002-20250523    clang-20
x86_64      buildonly-randconfig-003-20250522    gcc-12
x86_64      buildonly-randconfig-003-20250523    clang-20
x86_64      buildonly-randconfig-004-20250522    gcc-12
x86_64      buildonly-randconfig-004-20250523    clang-20
x86_64      buildonly-randconfig-005-20250522    gcc-12
x86_64      buildonly-randconfig-005-20250523    clang-20
x86_64      buildonly-randconfig-006-20250522    gcc-12
x86_64      buildonly-randconfig-006-20250523    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250522    gcc-14.2.0
xtensa                randconfig-001-20250523    gcc-9.3.0
xtensa                randconfig-002-20250522    gcc-10.5.0
xtensa                randconfig-002-20250523    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

