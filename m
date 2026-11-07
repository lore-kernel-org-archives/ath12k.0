Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3D606A330
	for <ath12k@archiver.kernel.org>; Sat,  7 Nov 2026 21:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eqLSGT3v;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QaMHiBC3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pTmxijr4UrwBsfiCNNFHTejaq7Lh2ROOfDAYOFIXF1M=; b=eqLSGT3v8+RMSlHycaSbfb8ue+
	WJ3kYMpcVdI4D3EFJPGkl+ZzD9DPP/avmBrRMuAi0xdSiy1J2k77yEWdr91Ow2e36z8IaKVs/8Nxn
	GyMGa0SImkjSUcLa6smxx35URDiG+ndAJD5gd/3u7viFR5cf49ag+5SwZcfUP65Hb56BBVM2ItQBe
	ueWaqZavBIGiy5VtyLNMtzQ+MD5tjPCLZH6dLth5OfSg8lrVlRbYnOEMOteg1QxTQYZbW34YC5Jj1
	unka4POMHHVf3oPLLnI1fEy3SInE9wz2qWvIFR6n/j0FZZEut1j8Cnlho1m+Ya9dN9XovY2+4UpaV
	yeahNY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPoNc-0000000FRfd-1gOr;
	Sat, 07 Nov 2026 21:55:20 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPoNZ-0000000FRfH-3XNQ
	for ath12k@lists.infradead.org;
	Sat, 07 Nov 2026 21:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794088518; x=1825624518;
  h=date:from:to:cc:subject:message-id;
  bh=IDaqoHejV5E9coKnTQsFupiM02NFQBsw4iOjkOWPPlU=;
  b=QaMHiBC3487eqLnpWLnNWZZ+kcjsyc8K3hoxOKK79m3xEVOMyP3sLEe1
   TL4DNeUz7JLFw9XkKFsgdKhnGfoVxdmpDdKSZnZQBHqAatQatm+9IdQtU
   Tyu9vQVR93MoQZboq1IkYUMk2z9diG3tGhD35J0BiYkxXZylwI1+sJ4qk
   1BdZngf3NIgdPl62AEv7WRD+MrRCYFusRtTZpNcEiMPBBRfE5ps2Pt3PZ
   Em6RoIkyA+S1G/9BTmnRRYofY41vsdnsI8B8W7bZM8g0erCCuzfABSVCw
   rsLkn3qtbw9xt5CUv0Qantj+3cIP8FckcVR/NeFlglsrofOnoxR8Yaj7o
   Q==;
X-CSE-ConnectionGUID: YHY3Y2IaSs6daz9bo71HYg==
X-CSE-MsgGUID: UH0qgnsbRkWQJcjNAPQY+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2893495"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2893495"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 13:55:18 -0800
X-CSE-ConnectionGUID: ytGdNMsGSm2S+MPZs3ZG5A==
X-CSE-MsgGUID: /LHf1MRaRmGN8yZmOGVVEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="8127643"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Nov 2026 13:55:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPoNV-00000000rd5-0m1p;
	Sat, 07 Nov 2026 21:55:13 +0000
Date: Sun, 08 Nov 2026 05:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main-pending] BUILD SUCCESS
 d7eae6d6be54d546e177bc37e09847bbd8e35d00
