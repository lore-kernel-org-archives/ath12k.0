Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03729CF649C
	for <ath12k@archiver.kernel.org>; Thu, 20 Nov 2025 01:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JmVkY+Hv9hF7IxY+0oem5MFp1eUc2MeeXes+Su4ZlRM=; b=AsxgQAcPI7bwu8OAamsgEiI+uF
	JVngzfnEl7+xWC5WsK/u3mE7VhAuZFwCSwtcglxMFwCe/TBV7bTCCLZKcDZTCsv8uXO2Ts5fMSNBA
	a6ImXlw2Mv0oPTPNgPP0fA0MWbif/1Cplayvh1pcELm/lQWLvawXyvQwEZxma8m04jSIq0wolM2QV
	sP+p/eABZ/iDRbRLQYcvBdkfw6dXrdc19I9MfHnwiSE60isSvfrJMaHqel7fGqY2C6hVRU+lRRqot
	fkVOPJ55jwzOdWo1zbsngn0YtVqC5Z4Mx1zIc2qzIaanNZWQvE5zOIv+IOJ9CWGlgbnAv7dRc2yTt
	O6helxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLtmO-00000005wbf-36cE;
	Thu, 20 Nov 2025 01:48:12 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLtmL-00000005wbH-1VsM
	for ath12k@lists.infradead.org;
	Thu, 20 Nov 2025 01:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763603289; x=1795139289;
  h=date:from:to:cc:subject:message-id;
  bh=li155uok0jIbc3BO01gBZs3vzZ7mmwaDxm5orlpBV3A=;
  b=G7tzi7vHJUdRchJBoKG2MZn8eEEywcJQA3aETR6Sn4nf1Jb48cGXfIdI
   YLahW9dqMqC7bQKQaluWPsvsF2KXysONhkaStOVOl1hN7NQhf7U+CBQQ5
   57nJL6cdywef1Jz43vjF4S4NPFyXWJ8QhAqhoM48TFqbix8kt1lEmgW7p
   lUrBHMFRAekV69EgG8u2t+U4yEzJsSZQPsoi9yecuQ6PGGTkSWuL5TteA
   QH01OeHd/UPsp5pz0iMGWjnIHN0HA6O71yUOvot7CoHcm1ZqlLusnNr44
   fxPc2jWENOLStzRnGWbA0kRrpjkBFiLTeg4EftagLOhR0nWqd71roOznw
   Q==;
X-CSE-ConnectionGUID: VREhEqY5Rl2TJti9oXMhKA==
X-CSE-MsgGUID: t1KlAV/RQTKh1P1yrPqRDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65364093"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="65364093"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 17:48:05 -0800
X-CSE-ConnectionGUID: TSWXldPkTo++N9JjFiOdvg==
X-CSE-MsgGUID: caFBW1ImQy+tGbYH3X3sRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="196353042"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2025 17:48:04 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLtmD-0003VL-35;
	Thu, 20 Nov 2025 01:48:01 +0000
Date: Thu, 20 Nov 2025 09:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 be83ff7549057d184b693a85cafc10fbd520f3d7
Message-ID: <202511200953.ILVB7vLs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_174809_492926_D440A1C0 
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
branch HEAD: be83ff7549057d184b693a85cafc10fbd520f3d7  Add localversion-wireless-testing-ath

elapsed time: 7280m

configs tested: 73
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251115    gcc-13.4.0
arc         randconfig-002-20251115    gcc-11.5.0
arm                     allnoconfig    clang-22
arm                    allyesconfig    gcc-15.1.0
arm         randconfig-001-20251115    clang-22
arm         randconfig-002-20251115    gcc-8.5.0
arm         randconfig-003-20251115    gcc-10.5.0
arm         randconfig-004-20251115    clang-22
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
arm64       randconfig-001-20251116    gcc-12.5.0
arm64       randconfig-002-20251116    gcc-10.5.0
arm64       randconfig-003-20251116    clang-22
arm64       randconfig-004-20251116    gcc-8.5.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky        randconfig-001-20251116    gcc-12.5.0
csky        randconfig-002-20251116    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251116    gcc-12.5.0
parisc      randconfig-002-20251116    gcc-14.3.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251116    gcc-10.5.0
powerpc     randconfig-002-20251116    clang-22
powerpc64   randconfig-001-20251116    clang-22
powerpc64   randconfig-002-20251116    gcc-10.5.0
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20251116    clang-20
riscv       randconfig-002-20251116    gcc-10.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251116    clang-22
s390        randconfig-002-20251116    gcc-15.1.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh          randconfig-001-20251116    gcc-13.4.0
sh          randconfig-002-20251116    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

