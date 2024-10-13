Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2ABCF2569
	for <ath12k@archiver.kernel.org>; Sun, 13 Oct 2024 00:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RCyozth00ylHIl6Pj5LsRg5GskVyZtbxW0lU5qmWHgY=; b=ZxTMObI5hWbkcgXtR/rqX550cb
	CxDPsGrDANwJcHPmsCUyTJTQ5YvdTH62yR8HDc0BSfucQ+KdYze9GTC17XOrRIcGOEAB/z79A74k9
	EiKMc1Q+71o6Y3PcXnL4eaA381pYMkI6kt+NIKdzM8S9ycTiJVgIW6POm10mv3uV4ETpYg4au0M+Z
	yyu2R9+f4vUT1ATqTNmOn8MHudO+dTcZev+HRu+2FE4hLgzE7tBugoTmY3zOVPnaOR/T00S8//nIR
	Au1dcXnn1JGQD/GpkPJzp1YBdj/pahHFEipqrSfDWqSocb0YtCVynRwJlgfIpN1vKHTDjYlLeHila
	5pApUYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szmgx-0000000239C-1qqd
	for ath12k@archiver.kernel.org;
	Sun, 13 Oct 2024 00:42:39 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szmgu-0000000238r-2IV3
	for ath12k@lists.infradead.org;
	Sun, 13 Oct 2024 00:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728780156; x=1760316156;
  h=date:from:to:cc:subject:message-id;
  bh=7ZAmcp74PKRhzvasCCKM/CUOTRCGi1R5b/b51KVKSO4=;
  b=TUMvgrTyC/VZhoENGf7ZtO1bh9o1ciZwelOMGwyi0xVVP498+PIz60P8
   qGQxvraGazjPZqibTLskKaKArYZBe+ggx31Gcx8hGXxeFV8V8Qrkb19+0
   UG5oYZilDAq02ikEuvDSZtZFYOzV7NMBKd0OxlU0iKzfDA2mmZr9fNsD9
   AcDU11zYguIBGKpfqFAKmMeDhoFEdcxIr5Kjg+0bDA6ahNziclPDAcYMW
   25RRI8uCmPY00UEXOtAlNC7E1E2B8pTL7Wffk0qYgjfVwoe31g3QKGdTX
   UOGuzcAj35ZtTNXNuKK48EO5sgPcMtVUE6WZBWUJeaz3/4J3DVpdp9o7W
   Q==;
X-CSE-ConnectionGUID: lmt27CLgSb62X4aES488xA==
X-CSE-MsgGUID: C4cP4BNvSCyF9XANOthlAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28289605"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28289605"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 17:42:30 -0700
X-CSE-ConnectionGUID: JCVvM7sgSPOf22mXvcvJdw==
X-CSE-MsgGUID: 7FyxzLWjQmuINO0dWDn/vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77334640"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Oct 2024 17:42:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szmgk-000Dun-1l;
	Sun, 13 Oct 2024 00:42:26 +0000
Date: Sun, 13 Oct 2024 08:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 c814f3d030878dc98c8751497c325666ef572e12
Message-ID: <202410130806.0cYDvIhC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_174236_627845_FBA3884C 
X-CRM114-Status: UNSURE (   3.66  )
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
branch HEAD: c814f3d030878dc98c8751497c325666ef572e12  Merge branch 'pending' into main-pending

elapsed time: 2376m

configs tested: 103
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                       multi_v4t_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241013    clang-18
i386        buildonly-randconfig-002-20241013    gcc-12
i386        buildonly-randconfig-003-20241013    clang-18
i386        buildonly-randconfig-004-20241013    gcc-12
i386        buildonly-randconfig-005-20241013    clang-18
i386        buildonly-randconfig-006-20241013    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241013    clang-18
i386                  randconfig-002-20241013    gcc-12
i386                  randconfig-003-20241013    gcc-12
i386                  randconfig-004-20241013    gcc-11
i386                  randconfig-005-20241013    clang-18
i386                  randconfig-006-20241013    clang-18
i386                  randconfig-011-20241013    clang-18
i386                  randconfig-012-20241013    gcc-12
i386                  randconfig-013-20241013    clang-18
i386                  randconfig-014-20241013    gcc-12
i386                  randconfig-015-20241013    clang-18
i386                  randconfig-016-20241013    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                          g5_defconfig    gcc-14.1.0
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                         ps3_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

