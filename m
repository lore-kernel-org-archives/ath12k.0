Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA419C02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 12:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kj1Y/kGpbyaz8pBM2/ZnqBOyFd8NpsWMEnC4OgalZlU=; b=od6RZHcxeW3XLiG6FiVHm+mG3/
	Y2qaKFcdRANxDlQNbpFF3FU8i9ftX/uLZL8YAYmqsRyCc53T78wQJwdfYbanU/fnHdw5/DM8qc2LL
	nHv8GyiK+auURxfVRY8HPx9LcHsmGK7aFEsXCTDnwaxzjxF2qkS+8pHKOGMWIYz2J3VF9ZdEnMJ6P
	axom+yyCblu6fT5b6Rb2ntTsotfnUy5Y1XMJr8lVeSS9/fA2fr5WvsNU+GM1By1uEZX8sBHmIw4wA
	jfyQlOojKDI0p53JqnQmX1eZfwk/RZw7OKBeV8tEnken4J4PAMYa+Q2ICo+J+hYDQVN4yu3uHsLNw
	HokI3suQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tawdF-0000000CTW9-1tvc
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 12:48:25 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tawdC-0000000CTVq-22yz
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 12:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737636503; x=1769172503;
  h=date:from:to:cc:subject:message-id;
  bh=0esQwYTgpqL/wWSzD5tQ78w3NQkALep7Av3szJohWSA=;
  b=OWLFPm/Zh3oBtzD0J2tKYQuCDrfxFk0B6u0RForbJwHM/6A2r6tegrfB
   /9NPIxVMQsDviLp8wFdVM5YLJ13VXKZXVruNwlFvSIV5m0Ln906on5/39
   ySo7uZB1/O2uo3VnkUcV/lhdoo49UGqmyu6zc9hfJ0GPYTJISfYTYXRzr
   ks5ZpGEuYwDb71hcWgf+Pp5Iyz8oK8nBawOCQ7Hh/WVvqUF1zQ5Vo7eaN
   56MSuCUXdI3/1pgQWAMQSXZjPleXlXD2ldRH6SSYE5pjh7wZl/G9OZFk9
   PFs0sY/+e5DkVZ+4Q7QzPhvP8K0mv1xnYncYtJNTcITMUGGLNbY9M+1iH
   g==;
X-CSE-ConnectionGUID: Aw6SRoJUSkyTb9KG7khYug==
X-CSE-MsgGUID: RyxSW6pzQ3Oo5aSRsyYIiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41886865"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="41886865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 04:48:22 -0800
X-CSE-ConnectionGUID: 5Om4mCoqR1235ypneyn+VA==
X-CSE-MsgGUID: hfCrbm2VRfeD6HZIShjdNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107368648"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jan 2025 04:48:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tawd7-000bBX-2M;
	Thu, 23 Jan 2025 12:48:17 +0000
Date: Thu, 23 Jan 2025 20:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 c4e4e37afc8b8d178b0f00f607c30b3b81253597
Message-ID: <202501232025.F40uZiYC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_044822_578948_1CCC9118 
X-CRM114-Status: UNSURE (   3.34  )
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
branch HEAD: c4e4e37afc8b8d178b0f00f607c30b3b81253597  Add localversion-wireless-testing-ath

elapsed time: 998m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250123    gcc-13.2.0
arc                   randconfig-002-20250123    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250123    clang-20
arm                   randconfig-002-20250123    gcc-14.2.0
arm                   randconfig-003-20250123    gcc-14.2.0
arm                   randconfig-004-20250123    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250123    gcc-14.2.0
arm64                 randconfig-002-20250123    clang-20
arm64                 randconfig-003-20250123    clang-20
arm64                 randconfig-004-20250123    clang-16
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250123    gcc-14.2.0
csky                  randconfig-002-20250123    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250123    clang-20
hexagon               randconfig-002-20250123    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250123    gcc-12
i386        buildonly-randconfig-002-20250123    clang-19
i386        buildonly-randconfig-003-20250123    gcc-12
i386        buildonly-randconfig-004-20250123    clang-19
i386        buildonly-randconfig-005-20250123    gcc-12
i386        buildonly-randconfig-006-20250123    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250123    gcc-14.2.0
loongarch             randconfig-002-20250123    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250123    gcc-14.2.0
nios2                 randconfig-002-20250123    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250123    gcc-14.2.0
parisc                randconfig-002-20250123    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250123    gcc-14.2.0
powerpc               randconfig-002-20250123    clang-18
powerpc               randconfig-003-20250123    gcc-14.2.0
powerpc64             randconfig-001-20250123    gcc-14.2.0
powerpc64             randconfig-002-20250123    clang-16
powerpc64             randconfig-003-20250123    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250123    gcc-14.2.0
riscv                 randconfig-002-20250123    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250123    gcc-14.2.0
s390                  randconfig-002-20250123    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250123    gcc-14.2.0
sh                    randconfig-002-20250123    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250123    gcc-14.2.0
sparc                 randconfig-002-20250123    gcc-14.2.0
sparc64               randconfig-001-20250123    gcc-14.2.0
sparc64               randconfig-002-20250123    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250123    gcc-12
um                    randconfig-002-20250123    gcc-11
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250123    clang-19
x86_64      buildonly-randconfig-002-20250123    clang-19
x86_64      buildonly-randconfig-003-20250123    gcc-12
x86_64      buildonly-randconfig-004-20250123    gcc-12
x86_64      buildonly-randconfig-005-20250123    clang-19
x86_64      buildonly-randconfig-006-20250123    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250123    gcc-14.2.0
xtensa                randconfig-002-20250123    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

