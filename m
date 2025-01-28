Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36BCC0218F
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 03:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jbw40gM/Gvo16+Zymd2dgEIKJRpsLvgW5ocfNxrhbQM=; b=F8Q+aa5DvXiD7Fd89YJvwHx+NR
	t0idjsZVF1u7XPaaqKFmQhylY0od6w/Psf0APzzkmtLqUL4Da+EAtEeDE0YfnwZSMrDsb3p3PSstu
	2+xkB4hWV+ln0tJEXIMgWbjj3MQmQ3vJR958IZTBHLT267t92uiAxa1YMoFNe34Imk/Bz8wJJYchF
	ZBIZy8/macfyBGvwbPY1qs2JXEx6uCs6KDdpv/e7erCeYB25l03cQ70+MDEpmmjfTozwxTx42IVWA
	A3OX3+9dCbcF8bHNZSWCJu8gdNegpK6V/ysFERz/S4/JZOHxdaUroL6Ei4NJZ1S4OhYfeWUQhhO8m
	/fp1rw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcc7O-000000040Iz-065N
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 03:18:26 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcc7L-000000040IX-3aSr
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 03:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738034304; x=1769570304;
  h=date:from:to:cc:subject:message-id;
  bh=2FPShdgko9gMpVK0lRnKJpH+nDFVgGUpqgGil2lv8ac=;
  b=FfnQR/8mkMSge7nRAjNnJnlgJbLQbCCSO58De+N0gDGUkwtNFWw7Rhpj
   l2D31MGhWhDKZmAquzqmlWLqDHog35Gbx5CrqraRuGIbUx//n+I80UetO
   5E8rIUPG6Cndcqjp0jMnqm/CZ5aJYfe5haqUQAgOwPt2ieCRZ7brcJZPx
   PVFpWn2p3bsPmfgK+aYuv/E2j9yiCiZQkF/xwKeI/XE4QVemCyTmgrjfx
   iscWdDYTOcpmQ7iJjBmTW13TQqg1fFkIUs02kRrKDbi3Ex71ZK5oDepge
   /0lYnB7IQ2GzNOywnub1PHHOtLKqENc+yxUtgOxecULZBU2bnAdhGh1ry
   w==;
X-CSE-ConnectionGUID: tWLOR2KIQj60OPRcyyQ2cA==
X-CSE-MsgGUID: sWq0OPN2S66VkOrWy6wB6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37761914"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="37761914"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 19:18:23 -0800
X-CSE-ConnectionGUID: ipgjGanRRjG7MTRQrB4JOg==
X-CSE-MsgGUID: 3HJCR5bKTnKIMSKqLnqhLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="113625317"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2025 19:18:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcc7I-000hPH-0E;
	Tue, 28 Jan 2025 03:18:20 +0000
Date: Tue, 28 Jan 2025 11:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 b5aeca2e66899430827b8afcad061201f3b7861b
Message-ID: <202501281159.n7UqTXVw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_191823_906836_FE9AF785 
X-CRM114-Status: UNSURE (   3.98  )
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
branch HEAD: b5aeca2e66899430827b8afcad061201f3b7861b  Add localversion-wireless-testing-ath

elapsed time: 726m

configs tested: 150
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250128    gcc-13.2.0
arc                   randconfig-002-20250128    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                          moxart_defconfig    gcc-14.2.0
arm                   randconfig-001-20250128    gcc-14.2.0
arm                   randconfig-002-20250128    clang-20
arm                   randconfig-003-20250128    clang-20
arm                   randconfig-004-20250128    clang-15
arm                         s5pv210_defconfig    gcc-14.2.0
arm                           sama7_defconfig    clang-16
arm                       versatile_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250128    gcc-14.2.0
arm64                 randconfig-002-20250128    clang-17
arm64                 randconfig-003-20250128    gcc-14.2.0
arm64                 randconfig-004-20250128    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250127    gcc-14.2.0
csky                  randconfig-001-20250128    gcc-14.2.0
csky                  randconfig-002-20250127    gcc-14.2.0
csky                  randconfig-002-20250128    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250127    clang-17
hexagon               randconfig-001-20250128    clang-20
hexagon               randconfig-002-20250127    clang-20
hexagon               randconfig-002-20250128    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250128    clang-19
i386        buildonly-randconfig-002-20250128    clang-19
i386        buildonly-randconfig-003-20250128    gcc-12
i386        buildonly-randconfig-004-20250128    clang-19
i386        buildonly-randconfig-005-20250128    clang-19
i386        buildonly-randconfig-006-20250128    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250127    gcc-14.2.0
loongarch             randconfig-001-20250128    gcc-14.2.0
loongarch             randconfig-002-20250127    gcc-14.2.0
loongarch             randconfig-002-20250128    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250127    gcc-14.2.0
nios2                 randconfig-001-20250128    gcc-14.2.0
nios2                 randconfig-002-20250127    gcc-14.2.0
nios2                 randconfig-002-20250128    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250127    gcc-14.2.0
parisc                randconfig-001-20250128    gcc-14.2.0
parisc                randconfig-002-20250127    gcc-14.2.0
parisc                randconfig-002-20250128    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250127    clang-16
powerpc               randconfig-001-20250128    clang-17
powerpc               randconfig-002-20250127    gcc-14.2.0
powerpc               randconfig-002-20250128    gcc-14.2.0
powerpc               randconfig-003-20250127    gcc-14.2.0
powerpc               randconfig-003-20250128    clang-20
powerpc                     redwood_defconfig    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250127    gcc-14.2.0
powerpc64             randconfig-001-20250128    clang-15
powerpc64             randconfig-002-20250127    gcc-14.2.0
powerpc64             randconfig-002-20250128    gcc-14.2.0
powerpc64             randconfig-003-20250127    gcc-14.2.0
powerpc64             randconfig-003-20250128    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250128    gcc-14.2.0
riscv                 randconfig-002-20250128    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250128    gcc-14.2.0
s390                  randconfig-002-20250128    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                    randconfig-001-20250128    gcc-14.2.0
sh                    randconfig-002-20250128    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250128    gcc-14.2.0
sparc                 randconfig-002-20250128    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250128    gcc-14.2.0
sparc64               randconfig-002-20250128    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250128    gcc-12
um                    randconfig-002-20250128    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250128    clang-19
x86_64      buildonly-randconfig-002-20250128    clang-19
x86_64      buildonly-randconfig-003-20250128    gcc-12
x86_64      buildonly-randconfig-004-20250128    clang-19
x86_64      buildonly-randconfig-005-20250128    clang-19
x86_64      buildonly-randconfig-006-20250128    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250128    gcc-14.2.0
xtensa                randconfig-002-20250128    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

