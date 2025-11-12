Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C72CD342F
	for <ath12k@archiver.kernel.org>; Wed, 12 Nov 2025 17:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aOzUveuibbFYP9Z5tHvFDWyzvE50nPQfy2DMU7BspZk=; b=D7PyUuqZhUO/d56at1v24KyfbH
	C7slYfis60U5Ftexu+iNqOL60S7wPja+uoUJ6XgkPpYJZAWUpkY6GyyOF3sfdXhhkI5qwx/eOv5Rc
	R1i5tyA6Ez83nV7pZoXVFDw/MJ7yhtUeRGZIb/inQNzcM4QXYnmeGbrb7q8L8YMeNpIpKVIgvzKUZ
	iEiYkDiHF4qpIAH3XvaBwdIQGRsy41a7faqXkvysBJi9v510BLIr8HWQwGjaKW1Am6NChvfrdD4rL
	JLB9hAN5Nh2UGlfAEAkNz04k/MH5CcCE16QJvUwPnHPUFpA/8aDzuhUeVdpQnx6oHMfv5H56Z9O8I
	QJHSVuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEnb-00000009G7b-1Ck5;
	Wed, 12 Nov 2025 17:38:27 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEnY-00000009G6z-2aQo
	for ath12k@lists.infradead.org;
	Wed, 12 Nov 2025 17:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762969104; x=1794505104;
  h=date:from:to:cc:subject:message-id;
  bh=nZY0Zc3tran+gQ5vUJE2n6/K2CG6Rqd/oRiAK0ncWKs=;
  b=LYOfX9fhRccU3JirmjkrazhJSQGg1H6ZSsxnknD0PkoqP9LMAd0+UsCS
   eMLVfzXlOtV4a0U7rorGL7E6nNT22TZbwvhkzuz79QS9xaTrXM23fGIv3
   dOCYBMj1S/hdq3yhU6yP7e2y6gqoRNqc2grfGIgvhGxeI/t8gZKx1rtfp
   e/iX+g1dZBxnt4onhN8CTE7hLToVJFfpFWrQeypN1U0Ree53O3WKgEb+5
   xjIqZqtsqNUnRLEP6kyNPCNEgajw41YUWOZkRuK06ppHj4p54gxAIp31w
   CbUepTKKcqo1otcS1RoF7NF7XD7glpvppo6Mecg+p6jAkClQLxgWJygb+
   g==;
X-CSE-ConnectionGUID: 3+UkG5ZtSvWwB6lYmZDYrQ==
X-CSE-MsgGUID: 6ChDswUATLC6unsauoB7RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68902599"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="68902599"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 09:38:22 -0800
X-CSE-ConnectionGUID: xmV3c7X7TjOUnz/qXTBlDQ==
X-CSE-MsgGUID: Xfmn1X1KQv6+R4wcsyaf/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="189125152"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Nov 2025 09:38:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJEnT-0004Tn-1i;
	Wed, 12 Nov 2025 17:38:19 +0000
Date: Thu, 13 Nov 2025 01:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 7cd7392a07782b8ad4aa6360e4be1967af2eab04
Message-ID: <202511130123.ijDk1vsv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_093824_693558_102B1DF2 
X-CRM114-Status: UNSURE (   4.17  )
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
branch HEAD: 7cd7392a07782b8ad4aa6360e4be1967af2eab04  wifi: ath12k: Remove Wi-Fi 7 header dependencies from common ath12k module

elapsed time: 1527m

configs tested: 121
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251112    gcc-8.5.0
arc                   randconfig-002-20251112    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                            hisi_defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20251112    gcc-8.5.0
arm                   randconfig-002-20251112    clang-22
arm                   randconfig-003-20251112    clang-22
arm                   randconfig-004-20251112    gcc-14.3.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251112    clang-22
arm64                 randconfig-002-20251112    gcc-10.5.0
arm64                 randconfig-003-20251112    gcc-8.5.0
arm64                 randconfig-004-20251112    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251112    gcc-13.4.0
csky                  randconfig-002-20251112    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251112    clang-16
hexagon               randconfig-002-20251112    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251112    clang-20
i386        buildonly-randconfig-002-20251112    gcc-14
i386        buildonly-randconfig-003-20251112    clang-20
i386        buildonly-randconfig-004-20251112    clang-20
i386        buildonly-randconfig-005-20251112    gcc-13
i386        buildonly-randconfig-006-20251112    clang-20
i386                  randconfig-001-20251112    gcc-14
i386                  randconfig-002-20251112    gcc-14
i386                  randconfig-003-20251112    gcc-14
i386                  randconfig-004-20251112    clang-20
i386                  randconfig-005-20251112    clang-20
i386                  randconfig-006-20251112    clang-20
i386                  randconfig-007-20251112    gcc-13
i386                  randconfig-011-20251112    gcc-14
i386                  randconfig-012-20251112    gcc-14
i386                  randconfig-013-20251112    clang-20
i386                  randconfig-014-20251112    clang-20
i386                  randconfig-015-20251112    clang-20
i386                  randconfig-016-20251112    gcc-14
i386                  randconfig-017-20251112    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251112    gcc-15.1.0
loongarch             randconfig-002-20251112    gcc-13.4.0
m68k                              allnoconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
mips                         db1xxx_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251112    gcc-11.5.0
nios2                 randconfig-002-20251112    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251112    gcc-9.5.0
parisc                randconfig-002-20251112    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251112    clang-22
powerpc               randconfig-002-20251112    clang-22
powerpc64             randconfig-001-20251112    clang-22
powerpc64             randconfig-002-20251112    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                          kfr2r09_defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251112    gcc-8.5.0
sparc                 randconfig-002-20251112    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251112    gcc-8.5.0
sparc64               randconfig-002-20251112    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251112    gcc-14
um                    randconfig-002-20251112    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           alldefconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251112    clang-20
x86_64      buildonly-randconfig-002-20251112    clang-20
x86_64      buildonly-randconfig-003-20251112    clang-20
x86_64      buildonly-randconfig-004-20251112    clang-20
x86_64      buildonly-randconfig-005-20251112    gcc-14
x86_64      buildonly-randconfig-006-20251112    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251112    clang-20
x86_64                randconfig-012-20251112    gcc-14
x86_64                randconfig-013-20251112    gcc-14
x86_64                randconfig-014-20251112    clang-20
x86_64                randconfig-015-20251112    clang-20
x86_64                randconfig-016-20251112    clang-20
x86_64                randconfig-071-20251112    clang-20
x86_64                randconfig-072-20251112    clang-20
x86_64                randconfig-073-20251112    clang-20
x86_64                randconfig-074-20251112    gcc-13
x86_64                randconfig-075-20251112    clang-20
x86_64                randconfig-076-20251112    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251112    gcc-12.5.0
xtensa                randconfig-002-20251112    gcc-8.5.0
xtensa                         virt_defconfig    gcc-15.1.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

