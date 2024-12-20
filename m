Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD86E77188
	for <ath12k@archiver.kernel.org>; Fri, 20 Dec 2024 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ewxkwg717FCBqF3iHDR4u+f1CmmzonaIFx22o5CT+mQ=; b=PdnE33bGpmOOUA8L7BPOOnHTtj
	gNTqWb4cw6GTpGQbCZVxNv0RyQC8TMLcOFlhQCX3Yqf2r70yUJgu25Bp9kqHgRu8nMp49IM1XoB2L
	Hcy1xPudlOEy/DGCCVYBu3pu1SHtgEqtgfc5S7BQIgC5iX/WH5S+2CqlJ1xE3nVVTqIxMWSEN7LuC
	BU+dN8NVJHR7QYX6Bl11j7FM0KFBsQh3qHtB06BwTH92mGNYJIXbJoO6VrJHIRg+I7djRBmdeik+a
	aC+p0bNY+2FrcuqWTp188oKuuJb0qzMN2ASNY8LWydm1G/ILXEqMF422I4jtLEY+SH8eaaFQwc+hy
	qHWkfBLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiPx-00000005sq6-3feC
	for ath12k@archiver.kernel.org;
	Fri, 20 Dec 2024 19:12:09 +0000
Received: from [192.198.163.14] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiPu-00000005spU-3O8Z
	for ath12k@lists.infradead.org;
	Fri, 20 Dec 2024 19:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734721927; x=1766257927;
  h=date:from:to:cc:subject:message-id;
  bh=MbxNli/aNRS5SdJN4BZoxcO4nwhSau9FnxAjQmzIU9U=;
  b=LrMiqrNiKr3G1BISIzhk29Ux3AFeeF6zDRQrmqj07sD5s4MGJHkWsK/c
   4FSxzUE5zAB2EvAHpohJ5QbnZkc5TmiXgYpHQk+yiwUMpdaVJzU2PZiZy
   ssJVcVFSK1tz8Edk8l66FcVdeoQ05hiLmMDwD3eLjNepeUVn6OMpmifuW
   EOX/0EiKXk4A/l6XvNjkWVFdMY2pMKOFn/uioPUG1o7WJ6rP098SoEx87
   VcOoB+V2n/9xnc0xIG59kQ9dHTVik3fRAMmKuJdZ9AQMMtLvn7TDPb2Sq
   gHpCe6G1pWhmU6jBWXJlOUFee0TSoocVBs1ApEqg555HVZKSJecuVs5hT
   w==;
X-CSE-ConnectionGUID: CM7iFy1PTOasKps+58K/dg==
X-CSE-MsgGUID: SaPMttlvSuCERJWAqjUHVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35497108"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35497108"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 11:12:06 -0800
X-CSE-ConnectionGUID: 67iWHvXbTMaKT+V+O9uvcA==
X-CSE-MsgGUID: b202ocomTRWzFvB1J1QzZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99067712"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2024 11:12:05 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOiPq-0001bf-2E;
	Fri, 20 Dec 2024 19:12:02 +0000
Date: Sat, 21 Dec 2024 03:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 09fa3b6974a1245ddd0751747609431494ba5b4f
Message-ID: <202412210340.DMSP13LP-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_111206_859099_178A0378 
X-CRM114-Status: UNSURE (   2.87  )
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
branch HEAD: 09fa3b6974a1245ddd0751747609431494ba5b4f  Add localversion-wireless-testing-ath

elapsed time: 1447m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20241220    gcc-13.2.0
arc                  randconfig-002-20241220    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20241220    clang-19
arm                  randconfig-002-20241220    gcc-14.2.0
arm                  randconfig-003-20241220    gcc-14.2.0
arm                  randconfig-004-20241220    clang-20
arm64                           allmodconfig    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20241220    clang-17
arm64                randconfig-002-20241220    clang-19
arm64                randconfig-003-20241220    clang-20
arm64                randconfig-004-20241220    clang-19
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20241220    gcc-14.2.0
csky                 randconfig-002-20241220    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20241220    clang-20
hexagon              randconfig-002-20241220    clang-20
i386       buildonly-randconfig-001-20241220    gcc-12
i386       buildonly-randconfig-002-20241220    gcc-12
i386       buildonly-randconfig-003-20241220    gcc-12
i386       buildonly-randconfig-004-20241220    clang-19
i386       buildonly-randconfig-005-20241220    gcc-12
i386       buildonly-randconfig-006-20241220    gcc-12
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20241220    gcc-14.2.0
loongarch            randconfig-002-20241220    gcc-14.2.0
nios2                randconfig-001-20241220    gcc-14.2.0
nios2                randconfig-002-20241220    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20241220    gcc-14.2.0
parisc               randconfig-002-20241220    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20241220    clang-15
powerpc              randconfig-002-20241220    gcc-14.2.0
powerpc              randconfig-003-20241220    gcc-14.2.0
powerpc64            randconfig-001-20241220    gcc-14.2.0
powerpc64            randconfig-002-20241220    clang-19
powerpc64            randconfig-003-20241220    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20241220    gcc-14.2.0
riscv                randconfig-002-20241220    clang-19
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241220    gcc-14.2.0
s390                 randconfig-002-20241220    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241220    gcc-14.2.0
sh                   randconfig-002-20241220    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241220    gcc-14.2.0
sparc                randconfig-002-20241220    gcc-14.2.0
sparc64              randconfig-001-20241220    gcc-14.2.0
sparc64              randconfig-002-20241220    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20241220    clang-20
um                   randconfig-002-20241220    clang-20
x86_64     buildonly-randconfig-001-20241220    gcc-12
x86_64     buildonly-randconfig-002-20241220    clang-19
x86_64     buildonly-randconfig-003-20241220    gcc-12
x86_64     buildonly-randconfig-004-20241220    gcc-12
x86_64     buildonly-randconfig-005-20241220    clang-19
x86_64     buildonly-randconfig-006-20241220    gcc-12
xtensa               randconfig-001-20241220    gcc-14.2.0
xtensa               randconfig-002-20241220    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

