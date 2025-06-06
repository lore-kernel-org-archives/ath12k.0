Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8194C5AD49
	for <ath12k@archiver.kernel.org>; Fri,  6 Jun 2025 04:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vs5cNy4BVrZ9DrZTexbbtQhUQvWU9Y9DItIscw2q7Nc=; b=z5o7Inr+tdMjjkTsMMkJjFR5wD
	YnxWDP8ZHkAS0JsIbF3YcHLhL9gWRr5r2okUoqjo5bFV7UhW1Zy5OkN9pBFiDt1Ks/Iv3Fg74kCax
	r1kkGaA7oIkw0mc2Wu7uILVKYr61gWbPqx+uOPyfEjSffImELxrMVSoyMqnetcBqiGLBrlplHIFbG
	sgWd94awIxH+s9ZvbZHxv+7Fa/V5G3Tg7dSgVxFz59Tl1GuYaxy4KAxWvMYtjKb+MtR++ibvFKPv6
	/IVE8gLJDyFt4N+95+wbEsRLB68AZ9rWuUj5VA8ZzYG2ragQvvCXlVxZSWr5Y/GPU03kJRJpf1gjR
	28p4DAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNORB-0000000H4dE-1zfj;
	Fri, 06 Jun 2025 04:12:13 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNOR9-0000000H4cv-0OPo
	for ath12k@lists.infradead.org;
	Fri, 06 Jun 2025 04:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749183131; x=1780719131;
  h=date:from:to:cc:subject:message-id;
  bh=S5s3kZ/ONZuGjYJiit36eHotBMbpySIyTw/acEJH38M=;
  b=hrS7a0TO5D9OKSmdzhVqlTfhZ3T/98lmNDGM7PLuID/Nx127m1SjrOB7
   p/l1WYL8I+U0WJTX2l1tA3G4UNEOO8v1jbU+KtX4TETzK2NCfy3gY8HrN
   iS9DWDNlq4uy6hSK/qQrwgL89ODVtJSPs1eqKRST/oSr2eSOtvfeyvd+Q
   NDpdCFg41ZZ/HQR2HHEgOaDf20TSSMhBvh3baOoXdtVKQr/FJ9T1YAZ4P
   9f0/qn1HvCtHOkq/wbsDIhBxtBqRJJTvy4iIfCVcHeGFGkIlij4Oo+ul2
   gxRPZuVTwEGveMqDLc0hzxraS/Ms9ur6nVvuvHeJH44Rtb39FhH32HDpo
   w==;
X-CSE-ConnectionGUID: BzYQRKEyRFqTEgLUOtzxaw==
X-CSE-MsgGUID: 4qxXSvxYSvmiAeTGWNT7tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61987105"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="61987105"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 21:12:07 -0700
X-CSE-ConnectionGUID: FSUd837iQT2sqOWgVqVTEw==
X-CSE-MsgGUID: 5HuWkSSgRI2zQY4sZK0T/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="145668489"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Jun 2025 21:12:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNOR1-0004j7-23;
	Fri, 06 Jun 2025 04:12:03 +0000
