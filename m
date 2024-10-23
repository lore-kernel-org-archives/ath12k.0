Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B11CF5365
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XYm9QMtQPyCgXbEJQ2XKCM2qplcwqqEYObMUjuPUMjI=; b=w8X75X5xNszFzY82XT+Dp7C7FA
	WGWvMerH3NjAx69vznKgEyGY5eA44Kps6I8dGsvw9GyY2ZhhoskQiHdNXC7ZmOEL+/GAmQumYwsNJ
	Zu3l3dfjBqRTw5VHz39S8ruOLMl7fy4bY0dCPSBKfXdLiLNESNOd1Jp2W9/JbLUnO+hmtdopFUFWm
	QVIpANDcIWAaH3vRqGKA0deYMoY0e/sCO40S57kc5fFwQzeWalgps/75HWTFgmodN1jQvO63NhnQU
	VJtRhy79H0tduShYBd4/LZZEvz24mcPB9qO2xpfM2iLCzJombCfPKDUxywv5Hsy3VSh3BNJSutB/Z
	uSfiG8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aM1-0000000EIzl-1C4W
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 12:20:45 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3a8c-0000000EGO4-28Wx
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 12:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729685215; x=1761221215;
  h=date:from:to:cc:subject:message-id;
  bh=Ec2rOpWg+B0aBWa4eLFGxLiw7VlNgwaT5K9xre1yOz0=;
  b=jbwUW8YkHtA4l7uFfY/YUBoQ3gzieUDhAaV0B2t+qSczEaknSpDHp/kw
   Tnbq8phQyXOK5UXQRq7eNbcU0N4fe/EGMZ1NEseQ1JpNGBuCK3xaks9OU
   H41BWe7tnth6KzkNm1cn60A19VDUQgHlig4EnbvZhBIUNQ7WBOuS8yHds
   IpdpjVRjZU44E9FcBmQIMO9UFsMsjQLup6krpOEhBuidSdFKxB7jIcWbs
   RiM415M+th8zQoPg9evOqlppSZVWimCTWQpOVYWQl4Ypmdt1feARIVSig
   C1opI35xCT598N/+h4kC7jgvyjmw4nEClm02CdAdsg2PF8TaPG1LYsZ/D
   g==;
X-CSE-ConnectionGUID: oXlhU0AZQnuzb9nNWhkVTw==
X-CSE-MsgGUID: pIdmH1DCT7+mzBlCoDugaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29376480"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="29376480"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 05:06:52 -0700
X-CSE-ConnectionGUID: vdWhmvnlQjyXQrXKlE1Y8Q==
X-CSE-MsgGUID: 6c4mi6IFQ9KL4Y+07JTh0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="84976462"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 05:06:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3a8W-000UsU-0S;
	Wed, 23 Oct 2024 12:06:48 +0000
Date: Wed, 23 Oct 2024 20:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 9412b09c209f9053714578cac6f503059672a55d
Message-ID: <202410232002.OO6H705b-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_050654_705862_79C88826 
X-CRM114-Status: UNSURE (   3.41  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: 9412b09c209f9053714578cac6f503059672a55d  wifi: ath12k: advertise MLO support and capabilities

elapsed time: 939m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                       imx_v4_v5_defconfig    clang-20
arm                        shmobile_defconfig    clang-20
arm                    vt8500_v6_v7_defconfig    clang-20
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
i386        buildonly-randconfig-001-20241023    clang-18
i386        buildonly-randconfig-002-20241023    clang-18
i386        buildonly-randconfig-003-20241023    clang-18
i386        buildonly-randconfig-004-20241023    clang-18
i386        buildonly-randconfig-005-20241023    clang-18
i386        buildonly-randconfig-006-20241023    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241023    clang-18
i386                  randconfig-002-20241023    clang-18
i386                  randconfig-003-20241023    clang-18
i386                  randconfig-004-20241023    clang-18
i386                  randconfig-005-20241023    clang-18
i386                  randconfig-006-20241023    clang-18
i386                  randconfig-011-20241023    clang-18
i386                  randconfig-012-20241023    clang-18
i386                  randconfig-013-20241023    clang-18
i386                  randconfig-014-20241023    clang-18
i386                  randconfig-015-20241023    clang-18
i386                  randconfig-016-20241023    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             alldefconfig    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    clang-20
mips                            gpr_defconfig    clang-20
mips                           ip28_defconfig    clang-20
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
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       holly_defconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
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
sh                             espt_defconfig    clang-20
sh                          kfr2r09_defconfig    clang-20
sh                           se7724_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241023    gcc-12
x86_64      buildonly-randconfig-002-20241023    gcc-12
x86_64      buildonly-randconfig-003-20241023    gcc-12
x86_64      buildonly-randconfig-004-20241023    gcc-12
x86_64      buildonly-randconfig-005-20241023    gcc-12
x86_64      buildonly-randconfig-006-20241023    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241023    gcc-12
x86_64                randconfig-002-20241023    gcc-12
x86_64                randconfig-003-20241023    gcc-12
x86_64                randconfig-004-20241023    gcc-12
x86_64                randconfig-005-20241023    gcc-12
x86_64                randconfig-006-20241023    gcc-12
x86_64                randconfig-011-20241023    gcc-12
x86_64                randconfig-012-20241023    gcc-12
x86_64                randconfig-013-20241023    gcc-12
x86_64                randconfig-014-20241023    gcc-12
x86_64                randconfig-015-20241023    gcc-12
x86_64                randconfig-016-20241023    gcc-12
x86_64                randconfig-071-20241023    gcc-12
x86_64                randconfig-072-20241023    gcc-12
x86_64                randconfig-073-20241023    gcc-12
x86_64                randconfig-074-20241023    gcc-12
x86_64                randconfig-075-20241023    gcc-12
x86_64                randconfig-076-20241023    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

