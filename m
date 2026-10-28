Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87822606A320
	for <ath12k@archiver.kernel.org>; Wed, 28 Oct 2026 04:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q3+P9Q82;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=je9qKNTX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ezyuargBznfpC7/nBZjfsMba8crAw0eSgKZVZ/D913o=; b=Q3+P9Q82w1AYNSJf1KiU21F6ow
	ccZaLk+zhEzXtjI5Ml8FQxoS7ZRFxTbix5n3mZIOV8VBwDQVkdpYOi8TZ3gelcosMxwGsa8oXUEV7
	Vw1nMVhU0T7EcQc2Tp2KWtpGBOLrtDhMguFD+5t0K2BlLvQO5UmbKA1uss8pF8cEnpzt79xSECrvj
	9r1psn64tyUSUHQ6UbqCcG3Gcgie513Pl5YWoeADB875+hd/XY4rYUOoTuzZw1VwpiEojhaOSE3za
	LrX0nvbaONR4BfUiHVJJnq5148bEuVSlchkiX5b1EnjpJsN2l8DxXsWEeKoQy7vWbIJ18pN8jUjO7
	C8TsMTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvBu-00000006H0H-45C1;
	Wed, 28 Oct 2026 04:23:10 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvBr-00000006GzG-2dJ5
	for ath12k@lists.infradead.org;
	Wed, 28 Oct 2026 04:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793161387; x=1824697387;
  h=date:from:to:cc:subject:message-id;
  bh=tc3zzLsdhAHjfbXFkdpcPp2SW+r9jh74pmTb3iPfiTw=;
  b=je9qKNTXl9EkNXu8Ll1vFGqiqlVe3wMIl2OyHaj6YOCr5Y7YxE0Bt1O/
   /zFwDdCsoj97/BAmYQBgczh8kkj6R4bz9MfkWeQmR4b+XQhSwJn05yrLA
   iD6WIAxqTD1vemAhCtrCT0wpg/TmISO51x+Mfly9IxXjOD6r6jRD+2gkq
   q5c3EZKaTewDY381JPfConpkq7FobIjUDBzezqDDb4GRAdmnKaADba1bV
   zrnesDQfzcRLLIEv8HCaqFoG+oYlQDPcF41jBiIA618XSpzZy9T1OO9JD
   0wsdU9z7nXJTWsq8bMk2cJ5FD9PmlXtQutZX4GQ84oxko7sL4A8So3UVc
   Q==;
X-CSE-ConnectionGUID: 2825zQrURPeCVleOYAl/Bg==
X-CSE-MsgGUID: wltopsyfS7GoNC2AETFjOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1776223"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1776223"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 21:23:07 -0700
X-CSE-ConnectionGUID: njLC4y4sRbClW0pHrAbskg==
X-CSE-MsgGUID: CaGE1SxYRvi8xAyAhL4nJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6557461"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 27 Oct 2026 21:23:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvBn-00000000YA3-2MZt;
	Wed, 28 Oct 2026 04:23:03 +0000
