Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD43C87FD2
	for <ath12k@archiver.kernel.org>; Sat,  2 Aug 2025 08:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WYW97JDtP+55EJR434SB5IGJLzNw+K6fjzd4c8zHhKk=; b=b/Qeq32W3Ang37ZOwr1+RC6NKS
	DNJnSWNfn7oW2dTH1RIufD7EVcW3b9Wk6KHeXnTclmQtxOMeX843wf6rUlrRVXQDmAPFhfiQsHwBG
	120nBKiig/BgM92d5lBiOVCsZiOHf9MzNZ2kpa4nFoEFOfXwjfhKj4+43eoHdrx+SMRlZrm1k8M/p
	Bf2E1ozyRtRJSfIGcx5faY08smjjZIWP65bOGKUB/BqPKuXEv0+6YlC+P59nLEGiYep60cONCXVSx
	YARWvSrQ8mN40x+YgqFanDWwFs2FJPITb/OpW/U6+YPOlCO+ZfMLkCFstnpQPMOu1Kdk7qxaMDl/K
	TeQS8Dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui7GX-00000007Jh6-3fIk;
	Sat, 02 Aug 2025 08:06:53 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui7GU-00000007Jga-11k1
	for ath12k@lists.infradead.org;
	Sat, 02 Aug 2025 08:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754122010; x=1785658010;
  h=date:from:to:cc:subject:message-id;
  bh=FihGXuAMh+CoxIMYWdZhIrGqw/KuVzswe9N7DuiMcl8=;
  b=QWbWEdOZeDAEX3VNoz2pWLBqRIuBJZwGUNOQh8StMlABHwBxo5vj8SZC
   YLfgyquYVr6zKemRQoipSTVT30SAZyDZSxmBa32E+1HRUF06MUnOoYi9K
   3CFofeL0Y+WGmWDsnDRcuZGOCvjJnhcJdvBl5mv1TCol3UHY9KRw1mLKl
   vPKBVmBnJ3OMQh08IaVnhy5eu6OyV81gy4xSQ8pUWIc+jotcC29GEyfSt
   r3HPXQcLJyMfdLtooGaPX1lWm+em7Y6pGbAAO3mLm9w5JRiwG1aSJrZbL
   Vnl6x3Nvg1zE7ndy1wVscK0nPMPqVIHzgW3zxzfRRokd0wm/1+1l1nRcr
   Q==;
X-CSE-ConnectionGUID: Omo+cxFOQN2KjnqR1Pb0KQ==
X-CSE-MsgGUID: 5yOCTYz1S1SZEmsJeZP7iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56596773"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56596773"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 01:06:45 -0700
X-CSE-ConnectionGUID: upTlC4lNQFKZ4yVA6NxgTw==
X-CSE-MsgGUID: 7nNbX5FGQSevX3XeuqPhdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164208440"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Aug 2025 01:06:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui7GL-0005FA-26;
	Sat, 02 Aug 2025 08:06:41 +0000
Date: Sat, 02 Aug 2025 16:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 4cedae6335644a5858e1bc2c367aedc10482b654
Message-ID: <202508021622.iTHEjIMN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_010650_357478_06FE0A6F 
X-CRM114-Status: UNSURE (   3.38  )
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
branch HEAD: 4cedae6335644a5858e1bc2c367aedc10482b654  Add localversion-wireless-testing-ath

elapsed time: 723m

configs tested: 116
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250802    gcc-11.5.0
arc                   randconfig-002-20250802    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250802    gcc-10.5.0
arm                   randconfig-002-20250802    clang-22
arm                   randconfig-003-20250802    clang-18
arm                   randconfig-004-20250802    gcc-8.5.0
arm                          sp7021_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250802    gcc-12.5.0
arm64                 randconfig-002-20250802    gcc-8.5.0
arm64                 randconfig-003-20250802    clang-22
arm64                 randconfig-004-20250802    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250802    gcc-15.1.0
csky                  randconfig-002-20250802    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250802    clang-22
hexagon               randconfig-002-20250802    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250802    gcc-12
i386        buildonly-randconfig-002-20250802    gcc-12
i386        buildonly-randconfig-003-20250802    clang-20
i386        buildonly-randconfig-004-20250802    gcc-12
i386        buildonly-randconfig-005-20250802    clang-20
i386        buildonly-randconfig-006-20250802    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250802    clang-18
loongarch             randconfig-002-20250802    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250802    gcc-9.5.0
nios2                 randconfig-002-20250802    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250802    gcc-8.5.0
parisc                randconfig-002-20250802    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250802    gcc-8.5.0
powerpc               randconfig-002-20250802    clang-20
powerpc               randconfig-003-20250802    gcc-10.5.0
powerpc64             randconfig-001-20250802    clang-16
powerpc64             randconfig-002-20250802    gcc-8.5.0
powerpc64             randconfig-003-20250802    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250802    gcc-10.5.0
riscv                 randconfig-002-20250802    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250802    clang-22
s390                  randconfig-002-20250802    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250802    gcc-15.1.0
sh                    randconfig-002-20250802    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250802    gcc-8.5.0
sparc                 randconfig-002-20250802    gcc-8.5.0
sparc64               randconfig-001-20250802    gcc-8.5.0
sparc64               randconfig-002-20250802    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250802    clang-22
um                    randconfig-002-20250802    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250802    gcc-12
x86_64      buildonly-randconfig-002-20250802    clang-20
x86_64      buildonly-randconfig-003-20250802    clang-20
x86_64      buildonly-randconfig-004-20250802    clang-20
x86_64      buildonly-randconfig-005-20250802    clang-20
x86_64      buildonly-randconfig-006-20250802    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250802    gcc-13.4.0
xtensa                randconfig-002-20250802    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