Message-ID: <20261108055454.iFNvAqu3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_135517_958071_D1866BBB 
X-CRM114-Status: UNSURE (   3.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-pending
branch HEAD: d7eae6d6be54d546e177bc37e09847bbd8e35d00  Merge branch 'pending' into main-pending

elapsed time: 1269m

configs tested: 389
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261107    gcc-9.5.0
alpha                 randconfig-2001-20261107    gcc-9.5.0
alpha                 randconfig-2200-20261107    gcc-8.5.0  smatch
alpha                randconfig-r2106-20261107    gcc-10.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    clang-17
arc                   randconfig-1000-20261107    gcc-12.5.0
arc                   randconfig-1001-20261107    gcc-12.5.0
arc                   randconfig-2000-20261107    gcc-9.5.0
arc                   randconfig-2001-20261107    gcc-9.5.0
arc                   randconfig-2002-20261107    gcc-9.5.0
arc                   randconfig-2003-20261107    gcc-9.5.0
arc                   randconfig-2004-20261107    gcc-9.5.0
arc                   randconfig-2005-20261107    gcc-9.5.0
arc                   randconfig-2200-20261107    gcc-8.5.0  smatch
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                            omap1_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261107    gcc-12.5.0
arm                   randconfig-1001-20261107    gcc-12.5.0
arm                   randconfig-1002-20261107    gcc-12.5.0
arm                   randconfig-1003-20261107    gcc-12.5.0
arm                   randconfig-2000-20261107    gcc-16.2.0
arm                   randconfig-2001-20261107    gcc-16.2.0
arm                   randconfig-2002-20261107    gcc-16.2.0
arm                   randconfig-2200-20261107    clang-24   smatch
arm                           sp7021_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261107    gcc-11.5.0
arm64                 randconfig-1000-20261108    clang-24
arm64                 randconfig-1001-20261107    gcc-11.5.0
arm64                 randconfig-1001-20261108    clang-24
arm64                 randconfig-1002-20261107    gcc-11.5.0
arm64                 randconfig-1002-20261108    clang-24
arm64                 randconfig-1003-20261107    gcc-11.5.0
arm64                 randconfig-1003-20261108    clang-24
arm64                 randconfig-2000-20261107    gcc-16.2.0
arm64                 randconfig-2001-20261107    gcc-16.2.0
arm64                 randconfig-2002-20261107    gcc-16.2.0
arm64                 randconfig-2200-20261107    gcc-12.5.0 smatch
arm64                        renesas_defconfig    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261107    gcc-11.5.0
csky                  randconfig-1000-20261108    clang-24
csky                  randconfig-1001-20261107    gcc-11.5.0
csky                  randconfig-1001-20261108    clang-24
csky                  randconfig-2000-20261107    clang-24
csky                  randconfig-2001-20261107    clang-24
csky                  randconfig-2200-20261107    gcc-11.5.0 smatch
csky                 randconfig-r2104-20261107    gcc-12.5.0 cocci
csky                 randconfig-r2105-20261107    clang-24   cocci
csky                 randconfig-r2107-20261107    clang-24   cocci
csky                 randconfig-r2109-20261107    gcc-10.5.0 cocci
csky                 randconfig-r2300-20261107    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1000-20261108    gcc-16.2.0
hexagon               randconfig-1001-20261107    clang-18
hexagon               randconfig-1001-20261108    gcc-16.2.0
hexagon               randconfig-2000-20261107    clang-24
hexagon               randconfig-2001-20261107    clang-24
hexagon               randconfig-2200-20261107    clang-19   smatch
hexagon              randconfig-r2102-20261107    clang-24   cocci
hexagon              randconfig-r2103-20261107    clang-24   cocci
hexagon              randconfig-r2111-20261107    gcc-10.5.0 cocci
hexagon              randconfig-r2301-20261107    gcc-8.5.0  sparse
hexagon              randconfig-r2305-20261107    gcc-8.5.0  sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261107    gcc-14
i386        buildonly-randconfig-1001-20261107    gcc-14
i386        buildonly-randconfig-1002-20261107    gcc-14
i386        buildonly-randconfig-1003-20261107    gcc-14
i386        buildonly-randconfig-1004-20261107    gcc-14
i386        buildonly-randconfig-1005-20261107    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261107    clang-22
i386                  randconfig-1000-20261108    gcc-14
i386                  randconfig-1001-20261107    clang-22
i386                  randconfig-1001-20261108    gcc-14
i386                  randconfig-1002-20261107    clang-22
i386                  randconfig-1002-20261108    gcc-14
i386                  randconfig-1003-20261107    clang-22
i386                  randconfig-1003-20261108    gcc-14
i386                  randconfig-1004-20261107    clang-22
i386                  randconfig-1004-20261108    gcc-14
i386                  randconfig-1005-20261107    clang-22
i386                  randconfig-1005-20261108    gcc-14
i386                  randconfig-1006-20261107    clang-22
i386                  randconfig-1006-20261108    gcc-14
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1013-20261107    clang-22
i386                  randconfig-2000-20261107    clang-22
i386                  randconfig-2001-20261107    clang-22
i386                  randconfig-2002-20261107    clang-22
i386                  randconfig-2003-20261107    clang-22
i386                  randconfig-2004-20261107    clang-22
i386                  randconfig-2005-20261107    clang-22
i386                  randconfig-2100-20261107    gcc-14     cocci
i386                  randconfig-2101-20261107    gcc-14     cocci
i386                  randconfig-2102-20261107    gcc-14     cocci
i386                  randconfig-2103-20261107    gcc-14     cocci
i386                  randconfig-2104-20261107    gcc-14     cocci
i386                  randconfig-2105-20261107    gcc-14     cocci
i386                  randconfig-2200-20261107    clang-22   smatch
i386                  randconfig-2300-20261107    gcc-14     sparse
i386                  randconfig-2301-20261107    gcc-14     sparse
i386                  randconfig-2302-20261107    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1000-20261108    gcc-16.2.0
loongarch             randconfig-1001-20261107    clang-18
loongarch             randconfig-1001-20261108    gcc-16.2.0
loongarch             randconfig-2000-20261107    gcc-16.2.0
loongarch             randconfig-2001-20261107    gcc-16.2.0
loongarch             randconfig-2200-20261107    gcc-16.2.0 smatch
loongarch            randconfig-r2105-20261107    gcc-12.5.0 cocci
loongarch            randconfig-r2301-20261107    gcc-15.3.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261107    gcc-9.5.0
m68k                  randconfig-2001-20261107    gcc-9.5.0
m68k                  randconfig-2200-20261107    gcc-8.5.0  smatch
m68k                 randconfig-r2107-20261107    gcc-10.5.0 cocci
m68k                 randconfig-r2304-20261107    gcc-15.3.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261107    gcc-9.5.0
microblaze            randconfig-2001-20261107    gcc-9.5.0
microblaze            randconfig-2200-20261107    gcc-15.3.0 smatch
microblaze           randconfig-r2102-20261107    gcc-12.5.0 cocci
microblaze           randconfig-r2303-20261107    gcc-15.3.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-16.2.0
mips                           malta_defconfig    clang-17
mips                       malta_kvm_defconfig    clang-17
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261107    gcc-8.5.0
mips                  randconfig-2001-20261107    gcc-8.5.0
mips                  randconfig-2002-20261107    gcc-8.5.0
mips                  randconfig-2200-20261107    gcc-13.5.0 smatch
mips                 randconfig-r2303-20261107    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1000-20261108    gcc-16.2.0
nios2                 randconfig-1001-20261107    clang-18
nios2                 randconfig-1001-20261108    gcc-16.2.0
nios2                 randconfig-2000-20261107    gcc-16.2.0
nios2                 randconfig-2001-20261107    gcc-16.2.0
nios2                 randconfig-2200-20261107    gcc-11.5.0 smatch
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261107    gcc-8.5.0
openrisc              randconfig-2001-20261107    gcc-8.5.0
openrisc              randconfig-2002-20261107    gcc-8.5.0
openrisc              randconfig-2200-20261107    gcc-11.5.0 smatch
openrisc             randconfig-r2100-20261107    clang-24   cocci
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261107    clang-24
parisc                randconfig-1000-20261108    clang-24
parisc                randconfig-1001-20261107    clang-24
parisc                randconfig-1001-20261108    clang-24
parisc                randconfig-2000-20261107    gcc-16.2.0
parisc                randconfig-2001-20261107    gcc-16.2.0
parisc                randconfig-2200-20261107    gcc-9.5.0  smatch
parisc               randconfig-r2100-20261107    gcc-12.5.0 cocci
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.2.0
powerpc                      ep8248e_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261107    clang-24
powerpc               randconfig-1000-20261108    clang-24
powerpc               randconfig-1001-20261107    clang-24
powerpc               randconfig-1001-20261108    clang-24
powerpc               randconfig-2000-20261107    clang-24
powerpc               randconfig-2001-20261107    clang-24
powerpc               randconfig-2002-20261107    clang-24
powerpc               randconfig-2200-20261107    gcc-10.5.0 smatch
powerpc              randconfig-r2104-20261107    clang-24   cocci
powerpc              randconfig-r2108-20261107    clang-24   cocci
powerpc                      sequoia_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261107    clang-24
powerpc64             randconfig-1000-20261108    clang-24
powerpc64             randconfig-1001-20261107    clang-24
powerpc64             randconfig-1001-20261108    clang-24
powerpc64             randconfig-2000-20261107    clang-24
powerpc64             randconfig-2001-20261107    clang-24
powerpc64             randconfig-2002-20261107    clang-24
powerpc64             randconfig-2200-20261107    clang-24   smatch
powerpc64            randconfig-r2101-20261107    clang-24   cocci
powerpc64            randconfig-r2101-20261107    gcc-12.5.0 cocci
powerpc64            randconfig-r2109-20261107    clang-24   cocci
powerpc64            randconfig-r2110-20261107    clang-24   cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-17
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1000-20261108    gcc-12.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261108    gcc-12.5.0
riscv                 randconfig-2000-20261107    clang-24
riscv                 randconfig-2001-20261107    clang-24
riscv                 randconfig-2002-20261107    clang-24
riscv                 randconfig-2003-20261107    clang-24
riscv                 randconfig-2004-20261107    clang-24
riscv                 randconfig-2005-20261107    clang-24
riscv                 randconfig-2200-20261107    gcc-10.5.0 smatch
riscv                randconfig-r2108-20261107    gcc-10.5.0 cocci
s390                              alldefconfig    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1000-20261108    gcc-12.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
s390                  randconfig-1001-20261108    gcc-12.5.0
s390                  randconfig-2000-20261107    gcc-14.4.0
s390                  randconfig-2001-20261107    gcc-14.4.0
s390                  randconfig-2002-20261107    gcc-14.4.0
s390                  randconfig-2003-20261107    gcc-14.4.0
s390                  randconfig-2004-20261107    gcc-14.4.0
s390                  randconfig-2005-20261107    gcc-14.4.0
s390                  randconfig-2200-20261107    gcc-10.5.0 smatch
s390                 randconfig-r2106-20261107    clang-24   cocci
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1000-20261108    gcc-12.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                    randconfig-1001-20261108    gcc-12.5.0
sh                    randconfig-2000-20261107    gcc-13.5.0
sh                    randconfig-2001-20261107    gcc-13.5.0
sh                    randconfig-2002-20261107    gcc-13.5.0
sh                    randconfig-2003-20261107    gcc-13.5.0
sh                    randconfig-2004-20261107    gcc-13.5.0
sh                    randconfig-2005-20261107    gcc-13.5.0
sh                    randconfig-2200-20261107    gcc-11.5.0 smatch
sh                   randconfig-r2110-20261107    gcc-10.5.0 cocci
sh                           rsk7269_defconfig    clang-17
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7619_defconfig    gcc-16.2.0
sh                              sh03_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261107    gcc-10.5.0
sparc                 randconfig-1001-20261107    gcc-10.5.0
sparc                 randconfig-2000-20261107    clang-24
sparc                 randconfig-2001-20261107    clang-24
sparc                 randconfig-2200-20261107    gcc-11.5.0 smatch
sparc                randconfig-r2300-20261107    gcc-15.3.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261107    gcc-10.5.0
sparc64               randconfig-1001-20261107    gcc-10.5.0
sparc64               randconfig-2000-20261107    clang-24
sparc64               randconfig-2001-20261107    clang-24
sparc64               randconfig-2200-20261107    clang-20   smatch
sparc64              randconfig-r2302-20261107    gcc-8.5.0  sparse
sparc64              randconfig-r2304-20261107    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261107    gcc-10.5.0
um                    randconfig-1001-20261107    gcc-10.5.0
um                    randconfig-2000-20261107    clang-24
um                    randconfig-2001-20261107    clang-24
um                    randconfig-2200-20261107    gcc-14     smatch
um                   randconfig-r2103-20261107    gcc-12.5.0 cocci
um                   randconfig-r2111-20261107    clang-24   cocci
um                            x86_64_defconfig    gcc-14
um                            x86_64_defconfig    gcc-16.2.0
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261107    gcc-14
x86_64                randconfig-1001-20261107    gcc-14
x86_64                randconfig-1002-20261107    gcc-14
x86_64                randconfig-1003-20261107    gcc-14
x86_64                randconfig-1004-20261107    gcc-14
x86_64                randconfig-1005-20261107    gcc-14
x86_64                randconfig-1006-20261107    gcc-13
x86_64                randconfig-1007-20261107    gcc-13
x86_64                randconfig-1008-20261107    gcc-13
x86_64                randconfig-1009-20261107    gcc-13
x86_64                randconfig-1010-20261107    gcc-13
x86_64                randconfig-1011-20261107    gcc-13
x86_64                randconfig-1012-20261107    clang-22
x86_64                randconfig-1012-20261108    clang-22
x86_64                randconfig-1013-20261107    clang-22
x86_64                randconfig-1013-20261108    clang-22
x86_64                randconfig-1014-20261107    clang-22
x86_64                randconfig-1014-20261108    clang-22
x86_64                randconfig-1015-20261107    clang-22
x86_64                randconfig-1015-20261108    clang-22
x86_64                randconfig-1016-20261107    clang-22
x86_64                randconfig-1016-20261108    clang-22
x86_64                randconfig-1017-20261107    clang-22
x86_64                randconfig-1017-20261108    clang-22
x86_64                randconfig-2000-20261107    clang-22
x86_64                randconfig-2001-20261107    clang-22
x86_64                randconfig-2002-20261107    clang-22
x86_64                randconfig-2003-20261107    clang-22
x86_64                randconfig-2004-20261107    clang-22
x86_64                randconfig-2005-20261107    clang-22
x86_64                randconfig-2200-20261107    clang-22   smatch
x86_64                randconfig-2300-20261107    gcc-14     sparse
x86_64                randconfig-2301-20261107    gcc-14     sparse
x86_64                randconfig-2302-20261107    gcc-14     sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261107    gcc-10.5.0
xtensa                randconfig-1001-20261107    gcc-10.5.0
xtensa                randconfig-2000-20261107    clang-24
xtensa                randconfig-2001-20261107    clang-24
xtensa                randconfig-2200-20261107    gcc-13.5.0 smatch
xtensa               randconfig-r2302-20261107    gcc-15.3.0 sparse
xtensa               randconfig-r2305-20261107    gcc-15.3.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