Date: Wed, 28 Oct 2026 12:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 3608e4190659fb871207b7db58667a373536094a
Message-ID: <202610281239.KMY00yPd-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_212308_046372_3A94EC61 
X-CRM114-Status: UNSURE (   3.55  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: 3608e4190659fb871207b7db58667a373536094a  MIPS: generic: Remove undefined image 'ramdisk'

elapsed time: 3202m

configs tested: 185
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                           axs101_defconfig    gcc-16.2.0
arc                       axs103_smp_defconfig    clang-17
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261026    clang-24
arc                   randconfig-1001-20261026    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                          orion5x_defconfig    clang-17
arm                   randconfig-1000-20261026    clang-24
arm                   randconfig-1001-20261026    clang-24
arm                   randconfig-1002-20261026    clang-24
arm                   randconfig-1003-20261026    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261026    clang-24
arm64                 randconfig-1001-20261026    clang-24
arm64                 randconfig-1002-20261026    clang-24
arm64                 randconfig-1003-20261026    clang-24
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261026    clang-24
csky                  randconfig-1001-20261026    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261026    clang-24
hexagon               randconfig-1001-20261026    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261026    clang-22
i386        buildonly-randconfig-1001-20261026    clang-22
i386        buildonly-randconfig-1002-20261026    clang-22
i386        buildonly-randconfig-1003-20261026    clang-22
i386        buildonly-randconfig-1004-20261026    clang-22
i386        buildonly-randconfig-1005-20261026    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261026    gcc-14
i386                  randconfig-1001-20261026    gcc-14
i386                  randconfig-1002-20261026    gcc-14
i386                  randconfig-1003-20261026    gcc-14
i386                  randconfig-1004-20261026    gcc-14
i386                  randconfig-1005-20261026    gcc-14
i386                  randconfig-1006-20261026    gcc-14
i386                  randconfig-1007-20261026    clang-22
i386                  randconfig-1008-20261026    clang-22
i386                  randconfig-1009-20261026    clang-22
i386                  randconfig-1010-20261026    clang-22
i386                  randconfig-1011-20261026    clang-22
i386                  randconfig-1012-20261026    clang-22
i386                  randconfig-1013-20261026    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261026    clang-24
loongarch             randconfig-1001-20261026    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                          apollo_defconfig    clang-17
m68k                                 defconfig    clang-24
m68k                        m5275evb_defconfig    clang-17
m68k                        m5329evb_defconfig    clang-17
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    clang-17
mips                       loongson1_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261026    clang-24
nios2                 randconfig-1001-20261026    clang-24
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261026    gcc-14.4.0
parisc                randconfig-1001-20261026    gcc-14.4.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.2.0
powerpc                      ep8248e_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261026    gcc-14.4.0
powerpc               randconfig-1001-20261026    gcc-14.4.0
powerpc                     sam440ep_defconfig    clang-17
powerpc64             randconfig-1000-20261026    gcc-14.4.0
powerpc64             randconfig-1001-20261026    gcc-14.4.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261026    gcc-13.5.0
riscv                 randconfig-1001-20261026    gcc-13.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261026    gcc-13.5.0
s390                  randconfig-1001-20261026    gcc-13.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261026    gcc-13.5.0
sh                    randconfig-1001-20261026    gcc-13.5.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261026    gcc-14
sparc                 randconfig-1001-20261026    gcc-14
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261026    gcc-14
sparc64               randconfig-1001-20261026    gcc-14
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261026    gcc-14
um                    randconfig-1001-20261026    gcc-14
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261026    clang-22
x86_64      buildonly-randconfig-1001-20261026    clang-22
x86_64      buildonly-randconfig-1002-20261026    clang-22
x86_64      buildonly-randconfig-1003-20261026    clang-22
x86_64      buildonly-randconfig-1004-20261026    clang-22
x86_64      buildonly-randconfig-1005-20261026    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261026    clang-22
x86_64                randconfig-1001-20261026    clang-22
x86_64                randconfig-1002-20261026    clang-22
x86_64                randconfig-1003-20261026    clang-22
x86_64                randconfig-1004-20261026    clang-22
x86_64                randconfig-1005-20261026    clang-22
x86_64                randconfig-1006-20261026    gcc-14
x86_64                randconfig-1007-20261026    gcc-14
x86_64                randconfig-1008-20261026    gcc-14
x86_64                randconfig-1009-20261026    gcc-14
x86_64                randconfig-1010-20261026    gcc-14
x86_64                randconfig-1011-20261026    gcc-14
x86_64                randconfig-1012-20261026    gcc-14
x86_64                randconfig-1013-20261026    gcc-14
x86_64                randconfig-1014-20261026    gcc-14
x86_64                randconfig-1015-20261026    gcc-14
x86_64                randconfig-1016-20261026    gcc-14
x86_64                randconfig-1017-20261026    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261026    gcc-14
xtensa                randconfig-1001-20261026    gcc-14
xtensa                     xip_kc705_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

