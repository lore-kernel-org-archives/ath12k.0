Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9F4FD88F3
	for <ath12k@archiver.kernel.org>; Wed, 11 Mar 2026 04:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O2Uzi1clC8TXnwpg2srv4iAEnRqzUkoFvC+1jBvzMTU=; b=I1X8nCVlCTdR4YJjyleNylXqRU
	eSP34LijaB49Kc8lxI7ExAyYyMUDriB5ysxQEMR1xPhuGunRLzIgz3kO48iS+EnkRwjzk9XOfbhA5
	+eq+VCZyIbfwsWuRWBVKLgGQg019aDW7OYAk6rRovfHRr2MYalERQzEOLpmKqBGml6nWzm96TONSM
	N/zvbCSBoA+rN2kB8wz7QWhDrL2wkueHv1Sf5LZpLNsho0X7tDrEERAUQLNCWTAH3+Qt7VNxIjPDX
	eV4aBRMRAPtddxll//1KV99zV00NjskAQ/Gd/CliE44iY2Zh+cuKQ3veDgVt9O//KovTpByVg3O8b
	I0DAmaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0AyQ-0000000Ah3j-1h3X;
	Wed, 11 Mar 2026 04:15:06 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0AyO-0000000Ah3B-2kJL
	for ath12k@lists.infradead.org;
	Wed, 11 Mar 2026 04:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773202504; x=1804738504;
  h=date:from:to:cc:subject:message-id;
  bh=fcCmmdqqorAgKvPqZ4/NJv7GHcvgY44xLjSpj22iUsI=;
  b=ENa0Zw1HnT9Iq25afFym9NSwwCyG5aF7V47ihQbuvmBaChfLeH5JwZ9K
   7+HqWcRM5QF/V88u5iA0MePTqTnGPZY3XgqabunGo9CSKhOcehuNhKejl
   6vtLCbBFSNsTpNehpsjoQZvp2Gw5ZBWdjtq91SHYzBpv71qZ4cxFcqTJ3
   DMVGdoMCcZwUS0SZ4MAi/H0hnPzW1IFItTEzGkZgZ+n/QswukoLbccQ8l
   u4lvMKx2YX1oPYd6yojSSpBe+eh9WeKIv9trzq0uIatBWbLw29esxUQHl
   HRrdgC6+wEMY3w3cWHCbb+6Uvogz/pRj1IynwPYTj6a1qtyjbqIHdD3mC
   g==;
X-CSE-ConnectionGUID: GYFZtRbMR4KhhQipsxHScA==
X-CSE-MsgGUID: PIhL/h9LSWuiRyIUD32y2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77867393"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="77867393"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 21:15:02 -0700
X-CSE-ConnectionGUID: rI596aQ3T+Kw9Ql3b6Bbbw==
X-CSE-MsgGUID: tLfEGsnjToqn73u+C+aTOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224799586"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Mar 2026 21:15:01 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0AyI-000000000gb-0Kyf;
	Wed, 11 Mar 2026 04:14:58 +0000
Date: Wed, 11 Mar 2026 12:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 c2bcd89db970ee73cccfb9c619b7287d6da4bf88
Message-ID: <202603111200.pv4xvc5y-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_211504_736554_0153729B 
X-CRM114-Status: UNSURE (   3.56  )
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
branch HEAD: c2bcd89db970ee73cccfb9c619b7287d6da4bf88  Add localversion-wireless-testing-ath

elapsed time: 741m

