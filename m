Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992D7D2F7D6
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 23:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5xoEPqB1s36GC41oOWadQ9WAEz8nSd7k1pESP5JFYI=; b=Ms2LP2wmt88gxRH3sSYZQtTP4Z
	o1SF6WUZyZkYrRB6gIsFZhoG9oPWQnIFfGvCYWXqzt8v1UyASd14YXwX9I3r4woE4TZYBESVW34/D
	svMCRvEXkeTn9rKisCM0496fCz4SpfFYlSi/K+9vB7nXru96ZS5u5uoz/5mhuiISEnbh12/dHOE7n
	2PgL5o1A1ME5ng5oafiiENRA+Rp5EyE9C6m1hYIQ5t7u0eyQtSFqQp0CEyQH97R9sXjxZZi+pC2fG
	07Vl/twSieqYYj/Sg0kHwqJzSivqJE5DoF8PELUSp4Xm2w/kkfYXpIvHnoB1DBQICZ63N1nzmms57
	vXKmC+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1DK3-0000000DDVR-1NEZ
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 23:20:55 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1DK0-0000000DDV0-1yPY
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 23:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729120852; x=1760656852;
  h=date:from:to:cc:subject:message-id;
  bh=SqvArui4TYY+ATOOhR0b7uD4Dc74ElRiRx8OcxGRYy4=;
  b=gjPhr4vL0icFUMV7GLw3OHKY9uLFhGreFvBDIvNVnxGhcCjKXsuSn015
   H7xASm9WjbJxI9Ju9ZZUq1JGE8gK9IcsSEO/+7r+40TfXDxmFRohS4qvM
   DYGDEqQ7uuRxxQh0SKfggfjfJJ9EFq/qHJz4LnM9n07+MzyS/g4PX398v
   FKZL4ZxITkJqOy4Pg04gzHTVZC0tk9N4tN2LqzcgwDS+PY005nKGkch3D
   5gAETOC29ZjrYznK66zHjbZDvDhZj2f0ZkFnellnoEslxV+9PJESkt60o
   +8pxZL6v6NvV06XNa8Bs7w2JOf9QUiXtrSusDUp5RwgM8fzKVtxMXjOIe
   A==;
X-CSE-ConnectionGUID: xAYax/S8TtinyzcvUpZh6g==
X-CSE-MsgGUID: nKgnu4RNSzu7/qatva199g==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32518701"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="32518701"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 16:20:48 -0700
X-CSE-ConnectionGUID: 1tmGya/YQoqEpH6sW1jrOA==
X-CSE-MsgGUID: 5mZfKPg1SM2H9XCApPURLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="78713346"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2024 16:20:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1DJs-000LVV-25;
	Wed, 16 Oct 2024 23:20:44 +0000
Date: Thu, 17 Oct 2024 07:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 15c3427eef15c3b9b6ebd87c3d42d5bd7212e320
Message-ID: <202410170713.GhpDdVYd-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_162052_552659_B9F4DFD5 
X-CRM114-Status: UNSURE (   3.84  )
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
branch HEAD: 15c3427eef15c3b9b6ebd87c3d42d5bd7212e320  Merge branch 'pending' into main-pending

elapsed time: 1543m

configs tested: 126
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                         haps_hs_defconfig    clang-14
arc                           tb10x_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         bcm2835_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                      integrator_defconfig    gcc-14.1.0
arm                   milbeaut_m10v_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                        spear3xx_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241016    gcc-11
i386        buildonly-randconfig-002-20241016    gcc-11
i386        buildonly-randconfig-003-20241016    gcc-11
i386        buildonly-randconfig-004-20241016    gcc-11
i386        buildonly-randconfig-005-20241016    gcc-11
i386        buildonly-randconfig-006-20241016    gcc-11
i386                                defconfig    clang-18
i386                  randconfig-001-20241016    gcc-11
i386                  randconfig-002-20241016    gcc-11
i386                  randconfig-003-20241016    gcc-11
i386                  randconfig-004-20241016    gcc-11
i386                  randconfig-005-20241016    gcc-11
i386                  randconfig-006-20241016    gcc-11
i386                  randconfig-011-20241016    gcc-11
i386                  randconfig-012-20241016    gcc-11
i386                  randconfig-013-20241016    gcc-11
i386                  randconfig-014-20241016    gcc-11
i386                  randconfig-015-20241016    gcc-11
i386                  randconfig-016-20241016    gcc-11
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5208evb_defconfig    clang-14
m68k                           virt_defconfig    clang-14
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip28_defconfig    clang-14
mips                           jazz_defconfig    clang-14
mips                      maltaaprp_defconfig    clang-14
mips                           mtx1_defconfig    gcc-14.1.0
mips                          rb532_defconfig    clang-14
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      bamboo_defconfig    clang-14
powerpc                     ksi8560_defconfig    clang-14
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc                     taishan_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-14
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    clang-14
sh                             espt_defconfig    gcc-14.1.0
sh                            migor_defconfig    gcc-14.1.0
sh                           se7705_defconfig    clang-14
sh                           se7750_defconfig    clang-14
sh                   sh7770_generic_defconfig    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    clang-14
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

