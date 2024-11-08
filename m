Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137F7D5C0C2
	for <ath12k@archiver.kernel.org>; Fri,  8 Nov 2024 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ltlLG5D5qOsDOGmjFNWonD8IWkS2XkwGiLcsRG5NQEE=; b=nTrEgqDxNtnYpq89jjS0WivZQn
	wlzvYWZsAgFAraOdsyBRdNjPecW/nd0+OgAbXsxXNEQDRO4CTaBT4kPY1zrL/Es4jKzZkN4W6A7vx
	27K8MneCHe1B77CQ/iayQWR8CoapJHCH0/jXXKsILkz6KghRvnaZazAP5LtUdfoHYQ9Ok6j9FWNh/
	b+8Fes3gXX3zK+dfVPJK+1CCn2VIxW5wvfOzuKDzzQW6TjYjGxkwkI417wvTc/HK0PHosULbn1suq
	epwh7nQAX7LkknJniFZblJc8fgN26imqIeAs3kawlEKqG8LDDdmNBzxP6b4FuTTwjdMp3XKgpAj0i
	OqpAg+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OY6-0000000AbCS-34zN
	for ath12k@archiver.kernel.org;
	Fri, 08 Nov 2024 12:57:14 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OY2-0000000AbBh-3Yz5
	for ath12k@lists.infradead.org;
	Fri, 08 Nov 2024 12:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731070631; x=1762606631;
  h=date:from:to:cc:subject:message-id;
  bh=oPVCg01IYaO78x/HzvOBa1xYcpjF2vghuNts69ORjsQ=;
  b=hEkPLIqZBcv1oRrXL1YBiGn+JPz3iqsw/MpSpvEg/vxcWS9e/fDkWDKG
   sDwjTB5T6kBBKqEQ9NlRQ+DeWdj2utAMPqprgrI6XuJy6tsyfegLtsifE
   sFLudNt9RNTCx93O1OqmKugibSrittntG6kx174FNpu1FkMyWQnRWYzy6
   0zLjdtXQGHa6OsKVZQsGOjbYiWuwFhMpFUDZkUdLcYxSGzFiAGWgyYV3m
   hpFKk5+2mI3Y0QpUMxzqCcxZeh9W08A9v3ZuUjusTckJ8sbqDuC9OuGJN
   tsU0LcagC9Yvo0SWuuUGJ9lf+nmBbZyFOolwNfHLGtIg5673VadKL/myx
   Q==;
X-CSE-ConnectionGUID: O/gCTO2pT3Wxd+qz+M4ysw==
X-CSE-MsgGUID: cEBAvuxQQa2JzcJvvTXNsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31053901"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="31053901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:57:06 -0800
X-CSE-ConnectionGUID: zN6Z3yczQUKDleHoeAASGg==
X-CSE-MsgGUID: UXUybUoDSUmn+5SHgIv5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90675917"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2024 04:57:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9OXu-000rQs-1V;
	Fri, 08 Nov 2024 12:57:02 +0000
Date: Fri, 08 Nov 2024 20:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 cf425f524f534a8159c704724bfdc3993cc24328
Message-ID: <202411082053.7kZKG252-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_045710_957961_571AF753 
X-CRM114-Status: UNSURE (   3.83  )
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
branch HEAD: cf425f524f534a8159c704724bfdc3993cc24328  Merge branch 'pending' into main-pending

elapsed time: 800m

configs tested: 116
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241108    gcc-13.2.0
arc                   randconfig-002-20241108    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241108    gcc-14.2.0
arm                   randconfig-002-20241108    gcc-14.2.0
arm                   randconfig-003-20241108    clang-15
arm                   randconfig-004-20241108    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241108    clang-20
arm64                 randconfig-002-20241108    gcc-14.2.0
arm64                 randconfig-003-20241108    clang-20
arm64                 randconfig-004-20241108    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241108    gcc-14.2.0
csky                  randconfig-002-20241108    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241108    clang-16
hexagon               randconfig-002-20241108    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241108    clang-19
i386        buildonly-randconfig-002-20241108    clang-19
i386        buildonly-randconfig-003-20241108    gcc-12
i386        buildonly-randconfig-004-20241108    clang-19
i386        buildonly-randconfig-005-20241108    clang-19
i386        buildonly-randconfig-006-20241108    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241108    clang-19
i386                  randconfig-002-20241108    clang-19
i386                  randconfig-003-20241108    clang-19
i386                  randconfig-004-20241108    gcc-12
i386                  randconfig-005-20241108    clang-19
i386                  randconfig-006-20241108    gcc-12
i386                  randconfig-011-20241108    gcc-12
i386                  randconfig-012-20241108    clang-19
i386                  randconfig-013-20241108    clang-19
i386                  randconfig-014-20241108    clang-19
i386                  randconfig-015-20241108    gcc-12
i386                  randconfig-016-20241108    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241108    gcc-14.2.0
loongarch             randconfig-002-20241108    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241108    gcc-14.2.0
nios2                 randconfig-002-20241108    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241108    gcc-14.2.0
parisc                randconfig-002-20241108    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241108    clang-15
powerpc               randconfig-002-20241108    clang-15
powerpc               randconfig-003-20241108    clang-20
powerpc64             randconfig-001-20241108    clang-20
powerpc64             randconfig-002-20241108    gcc-14.2.0
powerpc64             randconfig-003-20241108    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241108    clang-20
riscv                 randconfig-002-20241108    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241108    gcc-14.2.0
s390                  randconfig-002-20241108    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241108    gcc-14.2.0
sh                    randconfig-002-20241108    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241108    gcc-14.2.0
sparc64               randconfig-002-20241108    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                    randconfig-001-20241108    clang-15
um                    randconfig-002-20241108    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241108    gcc-12
x86_64      buildonly-randconfig-002-20241108    clang-19
x86_64      buildonly-randconfig-003-20241108    clang-19
x86_64      buildonly-randconfig-004-20241108    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-8.3    gcc-12
x86_64                    rhel-8.3-kselftests    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241108    gcc-14.2.0
xtensa                randconfig-002-20241108    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

