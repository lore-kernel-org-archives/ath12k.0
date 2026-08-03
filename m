Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5367EC5516F
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 04:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xDlG3JGnzBgaRWT218pQEzRm2gnVi3B+OUs0dTPo7Ts=; b=vxDlaSfrjXlZKRCLnPwDXSoYFA
	DGckHIV4mim1fb+TMlQKx+ZQMLKsXEFD9XfeLmjb2vVjpgnPhRMAqHn5L+Vrysp2H7AelCENldZMH
	Z7uj3/dQD3ZHHJkp5jtm8yHFVF5yZXHtZk2rwHIT9mQcCoUWJ5xISMchfD5UEIDQEXeenWSdv/q9a
	t3ARs8rCvln6bzTLsMdFT2qhfBqi8bTRsiAgDxaM0RH3wqCQnxa8ek57G8VMrTyTG62XuDZMdw4NC
	4HfNSH2lXMnVlL+E9ipZzet1pZ68gjHtsvIeJ0Mn0Lx9k/uHvzGyt80ysFMxG32tb5sUKjq2SLDW9
	JT2sEyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqk6b-0000000GITq-3RSF;
	Mon, 03 Aug 2026 04:16:49 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqk6Y-0000000GISR-2OKb
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 04:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785730606; x=1817266606;
  h=date:from:to:cc:subject:message-id;
  bh=RH+YjGWb8PYtgUJgVSxPhpPp6la4LpwVbHec4HnKVhM=;
  b=d+WBXp3mlZjGbww+P6DtYS6xCsssHC1wZcZU0tPGHPDoP14aLWm5QkQ4
   4SeIg134eyl2vzei5KWILPM8sFoi47TImdckaCt5nFw4LwDIDSugNh6dk
   7fymXV0zGAvo6jgqRRgFCJn7czdMQgoPOsujc5FulISHgSEnpCcjRO0pt
   Jru8GAjFis/R7icfN7tUVAoT1JXbi+wu1nJtTM9604HFADlEg8jowi+xJ
   0bpP22vO8fsRsYIFTb7NTn9VPcBbRuLd8cH/GqvsBzy7Zw1IMcl41Fp8E
   Hlc+7ceCaVlj3Xq08W7GjwmPM7cRBozeqWRL7GSzQ3y0hteKO0LB4r4Bh
   w==;
X-CSE-ConnectionGUID: 5SMpFeqySiCIRa33J/dBeg==
X-CSE-MsgGUID: +PLUYxdMRr2vLCscqym4EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96919120"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="96919120"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 21:16:44 -0700
X-CSE-ConnectionGUID: udKbPGkLQv62LJLExrwqnw==
X-CSE-MsgGUID: 5gHxR7ZMTqWJikF1cLKqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="284487629"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Aug 2026 21:16:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqk6S-0000000062N-3UD0;
	Mon, 03 Aug 2026 04:16:40 +0000
