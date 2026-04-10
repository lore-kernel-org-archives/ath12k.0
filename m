Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63A9F45A0F
	for <ath12k@archiver.kernel.org>; Fri, 10 Apr 2026 20:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=irXesl/a39BkJshyIn1KXtciiGiEpoFVe3dPaiEg7H4=; b=HX0sNbhH7nYATYn7AZp5MW1YBl
	yyWiPTMRM77wI1+yJFzgl0fuYneWrCI5xa8zzF7C6fTj8+VsdFZggV3/gQVl2LgldAZdfTGgsmB+N
	m9e8OLIzavOvSYtXqthusYsYzMJpLAed0pthZDdNEns53g0Id+huFD3PbXXTlPLUmmCdtf5NZ2LPE
	t7gzXZM2Zsla82Ult5MTa7kjU4/RJImamBxAXJaIa3E4buW+atUDUfse8DQ/dFeGN+myEkqGhoVK2
	lVML9P825ZBZaLeiPE0nZQzsl0HL0exzm+81Og2WVPPNotokSXsCKqazhgS1z/ZJuz8rZAOXPv9ZV
	v9Czld+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBIi7-0000000CmQY-0CtV;
	Fri, 10 Apr 2026 20:44:15 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBIi3-0000000CmQE-45Zu
	for ath12k@lists.infradead.org;
	Fri, 10 Apr 2026 20:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775853852; x=1807389852;
  h=date:from:to:cc:subject:message-id;
  bh=Rcoy4A/0BcDc6D521sTV6zoiMXjr7c+US9iol7eBLVo=;
  b=eLMzp6lGJbaT6FcQodmOOlDMBSoayQEwVwc0zkcUioQWJFNgbBKNCtT0
   MO09J3XibCU2gorGgU/S+sRgyb9jkMU3l8/YTdAgvU7Ov9HFKkm+i/Ohq
   MhxjhUX1YVQggpYP++1TweDv1+snSARp2fq5B8y5Ziqsifcx1ipf3eXW7
   jE2YukWLbH4ANWQ8Tr+TrN0+GUlIwIkxmgr+Y6iLFveuUphsPTztTc1Lz
   5+Z4pXM0TicRCcOAIP9rLgkpioQ0uE32R8NJtRMeyj850dOzUugP9ppJW
   xgiUe4qd+F2rMWVJFsGCltTqnIae/g8Cyu+Dh91Qx+Wi9LyDjX2KZazLY
   w==;
X-CSE-ConnectionGUID: WvwW+yvTQE2yPBh2GPotmg==
X-CSE-MsgGUID: y6cJ5WVtQB+stw9MtVtTTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80770198"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="80770198"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 13:44:11 -0700
X-CSE-ConnectionGUID: Rd0rMD0yRfetrcMf8rIDCg==
X-CSE-MsgGUID: VfP0h9lgR6GsqN2xdOoOBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="224868633"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2026 13:44:09 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBIhy-000000000BJ-49mg;
	Fri, 10 Apr 2026 20:44:06 +0000
Date: Sat, 11 Apr 2026 04:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 929298742bb5dfacd53ea99cf989cc81210f90a3
Message-ID: <202604110415.xTTq8xIS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_134412_066567_5ECFEFBC 
X-CRM114-Status: UNSURE (   3.31  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: 929298742bb5dfacd53ea99cf989cc81210f90a3  Merge tag 'ath-next-20260408' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

elapsed time: 886m

configs tested: 175
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260410    gcc-8.5.0
arc                   randconfig-002-20260410    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260410    gcc-8.5.0
arm                   randconfig-002-20260410    gcc-8.5.0
arm                   randconfig-003-20260410    gcc-8.5.0
arm                   randconfig-004-20260410    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260410    gcc-10.5.0
arm64                 randconfig-002-20260410    gcc-10.5.0
arm64                 randconfig-003-20260410    gcc-10.5.0
arm64                 randconfig-004-20260410    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260410    gcc-10.5.0
csky                  randconfig-002-20260410    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260410    gcc-15.2.0
hexagon               randconfig-002-20260410    gcc-15.2.0
i386                              allnoconfig    gcc-15.2.0
i386        buildonly-randconfig-001-20260410    clang-20
i386        buildonly-randconfig-002-20260410    clang-20
i386        buildonly-randconfig-003-20260410    clang-20
i386        buildonly-randconfig-004-20260410    clang-20
i386        buildonly-randconfig-005-20260410    clang-20
i386        buildonly-randconfig-006-20260410    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260410    gcc-14
i386                  randconfig-002-20260410    gcc-14
i386                  randconfig-003-20260410    gcc-14
i386                  randconfig-004-20260410    gcc-14
i386                  randconfig-005-20260410    gcc-14
i386                  randconfig-006-20260410    gcc-14
i386                  randconfig-007-20260410    gcc-14
i386                  randconfig-011-20260410    clang-20
i386                  randconfig-012-20260410    clang-20
i386                  randconfig-013-20260410    clang-20
i386                  randconfig-014-20260410    clang-20
i386                  randconfig-015-20260410    clang-20
i386                  randconfig-016-20260410    clang-20
i386                  randconfig-017-20260410    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260410    gcc-15.2.0
loongarch             randconfig-002-20260410    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260410    gcc-15.2.0
nios2                 randconfig-002-20260410    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                 simple_smp_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260410    gcc-14.3.0
parisc                randconfig-002-20260410    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260410    gcc-14.3.0
powerpc               randconfig-002-20260410    gcc-14.3.0
powerpc64             randconfig-001-20260410    gcc-14.3.0
powerpc64             randconfig-002-20260410    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260410    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260410    gcc-8.5.0
s390                  randconfig-002-20260410    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260410    gcc-8.5.0
sh                    randconfig-002-20260410    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260410    clang-23
sparc                 randconfig-002-20260410    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260410    clang-23
sparc64               randconfig-002-20260410    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260410    clang-23
um                    randconfig-002-20260410    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64      buildonly-randconfig-001-20260410    clang-20
x86_64      buildonly-randconfig-002-20260410    clang-20
x86_64      buildonly-randconfig-003-20260410    clang-20
x86_64      buildonly-randconfig-004-20260410    clang-20
x86_64      buildonly-randconfig-005-20260410    clang-20
x86_64      buildonly-randconfig-006-20260410    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260410    clang-20
x86_64                randconfig-002-20260410    clang-20
x86_64                randconfig-003-20260410    clang-20
x86_64                randconfig-004-20260410    clang-20
x86_64                randconfig-005-20260410    clang-20
x86_64                randconfig-006-20260410    clang-20
x86_64                randconfig-011-20260410    gcc-14
x86_64                randconfig-012-20260410    gcc-14
x86_64                randconfig-013-20260410    gcc-14
x86_64                randconfig-014-20260410    gcc-14
x86_64                randconfig-015-20260410    gcc-14
x86_64                randconfig-016-20260410    gcc-14
x86_64                randconfig-071-20260410    clang-20
x86_64                randconfig-072-20260410    clang-20
x86_64                randconfig-073-20260410    clang-20
x86_64                randconfig-074-20260410    clang-20
x86_64                randconfig-075-20260410    clang-20
x86_64                randconfig-076-20260410    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260410    clang-23
xtensa                randconfig-002-20260410    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

