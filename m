Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5C6D5E149
	for <ath12k@archiver.kernel.org>; Fri,  8 Nov 2024 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SJ8Db7C9uShKFv0onL4LjFy+VGoe0XFSJKokOxQhaE0=; b=A3SkNa3xGgDpI+hdxpibfmNcfM
	X1TgAlcDoO5NDm0iCI2rVxUFq5WeISqneoBL8v3s9hH75jKO7COQagrLCFOTvQ+vgkD2aiULZM/K+
	L5hGPdyBMDHEIF43smKFe+3xHOhK0zqxf31r0AMuowDG9U2+CjZ7jtR9XDxq87b52IK12ydDMHN4I
	SDlWyKQWPzwH5r1cvMlDyDYVwBpK0rzfoi+IC3RvooOAIE2XPriDRiBCZZ8mE9O5SPdIz6sCOVA+V
	WLgyKHe/iJ8MTRI7kJCzsNpuqOo1u9AMTevRDBgJcGd1J6pjjc8lTGMggIXRDzoZx4GNf31TWRp77
	Xj2YtQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KuA-00000009tDk-0IC2
	for ath12k@archiver.kernel.org;
	Fri, 08 Nov 2024 09:03:46 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kjl-00000009qrK-13ey
	for ath12k@lists.infradead.org;
	Fri, 08 Nov 2024 08:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731055981; x=1762591981;
  h=date:from:to:cc:subject:message-id;
  bh=m+/Khm6sPJ5aeZKNMJMVSJKdi7MIdV9XrXHTarnQuUY=;
  b=n89abZnyVYcGMxX3P1xENyRKqsxmxfb4J+a47kWB/aSYzTNDQVuNMpcT
   rxTsf5womjj6Stu5ckV0W14oNpNaigaXGc6jce+LFokJ4UM9vGj3YQ6V7
   7NrxBhqKxIdSTaUY0abUU0IQ9XcwINSXowgc9YtKpCaIyND2rJ3WRWcuj
   N4UEJz21IqznPoG7AbxHr75KVnxaTtpCPSlqxCvvwVH+XASumxKkt0EqA
   Gr4ei5OuWFp589WGFLck1v9YwPL5+/XeyDoPvn7NVhPk/QILLs26Oz1Nj
   hwvDf76012muTo5rkqBCWOgUZMWHBxPa74JUOtCfoNayvUmNrPPPMZVAE
   g==;
X-CSE-ConnectionGUID: 8nAW74ZxQiyHRl9WnCrXbw==
X-CSE-MsgGUID: LRGwvxHHRpWKO02Lsg/s6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31098238"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31098238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:52:58 -0800
X-CSE-ConnectionGUID: VgmMuUqeRpyRYcWxldxTEg==
X-CSE-MsgGUID: ZAcJqtfGR/GI2CCgnXfoug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85076089"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Nov 2024 00:52:56 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Kjd-000rEE-2q;
	Fri, 08 Nov 2024 08:52:53 +0000
Date: Fri, 08 Nov 2024 16:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 be7cc788fca002fb37bc46a840b69ccc66389858
Message-ID: <202411081651.KMY8eIuS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_005301_426722_E1859153 
X-CRM114-Status: UNSURE (   3.72  )
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
branch HEAD: be7cc788fca002fb37bc46a840b69ccc66389858  wifi: ath12k: Support MBSSID Control Frame Stats

elapsed time: 772m

configs tested: 152
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    clang-20
arc                            hsdk_defconfig    clang-14
arc                   randconfig-001-20241108    gcc-14.2.0
arc                   randconfig-002-20241108    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                            dove_defconfig    clang-14
arm                          ep93xx_defconfig    clang-14
arm                        keystone_defconfig    clang-20
arm                   randconfig-001-20241108    gcc-14.2.0
arm                   randconfig-002-20241108    gcc-14.2.0
arm                   randconfig-003-20241108    gcc-14.2.0
arm                   randconfig-004-20241108    gcc-14.2.0
arm                           sama7_defconfig    clang-14
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241108    gcc-14.2.0
arm64                 randconfig-002-20241108    gcc-14.2.0
arm64                 randconfig-003-20241108    gcc-14.2.0
arm64                 randconfig-004-20241108    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241108    gcc-14.2.0
csky                  randconfig-002-20241108    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241108    gcc-14.2.0
hexagon               randconfig-002-20241108    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241108    clang-19
i386        buildonly-randconfig-002-20241108    clang-19
i386        buildonly-randconfig-003-20241108    clang-19
i386        buildonly-randconfig-004-20241108    clang-19
i386        buildonly-randconfig-005-20241108    clang-19
i386        buildonly-randconfig-006-20241108    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241108    clang-19
i386                  randconfig-002-20241108    clang-19
i386                  randconfig-003-20241108    clang-19
i386                  randconfig-004-20241108    clang-19
i386                  randconfig-005-20241108    clang-19
i386                  randconfig-006-20241108    clang-19
i386                  randconfig-011-20241108    clang-19
i386                  randconfig-012-20241108    clang-19
i386                  randconfig-013-20241108    clang-19
i386                  randconfig-014-20241108    clang-19
i386                  randconfig-015-20241108    clang-19
i386                  randconfig-016-20241108    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241108    gcc-14.2.0
loongarch             randconfig-002-20241108    gcc-14.2.0
m68k                             alldefconfig    clang-20
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-14
mips                   sb1250_swarm_defconfig    clang-14
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241108    gcc-14.2.0
nios2                 randconfig-002-20241108    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-14
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241108    gcc-14.2.0
parisc                randconfig-002-20241108    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-14
powerpc                      cm5200_defconfig    clang-20
powerpc                   lite5200b_defconfig    clang-14
powerpc                     mpc512x_defconfig    clang-14
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-20
powerpc               randconfig-001-20241108    gcc-14.2.0
powerpc               randconfig-002-20241108    gcc-14.2.0
powerpc               randconfig-003-20241108    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-14
powerpc                  storcenter_defconfig    clang-20
powerpc                     taishan_defconfig    clang-20
powerpc                     tqm8541_defconfig    clang-20
powerpc64             randconfig-001-20241108    gcc-14.2.0
powerpc64             randconfig-002-20241108    gcc-14.2.0
powerpc64             randconfig-003-20241108    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241108    gcc-14.2.0
riscv                 randconfig-002-20241108    gcc-14.2.0
s390                             alldefconfig    clang-14
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241108    gcc-14.2.0
s390                  randconfig-002-20241108    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    clang-20
sh                          kfr2r09_defconfig    clang-14
sh                            migor_defconfig    clang-14
sh                    randconfig-001-20241108    gcc-14.2.0
sh                    randconfig-002-20241108    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-20
sh                          sdk7786_defconfig    clang-20
sh                            titan_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241108    gcc-14.2.0
sparc64               randconfig-002-20241108    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241108    gcc-14.2.0
um                    randconfig-002-20241108    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    clang-20
xtensa                randconfig-001-20241108    gcc-14.2.0
xtensa                randconfig-002-20241108    gcc-14.2.0
xtensa                         virt_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

