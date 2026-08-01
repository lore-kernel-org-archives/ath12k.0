Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066E4C55172
	for <ath12k@archiver.kernel.org>; Sat,  1 Aug 2026 22:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QA/oYOfhM6sX1zz0BF9X24gZ95Ms41inJW72V41LAzE=; b=HJSIKy5EiMihxTDi/NFIbve/O5
	m/GyblxGL4tpmhhNRLq3lbeTqucBLQXX0ryVpoB2AKs/rm/zqthotKhPl1KgCpumRzIkcewtnsyaB
	wWC0BpGybOCCFXaZ6HKNO6TPSrk7J/JNVvehDLmB+89qQZOJB+TaTccNFyefrIpKYCNSoLAfuKUh0
	co8zpgcLjY/VQkX8Yd5q2ucLsCXnGQyJ81FSk45titsEOjw0i+dqE2U+3UQCtbQNg74yWm86mzPSj
	sXrR+yIBVT+fzwrzbQIezQgd482kpWH9Kois98yBGniCXI3/3q80MhLsh0dA9UmjFxkzAUarsOrWq
	hUSVvuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHsX-0000000FA4x-2yMD;
	Sat, 01 Aug 2026 22:08:25 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHsV-0000000FA4c-0nxV
	for ath12k@lists.infradead.org;
	Sat, 01 Aug 2026 22:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785622103; x=1817158103;
  h=date:from:to:cc:subject:message-id;
  bh=t67aIlDHg5HBGwWgsCzR0m3rr301G5BOWWPN/ZTBe+k=;
  b=TAvNyF4orGZ1XhYQ0d3PXjSE1z2pXRRbpSeRTZkxHWkwLkYG5BwcEbqG
   yOLO5ZLhnLdg2WRnsHPpgmPFI/pUc3+DC6rST+T7V/SjAdDzPkCkAErQA
   kg69TTyLw93vcMvam7ZShZnA49jyLcYr69rTPW73gE7VteUSl3ARd3Z3k
   kp0Uet9fuY1QrzITM/PoWdbRqNu4T8ITXS6HM0ULQe6M+KLLhfzyQOEMC
   9xzYMGj7J5m3K0m153Do4uhSplMEJhyv/Gv12+7Oj5MeRr4Q0a2fObAuk
   EHEvWIPjohy6nDGGnORfmitg9i4CggEYfloUDFQsQH5r6uyncxxZ1+Eke
   w==;
X-CSE-ConnectionGUID: aI7XAZCAScOLZn4yKYDY1g==
X-CSE-MsgGUID: 31Zfc8cYRO6EDUjpIVmK1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="96801820"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="96801820"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 15:08:20 -0700
X-CSE-ConnectionGUID: QO6aHY4ORU2BS7EcCY8TTQ==
X-CSE-MsgGUID: FJUByvSpQBWOdmeqw1j0BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="262844761"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Aug 2026 15:08:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqHsO-000000003xZ-3Uwq;
	Sat, 01 Aug 2026 22:08:16 +0000
