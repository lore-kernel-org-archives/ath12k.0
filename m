Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC5DCEDDA9
	for <ath12k@archiver.kernel.org>; Thu, 10 Oct 2024 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0/vfCd1HKT1rDqE4anRuz1PBvQyvgEntXkxDOD5R3YY=; b=1P9NkznGJzz3kXRjv9HXkhxwnM
	fJKBSPCclrCl6s/wGlePiLQaTiq3XKBIQIPkKCO/04PIUpFHouthmLM0QTo0CoxPN4HVOwCb1jvKZ
	pxLTX1Q0Od9yk6WXP91S9PM3Ny4k7f9mx1se0kafOya6c4WSJyEwgNTva8sDS4GKITLixfCX/AtdZ
	B6Gt392kmT2nVcOz0RaXScuWxtWDMgMsBTyvM2pJ3wAFIOpPrPyudwd1Nf8cbNp1YfNzVOis02lA9
	GDtmHiBuMbwNbttSOODvtxdfZGRXSJoJOiAecJAoFztTKGDMatejYlK7VIscHRMGFDX39vAIe7T/U
	LwpuM8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syj63-0000000BJ8b-2FDO
	for ath12k@archiver.kernel.org;
	Thu, 10 Oct 2024 02:40:11 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syj5d-0000000BJ7T-2WEY
	for ath12k@lists.infradead.org;
	Thu, 10 Oct 2024 02:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728527986; x=1760063986;
  h=date:from:to:cc:subject:message-id;
  bh=smJhDW37h8fvQ/kyTrynAwXjf39i5718eq8WWFVY6Z8=;
  b=DjKzEzxSuh14LSt9VLFyau1LV2J7cb2CJEZVCEzAcRFHHgdQ7UTvU2k5
   6OSSK9b8NO/0oIA+ustrsFv8HBPDluaguwEfCMFfRPMchmLI3uJuwOy/T
   TDqpPdIbF+UW5MCmPxKSpOKZS8AvWeRax8LOYQBdguTq7hbnTOY7QewH/
   1jvK6IDoe9tMLgDcS/oRLbWwXCmoYbzbpWIHzNLwaem4o7Y3eTZzExLrH
   4vDLBqv2+dAA24fE6hrKz2DPXhzC8ttmEDQ9YHf5ZqDNeU3YSToGyuMh1
   B2bZLKQAFlhlsHI8rCtyFN0NDbkO8W/yEAlIAObMHtURuZlDK0bn3wnk9
   A==;
X-CSE-ConnectionGUID: NeypOlVIQKmWPUKiw61XPQ==
X-CSE-MsgGUID: +AXvNhKCR0eOnAUOL7KqUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38510085"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="38510085"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 19:39:42 -0700
X-CSE-ConnectionGUID: O4+kExrFRpGq4J3An4zseQ==
X-CSE-MsgGUID: xQ1ULOspRzWbKoKcJD1BKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="107288785"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2024 19:39:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syj5V-000A4U-2L;
	Thu, 10 Oct 2024 02:39:37 +0000
Date: Thu, 10 Oct 2024 10:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 fd79fbbba5c7e309d3a53cbe88c5e5b348b7eaca
Message-ID: <202410101052.2idQufE4-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_193945_708789_2AB93D31 
X-CRM114-Status: UNSURE (   4.02  )
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
branch HEAD: fd79fbbba5c7e309d3a53cbe88c5e5b348b7eaca  wifi: ath12k: Support Pdev OBSS Stats

elapsed time: 1697m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    gcc-14.1.0
arm                         bcm2835_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          gemini_defconfig    gcc-14.1.0
arm                           imxrt_defconfig    gcc-14.1.0
arm                         mv78xx0_defconfig    gcc-14.1.0
arm                        shmobile_defconfig    gcc-14.1.0
arm                           tegra_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241009    clang-18
i386        buildonly-randconfig-002-20241009    gcc-12
i386        buildonly-randconfig-003-20241009    clang-18
i386        buildonly-randconfig-004-20241009    clang-18
i386        buildonly-randconfig-005-20241009    clang-18
i386        buildonly-randconfig-006-20241009    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241009    clang-18
i386                  randconfig-002-20241009    clang-18
i386                  randconfig-003-20241009    gcc-12
i386                  randconfig-004-20241009    clang-18
i386                  randconfig-005-20241009    gcc-12
i386                  randconfig-006-20241009    clang-18
i386                  randconfig-011-20241009    clang-18
i386                  randconfig-012-20241009    clang-18
i386                  randconfig-013-20241009    clang-18
i386                  randconfig-014-20241009    gcc-12
i386                  randconfig-015-20241009    clang-18
i386                  randconfig-016-20241009    gcc-11
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    gcc-14.1.0
m68k                            mac_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    gcc-14.1.0
mips                  maltasmvp_eva_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                        cell_defconfig    gcc-14.1.0
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                    socrates_defconfig    gcc-14.1.0
powerpc                     tqm5200_defconfig    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               alldefconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241010    gcc-12
x86_64      buildonly-randconfig-002-20241010    gcc-12
x86_64      buildonly-randconfig-003-20241010    gcc-12
x86_64      buildonly-randconfig-004-20241010    gcc-12
x86_64      buildonly-randconfig-005-20241010    gcc-12
x86_64      buildonly-randconfig-006-20241010    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20241010    gcc-12
x86_64                randconfig-002-20241010    gcc-12
x86_64                randconfig-003-20241010    gcc-12
x86_64                randconfig-004-20241010    gcc-12
x86_64                randconfig-005-20241010    gcc-12
x86_64                randconfig-006-20241010    gcc-12
x86_64                randconfig-011-20241010    gcc-12
x86_64                randconfig-012-20241010    gcc-12
x86_64                randconfig-013-20241010    gcc-12
x86_64                randconfig-014-20241010    gcc-12
x86_64                randconfig-015-20241010    gcc-12
x86_64                randconfig-016-20241010    gcc-12
x86_64                randconfig-071-20241010    gcc-12
x86_64                randconfig-072-20241010    gcc-12
x86_64                randconfig-073-20241010    gcc-12
x86_64                randconfig-074-20241010    gcc-12
x86_64                randconfig-075-20241010    gcc-12
x86_64                randconfig-076-20241010    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

