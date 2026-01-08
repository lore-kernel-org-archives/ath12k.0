Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB87D14899
	for <ath12k@archiver.kernel.org>; Thu,  8 Jan 2026 03:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dh6m4sgoQRonszJvhWpRn2Dj9Fx/uj+tNxz1c7ek3TM=; b=DrVKnh07KAjTXdojfB0boRm4TE
	wYnRTR3VX0adypxXIyOLeHw0dB9EKG6agCAc8T6iMeIDcCfXwMmPffbhQytarauO78A4uZKKQOxoT
	iY5FXyWJd/nA82zorjpe5Kx52bL/2PuFL9CwVzBLOcsZmg+A5df6e+++RqA4IXV0kqEyxETOSyBUz
	GhFzDW8Ijgj6XEk8QDTm4gWWcoOn1VFWFcF1+oeWSJTK7/mMXPbrD2mEpI9fWZTWQrj7qCqo39wWl
	R48+OuqZv6MS/GGr0rIihNhNEE11comizfCiRknPMXB8LTt/0v5VQ1OSPTtzwf1FvWqijgZAzwviI
	xo5RRWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgP5-0000000Frbv-2Oyy;
	Thu, 08 Jan 2026 03:09:39 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgOz-0000000FrbU-0aEK
	for ath12k@lists.infradead.org;
	Thu, 08 Jan 2026 03:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767841773; x=1799377773;
  h=date:from:to:cc:subject:message-id;
  bh=oWuZITXClclE5A2jUs/Bb4hBfn0cATol6JbJLLP0viM=;
  b=RkSHxeKLIyAF+b9IjjU8hLEumeNpVZSzF6hL+o99uQnN6x+Jz/II1Efo
   3gCQiNkjE1L7PPIuM/2oaWBWqb1Z9m77kXxGuCLXCc7Ih87jTKEC21os1
   k5UaVeY3IjDO4h0ipENziwXhyxHUyukefGYfJE1nKULeyzD5uGcdVWmwK
   mP4AKJ6Q5OvFwtq2l2J4dZGaIRoGCgqddFuj5dFqw5UvASlKsPDd9U/Rh
   mdacpS4sV3Edaiv7Sm9LyuscLK/13E0zqkASwhkyiV4wehH5bVwCavyJC
   7kKjtYFJ42fViPs6mzvr7uH8Iv6PwpKituoxcmQB8UjDHAYvyF7oBFQIB
   w==;
X-CSE-ConnectionGUID: 9xiNwtWYTeCnmzw29cCg2A==
X-CSE-MsgGUID: jwiJmFL6SVaUoFktRgGZdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86805734"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="86805734"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:09:30 -0800
X-CSE-ConnectionGUID: DRfsS5YOSHGAXtpzwEHpGA==
X-CSE-MsgGUID: R23kJzIxTP2oJ7ped21Pbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="208154447"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jan 2026 19:09:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdgOs-000000004MM-2tpu;
	Thu, 08 Jan 2026 03:09:26 +0000
Date: Thu, 08 Jan 2026 11:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 8696336e959968d948fee118462456155c8f0dde
Message-ID: <202601081130.6KjEIBcz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_190933_192682_242D86C1 
X-CRM114-Status: UNSURE (   4.44  )
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
branch HEAD: 8696336e959968d948fee118462456155c8f0dde  wifi: ath12k: fix dma_free_coherent() pointer

