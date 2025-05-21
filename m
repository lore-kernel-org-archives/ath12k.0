Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDABEC54E71
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QqulXRIpfMmcCx5qUXKGTo/8x0fZhqdSChTzj8kszBU=; b=Cd1xXLAp8Bw/6aJ5mAS1DZ9ILK
	KGbd73xNCXaYnXHv4FDqrj5yTe5Rjd5TLRYYv6VfdX6g9va8ve6ESqv5xgXsTJ5rArzc4SkOtPMU2
	y7YRHHbY57uPWfIZxsF+CSxcxnYTa7aJF3Cph8GZdigjHnFgbti+jPHvz+wyOhfUcNeWbT7grTusP
	ROlV3UQN/hFKMQa59UVQow6u9T+i7ThxmymnNMncQlmSGLfb5BfhcFyXKa2gM4lP9jSYCZCAmnag/
	ZMXkm2CStNQgl7LP2cMMw64M5d5Fz18uWOzsqezLHNYxFtLUVYFOx8Ly0v5IJ6bWMw9OjImAgXWvS
	kBUQq+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlMg-0000000GHFP-1qs6;
	Wed, 21 May 2025 15:28:18 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlLt-0000000GH4d-3QJJ
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 15:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747841250; x=1779377250;
  h=date:from:to:cc:subject:message-id;
  bh=2EVq5xzJEq9KlgFJDzt3gJD/pz15y+u86YJ1C+YIULY=;
  b=W9GQHQhu7a8nzhSvHtI5vScTSTxV5WJ/l2NjW7XMfwY7OWL4QIwJhzFa
   7R3MjNjVyqLIRfJpLMcYvy299Wk856x5rwwgxgUL7XC7SlsyItliQw9yg
   Z0dlqspqYTPwH3aSLKpb5/y7qXzyfrRBO+pyeL868j4gW52KTzLA4QWh3
   u/bCfGUEmgzUAs9746M29PsEY877ox7/ljWF1SYbRzzgRROjWvlIBrSQ7
   9ZN1f3oJ2MLCsWJFLZHEpebOuCdyae1enHb1lozkvPQl33qXQlLv50Y7Z
   SjeqU5c3v7j1cBq5l5iem0lXiHTbWYMCSuWyWOGobCCrQskyxTwryOSJo
   Q==;
X-CSE-ConnectionGUID: zKCbjs+UT7+9RXIb4SV14Q==
X-CSE-MsgGUID: 8zv6mcDHRlyjuXQBXlzLXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49964469"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49964469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 08:27:15 -0700
X-CSE-ConnectionGUID: DV1sMFhNSiKEVxJ0B0mnew==
X-CSE-MsgGUID: Xqz2+SHtQcKXiEDfrEVF6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="163391652"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 May 2025 08:27:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHlLb-000OOm-0k;
	Wed, 21 May 2025 15:27:11 +0000
Date: Wed, 21 May 2025 23:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 30d615f99e39e3ef5e2c35f55dca7417250fd353
Message-ID: <202505212344.CSKSBqng-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_082729_867651_C9BF6B07 
X-CRM114-Status: UNSURE (   4.23  )
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
branch HEAD: 30d615f99e39e3ef5e2c35f55dca7417250fd353  Merge branch 'pending' into main-pending

elapsed time: 1034m

configs tested: 107
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250521    gcc-10.5.0
arc                   randconfig-002-20250521    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250521    clang-21
arm                   randconfig-002-20250521    clang-21
arm                   randconfig-003-20250521    clang-16
arm                   randconfig-004-20250521    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250521    gcc-6.5.0
arm64                 randconfig-002-20250521    gcc-6.5.0
arm64                 randconfig-003-20250521    gcc-8.5.0
arm64                 randconfig-004-20250521    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250521    gcc-10.5.0
csky                  randconfig-002-20250521    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250521    clang-20
hexagon               randconfig-002-20250521    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250521    clang-20
i386        buildonly-randconfig-002-20250521    clang-20
i386        buildonly-randconfig-003-20250521    gcc-12
i386        buildonly-randconfig-004-20250521    clang-20
i386        buildonly-randconfig-005-20250521    gcc-12
i386        buildonly-randconfig-006-20250521    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250521    gcc-15.1.0
loongarch             randconfig-002-20250521    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250521    gcc-14.2.0
nios2                 randconfig-002-20250521    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250521    gcc-13.3.0
parisc                randconfig-002-20250521    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250521    clang-21
powerpc               randconfig-002-20250521    gcc-8.5.0
powerpc               randconfig-003-20250521    gcc-6.5.0
powerpc64             randconfig-001-20250521    gcc-8.5.0
powerpc64             randconfig-002-20250521    gcc-6.5.0
powerpc64             randconfig-003-20250521    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250521    gcc-8.5.0
riscv                 randconfig-002-20250521    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250521    clang-20
s390                  randconfig-002-20250521    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250521    gcc-12.4.0
sh                    randconfig-002-20250521    gcc-15.1.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250521    gcc-13.3.0
sparc                 randconfig-002-20250521    gcc-13.3.0
sparc64               randconfig-001-20250521    gcc-13.3.0
sparc64               randconfig-002-20250521    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250521    clang-21
um                    randconfig-002-20250521    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250521    clang-20
x86_64      buildonly-randconfig-002-20250521    clang-20
x86_64      buildonly-randconfig-003-20250521    gcc-12
x86_64      buildonly-randconfig-004-20250521    gcc-12
x86_64      buildonly-randconfig-005-20250521    clang-20
x86_64      buildonly-randconfig-006-20250521    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250521    gcc-15.1.0
xtensa                randconfig-002-20250521    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

