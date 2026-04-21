Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD7DF327A8
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 06:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wk/NeMwYnZgopbPqU5yLtNdjZGdaiBBcQLU663aCiWo=; b=QBjP5arI3n89xL88GP6+7lMO3U
	hPxhInQlDKlEiGzgrOnpptyEHg4VUJ0BSdD9UrXA5IgAKsUXhzfVobeqnYwVsfbXXnaJ7WBX0a+5H
	tIwDDFkM1Y+EJTwP10515AEX0t+gBEfK54+QjrJqiVaz+Z1h3yfaNCgk+2PdC8EcEC7aZXvGtz8YF
	m+X/en94+1SEv0KLdYrTsTqqAgKMpvH+wv54W2S34yv8w1JLb399SvT0q/0UT4DnMmOK88kB5c2dY
	6nW/gkyMV2WyAatQwG9GIp67EZJVf67AnQ7QVadYyDNsq4Gkb+T3xXZIcn23HSZEH+4ioz8eOIBuP
	0bje9s/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4Lc-00000008517-1A7J;
	Tue, 21 Apr 2026 06:12:36 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4LZ-0000000850l-14ks
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 06:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776751953; x=1808287953;
  h=date:from:to:cc:subject:message-id;
  bh=3vX9mzrfle+a5VKgDdZlrBHr1S5UMhuSjQfuOJU6+u0=;
  b=GTUtKBW2jbcMRH3AJwGvANC8p/iE/ouT7t90bghM5LNArxij8u1nG7t4
   gbkqUhFuf6Ib6nms5k272zXHWH3g5bgMppFyKATlcJfvfkyGHS6k9zkwo
   g+V8csveZcMcSmL4xTW/DiNDwdgYAypxPNnDdJpSIRnwHUxSa3AnmXE3Z
   Qm87uqTAjbqzSgQc4HMR5uumHv8/pdPnFFQqliKz2F6HRpIvtQTJty07+
   AvNSn8o6DmiaiERFcx12PiiNCDYQjDzDvky/eQNPx0dqo6WTdsnEMz6mB
   IxT1BZrl4Og+tUaEOPUaJuR2rShMbQmiYHCINowkigUGSlnDIjsslZPlA
   Q==;
X-CSE-ConnectionGUID: yNaOdf8DSGiTxL2vVHh0yQ==
X-CSE-MsgGUID: CXJPbn8aQQC0RTeixRZyFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81546201"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="81546201"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 23:12:32 -0700
X-CSE-ConnectionGUID: tREFoh68TEuYzGdhiNYuxA==
X-CSE-MsgGUID: zKnCtcXUTuK1ykQpVaMhsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="227609206"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Apr 2026 23:12:30 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF4LU-000000003HY-1VyJ;
	Tue, 21 Apr 2026 06:12:28 +0000
Date: Tue, 21 Apr 2026 14:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 90ef329e73c673e4e3ea66226bb1d8fe3acf45a5
Message-ID: <202604211402.oYVBhrxc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_231233_339939_37ED125B 
X-CRM114-Status: UNSURE (   3.69  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 90ef329e73c673e4e3ea66226bb1d8fe3acf45a5  wifi: ath12k: Fix ath12k_dp_htt_tlv_iter()'s iter() signature

elapsed time: 859m

configs tested: 146
configs skipped: 8

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
arc                   randconfig-001-20260421    gcc-10.5.0
arc                   randconfig-002-20260421    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-002-20260421    gcc-8.5.0
arm                   randconfig-003-20260421    clang-23
arm                   randconfig-004-20260421    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260421    clang-23
arm64                 randconfig-002-20260421    gcc-13.4.0
arm64                 randconfig-003-20260421    clang-18
arm64                 randconfig-004-20260421    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260421    gcc-13.4.0
csky                  randconfig-002-20260421    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon               randconfig-001-20260421    clang-23
hexagon               randconfig-002-20260421    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260421    gcc-14
i386        buildonly-randconfig-002-20260421    gcc-14
i386        buildonly-randconfig-003-20260421    clang-20
i386        buildonly-randconfig-004-20260421    clang-20
i386        buildonly-randconfig-005-20260421    clang-20
i386        buildonly-randconfig-006-20260421    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20260421    gcc-14
i386                  randconfig-012-20260421    gcc-14
i386                  randconfig-013-20260421    gcc-14
i386                  randconfig-014-20260421    clang-20
i386                  randconfig-015-20260421    clang-20
i386                  randconfig-016-20260421    gcc-14
i386                  randconfig-017-20260421    clang-20
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260421    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260421    gcc-11.5.0
nios2                 randconfig-002-20260421    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260421    gcc-15.2.0
parisc                randconfig-002-20260421    gcc-9.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     kmeter1_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260421    clang-20
powerpc               randconfig-002-20260421    clang-23
powerpc64             randconfig-001-20260421    gcc-13.4.0
powerpc64             randconfig-002-20260421    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260421    clang-23
riscv                 randconfig-002-20260421    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260421    gcc-11.5.0
s390                  randconfig-002-20260421    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260421    gcc-15.2.0
sh                    randconfig-002-20260421    gcc-11.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260421    gcc-15.2.0
sparc                 randconfig-002-20260421    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260421    gcc-9.5.0
sparc64               randconfig-002-20260421    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260421    clang-23
um                    randconfig-002-20260421    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260421    gcc-14
x86_64      buildonly-randconfig-003-20260421    gcc-14
x86_64      buildonly-randconfig-004-20260421    gcc-14
x86_64      buildonly-randconfig-005-20260421    gcc-13
x86_64      buildonly-randconfig-006-20260421    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260421    clang-20
x86_64                randconfig-002-20260421    clang-20
x86_64                randconfig-003-20260421    clang-20
x86_64                randconfig-004-20260421    gcc-14
x86_64                randconfig-005-20260421    gcc-14
x86_64                randconfig-006-20260421    gcc-14
x86_64                randconfig-011-20260421    clang-20
x86_64                randconfig-012-20260421    clang-20
x86_64                randconfig-013-20260421    gcc-14
x86_64                randconfig-014-20260421    gcc-14
x86_64                randconfig-015-20260421    clang-20
x86_64                randconfig-016-20260421    clang-20
x86_64                randconfig-071-20260421    clang-20
x86_64                randconfig-072-20260421    gcc-14
x86_64                randconfig-073-20260421    clang-20
x86_64                randconfig-074-20260421    clang-20
x86_64                randconfig-075-20260421    clang-20
x86_64                randconfig-076-20260421    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260421    gcc-15.2.0
xtensa                randconfig-002-20260421    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

