Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8712CCD183
	for <ath12k@archiver.kernel.org>; Fri, 17 Oct 2025 00:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZmIFTL4Iob65wFivjc+YX4y6va+xRmxdAI5dNYaprC0=; b=q9lx1g1B6e1VOps9GeIZGBanne
	buHHkcK1Cv53GsxCTPTMR11w4kOu/iMQLC+ckN+Bm452eyatYYE37YNB1Er7E+fzCZn/wAC4bXxYb
	r+bSqE5cSxFfgcJ5OCj9+/Fp9MPSJmyRihn7/5SaaEtWnadKIS3i3H5RyltJh027UknJKUgLJ6LOf
	WNOL6Im0wNER+4EuTGQxQIUP4iKn/VlD2L/W4Anv7Hp6uIoudTxKFTap4XAXSoVh913/6S3DmXWXW
	3hiJGkFJ/frV1rnu/YcmqGef46IitI4arrGV+j1dMVrzTJKfiU8fW+UiaRp6QtiCf1fJY7d082lVY
	6nsuaNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YcC-00000006J5L-2t4N;
	Fri, 17 Oct 2025 00:46:40 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YcA-00000006J51-21er
	for ath12k@lists.infradead.org;
	Fri, 17 Oct 2025 00:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760661998; x=1792197998;
  h=date:from:to:cc:subject:message-id;
  bh=GgO4SFZnsKagWAesKaR6cC9uD4TvHwRX6ceCqm/j5cU=;
  b=kXyisU/rDTB3/XOVFlU3pElbgSeS3UbArc0tPapucy4Tvgm4j4ZfyQWL
   8HiN4z85N9FCDZaoOrNsE5XXPC/TFuOdiHPjI1soPzUl/RfpHunvLA+LF
   CcNr0A2R1INEib9cYApNEtcznd9SixQG8m439yACDauIoY5q9AOcPN+4L
   ssEPW2Nrnvan7PtFZ53qjDtb3pDwkpvF6uIpvj124GsbqaPuT1AedYjH6
   MR4zN4mo/RNU98gT9ZlKEzqfBiRA/E1vC3V5wk/X6YYlAw3/ec+/TaJaE
   4yePm4/wEFWTyEaCXqM408aPiYwMyetx2fbvc56ldQU9jIQgggQZjbt0c
   w==;
X-CSE-ConnectionGUID: RNsU4xbwQvqSvSWCZPDeiA==
X-CSE-MsgGUID: sgKy4mukS1C42ydF0/+5zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62078680"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62078680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 17:46:38 -0700
X-CSE-ConnectionGUID: Y4B+j5+DQBKkY6WZls+GJA==
X-CSE-MsgGUID: cBeUNNQiTpulYilmWj7TCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="181735397"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2025 17:46:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Yc6-0005N9-1E;
	Fri, 17 Oct 2025 00:46:34 +0000
Date: Fri, 17 Oct 2025 08:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 9c5f229b1312a31aff762b2111f6751e4e3722fe
Message-ID: <202510170800.VIh2bVIT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_174638_559302_4A08FA6B 
X-CRM114-Status: UNSURE (   3.52  )
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
branch HEAD: 9c5f229b1312a31aff762b2111f6751e4e3722fe  wifi: ath12k: fix TX and RX MCS rate configurations in HE mode

elapsed time: 1458m

