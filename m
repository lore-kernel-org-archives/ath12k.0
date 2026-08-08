Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B86BC5AD2C
	for <ath12k@archiver.kernel.org>; Sat,  8 Aug 2026 09:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oSZTzWUyVlTqESrZ5e5tCKC7oF8C/vpHnR20V8X6lNA=; b=uViriBuIc1mS/qwUXWQ5hNDwYJ
	RzouCszqP3Ra+IfQIJIc7q+RW3xwalide0it/H/aVBDGBfGhbr9TS98bsvukReRSaAdW9nBmxOyqc
	12dN+Iv/JDt655Tv3oc85G2gVYqsUI4tiGCEoiCSrGX/E5WhEG8A19mCEfjwUts4JmeNmWiRoy0IA
	IeNFYj8o3yWj5U3vA5Co2w4osLQS1yCVWTsq7DJ3tC1Mo7HxI0euRjSdJKbga5XnZAoDEKbkVFqPz
	+5D1AHeyJfzsZmEKslHVF8ApU/0Y++suxzvQI/CQQsRYc4mDxpdYZACkeF5NRJpTcbB2pCkpxFjhb
	7MGkTjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsd7B-00000009CpC-2xji;
	Sat, 08 Aug 2026 09:13:13 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsd78-00000009CoS-3tgZ
	for ath12k@lists.infradead.org;
	Sat, 08 Aug 2026 09:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786180391; x=1817716391;
  h=date:from:to:cc:subject:message-id;
  bh=UTgCJbCOWu2yXyrFgGE7VlsJh4hXrgJIReOdhcN+Qw4=;
  b=D40fAkWxn39Yn4Nq8e06zoteVrCI9Y2JaaxlHuUFoQt+e0Y8cI8XOT81
   2OOjH66EtjnvxK51HdQ9MhphAEKsJM+ErRkS5GZYkDM6PoD2rrjwhpmaG
   F3kaewhuFVNBS+L868JNM5sbpHR2GZO977VYeiPecCTsOMfltu6mOpbAs
   e/fIJHZRjvzfDwsyTkgfGAGO0HheH9t+1ZhcmoGPWSSexvfX6NEkbDOk2
   sUsgGRz6aVU9B99uuS3GU2/KfP4oU8+PfiuDjae5CV8K4uKIBLFl1IZ54
   a4clPUiwjHHIEUzY5E1mznD5kOIAO4nFdXh6tQE5TnzNIoz3m746T5IBr
   A==;
X-CSE-ConnectionGUID: luaBTn//ToyzYAMS+ZI5/A==
X-CSE-MsgGUID: wjUimGGDSNa8wfJg3fWsYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="74312575"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="74312575"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 02:13:10 -0700
X-CSE-ConnectionGUID: 4gwFTHI4QOmvxetjjiJaoA==
X-CSE-MsgGUID: MSL2j7I6Sz+4Pzqvd2NI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="287286889"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Aug 2026 02:13:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsd74-00000000K2L-2Kvr;
	Sat, 08 Aug 2026 09:13:06 +0000
