Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36EBCF2579
	for <ath12k@archiver.kernel.org>; Sun, 13 Oct 2024 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9V//UdGyhMCZZ0YbAbN8VtU/X0ESyXUl94nmvf0BqWM=; b=RWMbYiAFiGARqeJ3PLkBUh5/3k
	vV3J+BbH6aKx/+mDIiw62WwfH5o5tGUBIopNa4I9JjFm9uDLC0ba47pwOOzaSstZEotvvDrluqnsN
	LpMhJaPEHSNBRZ+LdbLBvypX9YXggZjMSqKlZQjGgevUYw0p+4RSlBTMtihQXBoenpJgKkUnFJWWK
	YAsUFyxHXVRcraSBUHpNRt75xpXuG0E2UjmEluIiWReIINbebWU+2r+alqaw6WLCXRhLafqEKga1k
	5Woob7RlYPgKUs6zFLMF9vK78YQiLGnqCSy5k/Gsju1ZUiUoavVTyLElm6fIKvJxBGw04TQtwTRYD
	aH0wMXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szthc-00000002OZG-1vJL
	for ath12k@archiver.kernel.org;
	Sun, 13 Oct 2024 08:11:48 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szthY-00000002OYu-4121
	for ath12k@lists.infradead.org;
	Sun, 13 Oct 2024 08:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728807106; x=1760343106;
  h=date:from:to:cc:subject:message-id;
  bh=jtleCu/Qi0nuc2X7TTxTSS+vsoVRlwcEk1FmpHoV9Wk=;
  b=O5u4TDFYQbdzqsp2r4H4HBUCZzS29TEw4pab21xatmpQafw3x3A5ZGxg
   ml93TH/f31EmlGTJpItcneWqKJMwDIfVgm5fnMdZ1Wz2jzKk210nhfHgQ
   PA/cwjFl0gqBIALr7hd2tlTCMbPeRIiOcad8xNW2cZ7meZzubrNf9H1nz
   wB4T1LvxHccchPGLdqTSZMhgz9p9WWDPfMf7yZOjCSva2cZk/A6H0OTS6
   lZQmXIhvQnVbE2bjIMHlmsemdWycXWfpZjZx0orjtjsruSLvn36GNGcwA
   RWHJ9TgLaQM4FM/SaQ6beli9zow7i1wOLnenO+5rWLUWJmnKWI5blLGfs
   w==;
X-CSE-ConnectionGUID: CyWvqAXbQ9CRCvczwrirmw==
X-CSE-MsgGUID: yQ5EPwknTBeOQYRwVj9Owg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28261146"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28261146"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 01:11:43 -0700
X-CSE-ConnectionGUID: GQpcSoaFSzqlyu8wOmXDPw==
X-CSE-MsgGUID: 9j9ahEVxRdueUhEF5KulOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="76918297"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Oct 2024 01:11:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szthS-000ECx-0p;
	Sun, 13 Oct 2024 08:11:38 +0000
Date: Sun, 13 Oct 2024 16:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 e805272f8c2dee280e2fa1c1a454517df17f1261
Message-ID: <202410131604.m4Y7SnyE-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_011145_314221_FE6DDF4C 
X-CRM114-Status: UNSURE (   3.68  )
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
branch HEAD: e805272f8c2dee280e2fa1c1a454517df17f1261  wifi: ath12k: ath12k_mac_op_sta_state(): clean up update_wk cancellation

elapsed time: 2465m

configs tested: 161
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
arc                                 defconfig    gcc-14.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arc                   randconfig-001-20241013    gcc-14.1.0
arc                   randconfig-002-20241013    gcc-14.1.0
arc                        vdk_hs38_defconfig    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                       multi_v4t_defconfig    gcc-14.1.0
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
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
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
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
mips                     loongson2k_defconfig    gcc-14.1.0
mips                      loongson3_defconfig    gcc-14.1.0
mips                      maltasmvp_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    gcc-14.1.0
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
parisc                generic-64bit_defconfig    gcc-14.1.0
parisc                randconfig-001-20241013    gcc-14.1.0
parisc                randconfig-002-20241013    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                          g5_defconfig    gcc-14.1.0
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                         ps3_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241013    gcc-14.1.0
powerpc               randconfig-002-20241013    gcc-14.1.0
powerpc               randconfig-003-20241013    gcc-14.1.0
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
sh                        edosk7760_defconfig    gcc-14.1.0
sh                    randconfig-001-20241013    gcc-14.1.0
sh                    randconfig-002-20241013    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241013    gcc-14.1.0
sparc64               randconfig-002-20241013    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241013    gcc-14.1.0
um                    randconfig-002-20241013    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    gcc-14.1.0
xtensa                randconfig-001-20241013    gcc-14.1.0
xtensa                randconfig-002-20241013    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

