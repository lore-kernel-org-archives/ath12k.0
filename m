Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C02CAC582
	for <ath12k@archiver.kernel.org>; Wed, 10 Sep 2025 00:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=07irNoEfH1WoKchcFBvEoG05M4JTNvh17/hb/l2XzK0=; b=py7q3ifhNcUnC6ygfNHtf5ovFW
	Xek7JMYTxaCpGlBTGwwLwYQacCZe2Zpdr1ww16RzlTTaYfIwr6mlhhGwrA5TxrAeDqJzol11IbULP
	1yTrTdjmQAun4tUjV0VnUZH+wPZ0dMIRAyWrsxwfIpi5qNEdTXw3WktKgLZRgP3cvWckMBPrEfst1
	rFFbc3hfZE9/QaYFFjlxpYfOZs0u1x6mJ6ywblSnjVLltMHcvmLuhLJ7GGjzB8Sv0ADjbUzib8OPv
	JpTLIoSWW7LGDTAnqUq7k1pjWoLy9W2WlHzW7FUjG1uvuWacK7au6dQ88tlrzIyiqtzDmLNQKSR93
	jCpVBqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw983-0000000BGOL-3kPr;
	Wed, 10 Sep 2025 00:56:07 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw981-0000000BGNB-4BrL
	for ath12k@lists.infradead.org;
	Wed, 10 Sep 2025 00:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757465766; x=1789001766;
  h=date:from:to:cc:subject:message-id;
  bh=XNlljvzR+wuK6bP3y/pGzLT9yL+E0plak2eszfCYYVM=;
  b=kkIIBocAp+TXqcUJ5/AlUl/QCIDU9nZJHbHd/vLAIye00ccyVX4i3Z0K
   LwCwMHcgW95lBWeYd0zNGEb8JN2E8rxO66qEmoNsfCChUqf15mPRAjzph
   5BUt/ilaa/G/KYQUbFsLS8EBoJWvgrqGjQEadB3iLgD5jNJd4t8nxBG7n
   EK2k0sCY3rYkHGVqPjPT6REPUiF7Eh2Vo6MfKndCNd9NRRysrCHH3e6Fn
   lXozfs5Ndhbr4oU+yO+QG1EOp5qYLPr3rSg6sb4pDXcez3Xb37BKjcciD
   6GCyJjB49WEWcfpz+1WyIGYFxKGfwGUE4mnqfm8l95MAJmbNWcPX0Qv3e
   A==;
X-CSE-ConnectionGUID: GEIe/Z/AQ7mU18bDAY6BEQ==
X-CSE-MsgGUID: qs5/gq+cSOqaJ9PkCvJQBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77374173"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="77374173"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 17:56:02 -0700
X-CSE-ConnectionGUID: qaHUDIfrSAKDgtPFqtUu9Q==
X-CSE-MsgGUID: M7GRywX7Q1+3tokbIIceuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="177292364"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Sep 2025 17:56:01 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw97u-0005OB-0Y;
	Wed, 10 Sep 2025 00:55:58 +0000
Date: Wed, 10 Sep 2025 08:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 59727b35ec86018613078ae806d2f859d5f5b1a8
Message-ID: <202509100858.C5qzhCes-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_175606_054953_70EBABE7 
X-CRM114-Status: UNSURE (   4.46  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-ath12k-ng
branch HEAD: 59727b35ec86018613078ae806d2f859d5f5b1a8  wifi: ath12k: Change the API prefixes to ath12k_wifi7 in tx/rx

elapsed time: 1472m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250909    gcc-8.5.0
arc                   randconfig-002-20250909    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250909    clang-18
arm                   randconfig-002-20250909    clang-17
arm                   randconfig-003-20250909    clang-22
arm                   randconfig-004-20250909    clang-19
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250909    clang-16
arm64                 randconfig-002-20250909    gcc-11.5.0
arm64                 randconfig-003-20250909    gcc-11.5.0
arm64                 randconfig-004-20250909    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250909    gcc-15.1.0
csky                  randconfig-002-20250909    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250909    clang-22
hexagon               randconfig-002-20250909    clang-22
i386        buildonly-randconfig-001-20250909    gcc-13
i386        buildonly-randconfig-002-20250909    clang-20
i386        buildonly-randconfig-003-20250909    clang-20
i386        buildonly-randconfig-004-20250909    clang-20
i386        buildonly-randconfig-005-20250909    clang-20
i386        buildonly-randconfig-006-20250909    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250909    gcc-15.1.0
loongarch             randconfig-002-20250909    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250909    gcc-11.5.0
nios2                 randconfig-002-20250909    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250909    gcc-8.5.0
parisc                randconfig-002-20250909    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250909    clang-22
powerpc               randconfig-002-20250909    clang-17
powerpc               randconfig-003-20250909    gcc-8.5.0
powerpc64             randconfig-001-20250909    clang-20
powerpc64             randconfig-002-20250909    gcc-10.5.0
powerpc64             randconfig-003-20250909    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250909    clang-22
riscv                 randconfig-002-20250909    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250909    gcc-11.5.0
s390                  randconfig-002-20250909    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250909    gcc-15.1.0
sh                    randconfig-002-20250909    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250909    gcc-8.5.0
sparc                 randconfig-002-20250909    gcc-15.1.0
sparc64               randconfig-001-20250909    clang-22
sparc64               randconfig-002-20250909    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250909    gcc-14
um                    randconfig-002-20250909    gcc-14
x86_64      buildonly-randconfig-001-20250909    clang-20
x86_64      buildonly-randconfig-002-20250909    clang-20
x86_64      buildonly-randconfig-003-20250909    gcc-14
x86_64      buildonly-randconfig-004-20250909    clang-20
x86_64      buildonly-randconfig-005-20250909    gcc-14
x86_64      buildonly-randconfig-006-20250909    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250909    gcc-8.5.0
xtensa                randconfig-002-20250909    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

