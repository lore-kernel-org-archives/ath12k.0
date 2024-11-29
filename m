Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81864D70DE3
	for <ath12k@archiver.kernel.org>; Fri, 29 Nov 2024 06:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GreI/tq0qX4LJw+5QLI7D6yXZX67cCC8OwN5D0wWjMg=; b=PKxqGYMRvTNIrzegdxEM61lhtU
	06AnnwPYSuWPK7rNe6FvAc+ftvlKP9sXtgvpLplqX/h5w9KoqRNCYr3A/lPORiGReTHY73i6u6Qvn
	WiAjjz4VfdVym57Y8UEJaQpPDSGOOSAdfaM+tXvX2xXR6ybpG+6CX+mA243+npee3TMLTYJ8aKSin
	Z8Q1Z7RCRCCGrzMDg4lWDT7jvLTM4zjo/q7GzWuvaJjmk35wkL6PZFoTEOsaupSeID0gO1rVZYROy
	XE4QWifGNiIksNb2AeK3X68C5/YdHdMM4deZwTaHoABb2XhR8tPhcV2qgYk6JJ+Vhze+uUvqiMaSM
	1EDep9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGuIf-0000000GzHa-13Td
	for ath12k@archiver.kernel.org;
	Fri, 29 Nov 2024 06:16:21 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGuIc-0000000GzH3-1kgg
	for ath12k@lists.infradead.org;
	Fri, 29 Nov 2024 06:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732860978; x=1764396978;
  h=date:from:to:cc:subject:message-id;
  bh=8QrxoqJpsTEL2Xb7kA1YA63jLf/n6bEgSDsgeKTEZi4=;
  b=MhcBrRX5td/vcH4SStQ/SvIIb3yeutPZap71EfhVO4agPU7gW+3FwLS5
   0NC4KQ5o9AuXiWonar0YxZZNOB4DRbvnoJ4O8cbfWyl5p5vB2pvbStuRt
   KV9+5grEwe/vgHmRvjh1FyubP8ffsGV5fclj7o0tY4YZ3C4Ccv02LX/4g
   aQGfzGb+f/36aJmtBcVnbpRJc2uZTJWQJekS8G3r6g2ccurw6LQ99hFrk
   e1rlhrguDHT13FA6HMuZGFE2fdb0Idyxs/KbuboXfnssO7PkGK8yVscQy
   3fB4RjP1xjTz62aDxfvk289Ulu2YNWmMEOgCTaeVaMp+/VW/sCU8gBi7N
   A==;
X-CSE-ConnectionGUID: zvOk1OTTRha9Az7Kr2pp0g==
X-CSE-MsgGUID: Eygn53wmTp+arDHAiN9CHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33032963"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33032963"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 22:16:17 -0800
X-CSE-ConnectionGUID: RsUGcopoTQGbj6Ck8+ZgRw==
X-CSE-MsgGUID: i2/HNHOoSTOA/+emzBNxTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="96830530"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2024 22:16:15 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGuIX-00003T-18;
	Fri, 29 Nov 2024 06:16:13 +0000
Date: Fri, 29 Nov 2024 14:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 360a5ebee4b333467a4e13c1efa6c0fbc4746124
Message-ID: <202411291429.lCkw0rRC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_221618_477766_4B9D9DBA 
X-CRM114-Status: UNSURE (   3.70  )
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
branch HEAD: 360a5ebee4b333467a4e13c1efa6c0fbc4746124  wifi: ath12k: Decrease ath12k_mac_station_assoc() stack usage

elapsed time: 722m

configs tested: 153
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                   randconfig-001-20241129    clang-20
arc                   randconfig-002-20241129    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                          exynos_defconfig    clang-20
arm                          ixp4xx_defconfig    clang-20
arm                       omap2plus_defconfig    clang-20
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241129    clang-20
arm                   randconfig-002-20241129    clang-20
arm                   randconfig-003-20241129    clang-20
arm                   randconfig-004-20241129    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-20
arm64                 randconfig-001-20241129    clang-20
arm64                 randconfig-002-20241129    clang-20
arm64                 randconfig-003-20241129    clang-20
arm64                 randconfig-004-20241129    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241129    clang-20
csky                  randconfig-002-20241129    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241129    clang-20
hexagon               randconfig-002-20241129    clang-20
i386        buildonly-randconfig-001-20241129    clang-19
i386        buildonly-randconfig-002-20241129    clang-19
i386        buildonly-randconfig-003-20241129    clang-19
i386        buildonly-randconfig-004-20241129    clang-19
i386        buildonly-randconfig-005-20241129    clang-19
i386        buildonly-randconfig-006-20241129    clang-19
i386                  randconfig-001-20241129    clang-19
i386                  randconfig-002-20241129    clang-19
i386                  randconfig-003-20241129    clang-19
i386                  randconfig-004-20241129    clang-19
i386                  randconfig-005-20241129    clang-19
i386                  randconfig-006-20241129    clang-19
i386                  randconfig-011-20241129    clang-19
i386                  randconfig-012-20241129    clang-19
i386                  randconfig-013-20241129    clang-19
i386                  randconfig-014-20241129    clang-19
i386                  randconfig-015-20241129    clang-19
i386                  randconfig-016-20241129    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241129    clang-20
loongarch             randconfig-002-20241129    clang-20
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                           virt_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241129    clang-20
nios2                 randconfig-002-20241129    clang-20
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241129    clang-20
parisc                randconfig-002-20241129    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                       ebony_defconfig    clang-20
powerpc                      ppc64e_defconfig    clang-20
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241129    clang-20
powerpc               randconfig-002-20241129    clang-20
powerpc               randconfig-003-20241129    clang-20
powerpc64             randconfig-001-20241129    clang-20
powerpc64             randconfig-002-20241129    clang-20
powerpc64             randconfig-003-20241129    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20241129    clang-20
riscv                 randconfig-002-20241129    clang-20
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241129    clang-20
s390                  randconfig-002-20241129    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241129    clang-20
sh                    randconfig-002-20241129    clang-20
sh                          rsk7201_defconfig    clang-20
sh                   sh7724_generic_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241129    clang-20
sparc64               randconfig-002-20241129    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20241129    clang-20
um                    randconfig-002-20241129    clang-20
x86_64      buildonly-randconfig-001-20241129    clang-19
x86_64      buildonly-randconfig-002-20241129    clang-19
x86_64      buildonly-randconfig-003-20241129    clang-19
x86_64      buildonly-randconfig-004-20241129    clang-19
x86_64      buildonly-randconfig-005-20241129    clang-19
x86_64      buildonly-randconfig-006-20241129    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241129    clang-19
x86_64                randconfig-002-20241129    clang-19
x86_64                randconfig-003-20241129    clang-19
x86_64                randconfig-004-20241129    clang-19
x86_64                randconfig-005-20241129    clang-19
x86_64                randconfig-006-20241129    clang-19
x86_64                randconfig-011-20241129    clang-19
x86_64                randconfig-012-20241129    clang-19
x86_64                randconfig-013-20241129    clang-19
x86_64                randconfig-014-20241129    clang-19
x86_64                randconfig-015-20241129    clang-19
x86_64                randconfig-016-20241129    clang-19
x86_64                randconfig-071-20241129    clang-19
x86_64                randconfig-072-20241129    clang-19
x86_64                randconfig-073-20241129    clang-19
x86_64                randconfig-074-20241129    clang-19
x86_64                randconfig-075-20241129    clang-19
x86_64                randconfig-076-20241129    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241129    clang-20
xtensa                randconfig-002-20241129    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

