Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773D8C02187
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 01:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v0C2x7NmcO7m1PMd8xUhyDl0mydxPmvISnFTIeStTCU=; b=AywASfnxYWsN0mhnwWEYqDeIHm
	/yd9KhWm3P/FApf433dmvP50KxakFQ7aQR+OoRHP+fzdtgd6WhEmpDDhSxSCe7mgtkFlPpoI0Xmrh
	7vRQTfJipZEnISoNjeaWOAscI6EMZUisW1jw3diQNgdtzCiXvYwKRO6MidZDfCy/RSkSSFVpepFKQ
	I3EB5ovrYl2gWyZFa2+RD4+DYmN5trD6HWISVAOKbxZRevBci9UJNdoQRc/Le6nmrwoFtACSjlxnX
	8apsPzzL02SzgHX7Z560OOvwUHtKnWROY/X1UQKyOGkjXQvYoF8TTsBrWu4pE7Cm97FiOOIPUwZmg
	HFBTbOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZJsi-0000000398M-0MFE
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 01:13:40 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZJsc-00000003971-3PU1
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 01:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737249214; x=1768785214;
  h=date:from:to:cc:subject:message-id;
  bh=Tg59N8rdpQQbIDTbBcZvBEQU5ySaT7SEUyK1oYipWTE=;
  b=ULrIGcYhQiwug1whyXm8N/A5xO3QdsrxNzxwP7MQTtE7gnMR6mkGPfeO
   T3wJAwrDYuUMHwNNG8fRmRsKQt4rhL5anmmAqtQdJ91HUx2b0AkkMTPIa
   C3I21bUKzqmJc3P+wJ2vhsFZsL3lphZbHW5xh50bXL6adpQSrxZyOCqHX
   0pRwQeYelZYbaENZLT+1GTDw/rDByK7f60cM5zy+/EN7TYtxjvVB6kkLv
   swsQIZHYYm+vgoX8EsK8BzyPgBptM8jkdVQGO3KUJ68sHHescdo8WrVBn
   RX54v+PSiFe9VUBUpSfCFZ0CuiTGsdciKKlI6LWJ1/Vo1CiXHE3X9dQIT
   g==;
X-CSE-ConnectionGUID: V+MYDvkGR0mcY2GpIIdC0w==
X-CSE-MsgGUID: jJ6T3EpSSiikniEygBBYOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48237646"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="48237646"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 17:13:26 -0800
X-CSE-ConnectionGUID: c8pYQjQ3S1ioJ+bWHSs/Jw==
X-CSE-MsgGUID: o9A0/zyKS6moSdoGUwdXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106598720"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jan 2025 17:13:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZJsQ-000UzD-2l;
	Sun, 19 Jan 2025 01:13:22 +0000
Date: Sun, 19 Jan 2025 09:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 e7ef944b3e2c31b608800925e784f67596375770
Message-ID: <202501190913.Ltl7UAIN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_171334_864622_D94E9996 
X-CRM114-Status: UNSURE (   4.18  )
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
branch HEAD: e7ef944b3e2c31b608800925e784f67596375770  Add localversion-wireless-testing-ath

elapsed time: 1443m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250118    gcc-13.2.0
arc                   randconfig-002-20250118    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250118    gcc-14.2.0
arm                   randconfig-002-20250118    clang-20
arm                   randconfig-003-20250118    gcc-14.2.0
arm                   randconfig-004-20250118    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250118    clang-17
arm64                 randconfig-002-20250118    gcc-14.2.0
arm64                 randconfig-003-20250118    clang-20
arm64                 randconfig-004-20250118    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250118    gcc-14.2.0
csky                  randconfig-002-20250118    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250118    clang-20
hexagon               randconfig-002-20250118    clang-20
i386        buildonly-randconfig-001-20250118    gcc-12
i386        buildonly-randconfig-002-20250118    clang-19
i386        buildonly-randconfig-003-20250118    clang-19
i386        buildonly-randconfig-004-20250118    gcc-11
i386        buildonly-randconfig-005-20250118    clang-19
i386        buildonly-randconfig-006-20250118    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250118    gcc-14.2.0
loongarch             randconfig-002-20250118    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250118    gcc-14.2.0
nios2                 randconfig-002-20250118    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250118    gcc-14.2.0
parisc                randconfig-002-20250118    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250118    clang-15
powerpc               randconfig-002-20250118    clang-20
powerpc               randconfig-003-20250118    clang-20
powerpc64             randconfig-001-20250118    clang-17
powerpc64             randconfig-002-20250118    clang-19
powerpc64             randconfig-003-20250118    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250118    gcc-14.2.0
riscv                 randconfig-002-20250118    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250118    clang-20
s390                  randconfig-002-20250118    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250118    gcc-14.2.0
sh                    randconfig-002-20250118    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250118    gcc-14.2.0
sparc                 randconfig-002-20250118    gcc-14.2.0
sparc64               randconfig-001-20250118    gcc-14.2.0
sparc64               randconfig-002-20250118    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250118    clang-17
um                    randconfig-002-20250118    clang-15
x86_64      buildonly-randconfig-001-20250118    clang-19
x86_64      buildonly-randconfig-002-20250118    gcc-12
x86_64      buildonly-randconfig-003-20250118    clang-19
x86_64      buildonly-randconfig-004-20250118    gcc-12
x86_64      buildonly-randconfig-005-20250118    clang-19
x86_64      buildonly-randconfig-006-20250118    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250118    gcc-14.2.0
xtensa                randconfig-002-20250118    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

