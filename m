Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3C1CD4F3C
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 02:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LraWDBmfFFmwKab+w1c9J2iTW0o6WqsKhJey4X3tZ6U=; b=eRQPdStZN9kip3Wh3U19bOlUJZ
	YJruSlof3jpZdXVoZ4p9by3zmzbeCyuahPrK8twYyZL+zsG3DMXqJc3ZqMqlfa9o5+Kr/2KxCl8e9
	9NHBlaRl3aM4tX7Nu3o1fGHAV0H4SkV2cRwUeMsa9H3M7ofIiqZTv3hISPwiKHfrAy8+wLO556jFI
	6OUwZReAOeLp6lXfOdf+qro9DUJ+ZFdKgbdhBZ5MDwzx3iSoEt5X1GsSZNrZ/LAk80H/2YzcdQGaJ
	Y4x4PzAMp36ievfzUPZBEqoIv0Xffr6v/57rLk11QsxvYmf8hMhvyHy9kBWEdDlFJravD08OOPmlM
	Xwz9njSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAA4-0000000HT00-0H5H;
	Tue, 19 May 2026 02:26:24 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAA1-0000000HSzJ-1P0j
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 02:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779157582; x=1810693582;
  h=date:from:to:cc:subject:message-id;
  bh=jZfr2kcJVS2GNum473B32X7SLkzl0RFbAAajVVG0G30=;
  b=UTdVvSyGEuycQbXIQrRweXUzi3yvd4QP1RviCjJQnqHEiz3LUfcHGoER
   r3UfDv6VYuql/jZRDGh2mogR6AF/b8L5nX6V5vDlIDDaGKF7LLOUkRlDa
   ov2acy1OktQmvOzHe5VoMHouW9eS6XRMqublq7PJGvjKkSbM7hhLQA1LK
   TApQA07fIxh6fITdsX0gxZTPDvf6BM1/0AAJJgSH4O3hdJF0zdTf14dBU
   1vv4WiXx8nw9ETtd/Q/0UpRrd2baFEdN798oZqUtZTa7aZXEVw0WyzH67
   jpHImOMnke2aMEsMSNv+GAxxhyX1jPVRer8vE6W48/sboeKT2miSYZFIq
   A==;
X-CSE-ConnectionGUID: jg/iuJeBRzOUl579vdbnGA==
X-CSE-MsgGUID: WemEPOcTRNqYN0r7QM03Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79992013"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79992013"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:26:20 -0700
X-CSE-ConnectionGUID: Pi/y60mtSVS0gU3cNIfPRw==
X-CSE-MsgGUID: 6yn1zrRHSNCYihSZBFqbrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="236995959"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2026 19:26:18 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPA94-000000000Dv-2OqQ;
	Tue, 19 May 2026 02:25:43 +0000
Date: Tue, 19 May 2026 10:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:for-current] BUILD SUCCESS
 60fb2cf51e77bb1c0261160b4be44209d68956b1
Message-ID: <202605191054.52LvIb2J-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_192621_410121_B0E8E3C3 
X-CRM114-Status: UNSURE (   4.43  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
branch HEAD: 60fb2cf51e77bb1c0261160b4be44209d68956b1  wifi: ath12k: fix EHT TX MCS limitation due to wrong 20 MHz-only parsing

elapsed time: 743m

configs tested: 190
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260519    clang-23
arc                   randconfig-002-20260519    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260519    clang-23
arm                   randconfig-002-20260519    clang-23
arm                   randconfig-003-20260519    clang-23
arm                   randconfig-004-20260519    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260519    gcc-8.5.0
arm64                 randconfig-002-20260519    gcc-8.5.0
arm64                 randconfig-003-20260519    gcc-8.5.0
arm64                 randconfig-004-20260519    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260519    gcc-8.5.0
csky                  randconfig-002-20260519    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260519    clang-23
hexagon               randconfig-001-20260519    gcc-10.5.0
hexagon               randconfig-002-20260519    clang-23
hexagon               randconfig-002-20260519    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260519    gcc-12
i386        buildonly-randconfig-002-20260519    gcc-12
i386        buildonly-randconfig-003-20260519    gcc-12
i386        buildonly-randconfig-004-20260519    gcc-12
i386        buildonly-randconfig-005-20260519    gcc-12
i386        buildonly-randconfig-006-20260519    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260519    gcc-14
i386                  randconfig-002-20260519    gcc-14
i386                  randconfig-003-20260519    gcc-14
i386                  randconfig-004-20260519    gcc-14
i386                  randconfig-005-20260519    gcc-14
i386                  randconfig-006-20260519    gcc-14
i386                  randconfig-007-20260519    gcc-14
i386                  randconfig-011-20260519    gcc-14
i386                  randconfig-012-20260519    gcc-14
i386                  randconfig-013-20260519    gcc-14
i386                  randconfig-014-20260519    gcc-14
i386                  randconfig-015-20260519    gcc-14
i386                  randconfig-016-20260519    gcc-14
i386                  randconfig-017-20260519    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260519    clang-23
loongarch             randconfig-001-20260519    gcc-10.5.0
loongarch             randconfig-002-20260519    clang-23
loongarch             randconfig-002-20260519    gcc-10.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260519    gcc-10.5.0
nios2                 randconfig-002-20260519    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260519    gcc-8.5.0
parisc                randconfig-002-20260519    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260519    gcc-8.5.0
powerpc               randconfig-002-20260519    gcc-8.5.0
powerpc64             randconfig-001-20260519    gcc-8.5.0
powerpc64             randconfig-002-20260519    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260519    gcc-13.4.0
riscv                 randconfig-002-20260519    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260519    gcc-13.4.0
s390                  randconfig-002-20260519    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260519    gcc-13.4.0
sh                    randconfig-002-20260519    gcc-13.4.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260519    gcc-14.3.0
sparc                 randconfig-002-20260519    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260519    gcc-14.3.0
sparc64               randconfig-002-20260519    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260519    gcc-14.3.0
um                    randconfig-002-20260519    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260519    gcc-14
x86_64      buildonly-randconfig-002-20260519    gcc-14
x86_64      buildonly-randconfig-003-20260519    gcc-14
x86_64      buildonly-randconfig-004-20260519    gcc-14
x86_64      buildonly-randconfig-005-20260519    gcc-14
x86_64      buildonly-randconfig-006-20260519    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260519    clang-20
x86_64                randconfig-002-20260519    clang-20
x86_64                randconfig-003-20260519    clang-20
x86_64                randconfig-004-20260519    clang-20
x86_64                randconfig-005-20260519    clang-20
x86_64                randconfig-006-20260519    clang-20
x86_64                randconfig-011-20260519    clang-20
x86_64                randconfig-012-20260519    clang-20
x86_64                randconfig-013-20260519    clang-20
x86_64                randconfig-014-20260519    clang-20
x86_64                randconfig-015-20260519    clang-20
x86_64                randconfig-016-20260519    clang-20
x86_64                randconfig-071-20260519    gcc-14
x86_64                randconfig-072-20260519    gcc-14
x86_64                randconfig-073-20260519    gcc-14
x86_64                randconfig-074-20260519    gcc-14
x86_64                randconfig-075-20260519    gcc-14
x86_64                randconfig-076-20260519    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260519    gcc-14.3.0
xtensa                randconfig-002-20260519    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

