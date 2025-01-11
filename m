Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C3FE7719A
	for <ath12k@archiver.kernel.org>; Sat, 11 Jan 2025 23:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5KU0WNBnFTFtXwJDY51te3Scyz6S4XjNCf4CCvMPuH0=; b=rE2fLVG4wajOHsJKtV/Pzcw1oj
	gQi8y++A1AJuBpATV63Zgm0MpANn1kc1lKLkp9sz9JINAjU+V/wKV1+/j184/6tWt6m4jI+6fc0c6
	vU3ikzMf2hJTtLKN6CXZ0vaQBw83wuwmWtn5JhXQEd8EhWCP7tUa17uWD5mLyKzYqiGu8irc2H1lS
	X7HbENaRxqv8iIig25NbfQk7jIeivOrJ9xqOp+pN3fWi8jGvVzFQ2RK/yGkdWxV7VFex6NRNLgm6N
	6bdKI8xs5290NI1dMpJxOMhJdjI3XPXLoSfFxLZoBfmLwlC9szwkQWMizlrtWE/DITqfHJsxS4ast
	ScYion9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWkl5-00000001eE4-2Pf3
	for ath12k@archiver.kernel.org;
	Sat, 11 Jan 2025 23:19:11 +0000
Received: from [192.198.163.11] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWkl2-00000001eDd-2KIA
	for ath12k@lists.infradead.org;
	Sat, 11 Jan 2025 23:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736637548; x=1768173548;
  h=date:from:to:cc:subject:message-id;
  bh=ZgolOMXgpJ95swsls/JT7rGvh67UKnPXwEb9NFzKWAI=;
  b=c5+x9ciYgjwBK6Jn2tix7OvSVYXpiawiOF7pDThPY/OqoAVmvIbozx9L
   rz1iRJMG7gXhQMC7G6zwwA/vFkeJEt9hZq09NuAnYjUzAu/VRexdkYvt9
   f24iTkvvl+tYYGOGL+Y70VnlVl9FGVKDK9btlrg3Zzm+BZctUKB26Kn5s
   /6nm95wu6BYldznSxaVTPNpEWwftHktBMW2sLOYwrnnxZxGH/GJgO8pfT
   2Fnet4c9wsxlsbt+y/PISVUKZvBdeacu2OKMpDZP5qA4Z6vnW20HwsqYn
   csONqx18HYZFXQ4LV0iwAbyZZ2STatbDn9DnZyHzenP9v77rZNPcd1/YD
   w==;
X-CSE-ConnectionGUID: DKR0cD+MTyaSbdmsRLvIQg==
X-CSE-MsgGUID: a4z6INmlS+GFZzlKD5vJhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47476364"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="47476364"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 15:19:01 -0800
X-CSE-ConnectionGUID: xSFVG1SIRSSnRV4UvrmYuQ==
X-CSE-MsgGUID: 2yxtAIxrTTql8xPU1PINGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="103862770"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jan 2025 15:19:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWkkr-000LJb-0f;
	Sat, 11 Jan 2025 23:18:57 +0000
Date: Sun, 12 Jan 2025 07:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 e699188ad92e7dac9840b8be3046fa43474fc0ba
Message-ID: <202501120746.aEORhh2b-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_151908_646214_249C024D 
X-CRM114-Status: UNSURE (   4.19  )
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
branch HEAD: e699188ad92e7dac9840b8be3046fa43474fc0ba  Merge branch 'pending' into main-pending

elapsed time: 1447m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250111    gcc-13.2.0
arc                   randconfig-002-20250111    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-19
arm                   randconfig-001-20250111    clang-16
arm                   randconfig-002-20250111    gcc-14.2.0
arm                   randconfig-003-20250111    clang-20
arm                   randconfig-004-20250111    clang-20
arm                        shmobile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250111    gcc-14.2.0
arm64                 randconfig-002-20250111    clang-20
arm64                 randconfig-003-20250111    clang-18
arm64                 randconfig-004-20250111    clang-16
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250111    gcc-14.2.0
csky                  randconfig-002-20250111    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250111    clang-20
hexagon               randconfig-002-20250111    clang-15
i386        buildonly-randconfig-001-20250111    gcc-12
i386        buildonly-randconfig-002-20250111    gcc-11
i386        buildonly-randconfig-003-20250111    gcc-12
i386        buildonly-randconfig-004-20250111    gcc-12
i386        buildonly-randconfig-005-20250111    gcc-12
i386        buildonly-randconfig-006-20250111    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250111    gcc-14.2.0
loongarch             randconfig-002-20250111    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250111    gcc-14.2.0
nios2                 randconfig-002-20250111    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250111    gcc-14.2.0
parisc                randconfig-002-20250111    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   bluestone_defconfig    clang-20
powerpc               randconfig-001-20250111    gcc-14.2.0
powerpc               randconfig-002-20250111    gcc-14.2.0
powerpc               randconfig-003-20250111    gcc-14.2.0
powerpc64             randconfig-001-20250111    gcc-14.2.0
powerpc64             randconfig-002-20250111    gcc-14.2.0
powerpc64             randconfig-003-20250111    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250111    clang-18
riscv                 randconfig-001-20250112    clang-20
riscv                 randconfig-002-20250111    gcc-14.2.0
riscv                 randconfig-002-20250112    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250111    clang-20
s390                  randconfig-001-20250112    clang-16
s390                  randconfig-002-20250111    clang-19
s390                  randconfig-002-20250112    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250111    gcc-14.2.0
sh                    randconfig-001-20250112    gcc-14.2.0
sh                    randconfig-002-20250111    gcc-14.2.0
sh                    randconfig-002-20250112    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250111    gcc-14.2.0
sparc                 randconfig-001-20250112    gcc-14.2.0
sparc                 randconfig-002-20250111    gcc-14.2.0
sparc                 randconfig-002-20250112    gcc-14.2.0
sparc64               randconfig-001-20250111    gcc-14.2.0
sparc64               randconfig-001-20250112    gcc-14.2.0
sparc64               randconfig-002-20250111    gcc-14.2.0
sparc64               randconfig-002-20250112    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                    randconfig-001-20250111    clang-18
um                    randconfig-001-20250112    clang-20
um                    randconfig-002-20250111    clang-20
um                    randconfig-002-20250112    clang-20
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250111    clang-19
x86_64      buildonly-randconfig-002-20250111    gcc-12
x86_64      buildonly-randconfig-003-20250111    gcc-12
x86_64      buildonly-randconfig-004-20250111    clang-19
x86_64      buildonly-randconfig-005-20250111    gcc-12
x86_64      buildonly-randconfig-006-20250111    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250111    gcc-14.2.0
xtensa                randconfig-001-20250112    gcc-14.2.0
xtensa                randconfig-002-20250112    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

