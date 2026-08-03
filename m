Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1752BC55162
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 04:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LHNrzwshIfw7/aElk33upbmUOTM98XjvmdneWEKFocI=; b=IKvUrS5mv2ZgZDcotr1TB7UMt7
	/5Yxl2GUh+WG53Zt7+R7i33EcnGQOSW0j4IJ7RlpIklksDLIpuE2HbgKZmULmug2T4OnUJTN0j0tz
	8ERugj2+lLVatcbG2JqyYcz6EIFnpEDLjlMJsejB3v6SO873nyTsfAzQzn6zDXrT0xhnNgbc6RWFQ
	jfqQ1z5gyE9p/RwVCcUIMJO1wbOz6qZxbmx9g6BqUbvBPu2D7Gsv7rEnvejcV1AmSpXspMThHnEc6
	L4V36vngsdJIeflVPj8H75CcXGdzH/PvwtsFmNqSUBnSOHGq67UUw8MRDvzncD/dkVGhbwXlvkM8b
	pAiyibvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqk6Z-0000000GITH-38A2;
	Mon, 03 Aug 2026 04:16:47 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqk6X-0000000GISR-0pGg
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 04:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785730605; x=1817266605;
  h=date:from:to:cc:subject:message-id;
  bh=WKezN+gHth1IYxym2yE4n2jjQAyIqbTp6YPX5zaLZNM=;
  b=g3pg6vyJNNFD3EFzKsmDO3k3Va7wQ35z/QNMlzVSlFSiELoLspuXaBXC
   qi1vFJ/GwabjwHVShIo9/6lmu4zr2IF5NfHlP4Y+9uCfnQpbQTZtw5uqi
   xQNKaJjrZcx0l9ewkTXhIu7wvj+lnKTS9cRgcQNRbkwW5pi8hAzx8GAk8
   uZl9EWUuuumzNkCtYphphHY1xfGqo5zNXCo/tSgnn4TuVdVxXpJAuQUJ1
   ylfRzAUlfe+ay5avc6Pm9pBpOzAb92maYkdXErkmvPZBiHrZvtQkw+7M3
   YVWYuQRWHfRVWfFv64hCeDvxTJvzyc917XmuBS+PGMYocFJNBAHBO4PHn
   Q==;
X-CSE-ConnectionGUID: oe1ND629QVCMLYsgcgIU8Q==
X-CSE-MsgGUID: 5qNzGHghRLONFiKMZbe7Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96919118"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="96919118"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 21:16:44 -0700
X-CSE-ConnectionGUID: 9zaEhj68QtexkoXWTUyrmg==
X-CSE-MsgGUID: xou8x+wQR+m000vgKiO2Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="284487627"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Aug 2026 21:16:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqk6S-0000000062L-2p4j;
	Mon, 03 Aug 2026 04:16:40 +0000