Date: Sun, 02 Aug 2026 06:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 8150c22bc80caef4ba8391eb98b25e9f7c6cb487
Message-ID: <202608020651.oEa7wuWc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_150823_273001_C3C21A98 
X-CRM114-Status: UNSURE (   3.94  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: 8150c22bc80caef4ba8391eb98b25e9f7c6cb487  Add localversion-wireless-testing-ath

elapsed time: 750m

configs tested: 219
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-8.5.0
arc                  randconfig-001-20260801    gcc-12.5.0
arc                  randconfig-001-20260801    gcc-14.3.0
arc                  randconfig-001-20260802    gcc-15.2.0
arc                  randconfig-002-20260801    gcc-12.5.0
arc                  randconfig-002-20260802    gcc-15.2.0
arm                       keystone_defconfig    gcc-16.1.0
arm                  randconfig-001-20260801    clang-24
arm                  randconfig-001-20260801    gcc-12.5.0
arm                  randconfig-001-20260802    gcc-15.2.0
arm                  randconfig-002-20260801    gcc-12.5.0
arm                  randconfig-002-20260801    gcc-8.5.0
arm                  randconfig-002-20260802    gcc-15.2.0
arm                  randconfig-003-20260801    gcc-12.5.0
arm                  randconfig-003-20260802    gcc-15.2.0
arm                  randconfig-004-20260801    clang-18
arm                  randconfig-004-20260801    gcc-12.5.0
arm                  randconfig-004-20260802    gcc-15.2.0
arm64                         randconfig-001    gcc-10.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260801    clang-21
arm64                randconfig-001-20260801    gcc-10.5.0
arm64                randconfig-001-20260802    gcc-9.5.0
arm64                randconfig-002-20260801    clang-21
arm64                randconfig-002-20260801    gcc-10.5.0
arm64                randconfig-002-20260802    gcc-9.5.0
arm64                randconfig-003-20260801    gcc-10.5.0
arm64                randconfig-003-20260801    gcc-14.3.0
arm64                randconfig-003-20260802    gcc-9.5.0
arm64                randconfig-004-20260801    clang-17
arm64                randconfig-004-20260801    gcc-10.5.0
arm64                randconfig-004-20260802    gcc-9.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260801    gcc-10.5.0
csky                 randconfig-001-20260801    gcc-12.5.0
csky                 randconfig-001-20260802    gcc-9.5.0
csky                 randconfig-002-20260801    gcc-10.5.0
csky                 randconfig-002-20260802    gcc-9.5.0
hexagon                       randconfig-001    clang-17
hexagon              randconfig-001-20260801    clang-24
hexagon              randconfig-001-20260801    gcc-16.1.0
hexagon              randconfig-001-20260802    clang-24
hexagon              randconfig-002-20260801    clang-17
hexagon              randconfig-002-20260801    gcc-16.1.0
hexagon              randconfig-002-20260802    clang-24
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260801    clang-22
i386       buildonly-randconfig-001-20260801    gcc-14
i386       buildonly-randconfig-001-20260802    gcc-14
i386       buildonly-randconfig-002-20260801    clang-22
i386       buildonly-randconfig-002-20260801    gcc-14
i386       buildonly-randconfig-002-20260802    gcc-14
i386       buildonly-randconfig-003-20260801    clang-22
i386       buildonly-randconfig-003-20260801    gcc-14
i386       buildonly-randconfig-003-20260802    gcc-14
i386       buildonly-randconfig-004-20260801    clang-22
i386       buildonly-randconfig-004-20260801    gcc-14
i386       buildonly-randconfig-004-20260802    gcc-14
i386       buildonly-randconfig-005-20260801    gcc-14
i386       buildonly-randconfig-005-20260802    gcc-14
i386       buildonly-randconfig-006-20260801    gcc-14
i386       buildonly-randconfig-006-20260802    gcc-14
i386                 randconfig-001-20260801    clang-22
i386                 randconfig-002-20260801    clang-22
i386                 randconfig-002-20260801    gcc-14
i386                 randconfig-003-20260801    clang-22
i386                 randconfig-004-20260801    clang-22
i386                 randconfig-005-20260801    clang-22
i386                 randconfig-006-20260801    clang-22
i386                 randconfig-007-20260801    clang-22
i386                          randconfig-011    clang-22
i386                 randconfig-011-20260801    clang-22
i386                 randconfig-011-20260801    gcc-14
i386                 randconfig-012-20260801    gcc-14
i386                 randconfig-013-20260801    gcc-14
i386                 randconfig-014-20260801    clang-22
i386                 randconfig-014-20260801    gcc-14
i386                 randconfig-015-20260801    clang-22
i386                 randconfig-015-20260801    gcc-14
i386                 randconfig-016-20260801    gcc-14
i386                 randconfig-017-20260801    clang-22
i386                 randconfig-017-20260801    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260801    clang-18
loongarch            randconfig-001-20260801    gcc-16.1.0
loongarch            randconfig-001-20260802    clang-24
loongarch            randconfig-002-20260801    gcc-16.1.0
loongarch            randconfig-002-20260802    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260801    gcc-16.1.0
nios2                randconfig-001-20260801    gcc-8.5.0
nios2                randconfig-001-20260802    clang-24
nios2                randconfig-002-20260801    gcc-11.5.0
nios2                randconfig-002-20260801    gcc-16.1.0
nios2                randconfig-002-20260802    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-9.5.0
parisc               randconfig-001-20260801    gcc-11.5.0
parisc               randconfig-001-20260802    gcc-14.3.0
parisc               randconfig-002-20260801    gcc-9.5.0
parisc               randconfig-002-20260802    gcc-14.3.0
powerpc                  bluestone_defconfig    clang-24
powerpc                      ebony_defconfig    clang-24
powerpc                  lite5200b_defconfig    clang-24
powerpc              randconfig-001-20260801    clang-20
powerpc              randconfig-001-20260802    gcc-14.3.0
powerpc              randconfig-002-20260801    gcc-10.5.0
powerpc              randconfig-002-20260802    gcc-14.3.0
powerpc64            randconfig-001-20260801    clang-24
powerpc64            randconfig-001-20260802    gcc-14.3.0
powerpc64            randconfig-002-20260801    clang-24
powerpc64            randconfig-002-20260802    gcc-14.3.0
riscv                         randconfig-001    gcc-13.4.0
riscv                         randconfig-001    gcc-14.3.0
riscv                randconfig-001-20260801    gcc-14.3.0
riscv                randconfig-001-20260802    gcc-13.4.0
riscv                randconfig-002-20260801    clang-20
riscv                randconfig-002-20260801    gcc-14.3.0
riscv                randconfig-002-20260802    gcc-13.4.0
s390                 randconfig-001-20260801    gcc-14.3.0
s390                 randconfig-001-20260801    gcc-15.2.0
s390                 randconfig-001-20260802    gcc-13.4.0
s390                 randconfig-002-20260801    clang-24
s390                 randconfig-002-20260801    gcc-14.3.0
s390                 randconfig-002-20260802    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260801    gcc-14.3.0
sh                   randconfig-001-20260801    gcc-16.1.0
sh                   randconfig-001-20260802    gcc-13.4.0
sh                   randconfig-002-20260801    gcc-14.3.0
sh                   randconfig-002-20260801    gcc-16.1.0
sh                   randconfig-002-20260802    gcc-13.4.0
sh                            sh03_defconfig    gcc-16.1.0
sparc                randconfig-001-20260801    gcc-11.5.0
sparc                randconfig-001-20260801    gcc-8.5.0
sparc                randconfig-001-20260802    gcc-12.5.0
sparc                randconfig-002-20260801    gcc-11.5.0
sparc                randconfig-002-20260802    gcc-12.5.0
sparc64              randconfig-001-20260801    gcc-11.5.0
sparc64              randconfig-001-20260801    gcc-9.5.0
sparc64              randconfig-001-20260802    gcc-12.5.0
sparc64              randconfig-002-20260801    gcc-11.5.0
sparc64              randconfig-002-20260801    gcc-15.2.0
sparc64              randconfig-002-20260802    gcc-12.5.0
um                   randconfig-001-20260801    clang-17
um                   randconfig-001-20260801    gcc-11.5.0
um                   randconfig-001-20260802    gcc-12.5.0
um                   randconfig-002-20260801    gcc-11.5.0
um                   randconfig-002-20260801    gcc-14
um                   randconfig-002-20260802    gcc-12.5.0
x86_64              buildonly-randconfig-001    clang-22
x86_64              buildonly-randconfig-001    gcc-12
x86_64     buildonly-randconfig-001-20260801    clang-22
x86_64     buildonly-randconfig-001-20260802    gcc-12
x86_64     buildonly-randconfig-002-20260801    clang-22
x86_64     buildonly-randconfig-002-20260802    gcc-12
x86_64     buildonly-randconfig-003-20260801    clang-22
x86_64     buildonly-randconfig-003-20260801    gcc-13
x86_64     buildonly-randconfig-003-20260802    gcc-12
x86_64     buildonly-randconfig-004-20260801    clang-22
x86_64     buildonly-randconfig-004-20260802    gcc-12
x86_64     buildonly-randconfig-005-20260801    clang-22
x86_64     buildonly-randconfig-005-20260802    gcc-12
x86_64     buildonly-randconfig-006-20260801    clang-22
x86_64     buildonly-randconfig-006-20260802    gcc-12
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260801    gcc-14
x86_64               randconfig-001-20260802    clang-22
x86_64               randconfig-002-20260801    gcc-14
x86_64               randconfig-002-20260802    clang-22
x86_64               randconfig-003-20260801    gcc-14
x86_64               randconfig-003-20260802    clang-22
x86_64               randconfig-004-20260801    gcc-14
x86_64               randconfig-004-20260802    clang-22
x86_64               randconfig-005-20260801    gcc-14
x86_64               randconfig-005-20260802    clang-22
x86_64               randconfig-006-20260801    gcc-14
x86_64               randconfig-006-20260802    clang-22
x86_64                        randconfig-011    clang-22
x86_64                        randconfig-011    gcc-14
x86_64               randconfig-011-20260801    clang-22
x86_64               randconfig-012-20260801    clang-22
x86_64               randconfig-012-20260801    gcc-14
x86_64               randconfig-013-20260801    clang-22
x86_64               randconfig-014-20260801    clang-22
x86_64               randconfig-014-20260801    gcc-14
x86_64               randconfig-015-20260801    clang-22
x86_64               randconfig-016-20260801    clang-22
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260801    clang-22
x86_64               randconfig-071-20260801    gcc-14
x86_64               randconfig-071-20260802    gcc-12
x86_64               randconfig-072-20260801    clang-22
x86_64               randconfig-072-20260801    gcc-14
x86_64               randconfig-072-20260802    gcc-12
x86_64               randconfig-073-20260801    clang-22
x86_64               randconfig-073-20260802    gcc-12
x86_64               randconfig-074-20260801    clang-22
x86_64               randconfig-074-20260801    gcc-14
x86_64               randconfig-074-20260802    gcc-12
x86_64               randconfig-075-20260801    clang-22
x86_64               randconfig-075-20260802    gcc-12
x86_64               randconfig-076-20260801    clang-22
x86_64               randconfig-076-20260802    gcc-12
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260801    gcc-11.5.0
xtensa               randconfig-001-20260801    gcc-9.5.0
xtensa               randconfig-001-20260802    gcc-12.5.0
xtensa               randconfig-002-20260801    gcc-11.5.0
xtensa               randconfig-002-20260801    gcc-15.2.0
xtensa               randconfig-002-20260802    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

