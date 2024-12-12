Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B68EE77182
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eERZSmDPkZqRS8eH22OgLrplYSUPc8GoltjfDPDF45M=; b=QTyeQIOHszA6fqnZHpaATHu15j
	5yOge46Ft3HMoVHMmuMVEUM7tFvPUdAaKF27lCNePFFuJA3+UbnHMdxtZMyZgi9tV72LFYxPMzgqS
	AEiIu6Kzrpsxr4sMTgYh7fRGt8/c7JSH9J4oG4J8QsStEyphgR6WwEjo3oENi2zePoy281zwibWk5
	QRVck8WyHFaeMbnA3s1I+p9AJdFbCTIQOR7KlG8ZMv38bWLxTLk8Jagq2yu4ZaHKXl6b9/IgVCsGq
	HnaWWHrenv9KN72gj2gfjiQ74YPVIgTWHpZqi1sCKw3/EN+pzQ9ohZJGQq7rioTN3PiRcvvJ/+zPk
	HGfokWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnFX-00000001Fog-0smN
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 17:45:19 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn71-00000001D4U-2Y3T
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 17:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734024991; x=1765560991;
  h=date:from:to:cc:subject:message-id;
  bh=jpFIVE2eqYWcRPpKCuNAEjgWezVMc+fOYeSo65nW39w=;
  b=YFeEMs6qHlfR0AFj+yYchBafvvbpQZfDnxMO1bas686WOMeN9KluUbQn
   LcviGZ7Iumh68XjayA46klBzMYcssGN2/58gb9bYvtO9QMnEvOvQvcxx4
   6p/y3ywBWUNAGw5mBi5ULYI1CBpApesw74YA16HAXyIOgacyB5I4vkIZA
   7YhTMSR61eK04A7aJg3le6BvkkPA6Dso1Lv9Vl+fAUznGmwQIGSEAZufX
   C3jYdA0uJFglDtbIUdYs7ixktqqTv1NtYuw/qxUMWWmkeDj1S/HAEFulu
   YSIAk4Bv2MNMXpJPc55onRCZlkACFjSH6s7JRzxJnyLvqvdjP0wSn0hs3
   g==;
X-CSE-ConnectionGUID: AlWniBE/RQOg2SuqTnNcbg==
X-CSE-MsgGUID: Ymo0Uz0PRKePohQkkfZuaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34698762"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="34698762"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 09:36:30 -0800
X-CSE-ConnectionGUID: D5JWZ1bFSTqh3U2sx8adAg==
X-CSE-MsgGUID: 3j5vGPmNRB6IbKmhmARKxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96702061"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2024 09:36:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLn6x-000Adz-0B;
	Thu, 12 Dec 2024 17:36:27 +0000
Date: Fri, 13 Dec 2024 01:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 58fa8109fa8dae2947567e8f56dbd55ad81bc35c
Message-ID: <202412130118.8W9GGjJo-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_093631_693223_915E0299 
X-CRM114-Status: UNSURE (   3.61  )
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
branch HEAD: 58fa8109fa8dae2947567e8f56dbd55ad81bc35c  wifi: ath12k: Off by one in ath12k_wmi_process_csa_switch_count_event()

elapsed time: 1453m

configs tested: 80
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                   randconfig-001-20241212    gcc-13.2.0
arc                   randconfig-002-20241212    gcc-13.2.0
arm                   randconfig-001-20241212    gcc-14.2.0
arm                   randconfig-002-20241212    clang-20
arm                   randconfig-003-20241212    clang-19
arm                   randconfig-004-20241212    clang-20
arm64                 randconfig-001-20241212    clang-20
arm64                 randconfig-002-20241212    clang-15
arm64                 randconfig-003-20241212    clang-20
arm64                 randconfig-004-20241212    gcc-14.2.0
csky                  randconfig-001-20241212    gcc-14.2.0
csky                  randconfig-002-20241212    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20241212    clang-14
hexagon               randconfig-002-20241212    clang-16
i386        buildonly-randconfig-001-20241212    clang-19
i386        buildonly-randconfig-002-20241212    clang-19
i386        buildonly-randconfig-003-20241212    clang-19
i386        buildonly-randconfig-004-20241212    clang-19
i386        buildonly-randconfig-005-20241212    clang-19
i386        buildonly-randconfig-006-20241212    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20241212    gcc-14.2.0
loongarch             randconfig-002-20241212    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20241212    gcc-14.2.0
nios2                 randconfig-002-20241212    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241212    gcc-14.2.0
parisc                randconfig-002-20241212    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20241212    gcc-14.2.0
powerpc               randconfig-002-20241212    clang-20
powerpc               randconfig-003-20241212    clang-15
powerpc64             randconfig-001-20241212    clang-20
powerpc64             randconfig-002-20241212    gcc-14.2.0
powerpc64             randconfig-003-20241212    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241212    clang-17
riscv                 randconfig-002-20241212    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241212    clang-18
s390                  randconfig-002-20241212    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241212    gcc-14.2.0
sh                    randconfig-002-20241212    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20241212    gcc-14.2.0
sparc                 randconfig-002-20241212    gcc-14.2.0
sparc64               randconfig-001-20241212    gcc-14.2.0
sparc64               randconfig-002-20241212    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241212    gcc-12
um                    randconfig-002-20241212    clang-20
x86_64      buildonly-randconfig-001-20241212    clang-19
x86_64      buildonly-randconfig-002-20241212    gcc-12
x86_64      buildonly-randconfig-003-20241212    clang-19
x86_64      buildonly-randconfig-004-20241212    clang-19
x86_64      buildonly-randconfig-005-20241212    gcc-11
x86_64      buildonly-randconfig-006-20241212    clang-19
xtensa                randconfig-001-20241212    gcc-14.2.0
xtensa                randconfig-002-20241212    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

