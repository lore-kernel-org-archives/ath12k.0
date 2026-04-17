Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A83F43688
	for <ath12k@archiver.kernel.org>; Fri, 17 Apr 2026 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IpvvT6AL3TxFHKLumVGpFrnI2+7TM/NuTH9Rujant9E=; b=X3RKZ+D2UhcRcig1hTvmt5cbxe
	rNSz7ieA2FdkT5LY3NNlOAby/vo7QYaIyQ9K0Pjs6kojN0K7LZwn132P+sYiuIczn6byl9HqTAb6I
	0oxE8YkwhlaBiFzhwgmj43djN8S+TxVJO9z61N5x0nMEci2hW8LGRhHowmAnKfcnsc2ldDDh0bcJ4
	yqAjs0TMU6OeSGM7E9Kpxqq5oR2elAjB8cZD0NEsFdu+jPFbP72BEQ2q+5iPb1tWGXcb4q/WJqXdy
	miTpbvYC9nUDfant1PBk9w8a6uefg+9UiW7CFppVuavJl00FRt9/QMHKvMFY6t7a4SFiGKSdPNqmU
	OXCYepvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfuA-00000003rg6-3ixK;
	Fri, 17 Apr 2026 09:54:30 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfu9-00000003rfd-0PKu
	for ath12k@lists.infradead.org;
	Fri, 17 Apr 2026 09:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776419669; x=1807955669;
  h=date:from:to:cc:subject:message-id;
  bh=PedSXtPN2TdY4EEM+I1chwu5D9RbSZh+RK8E/m6bjLM=;
  b=eT3vhYJbZgfPQKWaQOYKp0jRN1HjGhjHACwy7Zwk+xblR7g6Z5ATmQl9
   7VgnX49NubALkwAwMyF2/EM+nngxvMGjvyXba/N6kPFP5ELTRQ0VcdyUU
   Erlt1vj1q8iymTJdE2COs2SN8Ad6eaSby9WTrOHId9PJZAp8Dt+XlaRl1
   CFgsZplvO1wRxX5QRUkzXkZ+sWkYuiui/z/LBZyow8fZGxmCgGpwqYpJD
   PQtWBAB9hXVrMJDKtfPo2oh7M7EM/oFlrDWRf0bQS7mEj3op/rTQd5e8j
   3yW7D1sGFXQ3ja4Mxjqc+63TJhkVW157bVhNN7D1E57gugPnrNoOuKsVW
   g==;
X-CSE-ConnectionGUID: Bprf4JqRSN+91yumvLQR7g==
X-CSE-MsgGUID: Mxm2yXy6Tla9dixWmCx4+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77553704"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77553704"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:54:28 -0700
X-CSE-ConnectionGUID: cgUXNbvlSmyl687B8boXVw==
X-CSE-MsgGUID: QdU27dObRDyrFtf5kbMzqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="234986260"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Apr 2026 02:54:26 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDfu3-000000000CL-3cXD;
	Fri, 17 Apr 2026 09:54:23 +0000
Date: Fri, 17 Apr 2026 17:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 5cd74b077e35f2fc60ad7c67c99bb0596fdcd104
Message-ID: <202604171744.ddFkjOFN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_025429_154933_F6A670B5 
X-CRM114-Status: UNSURE (   3.46  )
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
branch HEAD: 5cd74b077e35f2fc60ad7c67c99bb0596fdcd104  wifi: ath12k: Fix ath12k_dp_htt_tlv_iter()'s iter() signature

elapsed time: 740m

configs tested: 151
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260417    gcc-8.5.0
arc                   randconfig-002-20260417    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260417    gcc-10.5.0
arm                   randconfig-002-20260417    clang-23
arm                   randconfig-003-20260417    clang-23
arm                   randconfig-004-20260417    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260417    clang-19
arm64                 randconfig-002-20260417    clang-23
arm64                 randconfig-003-20260417    clang-23
arm64                 randconfig-004-20260417    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260417    gcc-13.4.0
csky                  randconfig-002-20260417    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260417    clang-23
hexagon               randconfig-002-20260417    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260417    clang-20
i386        buildonly-randconfig-002-20260417    clang-20
i386        buildonly-randconfig-003-20260417    clang-20
i386        buildonly-randconfig-004-20260417    clang-20
i386        buildonly-randconfig-005-20260417    gcc-14
i386        buildonly-randconfig-006-20260417    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260417    clang-20
i386                  randconfig-002-20260417    clang-20
i386                  randconfig-003-20260417    clang-20
i386                  randconfig-004-20260417    clang-20
i386                  randconfig-005-20260417    gcc-14
i386                  randconfig-006-20260417    clang-20
i386                  randconfig-007-20260417    clang-20
i386                  randconfig-011-20260417    gcc-14
i386                  randconfig-012-20260417    gcc-14
i386                  randconfig-013-20260417    clang-20
i386                  randconfig-014-20260417    gcc-14
i386                  randconfig-015-20260417    gcc-14
i386                  randconfig-016-20260417    clang-20
i386                  randconfig-017-20260417    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260417    clang-18
loongarch             randconfig-002-20260417    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260417    gcc-11.5.0
nios2                 randconfig-002-20260417    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260417    gcc-12.5.0
parisc                randconfig-002-20260417    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     mpc5200_defconfig    clang-23
powerpc               randconfig-001-20260417    gcc-8.5.0
powerpc               randconfig-002-20260417    clang-23
powerpc64             randconfig-001-20260417    clang-23
powerpc64             randconfig-002-20260417    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260417    clang-23
riscv                 randconfig-002-20260417    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260417    gcc-14.3.0
s390                  randconfig-002-20260417    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260417    gcc-15.2.0
sh                    randconfig-002-20260417    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260417    gcc-12.5.0
sparc                 randconfig-002-20260417    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260417    clang-20
sparc64               randconfig-002-20260417    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260417    gcc-13
um                    randconfig-002-20260417    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260417    clang-20
x86_64      buildonly-randconfig-002-20260417    clang-20
x86_64      buildonly-randconfig-003-20260417    clang-20
x86_64      buildonly-randconfig-004-20260417    clang-20
x86_64      buildonly-randconfig-005-20260417    clang-20
x86_64      buildonly-randconfig-006-20260417    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-003-20260417    gcc-14
x86_64                randconfig-004-20260417    gcc-12
x86_64                randconfig-011-20260417    gcc-14
x86_64                randconfig-012-20260417    clang-20
x86_64                randconfig-013-20260417    clang-20
x86_64                randconfig-014-20260417    clang-20
x86_64                randconfig-015-20260417    clang-20
x86_64                randconfig-016-20260417    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260417    gcc-9.5.0
xtensa                randconfig-002-20260417    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

