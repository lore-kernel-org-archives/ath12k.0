Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16019C197BF
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jBrVLG/Y550kcZDux4xF4KoXw0GPXz+dHvc8J1EJ+Hc=; b=R03TBKV+ygLR64dTUmYC1sVngV
	JL9Pxq7VaHpkQdOrtda6RJz7InL5tPP/A839pmWNMKA/MXE+entCVpqMrXq18Qeq1N7o3V9k//kWz
	sa0msskobuvI+zNzFq0X7FbrVEiu3dA3spx1/u7u0RvPeOZ+EqtD2RLIMxSfeizMqNQnkRz0IAPoG
	BGLchWtjkenM7JK2yALgpWj2xYI/yR1b7zow/BcQlOHM2pQKffCQGlCYm0HT8sFX5VAbUVaCQzBLM
	dz8QxWKV51r3Jht/fDQwXxMsOsuKenEDSFFhRjm3AkQ0kkrD8WTLAlf1RXXoAHYDHj4AiEdeQpbdm
	lJAwyXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjnc-00000008fYH-38hc
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 19:44:00 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjab-00000008Sdn-249h
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 19:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740684634; x=1772220634;
  h=date:from:to:cc:subject:message-id;
  bh=/2QSohyTWYSBIJ/gAa1YcmTfitxgdeFJ18iE52im/AI=;
  b=cjYETznLykm8zOOtxd096JY7FtNK8bP7FFdgx4SxpHAyAOHnifLNQM15
   94n2prwttLv0JxGpy8WzJi0aWiAJ7QD5yA5j8K96zI5TgY8uex5SZMm1D
   DcZN/hOJky2d+IlujW48YwJ24eQLdIQFdfU5inuB73djdELBZ8fFgqOY7
   Pj/8KGjqR2li4l8ScTeUIF5b9ybt/DtrPX9ffHMAfmNw6RhVPrLnSjtAX
   fELh/E7w7vGMxpsNfGJqWvacRQIEjUdCEo0YqpW8Jvh36YSZ5MWtKgPLH
   UAIGNWzy+Hk2Q3PJ+XOE1cTfUI8f/J+vJlFljPOVFN5EcdX3va857RfkQ
   w==;
X-CSE-ConnectionGUID: oJPcvnyXRDKz9MmSVUMkWg==
X-CSE-MsgGUID: bTdNCuI6TQuOwVFUGeQAGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45245013"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="45245013"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 11:30:30 -0800
X-CSE-ConnectionGUID: dvsVMWgzRLuO97+I+kXXkg==
X-CSE-MsgGUID: PirUqtDvTT6qFNmaKEFPBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="121710829"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2025 11:30:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnjaU-000Dwc-1g;
	Thu, 27 Feb 2025 19:30:26 +0000
Date: Fri, 28 Feb 2025 03:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-split-phy] BUILD SUCCESS
 78624d0485c9d5bf02f08867389bf945885893d8
Message-ID: <202502280323.4X6bpTsz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_113034_325603_058A2474 
X-CRM114-Status: UNSURE (   3.58  )
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
branch HEAD: 78624d0485c9d5bf02f08867389bf945885893d8  wifi: ath12k: ath12k: Fix get peer from peer id instead of ast index

Warning ids grouped by kconfigs:

recent_errors
`-- um-allmodconfig
    `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here

elapsed time: 1451m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250227    gcc-13.2.0
arc                   randconfig-002-20250227    gcc-13.2.0
arm                   randconfig-001-20250227    gcc-14.2.0
arm                   randconfig-002-20250227    clang-17
arm                   randconfig-003-20250227    gcc-14.2.0
arm                   randconfig-004-20250227    clang-21
arm64                 randconfig-001-20250227    gcc-14.2.0
arm64                 randconfig-002-20250227    clang-19
arm64                 randconfig-003-20250227    gcc-14.2.0
arm64                 randconfig-004-20250227    gcc-14.2.0
csky                  randconfig-001-20250227    gcc-14.2.0
csky                  randconfig-002-20250227    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250227    clang-14
hexagon               randconfig-002-20250227    clang-16
i386        buildonly-randconfig-001-20250227    gcc-12
i386        buildonly-randconfig-002-20250227    gcc-11
i386        buildonly-randconfig-003-20250227    clang-19
i386        buildonly-randconfig-004-20250227    gcc-12
i386        buildonly-randconfig-005-20250227    gcc-11
i386        buildonly-randconfig-006-20250227    clang-19
loongarch             randconfig-001-20250227    gcc-14.2.0
loongarch             randconfig-002-20250227    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250227    gcc-14.2.0
nios2                 randconfig-002-20250227    gcc-14.2.0
parisc                randconfig-001-20250227    gcc-14.2.0
parisc                randconfig-002-20250227    gcc-14.2.0
powerpc               randconfig-001-20250227    clang-19
powerpc               randconfig-002-20250227    gcc-14.2.0
powerpc               randconfig-003-20250227    clang-19
powerpc64             randconfig-001-20250227    clang-17
powerpc64             randconfig-002-20250227    clang-21
powerpc64             randconfig-003-20250227    gcc-14.2.0
riscv                 randconfig-001-20250227    gcc-14.2.0
riscv                 randconfig-002-20250227    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250227    clang-18
s390                  randconfig-002-20250227    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250227    gcc-14.2.0
sh                    randconfig-002-20250227    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250227    gcc-14.2.0
sparc                 randconfig-002-20250227    gcc-14.2.0
sparc64               randconfig-001-20250227    gcc-14.2.0
sparc64               randconfig-002-20250227    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250227    clang-17
um                    randconfig-002-20250227    gcc-12
x86_64      buildonly-randconfig-001-20250227    clang-19
x86_64      buildonly-randconfig-002-20250227    clang-19
x86_64      buildonly-randconfig-003-20250227    gcc-12
x86_64      buildonly-randconfig-004-20250227    gcc-12
x86_64      buildonly-randconfig-005-20250227    clang-19
x86_64      buildonly-randconfig-006-20250227    gcc-12
xtensa                randconfig-001-20250227    gcc-14.2.0
xtensa                randconfig-002-20250227    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

