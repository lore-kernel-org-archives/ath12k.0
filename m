Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11E2D10C06
	for <ath12k@archiver.kernel.org>; Sat, 26 Oct 2024 20:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6xn2JbF22WxTJmpsw92Fqii+DziZ38vfM1mwcb/3MRo=; b=H8XZF0e3JR+N2wpV/POcMp2pzm
	G6imqrcGsp85NhRrikV/L2M4YIa2W/nG7JUKFXfhXeb0gv4sfAwITDuOwT0zgvBH/RKTbNjX/pjFR
	a1/UIJ0wfqd1VkZzobEAdNkgps3lYa3VDxKY12aGbIJViYiF0OuWfJaC9Hi3zoRE/tdNQM7WIbKFW
	7vHce1KVkS9vweLLfJSGSJF0IXya3nuWp3PpEj3ibCG+Ou1Ee0a9w07GroTaN3vHziLkCV9rEIig8
	1hShN/WBiXqCy2THA9lROLPLq6wrUfMpu8YtVEl4bBt1W5n1RCJTzvbRCHwesJT0Dot+/hynYASlv
	PjqeLKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nmM-00000007EWA-2y2s
	for ath12k@archiver.kernel.org;
	Sat, 26 Oct 2024 20:52:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nUQ-00000007CWh-1Ki7
	for ath12k@lists.infradead.org;
	Sat, 26 Oct 2024 20:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729974866; x=1761510866;
  h=date:from:to:cc:subject:message-id;
  bh=aVCe75puni2DYDiOLmaUMKmJtojYqvs9dOBRW/3/UHQ=;
  b=bAdroqChXHVyr8P2HUmIS/OOE2oNE3l6u7iqayNFHfvMw7ybXmOJKxhF
   dFOMplM0blfpPufAAHjADIyXeNzr2cZdNMcsCssttFYWZSOuFyNvJPAMM
   QY3I/jGnwQEHFnq9jd7WZo6EZ6BfYHE97VXl3QLiQSBYcWjXjFoKqvaX/
   1zPi3IguIUDKjaW1+pFOp1a0wmBKjcxRe+v+g6VJ2AOYTZwfllzk+DZ60
   ucPFR7dy01hdps/Mx4ZH1ccmrue+wuao5ce+wQLAKwa3fA7nO502WtWSJ
   9H4E+h/z1EXZZnl47hlSCnBZTDy2B/s3gpxbOr816E1OjBVeiLyODj1v9
   A==;
X-CSE-ConnectionGUID: l5kr2dnYTuCDGDsEttKRSQ==
X-CSE-MsgGUID: b/wZO58TT8Sx5/q/smep0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="55030292"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="55030292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 13:34:23 -0700
X-CSE-ConnectionGUID: L2ANm2haQW62Wr/qK4qu1Q==
X-CSE-MsgGUID: dyjHMV3HRKeQGTNXBC9aRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81355175"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Oct 2024 13:34:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4nUK-000a1K-02;
	Sat, 26 Oct 2024 20:34:20 +0000
Date: Sun, 27 Oct 2024 04:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 8a58dcd8db9c7af1187f0236d71a99cbbe146f6a
Message-ID: <202410270435.VXpAlV7i-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133426_416666_DC314609 
X-CRM114-Status: UNSURE (   3.78  )
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
branch HEAD: 8a58dcd8db9c7af1187f0236d71a99cbbe146f6a  Add localversion-wireless-testing-ath

elapsed time: 1465m

configs tested: 135
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                        multi_v5_defconfig    gcc-14.1.0
arm                        neponset_defconfig    gcc-14.1.0
arm                          sp7021_defconfig    gcc-14.1.0
arm                       versatile_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241026    gcc-12
i386        buildonly-randconfig-002-20241026    gcc-12
i386        buildonly-randconfig-003-20241026    gcc-12
i386        buildonly-randconfig-004-20241026    gcc-12
i386        buildonly-randconfig-005-20241026    gcc-12
i386        buildonly-randconfig-006-20241026    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241026    gcc-12
i386                  randconfig-002-20241026    gcc-12
i386                  randconfig-003-20241026    gcc-12
i386                  randconfig-004-20241026    gcc-12
i386                  randconfig-005-20241026    gcc-12
i386                  randconfig-006-20241026    gcc-12
i386                  randconfig-011-20241026    gcc-12
i386                  randconfig-012-20241026    gcc-12
i386                  randconfig-013-20241026    gcc-12
i386                  randconfig-014-20241026    gcc-12
i386                  randconfig-015-20241026    gcc-12
i386                  randconfig-016-20241026    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         amcore_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          rb532_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                   bluestone_defconfig    gcc-14.1.0
powerpc                 canyonlands_defconfig    gcc-14.1.0
powerpc                     kmeter1_defconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.1.0
sh                           se7619_defconfig    gcc-14.1.0
sh                        sh7757lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241026    clang-19
x86_64      buildonly-randconfig-002-20241026    clang-19
x86_64      buildonly-randconfig-003-20241026    clang-19
x86_64      buildonly-randconfig-004-20241026    clang-19
x86_64      buildonly-randconfig-005-20241026    clang-19
x86_64      buildonly-randconfig-006-20241026    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241026    clang-19
x86_64                randconfig-002-20241026    clang-19
x86_64                randconfig-003-20241026    clang-19
x86_64                randconfig-004-20241026    clang-19
x86_64                randconfig-005-20241026    clang-19
x86_64                randconfig-006-20241026    clang-19
x86_64                randconfig-011-20241026    clang-19
x86_64                randconfig-012-20241026    clang-19
x86_64                randconfig-013-20241026    clang-19
x86_64                randconfig-014-20241026    clang-19
x86_64                randconfig-015-20241026    clang-19
x86_64                randconfig-016-20241026    clang-19
x86_64                randconfig-071-20241026    clang-19
x86_64                randconfig-072-20241026    clang-19
x86_64                randconfig-073-20241026    clang-19
x86_64                randconfig-074-20241026    clang-19
x86_64                randconfig-075-20241026    clang-19
x86_64                randconfig-076-20241026    clang-19
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