configs tested: 154
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
alpha                     defconfig    gcc-15.2.0
arc                    allmodconfig    clang-16
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc                       defconfig    gcc-15.2.0
arc         randconfig-001-20260311    gcc-14.3.0
arc         randconfig-001-20260311    gcc-8.5.0
arc         randconfig-002-20260311    gcc-8.5.0
arc         randconfig-002-20260311    gcc-9.5.0
arm                     allnoconfig    clang-23
arm                     allnoconfig    gcc-15.2.0
arm                    allyesconfig    clang-16
arm                    allyesconfig    gcc-15.2.0
arm                       defconfig    gcc-15.2.0
arm         randconfig-001-20260311    clang-23
arm         randconfig-001-20260311    gcc-8.5.0
arm         randconfig-002-20260311    gcc-8.5.0
arm         randconfig-003-20260311    clang-16
arm         randconfig-003-20260311    gcc-8.5.0
arm         randconfig-004-20260311    gcc-8.5.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64                     defconfig    gcc-15.2.0
arm64       randconfig-001-20260311    gcc-12.5.0
arm64       randconfig-002-20260311    gcc-12.5.0
arm64       randconfig-003-20260311    gcc-12.5.0
arm64       randconfig-004-20260311    gcc-12.5.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky                      defconfig    gcc-15.2.0
csky        randconfig-001-20260311    gcc-12.5.0
csky        randconfig-002-20260311    gcc-12.5.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
hexagon                 allnoconfig    gcc-15.2.0
hexagon                   defconfig    gcc-15.2.0
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                    allnoconfig    gcc-15.2.0
i386                   allyesconfig    gcc-14
i386                      defconfig    gcc-15.2.0
i386        randconfig-001-20260311    gcc-14
i386        randconfig-002-20260311    gcc-14
i386        randconfig-003-20260311    gcc-14
i386        randconfig-004-20260311    gcc-14
i386        randconfig-005-20260311    gcc-14
i386        randconfig-006-20260311    gcc-14
i386        randconfig-007-20260311    gcc-14
i386        randconfig-011-20260311    gcc-14
i386        randconfig-012-20260311    gcc-14
i386        randconfig-013-20260311    gcc-14
i386        randconfig-014-20260311    gcc-14
i386        randconfig-015-20260311    gcc-14
i386        randconfig-016-20260311    gcc-14
i386        randconfig-017-20260311    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch               allnoconfig    gcc-15.2.0
loongarch                 defconfig    clang-19
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    clang-16
m68k                   allyesconfig    gcc-15.2.0
m68k                      defconfig    clang-19
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
microblaze                defconfig    clang-19
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    clang-23
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    clang-23
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    clang-19
openrisc               allmodconfig    clang-23
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    clang-23
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    clang-23
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260311    clang-23
parisc      randconfig-001-20260311    gcc-14.3.0
parisc      randconfig-002-20260311    clang-23
parisc      randconfig-002-20260311    gcc-11.5.0
parisc64                  defconfig    clang-19
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    clang-23
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260311    clang-23
powerpc     randconfig-001-20260311    gcc-10.5.0
powerpc     randconfig-002-20260311    clang-23
powerpc     randconfig-002-20260311    gcc-8.5.0
powerpc64   randconfig-001-20260311    clang-23
powerpc64   randconfig-002-20260311    clang-23
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    clang-23
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-14
sh              sh7785lcr_defconfig    gcc-15.2.0
sparc                   allnoconfig    clang-23
sparc                   allnoconfig    gcc-15.2.0
sparc       randconfig-001-20260311    gcc-8.5.0
sparc       randconfig-002-20260311    gcc-8.5.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    gcc-14
sparc64     randconfig-001-20260311    gcc-8.5.0
sparc64     randconfig-002-20260311    gcc-8.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                        defconfig    gcc-14
um                   i386_defconfig    gcc-14
um          randconfig-001-20260311    gcc-8.5.0
um          randconfig-002-20260311    gcc-8.5.0
um                 x86_64_defconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                  allnoconfig    clang-23
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64                        kexec    clang-20
x86_64      randconfig-011-20260311    gcc-13
x86_64      randconfig-012-20260311    gcc-13
x86_64      randconfig-013-20260311    gcc-13
x86_64      randconfig-014-20260311    gcc-13
x86_64      randconfig-015-20260311    gcc-13
x86_64      randconfig-016-20260311    gcc-13
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    clang-23
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    clang-23
xtensa                 allyesconfig    gcc-15.2.0
xtensa      randconfig-001-20260311    gcc-8.5.0
xtensa      randconfig-002-20260311    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

