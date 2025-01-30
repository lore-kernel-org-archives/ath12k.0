Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E109C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 05:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WjNb2lrEWd1GmX6XFBpnIY5w9fV+AXasB1L1UzQrRd0=; b=vgyYuiKUpJzPyDGbGQyvSbxw4W
	+yVJ/USR/asfRBRlZCWVa+YwVGx0Biy0tvVR/5vjd72YvbL+dQlYO80YHGbbHBhuH0ipT0a4KQdjp
	Sanz+9HRhVh5t0hMPIA3nrZo81LJjNY/2smz6pOp2ekTRZL+LYSocFlUCUPJvrMUfmoV8OLjWPLfT
	VUy1aO6J1uzdD3pNPAX1imBnHjugExpgX6GttmFbTT/JTkuq+WFDVGu6KDIcMS0di2A/a0S+dbLF4
	fU4bdjqRNX4o4DQNiIFVmG9YgrKjoG0QNxjrKoSxmjW/l8p6KepnvZLsyAuidTDC/eNcSSNE7Pdd2
	YidtonxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNUn-00000008Hda-2zOG
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 05:53:45 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNUl-00000008HdD-23JE
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 05:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738216424; x=1769752424;
  h=date:from:to:cc:subject:message-id;
  bh=y5nv9trOOrcfglVgezoI/lDVqDDGEkTfLFXW3kb79nY=;
  b=nwgs2SH8SUsJXuth5w/yv+Dasr/kHLN1Uov6hinzAgQ9Ub1gl4CvPbRj
   WsUKvehxSchcNkitcSzTym0ddcsYFc+q/rr2NEqOl+44GQy5gClCNGPY3
   Uz+/gQtBm+rPM9c/7rL8aew6XTIZCyDV90l7xeCzab7t6f21RepwI3YZo
   Bi+Va+dH2nQ1qqkzKYvJyOeRI3xErDPBFLkdaWSm/c0OFW/utF8XP7UVC
   eurX4AzGx93mMIKH0/mJcMTs/peaa+WLh3COmXu0OgJqrCt/bY/QkarSw
   1RjlLXolmVQahUG2LKxAt363oeLZZm+Fe4VWiBcVDpONwFOhIQKaAb7ot
   Q==;
X-CSE-ConnectionGUID: Ti02rN/MQzOoZMz4T7KK2w==
X-CSE-MsgGUID: IDrALOB+RruItfa4/boeeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49339600"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="49339600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 21:53:40 -0800
X-CSE-ConnectionGUID: ylE4sHSDT0i0VDe9blrljg==
X-CSE-MsgGUID: p6KVHUmQRWSBAQyZdMmG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110144009"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jan 2025 21:53:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNUe-000jj5-23;
	Thu, 30 Jan 2025 05:53:36 +0000
Date: Thu, 30 Jan 2025 13:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 a10b8b584b8bcb7559f068ce247fc27d0c4850ca
Message-ID: <202501301304.Dpl1i9Nl-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_215343_549216_C050B1F5 
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
branch HEAD: a10b8b584b8bcb7559f068ce247fc27d0c4850ca  Add localversion-wireless-testing-ath

elapsed time: 728m

configs tested: 107
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250130    gcc-13.2.0
arc                   randconfig-002-20250130    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-20
arm                   randconfig-001-20250130    gcc-14.2.0
arm                   randconfig-002-20250130    clang-20
arm                   randconfig-003-20250130    gcc-14.2.0
arm                   randconfig-004-20250130    clang-20
arm                           spitz_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250130    clang-20
arm64                 randconfig-002-20250130    gcc-14.2.0
arm64                 randconfig-003-20250130    clang-20
arm64                 randconfig-004-20250130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250130    gcc-14.2.0
csky                  randconfig-002-20250130    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250130    clang-20
hexagon               randconfig-002-20250130    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250130    clang-19
i386        buildonly-randconfig-002-20250130    clang-19
i386        buildonly-randconfig-003-20250130    gcc-11
i386        buildonly-randconfig-004-20250130    gcc-12
i386        buildonly-randconfig-005-20250130    gcc-12
i386        buildonly-randconfig-006-20250130    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250130    gcc-14.2.0
loongarch             randconfig-002-20250130    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                        qi_lb60_defconfig    clang-18
nios2                 randconfig-001-20250130    gcc-14.2.0
nios2                 randconfig-002-20250130    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250130    gcc-14.2.0
parisc                randconfig-002-20250130    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250130    gcc-14.2.0
powerpc               randconfig-002-20250130    clang-16
powerpc               randconfig-003-20250130    gcc-14.2.0
powerpc64             randconfig-001-20250130    gcc-14.2.0
powerpc64             randconfig-002-20250130    clang-20
powerpc64             randconfig-003-20250130    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250130    clang-20
riscv                 randconfig-002-20250130    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250130    gcc-14.2.0
s390                  randconfig-002-20250130    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250130    gcc-14.2.0
sh                    randconfig-002-20250130    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250130    gcc-14.2.0
sparc                 randconfig-002-20250130    gcc-14.2.0
sparc64               randconfig-001-20250130    gcc-14.2.0
sparc64               randconfig-002-20250130    gcc-14.2.0
um                               alldefconfig    clang-19
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250130    gcc-12
um                    randconfig-002-20250130    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250130    clang-19
x86_64      buildonly-randconfig-002-20250130    gcc-12
x86_64      buildonly-randconfig-003-20250130    gcc-12
x86_64      buildonly-randconfig-004-20250130    clang-19
x86_64      buildonly-randconfig-005-20250130    gcc-12
x86_64      buildonly-randconfig-006-20250130    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250130    gcc-14.2.0
xtensa                randconfig-002-20250130    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

