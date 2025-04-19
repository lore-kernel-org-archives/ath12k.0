Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EF9C369AB
	for <ath12k@archiver.kernel.org>; Sat, 19 Apr 2025 00:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eltoh4nu9GoNdSx7AS53CO8ye7GecvmJqVAJzF0Fa+M=; b=S1S+xx49XbfpDNASAqh3TrnPJk
	BQFW2AEoWt1D9FYTqRPHHKXeoj2/M3skEUXhy4JMEtQrO1IOCck9xgirb/2LRsxSbjdnHR3YYGyP/
	3r1GG+TBDVA9K50x4rSPxmqfx6233nc1D2fXJVbMVS/lq0Z2VzAmYnHcrlics8IdigJjhBfSjGLae
	CSqmo5T/B4FG5AiGdT6vI4II8gdRXCGiEv6vRWzgF659E0xy7/I67qhcEZw9CddLGRLcmboMEmC1p
	BNCqlCPf1JnpygQTDv71Wf7twZKq2HXN5SpWOeYKbb373EDA0hl6gw8RDpy+53KpuFu9FA1AZM7is
	a1pr6/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5w3R-00000000bOs-2u8l;
	Sat, 19 Apr 2025 00:27:33 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5w3P-00000000bOS-1wqO
	for ath12k@lists.infradead.org;
	Sat, 19 Apr 2025 00:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745022451; x=1776558451;
  h=date:from:to:cc:subject:message-id;
  bh=ZX1vnSF+qoV5BUBQSAsz5qc7hKQvBvETAgt1XFRPPhQ=;
  b=ZbCiS5XXy/QKRP68jfX89Fkq7gtUtpby5zV0hYWvn+QFO8Jt1gBSw+bb
   4xOkpbFZmvVa3fhfcTR5ElPfgIrPjemDwEY1SIWLu6UcSIiRVQFmCEES0
   djvTwwjvEbhoHpmSrpZWToaFgkgPcMjEv9deZOjrPnsr5QAZjfIefuhvA
   bHlkFRxGRNWrh57FBNhOM7LHDvRAoWLMjHswBq56MYfMzDJfMQS9uvw00
   G2j1h1q4f177zE5w9zNvR9qcB7Jk86XkKUIGzceNlZ/0b6/xyZp6blMn6
   KKhZqWYaW4dbMcaylPz2eQl5Aj2HOOxBN1M/jlVRTIXEVfZH2COy213E/
   w==;
X-CSE-ConnectionGUID: NNACde9CQYKPTPFlo73row==
X-CSE-MsgGUID: 9czrf8hFTz+hBd6KLYBZPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50486132"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="50486132"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 17:27:31 -0700
X-CSE-ConnectionGUID: zWb7kbiORzOWd6QiYk3FWw==
X-CSE-MsgGUID: quwZAcoYQa2QZ+a54Qp00g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="131813705"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Apr 2025 17:27:29 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5w3L-0003SX-0h;
	Sat, 19 Apr 2025 00:27:27 +0000
Date: Sat, 19 Apr 2025 08:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 d33705bb41ff786b537f8ed50a187a474db111c1
Message-ID: <202504190811.Z8zB4C01-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_172731_522115_C129E23F 
X-CRM114-Status: UNSURE (   3.76  )
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
branch HEAD: d33705bb41ff786b537f8ed50a187a474db111c1  Add localversion-wireless-testing-ath

elapsed time: 1456m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250418    gcc-14.2.0
arc                   randconfig-002-20250418    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-19
arm                           h3600_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-19
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250418    gcc-8.5.0
arm                   randconfig-002-20250418    gcc-7.5.0
arm                   randconfig-003-20250418    gcc-8.5.0
arm                   randconfig-004-20250418    clang-21
arm                        shmobile_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250418    clang-21
arm64                 randconfig-002-20250418    clang-21
arm64                 randconfig-003-20250418    clang-21
arm64                 randconfig-004-20250418    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250418    gcc-14.2.0
csky                  randconfig-002-20250418    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250418    clang-21
hexagon               randconfig-002-20250418    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250418    clang-20
i386        buildonly-randconfig-002-20250418    gcc-12
i386        buildonly-randconfig-003-20250418    clang-20
i386        buildonly-randconfig-004-20250418    gcc-12
i386        buildonly-randconfig-005-20250418    gcc-11
i386        buildonly-randconfig-006-20250418    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250418    gcc-14.2.0
loongarch             randconfig-002-20250418    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250418    gcc-10.5.0
nios2                 randconfig-002-20250418    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250418    gcc-11.5.0
parisc                randconfig-002-20250418    gcc-13.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc                       eiger_defconfig    clang-21
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250418    gcc-8.5.0
powerpc               randconfig-002-20250418    gcc-6.5.0
powerpc               randconfig-003-20250418    clang-21
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-21
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250418    clang-21
powerpc64             randconfig-002-20250418    clang-21
powerpc64             randconfig-003-20250418    clang-17
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250418    clang-21
riscv                 randconfig-002-20250418    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250418    gcc-7.5.0
s390                  randconfig-002-20250418    gcc-6.5.0
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250418    gcc-12.4.0
sh                    randconfig-002-20250418    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250418    gcc-10.3.0
sparc                 randconfig-002-20250418    gcc-7.5.0
sparc64               randconfig-001-20250418    gcc-9.3.0
sparc64               randconfig-002-20250418    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250418    clang-21
um                    randconfig-002-20250418    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250418    clang-20
x86_64      buildonly-randconfig-002-20250418    clang-20
x86_64      buildonly-randconfig-003-20250418    clang-20
x86_64      buildonly-randconfig-004-20250418    clang-20
x86_64      buildonly-randconfig-005-20250418    clang-20
x86_64      buildonly-randconfig-006-20250418    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250418    gcc-7.5.0
xtensa                randconfig-002-20250418    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