Date: Mon, 03 Aug 2026 12:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 691e5e43b2aa5da35b044532845a3b230e540894
Message-ID: <202608031224.HQUjt3Eg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_211646_623323_87C51BD2 
X-CRM114-Status: UNSURE (   4.05  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: 691e5e43b2aa5da35b044532845a3b230e540894  Add localversion-wireless-testing-ath

elapsed time: 747m

configs tested: 144
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260802    gcc-8.5.0
arc                  randconfig-001-20260803    gcc-8.5.0
arc                  randconfig-002-20260802    gcc-15.2.0
arc                  randconfig-002-20260803    gcc-8.5.0
arm                  randconfig-001-20260802    gcc-11.5.0
arm                  randconfig-001-20260803    gcc-8.5.0
arm                  randconfig-002-20260802    gcc-13.4.0
arm                  randconfig-002-20260803    gcc-8.5.0
arm                  randconfig-003-20260802    clang-24
arm                  randconfig-003-20260803    gcc-8.5.0
arm                  randconfig-004-20260802    gcc-13.4.0
arm                  randconfig-004-20260803    gcc-8.5.0
arm64                randconfig-001-20260802    clang-18
arm64                randconfig-001-20260803    gcc-12.5.0
arm64                randconfig-002-20260802    gcc-15.2.0
arm64                randconfig-002-20260803    gcc-12.5.0
arm64                randconfig-003-20260802    gcc-13.4.0
arm64                randconfig-003-20260803    gcc-12.5.0
arm64                randconfig-004-20260802    gcc-8.5.0
arm64                randconfig-004-20260803    gcc-12.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260802    gcc-11.5.0
csky                 randconfig-001-20260803    gcc-12.5.0
csky                 randconfig-002-20260802    gcc-9.5.0
csky                 randconfig-002-20260803    gcc-12.5.0
hexagon              randconfig-001-20260803    clang-18
hexagon              randconfig-002-20260803    clang-18
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260802    gcc-14
i386       buildonly-randconfig-001-20260803    clang-22
i386       buildonly-randconfig-002-20260802    clang-22
i386       buildonly-randconfig-002-20260803    clang-22
i386       buildonly-randconfig-003-20260802    clang-22
i386       buildonly-randconfig-003-20260803    clang-22
i386       buildonly-randconfig-004-20260802    gcc-14
i386       buildonly-randconfig-004-20260803    clang-22
i386       buildonly-randconfig-005-20260802    gcc-14
i386       buildonly-randconfig-005-20260803    clang-22
i386       buildonly-randconfig-006-20260802    gcc-14
i386       buildonly-randconfig-006-20260803    clang-22
i386                 randconfig-001-20260802    gcc-14
i386                 randconfig-001-20260803    gcc-13
i386                 randconfig-002-20260802    clang-22
i386                 randconfig-002-20260803    gcc-13
i386                 randconfig-003-20260802    gcc-14
i386                 randconfig-003-20260803    gcc-13
i386                 randconfig-004-20260802    gcc-14
i386                 randconfig-004-20260803    gcc-13
i386                 randconfig-005-20260802    clang-22
i386                 randconfig-005-20260803    gcc-13
i386                 randconfig-006-20260802    gcc-14
i386                 randconfig-006-20260803    gcc-13
i386                 randconfig-007-20260802    gcc-14
i386                 randconfig-007-20260803    gcc-13
i386                 randconfig-011-20260803    clang-22
i386                 randconfig-012-20260803    clang-22
i386                 randconfig-013-20260803    clang-22
i386                 randconfig-014-20260803    clang-22
i386                 randconfig-015-20260803    clang-22
i386                 randconfig-016-20260803    clang-22
i386                 randconfig-017-20260803    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260803    clang-18
loongarch            randconfig-002-20260803    clang-18
mips                          ci20_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260803    clang-18
nios2                randconfig-002-20260803    clang-18
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260803    gcc-15.2.0
parisc               randconfig-002-20260803    gcc-15.2.0
powerpc              randconfig-001-20260803    gcc-15.2.0
powerpc              randconfig-002-20260803    gcc-15.2.0
powerpc64            randconfig-001-20260803    gcc-15.2.0
powerpc64            randconfig-002-20260803    gcc-15.2.0
riscv                randconfig-001-20260802    gcc-13.4.0
riscv                randconfig-001-20260803    gcc-8.5.0
riscv                randconfig-002-20260802    clang-24
riscv                randconfig-002-20260803    gcc-8.5.0
s390                 randconfig-001-20260802    clang-24
s390                 randconfig-001-20260803    gcc-8.5.0
s390                 randconfig-002-20260802    gcc-8.5.0
s390                 randconfig-002-20260803    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sh                         polaris_defconfig    gcc-16.1.0
sh                   randconfig-001-20260802    gcc-11.5.0
sh                   randconfig-001-20260803    gcc-8.5.0
sh                   randconfig-002-20260802    gcc-13.4.0
sh                   randconfig-002-20260803    gcc-8.5.0
sparc                randconfig-001-20260803    gcc-16.1.0
sparc                randconfig-002-20260803    gcc-16.1.0
sparc64              randconfig-001-20260803    gcc-16.1.0
sparc64              randconfig-002-20260803    gcc-16.1.0
um                   randconfig-001-20260803    gcc-16.1.0
um                   randconfig-002-20260803    gcc-16.1.0
x86_64     buildonly-randconfig-001-20260802    gcc-12
x86_64     buildonly-randconfig-001-20260803    clang-22
x86_64     buildonly-randconfig-002-20260802    gcc-14
x86_64     buildonly-randconfig-002-20260803    clang-22
x86_64     buildonly-randconfig-003-20260802    gcc-14
x86_64     buildonly-randconfig-003-20260803    clang-22
x86_64     buildonly-randconfig-004-20260802    gcc-14
x86_64     buildonly-randconfig-004-20260803    clang-22
x86_64     buildonly-randconfig-005-20260802    gcc-14
x86_64     buildonly-randconfig-005-20260803    clang-22
x86_64     buildonly-randconfig-006-20260802    gcc-14
x86_64     buildonly-randconfig-006-20260803    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260803    gcc-14
x86_64               randconfig-002-20260803    gcc-14
x86_64               randconfig-003-20260803    gcc-14
x86_64               randconfig-004-20260803    gcc-14
x86_64               randconfig-005-20260803    gcc-14
x86_64               randconfig-006-20260803    gcc-14
x86_64               randconfig-011-20260803    gcc-14
x86_64               randconfig-012-20260803    gcc-14
x86_64               randconfig-013-20260803    gcc-14
x86_64               randconfig-014-20260803    gcc-14
x86_64               randconfig-015-20260803    gcc-14
x86_64               randconfig-016-20260803    gcc-14
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260802    gcc-14
x86_64               randconfig-071-20260803    clang-22
x86_64               randconfig-072-20260802    clang-22
x86_64               randconfig-072-20260803    clang-22
x86_64               randconfig-073-20260802    gcc-14
x86_64               randconfig-073-20260803    clang-22
x86_64               randconfig-074-20260802    gcc-14
x86_64               randconfig-074-20260803    clang-22
x86_64               randconfig-075-20260802    clang-22
x86_64               randconfig-075-20260803    clang-22
x86_64               randconfig-076-20260802    gcc-12
x86_64               randconfig-076-20260803    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260803    gcc-16.1.0
xtensa               randconfig-002-20260803    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

