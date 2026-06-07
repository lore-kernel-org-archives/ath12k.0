Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8E6CD8C89
	for <ath12k@archiver.kernel.org>; Sun,  7 Jun 2026 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QTWgn9EYmSTdwKw5gmdg8sTpVji/whMOFBb3Bpb/9nc=; b=LgVZww8KMlKgVgu536OztzkPtN
	FotstOAhMdIgsz2IM+KY3cOtRTfjbaYF2WstTxl0BmAxzb7l12iRuWQ6sbOVmCjaYV4EuLFFASdU3
	wHuARd6EjgQxP6a0ssat6kcI0s/zg4mpqeh56dSLtuyrRFziqnqyZLL67ZRly4lE4838pVkrfelyT
	re5ro1zS8WlyFoyzD3wTv09TXBtT1mtyPs6+One6IkD5bhjvsyfBPC7futgxIaozIBo7KiiqKytLQ
	HMPg1uPJt6t9JTxrWXCsN2TVTu/rqFNOLA6Eicf1Y1tRF2EUqlbg+hfcZQZSLm8r4JsMJVkgoOWf8
	6QOmTxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHoZ-00000002OvH-1dAZ;
	Sun, 07 Jun 2026 18:01:39 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHoW-00000002Oug-2o5t
	for ath12k@lists.infradead.org;
	Sun, 07 Jun 2026 18:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780855297; x=1812391297;
  h=date:from:to:cc:subject:message-id;
  bh=y/V2f+mBn+NFFp7I6eb6CM46wcQbOXIkWnVXhSHwsHk=;
  b=AvPnIhB5Y+EzYQrwA9sX0Oy1Xi6SsjWU3OlYfiedZzBeRmAorxt94aLd
   HrYVn55SMt7VDV6BJjM7DSVNSu2kHQ6aj2nNdgtSpIiM+iKD4OmnjJQw2
   0yKgNVpE+Z8xZHweebyBQyuL9yS5Fh+u5H8NsL70gy72nt7tCkKsJ8TnM
   wbR5jIVxc1MEBmWv0lhBXe64jAOxsahvwurR6fS93UmOiGKKnIKBfTNQG
   GTZ7lz092Ou6JWvhNKlx64pj3gF1vDixxeTQcNIKQNVYWjPZeY5/gXyzj
   oVtBy4fTs7KREJ7liw16d6eY9WVBfC+hQd3a0nLvT2O8gGXdZ60QhFw/g
   Q==;
X-CSE-ConnectionGUID: WvJX6/xlTt2XxNcYCfKfkA==
X-CSE-MsgGUID: jxTHLTgCT6iXRkADIYC8vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81663235"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="81663235"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 11:01:36 -0700
X-CSE-ConnectionGUID: fWtwZ7zJSmSDLIe4+/1bjg==
X-CSE-MsgGUID: gdV2blVnRNSLcUB/6RDjZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="241145544"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jun 2026 11:01:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWHoR-00000000I2I-39uW;
	Sun, 07 Jun 2026 18:01:31 +0000
Date: Mon, 08 Jun 2026 02:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 38b2fb7d2df16f5801f7d88a4739942b95a5f6aa
Message-ID: <202606080214.br8q1wNM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_110136_802940_73E6ED1C 
X-CRM114-Status: UNSURE (   4.03  )
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
branch HEAD: 38b2fb7d2df16f5801f7d88a4739942b95a5f6aa  wifi: ath9k_htc: allocate tx_buf and buf together

elapsed time: 1145m

configs tested: 198
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260607    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260607    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260607    gcc-8.5.0
arm                            randconfig-002    gcc-15.2.0
arm                   randconfig-002-20260607    clang-23
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260607    clang-23
arm                            randconfig-004    gcc-13.4.0
arm                   randconfig-004-20260607    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260607    gcc-13.4.0
arm64                          randconfig-002    gcc-8.5.0
arm64                 randconfig-002-20260607    gcc-8.5.0
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20260607    gcc-8.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260607    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-13.4.0
csky                  randconfig-001-20260607    gcc-15.2.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260607    gcc-9.5.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon                        randconfig-001    clang-23
hexagon               randconfig-001-20260607    clang-17
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260607    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260607    gcc-14
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260607    gcc-12
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260607    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260607    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260607    clang-22
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260607    gcc-14
i386                                defconfig    clang-22
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260607    clang-22
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260607    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260607    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260607    gcc-12
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260607    clang-22
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260607    clang-22
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260607    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    clang-23
loongarch             randconfig-001-20260607    gcc-13.4.0
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260607    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260607    gcc-8.5.0
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260607    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260607    gcc-16.1.0
parisc                randconfig-002-20260607    gcc-10.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260607    clang-23
powerpc               randconfig-002-20260607    clang-23
powerpc64             randconfig-001-20260607    clang-23
powerpc64             randconfig-002-20260607    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260607    clang-23
riscv                 randconfig-002-20260607    gcc-11.5.0
s390                             alldefconfig    gcc-16.1.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                  randconfig-001-20260607    clang-23
s390                  randconfig-002-20260607    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260607    gcc-11.5.0
sh                    randconfig-002-20260607    gcc-9.5.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260607    gcc-14.3.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260607    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                        randconfig-001    gcc-12.5.0
sparc64               randconfig-001-20260607    gcc-8.5.0
sparc64                        randconfig-002    clang-20
sparc64               randconfig-002-20260607    clang-20
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                             randconfig-001    clang-23
um                    randconfig-001-20260607    gcc-14
um                             randconfig-002    clang-23
um                    randconfig-002-20260607    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260607    gcc-14
x86_64      buildonly-randconfig-002-20260607    gcc-14
x86_64      buildonly-randconfig-003-20260607    clang-22
x86_64      buildonly-randconfig-004-20260607    gcc-12
x86_64      buildonly-randconfig-005-20260607    gcc-14
x86_64      buildonly-randconfig-006-20260607    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260607    gcc-14
x86_64                randconfig-002-20260607    gcc-14
x86_64                randconfig-003-20260607    gcc-14
x86_64                randconfig-004-20260607    clang-22
x86_64                randconfig-005-20260607    gcc-14
x86_64                randconfig-006-20260607    gcc-14
x86_64                randconfig-011-20260607    gcc-14
x86_64                randconfig-012-20260607    gcc-14
x86_64                randconfig-013-20260607    clang-22
x86_64                randconfig-014-20260607    gcc-14
x86_64                randconfig-015-20260607    clang-22
x86_64                randconfig-016-20260607    gcc-14
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260607    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260607    clang-22
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260607    gcc-12
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260607    clang-22
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260607    clang-22
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260607    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260607    gcc-10.5.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260607    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

