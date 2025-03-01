Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B1C021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 19:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x+vYgSHrN2wM+24PLGUeW0tVdZEqf5nVIKGZgwJlFfQ=; b=Vg2JcThf2pCmeOSVvoTiSP6BNH
	Ox9ZX2e2+xo00vgr5sJCliUJQY2nDsqr5XNsEmsZ0QCh6gmFmL6PxJXRhpIAn1LC9i8rtnIQQPqkL
	rntHtkx2tyXpTxQv6TbVu8yw0QcLy8XDnJMbrxtHLRZIwo8e17HfgqTR3wH5zfZRGh7W9WKrTvB0h
	5+UpXWRkhdog2lvtZwQSOEg1YEi2DjtlIxpi3YxZnLKcGohpWBuhFP/x8ZsDEJ3LkcXKzWLnEIFZt
	v82RKtEIRhj2j2l8EsA38deVa4oUtRMbb8cGH3kPepS0gMOGoI97lHaypnDjyH5axHjK4qhdVgcjA
	s8WCczYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toSlF-0000000Er7E-11Jd
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 19:44:33 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toSlC-0000000Er6s-2TeX
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 19:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740858271; x=1772394271;
  h=date:from:to:cc:subject:message-id;
  bh=2ErU2X4m2sTFUfzGThRpUpMPMErUG60VoIStVef5CFI=;
  b=bQsdm8SlDQfYaTRuiHhG8RhDjFgxP0/tnoR9EfCV7PW+ftWVtpSJL3AI
   r/Eoxct+hoNzNa+wLhbONDF+mf7qYvEztAIhPn4M/Kk13MgKodAaysEGA
   uy95MR9vzIk+4maI4U4npYt1zXEeUkC8kjIv2jW3qRmiaWPbp61TEIndu
   X800q8tmuckioMmMutitoGZP/gTSZxErl+E0rbs4QNKu1Tv621HcB1iuq
   S8ZmHLX2laP7NTigYTkWhOTeVenkAN8qIQik+8h9oMlvSp/KMO4bdtd2d
   2opZBIIwXGuH7oqDm555iuTVsehWiDh3ZI0umdpnmtpfMNALuG/jWLxA0
   w==;
X-CSE-ConnectionGUID: xHwitxBoTEu8a90WCc89lw==
X-CSE-MsgGUID: SPGkISCiTpONgX3nWD5rxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="52400987"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="52400987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 11:44:27 -0800
X-CSE-ConnectionGUID: 4UJLA+bhS/mOko86KT+JDA==
X-CSE-MsgGUID: zwTgP0vlQ4+cwRLNdPtDpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="122637884"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Mar 2025 11:44:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toSl1-000Gcw-0m;
	Sat, 01 Mar 2025 19:44:21 +0000
Date: Sun, 02 Mar 2025 03:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-split-phy] BUILD SUCCESS
 eff55e5a761d1735c61a6ebb29cbfa64a138dc02
Message-ID: <202503020304.xfnqlRHd-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_114430_675473_09973B5A 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
branch HEAD: eff55e5a761d1735c61a6ebb29cbfa64a138dc02  wifi: ath12k: Add support to trigger the disconnection in STA mode during AP inactivity

Warning ids grouped by kconfigs:

recent_errors
`-- um-allmodconfig
    `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here

elapsed time: 1450m

configs tested: 85
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20250301    gcc-13.2.0
arc                   randconfig-002-20250301    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                   randconfig-001-20250301    gcc-14.2.0
arm                   randconfig-002-20250301    gcc-14.2.0
arm                   randconfig-003-20250301    clang-21
arm                   randconfig-004-20250301    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250301    gcc-14.2.0
arm64                 randconfig-002-20250301    clang-21
arm64                 randconfig-003-20250301    clang-15
arm64                 randconfig-004-20250301    clang-17
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250301    gcc-14.2.0
csky                  randconfig-002-20250301    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250301    clang-21
hexagon               randconfig-002-20250301    clang-21
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250301    clang-19
i386        buildonly-randconfig-002-20250301    clang-19
i386        buildonly-randconfig-003-20250301    clang-19
i386        buildonly-randconfig-004-20250301    clang-19
i386        buildonly-randconfig-005-20250301    gcc-12
i386        buildonly-randconfig-006-20250301    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250301    gcc-14.2.0
loongarch             randconfig-002-20250301    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250301    gcc-14.2.0
nios2                 randconfig-002-20250301    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250301    gcc-14.2.0
parisc                randconfig-002-20250301    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250301    clang-17
powerpc               randconfig-002-20250301    clang-19
powerpc               randconfig-003-20250301    clang-21
powerpc64             randconfig-001-20250301    gcc-14.2.0
powerpc64             randconfig-002-20250301    clang-21
powerpc64             randconfig-003-20250301    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250301    gcc-14.2.0
riscv                 randconfig-002-20250301    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250301    clang-15
s390                  randconfig-002-20250301    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250301    gcc-14.2.0
sh                    randconfig-002-20250301    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250301    gcc-14.2.0
sparc                 randconfig-002-20250301    gcc-14.2.0
sparc64               randconfig-001-20250301    gcc-14.2.0
sparc64               randconfig-002-20250301    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250301    gcc-12
um                    randconfig-002-20250301    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250301    clang-19
x86_64      buildonly-randconfig-002-20250301    clang-19
x86_64      buildonly-randconfig-003-20250301    gcc-11
x86_64      buildonly-randconfig-004-20250301    gcc-12
x86_64      buildonly-randconfig-005-20250301    gcc-12
x86_64      buildonly-randconfig-006-20250301    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250301    gcc-14.2.0
xtensa                randconfig-002-20250301    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

