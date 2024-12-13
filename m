Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0685BE7717F
	for <ath12k@archiver.kernel.org>; Fri, 13 Dec 2024 22:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lUFaGYFeDQv1LC7TenU4A+SQiGSkr6Hr2mgNFvZpMpk=; b=hW406reNQTJBeo8Iub7Ud5jS5l
	bKQ9M0x2IEHYNxEVH0VkVQJV/Tafx1xA05svfKroya5vsKM7OOU+2JvcWC5z2vWY5f5Yto7ThHaa+
	OM+eKbVg/YD4qPox70rvXYwkq7QMe6x1/M22ncc6Gnq0sxVYPBUMRm1DkYrq1fY8f8zXVMpyUetZy
	ITJu5SavNUtQh6Dbs0vFSuorIxbmVIfKcldrc8gZl/1pZQnkLtN4e6LN1GLxNE5KmkEA3JCF7uZ6p
	rc8YlY+2Aa+oNeOt2HUAFC1ff+OU8bdVCDSX157fsXMNRuf7VttRpyOZcFistBDcGCOE5uIUWj/eb
	AakSnr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMDpb-000000058ZU-3E0x
	for ath12k@archiver.kernel.org;
	Fri, 13 Dec 2024 22:08:19 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMDpZ-000000058Z2-0WGb
	for ath12k@lists.infradead.org;
	Fri, 13 Dec 2024 22:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734127697; x=1765663697;
  h=date:from:to:cc:subject:message-id;
  bh=afvM5Ttvw5Dso+YMsGXDifiOQaPl6rnU9CAZhIXW7D0=;
  b=X1rDe293h8m83Kna8477Qbzl8xDGIYOWocBWIoVM9JWJuXG6RD/kbRSR
   sqN5d9NZ2YuN8I6wkBKZNiwIbJ9Tsvrgg1QQH7X73N2WM9WCbzvN3j8jf
   1BLB1SIBb5U7C8bjXNomAv70LvZh1EsHgO5Wi+hK6FaK6LXuGGlzHXKga
   s5tBFRoqT/Yx9MdO9XbwzkFZyZJeQ7tA4ydKKvLW5zwUQeJwcik+zRLSl
   X6PvCvumR09jj6PIBVOr2LNJD51xnjLe5V5/hc6OAL6TEY94noyWpCrfp
   gQ2mqxwqy4WQVuZ8pHp98k5p9D7R80qX1Z7m1ec3ofv5y+zyHfzQWLGxz
   Q==;
X-CSE-ConnectionGUID: JgKb4aRBRHWZLRq0cn+kEg==
X-CSE-MsgGUID: TuI7ryeRTYiW+Z1FjSG5SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34824727"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="34824727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 14:08:12 -0800
X-CSE-ConnectionGUID: I3P74e9nRSeX4z3h/XA3Bg==
X-CSE-MsgGUID: Y/OG6zyVRhm5H5JSemclhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="101490522"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2024 14:08:11 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMDpQ-000CTb-2v;
	Fri, 13 Dec 2024 22:08:08 +0000
Date: Sat, 14 Dec 2024 06:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 83452649e29bb6a13ead022adb310893dfffb23d
Message-ID: <202412140632.Z3LmAfkZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_140817_172279_04F02540 
X-CRM114-Status: UNSURE (   3.09  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: 83452649e29bb6a13ead022adb310893dfffb23d  Add localversion-wireless-testing-ath

elapsed time: 1456m

configs tested: 73
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241213    gcc-13.2.0
arc                   randconfig-002-20241213    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241213    clang-16
arm                   randconfig-002-20241213    clang-18
arm                   randconfig-003-20241213    gcc-14.2.0
arm                   randconfig-004-20241213    clang-18
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20241213    gcc-14.2.0
arm64                 randconfig-002-20241213    gcc-14.2.0
arm64                 randconfig-003-20241213    clang-18
arm64                 randconfig-004-20241213    gcc-14.2.0
csky                  randconfig-001-20241213    gcc-14.2.0
csky                  randconfig-002-20241213    gcc-14.2.0
hexagon               randconfig-001-20241213    clang-20
hexagon               randconfig-002-20241213    clang-20
i386        buildonly-randconfig-001-20241213    clang-19
i386        buildonly-randconfig-002-20241213    gcc-12
i386        buildonly-randconfig-003-20241213    gcc-12
i386        buildonly-randconfig-004-20241213    clang-19
i386        buildonly-randconfig-005-20241213    gcc-12
i386        buildonly-randconfig-006-20241213    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20241213    gcc-14.2.0
loongarch             randconfig-002-20241213    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20241213    gcc-14.2.0
nios2                 randconfig-002-20241213    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241213    gcc-14.2.0
parisc                randconfig-002-20241213    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20241213    gcc-14.2.0
powerpc               randconfig-002-20241213    clang-20
powerpc               randconfig-003-20241213    gcc-14.2.0
powerpc64             randconfig-001-20241213    gcc-14.2.0
powerpc64             randconfig-002-20241213    gcc-14.2.0
powerpc64             randconfig-003-20241213    gcc-14.2.0
riscv                 randconfig-001-20241213    gcc-14.2.0
riscv                 randconfig-002-20241213    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241213    gcc-14.2.0
s390                  randconfig-002-20241213    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241213    gcc-14.2.0
sh                    randconfig-002-20241213    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20241213    gcc-14.2.0
sparc                 randconfig-002-20241213    gcc-14.2.0
sparc64               randconfig-001-20241213    gcc-14.2.0
sparc64               randconfig-002-20241213    gcc-14.2.0
um                    randconfig-001-20241213    gcc-12
um                    randconfig-002-20241213    clang-16
x86_64      buildonly-randconfig-001-20241213    gcc-12
x86_64      buildonly-randconfig-002-20241213    gcc-12
x86_64      buildonly-randconfig-003-20241213    gcc-12
x86_64      buildonly-randconfig-004-20241213    gcc-12
x86_64      buildonly-randconfig-005-20241213    gcc-12
x86_64      buildonly-randconfig-006-20241213    clang-19
xtensa                randconfig-001-20241213    gcc-14.2.0
xtensa                randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

