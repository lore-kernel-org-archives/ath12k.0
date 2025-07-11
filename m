Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E35C8303C
	for <ath12k@archiver.kernel.org>; Fri, 11 Jul 2025 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hRgaFwsSp+Zr3CyT4y+BXBrZe9Uz7DaMpFyoQNy3g3g=; b=xKJ6lioud5MxDjYuNQC/7ifFE3
	6Ijt58YmgQH1PAYam4cmL3m3tabwrE5PUhrJt0L1m4uPFxFWvd9VtNkoxyPeZjs47QULhNfenxnrC
	K1ORymwu7PuOD28hYGswKRsYhHRQWJiNYQO6dQDOhvRCTdujp80wIKTuNofvuP8f30XqV6wP73BEN
	wWhKnriyrYt0ZiORJxUlvl28BvqM0cdXjiA1dQc1TkISxBHDDzgvX0Ik3kLTUavD2SwyPIxGm9vEL
	FeTeAZ2CI9/hJH6QrmsZZfvS2lmyOlNPymIhIcEvsyqOptK3hSpD3MkSbOlY6FnkpDsODRj6FjYyj
	i1mGGX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAKA-0000000EMZA-49eD;
	Fri, 11 Jul 2025 09:45:46 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Gh-0000000EB2y-0AaG
	for ath12k@lists.infradead.org;
	Fri, 11 Jul 2025 08:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752223088; x=1783759088;
  h=date:from:to:cc:subject:message-id;
  bh=hCJ/pLWlgfkzcy5tEf6fENDb68XKGmdWqLv5beeQkb4=;
  b=AaV9aOQNbxB/R3hFUcBtS8l+kL7s7KVIQ/qOpghudo1b/Qt48dDmn4zR
   Ja7f1Uws0CPNNQT6kz8XavmnaC4PSsIBXthpDytZu33etqUcTRkdMgf7h
   tu6blu8EkXKBbqgOkcnlLnaiTWM+myEimWMalmHrAF4sH3ws9okBa+k8Y
   oEvR8rAsEnNh8E13DkJe3IAXXfp4PZzDowGscQ7VBE1MQ6HwoUMAiw6Rg
   /valc0yNK+6DRL9fpZRDBiBBe+3nafeKSd4Z+xAw63TECXUfIWUmdruOI
   Lu+5yG4ztLai+VCfPmEPBCSEkx6qrS4ItOJbuSwChxXwwU92kOwHkyQLa
   w==;
X-CSE-ConnectionGUID: 1CoVz+ngRXKAaR3TZkfujg==
X-CSE-MsgGUID: JZPUmSFnQ8ubsBmYAwPj9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54645621"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="54645621"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:38:07 -0700
X-CSE-ConnectionGUID: MkIdi4dySUKYhQ/txY7ZVg==
X-CSE-MsgGUID: ho4il9DxTZyNzM4ua6aQPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="155723824"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jul 2025 01:38:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua9Gc-000695-2K;
	Fri, 11 Jul 2025 08:38:02 +0000
Date: Fri, 11 Jul 2025 16:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 27ba973caaf85ff3a2a23eca33d6dc9b4fe405e8
Message-ID: <202507111645.N9NsWy4S-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_013807_115107_765F5CE5 
X-CRM114-Status: UNSURE (   4.04  )
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
branch HEAD: 27ba973caaf85ff3a2a23eca33d6dc9b4fe405e8  wifi: ath12k: allow beacon protection keys to be installed in hardware

elapsed time: 1078m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250710    gcc-15.1.0
arc                   randconfig-001-20250711    gcc-8.5.0
arc                   randconfig-002-20250710    gcc-12.4.0
arc                   randconfig-002-20250711    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250710    gcc-8.5.0
arm                   randconfig-001-20250711    clang-19
arm                   randconfig-002-20250710    clang-21
arm                   randconfig-002-20250711    clang-21
arm                   randconfig-003-20250710    clang-21
arm                   randconfig-003-20250711    gcc-15.1.0
arm                   randconfig-004-20250710    gcc-8.5.0
arm                   randconfig-004-20250711    clang-20
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250710    clang-21
arm64                 randconfig-001-20250711    clang-18
arm64                 randconfig-002-20250710    clang-21
arm64                 randconfig-002-20250711    clang-21
arm64                 randconfig-003-20250710    gcc-8.5.0
arm64                 randconfig-003-20250711    gcc-12.3.0
arm64                 randconfig-004-20250710    clang-21
arm64                 randconfig-004-20250711    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250711    gcc-14.3.0
csky                  randconfig-002-20250711    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250711    clang-19
hexagon               randconfig-002-20250711    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250710    gcc-12
i386        buildonly-randconfig-001-20250711    gcc-12
i386        buildonly-randconfig-002-20250710    gcc-12
i386        buildonly-randconfig-002-20250711    gcc-12
i386        buildonly-randconfig-003-20250710    clang-20
i386        buildonly-randconfig-003-20250711    clang-20
i386        buildonly-randconfig-004-20250710    gcc-11
i386        buildonly-randconfig-004-20250711    clang-20
i386        buildonly-randconfig-005-20250710    clang-20
i386        buildonly-randconfig-005-20250711    gcc-11
i386        buildonly-randconfig-006-20250710    clang-20
i386        buildonly-randconfig-006-20250711    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250711    clang-21
loongarch             randconfig-002-20250711    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250711    gcc-10.5.0
nios2                 randconfig-002-20250711    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250711    gcc-12.4.0
parisc                randconfig-002-20250711    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250711    clang-18
powerpc               randconfig-002-20250711    clang-21
powerpc               randconfig-003-20250711    clang-21
powerpc64             randconfig-001-20250711    clang-21
powerpc64             randconfig-002-20250711    clang-21
powerpc64             randconfig-003-20250711    gcc-13.4.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250711    gcc-8.5.0
riscv                 randconfig-002-20250711    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250711    clang-21
s390                  randconfig-002-20250711    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250711    gcc-12.4.0
sh                    randconfig-002-20250711    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250711    gcc-10.3.0
sparc                 randconfig-002-20250711    gcc-12.4.0
sparc64               randconfig-001-20250711    gcc-8.5.0
sparc64               randconfig-002-20250711    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250711    clang-20
um                    randconfig-002-20250711    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250711    clang-20
x86_64      buildonly-randconfig-002-20250711    clang-20
x86_64      buildonly-randconfig-003-20250711    clang-20
x86_64      buildonly-randconfig-004-20250711    gcc-12
x86_64      buildonly-randconfig-005-20250711    clang-20
x86_64      buildonly-randconfig-006-20250711    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250711    gcc-9.3.0
xtensa                randconfig-002-20250711    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

