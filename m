Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D421BD3E77A
	for <ath12k@archiver.kernel.org>; Wed, 10 Dec 2025 20:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSNCkTZtnNURDOLDEbqVBZGNtZHDTS5r2WAUcKtAR0k=; b=jUzLFB9JSkS97tbRJk0r31nar8
	lWNBYD/lus1odnCIA5er3We1UF0XV0JEwySd6ldVS73VQrR4OkMhYzjr6fitgkG3BzHh1WFobMw+3
	qmLdkkH4BdNBuxi5N2hNQHWonPVMITFZ/gNk7Ha33+Qt6CdWyLFHr8914fGypxsiZs7OP3AgTC/1C
	EYDu4dAne7YXU7t6FqDmv7DBhYKg/FWmxeINbT6maE1//YWkYM7MtMPP30bqRlI3dlS42n/MIssA8
	xgAKzM1tX81iofwfwXv0nfPTE648bE2qNk1Stvz524fANNu3FKF2ffXKfiTMnvSzcpe0WgM/FMVP0
	gb0wN2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQxg-0000000Fr5d-2BNQ;
	Wed, 10 Dec 2025 20:39:00 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQxe-0000000Fr5H-0T1B
	for ath12k@lists.infradead.org;
	Wed, 10 Dec 2025 20:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765399138; x=1796935138;
  h=date:from:to:cc:subject:message-id;
  bh=v0RMUTcxjYwhVlRS1A8V0gnigU5C15vUf++OfdtF81Y=;
  b=i0kibBskt6vJB2DmcotPKKbWnvwIWMfLgBIlkZrPIvoOpa8bt1DAsV45
   8/73aL+b883x6asiFXzMgnudnC2jschBqPBc9OzsK3FJa1Zp/AvXeyJG0
   1+RGgK/Gs8Dl7DbiHql9IGjzjjAkHZBP2heXQlDZ3fMUls8PJWWqn+PFL
   g2kKt0mLx9sIqoskllnNrxetsMHzjLrJ5mS3zC+9278J2sKkAI5KggdtI
   jEbFR9aufWnjwDswl1uNTkI0I130IoU4MSgrUZi5cfcq7Rcw6GIFeQw+h
   CEOVk2MBW3PjoMyuBMAzzlHWPWx/rm4RC24rm0heYtvg01dcC+f6EozFH
   w==;
X-CSE-ConnectionGUID: qignoT8ORceW6vpsp8Uiew==
X-CSE-MsgGUID: BYHfbT3oQxC1LLi1jR2ppQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67455583"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67455583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 12:38:56 -0800
X-CSE-ConnectionGUID: yqZxxuthQviy+pKczNklvQ==
X-CSE-MsgGUID: 6AtkirylR4mF0zUab/HTCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196370620"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2025 12:38:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTQxY-000000003kP-0Z9H;
	Wed, 10 Dec 2025 20:38:52 +0000
Date: Thu, 11 Dec 2025 04:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 5a58414fe107e4844e0b5b33e94d8f3e563cd38e
Message-ID: <202512110448.YJFGzFtY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_123858_190569_45A4EDBF 
X-CRM114-Status: UNSURE (   3.20  )
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
branch HEAD: 5a58414fe107e4844e0b5b33e94d8f3e563cd38e  wifi: ath12k: Skip DP peer creation for scan vdev

elapsed time: 1535m

