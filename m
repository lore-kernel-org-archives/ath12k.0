Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C0CC3ABBB
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 01:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Pkd/rF6zLC9lpR+G21JPd8sUSz5esY0t5/V1YYoG0U=; b=ddvn5EarytwRsHjnQw2eGCh2eX
	TMiCk5iOAeX2bfgqVSTislSiGynfDG5Ey46s8Mwb5aJo5Kso7N8i0BxUNgKSlZnHHlAkFC6KfWuhL
	WaqpucUv4pITmQ3utK/ehL0MI59clZj0TFpaehaUzWsgH0ZyTtfX0IOq7dEaUA/HGuaNKKNBuEfxj
	GDRo9ax2P09kY0mzh1WNn2xHMOs3bY3JYBEAZytVzsdhc1AdiViHpV2tQTbrTRoMYBvZLDpeEswxI
	O9wk4AFTnk5hhuWXrBy48k9IJoWuObCIvo47/xAJBVqZ5/wtLrZomLJCQQMooreyh54DEpCMk217j
	IVGEKwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq0bE-00000002uHN-1BX0
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 01:32:20 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq0bA-00000002uGy-2WFJ
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 01:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726450337; x=1757986337;
  h=date:from:to:cc:subject:message-id;
  bh=NCltDPRXMIZvdg6KKg2IUQef6OFwddwna78r1HGqcK4=;
  b=DhqCMJ4ft/SsDIE1Y3R3T09hrxIP0aoAQRrOM9y8YpZ+zmRJKtF/LrK/
   fjqqeIw4hnWkG24SkgofNhnysg+bPUADcAduOCHhQeJCFSNoKA9Ez+89s
   pSSUE0NVicbw7S5r/LiS2nKTx9BH7BjU928eO6bauvPI19UIN20GHI/ko
   pgW8rm4VFa0hbbNaCqBMorF/U2jWR36KzKzoStESPzfZTgwP9R8ne7Eof
   B+0/nd8jRtv49hoyL9iglRHXJVAUueMG87PJHInK1zRqLED551dCNVoTT
   BfAG9Eaq/wZ/Og7XrzG3QrruyA3yBdnc48ypLeDsd5Onbnh9wf3W6SMPc
   Q==;
X-CSE-ConnectionGUID: jSLGnAEvRGqrt3LcO/00YA==
X-CSE-MsgGUID: djB6rROgRj6iIa/3wfV4Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="35856238"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="35856238"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 18:32:09 -0700
X-CSE-ConnectionGUID: etMmGbGVSpOm24SqCtDfWQ==
X-CSE-MsgGUID: /xyafD4qR6+3CBhhFlWwyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68836043"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2024 18:32:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq0az-0009DR-1K;
	Mon, 16 Sep 2024 01:32:05 +0000
Date: Mon, 16 Sep 2024 09:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS WITH WARNING
 8f61af03fddc0a30bdf49e06a13eafff3cec91b0
Message-ID: <202409160944.6PsOKKLw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_183216_715535_12626CC5 
X-CRM114-Status: UNSURE (   2.78  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
branch HEAD: 8f61af03fddc0a30bdf49e06a13eafff3cec91b0  wifi: ath12k: pass link ID during MLO while delivering skb

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202409151616.hnCxh90B-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202409151853.OfodBWj3-lkp@intel.com

    drivers/net/wireless/ath/ath12k/mac.c:3981:8: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    drivers/net/wireless/ath/ath12k/mac.c:4289:8: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]

Warning ids grouped by kconfigs:

recent_errors
|-- powerpc-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-uninitialized-when-used-here
|   `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-uninitialized-when-used-here
|   `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-uninitialized-when-used-here
|   `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-allmodconfig
|   |-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-uninitialized-when-used-here
|   `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
`-- x86_64-allyesconfig
    |-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-uninitialized-when-used-here
    `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true

elapsed time: 1918m

configs tested: 104
configs skipped: 4

