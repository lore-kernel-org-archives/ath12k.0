Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47023103E183
	for <ath12k@archiver.kernel.org>; Wed, 18 Mar 2026 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kDq9qW0I2BV/E7FFzvK3Zm4skb3gFeTQio0f1nZSWQQ=; b=mObKMLT2Aij6GB3m2bHeQklfYY
	zJCmJe4gX36vO/f9+rcuG9gCzoLBrm0Vq9TmMbHzbcTqiBhlITS/CZRc1nPEA5iqTIUQ7dRiXZ8Q7
	FIwaVHqbPB/5HJKO9Zrhg6XobSaBxBpAFxfGUSBEnrHNsL2ilK3PXolKj3kkig45SW4LLSYL1Gwny
	6tmkET5n29xmDt6YhE+vx0fmchM8Xba42pXu7DhNCieIwGE6n9oOlh88Imt1289/zdcIuAL2W9ozb
	3PZ0f5/KvoWjFVjYl/8lFQyaXo7d5/+HMxpUZZOjN+Yo+kDVTVKX5TVKHTxyn1VjGu2a1D93SxaYT
	+R80Ln5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2s8z-00000008ca2-04d3;
	Wed, 18 Mar 2026 14:45:09 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2s8v-00000008cZa-476q
	for ath12k@lists.infradead.org;
	Wed, 18 Mar 2026 14:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773845106; x=1805381106;
  h=date:from:to:cc:subject:message-id;
  bh=TXmlPvFdDVkdKwhCuyraw89TkjR3qxKl4SVqbcnQTjs=;
  b=fUzeKII3ex/B1GNP89mikpcT++arzNW5TRq7qTJY0HVfzQG1MIP2BwgK
   bfIA4ZeiWO8I6ra7XqEI6zGf2fDgbkpUaWiZ0DnVdZ6IB3N+6qlU2R3Tv
   wwUjW5g2jhXFxIHnZkQq+ugWzq0HYFHM/bUrsCosmIXgo3xMvygffIvjR
   p7lU+RUR/Yfcabc0WXlHxaY8XNb3LIr2y9qIndR2vKNxrotmUi9dNpB0p
   tmTx8MAmZYkCKED87hPSGGdAUyQ6O2RfdJSraaoIP0JIMguOaUlEovlkh
   wnD3vCzCSeEYw3F2Gt+2HfyfvAu7WD9aT5Gzr1UiUWPU8Fcg0Bw0D0zUq
   w==;
X-CSE-ConnectionGUID: hfqCeiCDTHSqJ+45ncUIZw==
X-CSE-MsgGUID: Ug6MIW/8Tx+s6rpl+L8TyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74082001"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74082001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:45:05 -0700
X-CSE-ConnectionGUID: S5/CM2rwS/C//IwEukwOCw==
X-CSE-MsgGUID: NOJih0b0QHGu3T9C4br4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="253123589"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Mar 2026 07:45:03 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2s8r-0000000030v-0lfq;
	Wed, 18 Mar 2026 14:45:01 +0000
Date: Wed, 18 Mar 2026 22:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 e77fa9aaf082d1774b205275c5bffac5a5d1dcb3
Message-ID: <202603182216.sWPuagjI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_074506_030715_AA1035B1 
X-CRM114-Status: UNSURE (   3.73  )
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
branch HEAD: e77fa9aaf082d1774b205275c5bffac5a5d1dcb3  Add localversion-wireless-testing-ath

elapsed time: 1052m

configs tested: 191
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260318    gcc-8.5.0
arc                   randconfig-002-20260318    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-23
arm                   randconfig-001-20260318    gcc-8.5.0
arm                   randconfig-002-20260318    gcc-8.5.0
arm                   randconfig-003-20260318    gcc-8.5.0
arm                   randconfig-004-20260318    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260318    clang-23
arm64                 randconfig-002-20260318    clang-23
arm64                 randconfig-003-20260318    clang-23
arm64                 randconfig-004-20260318    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260318    clang-23
csky                  randconfig-002-20260318    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260318    gcc-8.5.0
hexagon               randconfig-002-20260318    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260318    gcc-14
i386        buildonly-randconfig-002-20260318    gcc-14
i386        buildonly-randconfig-003-20260318    gcc-14
i386        buildonly-randconfig-004-20260318    gcc-14
i386        buildonly-randconfig-005-20260318    gcc-14
i386        buildonly-randconfig-006-20260318    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260318    gcc-14
i386                  randconfig-002-20260318    gcc-14
i386                  randconfig-003-20260318    gcc-14
i386                  randconfig-004-20260318    gcc-14
i386                  randconfig-005-20260318    gcc-14
i386                  randconfig-006-20260318    gcc-14
i386                  randconfig-007-20260318    gcc-14
i386                  randconfig-011-20260318    clang-20
i386                  randconfig-012-20260318    clang-20
i386                  randconfig-013-20260318    clang-20
i386                  randconfig-014-20260318    clang-20
i386                  randconfig-015-20260318    clang-20
i386                  randconfig-016-20260318    clang-20
i386                  randconfig-017-20260318    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260318    gcc-8.5.0
loongarch             randconfig-002-20260318    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         apollo_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260318    gcc-8.5.0
nios2                 randconfig-002-20260318    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260318    gcc-11.5.0
parisc                randconfig-002-20260318    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260318    gcc-11.5.0
powerpc               randconfig-002-20260318    gcc-11.5.0
powerpc                     tqm8548_defconfig    clang-23
powerpc64             randconfig-001-20260318    gcc-11.5.0
powerpc64             randconfig-002-20260318    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260318    gcc-15.2.0
riscv                 randconfig-002-20260318    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260318    gcc-15.2.0
s390                  randconfig-002-20260318    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260318    gcc-15.2.0
sh                    randconfig-002-20260318    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260318    gcc-13.4.0
sparc                 randconfig-002-20260318    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260318    gcc-13.4.0
sparc64               randconfig-002-20260318    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260318    gcc-13.4.0
um                    randconfig-002-20260318    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260318    gcc-14
x86_64      buildonly-randconfig-002-20260318    gcc-14
x86_64      buildonly-randconfig-003-20260318    gcc-14
x86_64      buildonly-randconfig-004-20260318    gcc-14
x86_64      buildonly-randconfig-005-20260318    gcc-14
x86_64      buildonly-randconfig-006-20260318    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260318    gcc-14
x86_64                randconfig-002-20260318    gcc-14
x86_64                randconfig-003-20260318    gcc-14
x86_64                randconfig-004-20260318    gcc-14
x86_64                randconfig-005-20260318    gcc-14
x86_64                randconfig-006-20260318    gcc-14
x86_64                randconfig-011-20260318    clang-20
x86_64                randconfig-012-20260318    clang-20
x86_64                randconfig-013-20260318    clang-20
x86_64                randconfig-014-20260318    clang-20
x86_64                randconfig-015-20260318    clang-20
x86_64                randconfig-016-20260318    clang-20
x86_64                randconfig-071-20260318    gcc-14
x86_64                randconfig-072-20260318    gcc-14
x86_64                randconfig-073-20260318    gcc-14
x86_64                randconfig-074-20260318    gcc-14
x86_64                randconfig-075-20260318    gcc-14
x86_64                randconfig-076-20260318    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260318    gcc-13.4.0
xtensa                randconfig-002-20260318    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