configs tested: 101
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                         defconfig    gcc-15.1.0
arc                           defconfig    gcc-15.1.0
arc             randconfig-001-20251211    gcc-8.5.0
arc             randconfig-002-20251211    gcc-14.3.0
arm                           defconfig    clang-22
arm                 multi_v4t_defconfig    clang-16
arm                       mxs_defconfig    clang-22
arm             randconfig-001-20251211    gcc-8.5.0
arm             randconfig-002-20251211    gcc-10.5.0
arm             randconfig-003-20251211    clang-22
arm             randconfig-004-20251211    clang-22
arm                  spear3xx_defconfig    clang-17
arm                     u8500_defconfig    gcc-15.1.0
arm64                         defconfig    gcc-15.1.0
csky                          defconfig    gcc-15.1.0
hexagon                       defconfig    clang-22
hexagon         randconfig-001-20251211    clang-19
hexagon         randconfig-002-20251211    clang-17
i386                       allmodconfig    gcc-14
i386                       allyesconfig    gcc-14
i386                          defconfig    clang-20
i386            randconfig-001-20251211    gcc-14
i386            randconfig-002-20251211    clang-20
i386            randconfig-003-20251211    clang-20
i386            randconfig-004-20251211    gcc-14
i386            randconfig-005-20251211    clang-20
i386            randconfig-006-20251211    gcc-14
i386            randconfig-007-20251211    clang-20
i386            randconfig-011-20251211    gcc-14
loongarch                     defconfig    clang-19
loongarch       randconfig-001-20251211    gcc-14.3.0
loongarch       randconfig-002-20251211    clang-18
m68k                 bvme6000_defconfig    gcc-15.1.0
m68k                          defconfig    gcc-15.1.0
microblaze                    defconfig    gcc-15.1.0
mips                    ath25_defconfig    clang-22
mips                  vocore2_defconfig    clang-22
nios2                         defconfig    gcc-11.5.0
nios2           randconfig-001-20251211    gcc-8.5.0
nios2           randconfig-002-20251211    gcc-8.5.0
openrisc                      defconfig    gcc-15.1.0
parisc                        defconfig    gcc-15.1.0
parisc          randconfig-001-20251211    gcc-14.3.0
parisc          randconfig-002-20251211    gcc-8.5.0
parisc64                      defconfig    gcc-15.1.0
powerpc               kmeter1_defconfig    gcc-15.1.0
powerpc           mpc834x_itx_defconfig    clang-16
powerpc         randconfig-001-20251211    clang-22
powerpc         randconfig-002-20251211    clang-22
powerpc                tqm8xx_defconfig    clang-19
powerpc64       randconfig-001-20251211    gcc-8.5.0
powerpc64       randconfig-002-20251211    gcc-13.4.0
riscv                         defconfig    clang-22
riscv       nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv           randconfig-001-20251210    gcc-8.5.0
riscv           randconfig-002-20251210    clang-22
s390                          defconfig    clang-22
s390            randconfig-001-20251210    clang-22
s390            randconfig-002-20251210    gcc-9.5.0
sh                            defconfig    gcc-15.1.0
sh                  edosk7760_defconfig    gcc-15.1.0
sh               magicpanelr2_defconfig    gcc-15.1.0
sh              randconfig-001-20251210    gcc-12.5.0
sh              randconfig-002-20251210    gcc-15.1.0
sh                     se7724_defconfig    gcc-15.1.0
sparc                         defconfig    gcc-15.1.0
sparc           randconfig-001-20251211    gcc-11.5.0
sparc           randconfig-002-20251211    gcc-8.5.0
sparc64                       defconfig    clang-20
sparc64         randconfig-001-20251211    gcc-8.5.0
sparc64         randconfig-002-20251211    gcc-8.5.0
um                            defconfig    clang-22
um                       i386_defconfig    gcc-14
um              randconfig-001-20251211    clang-22
um              randconfig-002-20251211    gcc-14
um                     x86_64_defconfig    clang-22
x86_64                     allmodconfig    clang-20
x86_64                     allyesconfig    clang-20
x86_64                        defconfig    gcc-14
x86_64          randconfig-001-20251210    gcc-14
x86_64          randconfig-002-20251210    gcc-14
x86_64          randconfig-003-20251210    gcc-14
x86_64          randconfig-004-20251210    clang-20
x86_64          randconfig-005-20251210    clang-20
x86_64          randconfig-006-20251210    clang-20
x86_64          randconfig-011-20251211    gcc-14
x86_64          randconfig-012-20251211    gcc-14
x86_64          randconfig-013-20251211    clang-20
x86_64          randconfig-014-20251211    clang-20
x86_64          randconfig-015-20251211    clang-20
x86_64          randconfig-016-20251211    gcc-14
x86_64          randconfig-071-20251211    gcc-14
x86_64          randconfig-072-20251211    clang-20
x86_64          randconfig-073-20251211    gcc-14
x86_64          randconfig-074-20251211    clang-20
x86_64          randconfig-075-20251211    clang-20
x86_64          randconfig-076-20251211    clang-20
x86_64                    rhel-9.4-rust    clang-20
xtensa                 common_defconfig    gcc-15.1.0
xtensa          randconfig-001-20251211    gcc-11.5.0
xtensa          randconfig-002-20251211    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

