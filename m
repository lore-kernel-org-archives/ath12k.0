Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CCAE99058
	for <ath12k@archiver.kernel.org>; Sat, 11 Apr 2026 06:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=umxfllf6urOT1Q5d0tBTr4PHdzF9/7vRV963HSaKnRA=; b=yHvjS73sFmNOby+4ZwsXHFPrJ5
	h1dhBA2V3ztJXkvmYlFXwLDFshwS/UR7WAXcDipvAxFzoFPRLxbGV2YOlmsWWFnQYQZKoUYzeDh3P
	yPf2rMXCDIQbREoVqfvvEpbPtMuQnS0PrCYlrDj+qc9c2HPXX80/urr0KeuzMexNDDsZ/TdpZw/tH
	TtfmyBaQgcwmAf5KQOvEARrc/hAtRlbOqFmbOKbfcReMQUZeU3dec7iUosMJV+VsgIu3jR33IRf+r
	2HDidB8wQ2urY8DzPi48YmQZ4/Rt4DRWVys0p/qlRZ7q86iuUa7WNGeXsfzT7puypFbTbGEXIXIgk
	0hRn985A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBROC-0000000DBEl-26Y7;
	Sat, 11 Apr 2026 06:00:16 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBROA-0000000DBEM-2Z7D
	for ath12k@lists.infradead.org;
	Sat, 11 Apr 2026 06:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775887215; x=1807423215;
  h=date:from:to:cc:subject:message-id;
  bh=Y82PYf4Gpd7qpzOIFtHGdFP+kf2rbcJYcZiprdSoSJs=;
  b=QnKaah4yLK96pUaTv31V+3h/bkTgOBZWeyFnBFKdno8cEoUOme/uHBhR
   nSqUMohm5MX+XKMRaadh65hyk5FajFbW/Vuy+DS4goZrnrTsE0Rf+zfot
   SIQm0OT/6CEYkQQ5ox7Pu2xkO1eItzuBrWGMHqsguLPUPO/Jrv1XqlKmu
   uj4fSiXH/gqqT8iagO67z9ZcZw/bzZa8cI5nGFTIXohK5njr8lGcqpTn/
   mdoUMkGS5gfVCxP6wC199F2E0yyRsL2Tq0LkV+004UDMBi8RSMEINcPOj
   X8mVJJjdEH1wr/aAOGSjI3shZFyo34pzYaz/rbDl4QiEBXdaShwHGLM1/
   Q==;
X-CSE-ConnectionGUID: MlwN3OaRTtCDjYWYnyW46w==
X-CSE-MsgGUID: iJq6ZeukTUiuWbElrqnsAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76973082"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76973082"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 23:00:10 -0700
X-CSE-ConnectionGUID: 9lHnLez8R7OLhZIpVHrfTw==
X-CSE-MsgGUID: pbaiYbpYSh2HdijOAWSPpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="234216783"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2026 23:00:08 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBRO2-000000000sR-27GQ;
	Sat, 11 Apr 2026 06:00:06 +0000
Date: Sat, 11 Apr 2026 13:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 9a4f673eb08d2a7713b258d671b4a45f2a6e68b7
Message-ID: <202604111308.uIoYuENx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_230014_694707_DD6A367B 
X-CRM114-Status: UNSURE (   3.22  )
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
branch HEAD: 9a4f673eb08d2a7713b258d671b4a45f2a6e68b7  wifi: ath12k: avoid dynamic alloc when parsing wmi tb

elapsed time: 755m

configs tested: 172
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260411    gcc-12.5.0
arc                   randconfig-002-20260411    gcc-12.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260411    gcc-12.5.0
arm                   randconfig-002-20260411    gcc-12.5.0
arm                   randconfig-003-20260411    gcc-12.5.0
arm                   randconfig-004-20260411    gcc-12.5.0
arm                        shmobile_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260411    clang-23
arm64                 randconfig-002-20260411    clang-23
arm64                 randconfig-003-20260411    clang-23
arm64                 randconfig-004-20260411    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260411    clang-23
csky                  randconfig-002-20260411    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260411    gcc-14
i386        buildonly-randconfig-002-20260411    gcc-14
i386        buildonly-randconfig-003-20260411    gcc-14
i386        buildonly-randconfig-004-20260411    gcc-14
i386        buildonly-randconfig-005-20260411    gcc-14
i386        buildonly-randconfig-006-20260411    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260411    clang-20
i386                  randconfig-002-20260411    clang-20
i386                  randconfig-003-20260411    clang-20
i386                  randconfig-004-20260411    clang-20
i386                  randconfig-005-20260411    clang-20
i386                  randconfig-006-20260411    clang-20
i386                  randconfig-007-20260411    clang-20
i386                  randconfig-011-20260411    clang-20
i386                  randconfig-012-20260411    clang-20
i386                  randconfig-013-20260411    clang-20
i386                  randconfig-014-20260411    clang-20
i386                  randconfig-015-20260411    clang-20
i386                  randconfig-016-20260411    clang-20
i386                  randconfig-017-20260411    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260411    gcc-11.5.0
parisc                randconfig-002-20260411    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260411    gcc-11.5.0
powerpc               randconfig-002-20260411    gcc-11.5.0
powerpc64             randconfig-001-20260411    gcc-11.5.0
powerpc64             randconfig-002-20260411    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260411    gcc-10.5.0
riscv                 randconfig-002-20260411    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260411    gcc-10.5.0
s390                  randconfig-002-20260411    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260411    gcc-10.5.0
sh                    randconfig-002-20260411    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260411    gcc-14
sparc                 randconfig-002-20260411    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260411    gcc-14
sparc64               randconfig-002-20260411    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260411    gcc-14
um                    randconfig-002-20260411    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260411    gcc-14
x86_64      buildonly-randconfig-002-20260411    gcc-14
x86_64      buildonly-randconfig-003-20260411    gcc-14
x86_64      buildonly-randconfig-004-20260411    gcc-14
x86_64      buildonly-randconfig-005-20260411    gcc-14
x86_64      buildonly-randconfig-006-20260411    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260411    gcc-14
x86_64                randconfig-002-20260411    gcc-14
x86_64                randconfig-003-20260411    gcc-14
x86_64                randconfig-004-20260411    gcc-14
x86_64                randconfig-005-20260411    gcc-14
x86_64                randconfig-006-20260411    gcc-14
x86_64                randconfig-011-20260411    clang-20
x86_64                randconfig-012-20260411    clang-20
x86_64                randconfig-013-20260411    clang-20
x86_64                randconfig-014-20260411    clang-20
x86_64                randconfig-015-20260411    clang-20
x86_64                randconfig-016-20260411    clang-20
x86_64                randconfig-071-20260411    clang-20
x86_64                randconfig-072-20260411    clang-20
x86_64                randconfig-073-20260411    clang-20
x86_64                randconfig-074-20260411    clang-20
x86_64                randconfig-075-20260411    clang-20
x86_64                randconfig-076-20260411    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260411    gcc-14
xtensa                randconfig-002-20260411    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

