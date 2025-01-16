Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91E8C02180
	for <ath12k@archiver.kernel.org>; Thu, 16 Jan 2025 02:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6SENqzsDc28kIrLc+7Tq9aYfp+qb6Kc+mUJ+IN4RIGg=; b=0TS0OdvtMOE4ggXwWf8E1CYiyX
	GHbWRMEeb0pHt2mW+MAt+5IuGIHdwTPrTheOPjowiCfKHWQXSf8Aa7hqzCdC97QQpJwhgW0oT0Mlg
	rDGKxDP2ONkCuWPCi3rJOHpEgbo+IC+Xxr/KrrH3ZAI1NGbfJGHikHsag83z5MCrtaBM/DBNA2M6n
	WRuCxHlur30K1ZWCxe+UpQyEGHHUKJQfK/99EV6ZYZNWtPYsOnJnQr+ybMbWDzL1O66TRWac9g+4s
	47eQacGMpZZ7sDKyCw+igqtp4Y9v7RZx9BNT/B+Ik00mCKMr43X61DrgySql+gEUT6999f6dNceuq
	gsk+kzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFdH-0000000DdzZ-2AGU
	for ath12k@archiver.kernel.org;
	Thu, 16 Jan 2025 02:29:19 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFdE-0000000DdzE-2or1
	for ath12k@lists.infradead.org;
	Thu, 16 Jan 2025 02:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736994557; x=1768530557;
  h=date:from:to:cc:subject:message-id;
  bh=k0xp2VJJO3xQXbyZfcSBSkmSH2HGN1ic7wq/Y6ffMU8=;
  b=Sy/7pRsb/mRpMe3D7gabhO1qrkAqNjZo0YzT8l8/Ds+xKEcFlNyQGeLL
   PUltvCEDFUMrnK8q4MDEx8mOeFt4UYYRLvcvS5ngMGi1hhGQaDOgpvJAm
   qhNnpIYYSK3tbjOipOBPDkVw5u+FK4mW0ORBCVPxWAl9vXcdjmIVUIInW
   IYXpHMKWYJMnHrjXYXGJyYHyccGESLWXsHrUliQMOuL4MdVbT9rI7f0pq
   oP+yI+lqDgrT5B57fNDSCjDxspdmUDT8brRSjOYsG2TklUtUTPpbAZ91q
   +ITJSQuMDyS1Tj73sWKSDrTUEm/dZOZFruc5Ag6yij8bZQPtML4K2YG9u
   g==;
X-CSE-ConnectionGUID: tK+LhSfDTgyNz13LGoDu0w==
X-CSE-MsgGUID: 932cS3W2S+ScBXiGZ75JZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="62727285"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="62727285"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 18:29:17 -0800
X-CSE-ConnectionGUID: wteHKbj5RWmQiWegOwHe5w==
X-CSE-MsgGUID: LW0A2tK9QqisDW2xYBcm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="105252349"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jan 2025 18:29:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYFdB-000R9b-0d;
	Thu, 16 Jan 2025 02:29:13 +0000
Date: Thu, 16 Jan 2025 10:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 49789786474446dc14271e1aa0f3b15277d1470b
Message-ID: <202501161019.GeHUA9dY-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_182916_722723_8F5FD6A7 
X-CRM114-Status: UNSURE (   3.89  )
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
branch HEAD: 49789786474446dc14271e1aa0f3b15277d1470b  wifi: ath12k: Enable monitor ring mask for QCN9274

elapsed time: 1451m

configs tested: 83
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20250115    gcc-13.2.0
arc                   randconfig-002-20250115    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                   randconfig-001-20250115    clang-16
arm                   randconfig-002-20250115    clang-20
arm                   randconfig-003-20250115    clang-20
arm                   randconfig-004-20250115    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250115    clang-20
arm64                 randconfig-002-20250115    gcc-14.2.0
arm64                 randconfig-003-20250115    clang-18
arm64                 randconfig-004-20250115    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250115    gcc-14.2.0
csky                  randconfig-002-20250115    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250115    clang-20
hexagon               randconfig-002-20250115    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250115    clang-19
i386        buildonly-randconfig-002-20250115    gcc-12
i386        buildonly-randconfig-003-20250115    gcc-12
i386        buildonly-randconfig-004-20250115    gcc-12
i386        buildonly-randconfig-005-20250115    gcc-12
i386        buildonly-randconfig-006-20250115    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250115    gcc-14.2.0
loongarch             randconfig-002-20250115    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250115    gcc-14.2.0
nios2                 randconfig-002-20250115    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250115    gcc-14.2.0
parisc                randconfig-002-20250115    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250115    gcc-14.2.0
powerpc               randconfig-002-20250115    gcc-14.2.0
powerpc               randconfig-003-20250115    gcc-14.2.0
powerpc64             randconfig-001-20250115    gcc-14.2.0
powerpc64             randconfig-002-20250115    gcc-14.2.0
powerpc64             randconfig-003-20250115    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250115    gcc-14.2.0
riscv                 randconfig-002-20250115    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250115    clang-20
s390                  randconfig-002-20250115    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250115    gcc-14.2.0
sh                    randconfig-002-20250115    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250115    gcc-14.2.0
sparc                 randconfig-002-20250115    gcc-14.2.0
sparc64               randconfig-001-20250115    gcc-14.2.0
sparc64               randconfig-002-20250115    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250115    clang-18
um                    randconfig-002-20250115    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250115    gcc-12
x86_64      buildonly-randconfig-002-20250115    gcc-12
x86_64      buildonly-randconfig-003-20250115    clang-19
x86_64      buildonly-randconfig-004-20250115    clang-19
x86_64      buildonly-randconfig-005-20250115    gcc-12
x86_64      buildonly-randconfig-006-20250115    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250115    gcc-14.2.0
xtensa                randconfig-002-20250115    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

