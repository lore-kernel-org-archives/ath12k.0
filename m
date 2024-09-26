Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270C8CCF9E9
	for <ath12k@archiver.kernel.org>; Thu, 26 Sep 2024 07:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A8bsI6wAqvnTzEOWjvItI7YfdhyAo59fdReExs5Njqg=; b=JphBItklQZtV1tOONqTRRHmaPo
	AmTaGcSFqv+whRsnta+olFFlcL3qRZvkN+aRGpqyiUhKVL9kynT7pMBYCLgtmKTCENZ5Ug4P1I8W4
	Ukuzr5nvpat9pX5cV3sLiIRtXks1Vl07dvcT9cSy6u7BAAh3pHy8gHBA4lbffShhwpcp0eijobJ4C
	JjtYbL74B1LSNlNDhpla1QDIFObYr0mw14XHiya/Nqj9EutU1i72QKtFa8HXbuO4YnNRCYKEBZvFI
	zQsGT9YnL0IxPgBbqsvQlWBY1tAikxYFCyc7YJTJqkDlae15qKt8dLfPL4BJMejTlpbHml7Us7Lhs
	Kas0eYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stiqc-00000007Uhu-2wUx
	for ath12k@archiver.kernel.org;
	Thu, 26 Sep 2024 07:23:34 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stinD-00000007UA4-3GZv
	for ath12k@lists.infradead.org;
	Thu, 26 Sep 2024 07:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727335204; x=1758871204;
  h=date:from:to:cc:subject:message-id;
  bh=c+Xwygxi1RaaTKsziAXPACjW/Glhj/jSpbdOG6MWprE=;
  b=OUQMNqX0mbAS1ixYI81/NixwKJz9Olu5QJFc0QQupcD50ElukQdhnxo3
   SrFcEVZ/oSKars0mPMQTYgkpMizjFgdQGB0owFJ6rK1/HTWVJErOZP9xP
   nRNjU004kkVErazB+72sCb4SiZv1b1gAjk/Ku/vjgfIPUg+Li91r3Fq0C
   fDNGEyh2u/DODDOTYwbWrTZqGg4iXsZOrR26SQIbeEFjE9OJc0clWH0RK
   kAde80lDeY5FRPr5r9hqWkhUSa4bkKhO6wSJCE7V0Wa81tIFzfrirTodC
   /prUoq+7hKP4GOcCeqV2+DA8XffG3/n8fFMF4HuzWYX2er3bKU9bgpGe4
   Q==;
X-CSE-ConnectionGUID: vNzeyI7iQZaa6NXWTNtEfg==
X-CSE-MsgGUID: XrhB3raWQ72GRM0o36aqfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37557796"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="37557796"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 00:20:03 -0700
X-CSE-ConnectionGUID: B3I/be65TX6Gld/Vf6z7NA==
X-CSE-MsgGUID: M9tBGUWaSeuM55/y95F0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="76962296"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Sep 2024 00:20:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stin9-000KOH-0P;
	Thu, 26 Sep 2024 07:19:59 +0000
Date: Thu, 26 Sep 2024 15:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 e643530a76baa26ad70b9f8b66f77edfef92bfdf
Message-ID: <202409261534.Pr2C6wqZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_002003_913582_FD73F4D0 
X-CRM114-Status: UNSURE (   4.08  )
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
branch HEAD: e643530a76baa26ad70b9f8b66f77edfef92bfdf  Merge branch 'pending' into main-pending

elapsed time: 1206m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20240926    gcc-13.2.0
arc                   randconfig-002-20240926    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                   randconfig-001-20240926    gcc-14.1.0
arm                   randconfig-002-20240926    gcc-14.1.0
arm                   randconfig-003-20240926    gcc-14.1.0
arm                   randconfig-004-20240926    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240926    gcc-14.1.0
arm64                 randconfig-002-20240926    gcc-14.1.0
arm64                 randconfig-003-20240926    clang-20
arm64                 randconfig-004-20240926    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240926    gcc-14.1.0
csky                  randconfig-002-20240926    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240926    clang-15
hexagon               randconfig-002-20240926    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240926    gcc-12
i386        buildonly-randconfig-002-20240926    clang-18
i386        buildonly-randconfig-003-20240926    gcc-11
i386        buildonly-randconfig-004-20240926    gcc-12
i386        buildonly-randconfig-005-20240926    gcc-12
i386        buildonly-randconfig-006-20240926    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240926    gcc-12
i386                  randconfig-002-20240926    clang-18
i386                  randconfig-003-20240926    gcc-12
i386                  randconfig-004-20240926    gcc-12
i386                  randconfig-005-20240926    gcc-12
i386                  randconfig-006-20240926    clang-18
i386                  randconfig-011-20240926    clang-18
i386                  randconfig-012-20240926    clang-18
i386                  randconfig-013-20240926    clang-18
i386                  randconfig-014-20240926    clang-18
i386                  randconfig-015-20240926    clang-18
i386                  randconfig-016-20240926    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240926    gcc-14.1.0
loongarch             randconfig-002-20240926    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         amcore_defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip32_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240926    gcc-14.1.0
nios2                 randconfig-002-20240926    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20240926    gcc-14.1.0
parisc                randconfig-002-20240926    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20240926    gcc-14.1.0
powerpc               randconfig-002-20240926    gcc-14.1.0
powerpc               randconfig-003-20240926    clang-20
powerpc64             randconfig-001-20240926    gcc-14.1.0
powerpc64             randconfig-002-20240926    gcc-14.1.0
powerpc64             randconfig-003-20240926    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20240926    clang-20
riscv                 randconfig-002-20240926    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                  randconfig-001-20240926    clang-20
s390                  randconfig-002-20240926    clang-15
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                    randconfig-001-20240926    gcc-14.1.0
sh                    randconfig-002-20240926    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
sparc64               randconfig-001-20240926    gcc-14.1.0
sparc64               randconfig-002-20240926    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240926    gcc-12
um                    randconfig-002-20240926    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240926    gcc-14.1.0
xtensa                randconfig-002-20240926    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