Date: Fri, 06 Jun 2025 12:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 cbd32cdc06c1e7f8ddb13e680a66d315eb5b5318
Message-ID: <202506061217.7PANhmUx-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_211211_180366_74180046 
X-CRM114-Status: UNSURE (   3.46  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: cbd32cdc06c1e7f8ddb13e680a66d315eb5b5318  Merge branch 'pending' into main-pending

elapsed time: 726m

configs tested: 226
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-12
arc                   randconfig-001-20250606    gcc-15.1.0
arc                   randconfig-001-20250606    gcc-8.5.0
arc                   randconfig-002-20250606    gcc-10.5.0
arc                   randconfig-002-20250606    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20250606    clang-21
arm                   randconfig-001-20250606    gcc-15.1.0
arm                   randconfig-002-20250606    gcc-11.5.0
arm                   randconfig-002-20250606    gcc-15.1.0
arm                   randconfig-003-20250606    clang-21
arm                   randconfig-003-20250606    gcc-15.1.0
arm                   randconfig-004-20250606    gcc-11.5.0
arm                   randconfig-004-20250606    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250606    clang-21
arm64                 randconfig-001-20250606    gcc-15.1.0
arm64                 randconfig-002-20250606    gcc-15.1.0
arm64                 randconfig-003-20250606    clang-21
arm64                 randconfig-003-20250606    gcc-15.1.0
arm64                 randconfig-004-20250606    clang-21
arm64                 randconfig-004-20250606    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250606    gcc-13.3.0
csky                  randconfig-001-20250606    gcc-14.3.0
csky                  randconfig-002-20250606    gcc-13.3.0
csky                  randconfig-002-20250606    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250606    clang-21
hexagon               randconfig-001-20250606    gcc-13.3.0
hexagon               randconfig-002-20250606    clang-18
hexagon               randconfig-002-20250606    gcc-13.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250606    clang-20
i386        buildonly-randconfig-001-20250606    gcc-12
i386        buildonly-randconfig-002-20250606    gcc-12
i386        buildonly-randconfig-003-20250606    gcc-12
i386        buildonly-randconfig-004-20250606    gcc-12
i386        buildonly-randconfig-005-20250606    gcc-12
i386        buildonly-randconfig-006-20250606    gcc-11
i386        buildonly-randconfig-006-20250606    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250606    clang-20
i386                  randconfig-002-20250606    clang-20
i386                  randconfig-003-20250606    clang-20
i386                  randconfig-004-20250606    clang-20
i386                  randconfig-005-20250606    clang-20
i386                  randconfig-006-20250606    clang-20
i386                  randconfig-007-20250606    clang-20
i386                  randconfig-011-20250606    clang-20
i386                  randconfig-012-20250606    clang-20
i386                  randconfig-013-20250606    clang-20
i386                  randconfig-014-20250606    clang-20
i386                  randconfig-015-20250606    clang-20
i386                  randconfig-016-20250606    clang-20
i386                  randconfig-017-20250606    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250606    gcc-13.3.0
loongarch             randconfig-001-20250606    gcc-15.1.0
loongarch             randconfig-002-20250606    gcc-13.3.0
loongarch             randconfig-002-20250606    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                     decstation_defconfig    gcc-12
mips                           ip22_defconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    gcc-12
mips                           rs90_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    gcc-12
nios2                            allmodconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250606    gcc-13.3.0
nios2                 randconfig-001-20250606    gcc-14.2.0
nios2                 randconfig-002-20250606    gcc-13.3.0
nios2                 randconfig-002-20250606    gcc-9.3.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250606    gcc-11.5.0
parisc                randconfig-001-20250606    gcc-13.3.0
parisc                randconfig-002-20250606    gcc-12.4.0
parisc                randconfig-002-20250606    gcc-13.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-12
powerpc                  mpc885_ads_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-12
powerpc               randconfig-001-20250606    clang-21
powerpc               randconfig-001-20250606    gcc-13.3.0
powerpc               randconfig-002-20250606    clang-21
powerpc               randconfig-002-20250606    gcc-13.3.0
powerpc               randconfig-003-20250606    gcc-13.3.0
powerpc                     tqm8541_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250606    clang-21
powerpc64             randconfig-001-20250606    gcc-13.3.0
powerpc64             randconfig-002-20250606    clang-17
powerpc64             randconfig-002-20250606    gcc-13.3.0
powerpc64             randconfig-003-20250606    gcc-12.4.0
powerpc64             randconfig-003-20250606    gcc-13.3.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250606    gcc-11.5.0
riscv                 randconfig-001-20250606    gcc-12
riscv                 randconfig-002-20250606    gcc-12
riscv                 randconfig-002-20250606    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250606    clang-21
s390                  randconfig-001-20250606    gcc-12
s390                  randconfig-002-20250606    clang-18
s390                  randconfig-002-20250606    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20250606    gcc-12
sh                    randconfig-001-20250606    gcc-12.4.0
sh                    randconfig-002-20250606    gcc-10.5.0
sh                    randconfig-002-20250606    gcc-12
sh                           se7751_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                 randconfig-001-20250606    gcc-12
sparc                 randconfig-001-20250606    gcc-8.5.0
sparc                 randconfig-002-20250606    gcc-12
sparc                 randconfig-002-20250606    gcc-8.5.0
sparc64                          allmodconfig    gcc-15.1.0
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250606    gcc-12
sparc64               randconfig-001-20250606    gcc-12.4.0
sparc64               randconfig-002-20250606    gcc-12
sparc64               randconfig-002-20250606    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250606    gcc-12
um                    randconfig-002-20250606    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250606    clang-20
x86_64      buildonly-randconfig-002-20250606    gcc-12
x86_64      buildonly-randconfig-003-20250606    gcc-12
x86_64      buildonly-randconfig-004-20250606    gcc-12
x86_64      buildonly-randconfig-005-20250606    gcc-12
x86_64      buildonly-randconfig-006-20250606    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250606    gcc-11
x86_64                randconfig-002-20250606    gcc-11
x86_64                randconfig-003-20250606    gcc-11
x86_64                randconfig-004-20250606    gcc-11
x86_64                randconfig-005-20250606    gcc-11
x86_64                randconfig-006-20250606    gcc-11
x86_64                randconfig-007-20250606    gcc-11
x86_64                randconfig-008-20250606    gcc-11
x86_64                randconfig-071-20250606    gcc-12
x86_64                randconfig-072-20250606    gcc-12
x86_64                randconfig-073-20250606    gcc-12
x86_64                randconfig-074-20250606    gcc-12
x86_64                randconfig-075-20250606    gcc-12
x86_64                randconfig-076-20250606    gcc-12
x86_64                randconfig-077-20250606    gcc-12
x86_64                randconfig-078-20250606    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20250606    gcc-12
xtensa                randconfig-001-20250606    gcc-9.3.0
xtensa                randconfig-002-20250606    gcc-12
xtensa                randconfig-002-20250606    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

