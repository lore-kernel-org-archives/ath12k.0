Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C41CF2579
	for <ath12k@archiver.kernel.org>; Sun, 13 Oct 2024 18:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gwky+blIHpEXNNLN6E+fyHa4F6SGj0AlpnhHwLHTdCo=; b=Z4YkhDjevpFlIX+yNoHYuz0ItL
	Ch0evOMFe05KYuMcZC5EzdaCOCcY9hMpqnCC2D2q4dsPlGUA3c9CIYFD5GODvo3N7iCFMarQRZtsJ
	reFnngwcRG+T6owm4/hzoAmKm05WXKzJw+NvuT8WkF8cythEHEzqk8oMh9pRBdZvM8DODTBGVD+zj
	JJfv9e/h6WlBhQTBLFPo7jG28+4WlJnk9L5hwvVaJIo1uI9UWCDTt+Pp7Nh/kTVpvhowHQDfrOohs
	XnKmW/Qso4bur7fNT7Yu0THTtWcHW+r4OhlxdmceKayk9ayj7VuwOrCf+Z7CEU0zTaSVORYRFMmcW
	L4gqD8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03Qs-000000033Fy-1Jb0
	for ath12k@archiver.kernel.org;
	Sun, 13 Oct 2024 18:35:10 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03Qp-000000033Fd-0eMB
	for ath12k@lists.infradead.org;
	Sun, 13 Oct 2024 18:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728844507; x=1760380507;
  h=date:from:to:cc:subject:message-id;
  bh=8R/4x9OdKj0sfp0p/2ahhQ1fXSdOByWPNeU90GJxJtg=;
  b=j8zfa1Q0nH4ekc2RdGFm+qbkBQGUmTjVP7m2hSZZ4b5lK7ra2Ee016nJ
   c3W6XsoOpWXWYnBwNcIx93FNb0OhzgBX8GuMrc6FVWokH4RPUPZ5qbRae
   pGSS6AgL4YaWXPisGI2v0UDHLRi3vHmwXWeDGarn2cJY8RDwwc79PPj/0
   7jCbLtSEeBDMA2CnhKdkNudJC1ChnI69WHkrSMyDO/8OuGF/Ji1a0zZUO
   1tzIslbQWzrq+pC17chCRsV/7oarMsIyNXUBueN+Re2fuq//GdcBtoyE7
   hNieI+OCZ6W0dgAGIjQYQdvQBUVi11CrWhqpnai/mjQBT98K17h7ITXhC
   w==;
X-CSE-ConnectionGUID: DBgvuH6lTFKAgplmMRohPA==
X-CSE-MsgGUID: rjpGIT1JSxCFjweB9ndG6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28072246"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28072246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 11:35:03 -0700
X-CSE-ConnectionGUID: m5lFYCYVRwC1JM0/V/a/Ow==
X-CSE-MsgGUID: 57Ueg22dTX6Pefm0lK9sCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="77471255"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Oct 2024 11:35:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t03Qg-000Ebp-2Z;
	Sun, 13 Oct 2024 18:34:58 +0000
Date: Mon, 14 Oct 2024 02:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 69eabe24843f238e79a6dbbd2b3fcc8eef39d6b8
Message-ID: <202410140259.NRvacDey-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_113507_306173_70107EF2 
X-CRM114-Status: UNSURE (   3.57  )
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
branch HEAD: 69eabe24843f238e79a6dbbd2b3fcc8eef39d6b8  Add localversion-wireless-testing-ath

elapsed time: 2942m

