Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F23E77180
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 20:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xcftB7uiuA0I/tFM0bEZsyTZAHdfxV5w2jAWtHI2+IE=; b=pcqx+uqe7LKy13mLRPUB9ECB+u
	Rq+5BkzcWeNnCfkk7RfR3Q9GsGhZ3cpQEjNdTSOXVGrw6KI4ejmXeieDVpp+LbZX3U/IAnadfP5pV
	3kNG5x6jr1edTdW4EH6YwhHWmhTUpe4RwIt3bW7UZUDAcDwDhqpQ2yxevdc2YXnsY1pngZYTVo1sN
	eJAh3dPPJpLcI/EwlGIRbwN9ydyCR3dO/kfpEED7RI1F+8dRLGbo5dSKQ44ETa8zE+FdW2YCYdkZD
	jXdQok8qiIZ66uPVltWhpbm8igsjJr655z3X4HMAN9ycJ8k2pA0ZyC7D7vzViVWpUJ0OAbHpnxNsX
	1oyw5/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6RC-0000000Cbiy-41bq
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 20:02:30 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6RA-0000000CbiX-1i4d
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 20:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733860948; x=1765396948;
  h=date:from:to:cc:subject:message-id;
  bh=+kIYNHDiQO+4XJ6MKPp2mC0roBBoE0fJmp8aT6Kz/mc=;
  b=aD+Nngh6/vVX7LQyXg6S5B1ZLTWRSCkIsbTfHDmFhArzT/AcR7cOSeBi
   lyCq8ci+7l/eTNurd0VqXaI25lcxobZzYSjhb9rziOH+7GlpOvy6Hc2bj
   IJum0voWzwhKG5ZuoFAgi9pugrKH44TTvUrC/JZs7UrVev54v1rjhNibF
   uLDv2vFom+DMXUNNohmm03zJU21E2VruYoYlkxO3chdK5b/XOlglMPnH7
   M7RjfleP02ZB6sxUxFtD62/mYUdPBQ47JZEgEZbXmfKo3hy3OfpoRuB9J
   o3xQxotm/F1P6WZiXKL5kIA9vwWXp/w+sWJUyHmPqseA4uF0XKGRhomYC
   g==;
X-CSE-ConnectionGUID: mAkweJwGQPmnYu/cG6wjEw==
X-CSE-MsgGUID: rD3ZM+rwS0GbOeW48cOe6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38004900"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="38004900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 12:02:27 -0800
X-CSE-ConnectionGUID: xbwweMrIRKGs+fK6DsNyXA==
X-CSE-MsgGUID: G49JUHJkTEqIUK3dnz4dYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="95850637"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2024 12:02:26 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL6R5-0005uH-2k;
	Tue, 10 Dec 2024 20:02:23 +0000
Date: Wed, 11 Dec 2024 04:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 ac67423e131d511eb631422746b9c15839593a53
Message-ID: <202412110410.porLdL1O-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_120228_542213_FC832C15 
X-CRM114-Status: UNSURE (   2.97  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: ac67423e131d511eb631422746b9c15839593a53  wifi: ath12k: Decrease ath12k_mac_station_assoc() stack usage

elapsed time: 1446m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241210    gcc-13.2.0
arc                   randconfig-002-20241210    gcc-13.2.0
arc                           tb10x_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241210    clang-20
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-003-20241210    clang-20
arm                   randconfig-004-20241210    clang-20
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241210    clang-20
arm64                 randconfig-002-20241210    clang-20
arm64                 randconfig-003-20241210    clang-20
arm64                 randconfig-004-20241210    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241210    gcc-14.2.0
csky                  randconfig-002-20241210    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241210    clang-16
hexagon               randconfig-002-20241210    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-002-20241210    clang-19
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-004-20241210    clang-19
i386        buildonly-randconfig-005-20241210    clang-19
i386        buildonly-randconfig-006-20241210    clang-19
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241210    gcc-14.2.0
loongarch             randconfig-002-20241210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                            gpr_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241210    gcc-14.2.0
nios2                 randconfig-002-20241210    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241210    gcc-14.2.0
parisc                randconfig-002-20241210    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241210    clang-20
powerpc               randconfig-002-20241210    clang-20
powerpc               randconfig-003-20241210    clang-20
powerpc64             randconfig-001-20241210    gcc-14.2.0
powerpc64             randconfig-002-20241210    gcc-14.2.0
powerpc64             randconfig-003-20241210    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241210    clang-19
riscv                 randconfig-002-20241210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241210    gcc-14.2.0
s390                  randconfig-002-20241210    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241210    gcc-14.2.0
sh                    randconfig-002-20241210    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241210    gcc-14.2.0
sparc                 randconfig-002-20241210    gcc-14.2.0
sparc64               randconfig-001-20241210    gcc-14.2.0
sparc64               randconfig-002-20241210    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241210    clang-20
um                    randconfig-002-20241210    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241210    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-004-20241210    gcc-12
x86_64      buildonly-randconfig-005-20241210    gcc-12
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241210    gcc-14.2.0
xtensa                randconfig-002-20241210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

