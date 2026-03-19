Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149391090247
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7mzD6kSGItAA3j6BXONvXQ0CQah1m03hTj8u8NIXa4=; b=g5X2D5WPZraqcytpeP4xX8PiHN
	qJPxFMG5YVSh7xpGeBDv8oWAAnubPjZj8hlsIObv04zUnE9IJRrdnLedIF4cBOf/ZYH8diXYHnrnD
	HCEgkO4XJU1Kz1cBQjD4jDcAdsWDVT5/yQpfdD+DeDiZbAl/xJukKaO20gHc6/LlbUerxklgwoZ5k
	goqFNuZF3DoJYCiDDp60Acw4qg9FO7Y+q+IBLJiXlFko6Mwb76nbqSnCKqmbDmFXnXI4bEjVn9kzd
	oQeUfJ8nUQEpN2GLZVgw3quiN5LhWi1BS5EbC1r2iIibq1VNf9LfRygTTwv6WmNhBtVCDIx2xotYo
	+VG3vNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FkD-0000000AzQR-33wv;
	Thu, 19 Mar 2026 15:57:09 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FkB-0000000AzOi-0wEf
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 15:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773935827; x=1805471827;
  h=date:from:to:cc:subject:message-id;
  bh=sBCVfO1f5LRAuWitjcKibkMDWUQIZjT5yK08shBamC0=;
  b=gFw7Td4T1kdQeGLe8PNKkTG/0QbejZdei44A0BNuOfvRsPIqVzfFmzb1
   /Ro2fLySA3NkbIBr1BGH3qYRh6TryiMLQeTTGqChenoDGoTUJqYg4UH8d
   56v+j+ztsC+xhpW+CHNL4clKUriXO04JVNZV0v26ybgUWWOLk8Oy4wJ56
   0QOBQp6v5XSxgNHJNatDhxUtLwZp9QB6EhREVDZazCOqLEAeB9XFZSjHR
   I8W6if2SSg1gK8VK9JDZStJzS7fq0gQA7tL5l/7L7sYJaCf4XlD77MSOj
   y9SmbNto36VGlib4VYGjRYnNxCatmIOXbY5iPSB/aIdbjGaYfx4tUe0bS
   g==;
X-CSE-ConnectionGUID: 9mJhjnO/RtSxtiN+J1Tx6w==
X-CSE-MsgGUID: ig2QGoVeR+2KPCH1ceZwNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74897495"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74897495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:57:06 -0700
X-CSE-ConnectionGUID: fbkpz2/kQ2aHGCYINYm+7Q==
X-CSE-MsgGUID: yoda/BX3ToSCQziVWn52PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222983175"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Mar 2026 08:57:05 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Fk6-000000001Fz-0sc7;
	Thu, 19 Mar 2026 15:57:02 +0000
Date: Thu, 19 Mar 2026 23:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 fd4c50e06c6f1e48e4440613f4ba4b1d1d0743da
Message-ID: <202603192318.kQxXtzh0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_085707_319268_95532BAC 
X-CRM114-Status: UNSURE (   3.96  )
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
branch HEAD: fd4c50e06c6f1e48e4440613f4ba4b1d1d0743da  wifi: ath12k: fix HE/EHT capability handling on big endian

elapsed time: 1427m

configs tested: 155
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260319    gcc-8.5.0
arc                   randconfig-002-20260319    gcc-13.4.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260319    clang-23
arm                   randconfig-002-20260319    gcc-8.5.0
arm                   randconfig-003-20260319    gcc-10.5.0
arm                   randconfig-004-20260319    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260319    clang-23
arm64                 randconfig-002-20260319    gcc-12.5.0
arm64                 randconfig-003-20260319    gcc-15.2.0
arm64                 randconfig-004-20260319    clang-16
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260319    gcc-15.2.0
csky                  randconfig-002-20260319    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260319    clang-23
hexagon               randconfig-002-20260319    clang-19
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260319    clang-20
i386        buildonly-randconfig-002-20260319    gcc-14
i386        buildonly-randconfig-003-20260319    gcc-14
i386        buildonly-randconfig-004-20260319    clang-20
i386        buildonly-randconfig-005-20260319    gcc-14
i386        buildonly-randconfig-006-20260319    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260319    clang-20
i386                  randconfig-002-20260319    clang-20
i386                  randconfig-003-20260319    gcc-14
i386                  randconfig-004-20260319    gcc-14
i386                  randconfig-005-20260319    clang-20
i386                  randconfig-006-20260319    clang-20
i386                  randconfig-007-20260319    gcc-13
i386                  randconfig-011-20260319    gcc-14
i386                  randconfig-012-20260319    gcc-14
i386                  randconfig-013-20260319    gcc-14
i386                  randconfig-014-20260319    clang-20
i386                  randconfig-015-20260319    gcc-14
i386                  randconfig-016-20260319    gcc-14
i386                  randconfig-017-20260319    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260319    clang-18
loongarch             randconfig-002-20260319    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260319    gcc-11.5.0
nios2                 randconfig-002-20260319    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260319    gcc-11.5.0
parisc                randconfig-002-20260319    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260319    clang-23
powerpc               randconfig-002-20260319    clang-16
powerpc64             randconfig-001-20260319    clang-19
powerpc64             randconfig-002-20260319    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260319    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260319    gcc-9.5.0
s390                  randconfig-002-20260319    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260319    gcc-10.5.0
sh                    randconfig-002-20260319    gcc-10.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260319    gcc-15.2.0
sparc                 randconfig-002-20260319    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260319    gcc-11.5.0
sparc64               randconfig-002-20260319    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260319    gcc-14
um                    randconfig-002-20260319    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260319    clang-20
x86_64      buildonly-randconfig-002-20260319    clang-20
x86_64      buildonly-randconfig-003-20260319    gcc-14
x86_64      buildonly-randconfig-004-20260319    clang-20
x86_64      buildonly-randconfig-005-20260319    clang-20
x86_64      buildonly-randconfig-006-20260319    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260319    gcc-14
x86_64                randconfig-002-20260319    gcc-12
x86_64                randconfig-003-20260319    gcc-14
x86_64                randconfig-004-20260319    gcc-14
x86_64                randconfig-005-20260319    clang-20
x86_64                randconfig-006-20260319    clang-20
x86_64                randconfig-011-20260319    clang-20
x86_64                randconfig-012-20260319    gcc-14
x86_64                randconfig-013-20260319    gcc-14
x86_64                randconfig-014-20260319    clang-20
x86_64                randconfig-015-20260319    clang-20
x86_64                randconfig-016-20260319    gcc-13
x86_64                randconfig-071-20260319    clang-20
x86_64                randconfig-072-20260319    gcc-14
x86_64                randconfig-073-20260319    clang-20
x86_64                randconfig-074-20260319    clang-20
x86_64                randconfig-075-20260319    clang-20
x86_64                randconfig-076-20260319    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260319    gcc-8.5.0
xtensa                randconfig-002-20260319    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

