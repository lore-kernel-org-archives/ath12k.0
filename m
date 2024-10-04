Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9DFCFA741
	for <ath12k@archiver.kernel.org>; Fri,  4 Oct 2024 03:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eBsJvl9qAZV134BbocyoLuWgTB8m2g9Wle7FeVNMxHs=; b=dM1SwFlZ1CxG3wLsSvcwm1ubuh
	5alD4Z68yftYdXwCfTd4GQOJqjV7L/9y740f1tWX82qECKt0fUOIT7ziYtPrRaeR7H7Kfl+7MGTnG
	+hlhBZbzVtYugIiYpE4ZerwbUdr+DxvVGppanaMbXHl0Q5dfgEYTQzGBZMnto//Fm51taum8IT7ci
	pxuLzpEmsya6n4wavckBdf2ul/gFAUZ4hu7IGmpO/2vqp0coh5FP6s4hae12rTcLkWH23C61l1aPt
	deWk4BzGa8ijR5H82UVc6S+HX51RABt3zh61WDVviXNc9Rnn+e7Rs8TfOll8n3xNdb2qOG38f7VvE
	c/iyWE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swYiu-0000000AvRX-0KYX
	for ath12k@archiver.kernel.org;
	Fri, 04 Oct 2024 03:11:20 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swYhf-0000000AvHT-1L8A
	for ath12k@lists.infradead.org;
	Fri, 04 Oct 2024 03:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728011403; x=1759547403;
  h=date:from:to:cc:subject:message-id;
  bh=Drhgmy8tY8E8y/fhOHCokHA2WqAsr5g2zJQ7h2TkuU8=;
  b=l87BaiQsCC/MfjfMjN8fO5Ioqtc5rpS+LcCGjjddv6kTViGJIXTiIQvj
   QsNwbE7gDT7dYXSvkvEHg5965ejPcFXBQd7cKQQtksSBuYjOguBsIeAJw
   1VvvUykbomrarLj/uxLOyESsBjxFNIXFxRadEwKxS3odzLoKacD5W0lGS
   i7A6YmmD945xmTTFTbOMHaC5l+pews1lGaSeSPZ4EMUGax6wl52gccG9O
   blzpqDwze/o6lG5kX8D0OQJDZDeVmmGVyex2olWtNzDuIwTt1EYx+zXX3
   R9McTh2V/l/ERYeb4mpwFqefFkgmunz/qd22LyJG/to88ZivJ7PcMItV7
   A==;
X-CSE-ConnectionGUID: cKvX/pNeRfqHvBvKl5XVcA==
X-CSE-MsgGUID: S8JXfGeOQn+UYycJvheodQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31110869"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="31110869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 20:10:02 -0700
X-CSE-ConnectionGUID: A592xoC4RAGxxWWlndoUZg==
X-CSE-MsgGUID: D66TF9rGTF6EQX4l1txYjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74147113"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2024 20:10:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swYhZ-0001A4-3D;
	Fri, 04 Oct 2024 03:09:58 +0000
Date: Fri, 04 Oct 2024 11:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS WITH WARNING
 08dd5d93509f962500dc983864b4effb2600831a
Message-ID: <202410041157.Yz9WCkjl-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_201003_412436_E4701990 
X-CRM114-Status: UNSURE (   2.82  )
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
branch HEAD: 08dd5d93509f962500dc983864b4effb2600831a  wifi: ath12k: Support pdev Puncture Stats

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202410040200.Mwb85JzQ-lkp@intel.com

    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left shift count >= width of type [-Wshift-count-overflow]

Warning ids grouped by kconfigs:

recent_errors
|-- arc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-debugfs_htt_stats.c:warning:left-shift-count-width-of-type
|-- arc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-debugfs_htt_stats.c:warning:left-shift-count-width-of-type
|-- i386-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-debugfs_htt_stats.c:warning:left-shift-count-width-of-type
|-- i386-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-debugfs_htt_stats.c:warning:left-shift-count-width-of-type
|-- microblaze-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-debugfs_htt_stats.c:warning:left-shift-count-width-of-type
|-- microblaze-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-debugfs_htt_stats.c:warning:left-shift-count-width-of-type
|-- openrisc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-debugfs_htt_stats.c:warning:left-shift-count-width-of-type
|-- parisc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-debugfs_htt_stats.c:warning:left-shift-count-width-of-type
`-- parisc-allyesconfig
    `-- drivers-net-wireless-ath-ath12k-debugfs_htt_stats.c:warning:left-shift-count-width-of-type

elapsed time: 1829m

configs tested: 148
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    gcc-14.1.0
arm                          gemini_defconfig    gcc-14.1.0
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
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241003    gcc-12
i386        buildonly-randconfig-001-20241004    clang-18
i386        buildonly-randconfig-002-20241003    clang-18
i386        buildonly-randconfig-002-20241004    clang-18
i386        buildonly-randconfig-003-20241003    gcc-12
i386        buildonly-randconfig-003-20241004    clang-18
i386        buildonly-randconfig-004-20241003    clang-18
i386        buildonly-randconfig-004-20241004    clang-18
i386        buildonly-randconfig-005-20241003    gcc-12
i386        buildonly-randconfig-005-20241004    clang-18
i386        buildonly-randconfig-006-20241003    clang-18
i386        buildonly-randconfig-006-20241004    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241003    gcc-12
i386                  randconfig-001-20241004    clang-18
i386                  randconfig-002-20241003    clang-18
i386                  randconfig-002-20241004    clang-18
i386                  randconfig-003-20241003    clang-18
i386                  randconfig-003-20241004    clang-18
i386                  randconfig-004-20241003    gcc-12
i386                  randconfig-004-20241004    clang-18
i386                  randconfig-005-20241003    clang-18
i386                  randconfig-005-20241004    clang-18
i386                  randconfig-006-20241003    gcc-12
i386                  randconfig-006-20241004    clang-18
i386                  randconfig-011-20241003    clang-18
i386                  randconfig-011-20241004    clang-18
i386                  randconfig-012-20241003    gcc-12
i386                  randconfig-012-20241004    clang-18
i386                  randconfig-013-20241003    gcc-12
i386                  randconfig-013-20241004    clang-18
i386                  randconfig-014-20241003    gcc-12
i386                  randconfig-014-20241004    clang-18
i386                  randconfig-015-20241003    gcc-12
i386                  randconfig-015-20241004    clang-18
i386                  randconfig-016-20241003    gcc-12
i386                  randconfig-016-20241004    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    gcc-14.1.0
mips                           ip27_defconfig    gcc-14.1.0
mips                    maltaup_xpa_defconfig    gcc-14.1.0
mips                           xway_defconfig    gcc-14.1.0
nios2                            alldefconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc                     tqm8541_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                               defconfig    gcc-14.1.0
riscv                    nommu_virt_defconfig    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          rsk7203_defconfig    gcc-14.1.0
sh                           se7780_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    gcc-14.1.0
xtensa                          iss_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

