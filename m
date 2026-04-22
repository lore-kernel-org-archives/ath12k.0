Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4287F94CBD
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 03:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1MMLrNAB6O+Ae6xlQfBrffwSH9lBUgIvofKknAQxUkM=; b=FfikNXZecIbyjM5s9HjY+FEGqQ
	UaJ4ssoFZ2uVD0/QQnTzNtc355H18KxrrQidRZY41zo+yffRpvU4YRo5Gm8XU/xrsxjimF6mP/cag
	LSh2VsqerXG4OqQ/5qF8paG8OFmikkgx/y0EKc6ZEDJneGHnbX7NhZTObx/t2PT85wdD3ZnfZ+y7n
	uLP/DXvI8qwZRjCk/HImWu8XvLREKD5A9BH3ILWxzRT+IXqoqpsYrnrOFnI1spgXxbJy0QJlSLCAa
	mqaNyfwfmt7LodLCXNw8EMe6/Kue84ptQHxeofWpXJu4U5TlCkpPSNVcw0B2t9mFAA1vqd4A8LI51
	nDADvHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFO5W-00000009Xka-2jNd;
	Wed, 22 Apr 2026 03:17:18 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFO5U-00000009Xjn-0V6f
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 03:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776827836; x=1808363836;
  h=date:from:to:cc:subject:message-id;
  bh=q1NeFqTEk/8e/ZauWgBz/rFE/5fcZxgS3YdRrNMZPaM=;
  b=RsM3dP6KrdqjLPTY6ooQlCvE9Bqw3KfFeBusUZ98mL8TEl37lGmL8hj/
   0hzzWHJh0BPj5FVgVbsp40SO65/fNQnPzlcabGmbTG91Is+rVLB71oZYV
   Ccg/c3/vWqv16kvQSv2ulUMhf7iIPfkG6cfrM+agcC1la6iNb4uvUWIeF
   pNTIiCnMyFQPxaNlsCKvc5Ik65oM4visNjTAcwLFOVSY3Cmtv4lz8d+dg
   dV//U2Nttr6jfFdiT70fHGwieRKSaTSrDD+uPmG3WyQYqdLe82dGwCnms
   p79sOZajPtFGBu+Sr5lZqfyXKt9MsarFWDWoPj/XgSxYGYDaE8Dy1u4pe
   g==;
X-CSE-ConnectionGUID: J4RYS/3LS0azlmCrRIfLHQ==
X-CSE-MsgGUID: vAVr86O+QX+/ATr8BiQ3qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="100430222"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="100430222"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 20:17:15 -0700
X-CSE-ConnectionGUID: 1qgGKlxwQqKr/8Wx6oCU6w==
X-CSE-MsgGUID: PmbqwvNoSxiX7NSkPioFKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="229554146"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Apr 2026 20:17:14 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFO5P-000000004FE-3apK;
	Wed, 22 Apr 2026 03:17:11 +0000
Date: Wed, 22 Apr 2026 11:16:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 590182b72213ef04977ab0b16b8dadfcfd25ff73
Message-ID: <202604221102.UtFqgt4d-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_201716_226318_3176145C 
X-CRM114-Status: UNSURE (   4.08  )
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
branch HEAD: 590182b72213ef04977ab0b16b8dadfcfd25ff73  wifi: ath12k: Fix invalid IRQ requests during AHB probe

elapsed time: 762m

configs tested: 111
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc         randconfig-001-20260422    gcc-9.5.0
arc         randconfig-002-20260422    gcc-11.5.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm         randconfig-001-20260422    gcc-8.5.0
arm         randconfig-002-20260422    gcc-8.5.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
hexagon     randconfig-001-20260422    clang-23
hexagon     randconfig-002-20260422    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
i386        randconfig-004-20260422    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch                 defconfig    clang-19
loongarch   randconfig-001-20260422    gcc-15.2.0
loongarch   randconfig-002-20260422    clang-18
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
m68k                      defconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
microblaze                defconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
openrisc                  defconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc                    defconfig    gcc-15.2.0
parisc      randconfig-001-20260422    gcc-14.3.0
parisc      randconfig-002-20260422    gcc-9.5.0
parisc64                  defconfig    gcc-15.2.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc            arches_defconfig    gcc-15.2.0
powerpc     randconfig-001-20260422    gcc-13.4.0
powerpc     randconfig-002-20260422    gcc-14.3.0
powerpc64   randconfig-001-20260422    clang-23
powerpc64   randconfig-002-20260422    gcc-15.2.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv                     defconfig    clang-23
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390                      defconfig    clang-23
s390        randconfig-001-20260422    clang-23
s390        randconfig-002-20260422    clang-18
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-15.2.0
sh          randconfig-001-20260422    gcc-13.4.0
sh          randconfig-002-20260422    gcc-11.5.0
sparc                   allnoconfig    gcc-15.2.0
sparc                     defconfig    gcc-15.2.0
sparc       randconfig-001-20260422    gcc-13.4.0
sparc       randconfig-002-20260422    gcc-8.5.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20260422    gcc-11.5.0
sparc64     randconfig-002-20260422    clang-20
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                        defconfig    clang-23
um                   i386_defconfig    gcc-14
um          randconfig-001-20260422    gcc-14
um          randconfig-002-20260422    gcc-14
um                 x86_64_defconfig    clang-23
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64      randconfig-001-20260422    clang-20
x86_64      randconfig-002-20260422    gcc-14
x86_64      randconfig-003-20260422    gcc-14
x86_64      randconfig-004-20260422    clang-20
x86_64      randconfig-005-20260422    gcc-14
x86_64      randconfig-006-20260422    clang-20
x86_64      randconfig-011-20260422    clang-20
x86_64      randconfig-012-20260422    gcc-14
x86_64      randconfig-013-20260422    clang-20
x86_64      randconfig-014-20260422    clang-20
x86_64      randconfig-015-20260422    gcc-14
x86_64      randconfig-016-20260422    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0
xtensa      randconfig-001-20260422    gcc-15.2.0
xtensa      randconfig-002-20260422    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

