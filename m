Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05DCE77197
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aJnAdz7pQehRwTr/v0zuqY4bUqaoliGsvWzCSDzq020=; b=eumEZc5uHBvNV1UK3QXV/Yz69K
	w5zvv9UGfZNH7uhFhZSIQjt+wAUv8wRNv8kfxMymUoVLR60n2RjNDsp4ID9Yw2gF4tVdQRGqGmch4
	aLqCYu1pQn1+jzNxCUc8YoCygbyMeWKcVpK3I9gQrYGXqexeBH6KeZ/Sj/n3XgJUunxLJLx2sfwGn
	iySL9ZLxpICGBaJ9Kk5/1hTresdNYhEkjLlBN+WnMK3wD5xEX8+6Cc7ILQaq97Q1iokv6nXqa38RA
	0RaJajblUCatPLmfgtmi42lD12qXeduJOk0N6JzUpEvr+VfQbbipMz/BVuMq1cl+XqeeRZC+AnHZ5
	KtgWdjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVF8n-000000067Fd-1EK2
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 19:21:25 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVF8h-000000067FB-45gr
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 19:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736277680; x=1767813680;
  h=date:from:to:cc:subject:message-id;
  bh=2qeTkCbeCKxTGkR3tDDXUpQWPkL33+Bcud/EOSofcxU=;
  b=b7pa6/TKPFHv08rM53IIlzlkf3ct5sULznq8le3b8ZKytMJBFAf8LTbE
   YJy+PM5dBgN01o56t3rsg1LStqGNXuBokjOdwAPl44c/D7E7i4KHcKsDo
   XMxPZf6iz9SuwZbKXWV87RkpLlVN4Gc8mS3L2GFh+2ok9wNCLuheJ9HSp
   6UgNitNRBo6t8JIoCbSgREpK/o141nZYNy3AN3PUsezanrvZ0gPDyhMGL
   j5jjMu4mDQUE7Lf8lGaHh6KP63Nkn8vtK3IaFzFnEDE8dPkmdUj1qTs6A
   /9pZbDrLdHILYzn7evD++RGsT8VWVXs8nGyLPKiLxvgE481tQt7J4IhME
   Q==;
X-CSE-ConnectionGUID: Q+9sozY5SG6lQuWIu7qKWQ==
X-CSE-MsgGUID: 2dhhHRTQTdSl3s/dmstD+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36597124"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36597124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 11:21:18 -0800
X-CSE-ConnectionGUID: 9S5zF15qRkm3XcKbkQXimA==
X-CSE-MsgGUID: KGnE7tSXSv27CB0aMZvMhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126148455"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jan 2025 11:21:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVF8d-000F8N-26;
	Tue, 07 Jan 2025 19:21:15 +0000
Date: Wed, 08 Jan 2025 03:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 af09ff1995118a0b5a31b6f5533f7a657da782dc
Message-ID: <202501080331.Re8JCFKq-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_112120_066373_F7123227 
X-CRM114-Status: UNSURE (   4.14  )
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
branch HEAD: af09ff1995118a0b5a31b6f5533f7a657da782dc  wifi: ath12k: fix tx power, max reg power update to firmware

elapsed time: 1304m

configs tested: 151
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250107    gcc-13.2.0
arc                   randconfig-002-20250107    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250107    clang-20
arm                   randconfig-002-20250107    clang-19
arm                   randconfig-003-20250107    clang-20
arm                   randconfig-004-20250107    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250107    clang-15
arm64                 randconfig-002-20250107    clang-20
arm64                 randconfig-003-20250107    gcc-14.2.0
arm64                 randconfig-004-20250107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250107    gcc-14.2.0
csky                  randconfig-002-20250107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon               randconfig-001-20250107    clang-20
hexagon               randconfig-002-20250107    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250107    clang-19
i386        buildonly-randconfig-001-20250108    gcc-12
i386        buildonly-randconfig-002-20250107    clang-19
i386        buildonly-randconfig-002-20250108    gcc-12
i386        buildonly-randconfig-003-20250107    clang-19
i386        buildonly-randconfig-003-20250108    gcc-12
i386        buildonly-randconfig-004-20250107    gcc-12
i386        buildonly-randconfig-004-20250108    gcc-12
i386        buildonly-randconfig-005-20250107    gcc-12
i386        buildonly-randconfig-005-20250108    gcc-12
i386        buildonly-randconfig-006-20250107    clang-19
i386        buildonly-randconfig-006-20250108    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250108    gcc-12
i386                  randconfig-002-20250108    gcc-12
i386                  randconfig-003-20250108    gcc-12
i386                  randconfig-004-20250108    gcc-12
i386                  randconfig-005-20250108    gcc-12
i386                  randconfig-006-20250108    gcc-12
i386                  randconfig-007-20250108    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250107    gcc-14.2.0
loongarch             randconfig-002-20250107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250107    gcc-14.2.0
nios2                 randconfig-002-20250107    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250107    gcc-14.2.0
parisc                randconfig-002-20250107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250107    gcc-14.2.0
powerpc               randconfig-002-20250107    gcc-14.2.0
powerpc               randconfig-003-20250107    clang-20
powerpc64             randconfig-001-20250107    clang-15
powerpc64             randconfig-002-20250107    clang-20
powerpc64             randconfig-003-20250107    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250107    clang-15
riscv                 randconfig-002-20250107    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250107    gcc-14.2.0
s390                  randconfig-002-20250107    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250107    gcc-14.2.0
sh                    randconfig-002-20250107    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250107    gcc-14.2.0
sparc                 randconfig-002-20250107    gcc-14.2.0
sparc64               randconfig-001-20250107    gcc-14.2.0
sparc64               randconfig-002-20250107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20250107    gcc-12
um                    randconfig-002-20250107    clang-20
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250107    clang-19
x86_64      buildonly-randconfig-001-20250108    gcc-12
x86_64      buildonly-randconfig-002-20250107    gcc-12
x86_64      buildonly-randconfig-002-20250108    gcc-12
x86_64      buildonly-randconfig-003-20250107    clang-19
x86_64      buildonly-randconfig-003-20250108    gcc-12
x86_64      buildonly-randconfig-004-20250107    gcc-12
x86_64      buildonly-randconfig-004-20250108    gcc-12
x86_64      buildonly-randconfig-005-20250107    clang-19
x86_64      buildonly-randconfig-005-20250108    gcc-12
x86_64      buildonly-randconfig-006-20250107    clang-19
x86_64      buildonly-randconfig-006-20250108    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250108    gcc-12
x86_64                randconfig-072-20250108    gcc-12
x86_64                randconfig-073-20250108    gcc-12
x86_64                randconfig-074-20250108    gcc-12
x86_64                randconfig-075-20250108    gcc-12
x86_64                randconfig-076-20250108    gcc-12
x86_64                randconfig-077-20250108    gcc-12
x86_64                randconfig-078-20250108    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                    rhel-9.4-kselftests    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250107    gcc-14.2.0
xtensa                randconfig-002-20250107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

