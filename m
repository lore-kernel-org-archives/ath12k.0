Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C9BE67493
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 03:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TkMOPx67wqeUhOQVaBTY4XWIpekEe6iMweP1mY+exNg=; b=2sVy1l9E35NTDTdjWsUcvLXkD0
	3OUVYCxjFK/uqYEYrK1to3kvuqtjaQAVR6vawaLd75dUfMwPVo7BQyXeeRWQMC0jMxeq8jdkHG59P
	KXTf42eQGEV7L75Xo/+OkLAxJi6EtgTkrhOl4Kmz6IyKJqOyzexW/34hMB2lOp/fGuHxAJ5RI8XBg
	COxAvrW6SdK9zUI28S8I9CjMK/PmADFC+d3HAyfJg47n1D2rxziO/7mt5WjldEWUt2FFBYLz7k9u3
	mlMBWXERRRzW1/eJZ7z++FRQrF0ZG+p5x2kgwV21XI/mrFftl5QDPG99aCGxyUuwsgSTA4QXmRjWl
	YNoJSJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6iMW-00000005fKs-2bEx
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 03:30:12 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6iMT-00000005fKR-11fL
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 03:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730431809; x=1761967809;
  h=date:from:to:cc:subject:message-id;
  bh=KTzl/mZyCu/j4HpGYFC5s1JIZtICO6TPC3Jk0KqANfI=;
  b=nCgZYNrhT6Af0zB89GZgHp2rzn6fQl9sENtOyfd9uKKxgLzs6hdXhos+
   aHwsorh89AFt1pjkwmfuYi5A2/HATBg4V+5kfqmhE370nJDsRal+n+2yL
   9HLNjq5gZmLJnJYIf2kJBzZfGH8rST12NM8XKjIdnB1cnINvFU15fLRBg
   AlO5i9EGGHVKIldUZhd7dSNAkyc97tJr9vmld9ddHAEDeCCV/OzvRpQ1P
   Mz6TqtunyYJNy9cxRSx46/enh9tTtnrJY4RDH0kllrPrld4b7NuVn15OF
   wzI68fKgwq6ES/qmDaovitRAjOhFDRjnH2Ehd0Hqe9kAfRRj7MTxqsBl1
   Q==;
X-CSE-ConnectionGUID: RMoa6i52Tdqud7EeVJuPOA==
X-CSE-MsgGUID: 3uAHJyFNTQiA38r0ZkDYbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="41564570"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="41564570"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 20:30:07 -0700
X-CSE-ConnectionGUID: eM8NRuIEQp23KmMXJzht6Q==
X-CSE-MsgGUID: nxJjl13ATQClDAJQLBYkLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="87379679"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2024 20:30:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6iMN-000h66-1i;
	Fri, 01 Nov 2024 03:30:03 +0000
Date: Fri, 01 Nov 2024 11:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 e9956f71084fffc25c9edf55300e52e879da1e25
Message-ID: <202411011148.Eg3PxKi6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_203009_326550_AC4F2218 
X-CRM114-Status: UNSURE (   3.93  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
branch HEAD: e9956f71084fffc25c9edf55300e52e879da1e25  wifi: ath12k: mac: use lockdep_assert_wiphy() more

elapsed time: 1840m

configs tested: 117
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20241101    gcc-13.2.0
arc                   randconfig-002-20241101    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    gcc-14.1.0
arm                        mvebu_v7_defconfig    clang-15
arm                   randconfig-001-20241101    gcc-14.1.0
arm                   randconfig-002-20241101    gcc-14.1.0
arm                   randconfig-003-20241101    gcc-14.1.0
arm                   randconfig-004-20241101    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20241101    gcc-14.1.0
arm64                 randconfig-002-20241101    clang-20
arm64                 randconfig-003-20241101    clang-20
arm64                 randconfig-004-20241101    gcc-14.1.0
csky                             alldefconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241101    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241101    clang-19
i386        buildonly-randconfig-002-20241101    gcc-12
i386        buildonly-randconfig-003-20241101    clang-19
i386        buildonly-randconfig-004-20241101    gcc-12
i386        buildonly-randconfig-005-20241101    clang-19
i386        buildonly-randconfig-006-20241101    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241101    clang-19
i386                  randconfig-002-20241101    gcc-12
i386                  randconfig-003-20241101    gcc-11
i386                  randconfig-004-20241101    gcc-12
i386                  randconfig-005-20241101    clang-19
i386                  randconfig-006-20241101    gcc-12
i386                  randconfig-011-20241101    gcc-12
i386                  randconfig-012-20241101    gcc-12
i386                  randconfig-013-20241101    clang-19
i386                  randconfig-014-20241101    gcc-11
i386                  randconfig-015-20241101    clang-19
i386                  randconfig-016-20241101    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    gcc-14.1.0
m68k                        m5272c3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    clang-20
mips                        bcm47xx_defconfig    clang-15
mips                      bmips_stb_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.1.0
powerpc                  storcenter_defconfig    gcc-14.1.0
powerpc                     tqm8541_defconfig    clang-15
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241101    gcc-12
x86_64      buildonly-randconfig-002-20241101    clang-19
x86_64      buildonly-randconfig-003-20241101    gcc-12
x86_64      buildonly-randconfig-004-20241101    clang-19
x86_64      buildonly-randconfig-005-20241101    gcc-12
x86_64      buildonly-randconfig-006-20241101    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241101    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

