Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4DA606A31B
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 01:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3i5GZo6K;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OuIYtinA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OzK4OMTHJKjMqKfySUXsWFzkuAQO6TlwByEb9ecVSQw=; b=3i5GZo6K0u+7A0R5JumBdCMkS3
	OspcD78wcVvmuXQKOzkG0hLZqfLGzxLtpehJW0Ra1o+XaHK/IzMbX5taufYohMq9hleX6c2KjKlAB
	y9GJqrc+wMKUHhVDQedo7T3AD/AxFGZn6B0NXUrPul5M0QcqiF+ds2LrB6eHOwBhYCb2dX0i2+FVE
	m5xagxShEceyBC+b7DC1O2Z5neWta9eHm40xaudDAQGWx5X9AInYuy7G8U6fZ3n++fn1HqE3TFSCH
	v9FC1SjFoE2ZExdeuJVP9UpU4yMNyosJDKHdezEqWMqkowr5iGQLbH886wqCFB6VGUwvIIw4TJeo/
	AmmdF4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8NB-0000000AxH6-0bBd;
	Fri, 06 Nov 2026 01:04:05 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8N7-0000000AxGS-0EQq
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 01:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793927041; x=1825463041;
  h=date:from:to:cc:subject:message-id;
  bh=vbZyD2HuWXqJfz4gJmkUzqYL7EOKegUQLq23a40VJ7c=;
  b=OuIYtinAmVi+R1abymlU/xTj0omcQxnknYJrd2K06S8I7yIaMceUqsFH
   pZAh4UEsPSdJWB6XCDsttWSMPZIdJubcgxprrUoTi+PCnkWxPNWlzVUGl
   wwvY1XgJ1aGDk4Bkqft95LHDymoVedb6sF/CRTMXaGFn4CsPh634ggMhe
   S30uGRKPub1RJwIj3lJpJHViWWtCYoypIdh+9WXha9CDDnjvnZ51/6roc
   H2XpToLgU3mX+tM/53imyWNNq/Y0cAYOQg2zaRH7KXplaJRMVVRR2/klK
   qSGoADdzpAZSTsTim3L0StvLz7AghDqTeMf3icH2sR9Jd4Uytvp95JSZq
   Q==;
X-CSE-ConnectionGUID: VBqOIaG7RtWEz9iB5CviVw==
X-CSE-MsgGUID: 2Rv0xwm+SICE/jD3D1B/aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2743227"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2743227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:04:00 -0800
X-CSE-ConnectionGUID: caR0o13SQF+d20ApuA6ERg==
X-CSE-MsgGUID: he8JTto+QRCqtCJ38uuaDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7269748"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2026 17:03:59 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP8N1-00000000n7z-4AID;
	Fri, 06 Nov 2026 01:03:55 +0000
Date: Fri, 06 Nov 2026 09:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:for-current] BUILD SUCCESS
 83d689bbe8f90ce39961bcc3a64f2ca2ec184019
