Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F006DC0218C
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 06:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R6DrdWnuP1jEVQ85/3ZQHjFacIot0eTGPwqxokuPYoU=; b=wyy86XruFJcI8HizCNMZV4M2aZ
	oEfZDtcW/6HMYcmAv1ujWej4QpVSSdg9QcCjkJy1wDGlzPsa9W3ubNfuH7MEQyMD2fiq+b8a3YGhE
	goPATa3+OkDaMUhZw8ONYZrnh/Ak0l08unHlWERJu7lWIEXq+00ytlc0n3G7XQ8id08KerZWFa9UU
	SIUKdscKEArH9iBnaI3IB/wS9r87BIozxbjzWRmQHI09Fn5apPLjQ4eo22+Mht2t+d1q42H+3mqP9
	YO9Eg0xlgzXhobZS7LdfGwTcGHbPgOlNZWD7EVllVQB5umMYPMkU69pq95PZBRiAj6oKFC1x8BGFf
	4ymq+4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcIia-00000001jVD-2iQT
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 06:35:32 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcIiY-00000001jUu-1euz
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 06:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737959730; x=1769495730;
  h=date:from:to:cc:subject:message-id;
  bh=uf3V73CxBnuk237WNqMJPpXRli8fEMXsbZq6qT8X9NQ=;
  b=XIdkwUGpI34PkHfrVMsQv9025ui1kPVzWSuEAhiLx5c+YTbn2cI3nYOF
   9TTT3VB0a0sGFB++mHlDDYSs9bJF+yOAfYdTObw6PgS95bYbhxfCoqcrA
   /eMcRE9yLkDQpuFA/oTYOzqRTe2uaMiaA7La2KPxb62nHYr6P+kds9kEt
   mvzZ9jQlhMTPMxVXp0glhqkvAmod7VbsbTNaqA5m/wOX4KQhW9/JEY+ws
   A44GE7gwvmP9F0YBTyix8VWAITuy9r+Y4KftZkkSZgYqINbNL2AS86IOR
   mMNrP78w+scKIhVEEe18wL9NUY+8WK3rUoWEzCXF1CwlyKtLwD09mvJX/
   Q==;
X-CSE-ConnectionGUID: Wig1nTE9QDqaFO0rJdIohg==
X-CSE-MsgGUID: jgMhZMnJR7Om+5NiTxA0Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="49066589"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="49066589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 22:35:24 -0800
X-CSE-ConnectionGUID: eHBNxnt4R5KFngTktYaXYw==
X-CSE-MsgGUID: 3wJWVC38QSml+SJ972NUOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113314390"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Jan 2025 22:35:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcIiO-000gUx-1i;
	Mon, 27 Jan 2025 06:35:20 +0000
Date: Mon, 27 Jan 2025 14:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 e7f5d62ccb863ce569436afabcba5db59d32a884
Message-ID: <202501271457.bvXhMAx1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_223530_482816_BEAB116C 
X-CRM114-Status: UNSURE (   4.35  )
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
branch HEAD: e7f5d62ccb863ce569436afabcba5db59d32a884  Merge branch 'pending' into main-pending

elapsed time: 724m

configs tested: 141
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                   randconfig-001-20250127    gcc-13.2.0
arc                   randconfig-002-20250127    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-20
arm                   randconfig-001-20250127    gcc-14.2.0
arm                   randconfig-002-20250127    gcc-14.2.0
arm                   randconfig-003-20250127    clang-16
arm                   randconfig-004-20250127    clang-18
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250127    gcc-14.2.0
arm64                 randconfig-002-20250127    gcc-14.2.0
arm64                 randconfig-003-20250127    gcc-14.2.0
arm64                 randconfig-004-20250127    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250127    gcc-14.2.0
csky                  randconfig-002-20250127    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250127    clang-17
hexagon               randconfig-002-20250127    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250127    gcc-12
i386        buildonly-randconfig-002-20250127    clang-19
i386        buildonly-randconfig-003-20250127    gcc-12
i386        buildonly-randconfig-004-20250127    gcc-12
i386        buildonly-randconfig-005-20250127    gcc-12
i386        buildonly-randconfig-006-20250127    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250127    gcc-14.2.0
loongarch             randconfig-002-20250127    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-20
mips                           ip28_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250127    gcc-14.2.0
nios2                 randconfig-002-20250127    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250127    gcc-14.2.0
parisc                randconfig-002-20250127    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                       ppc64_defconfig    clang-19
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250127    clang-16
powerpc               randconfig-002-20250127    gcc-14.2.0
powerpc               randconfig-003-20250127    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-19
powerpc                        warp_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250127    gcc-14.2.0
powerpc64             randconfig-002-20250127    gcc-14.2.0
powerpc64             randconfig-003-20250127    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250127    clang-20
riscv                 randconfig-002-20250127    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250127    clang-20
s390                  randconfig-002-20250127    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250127    gcc-14.2.0
sh                    randconfig-002-20250127    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250127    gcc-14.2.0
sparc                 randconfig-002-20250127    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250127    gcc-14.2.0
sparc64               randconfig-002-20250127    gcc-14.2.0
um                               alldefconfig    clang-19
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250127    clang-20
um                    randconfig-002-20250127    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250127    clang-19
x86_64      buildonly-randconfig-002-20250127    clang-19
x86_64      buildonly-randconfig-003-20250127    clang-19
x86_64      buildonly-randconfig-004-20250127    clang-19
x86_64      buildonly-randconfig-005-20250127    gcc-12
x86_64      buildonly-randconfig-006-20250127    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250127    gcc-14.2.0
xtensa                randconfig-002-20250127    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

