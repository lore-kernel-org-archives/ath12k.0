Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44690CCD195
	for <ath12k@archiver.kernel.org>; Sat, 18 Oct 2025 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ACFnn32upWvIIv7AAM6CJo+z4+t75qlMeU1gWmOt0C4=; b=WSFu0/Yt4ph8BHheydQYbNUysp
	6aGpTC7va/Ot/xJbXygNMq/Je3CQmQ0hdtTthk436n/rjiJuWohzTPqrdBnzMnDi+lnPndeOGMRyw
	fU8a8HMYBh2o8GuI63VQcufImJEbowrrDHsv91v92Ku0qZptdjJ6n4W6FRE5FFVqN6kG91Heb9E38
	4A3WqVxWpmtIjdKYF/pMppGduWOYfAuvK/71FBaVxvuW1btLwflIwzqAgWJLY/QMaiFWvqwmsT+Ek
	hhho8qRh0jldXN90swYmKh6KPgikdwcBNrxCjviZ2l5YjCZdOgXlgvJSj7s0SO0/kvEiggg+P7Hfj
	mtYQ0LUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA8et-0000000A3yH-4AEm;
	Sat, 18 Oct 2025 15:15:51 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA8er-0000000A3xc-3Yev
	for ath12k@lists.infradead.org;
	Sat, 18 Oct 2025 15:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760800550; x=1792336550;
  h=date:from:to:cc:subject:message-id;
  bh=WVYa9BhEBFgYnAZyXov5RUEgY2LgBMOXHsOh45A2NrU=;
  b=Troun9hk9ksNjt5zYWetBWZwTqKEdw+bKbJxI2SHSSRbhzqJJ8RqFdpQ
   Qmv5qWcPKzdUTgLxXc+RpiMZpBz43oxH9qiDkYLw1qS75oM+xzkkVT+8M
   /iUNgEKNcw5mmbGRjV2hPm9iToxMs0GBTQP4F26ZsM8PZoCtw3/vWchtt
   6aV1vXwR9YY4ti5a1uDUgkbUS7cW1B6CMslc0EaMEBPtts+lHJlEtxa1q
   S8KB0YOYOeA4OwSx/7RQHf3Qqie1sWwsgmnLAYLr5qTArdz27ltEvbdlY
   uyyW77jakZfwLdbvGStY+Lcv8y2BQGdrNrETqkbXkKj8St5cjzaWXJ4Kz
   A==;
X-CSE-ConnectionGUID: rLpfV919R62iah1YNL4NLg==
X-CSE-MsgGUID: dP5DK+6VR+WWwjjR/NOOrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62897875"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62897875"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 08:15:49 -0700
X-CSE-ConnectionGUID: mmQF0QXRS8yzMF+HCKlFsQ==
X-CSE-MsgGUID: yJhHOfGVTOC6Hj2NvUlVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182160867"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2025 08:15:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA8eo-0008Mj-0I;
	Sat, 18 Oct 2025 15:15:46 +0000
Date: Sat, 18 Oct 2025 23:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 1fe3ca6f9df1b8540dae015b09de2c33d815fac7
Message-ID: <202510182333.0IhXBtVB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_081549_929998_044468C6 
X-CRM114-Status: UNSURE (   3.95  )
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
branch HEAD: 1fe3ca6f9df1b8540dae015b09de2c33d815fac7  spi: amlogic: fix spifc build error

