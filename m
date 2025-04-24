Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F46C369D7
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 20:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CbUSNcWzaKmfGRZPNlGVzRP2OuH235ddTsdvbeaTGPc=; b=jdOotDjyWaEPN12aWfOElKc68O
	6lc3gKKHXldIFG6orN/u8SvM/S8CZJunm/VcOX9IsebF4UJCC9n+3olUzRR90I0qMRGHiRCxHOiLA
	voQ9zE1WnJFvRVX1RXTfS4Lghh6Hkv+R9vSkxWVn9HeAaQgwFg8/wPboWBgCKlOdwVLoOidlu8R+R
	W8L8KG7DQ7h2kijHYcUkn6fA3qFWT/vl3fT+Er2waeAW5bQdY04iaAzMVa0Ua/Rd5Bph5h1Ff6jhJ
	7C0u8C5pD4u1pyTRAGYyDl5dawdbJmRC/cPc/qV0Tlp9RcchNGS0psnHnvFGkgGcjjomo5FPHJTbG
	XeqCQIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82yN-0000000FIei-1Qw6;
	Thu, 24 Apr 2025 20:15:03 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82Ec-0000000FC7z-3JhR
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 19:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745522867; x=1777058867;
  h=date:from:to:cc:subject:message-id;
  bh=sR1iXG+8Heh+iYpfZSEaljoOB+xdzHg6n/fL6e3Uedw=;
  b=dTlU9hJzKYyNtSAST4FJfJQwwpeUI9xxJZfMlK8EZpALeAso4I8V7QaP
   MNTBeWQ+1Q1F1FW3AsIrMh1ri4WVRa+ujV74bM4id0HSZ5EgqagDVn47Y
   6JTl8LzaAOlGrt8Kx8qLd/P4MqoQco77P/VhbntoNDOHCw66z3AF9mOTf
   Ongf0ivMCN+zOaKFs1/FuMDJ6ISOfiN2Z68YqbdiE/ZDU6mL1uQXkLo0J
   +4HyYvvAQqDANEfPGsDyo10sms8+MrBcisEN6GMKWEWhiK/JugTEiMu8M
   ISgTActoPNQ6QBDmtmznMnephSaJDmF+YSX1Rw/BizdiKMTZ2RTjkZYT4
   g==;
X-CSE-ConnectionGUID: 7mZF3wvEQNqTzcgFQI2e4A==
X-CSE-MsgGUID: Lce4kpYyQyWS/u/YyZzWnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69667550"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="69667550"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 12:27:46 -0700
X-CSE-ConnectionGUID: T6z1V3HQRT+eVRegGWaWEw==
X-CSE-MsgGUID: U2eXNMB2RbSUSpLsJ/5RoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132446609"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Apr 2025 12:27:45 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u82EY-0004Uf-0L;
	Thu, 24 Apr 2025 19:27:42 +0000
Date: Fri, 25 Apr 2025 03:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 e9676b01c7a74e82dfa8a9d951e06f1895ccbbf3
Message-ID: <202504250324.rVNPDvIq-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_122746_902068_6DA738EF 
X-CRM114-Status: UNSURE (   3.46  )
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
branch HEAD: e9676b01c7a74e82dfa8a9d951e06f1895ccbbf3  wifi: ath12k: enable monitor mode for WCN7850

elapsed time: 1450m

configs tested: 104
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250424    gcc-8.5.0
arc                   randconfig-002-20250424    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250424    gcc-7.5.0
arm                   randconfig-002-20250424    gcc-7.5.0
arm                   randconfig-003-20250424    clang-21
arm                   randconfig-004-20250424    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250424    clang-21
arm64                 randconfig-002-20250424    gcc-8.5.0
arm64                 randconfig-003-20250424    clang-21
arm64                 randconfig-004-20250424    gcc-8.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250424    gcc-12.4.0
csky                  randconfig-002-20250424    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250424    clang-21
hexagon               randconfig-002-20250424    clang-21
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250424    gcc-12
i386        buildonly-randconfig-002-20250424    clang-20
i386        buildonly-randconfig-003-20250424    clang-20
i386        buildonly-randconfig-004-20250424    clang-20
i386        buildonly-randconfig-005-20250424    gcc-12
i386        buildonly-randconfig-006-20250424    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250424    gcc-14.2.0
loongarch             randconfig-002-20250424    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250424    gcc-10.5.0
nios2                 randconfig-002-20250424    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250424    gcc-9.3.0
parisc                randconfig-002-20250424    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250424    clang-21
powerpc               randconfig-002-20250424    clang-17
powerpc               randconfig-003-20250424    clang-21
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250424    clang-21
powerpc64             randconfig-002-20250424    clang-21
powerpc64             randconfig-003-20250424    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250424    clang-21
riscv                 randconfig-002-20250424    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250424    gcc-9.3.0
s390                  randconfig-002-20250424    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                    randconfig-001-20250424    gcc-12.4.0
sh                    randconfig-002-20250424    gcc-6.5.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250424    gcc-10.3.0
sparc                 randconfig-002-20250424    gcc-11.5.0
sparc64               randconfig-001-20250424    gcc-9.3.0
sparc64               randconfig-002-20250424    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250424    clang-21
um                    randconfig-002-20250424    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250424    gcc-12
x86_64      buildonly-randconfig-002-20250424    clang-20
x86_64      buildonly-randconfig-003-20250424    gcc-12
x86_64      buildonly-randconfig-004-20250424    clang-20
x86_64      buildonly-randconfig-005-20250424    clang-20
x86_64      buildonly-randconfig-006-20250424    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250424    gcc-14.2.0
xtensa                randconfig-002-20250424    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