configs tested: 212
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              alldefconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241013    gcc-14.1.0
arc                   randconfig-002-20241013    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    clang-20
arm                          moxart_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    gcc-14.1.0
arm                          pxa3xx_defconfig    clang-20
arm                   randconfig-001-20241013    gcc-14.1.0
arm                   randconfig-002-20241013    gcc-14.1.0
arm                   randconfig-003-20241013    gcc-14.1.0
arm                   randconfig-004-20241013    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241013    gcc-14.1.0
arm64                 randconfig-002-20241013    gcc-14.1.0
arm64                 randconfig-003-20241013    gcc-14.1.0
arm64                 randconfig-004-20241013    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241013    gcc-14.1.0
csky                  randconfig-002-20241013    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241013    gcc-14.1.0
hexagon               randconfig-002-20241013    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241013    clang-18
i386        buildonly-randconfig-001-20241013    gcc-12
i386        buildonly-randconfig-002-20241013    gcc-12
i386        buildonly-randconfig-003-20241013    clang-18
i386        buildonly-randconfig-003-20241013    gcc-12
i386        buildonly-randconfig-004-20241013    gcc-12
i386        buildonly-randconfig-005-20241013    clang-18
i386        buildonly-randconfig-005-20241013    gcc-12
i386        buildonly-randconfig-006-20241013    clang-18
i386        buildonly-randconfig-006-20241013    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241013    clang-18
i386                  randconfig-001-20241013    gcc-12
i386                  randconfig-002-20241013    gcc-12
i386                  randconfig-003-20241013    gcc-12
i386                  randconfig-004-20241013    gcc-11
i386                  randconfig-004-20241013    gcc-12
i386                  randconfig-005-20241013    clang-18
i386                  randconfig-005-20241013    gcc-12
i386                  randconfig-006-20241013    clang-18
i386                  randconfig-006-20241013    gcc-12
i386                  randconfig-011-20241013    clang-18
i386                  randconfig-011-20241013    gcc-12
i386                  randconfig-012-20241013    gcc-12
i386                  randconfig-013-20241013    clang-18
i386                  randconfig-013-20241013    gcc-12
i386                  randconfig-014-20241013    gcc-12
i386                  randconfig-015-20241013    clang-18
i386                  randconfig-015-20241013    gcc-12
i386                  randconfig-016-20241013    clang-18
i386                  randconfig-016-20241013    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241013    gcc-14.1.0
loongarch             randconfig-002-20241013    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    clang-20
mips                           ip32_defconfig    clang-20
mips                     loongson1c_defconfig    gcc-14.1.0
mips                          rm200_defconfig    gcc-14.1.0
mips                         rt305x_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241013    gcc-14.1.0
nios2                 randconfig-002-20241013    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241013    gcc-14.1.0
parisc                randconfig-002-20241013    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   currituck_defconfig    gcc-14.1.0
powerpc                       eiger_defconfig    clang-20
powerpc                     ep8248e_defconfig    gcc-14.1.0
powerpc                       holly_defconfig    clang-20
powerpc                     ksi8560_defconfig    gcc-14.1.0
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc                      pasemi_defconfig    gcc-14.1.0
powerpc                     powernv_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241013    gcc-14.1.0
powerpc               randconfig-002-20241013    gcc-14.1.0
powerpc               randconfig-003-20241013    gcc-14.1.0
powerpc                     tqm8540_defconfig    gcc-14.1.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241013    gcc-14.1.0
powerpc64             randconfig-002-20241013    gcc-14.1.0
powerpc64             randconfig-003-20241013    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241013    gcc-14.1.0
riscv                 randconfig-002-20241013    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241013    gcc-14.1.0
s390                  randconfig-002-20241013    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.1.0
sh                ecovec24-romimage_defconfig    clang-20
sh                        edosk7760_defconfig    gcc-14.1.0
sh                          polaris_defconfig    clang-20
sh                    randconfig-001-20241013    gcc-14.1.0
sh                    randconfig-002-20241013    gcc-14.1.0
sh                           se7619_defconfig    clang-20
sh                   sh7724_generic_defconfig    clang-20
sh                        sh7763rdp_defconfig    gcc-14.1.0
sh                            titan_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241013    gcc-14.1.0
sparc64               randconfig-002-20241013    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241013    gcc-14.1.0
um                    randconfig-002-20241013    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241013    clang-18
x86_64      buildonly-randconfig-002-20241013    clang-18
x86_64      buildonly-randconfig-003-20241013    clang-18
x86_64      buildonly-randconfig-004-20241013    clang-18
x86_64      buildonly-randconfig-005-20241013    clang-18
x86_64      buildonly-randconfig-006-20241013    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241013    clang-18
x86_64                randconfig-002-20241013    clang-18
x86_64                randconfig-003-20241013    clang-18
x86_64                randconfig-004-20241013    clang-18
x86_64                randconfig-005-20241013    clang-18
x86_64                randconfig-006-20241013    clang-18
x86_64                randconfig-011-20241013    clang-18
x86_64                randconfig-012-20241013    clang-18
x86_64                randconfig-013-20241013    clang-18
x86_64                randconfig-014-20241013    clang-18
x86_64                randconfig-015-20241013    clang-18
x86_64                randconfig-016-20241013    clang-18
x86_64                randconfig-071-20241013    clang-18
x86_64                randconfig-072-20241013    clang-18
x86_64                randconfig-073-20241013    clang-18
x86_64                randconfig-074-20241013    clang-18
x86_64                randconfig-075-20241013    clang-18
x86_64                randconfig-076-20241013    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-20
xtensa                randconfig-001-20241013    gcc-14.1.0
xtensa                randconfig-002-20241013    gcc-14.1.0
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

