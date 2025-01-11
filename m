Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B393E7719A
	for <ath12k@archiver.kernel.org>; Sat, 11 Jan 2025 23:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eZY6F7wk3iPye1ukCzwxH4BMIo5MHd+ZDo54i8Ui0/4=; b=k7Vga/aPjiWHBgzZ7RGWxdXTH/
	pwDyxtYv/6pZ3bYlLdrqYsgNTo54ECyLPyL/RRQRHB+bCJkglRM/cZ9xnZQKuDq92HD1HNt4G1Zxr
	MAGWkwcZELJqn4sdWfhbEpPCJoLjOAWYaeXJUfmqVZ15ncLf1UxP6O8lY8ongdu4TtmT7314INi0e
	QgQ0NtyAuckWOoxLcYFTaL1yyQUg49iUdjQpQWsazBghrYfOpN0lmz4oASP9PAm2kJ1r8zVZD65Ru
	5ouSEgiadkueoZwpRMr7LNduhTPuWMSu04x8V5BZpsjgniWtwEZ78jn32pDH6UpII7m0RS+LoVb5F
	9auKLQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWkoB-00000001eRv-0h6v
	for ath12k@archiver.kernel.org;
	Sat, 11 Jan 2025 23:22:23 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWknp-00000001eQ4-0bRZ
	for ath12k@lists.infradead.org;
	Sat, 11 Jan 2025 23:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736637721; x=1768173721;
  h=date:from:to:cc:subject:message-id;
  bh=7ARaW5opWdYExEI9+1SSm23wohlAlKm30WBgk0Dh2jE=;
  b=Fftab/AIR0UJaXY1hFdYFvEiqrXUaFfsHmv9FKOVwkE78VpD2BVxPbWO
   Cq42qylU0Uv7oJiaFU9tKMSmO2RUzYvSEi2xaoPLDeoF1GTUfYW0HqG4q
   TJA8x7GVFD38rdOIMV35NzQhzJ7Qx/DDrcPKESrgAP5x9pN6VJTkUyE02
   gMu0IB9vajuja3818R175dEg0Ucqx1785rdnghi2nFMqPmobJ5W6veL+0
   LsuXsn006CgJC9Bt1WWlQP44BszEB54B1aIO3By9fb5rKi0/asGbBWWbD
   4OTMEw4aSa+lNLVoGw76Y0JuYUIBMaHvHErQw2mUXul4AKG57K4tE2FUI
   g==;
X-CSE-ConnectionGUID: LvqCukjWQt6IhEmXhVS17w==
X-CSE-MsgGUID: JmiNDU6vTOC7F94AlOIsFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="54447352"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="54447352"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 15:22:01 -0800
X-CSE-ConnectionGUID: /04PMZpHTjyL0Furl/6+gA==
X-CSE-MsgGUID: op6gxiywT6C2sz9G/SRDbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108693631"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jan 2025 15:21:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWknl-000LJv-1R;
	Sat, 11 Jan 2025 23:21:57 +0000
Date: Sun, 12 Jan 2025 07:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 0c5fcd9069dd5f984e39820629acbfbe0f1b4256
Message-ID: <202501120746.90u0UV9F-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_152201_193646_D6B0D4AF 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256  Add localversion-wireless-testing-ath

elapsed time: 1450m

configs tested: 73
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
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
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

