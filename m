Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86BDCCD1BF
	for <ath12k@archiver.kernel.org>; Tue, 28 Oct 2025 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HAcUUE/+uYOiJXIxSl2vp4KRe4F6fpk+5AOXMIhD4Lk=; b=oUx24Hdu77MGYwJa1P7u7kMjGl
	gJ/thuSiHKTcTRwFs5xx8r/TnhxRWFsXK8amfeg/0ojxm2cPWxZgL3fzIy2YT7pjtvOzTr9Q5eA4c
	qde5jWa2xfgu1G6z3qFSPzWYudIOP668pzvh/IpOuaLAi5EzwOeEFshBsf49L8YJIM3O9P44dBMvD
	13GTKW7wtoRUJL6kRIAGo+wS3sP1z9RnoHdJW+3SJ8y4yyAs3AhEKz08DimfMQyIcpaVz1Ar2orjl
	O5t+aKRG3QbBpMlGctOYns3yS3o/GSNu5Sr32Cziaf0JDfygczLi000P0XPyNwNNdk35efWh/q+JI
	wJxUvJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkr6-0000000G6MI-0jBM;
	Tue, 28 Oct 2025 14:39:24 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkr3-0000000G6Lz-2gWC
	for ath12k@lists.infradead.org;
	Tue, 28 Oct 2025 14:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761662361; x=1793198361;
  h=date:from:to:cc:subject:message-id;
  bh=qiLDCeK6sikvvin2JhkFor8efwG9iOLcDccLlj5Y3hE=;
  b=BdaBxrCiyMnLCoT+6ijZcLXrfjjT5CwhKxLHCB/cAh5Gd0/qnXH8CQ/K
   4bKB4BDNmONuvTwwZexbsuQlSZ95M1ip7Ac4MUHE/78bvn/Ugc0qgiosJ
   MOCeXr9k7wtCInqls/zRBIY4A4978I6xD/r9AnxJwgUhzLfkoc7T7neHz
   SNdual3Ji8VOAIPt2B8JFIjtTP55m/O6d3r5Zp2ta9N+rsSPRtEbzLbmX
   4bvvsxvh/9fS48KONwZ4jUMyWLUymULncC90siHqtWQnJwCOCvKPR/kr0
   RSwjP5NgIXRc4uoBzoVkItOKvl7xx6BbHyYVraoFuZMZuTYodDrjoaQ5X
   A==;
X-CSE-ConnectionGUID: Xry2yL8uRCewE7j+GxSrUA==
X-CSE-MsgGUID: tAyztLKpTAaBVYh4Bog9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81394106"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="81394106"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:39:21 -0700
X-CSE-ConnectionGUID: shFgug5HQJ+fv7sEQMT35g==
X-CSE-MsgGUID: secp8+o3SiS1MIhzYxp1CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="184990792"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 07:39:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkqi-000JFQ-04;
	Tue, 28 Oct 2025 14:39:01 +0000
Date: Tue, 28 Oct 2025 22:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 6633dca572d8f599b0a1ead0f145a52049ec7709
Message-ID: <202510282203.tjN1Of07-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_073921_721253_8EDC914E 
X-CRM114-Status: UNSURE (   4.03  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-ath12k-ng
branch HEAD: 6633dca572d8f599b0a1ead0f145a52049ec7709  wifi: ath12k: Add lockdep warn for RCU

elapsed time: 1459m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251027    gcc-8.5.0
arc                   randconfig-001-20251028    gcc-8.5.0
arc                   randconfig-002-20251027    gcc-8.5.0
arc                   randconfig-002-20251028    gcc-13.4.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20251027    clang-22
arm                   randconfig-001-20251028    clang-22
arm                   randconfig-002-20251027    clang-22
arm                   randconfig-002-20251028    clang-22
arm                   randconfig-003-20251027    gcc-8.5.0
arm                   randconfig-003-20251028    clang-22
arm                   randconfig-004-20251027    clang-22
arm                   randconfig-004-20251028    gcc-8.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251027    clang-22
arm64                 randconfig-001-20251028    clang-22
arm64                 randconfig-002-20251027    gcc-12.5.0
arm64                 randconfig-002-20251028    clang-22
arm64                 randconfig-003-20251027    gcc-9.5.0
arm64                 randconfig-003-20251028    gcc-11.5.0
arm64                 randconfig-004-20251027    clang-22
arm64                 randconfig-004-20251028    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251028    gcc-15.1.0
csky                  randconfig-002-20251028    gcc-15.1.0
hexagon                          alldefconfig    clang-22
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251028    clang-22
hexagon               randconfig-002-20251028    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251027    gcc-13
i386        buildonly-randconfig-002-20251027    clang-20
i386        buildonly-randconfig-003-20251027    clang-20
i386        buildonly-randconfig-004-20251027    gcc-14
i386        buildonly-randconfig-005-20251027    clang-20
i386        buildonly-randconfig-006-20251027    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251028    gcc-12.5.0
loongarch             randconfig-002-20251028    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    gcc-11.5.0
nios2                 randconfig-001-20251028    gcc-8.5.0
nios2                 randconfig-002-20251028    gcc-9.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251028    gcc-9.5.0
parisc                randconfig-002-20251028    gcc-8.5.0
powerpc                     akebono_defconfig    clang-22
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                  mpc866_ads_defconfig    clang-22
powerpc               randconfig-001-20251028    gcc-15.1.0
powerpc               randconfig-002-20251028    gcc-11.5.0
powerpc               randconfig-003-20251028    gcc-8.5.0
powerpc64             randconfig-001-20251028    clang-22
powerpc64             randconfig-002-20251028    clang-22
powerpc64             randconfig-003-20251028    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20251028    clang-22
riscv                 randconfig-002-20251028    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251028    clang-22
s390                  randconfig-002-20251028    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251028    gcc-15.1.0
sh                    randconfig-002-20251028    gcc-13.4.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sh                           se7722_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251028    gcc-8.5.0
sparc                 randconfig-002-20251028    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251028    clang-22
sparc64               randconfig-002-20251028    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251028    gcc-14
um                    randconfig-002-20251028    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251027    gcc-14
x86_64      buildonly-randconfig-002-20251027    gcc-14
x86_64      buildonly-randconfig-003-20251027    gcc-14
x86_64      buildonly-randconfig-004-20251027    gcc-14
x86_64      buildonly-randconfig-005-20251027    gcc-14
x86_64      buildonly-randconfig-006-20251027    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251028    gcc-15.1.0
xtensa                randconfig-002-20251028    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

