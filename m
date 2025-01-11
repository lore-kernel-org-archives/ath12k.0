Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8155AE7719A
	for <ath12k@archiver.kernel.org>; Sat, 11 Jan 2025 23:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=at1xxeNuPDqFU3ovsYVpdDXdCHp9cOhB4H4nGSP2s1g=; b=Bb/kAyBEJN9S+2+pG3Mh2baNHM
	ma84Nt2qpzTXsDWJlHA5j0ly53LjpPyDh5pZQF2e/oe2HGRQkKF1htNXb4al47WROFBID28GV4G4s
	fGRJdQ+0vfs76Zw4R9PNjL2vh1VO1YuA703CQeeOg+4Lrq1Ohwt3Z9FsdxRrO0bf1N9PWp8VpA4iu
	GYTl6d0tVbx+PiOC/JHfho3Ovr2dMxVl6jVt7gvU1v+KPMRQuvNs++4p89u0QFtd2VYFVICCFyKmN
	PVLcA9ki9q3cIjfooOxh0YlERk9PESQu8g0WNmB7k7nt0+9G6IkvVb6jru/CF9ESKv9PGxE4VEH57
	AH60MnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWkmy-00000001eME-0bMs
	for ath12k@archiver.kernel.org;
	Sat, 11 Jan 2025 23:21:08 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWkmu-00000001eLY-3PK7
	for ath12k@lists.infradead.org;
	Sat, 11 Jan 2025 23:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736637664; x=1768173664;
  h=date:from:to:cc:subject:message-id;
  bh=GZ68xTF0y56perb3nKAlqs6LtHVrQHnxmQ3r3k77E9E=;
  b=dp6Q/9mNEoCkuXyGnuFE/o7T4QzJyL//1JPcF9Ps+7LMc/fNgCuJbA9j
   UQa2BgNvkI/Cung+bwdoEExBCHdWQACkQfs/7M3hrqUJNfCtCifUO3lUH
   X0pXarLP0bNbAlmSBBL6vf73kXAXh24HfaVA84+uiwHFIj9IdrRHAtFWb
   t5oFq60KGvxjS/RJa8cybQ8fVBPPXdn+Wc32+tMBVRzlPkm/NWbBtPUh8
   x+J2WGEGg/HACfm67MQ5su24Bag7eb6JsxRfHIhDa6UrQ8oiuOttLZ2D4
   flfoq0gXM/zXhgmy5l5/zubJJLYxzkjRuOjtq/6hPean6tQ2MK/iQu/SX
   w==;
X-CSE-ConnectionGUID: 745c6ClBSH6f8RWQfzPbIA==
X-CSE-MsgGUID: dCtrZqwvR3qBJN3rYrojvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36789997"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36789997"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 15:21:01 -0800
X-CSE-ConnectionGUID: M4OE6XloSoKnjpwApOa7bQ==
X-CSE-MsgGUID: QNyXP2BKTHG/9khijqP3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="108967533"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jan 2025 15:21:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWkmn-000LJn-13;
	Sat, 11 Jan 2025 23:20:57 +0000
Date: Sun, 12 Jan 2025 07:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 a72eaa175656836a32e94004ea05598409e2f2fd
Message-ID: <202501120740.VKB1Wc6y-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_152104_900645_C2617A6D 
X-CRM114-Status: UNSURE (   4.22  )
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
branch HEAD: a72eaa175656836a32e94004ea05598409e2f2fd  wifi: ath9k: cleanup ath9k_hw_get_nf_hist_mid()

elapsed time: 1450m

configs tested: 70
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                              allnoconfig    gcc-13.2.0
arc                  randconfig-001-20250111    gcc-13.2.0
arc                  randconfig-002-20250111    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                  randconfig-001-20250111    clang-16
arm                  randconfig-002-20250111    gcc-14.2.0
arm                  randconfig-003-20250111    clang-20
arm                  randconfig-004-20250111    clang-20
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250111    gcc-14.2.0
arm64                randconfig-002-20250111    clang-20
arm64                randconfig-003-20250111    clang-18
arm64                randconfig-004-20250111    clang-16
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250111    gcc-14.2.0
csky                 randconfig-002-20250111    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20250111    clang-20
hexagon              randconfig-002-20250111    clang-15
i386       buildonly-randconfig-001-20250111    gcc-12
i386       buildonly-randconfig-002-20250111    gcc-11
i386       buildonly-randconfig-003-20250111    gcc-12
i386       buildonly-randconfig-004-20250111    gcc-12
i386       buildonly-randconfig-005-20250111    gcc-12
i386       buildonly-randconfig-006-20250111    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250111    gcc-14.2.0
loongarch            randconfig-002-20250111    gcc-14.2.0
nios2                randconfig-001-20250111    gcc-14.2.0
nios2                randconfig-002-20250111    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250111    gcc-14.2.0
parisc               randconfig-002-20250111    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250111    gcc-14.2.0
powerpc              randconfig-002-20250111    gcc-14.2.0
powerpc              randconfig-003-20250111    gcc-14.2.0
powerpc64            randconfig-001-20250111    gcc-14.2.0
powerpc64            randconfig-002-20250111    gcc-14.2.0
powerpc64            randconfig-003-20250111    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250112    clang-20
riscv                randconfig-002-20250112    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250112    clang-16
s390                 randconfig-002-20250112    clang-18
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250112    gcc-14.2.0
sh                   randconfig-002-20250112    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250112    gcc-14.2.0
sparc                randconfig-002-20250112    gcc-14.2.0
sparc64              randconfig-001-20250112    gcc-14.2.0
sparc64              randconfig-002-20250112    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20250112    clang-20
um                   randconfig-002-20250112    clang-20
x86_64     buildonly-randconfig-001-20250111    clang-19
x86_64     buildonly-randconfig-002-20250111    gcc-12
x86_64     buildonly-randconfig-003-20250111    gcc-12
x86_64     buildonly-randconfig-004-20250111    clang-19
x86_64     buildonly-randconfig-005-20250111    gcc-12
x86_64     buildonly-randconfig-006-20250111    gcc-12
xtensa               randconfig-001-20250112    gcc-14.2.0
xtensa               randconfig-002-20250112    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