elapsed time: 1554m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260107    gcc-14.3.0
arc                   randconfig-002-20260107    gcc-8.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                            dove_defconfig    gcc-15.1.0
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20260107    gcc-10.5.0
arm                   randconfig-002-20260107    clang-22
arm                   randconfig-003-20260107    clang-22
arm                   randconfig-004-20260107    gcc-10.5.0
arm                           stm32_defconfig    gcc-15.1.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260107    clang-22
arm64                 randconfig-002-20260107    clang-22
arm64                 randconfig-003-20260107    gcc-8.5.0
arm64                 randconfig-004-20260107    clang-22
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260107    gcc-15.1.0
csky                  randconfig-002-20260107    gcc-9.5.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260107    clang-22
hexagon               randconfig-002-20260107    clang-22
i386        buildonly-randconfig-001-20260107    gcc-14
i386        buildonly-randconfig-002-20260107    gcc-14
i386        buildonly-randconfig-003-20260107    clang-20
i386        buildonly-randconfig-004-20260107    gcc-14
i386        buildonly-randconfig-005-20260107    clang-20
i386        buildonly-randconfig-006-20260107    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260108    gcc-13
i386                  randconfig-002-20260108    gcc-13
i386                  randconfig-003-20260108    clang-20
i386                  randconfig-004-20260108    clang-20
i386                  randconfig-005-20260108    clang-20
i386                  randconfig-006-20260108    gcc-14
i386                  randconfig-007-20260108    gcc-14
i386                  randconfig-011-20260107    gcc-13
i386                  randconfig-012-20260107    gcc-14
i386                  randconfig-013-20260107    clang-20
i386                  randconfig-014-20260107    gcc-14
i386                  randconfig-015-20260107    clang-20
i386                  randconfig-016-20260107    clang-20
i386                  randconfig-017-20260107    clang-20
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260107    gcc-15.1.0
loongarch             randconfig-002-20260107    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                      pic32mzda_defconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260107    gcc-8.5.0
nios2                 randconfig-002-20260107    gcc-8.5.0
openrisc                            defconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260107    gcc-8.5.0
parisc                randconfig-002-20260107    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc               randconfig-001-20260107    clang-22
powerpc               randconfig-002-20260107    gcc-8.5.0
powerpc64             randconfig-001-20260107    gcc-14.3.0
powerpc64             randconfig-002-20260107    clang-22
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260107    clang-22
riscv                 randconfig-002-20260107    gcc-9.5.0
s390                                defconfig    clang-22
s390                  randconfig-001-20260107    clang-22
s390                  randconfig-002-20260107    clang-22
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20260107    gcc-12.5.0
sh                    randconfig-002-20260107    gcc-12.5.0
sh                           se7705_defconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260107    gcc-8.5.0
sparc                 randconfig-002-20260107    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260107    clang-22
sparc64               randconfig-002-20260107    gcc-10.5.0
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260107    clang-16
um                    randconfig-002-20260107    clang-22
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20260107    gcc-14
x86_64      buildonly-randconfig-001-20260108    clang-20
x86_64      buildonly-randconfig-002-20260107    gcc-14
x86_64      buildonly-randconfig-002-20260108    clang-20
x86_64      buildonly-randconfig-003-20260107    gcc-14
x86_64      buildonly-randconfig-003-20260108    clang-20
x86_64      buildonly-randconfig-004-20260107    clang-20
x86_64      buildonly-randconfig-004-20260108    clang-20
x86_64      buildonly-randconfig-005-20260108    gcc-14
x86_64      buildonly-randconfig-006-20260108    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260107    clang-20
x86_64                randconfig-002-20260107    clang-20
x86_64                randconfig-003-20260107    clang-20
x86_64                randconfig-004-20260107    gcc-13
x86_64                randconfig-005-20260107    clang-20
x86_64                randconfig-006-20260107    clang-20
x86_64                randconfig-011-20260108    clang-20
x86_64                randconfig-012-20260108    clang-20
x86_64                randconfig-013-20260108    clang-20
x86_64                randconfig-014-20260108    gcc-14
x86_64                randconfig-015-20260108    gcc-14
x86_64                randconfig-016-20260108    gcc-14
x86_64                randconfig-071-20260107    gcc-14
x86_64                randconfig-072-20260107    clang-20
x86_64                randconfig-073-20260107    gcc-14
x86_64                randconfig-074-20260107    gcc-14
x86_64                randconfig-075-20260107    clang-20
x86_64                randconfig-076-20260107    gcc-14
xtensa                randconfig-001-20260107    gcc-8.5.0
xtensa                randconfig-002-20260107    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