tested configs:
alpha                   allnoconfig    gcc-13.3.0
alpha                  allyesconfig    gcc-13.3.0
arc                    allmodconfig    gcc-13.2.0
arc                     allnoconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20240916    gcc-13.2.0
arc         randconfig-002-20240916    gcc-13.2.0
arc          vdk_hs38_smp_defconfig    gcc-13.2.0
arm                    allmodconfig    gcc-14.1.0
arm                     allnoconfig    clang-20
arm                    allyesconfig    gcc-14.1.0
arm              clps711x_defconfig    clang-20
arm                gemini_defconfig    clang-20
arm                moxart_defconfig    gcc-14.1.0
arm             multi_v4t_defconfig    clang-20
arm         randconfig-001-20240916    gcc-14.1.0
arm         randconfig-002-20240916    clang-20
arm         randconfig-003-20240916    gcc-14.1.0
arm         randconfig-004-20240916    gcc-14.1.0
arm                sp7021_defconfig    gcc-14.1.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.1.0
arm64       randconfig-001-20240916    gcc-14.1.0
arm64       randconfig-002-20240916    clang-20
arm64       randconfig-003-20240916    clang-20
arm64       randconfig-004-20240916    clang-20
csky                    allnoconfig    gcc-14.1.0
csky        randconfig-001-20240916    gcc-14.1.0
csky        randconfig-002-20240916    gcc-14.1.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20240916    clang-20
hexagon     randconfig-002-20240916    clang-20
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-18
loongarch              allmodconfig    gcc-14.1.0
loongarch               allnoconfig    gcc-14.1.0
loongarch   randconfig-001-20240916    gcc-14.1.0
loongarch   randconfig-002-20240916    gcc-14.1.0
m68k                   allmodconfig    gcc-14.1.0
m68k                    allnoconfig    gcc-14.1.0
m68k                   allyesconfig    gcc-14.1.0
m68k                sun3x_defconfig    gcc-14.1.0
microblaze             allmodconfig    gcc-14.1.0
microblaze              allnoconfig    gcc-14.1.0
microblaze             allyesconfig    gcc-14.1.0
mips                    allnoconfig    gcc-14.1.0
nios2                   allnoconfig    gcc-14.1.0
nios2       randconfig-001-20240916    gcc-14.1.0
nios2       randconfig-002-20240916    gcc-14.1.0
openrisc                allnoconfig    gcc-14.1.0
openrisc               allyesconfig    gcc-14.1.0
openrisc                  defconfig    gcc-14.1.0
parisc                 allmodconfig    gcc-14.1.0
parisc                  allnoconfig    gcc-14.1.0
parisc                 allyesconfig    gcc-14.1.0
parisc                    defconfig    gcc-14.1.0
parisc      generic-64bit_defconfig    gcc-14.1.0
parisc      randconfig-001-20240916    gcc-14.1.0
parisc      randconfig-002-20240916    gcc-14.1.0
powerpc                allmodconfig    gcc-14.1.0
powerpc                 allnoconfig    gcc-14.1.0
powerpc                allyesconfig    clang-20
powerpc     randconfig-003-20240916    clang-20
powerpc64   randconfig-001-20240916    gcc-14.1.0
powerpc64   randconfig-002-20240916    clang-20
powerpc64   randconfig-003-20240916    gcc-14.1.0
riscv                  allmodconfig    clang-20
riscv                   allnoconfig    gcc-14.1.0
riscv                  allyesconfig    clang-20
riscv                     defconfig    clang-20
riscv       randconfig-001-20240916    clang-20
riscv       randconfig-002-20240916    clang-20
s390                   allmodconfig    clang-20
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.1.0
s390                      defconfig    clang-20
s390        randconfig-001-20240916    gcc-14.1.0
s390        randconfig-002-20240916    gcc-14.1.0
sh                     allmodconfig    gcc-14.1.0
sh                      allnoconfig    gcc-14.1.0
sh                     allyesconfig    gcc-14.1.0
sh                        defconfig    gcc-14.1.0
sh          randconfig-001-20240916    gcc-14.1.0
sh          randconfig-002-20240916    gcc-14.1.0
sparc                  allmodconfig    gcc-14.1.0
sparc64                   defconfig    gcc-14.1.0
sparc64     randconfig-001-20240916    gcc-14.1.0
sparc64     randconfig-002-20240916    gcc-14.1.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
um                        defconfig    clang-20
um          randconfig-001-20240916    clang-14
um          randconfig-002-20240916    gcc-12
x86_64                  allnoconfig    clang-18
x86_64                 allyesconfig    clang-18
x86_64                    defconfig    gcc-11
x86_64                rhel-8.3-rust    clang-18
xtensa                  allnoconfig    gcc-14.1.0
xtensa      randconfig-001-20240916    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

