Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF518E64000
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sXezt54PDRxegubW8lLqI3Q4ve8n3khr+Qx+nr0cLP8=; b=Cy9PccSJl5GmRkrvF6zRb1DAHl
	HEk1agGR89npWTRJevxehZRaBfkihykgxM+T0EfDkCm3J4FcnzcsYOMgCVrx0ehu2nHhcJwcjCTW8
	tdW+JG1xdrWiRd1PiZuIzybmWhXNpEYkJw+0maR9GVlzhbrCY1j54MXqvsR28Zy7s5UqzWvTmFo/A
	M1PyzrQbFr1trTbBPXZN1+Ka2DBpdw5RgEwlvHmuHkLumUjIHvDU/UmAeI3/QJiEAh1ZtVbMZ2/oa
	qOGyu2pOvzdzgfpCzR0t119bERKfxaMPjWPHrgJPXasAnKhDG4b1tcUn67J+NrjRLp67J8fnDZkL1
	MoUomJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBt0-00000000eTD-33B4
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 18:26:38 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBsy-00000000eSo-0KzX
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 18:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732213596; x=1763749596;
  h=date:from:to:cc:subject:message-id;
  bh=+J1IQjyYmJ7tPVbQ2j/G83x+jPNyo9VDdvyq2pk3gTE=;
  b=m6MGN1aq2xeDRgDVM0QsDKyKTvfJ4fMm9Ocxjj631jpv6bQcJ2ShoTW0
   +FyRGcfnswSYS8fLgzb1jIc+DeK0Yo1Yye/Uq8fBX6dR9+JqTtQIhg+/X
   aERrLFJvYwcrx4LgpnJ4Z3X/gB3sVQ5Mp/wLKA9cE4H8tZ3BTxbtZOqB+
   7aX0UN2iLU56tAcv3QDrXnSewY4P/BefbK0duoqiXQfuXBxJClzFf5LxD
   d22cm44yBTE9IF10MAgqyyUfPlU1E+CW/rd8WLUquZRS4voZPlYmXdIkZ
   80xIW+W7nKmKjm7DdX7oAqUomCWCLLpZmwC3BhSgn+sKWxNxkLE6L/n9K
   w==;
X-CSE-ConnectionGUID: SNALkoaqQRyymIjrkoRpRA==
X-CSE-MsgGUID: fDw8XB4cT6mTnkQdbsC6NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54853914"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="54853914"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 10:26:34 -0800
X-CSE-ConnectionGUID: DfSMZW2zScaP+N1GWXk/4g==
X-CSE-MsgGUID: Xnq6JUBGTia5RfZgNmA16A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="113612337"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2024 10:26:33 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEBst-0003FT-1P;
	Thu, 21 Nov 2024 18:26:31 +0000
Date: Fri, 22 Nov 2024 02:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 60146c59c97ff2cba87a336c997b060fafc5eb24
Message-ID: <202411220220.vs8hDVuL-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_102636_210945_C9688033 
X-CRM114-Status: UNSURE (   3.94  )
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
branch HEAD: 60146c59c97ff2cba87a336c997b060fafc5eb24  Merge branch 'pending' into main-pending

elapsed time: 1335m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-13.2.0
arc                     allnoconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241121    gcc-13.2.0
arc         randconfig-002-20241121    gcc-13.2.0
arm                    allmodconfig    gcc-14.2.0
arm                     allnoconfig    clang-20
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20241121    clang-20
arm         randconfig-002-20241121    gcc-14.2.0
arm         randconfig-003-20241121    clang-20
arm         randconfig-004-20241121    gcc-14.2.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.2.0
arm64       randconfig-001-20241121    clang-20
arm64       randconfig-002-20241121    clang-20
arm64       randconfig-003-20241121    gcc-14.2.0
arm64       randconfig-004-20241121    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky        randconfig-001-20241121    gcc-14.2.0
csky        randconfig-002-20241121    gcc-14.2.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20241121    clang-20
hexagon     randconfig-002-20241121    clang-15
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-19
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch   randconfig-001-20241121    gcc-14.2.0
loongarch   randconfig-002-20241121    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
nios2       randconfig-001-20241121    gcc-14.2.0
nios2       randconfig-002-20241121    gcc-14.2.0
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
openrisc                  defconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc                    defconfig    gcc-14.2.0
parisc      randconfig-001-20241121    gcc-14.2.0
parisc      randconfig-002-20241121    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    clang-20
powerpc     randconfig-001-20241121    clang-15
powerpc     randconfig-002-20241121    gcc-14.2.0
powerpc     randconfig-003-20241121    clang-20
powerpc64   randconfig-001-20241121    gcc-14.2.0
powerpc64   randconfig-002-20241121    clang-20
powerpc64   randconfig-003-20241121    clang-20
riscv                  allmodconfig    clang-20
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    clang-20
riscv                     defconfig    clang-20
riscv       randconfig-001-20241121    gcc-14.2.0
riscv       randconfig-002-20241121    gcc-14.2.0
s390                   allmodconfig    clang-20
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.2.0
s390                      defconfig    clang-20
s390        randconfig-001-20241121    gcc-14.2.0
s390        randconfig-002-20241121    clang-20
sh                     allmodconfig    gcc-14.2.0
sh                      allnoconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh                        defconfig    gcc-14.2.0
sh          randconfig-001-20241121    gcc-14.2.0
sh          randconfig-002-20241121    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
sparc64                   defconfig    gcc-14.2.0
sparc64     randconfig-001-20241121    gcc-14.2.0
sparc64     randconfig-002-20241121    gcc-14.2.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
um                        defconfig    clang-20
um                   i386_defconfig    gcc-12
um          randconfig-001-20241121    gcc-12
um          randconfig-002-20241121    gcc-12
um                 x86_64_defconfig    clang-15
x86_64                  allnoconfig    clang-19
x86_64                 allyesconfig    clang-19
x86_64                    defconfig    gcc-11
x86_64                        kexec    clang-19
x86_64                     rhel-9.4    gcc-12
xtensa                  allnoconfig    gcc-14.2.0
xtensa      randconfig-001-20241121    gcc-14.2.0
xtensa      randconfig-002-20241121    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

