Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C33C282EC
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 00:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J13WA7Xrg6t/vxVRZW4ZNxlP6uPGB7x5ue5mBVQIeUA=; b=TPcqKxe2VXGa6C/AEKASOnuu6u
	nHxAa9koAEnhCOji28ifgPY7glTW7Z4h/8hA4TkO+JBO2WBQ3M465VtOkEV4y5zHIq8fRbZvkIKL3
	bvv7uHYcfUZnBE+p7jZlyLdAeVtvSc02XAyHrk/VP0oeUPqUo3X3SPlPS84k6gqqJ6pTDmXNNfpPV
	ofzyvA8r+89xbsWMC6UewXihuTGh13zy5Gi/gf184iJHjQ/sPqGLel02o9mCfBwuXEXkFIoaNW44t
	MvJRM3Q3+B/cEtqYgQQLXxy+RMyjdWpVbLKg6PxgTgDNan5mvhmWFCGHoBz0T3g0ejL3QDzJPIx5f
	/WrG+C/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuh9A-00000007WpZ-3SRF
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 00:19:00 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuh98-00000007Wmr-0Yg1
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 00:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742343538; x=1773879538;
  h=date:from:to:cc:subject:message-id;
  bh=JZ6Rzlfxiz6jrdSfUEgMeoLGBQQ+3uoMpkdCz44hdnI=;
  b=Z/Z/huLJePDcN5m0ocXuFyoIUGA07oeKEELj56fPL1K7CZR3x+/coYsX
   i3x1UIo8DkH/Gh3MNpatCli+SFJLdu199MKj6F8RwY95qL8Fm5pcLv29M
   QMTxE2vBRbGWTeGzjwjK+Ts4bGO9IySJjUhvPG7g5x1mBpXrEbCOtMmm/
   JFhlP/0We/YysGN/LFuR4ry7w8u7yL2d/tSv6VHaSI6/koS3h86B6TJu4
   uYUyzbJIJK5A3iSnfeyOY5iQoqD4mi2hd6kYJJWL2f6x1rGPCQ93/rGVW
   UCXrP/eiK9qCqu8XNm1STYIgd/nkFh7EXyyTUjMIyq8/sxWeM8VQFMZrD
   A==;
X-CSE-ConnectionGUID: PZ4rLGtrQXGK9lHPgR6+gg==
X-CSE-MsgGUID: Pi1l8xz6S3uvMRJFqHarBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="46272896"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="46272896"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 17:18:52 -0700
X-CSE-ConnectionGUID: BAtL8vKhT+mn4AY7LmCk1Q==
X-CSE-MsgGUID: peEIdhUuT72XZVlYQ6SWQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122901655"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 17:18:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuh8z-000EFV-1d;
	Wed, 19 Mar 2025 00:18:49 +0000
Date: Wed, 19 Mar 2025 08:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 47c91531edd2a552a8131414e4bdb0654277ad6a
Message-ID: <202503190850.0B7p7dbB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_171858_184424_74C56C23 
X-CRM114-Status: UNSURE (   4.09  )
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
branch HEAD: 47c91531edd2a552a8131414e4bdb0654277ad6a  wifi: ath12k: remove open parenthesis

elapsed time: 1457m

configs tested: 117
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-9.3.0
arc                              alldefconfig    gcc-8.5.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.3.0
arc                              allyesconfig    gcc-10.5.0
arc                   randconfig-001-20250318    gcc-13.2.0
arc                   randconfig-002-20250318    gcc-13.2.0
arm                              allmodconfig    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-12.4.0
arm                      footbridge_defconfig    clang-17
arm                   randconfig-001-20250318    gcc-14.2.0
arm                   randconfig-002-20250318    clang-21
arm                   randconfig-003-20250318    gcc-14.2.0
arm                   randconfig-004-20250318    clang-21
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-8.5.0
arm64                 randconfig-001-20250318    clang-21
arm64                 randconfig-002-20250318    clang-14
arm64                 randconfig-003-20250318    gcc-14.2.0
arm64                 randconfig-004-20250318    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250318    gcc-14.2.0
csky                  randconfig-002-20250318    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250318    clang-21
hexagon               randconfig-002-20250318    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250318    clang-20
i386        buildonly-randconfig-002-20250318    clang-20
i386        buildonly-randconfig-003-20250318    clang-20
i386        buildonly-randconfig-004-20250318    clang-20
i386        buildonly-randconfig-005-20250318    clang-20
i386        buildonly-randconfig-006-20250318    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250318    gcc-14.2.0
loongarch             randconfig-002-20250318    gcc-14.2.0
m68k                             allmodconfig    gcc-8.5.0
m68k                              allnoconfig    gcc-5.5.0
m68k                             allyesconfig    gcc-6.5.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-11.5.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-11.5.0
mips                              allnoconfig    gcc-14.2.0
mips                  decstation_64_defconfig    gcc-9.3.0
mips                       rbtx49xx_defconfig    gcc-12.3.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250318    gcc-14.2.0
nios2                 randconfig-002-20250318    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-5.5.0
parisc                            allnoconfig    gcc-5.5.0
parisc                           allyesconfig    gcc-9.3.0
parisc                randconfig-001-20250318    gcc-14.2.0
parisc                randconfig-002-20250318    gcc-14.2.0
powerpc                          allmodconfig    gcc-10.5.0
powerpc                           allnoconfig    gcc-8.5.0
powerpc                          allyesconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc               randconfig-001-20250318    clang-21
powerpc               randconfig-002-20250318    clang-21
powerpc               randconfig-003-20250318    gcc-14.2.0
powerpc64             randconfig-001-20250318    clang-21
powerpc64             randconfig-002-20250318    gcc-14.2.0
powerpc64             randconfig-003-20250318    gcc-14.2.0
powerpc64             randconfig-003-20250318    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-7.5.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250318    clang-21
riscv                 randconfig-002-20250318    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250318    clang-15
s390                  randconfig-002-20250318    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-10.5.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250318    gcc-14.2.0
sh                    randconfig-002-20250318    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-6.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-6.5.0
sparc                 randconfig-001-20250318    gcc-14.2.0
sparc                 randconfig-002-20250318    gcc-14.2.0
sparc64               randconfig-001-20250318    gcc-14.2.0
sparc64               randconfig-002-20250318    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250318    clang-21
um                    randconfig-002-20250318    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250318    clang-20
x86_64      buildonly-randconfig-002-20250318    clang-20
x86_64      buildonly-randconfig-003-20250318    clang-20
x86_64      buildonly-randconfig-004-20250318    clang-20
x86_64      buildonly-randconfig-005-20250318    gcc-12
x86_64      buildonly-randconfig-006-20250318    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250318    gcc-14.2.0
xtensa                randconfig-002-20250318    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