configs tested: 257
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20251016    gcc-13.4.0
arc                   randconfig-001-20251017    clang-22
arc                   randconfig-002-20251016    gcc-8.5.0
arc                   randconfig-002-20251017    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                        multi_v7_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    clang-19
arm                          pxa3xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20251016    clang-22
arm                   randconfig-001-20251017    clang-22
arm                   randconfig-002-20251016    gcc-10.5.0
arm                   randconfig-002-20251017    clang-22
arm                   randconfig-003-20251016    clang-22
arm                   randconfig-003-20251017    clang-22
arm                   randconfig-004-20251016    gcc-14.3.0
arm                   randconfig-004-20251017    clang-22
arm                       spear13xx_defconfig    gcc-15.1.0
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251016    clang-22
arm64                 randconfig-001-20251017    clang-22
arm64                 randconfig-002-20251016    gcc-13.4.0
arm64                 randconfig-002-20251017    clang-22
arm64                 randconfig-003-20251016    gcc-10.5.0
arm64                 randconfig-003-20251017    clang-22
arm64                 randconfig-004-20251016    clang-22
arm64                 randconfig-004-20251017    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251016    gcc-11.5.0
csky                  randconfig-001-20251017    gcc-15.1.0
csky                  randconfig-002-20251016    gcc-11.5.0
csky                  randconfig-002-20251017    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251016    clang-22
hexagon               randconfig-001-20251017    gcc-15.1.0
hexagon               randconfig-002-20251016    clang-22
hexagon               randconfig-002-20251017    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251016    clang-20
i386        buildonly-randconfig-001-20251017    clang-20
i386        buildonly-randconfig-002-20251016    gcc-14
i386        buildonly-randconfig-002-20251017    clang-20
i386        buildonly-randconfig-003-20251016    clang-20
i386        buildonly-randconfig-003-20251017    clang-20
i386        buildonly-randconfig-004-20251016    clang-20
i386        buildonly-randconfig-004-20251017    clang-20
i386        buildonly-randconfig-005-20251016    clang-20
i386        buildonly-randconfig-005-20251017    clang-20
i386        buildonly-randconfig-006-20251016    gcc-14
i386        buildonly-randconfig-006-20251017    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251017    clang-20
i386                  randconfig-002-20251017    clang-20
i386                  randconfig-003-20251017    clang-20
i386                  randconfig-004-20251017    clang-20
i386                  randconfig-005-20251017    clang-20
i386                  randconfig-006-20251017    clang-20
i386                  randconfig-007-20251017    clang-20
i386                  randconfig-011-20251017    gcc-12
i386                  randconfig-012-20251017    gcc-12
i386                  randconfig-013-20251017    gcc-12
i386                  randconfig-014-20251017    gcc-12
i386                  randconfig-015-20251017    gcc-12
i386                  randconfig-016-20251017    gcc-12
i386                  randconfig-017-20251017    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251016    gcc-15.1.0
loongarch             randconfig-001-20251017    gcc-15.1.0
loongarch             randconfig-002-20251016    gcc-13.4.0
loongarch             randconfig-002-20251017    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
nios2                            alldefconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251016    gcc-8.5.0
nios2                 randconfig-001-20251017    gcc-15.1.0
nios2                 randconfig-002-20251016    gcc-8.5.0
nios2                 randconfig-002-20251017    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251016    gcc-9.5.0
parisc                randconfig-001-20251017    gcc-15.1.0
parisc                randconfig-002-20251016    gcc-8.5.0
parisc                randconfig-002-20251017    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251016    clang-16
powerpc               randconfig-001-20251017    gcc-15.1.0
powerpc               randconfig-002-20251016    gcc-8.5.0
powerpc               randconfig-002-20251017    gcc-15.1.0
powerpc               randconfig-003-20251016    clang-22
powerpc               randconfig-003-20251017    gcc-15.1.0
powerpc64             randconfig-001-20251016    gcc-15.1.0
powerpc64             randconfig-001-20251017    gcc-15.1.0
powerpc64             randconfig-002-20251016    clang-22
powerpc64             randconfig-002-20251017    gcc-15.1.0
powerpc64             randconfig-003-20251016    gcc-13.4.0
powerpc64             randconfig-003-20251017    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251016    gcc-9.5.0
riscv                 randconfig-001-20251017    clang-22
riscv                 randconfig-002-20251016    gcc-10.5.0
riscv                 randconfig-002-20251017    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251016    clang-18
s390                  randconfig-001-20251017    clang-22
s390                  randconfig-002-20251016    gcc-13.4.0
s390                  randconfig-002-20251017    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251016    gcc-14.3.0
sh                    randconfig-001-20251017    clang-22
sh                    randconfig-002-20251016    gcc-14.3.0
sh                    randconfig-002-20251017    clang-22
sh                          rsk7269_defconfig    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251016    gcc-15.1.0
sparc                 randconfig-001-20251017    clang-22
sparc                 randconfig-002-20251016    gcc-8.5.0
sparc                 randconfig-002-20251017    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251016    gcc-13.4.0
sparc64               randconfig-001-20251017    clang-22
sparc64               randconfig-002-20251016    gcc-8.5.0
sparc64               randconfig-002-20251017    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251016    gcc-12
um                    randconfig-001-20251017    clang-22
um                    randconfig-002-20251016    clang-22
um                    randconfig-002-20251017    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251016    clang-20
x86_64      buildonly-randconfig-001-20251017    clang-20
x86_64      buildonly-randconfig-002-20251016    gcc-14
x86_64      buildonly-randconfig-002-20251017    clang-20
x86_64      buildonly-randconfig-003-20251016    gcc-14
x86_64      buildonly-randconfig-003-20251017    clang-20
x86_64      buildonly-randconfig-004-20251016    gcc-12
x86_64      buildonly-randconfig-004-20251017    clang-20
x86_64      buildonly-randconfig-005-20251016    gcc-14
x86_64      buildonly-randconfig-005-20251017    clang-20
x86_64      buildonly-randconfig-006-20251016    gcc-12
x86_64      buildonly-randconfig-006-20251017    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251017    gcc-14
x86_64                randconfig-002-20251017    gcc-14
x86_64                randconfig-003-20251017    gcc-14
x86_64                randconfig-004-20251017    gcc-14
x86_64                randconfig-005-20251017    gcc-14
x86_64                randconfig-006-20251017    gcc-14
x86_64                randconfig-007-20251017    gcc-14
x86_64                randconfig-008-20251017    gcc-14
x86_64                randconfig-071-20251017    clang-20
x86_64                randconfig-072-20251017    clang-20
x86_64                randconfig-073-20251017    clang-20
x86_64                randconfig-074-20251017    clang-20
x86_64                randconfig-075-20251017    clang-20
x86_64                randconfig-076-20251017    clang-20
x86_64                randconfig-077-20251017    clang-20
x86_64                randconfig-078-20251017    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251016    gcc-10.5.0
xtensa                randconfig-001-20251017    clang-22
xtensa                randconfig-002-20251016    gcc-9.5.0
xtensa                randconfig-002-20251017    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

