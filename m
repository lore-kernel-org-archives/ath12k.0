Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91EECD5BD0
	for <ath12k@archiver.kernel.org>; Sat, 30 May 2026 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xHVcVXwRJjo/ZMD1dcNdKjvs/AUZhGWWZ9qnFkT/wM0=; b=LyS27FQoRpCHRLNeMZ9AGp3hwi
	Yys0aJftPGTtYo63IhP7e1gh9zFadox7116SMAf225+QT6+d9svr2Id2M15V0OibyYXABoUEg6uK5
	QKQpJ+XtbjkI/QAPhSMJrfaV9Hz0yGr1Z6vhc1XbmMV2HSk0c3hGIOvkJo4qaCcyl1Y3OZtwriwFZ
	RZcYjNJokxQha6lhviy+ebS4IuUYy3lmxQTyYaJ+U8WkJquLrTaUDCki/TLGK9VyUmqiTseUCgIhn
	RnESUSZ0033+B+VkNsXhc0IZ2EU9n6zLJgNsat2GfAoTiXlG1qcIgRCYB9pvCiROIFRlb+MvID9h6
	1xFdrfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTIyh-00000008js6-1Q64;
	Sat, 30 May 2026 12:39:47 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTIyd-00000008jre-2kEW
	for ath12k@lists.infradead.org;
	Sat, 30 May 2026 12:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780144784; x=1811680784;
  h=date:from:to:cc:subject:message-id;
  bh=+i6d9gX+n3gNiR9maGHTH4dbq7eS5h/2KnPTH2EL7xQ=;
  b=fkql8Y7GhBhtsDWkI6Jt3iGohAnbc4Q7H9wGYlIYgvJNJ2MtITZYTEN9
   NelJVtwAgriZuOir6PbSYzonx9h+ZX5tWeNT+6RqlkegFfIskicaJZdtZ
   gv6NAMc8+xlB8dv4pYbuElIAkhVCB1wqwkDmzwcjZH5dwDylojkeJRBGM
   inbjIKRfnWng7JsNE7c4WMm40HHNJYaKGi8AXVJZQbj1sv4hRkHErjpYp
   zIwdCQgwHlQfjhE+WYJ2TIGiKb3r15IvFUK/6jVZleIbCBLdZ530Z6wuW
   sMBIT5fe10K6WcD57Q/RJ0NqWXAKBskFPZm5XH8mqWNg9+A2ozWgPmN/+
   g==;
X-CSE-ConnectionGUID: hKJ7j1EXQEyxdKanTyTzCg==
X-CSE-MsgGUID: +9cTpqwxTQy0xglk1+bWGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92446027"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="92446027"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 05:39:40 -0700
X-CSE-ConnectionGUID: 15+WbZd/SxWVjYLFebSCZQ==
X-CSE-MsgGUID: URpLj/lwTSaQqSVG319BFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="247102410"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2026 05:39:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTIyW-000000008Pm-1rwG;
	Sat, 30 May 2026 12:39:36 +0000
Date: Sat, 30 May 2026 20:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 e6b476e4ea19919b4c06ba2f5504258ab5d5d9aa
Message-ID: <202605302034.XO7RnxKp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_053943_771633_A8F2EE89 
X-CRM114-Status: UNSURE (   4.08  )
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
branch HEAD: e6b476e4ea19919b4c06ba2f5504258ab5d5d9aa  Add localversion-wireless-testing-ath

elapsed time: 731m

configs tested: 109
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260530    gcc-14.3.0
arc                   randconfig-002-20260530    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260530    gcc-14.3.0
arm                   randconfig-002-20260530    gcc-14.3.0
arm                   randconfig-003-20260530    gcc-14.3.0
arm                   randconfig-004-20260530    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386                  randconfig-001-20260530    clang-20
i386                  randconfig-002-20260530    clang-20
i386                  randconfig-003-20260530    clang-20
i386                  randconfig-004-20260530    clang-20
i386                  randconfig-005-20260530    clang-20
i386                  randconfig-006-20260530    clang-20
i386                  randconfig-007-20260530    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                loongson64_defconfig    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260530    gcc-8.5.0
parisc                randconfig-002-20260530    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260530    gcc-8.5.0
powerpc               randconfig-002-20260530    gcc-8.5.0
powerpc64             randconfig-001-20260530    gcc-8.5.0
powerpc64             randconfig-002-20260530    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260530    gcc-12.5.0
riscv                 randconfig-002-20260530    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260530    gcc-12.5.0
s390                  randconfig-002-20260530    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260530    gcc-12.5.0
sh                    randconfig-002-20260530    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260530    gcc-14
x86_64      buildonly-randconfig-002-20260530    gcc-14
x86_64      buildonly-randconfig-003-20260530    gcc-14
x86_64      buildonly-randconfig-004-20260530    gcc-14
x86_64      buildonly-randconfig-005-20260530    gcc-14
x86_64      buildonly-randconfig-006-20260530    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