Date: Mon, 03 Aug 2026 12:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 4f25071afe9218aaae1c63fbf75e229aa6405319
Message-ID: <202608031254.Ay5X6yIq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_211645_274755_A5143D7B 
X-CRM114-Status: UNSURE (   4.09  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 4f25071afe9218aaae1c63fbf75e229aa6405319  wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump

elapsed time: 746m

configs tested: 131
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260803    gcc-8.5.0
arc                  randconfig-002-20260803    gcc-8.5.0
arm                           mps2_defconfig    clang-24
arm                  randconfig-001-20260803    gcc-8.5.0
arm                  randconfig-002-20260803    gcc-8.5.0
arm                  randconfig-003-20260803    gcc-8.5.0
arm                  randconfig-004-20260803    gcc-8.5.0
arm64                randconfig-001-20260803    gcc-12.5.0
arm64                randconfig-002-20260803    gcc-12.5.0
arm64                randconfig-003-20260803    gcc-12.5.0
arm64                randconfig-004-20260803    gcc-12.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260803    gcc-10.5.0
csky                 randconfig-001-20260803    gcc-12.5.0
csky                 randconfig-002-20260803    gcc-12.5.0
hexagon              randconfig-001-20260803    clang-18
hexagon              randconfig-002-20260803    clang-18
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260802    gcc-14
i386       buildonly-randconfig-001-20260803    clang-22
i386       buildonly-randconfig-002-20260802    clang-22
i386       buildonly-randconfig-002-20260803    clang-22
i386       buildonly-randconfig-003-20260802    clang-22
i386       buildonly-randconfig-003-20260803    clang-22
i386       buildonly-randconfig-004-20260802    gcc-14
i386       buildonly-randconfig-004-20260803    clang-22
i386       buildonly-randconfig-005-20260802    gcc-14
i386       buildonly-randconfig-005-20260803    clang-22
i386       buildonly-randconfig-006-20260802    gcc-14
i386       buildonly-randconfig-006-20260803    clang-22
i386                 randconfig-001-20260803    gcc-13
i386                 randconfig-002-20260803    gcc-13
i386                 randconfig-003-20260803    gcc-13
i386                 randconfig-004-20260803    gcc-13
i386                 randconfig-005-20260803    gcc-13
i386                 randconfig-006-20260803    gcc-13
i386                 randconfig-007-20260803    gcc-13
i386                 randconfig-011-20260803    clang-22
i386                 randconfig-012-20260803    clang-22
i386                 randconfig-013-20260803    clang-22
i386                 randconfig-014-20260803    clang-22
i386                 randconfig-015-20260803    clang-22
i386                 randconfig-016-20260803    clang-22
i386                 randconfig-017-20260803    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260803    clang-18
loongarch            randconfig-002-20260803    clang-18
mips                          ci20_defconfig    clang-24
nios2                           alldefconfig    gcc-11.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260803    clang-18
nios2                randconfig-002-20260803    clang-18
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260802    gcc-8.5.0
parisc               randconfig-001-20260803    gcc-15.2.0
parisc               randconfig-002-20260802    gcc-14.3.0
parisc               randconfig-002-20260803    gcc-15.2.0
powerpc                     mgcoge_defconfig    clang-24
powerpc              randconfig-001-20260802    gcc-8.5.0
powerpc              randconfig-001-20260803    gcc-15.2.0
powerpc              randconfig-002-20260802    clang-24
powerpc              randconfig-002-20260803    gcc-15.2.0
powerpc64            randconfig-001-20260802    gcc-10.5.0
powerpc64            randconfig-001-20260803    gcc-15.2.0
powerpc64            randconfig-002-20260802    clang-24
powerpc64            randconfig-002-20260803    gcc-15.2.0
riscv                randconfig-001-20260802    gcc-13.4.0
riscv                randconfig-001-20260803    gcc-8.5.0
riscv                randconfig-002-20260802    clang-24
riscv                randconfig-002-20260803    gcc-8.5.0
s390                 randconfig-001-20260802    clang-24
s390                 randconfig-001-20260803    gcc-8.5.0
s390                 randconfig-002-20260802    gcc-8.5.0
s390                 randconfig-002-20260803    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260802    gcc-11.5.0
sh                   randconfig-001-20260803    gcc-8.5.0
sh                   randconfig-002-20260802    gcc-13.4.0
sh                   randconfig-002-20260803    gcc-8.5.0
sparc                randconfig-001-20260803    gcc-16.1.0
sparc                randconfig-002-20260803    gcc-16.1.0
sparc64              randconfig-001-20260803    gcc-16.1.0
sparc64              randconfig-002-20260803    gcc-16.1.0
um                   randconfig-001-20260803    gcc-16.1.0
um                   randconfig-002-20260803    gcc-16.1.0
x86_64     buildonly-randconfig-001-20260803    clang-22
x86_64     buildonly-randconfig-002-20260803    clang-22
x86_64     buildonly-randconfig-003-20260803    clang-22
x86_64     buildonly-randconfig-003-20260803    gcc-13
x86_64     buildonly-randconfig-004-20260803    clang-22
x86_64     buildonly-randconfig-004-20260803    gcc-14
x86_64     buildonly-randconfig-005-20260803    clang-22
x86_64     buildonly-randconfig-005-20260803    gcc-14
x86_64     buildonly-randconfig-006-20260803    clang-22
x86_64     buildonly-randconfig-006-20260803    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260803    gcc-14
x86_64               randconfig-002-20260803    gcc-14
x86_64               randconfig-003-20260803    gcc-14
x86_64               randconfig-004-20260803    gcc-14
x86_64               randconfig-005-20260803    gcc-14
x86_64               randconfig-006-20260803    gcc-14
x86_64               randconfig-011-20260803    gcc-14
x86_64               randconfig-012-20260803    gcc-14
x86_64               randconfig-013-20260803    gcc-14
x86_64               randconfig-014-20260803    gcc-14
x86_64               randconfig-015-20260803    gcc-14
x86_64               randconfig-016-20260803    gcc-14
x86_64               randconfig-071-20260802    gcc-14
x86_64               randconfig-071-20260803    clang-22
x86_64               randconfig-072-20260802    clang-22
x86_64               randconfig-072-20260803    clang-22
x86_64               randconfig-073-20260802    gcc-14
x86_64               randconfig-073-20260803    clang-22
x86_64               randconfig-074-20260802    gcc-14
x86_64               randconfig-074-20260803    clang-22
x86_64               randconfig-075-20260802    clang-22
x86_64               randconfig-075-20260803    clang-22
x86_64               randconfig-076-20260802    gcc-12
x86_64               randconfig-076-20260803    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260803    gcc-16.1.0
xtensa               randconfig-002-20260803    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