Date: Sat, 08 Aug 2026 17:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 e07447e654476262558bee570f4cf456e2b32565
Message-ID: <202608081731.qXvC7j2f-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_021310_979229_19286EEB 
X-CRM114-Status: UNSURE (   3.25  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: e07447e654476262558bee570f4cf456e2b32565  Add localversion-wireless-testing-ath

elapsed time: 2502m

configs tested: 169
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             alldefconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260807    gcc-14.3.0
arc                  randconfig-001-20260808    gcc-9.5.0
arc                  randconfig-002-20260807    gcc-14.3.0
arc                  randconfig-002-20260808    gcc-9.5.0
arm                      aspeed_g5_defconfig    gcc-16.1.0
arm                  randconfig-001-20260807    gcc-14.3.0
arm                  randconfig-001-20260808    gcc-9.5.0
arm                  randconfig-002-20260807    gcc-14.3.0
arm                  randconfig-002-20260808    gcc-9.5.0
arm                  randconfig-003-20260807    gcc-14.3.0
arm                  randconfig-003-20260808    gcc-9.5.0
arm                  randconfig-004-20260807    gcc-14.3.0
arm                  randconfig-004-20260808    gcc-9.5.0
arm64                randconfig-001-20260807    gcc-16.1.0
arm64                randconfig-001-20260808    gcc-11.5.0
arm64                randconfig-002-20260807    gcc-16.1.0
arm64                randconfig-002-20260808    gcc-11.5.0
arm64                randconfig-003-20260807    gcc-16.1.0
arm64                randconfig-003-20260808    gcc-11.5.0
arm64                randconfig-004-20260807    gcc-16.1.0
arm64                randconfig-004-20260808    gcc-11.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260807    gcc-16.1.0
csky                 randconfig-001-20260808    gcc-11.5.0
csky                 randconfig-002-20260807    gcc-16.1.0
csky                 randconfig-002-20260808    gcc-11.5.0
hexagon              randconfig-001-20260807    clang-18
hexagon              randconfig-001-20260808    gcc-16.1.0
hexagon              randconfig-002-20260807    clang-18
hexagon              randconfig-002-20260808    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260807    gcc-13
i386       buildonly-randconfig-001-20260808    clang-22
i386       buildonly-randconfig-002-20260807    gcc-13
i386       buildonly-randconfig-002-20260808    clang-22
i386       buildonly-randconfig-003-20260807    gcc-13
i386       buildonly-randconfig-003-20260808    clang-22
i386       buildonly-randconfig-004-20260807    gcc-13
i386       buildonly-randconfig-004-20260808    clang-22
i386       buildonly-randconfig-005-20260807    gcc-13
i386       buildonly-randconfig-005-20260808    clang-22
i386       buildonly-randconfig-006-20260807    gcc-13
i386       buildonly-randconfig-006-20260808    clang-22
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260807    gcc-14
i386                 randconfig-001-20260808    clang-22
i386                 randconfig-002-20260807    gcc-14
i386                 randconfig-002-20260808    clang-22
i386                 randconfig-003-20260807    gcc-14
i386                 randconfig-003-20260808    clang-22
i386                 randconfig-004-20260807    gcc-14
i386                 randconfig-004-20260808    clang-22
i386                 randconfig-005-20260807    gcc-14
i386                 randconfig-005-20260808    clang-22
i386                 randconfig-006-20260807    gcc-14
i386                 randconfig-006-20260808    clang-22
i386                 randconfig-007-20260807    gcc-14
i386                 randconfig-007-20260808    clang-22
i386                 randconfig-011-20260807    clang-22
i386                 randconfig-012-20260807    clang-22
i386                 randconfig-013-20260807    clang-22
i386                 randconfig-014-20260807    clang-22
i386                 randconfig-015-20260807    clang-22
i386                 randconfig-016-20260807    clang-22
i386                 randconfig-017-20260807    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260807    clang-18
loongarch            randconfig-001-20260808    gcc-16.1.0
loongarch            randconfig-002-20260807    clang-18
loongarch            randconfig-002-20260808    gcc-16.1.0
m68k                      m5275evb_defconfig    gcc-16.1.0
mips                          ip32_defconfig    clang-17
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260807    clang-18
nios2                randconfig-001-20260808    gcc-16.1.0
nios2                randconfig-002-20260807    clang-18
nios2                randconfig-002-20260808    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260807    gcc-8.5.0
parisc               randconfig-001-20260808    gcc-8.5.0
parisc               randconfig-002-20260807    gcc-8.5.0
parisc               randconfig-002-20260808    gcc-8.5.0
powerpc              randconfig-001-20260807    gcc-8.5.0
powerpc              randconfig-001-20260808    gcc-8.5.0
powerpc              randconfig-002-20260807    gcc-8.5.0
powerpc              randconfig-002-20260808    gcc-8.5.0
powerpc64                       alldefconfig    clang-17
powerpc64            randconfig-001-20260807    gcc-8.5.0
powerpc64            randconfig-001-20260808    gcc-8.5.0
powerpc64            randconfig-002-20260807    gcc-8.5.0
powerpc64            randconfig-002-20260808    gcc-8.5.0
riscv                         randconfig-001    clang-24
riscv                         randconfig-001    gcc-12.5.0
riscv                randconfig-001-20260807    gcc-12.5.0
riscv                randconfig-001-20260808    clang-24
riscv                randconfig-002-20260807    gcc-12.5.0
riscv                randconfig-002-20260808    clang-24
s390                 randconfig-001-20260807    gcc-12.5.0
s390                 randconfig-001-20260808    clang-24
s390                 randconfig-002-20260807    gcc-12.5.0
s390                 randconfig-002-20260808    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260807    gcc-12.5.0
sh                   randconfig-001-20260808    clang-24
sh                   randconfig-002-20260807    gcc-12.5.0
sh                   randconfig-002-20260808    clang-24
sparc                         randconfig-001    gcc-16.1.0
sparc                randconfig-001-20260807    gcc-16.1.0
sparc                randconfig-002-20260807    gcc-16.1.0
sparc64              randconfig-001-20260807    gcc-16.1.0
sparc64              randconfig-002-20260807    gcc-16.1.0
um                   randconfig-001-20260807    gcc-16.1.0
um                   randconfig-002-20260807    gcc-16.1.0
x86_64     buildonly-randconfig-001-20260807    clang-22
x86_64     buildonly-randconfig-001-20260808    gcc-14
x86_64     buildonly-randconfig-002-20260807    clang-22
x86_64     buildonly-randconfig-002-20260808    gcc-14
x86_64     buildonly-randconfig-003-20260807    clang-22
x86_64     buildonly-randconfig-003-20260808    gcc-14
x86_64     buildonly-randconfig-004-20260807    clang-22
x86_64     buildonly-randconfig-004-20260808    gcc-14
x86_64     buildonly-randconfig-005-20260807    clang-22
x86_64     buildonly-randconfig-005-20260808    gcc-14
x86_64     buildonly-randconfig-006-20260807    clang-22
x86_64     buildonly-randconfig-006-20260808    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260807    clang-22
x86_64               randconfig-002-20260807    clang-22
x86_64               randconfig-003-20260807    clang-22
x86_64               randconfig-004-20260807    clang-22
x86_64               randconfig-005-20260807    clang-22
x86_64               randconfig-006-20260807    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260807    clang-22
x86_64               randconfig-011-20260808    clang-22
x86_64               randconfig-012-20260807    clang-22
x86_64               randconfig-012-20260808    clang-22
x86_64               randconfig-013-20260807    clang-22
x86_64               randconfig-013-20260808    clang-22
x86_64               randconfig-014-20260807    clang-22
x86_64               randconfig-014-20260808    clang-22
x86_64               randconfig-015-20260807    clang-22
x86_64               randconfig-015-20260808    clang-22
x86_64               randconfig-016-20260807    clang-22
x86_64               randconfig-016-20260808    clang-22
x86_64               randconfig-071-20260807    clang-22
x86_64               randconfig-071-20260808    gcc-14
x86_64               randconfig-072-20260807    clang-22
x86_64               randconfig-072-20260808    gcc-14
x86_64               randconfig-073-20260807    clang-22
x86_64               randconfig-073-20260808    gcc-14
x86_64               randconfig-074-20260807    clang-22
x86_64               randconfig-074-20260808    gcc-14
x86_64               randconfig-075-20260807    clang-22
x86_64               randconfig-075-20260808    gcc-14
x86_64               randconfig-076-20260807    clang-22
x86_64               randconfig-076-20260808    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260807    gcc-16.1.0
xtensa               randconfig-002-20260807    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

