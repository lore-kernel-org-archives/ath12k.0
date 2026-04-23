Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14C8F99360
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ids8LHN6cuJSYS+cm4DqZJQvGGebjim8/hLUMMEFLs=; b=3diDOTngA1Ve5FpArIdV6XGMYr
	wIAia8QemAb7yvqljP3clGEBJG95NdjSJjnUVualsXDqbqBwK/Z4XHgVDydEUSqyVcJ8ZYfkeGtvG
	oRSEq1VVMPmgYqUIIKNrs3nA2iRoDPvjYWeUORF8gcFGqBLfM5BKzJA7OHuYn/mC4HHeCDzApm0v7
	nC/p7LEMTf0r+KAPEgwPqwdQd8kbcSCiUSYDbmqxctl56H7p5BLVVDsKcHxOAifw5LKKWn/OsBu0e
	KZTeYMyssekwO7QVQW+CzOjN/v7DJtpu5oEebOx5bxDnnOKIK/h0uwW7zcJvEB8QF2mhG6XC1umoC
	l+KE7AWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqX2-0000000BPNI-2oDW;
	Thu, 23 Apr 2026 09:39:36 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqWz-0000000BPMw-47mk
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 09:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776937174; x=1808473174;
  h=date:from:to:cc:subject:message-id;
  bh=wyn51Od7Cp2bZwpz8YImsZUCWgLa/W8FTiXStSu8gHo=;
  b=ZbsVjmh0+EMtujQfkPBLcPxLFZEuMHYkmckk3heEsUAsJs6txmhKJutA
   0Qr6+v06uC+pYYXJIAUAnF9u0bH2oUiVH3InAvJdG1QSYbLmnkRlEH6+Y
   p0s+dYZRCd/3NRvY10kadmuC1adfCKiaJjFqyX99OWRcbEVpjdscNNX17
   KxtrpzH8xoEBq1kHB7ryaESbmUgWpwRpET6n1HPw1klVnD7gneVvVTl8S
   b4QuVyVDre5A+gDl8RfBqjpGwWVcuf7Pg6DdDXJZvZ2QpSje0/ftNTZmz
   mygw2nH2dYUJXxa1AyoRjY7nek4h/yll+vRdPUMInabcyJB1/f6D40KTr
   A==;
X-CSE-ConnectionGUID: Z4PvqDf7Q2el3BD7NiaIEA==
X-CSE-MsgGUID: 1/s6Q2vmRzGQlXKIVloMcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="103363704"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="103363704"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 02:39:33 -0700
X-CSE-ConnectionGUID: jjujijJAT4qgPfULaksoKQ==
X-CSE-MsgGUID: OH6ReOymSDSG2MkMpyRE/A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2026 02:39:32 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFqWv-000000002RV-3YDH;
	Thu, 23 Apr 2026 09:39:29 +0000
Date: Thu, 23 Apr 2026 17:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 2aaafb18bcd12a5756a5902f8f27497527908421
Message-ID: <202604231723.Z1a04ScP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_023934_032978_D7D15EC3 
X-CRM114-Status: UNSURE (   2.52  )
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
branch HEAD: 2aaafb18bcd12a5756a5902f8f27497527908421  wifi: ath10k: snoc: select POWER_SEQUENCING

elapsed time: 1088m

configs tested: 93
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc         randconfig-001-20260423    gcc-15.2.0
arc         randconfig-002-20260423    gcc-8.5.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm         randconfig-001-20260423    gcc-10.5.0
arm         randconfig-002-20260423    clang-23
arm         randconfig-003-20260423    clang-23
arm         randconfig-004-20260423    clang-23
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-001-20260423    gcc-11.5.0
arm64       randconfig-002-20260423    clang-23
arm64       randconfig-003-20260423    gcc-14.3.0
arm64       randconfig-004-20260423    clang-16
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260423    gcc-10.5.0
csky        randconfig-002-20260423    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
hexagon     randconfig-001-20260423    clang-16
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
m68k              mvme147_defconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260423    gcc-9.5.0
parisc      randconfig-002-20260423    gcc-13.4.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260423    clang-23
powerpc     randconfig-002-20260423    clang-23
powerpc64   randconfig-001-20260423    clang-23
powerpc64   randconfig-002-20260423    gcc-10.5.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20260423    clang-17
riscv       randconfig-002-20260423    gcc-12.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390        randconfig-001-20260423    clang-23
s390        randconfig-002-20260423    gcc-10.5.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-15.2.0
sh          randconfig-001-20260423    gcc-15.2.0
sh          randconfig-002-20260423    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc       randconfig-001-20260423    gcc-11.5.0
sparc       randconfig-002-20260423    gcc-8.5.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20260423    clang-23
sparc64     randconfig-002-20260423    gcc-10.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                        defconfig    clang-23
um                   i386_defconfig    gcc-14
um          randconfig-001-20260423    clang-18
um          randconfig-002-20260423    gcc-14
um                 x86_64_defconfig    clang-23
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa      randconfig-001-20260423    gcc-8.5.0
xtensa      randconfig-002-20260423    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

