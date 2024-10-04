Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9E0CF856A
	for <ath12k@archiver.kernel.org>; Fri,  4 Oct 2024 02:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Aih9y6l+/crugVCpaosxT9w+H+IG460B79XBLCxtGpI=; b=DlcxYuqW22QeZE6eq4pDUhFuHZ
	o/2dD3Mkk+fat3wVn9n5w3qrP4J7NerxiyMs143jMgLN215xJT31OVJaxmJzuU6f7qSlKN1qT7eZk
	iBucBuEnU4J8eWU7TyApe2/EujbFKTKcd2UdjH6Dq++2BToKn17tAoEHSi0a14LzsRcWGlyPNu4tp
	q/v0BRb97DpOhSdsy1c6y2l4CSR0zmZbXVfBgYXDCgIDGpuy2sDCX0UrBkLVg55ePtW4rRjTlq7WY
	LN3k6iKSvYODFdEzz4lQ3ApMfNP1PTbefYAiRHZbZgQ05kwSoyOXzEazAjcuBmXa/qIfDUgVYYn7H
	hXx+zvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swYV9-0000000Au1B-3CmL
	for ath12k@archiver.kernel.org;
	Fri, 04 Oct 2024 02:57:07 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swYV5-0000000Au0q-3sI9
	for ath12k@lists.infradead.org;
	Fri, 04 Oct 2024 02:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728010625; x=1759546625;
  h=date:from:to:cc:subject:message-id;
  bh=dwxMonfRRGKm5/i/ch2I6/iYPsX7mvEZlSIShiJOOBQ=;
  b=TAWl6uzn7sO0EbO2JU0p7VXioTSSTuCdsSqydqGwGN78bGEuOayPNH+5
   /RyMbpCvcB+INVupRLSqANObNVIn1arHbFLOv3z+Ta5Td5gC8NiXzVXc3
   TGpxTTK2C1ZPwXrBIhovaPZe9WBMF192q+teh47pIG9tzWHU+CiPp/125
   BPfAs8JumDdA1nlbqxe979HuhWURXB6ouoCcNRYvMgpXasOsy48yIBC3G
   MpSJucFFPSyRTkQLTLxYJB0Xaa410B7Ga87+8gYvORAPkxBiTxRIkJ8QD
   aj/T5mkoDYYSxq4tbGRfjvt0F0wWbfpJYXIviCewy+GpNplpDGi5kAuE8
   A==;
X-CSE-ConnectionGUID: NDnw0Tq9QySXfjNCqrj2AQ==
X-CSE-MsgGUID: JCyw7RDeQK+tTX/cyW06pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31022118"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="31022118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 19:57:02 -0700
X-CSE-ConnectionGUID: uqP4i4LBQ5y6VkoFH33XzQ==
X-CSE-MsgGUID: HaQXC14jSjSCanKRSUwADA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="105312748"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Oct 2024 19:57:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swYUz-00019I-24;
	Fri, 04 Oct 2024 02:56:57 +0000
Date: Fri, 04 Oct 2024 10:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 7536faa61e194f5cfac0a9277b7cc3cfed766eb0
Message-ID: <202410041028.SZOBYQ0T-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_195704_086435_6275AF57 
X-CRM114-Status: UNSURE (   3.79  )
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
branch HEAD: 7536faa61e194f5cfac0a9277b7cc3cfed766eb0  Merge branch 'pending' into main-pending

elapsed time: 1817m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
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
i386        buildonly-randconfig-002-20241003    clang-18
i386        buildonly-randconfig-003-20241003    gcc-12
i386        buildonly-randconfig-004-20241003    clang-18
i386        buildonly-randconfig-005-20241003    gcc-12
i386        buildonly-randconfig-006-20241003    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241003    gcc-12
i386                  randconfig-002-20241003    clang-18
i386                  randconfig-003-20241003    clang-18
i386                  randconfig-004-20241003    gcc-12
i386                  randconfig-005-20241003    clang-18
i386                  randconfig-006-20241003    gcc-12
i386                  randconfig-011-20241003    clang-18
i386                  randconfig-012-20241003    gcc-12
i386                  randconfig-013-20241003    gcc-12
i386                  randconfig-014-20241003    gcc-12
i386                  randconfig-015-20241003    gcc-12
i386                  randconfig-016-20241003    gcc-12
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
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
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

