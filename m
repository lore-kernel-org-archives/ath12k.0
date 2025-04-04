Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E74C3601A
	for <ath12k@archiver.kernel.org>; Fri,  4 Apr 2025 01:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JtzGHLp+98t096lH08rebOY8JXyMYtlGIgSVDVdxCAQ=; b=2uiDvoDSmNMrz8CnnxxWIvPbMO
	4He0uA5DUxSTaAGqf/4y9M40vMa62oNmxEAjKOEE+IWVLUPa8iawOEnCV9bfYGE3Jb/78bqp8u7Lg
	bGmA82TUKrk2WKa1TV9XBFu7jFAsSJyGyls/FpWfLP0w0RuxsTZ6ABM8Y//wlIWXOjAwUDUsMXaKj
	Ahv1slQ0oRUdbj5FgbzG3OhpQnRsxNbvTTHniI2EJZmqvHT2H9CpH1BMTwZfF021JoVJPMq5CKF0H
	6bMAdoveWzStARlTHgwPt3x0GN8ob4XkHYFdYwAOF36LK+SGZaDUWQ47CrbnTqWv3idlyR7KTGVE9
	shPEGZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0VZl-0000000AWB1-3RaA
	for ath12k@archiver.kernel.org;
	Fri, 04 Apr 2025 01:10:29 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0VZi-0000000AWAW-3Um2
	for ath12k@lists.infradead.org;
	Fri, 04 Apr 2025 01:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743729027; x=1775265027;
  h=date:from:to:cc:subject:message-id;
  bh=N1SjjG0nzT9sX/rk1Wl+E4kAbYFre8L2Bb0NKSjxOss=;
  b=cc35U9Sincp/Dgwhw6nBx0PC/xKuGAjawKulNdDv+ab5Kgl6+KSzIrrp
   Ucyc6s8lXrX9d/Dka5HpObK0ixzvVxV7w5zfpx/ZYTrf5Xw9ZuYQ8rhkZ
   INoaZHvEIu9JeZJquizAvnuhzZOt6cB/gqNkUJogRYAvcRBXeitmqckiT
   exf/HpZ6zhoupQnh9c2ZGt/cVPfWj9zMyG1LH9TLjmoM4KcsmOkkfhJfP
   3MxQ+dWJR6YfyqTzwE/LPp/nZ9+Nr+X1ONV9QntEo5ALbpYErQ9PdipeJ
   O4UrxCkwZkk43D9BRQ6Dd1O6swb+fktMUl3Oofe+BHgSCC1qXwOdJ9D3Z
   w==;
X-CSE-ConnectionGUID: vOIVwsodSbaBkintOOP98w==
X-CSE-MsgGUID: e3qTFv/RTwiOLK2jNEeX5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44878524"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="44878524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 18:10:23 -0700
X-CSE-ConnectionGUID: 6kqf2ojqQ0KFsZ+suLFsVw==
X-CSE-MsgGUID: Q0Ue1v3RTpqUkrUrOe4jqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="127073499"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2025 18:10:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0VZb-0000tv-2e;
	Fri, 04 Apr 2025 01:10:19 +0000
Date: Fri, 04 Apr 2025 09:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 8a9b1e359d9eb3085dfd80c2e9872c07030fb4d7
Message-ID: <202504040944.F0SbVBwv-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_181026_915879_8319B8A0 
X-CRM114-Status: UNSURE (   3.54  )
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
branch HEAD: 8a9b1e359d9eb3085dfd80c2e9872c07030fb4d7  Merge branch 'pending' into main-pending

elapsed time: 1460m

configs tested: 140
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250403    gcc-14.2.0
arc                   randconfig-002-20250403    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-15
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250403    clang-21
arm                   randconfig-002-20250403    gcc-8.5.0
arm                   randconfig-003-20250403    clang-21
arm                   randconfig-004-20250403    gcc-8.5.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250403    gcc-6.5.0
arm64                 randconfig-002-20250403    clang-16
arm64                 randconfig-003-20250403    clang-17
arm64                 randconfig-004-20250403    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250403    gcc-14.2.0
csky                  randconfig-002-20250403    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250403    clang-21
hexagon               randconfig-002-20250403    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250403    clang-20
i386        buildonly-randconfig-002-20250403    clang-20
i386        buildonly-randconfig-003-20250403    clang-20
i386        buildonly-randconfig-004-20250403    gcc-12
i386        buildonly-randconfig-005-20250403    gcc-12
i386        buildonly-randconfig-006-20250403    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250403    gcc-12.4.0
loongarch             randconfig-002-20250403    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
mips                           ip32_defconfig    clang-21
mips                           jazz_defconfig    clang-17
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250403    gcc-10.5.0
nios2                 randconfig-002-20250403    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250403    gcc-13.3.0
parisc                randconfig-002-20250403    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      chrp32_defconfig    clang-19
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250403    clang-16
powerpc               randconfig-002-20250403    gcc-6.5.0
powerpc               randconfig-003-20250403    clang-21
powerpc64             randconfig-001-20250403    clang-19
powerpc64             randconfig-002-20250403    clang-17
powerpc64             randconfig-003-20250403    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250403    clang-21
riscv                 randconfig-002-20250403    clang-21
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250403    gcc-9.3.0
s390                  randconfig-002-20250403    gcc-7.5.0
s390                       zfcpdump_defconfig    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250403    gcc-6.5.0
sh                    randconfig-002-20250403    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250403    gcc-11.5.0
sparc                 randconfig-002-20250403    gcc-13.3.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250403    gcc-7.5.0
sparc64               randconfig-002-20250403    gcc-13.3.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250403    clang-19
um                    randconfig-002-20250403    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250403    clang-20
x86_64      buildonly-randconfig-002-20250403    clang-20
x86_64      buildonly-randconfig-003-20250403    clang-20
x86_64      buildonly-randconfig-004-20250403    clang-20
x86_64      buildonly-randconfig-005-20250403    gcc-11
x86_64      buildonly-randconfig-006-20250403    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250403    gcc-11.5.0
xtensa                randconfig-002-20250403    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

