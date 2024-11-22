Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E892DE65D2C
	for <ath12k@archiver.kernel.org>; Fri, 22 Nov 2024 06:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2WPOq0sQ0wh8hfoZEtK9H/swHt0mD0H9aoweXIROjVo=; b=iCXSar1bMqekpQMJxBnp46PWXD
	N4hNEwjixWdQ+VDQMN5qfc84GfI95DxIODOls39tmBnm3F3MFrlLnIqWh7qSDMEa2QFqgk72DbS0Q
	Y+TvStIupcSDrdpiDeR3tei6qOv69bLHp/kCgBpn0uNvkuKAgbq9rH7X/9hvg4yE0CgKioLDSXtvz
	XMVvKNcLRoZYJkM5lGC7R+1E4CEoSa/pBGWrHZA6JsO1CRLQSXCHliGXkTpOJAFGnilojkd4jDYnZ
	kA6++2s6wZ9uZuTVeGcrcASgGQEAmqUCg/6CW1r0nHtD9MLKRFMoahWsWu6aJiowsAmnz+LIxhw2z
	BfyjcgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEN85-00000001jf0-2zm7
	for ath12k@archiver.kernel.org;
	Fri, 22 Nov 2024 06:26:57 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEN83-00000001jed-11vi
	for ath12k@lists.infradead.org;
	Fri, 22 Nov 2024 06:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732256815; x=1763792815;
  h=date:from:to:cc:subject:message-id;
  bh=j4RmtrMW2HYQ3E7mPkVQXnPN6Z80ADjWhChdG0JQxq0=;
  b=X2sD2LkzcrXHh5cU67kaiNeZ/GwyPYPU9TpEcVEKA1lk07bmPLdPHI6y
   cs3WRyjLJ9LNKh4rFOGvaesYZWtp2ev8MfKWrWO05m3YPuUAj+98eAByx
   B+r8MeIKqQAMTnpnUOz7BvNKmgkDriNGWXjgFhRv7LiChCK5vNrQ/7i7O
   UQvI835+JfKHCMQF9xEI0bsCXewsiqahI9ulJyY0R5gIVq5sJu+62R8oF
   H6/CShyaQ0a6ts1xYGuxAKbwlgHifIcOO/u8jIsUQU6dWW/z+nA6vjHVn
   dUhBpRGJTcj0FBeOL1LzALyD42sqVjJ1Si8JrxLw3rpXHhr++WTe0y0ig
   A==;
X-CSE-ConnectionGUID: GS78smFbT6u2JEynekUkaA==
X-CSE-MsgGUID: QQYobKIBTc+neAJsJ2eQ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54907557"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="54907557"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 22:26:54 -0800
X-CSE-ConnectionGUID: nB+KNscaRY6dOqbhzABVQw==
X-CSE-MsgGUID: 9XcLa7rORkaaZ1V4R0mw2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="94569023"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2024 22:26:53 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEN7y-0003jT-38;
	Fri, 22 Nov 2024 06:26:50 +0000
Date: Fri, 22 Nov 2024 14:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 96c092f0dfaf2f41ad0a253fa32f689484d158c9
Message-ID: <202411221458.D9UGa2eB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_222655_365107_A4DF1B29 
X-CRM114-Status: UNSURE (   3.82  )
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
branch HEAD: 96c092f0dfaf2f41ad0a253fa32f689484d158c9  Add localversion-wireless-testing-ath

elapsed time: 740m

configs tested: 89
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241122    gcc-13.2.0
arc         randconfig-002-20241122    gcc-13.2.0
arm                    allmodconfig    gcc-14.2.0
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20241122    clang-17
arm         randconfig-002-20241122    gcc-14.2.0
arm         randconfig-003-20241122    clang-20
arm         randconfig-004-20241122    gcc-14.2.0
arm64                  allmodconfig    clang-20
arm64       randconfig-001-20241122    gcc-14.2.0
arm64       randconfig-002-20241122    gcc-14.2.0
arm64       randconfig-003-20241122    gcc-14.2.0
arm64       randconfig-004-20241122    gcc-14.2.0
csky        randconfig-001-20241122    gcc-14.2.0
csky        randconfig-002-20241122    gcc-14.2.0
hexagon                allmodconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20241122    clang-20
hexagon     randconfig-002-20241122    clang-20
i386                   allmodconfig    clang-19
i386                    allnoconfig    clang-19
i386                   allyesconfig    clang-19
i386                      defconfig    clang-19
loongarch              allmodconfig    gcc-14.2.0
loongarch   randconfig-001-20241122    gcc-14.2.0
loongarch   randconfig-002-20241122    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
nios2       randconfig-001-20241122    gcc-14.2.0
nios2       randconfig-002-20241122    gcc-14.2.0
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
openrisc                  defconfig    gcc-12
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc                    defconfig    gcc-12
parisc      randconfig-001-20241122    gcc-14.2.0
parisc      randconfig-002-20241122    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    clang-20
powerpc     randconfig-001-20241122    gcc-14.2.0
powerpc     randconfig-002-20241122    clang-20
powerpc     randconfig-003-20241122    clang-20
powerpc64   randconfig-001-20241122    gcc-14.2.0
powerpc64   randconfig-002-20241122    gcc-14.2.0
powerpc64   randconfig-003-20241122    gcc-14.2.0
riscv                  allmodconfig    clang-20
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    clang-20
riscv                     defconfig    gcc-12
riscv       randconfig-001-20241122    gcc-14.2.0
riscv       randconfig-002-20241122    gcc-14.2.0
s390                   allmodconfig    clang-20
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.2.0
s390                      defconfig    gcc-12
s390        randconfig-001-20241122    clang-20
s390        randconfig-002-20241122    clang-20
sh                     allmodconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh                        defconfig    gcc-12
sh          randconfig-001-20241122    gcc-14.2.0
sh          randconfig-002-20241122    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
sparc64                   defconfig    gcc-12
sparc64     randconfig-001-20241122    gcc-14.2.0
sparc64     randconfig-002-20241122    gcc-14.2.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
um                        defconfig    gcc-12
um                   i386_defconfig    gcc-12
um          randconfig-001-20241122    clang-17
um          randconfig-002-20241122    gcc-11
um                 x86_64_defconfig    gcc-12
x86_64                  allnoconfig    clang-19
x86_64                 allyesconfig    clang-19
x86_64                    defconfig    clang-19
x86_64                        kexec    clang-19
x86_64                     rhel-9.4    gcc-12
xtensa      randconfig-001-20241122    gcc-14.2.0
xtensa      randconfig-002-20241122    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