Message-ID: <20261106090349.mHoBwbOS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_170401_687089_3FFC1337 
X-CRM114-Status: UNSURE (   4.29  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
branch HEAD: 83d689bbe8f90ce39961bcc3a64f2ca2ec184019  wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support it

elapsed time: 1781m

configs tested: 364
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2200-20261104    gcc-16.2.0 smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                           axs103_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261105    gcc-14.4.0
arc                   randconfig-1000-20261106    gcc-8.5.0
arc                   randconfig-1001-20261105    gcc-14.4.0
arc                   randconfig-1001-20261106    gcc-8.5.0
arc                   randconfig-2000-20261104    gcc-10.5.0
arc                   randconfig-2001-20261104    gcc-10.5.0
arc                   randconfig-2002-20261104    gcc-10.5.0
arc                   randconfig-2003-20261104    gcc-10.5.0
arc                   randconfig-2004-20261104    gcc-10.5.0
arc                   randconfig-2005-20261104    gcc-10.5.0
arc                   randconfig-2200-20261104    gcc-8.5.0  smatch
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                            imxrt_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261105    gcc-14.4.0
arm                   randconfig-1000-20261106    gcc-8.5.0
arm                   randconfig-1001-20261105    gcc-14.4.0
arm                   randconfig-1001-20261106    gcc-8.5.0
arm                   randconfig-1002-20261105    gcc-14.4.0
arm                   randconfig-1002-20261106    gcc-8.5.0
arm                   randconfig-1003-20261105    gcc-14.4.0
arm                   randconfig-1003-20261106    gcc-8.5.0
arm                   randconfig-2200-20261105    gcc-15.3.0 smatch
arm                  randconfig-r2106-20261104    clang-24   cocci
arm                  randconfig-r2107-20261104    clang-24   cocci
arm                  randconfig-r2110-20261104    clang-24   cocci
arm                          s3c6400_defconfig    gcc-16.2.0
arm                            sama5_defconfig    gcc-16.2.0
arm                        spear13xx_defconfig    gcc-16.2.0
arm                            u8500_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261105    gcc-13.5.0
arm64                 randconfig-1000-20261106    clang-17
arm64                 randconfig-1001-20261105    gcc-13.5.0
arm64                 randconfig-1001-20261106    clang-17
arm64                 randconfig-1002-20261105    gcc-13.5.0
arm64                 randconfig-1002-20261106    clang-17
arm64                 randconfig-1003-20261105    gcc-13.5.0
arm64                 randconfig-1003-20261106    clang-17
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261105    gcc-13.5.0
csky                  randconfig-1000-20261106    clang-17
csky                  randconfig-1001-20261105    gcc-13.5.0
csky                  randconfig-1001-20261106    clang-17
csky                  randconfig-2000-20261104    clang-24
csky                  randconfig-2001-20261104    clang-24
csky                  randconfig-2200-20261104    gcc-16.2.0 smatch
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261105    clang-24
hexagon               randconfig-1001-20261105    clang-24
hexagon               randconfig-2000-20261104    clang-24
hexagon               randconfig-2001-20261104    clang-24
hexagon               randconfig-2200-20261104    clang-22   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261105    gcc-14
i386        buildonly-randconfig-1000-20261106    clang-22
i386        buildonly-randconfig-1001-20261105    gcc-14
i386        buildonly-randconfig-1001-20261106    clang-22
i386        buildonly-randconfig-1002-20261105    gcc-14
i386        buildonly-randconfig-1002-20261106    clang-22
i386        buildonly-randconfig-1003-20261105    gcc-14
i386        buildonly-randconfig-1003-20261106    clang-22
i386        buildonly-randconfig-1004-20261105    gcc-14
i386        buildonly-randconfig-1004-20261106    clang-22
i386        buildonly-randconfig-1005-20261105    gcc-14
i386        buildonly-randconfig-1005-20261106    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261105    clang-22
i386                  randconfig-1000-20261106    gcc-14
i386                  randconfig-1001-20261105    clang-22
i386                  randconfig-1001-20261106    gcc-14
i386                  randconfig-1002-20261105    clang-22
i386                  randconfig-1002-20261106    gcc-14
i386                  randconfig-1003-20261105    clang-22
i386                  randconfig-1003-20261106    gcc-14
i386                  randconfig-1004-20261105    clang-22
i386                  randconfig-1004-20261106    gcc-14
i386                  randconfig-1005-20261105    clang-22
i386                  randconfig-1005-20261106    gcc-14
i386                  randconfig-1006-20261105    clang-22
i386                  randconfig-1006-20261106    gcc-14
i386                  randconfig-1007-20261105    clang-22
i386                  randconfig-1007-20261106    gcc-14
i386                  randconfig-1008-20261105    clang-22
i386                  randconfig-1008-20261106    gcc-14
i386                  randconfig-1009-20261105    clang-22
i386                  randconfig-1009-20261106    gcc-14
i386                  randconfig-1010-20261105    clang-22
i386                  randconfig-1010-20261106    gcc-14
i386                  randconfig-1011-20261105    clang-22
i386                  randconfig-1011-20261106    gcc-14
i386                  randconfig-1012-20261105    clang-22
i386                  randconfig-1012-20261106    gcc-14
i386                  randconfig-1013-20261105    clang-22
i386                  randconfig-1013-20261106    gcc-14
i386                  randconfig-2200-20261104    gcc-12     smatch
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261105    clang-24
loongarch             randconfig-1001-20261105    clang-24
loongarch             randconfig-2000-20261104    gcc-15.3.0
loongarch             randconfig-2000-20261104    gcc-15.3.0
loongarch             randconfig-2001-20261104    gcc-15.3.0
loongarch             randconfig-2001-20261104    gcc-15.3.0
loongarch             randconfig-2200-20261104    clang-24   smatch
loongarch             randconfig-2200-20261105    gcc-16.2.0 smatch
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-16.2.0
m68k                         m5307c3_defconfig    gcc-16.2.0
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                       m54418evb_defconfig    clang-24
m68k                         mvme147_defconfig    clang-24
m68k                  randconfig-2200-20261104    gcc-13.5.0 smatch
m68k                  randconfig-2200-20261105    gcc-8.5.0  smatch
m68k                 randconfig-r2303-20261104    clang-24   sparse
m68k                           sun3x_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                     maltaup_xpa_defconfig    gcc-16.2.0
mips                            mtx1_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261104    clang-19
mips                  randconfig-2001-20261104    clang-19
mips                  randconfig-2002-20261104    clang-19
mips                  randconfig-2200-20261104    clang-24   smatch
mips                           rb532_defconfig    clang-24
mips                            xway_defconfig    gcc-16.2.0
nios2                          3c120_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261105    clang-24
nios2                 randconfig-1001-20261105    clang-24
nios2                 randconfig-2000-20261104    gcc-15.3.0
nios2                 randconfig-2000-20261104    gcc-15.3.0
nios2                 randconfig-2001-20261104    gcc-15.3.0
nios2                 randconfig-2001-20261104    gcc-15.3.0
nios2                 randconfig-2200-20261104    gcc-8.5.0  smatch
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261104    clang-19
openrisc              randconfig-2001-20261104    clang-19
openrisc              randconfig-2002-20261104    clang-19
openrisc              randconfig-2200-20261104    gcc-16.2.0 smatch
openrisc             randconfig-r2305-20261104    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-64bit_defconfig    clang-24
parisc                randconfig-1000-20261105    clang-21
parisc                randconfig-1000-20261106    clang-19
parisc                randconfig-1001-20261105    clang-21
parisc                randconfig-1001-20261106    clang-19
parisc                randconfig-2000-20261104    gcc-15.3.0
parisc                randconfig-2000-20261104    gcc-15.3.0
parisc                randconfig-2001-20261104    gcc-15.3.0
parisc                randconfig-2001-20261104    gcc-15.3.0
parisc               randconfig-r2200-20261104    gcc-10.5.0 smatch
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    clang-24
powerpc                    currituck_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261105    clang-21
powerpc               randconfig-1000-20261106    clang-19
powerpc               randconfig-1001-20261105    clang-21
powerpc               randconfig-1001-20261106    clang-19
powerpc               randconfig-2200-20261104    clang-20   smatch
powerpc64             randconfig-1000-20261105    clang-21
powerpc64             randconfig-1000-20261106    clang-19
powerpc64             randconfig-1001-20261105    clang-21
powerpc64             randconfig-1001-20261106    clang-19
powerpc64             randconfig-2200-20261104    gcc-15.3.0 smatch
powerpc64             randconfig-2200-20261105    clang-24   smatch
powerpc64            randconfig-r2108-20261104    clang-24   cocci
powerpc64            randconfig-r2302-20261104    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261105    clang-24
riscv                 randconfig-1000-20261106    gcc-14.4.0
riscv                 randconfig-1001-20261105    clang-24
riscv                 randconfig-1001-20261106    gcc-14.4.0
riscv                 randconfig-2000-20261104    gcc-12.5.0
riscv                 randconfig-2001-20261104    gcc-12.5.0
riscv                 randconfig-2200-20261104    gcc-13.5.0 smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261105    clang-24
s390                  randconfig-1000-20261106    gcc-14.4.0
s390                  randconfig-1001-20261105    clang-24
s390                  randconfig-1001-20261106    gcc-14.4.0
s390                  randconfig-2000-20261104    gcc-12.5.0
s390                  randconfig-2001-20261104    gcc-12.5.0
s390                  randconfig-2200-20261104    gcc-8.5.0  smatch
s390                 randconfig-r2109-20261104    clang-24   cocci
s390                 randconfig-r2300-20261104    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    gcc-16.2.0
sh                           r7780mp_defconfig    gcc-16.2.0
sh                           r7785rp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261105    clang-24
sh                    randconfig-1000-20261106    gcc-14.4.0
sh                    randconfig-1001-20261105    clang-24
sh                    randconfig-1001-20261106    gcc-14.4.0
sh                    randconfig-2000-20261104    gcc-12.5.0
sh                    randconfig-2000-20261104    gcc-16.2.0
sh                    randconfig-2001-20261104    gcc-12.5.0
sh                    randconfig-2001-20261104    gcc-16.2.0
sh                    randconfig-2002-20261104    gcc-16.2.0
sh                    randconfig-2003-20261104    gcc-16.2.0
sh                    randconfig-2004-20261104    gcc-16.2.0
sh                    randconfig-2005-20261104    gcc-16.2.0
sh                            se7724_defconfig    gcc-16.2.0
sh                   sh7785lcr_32bit_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261105    gcc-8.5.0
sparc                 randconfig-1000-20261106    gcc-15.3.0
sparc                 randconfig-1001-20261105    gcc-8.5.0
sparc                 randconfig-1001-20261106    gcc-15.3.0
sparc                 randconfig-2200-20261104    gcc-12.5.0 smatch
sparc                 randconfig-2200-20261105    gcc-16.2.0 smatch
sparc64                           alldefconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261105    gcc-8.5.0
sparc64               randconfig-1000-20261106    gcc-15.3.0
sparc64               randconfig-1001-20261105    gcc-8.5.0
sparc64               randconfig-1001-20261106    gcc-15.3.0
sparc64               randconfig-2200-20261105    gcc-8.5.0  smatch
sparc64              randconfig-r2301-20261104    clang-24   sparse
sparc64              randconfig-r2304-20261104    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261105    gcc-8.5.0
um                    randconfig-1000-20261106    gcc-15.3.0
um                    randconfig-1001-20261105    gcc-8.5.0
um                    randconfig-1001-20261106    gcc-15.3.0
um                    randconfig-2200-20261105    clang-19   smatch
um                   randconfig-r2111-20261104    clang-24   cocci
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261105    gcc-14
x86_64      buildonly-randconfig-1000-20261106    gcc-13
x86_64      buildonly-randconfig-1001-20261105    gcc-14
x86_64      buildonly-randconfig-1001-20261106    gcc-13
x86_64      buildonly-randconfig-1002-20261105    gcc-14
x86_64      buildonly-randconfig-1002-20261106    gcc-13
x86_64      buildonly-randconfig-1003-20261105    gcc-14
x86_64      buildonly-randconfig-1003-20261106    gcc-13
x86_64      buildonly-randconfig-1004-20261105    gcc-14
x86_64      buildonly-randconfig-1004-20261106    gcc-13
x86_64      buildonly-randconfig-1005-20261105    gcc-14
x86_64      buildonly-randconfig-1005-20261106    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261105    clang-22
x86_64                randconfig-1001-20261105    clang-22
x86_64                randconfig-1002-20261105    clang-22
x86_64                randconfig-1003-20261105    clang-22
x86_64                randconfig-1004-20261105    clang-22
x86_64                randconfig-1005-20261105    clang-22
x86_64                randconfig-1006-20261105    clang-22
x86_64                randconfig-1007-20261105    clang-22
x86_64                randconfig-1008-20261105    clang-22
x86_64                randconfig-1009-20261105    clang-22
x86_64                randconfig-1010-20261105    clang-22
x86_64                randconfig-1011-20261105    clang-22
x86_64                randconfig-1012-20261105    clang-22
x86_64                randconfig-1012-20261106    gcc-14
x86_64                randconfig-1013-20261105    clang-22
x86_64                randconfig-1013-20261106    gcc-14
x86_64                randconfig-1014-20261105    clang-22
x86_64                randconfig-1014-20261106    gcc-14
x86_64                randconfig-1015-20261105    clang-22
x86_64                randconfig-1015-20261106    gcc-14
x86_64                randconfig-1016-20261105    clang-22
x86_64                randconfig-1016-20261106    gcc-14
x86_64                randconfig-1017-20261105    clang-22
x86_64                randconfig-1017-20261106    gcc-14
x86_64                randconfig-2200-20261104    gcc-14     smatch
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
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                            allyesconfig    gcc-11.5.0
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                   nommu_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261105    gcc-8.5.0
xtensa                randconfig-1000-20261106    gcc-15.3.0
xtensa                randconfig-1001-20261105    gcc-8.5.0
xtensa                randconfig-1001-20261106    gcc-15.3.0
xtensa                randconfig-2000-20261104    clang-24
xtensa                randconfig-2001-20261104    clang-24
xtensa                randconfig-2200-20261104    gcc-10.5.0 smatch
xtensa                     xip_kc705_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

