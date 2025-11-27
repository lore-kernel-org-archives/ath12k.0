Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8161ECFD2F6
	for <ath12k@archiver.kernel.org>; Thu, 27 Nov 2025 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qJQWc7MgDPLPYo9mp6yUAtKZFW9I4dI4nGu0lRV6dJg=; b=CPrQYbs/FmPYAoUB7o5a64cZ3B
	Er1Hgm2ltmBcvSlDmP4o0HgVoWSGAHKoLn6Haud+PigIZ1o5v9IOrE1tiXF3ASYturucUL92+Ei5V
	7g7MrSf24O3vOG1ei++/3QVI4JSiYpbS8vWBWjK9zJQxy7boaKpB4PqOd5TlOqLBjBRDoD3m7Uno9
	txN2ziOW8d54FA1cME9YYpC8btehPkkq3hpcPWVNTW3TS7q0iUj683A4agOgLZ8+MO3J2ZSDg8WpC
	WUM1xrG0AcZ0y59LB/f9naZv5xTYSq9SKYhVcYDjQdy14PIH7RC6Z7ZHuBC+tqVM6kxe1zPc85nsx
	kJswd/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY10-0000000GFtr-0klm;
	Thu, 27 Nov 2025 09:10:14 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY0x-0000000GFtI-2HQL
	for ath12k@lists.infradead.org;
	Thu, 27 Nov 2025 09:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764234611; x=1795770611;
  h=date:from:to:cc:subject:message-id;
  bh=fn2A1MhEuM9dR2+KIvrceLaHYbh+xci8B0eSrb0mAcM=;
  b=IVqRcJNs+yE/j/oZrIpK8FigHQO7PxhMu6xh4wu2zjd83liS4P4LbmTD
   ZUF+jS8xIhCjgz9yAzpgiFShtKGMfquVP1y5IFrNRBdksxSaJ8acdACMO
   4ONqfGNEEYAjc5l+eBC2FsD7uf806syE0/FGIch6WXgFsYQBrX9GKxnkl
   nnVAghWlkSwh545cqh60iYTq8Fhydwtrk97PBEs8mAg8/bvUWMm0DUZj1
   3P1FrL4k+DzdzxKxH++6CSpuM0ghQGsH7PZger6v9i5RxNyjtHnwS+Qfc
   wLQxa8ee+a0BprAFamgPamR+gDmSAUvOLAhF9+Ojuen1hvWkYZehnmjpl
   Q==;
X-CSE-ConnectionGUID: VxtWHiWdSQC7Zq0y1lPRow==
X-CSE-MsgGUID: EHPJZxknSOKgKMw0XE15Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66440050"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66440050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:10:08 -0800
X-CSE-ConnectionGUID: Yh05QOTpQ724qn/Yd+RLtg==
X-CSE-MsgGUID: QvcfMP4eQP6yC8XpUyc8+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="216534268"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Nov 2025 01:10:06 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOY0p-0000000047W-3vDS;
	Thu, 27 Nov 2025 09:10:03 +0000
Date: Thu, 27 Nov 2025 17:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 345246dda6e50546cd08f9efc6ac8428a1f3b340
Message-ID: <202511271734.6pP3SMv3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_011011_643870_1F6BD3A8 
X-CRM114-Status: UNSURE (   3.81  )
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
branch HEAD: 345246dda6e50546cd08f9efc6ac8428a1f3b340  Merge branch 'ath12k-ng' into pending

elapsed time: 7704m

configs tested: 128
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251127    clang-22
arc         randconfig-002-20251127    clang-22
arm                     allnoconfig    clang-22
arm                     allnoconfig    gcc-15.1.0
arm                    allyesconfig    gcc-15.1.0
arm            integrator_defconfig    clang-22
arm         randconfig-001-20251127    clang-22
arm         randconfig-002-20251127    clang-22
arm         randconfig-003-20251127    clang-22
arm         randconfig-004-20251127    clang-22
arm               s3c6400_defconfig    clang-22
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
arm64       randconfig-001-20251127    gcc-15.1.0
arm64       randconfig-002-20251127    gcc-15.1.0
arm64       randconfig-003-20251127    gcc-15.1.0
arm64       randconfig-004-20251127    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky        randconfig-001-20251127    gcc-15.1.0
csky        randconfig-002-20251127    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                 allnoconfig    gcc-15.1.0
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                    allnoconfig    gcc-15.1.0
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch               allnoconfig    gcc-15.1.0
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    clang-22
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    clang-22
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc               allmodconfig    clang-22
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    clang-22
openrisc                allnoconfig    gcc-15.1.0
openrisc                  defconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    clang-22
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc                    defconfig    gcc-15.1.0
parisc      randconfig-001-20251127    gcc-13.4.0
parisc      randconfig-002-20251127    gcc-13.4.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    clang-22
powerpc                 allnoconfig    gcc-15.1.0
powerpc            bamboo_defconfig    clang-22
powerpc         bluestone_defconfig    clang-22
powerpc       linkstation_defconfig    clang-22
powerpc       mpc836x_rdk_defconfig    clang-22
powerpc     randconfig-001-20251127    gcc-13.4.0
powerpc     randconfig-002-20251127    gcc-13.4.0
powerpc64   randconfig-001-20251127    gcc-13.4.0
powerpc64   randconfig-002-20251127    gcc-13.4.0
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
riscv                     defconfig    gcc-15.1.0
riscv       randconfig-001-20251127    gcc-12.5.0
riscv       randconfig-002-20251127    gcc-12.5.0
s390                   allmodconfig    clang-18
s390                   allmodconfig    gcc-15.1.0
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390                      defconfig    gcc-15.1.0
s390        randconfig-001-20251127    gcc-12.5.0
s390        randconfig-002-20251127    gcc-12.5.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    clang-22
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh                        defconfig    gcc-14
sh                kfr2r09_defconfig    clang-22
sh          randconfig-001-20251127    gcc-12.5.0
sh          randconfig-002-20251127    gcc-12.5.0
sparc                   allnoconfig    clang-22
sparc                   allnoconfig    gcc-15.1.0
sparc                     defconfig    gcc-15.1.0
sparc       randconfig-001-20251127    clang-22
sparc       randconfig-002-20251127    clang-22
sparc64                allmodconfig    clang-22
sparc64                   defconfig    gcc-14
sparc64     randconfig-001-20251127    clang-22
sparc64     randconfig-002-20251127    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
um                        defconfig    gcc-14
um                   i386_defconfig    gcc-14
um          randconfig-001-20251127    clang-22
um          randconfig-002-20251127    clang-22
um                 x86_64_defconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                  allnoconfig    clang-22
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    clang-22
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    clang-22
xtensa      randconfig-001-20251127    clang-22
xtensa      randconfig-002-20251127    clang-22
xtensa          xip_kc705_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