elapsed time: 1456m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsimosci_defconfig    clang-22
arc                   randconfig-001-20251018    clang-22
arc                   randconfig-001-20251018    gcc-12.5.0
arc                   randconfig-002-20251018    clang-22
arc                   randconfig-002-20251018    gcc-8.5.0
arm                              alldefconfig    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    clang-22
arm                   randconfig-001-20251018    clang-19
arm                   randconfig-001-20251018    clang-22
arm                   randconfig-002-20251018    clang-20
arm                   randconfig-002-20251018    clang-22
arm                   randconfig-003-20251018    clang-22
arm                   randconfig-004-20251018    clang-22
arm                   randconfig-004-20251018    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251018    clang-22
arm64                 randconfig-001-20251018    gcc-8.5.0
arm64                 randconfig-002-20251018    clang-22
arm64                 randconfig-003-20251018    clang-22
arm64                 randconfig-003-20251018    gcc-13.4.0
arm64                 randconfig-004-20251018    clang-22
arm64                 randconfig-004-20251018    gcc-11.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251018    gcc-9.5.0
csky                  randconfig-002-20251018    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251018    clang-22
hexagon               randconfig-002-20251018    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251018    gcc-14
i386        buildonly-randconfig-002-20251018    gcc-14
i386        buildonly-randconfig-003-20251018    clang-20
i386        buildonly-randconfig-004-20251018    gcc-14
i386        buildonly-randconfig-005-20251018    clang-20
i386        buildonly-randconfig-006-20251018    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251018    gcc-14
i386                  randconfig-002-20251018    gcc-14
i386                  randconfig-003-20251018    gcc-14
i386                  randconfig-004-20251018    gcc-14
i386                  randconfig-005-20251018    gcc-14
i386                  randconfig-006-20251018    gcc-14
i386                  randconfig-007-20251018    gcc-14
i386                  randconfig-011-20251018    clang-20
i386                  randconfig-012-20251018    clang-20
i386                  randconfig-013-20251018    clang-20
i386                  randconfig-014-20251018    clang-20
i386                  randconfig-015-20251018    clang-20
i386                  randconfig-016-20251018    clang-20
i386                  randconfig-017-20251018    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251018    clang-22
loongarch             randconfig-002-20251018    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    clang-22
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251018    gcc-11.5.0
nios2                 randconfig-002-20251018    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251018    gcc-10.5.0
parisc                randconfig-002-20251018    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                       holly_defconfig    clang-22
powerpc               randconfig-001-20251018    clang-22
powerpc               randconfig-002-20251018    clang-22
powerpc               randconfig-003-20251018    gcc-14.3.0
powerpc                     tqm8555_defconfig    clang-22
powerpc                 xes_mpc85xx_defconfig    clang-22
powerpc64             randconfig-001-20251018    gcc-10.5.0
powerpc64             randconfig-002-20251018    gcc-12.5.0
powerpc64             randconfig-003-20251018    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251018    gcc-8.5.0
riscv                 randconfig-002-20251018    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251018    clang-22
s390                  randconfig-002-20251018    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20251018    gcc-13.4.0
sh                    randconfig-002-20251018    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251018    gcc-11.5.0
sparc                 randconfig-002-20251018    gcc-13.4.0
sparc64               randconfig-001-20251018    gcc-8.5.0
sparc64               randconfig-002-20251018    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251018    gcc-14
um                    randconfig-002-20251018    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251018    clang-20
x86_64      buildonly-randconfig-001-20251018    gcc-14
x86_64      buildonly-randconfig-002-20251018    clang-20
x86_64      buildonly-randconfig-002-20251018    gcc-14
x86_64      buildonly-randconfig-003-20251018    clang-20
x86_64      buildonly-randconfig-003-20251018    gcc-14
x86_64      buildonly-randconfig-004-20251018    clang-20
x86_64      buildonly-randconfig-004-20251018    gcc-14
x86_64      buildonly-randconfig-005-20251018    clang-20
x86_64      buildonly-randconfig-005-20251018    gcc-14
x86_64      buildonly-randconfig-006-20251018    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251018    clang-20
x86_64                randconfig-072-20251018    clang-20
x86_64                randconfig-073-20251018    clang-20
x86_64                randconfig-074-20251018    clang-20
x86_64                randconfig-075-20251018    clang-20
x86_64                randconfig-076-20251018    clang-20
x86_64                randconfig-077-20251018    clang-20
x86_64                randconfig-078-20251018    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    clang-22
xtensa                randconfig-001-20251018    gcc-13.4.0
xtensa                randconfig-002-20251018    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

