Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DCBCAC580
	for <ath12k@archiver.kernel.org>; Thu,  4 Sep 2025 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qI9qVjplfFjx0Hp+oF33iXWyL8kgT9ll0GVosXf4XVw=; b=d21wtIWwyQ9xiubfS9ptNKQI5D
	LItCyKG0sZ2rHYsB0Dvj26trVeJWzAWumPg40LnEkWVtIbS56MGGAR/fngW4ckx0pABwhLLYTO8xs
	qShBuq7JrTcfnjtcPKsE7vTbOqNAIg2Xd+xbscACuBwS37N11q5s5u3aTcxgWpvAueyqmXR6fogS6
	c/d61oYgG6PxoY+7JCHCEmjo2Q5mOgoYSXz7l/IuCXoRGIi4BimmbMtmbCEwUfwt1YUkUrdRUb7t9
	/D73y94sJGAzWDerwAma8T6sas6sVN4i7FxXS+fAgHug/YdkhlP9aX1QUgwyQ07tnbd/TkAqKOHSe
	HANUpGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGc2-0000000EGfC-3HaV;
	Thu, 04 Sep 2025 20:31:18 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuESr-0000000DV2g-44iG
	for ath12k@lists.infradead.org;
	Thu, 04 Sep 2025 18:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757009622; x=1788545622;
  h=date:from:to:cc:subject:message-id;
  bh=VP5i4LTc5ybXU4BZJGSNjyxuzV4/2X7LNX58TwIW3lo=;
  b=fw2Ei73jGUo0TpurzdnL2sm8klzKgM1WB3OlcWeCKGK27uFipwfp6PkC
   7AoeQYcmdwyUmvSM22wkcGOCHW1uFQbOV1UDm8OamMuRLnBYddRDu4mLD
   aW0boV2F7bB2kH9qp0a+BM7SySwA8ng1ciy5jT33E7DeXsTk8P4xcHBVY
   QHF2sPTs54rP99pKNoxEAMfk0DQEOhzzIVKkVIfDunMCzQhWPAtMQj54V
   Sd2eVZTE+K9JT65MDWfKnDU0BbN7Nbnd+Ky3t3Pv2+VrRXIwwY1n6YBKc
   fcqsLjmkLT1P795nsWK44ko2h5RhCb8B5LlkpjAM4An59wjsQVmnT9k94
   A==;
X-CSE-ConnectionGUID: 0wQr/HQmSnKmQSixwyWjIw==
X-CSE-MsgGUID: iFtc1Z4QTp2tReG9sZXqkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59311047"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59311047"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 11:13:37 -0700
X-CSE-ConnectionGUID: L1o5wNjuQTebrattjsUg6Q==
X-CSE-MsgGUID: G9sROA9YQaifcunHXi8o7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="172775429"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Sep 2025 11:13:35 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuESH-0005bN-2P;
	Thu, 04 Sep 2025 18:13:23 +0000
Date: Fri, 05 Sep 2025 02:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 d637c58a29475d646f8decfbbc1d27fae999a449
Message-ID: <202509050202.I0EiuA87-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_111342_079620_BB704510 
X-CRM114-Status: UNSURE (   4.28  )
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
branch HEAD: d637c58a29475d646f8decfbbc1d27fae999a449  wifi: ath12k: Move HTT specific code from dp.c to newly introduced files

elapsed time: 1496m

configs tested: 118
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250904    gcc-9.5.0
arc                   randconfig-002-20250904    gcc-11.5.0
arm                   randconfig-001-20250904    gcc-10.5.0
arm                   randconfig-002-20250904    gcc-13.4.0
arm                   randconfig-003-20250904    gcc-8.5.0
arm                   randconfig-004-20250904    gcc-13.4.0
arm64                 randconfig-001-20250904    gcc-8.5.0
arm64                 randconfig-002-20250904    gcc-8.5.0
arm64                 randconfig-003-20250904    clang-22
arm64                 randconfig-004-20250904    gcc-8.5.0
csky                  randconfig-001-20250904    gcc-15.1.0
csky                  randconfig-002-20250904    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250904    clang-22
hexagon               randconfig-002-20250904    clang-20
i386        buildonly-randconfig-001-20250904    clang-20
i386        buildonly-randconfig-002-20250904    clang-20
i386        buildonly-randconfig-002-20250904    gcc-12
i386        buildonly-randconfig-003-20250904    clang-20
i386        buildonly-randconfig-003-20250904    gcc-13
i386        buildonly-randconfig-004-20250904    clang-20
i386        buildonly-randconfig-004-20250904    gcc-13
i386        buildonly-randconfig-005-20250904    clang-20
i386        buildonly-randconfig-006-20250904    clang-20
i386                  randconfig-001-20250904    gcc-11
i386                  randconfig-002-20250904    gcc-11
i386                  randconfig-003-20250904    gcc-11
i386                  randconfig-004-20250904    gcc-11
i386                  randconfig-005-20250904    gcc-11
i386                  randconfig-006-20250904    gcc-11
i386                  randconfig-007-20250904    gcc-11
loongarch                        allmodconfig    clang-19
loongarch             randconfig-001-20250904    gcc-15.1.0
loongarch             randconfig-002-20250904    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250904    gcc-11.5.0
nios2                 randconfig-002-20250904    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250904    gcc-8.5.0
parisc                randconfig-002-20250904    gcc-11.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250904    clang-19
powerpc               randconfig-002-20250904    gcc-13.4.0
powerpc               randconfig-003-20250904    clang-22
powerpc                     tqm8548_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250904    gcc-15.1.0
powerpc64             randconfig-002-20250904    clang-22
powerpc64             randconfig-003-20250904    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250904    gcc-12.5.0
riscv                 randconfig-001-20250904    gcc-8.5.0
riscv                 randconfig-002-20250904    clang-22
riscv                 randconfig-002-20250904    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250904    gcc-10.5.0
s390                  randconfig-001-20250904    gcc-12.5.0
s390                  randconfig-002-20250904    gcc-12.5.0
s390                  randconfig-002-20250904    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                    randconfig-001-20250904    gcc-12.5.0
sh                    randconfig-002-20250904    gcc-10.5.0
sh                    randconfig-002-20250904    gcc-12.5.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250904    gcc-11.5.0
sparc                 randconfig-001-20250904    gcc-12.5.0
sparc                 randconfig-002-20250904    gcc-12.5.0
sparc                 randconfig-002-20250904    gcc-15.1.0
sparc64               randconfig-001-20250904    gcc-12.5.0
sparc64               randconfig-002-20250904    clang-20
sparc64               randconfig-002-20250904    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250904    gcc-12.5.0
um                    randconfig-001-20250904    gcc-13
um                    randconfig-002-20250904    clang-22
um                    randconfig-002-20250904    gcc-12.5.0
x86_64      buildonly-randconfig-001-20250904    gcc-12
x86_64      buildonly-randconfig-002-20250904    clang-20
x86_64      buildonly-randconfig-003-20250904    gcc-13
x86_64      buildonly-randconfig-004-20250904    gcc-13
x86_64      buildonly-randconfig-005-20250904    gcc-13
x86_64      buildonly-randconfig-006-20250904    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250904    gcc-10.5.0
xtensa                randconfig-001-20250904    gcc-12.5.0
xtensa                randconfig-002-20250904    gcc-11.5.0
xtensa                randconfig-002-20250904    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

