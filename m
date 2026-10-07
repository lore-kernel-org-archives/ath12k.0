Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4C0CA5FF1
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ccpUqAE28isIlBIDCqWLVRQLQo6AI+p6WM28IVcILP0=; b=iE08e7O8vKGxkTWDougSgavNVt
	FW9rZJ/3Fsox0SpBwWVuj85QuOR5c6Gn/QWRwJqS8AM7G9IUPVRaMEcyUq1OCmWwh/S6qm1opZTUQ
	lLKvCw7/pl++Qt012pzuheCLRQCH6VSJXWjzQy/mhnOVfbgllQTjrlK7IpeY5YLoEc9rS2vM3Iggz
	tOD5B0e29grNbZaKz3eybXaKDeieGQPGNEPLXYe3y8biy/nWkH6L6KCCEeeMUw7KrMZfijjx76kie
	CPzGp1j/e6H+enTYTTvq9LiUyOdsBF8F/YHbg+R2atP7HinCj1aSEchQIxpArkFhVDjeBKPXsvj4D
	40kSTFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOxc-00000002BXM-1IzX;
	Wed, 07 Oct 2026 10:33:20 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOxW-00000002BUk-3cPj
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 10:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791369195; x=1822905195;
  h=date:from:to:cc:subject:message-id;
  bh=kIV+FQkOT89i9GXJC+7Jf8q8HnQW5D95wjOLFB+ognI=;
  b=ityycLt0S8Rp+lbSVUxcvX9sK39MzsNYfi/s0rMG3W/ekvJWE+5duYA3
   zzUUKBsIeGkMhd86Y+0Nu8Pumas2SI1GZwvajBw7f+4TfwirPaOZqsJl4
   gVV6B5j8BwdrwKHLycmTVbjQPDJjkTvU4u5sbpZF8rM0hvZa5PZuUg0LP
   bM3yizbshtWsEXhFqXKigePWecD8pPCqovXasoDYo+3tVLdNW9ebklXC2
   PsJ5NckRVmNTxukHbg2KuXJ8+9FhWlmCW84PoMzIkztQAnZG4y8J81IP1
   8AKRe1t8rrhshxJd7XHRxvzg5zg7+0ka4fYUXXBVc5cSozMq72oxQGtaL
   w==;
X-CSE-ConnectionGUID: 9Is7F6tRTFO+WLBggH2eYw==
X-CSE-MsgGUID: 3dmxFExTQ9yXTgvstF8WpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="130669"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="130669"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 03:33:13 -0700
X-CSE-ConnectionGUID: vM2ub5O4TDSLG274wSr9dA==
X-CSE-MsgGUID: UL+zxSrESsmLTVKRlt+iGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1522837"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 07 Oct 2026 03:33:12 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEOxR-000000002q6-2QZs;
	Wed, 07 Oct 2026 10:33:09 +0000
Date: Wed, 07 Oct 2026 18:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 a90ebf2176db07c5d91e0a62e15ded1fd50710a0
Message-ID: <202610071826.dwZluY6q-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_033315_925757_F114A8CB 
X-CRM114-Status: UNSURE (   4.18  )
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
branch HEAD: a90ebf2176db07c5d91e0a62e15ded1fd50710a0  MIPS: generic: Remove undefined image 'ramdisk'

elapsed time: 1232m

configs tested: 414
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20261006    gcc-9.5.0  cocci
alpha                randconfig-r2104-20261007    gcc-10.5.0 cocci
alpha                randconfig-r2107-20261006    clang-24   cocci
alpha                randconfig-r2200-20261006    gcc-14.3.0 smatch
alpha                randconfig-r2201-20261006    gcc-8.5.0  smatch
alpha                randconfig-r2202-20261007    gcc-8.5.0  smatch
alpha                randconfig-r2303-20261006    gcc-8.5.0  sparse
alpha                randconfig-r2304-20261006    gcc-10.5.0 sparse
alpha                randconfig-r2305-20261007    clang-17   sparse
alpha                randconfig-r2306-20261007    clang-24   sparse
alpha                randconfig-r2307-20261006    clang-19   sparse
alpha                randconfig-r2308-20261006    clang-19   sparse
alpha                randconfig-r2309-20261006    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261007    clang-24
arc                   randconfig-1001-20261007    clang-24
arc                  randconfig-r2102-20261007    gcc-10.5.0 cocci
arc                  randconfig-r2103-20261007    gcc-11.5.0 cocci
arc                  randconfig-r2105-20261006    gcc-14.3.0 cocci
arc                  randconfig-r2106-20261006    clang-24   cocci
arc                  randconfig-r2107-20261007    gcc-10.5.0 cocci
arc                  randconfig-r2200-20261006    gcc-13.4.0 smatch
arc                  randconfig-r2201-20261006    gcc-11.5.0 smatch
arm                               alldefconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      davinci_all_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                            omap1_defconfig    gcc-16.1.0
arm                           pxa168_defconfig    gcc-16.1.0
arm                           pxa3xx_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261007    clang-24
arm                   randconfig-1001-20261007    clang-24
arm                   randconfig-1002-20261007    clang-24
arm                   randconfig-1003-20261007    clang-24
arm                  randconfig-r2100-20261007    clang-17   cocci
arm                  randconfig-r2104-20261007    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261007    gcc-16.1.0 cocci
arm                  randconfig-r2304-20261007    clang-20   sparse
arm                  randconfig-r2305-20261006    gcc-8.5.0  sparse
arm                          wpcm450_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261007    gcc-13.4.0
arm64                 randconfig-1001-20261007    gcc-13.4.0
arm64                 randconfig-1002-20261007    gcc-13.4.0
arm64                 randconfig-1003-20261007    gcc-13.4.0
arm64                randconfig-r2100-20261007    gcc-10.5.0 cocci
arm64                randconfig-r2102-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2104-20261006    gcc-14.3.0 cocci
arm64                randconfig-r2105-20261006    clang-24   cocci
arm64                randconfig-r2106-20261007    clang-22   cocci
arm64                randconfig-r2106-20261007    gcc-16.1.0 cocci
arm64                randconfig-r2107-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2300-20261006    gcc-8.5.0  sparse
arm64                randconfig-r2301-20261007    clang-17   sparse
arm64                randconfig-r2303-20261007    clang-17   sparse
arm64                randconfig-r2305-20261007    clang-20   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261007    gcc-13.4.0
csky                  randconfig-1001-20261007    gcc-13.4.0
csky                 randconfig-r2101-20261006    gcc-16.1.0 cocci
csky                 randconfig-r2102-20261007    gcc-8.5.0  cocci
csky                 randconfig-r2103-20261006    gcc-16.1.0 cocci
csky                 randconfig-r2104-20261007    gcc-16.1.0 cocci
csky                 randconfig-r2200-20261006    gcc-15.2.0 smatch
csky                 randconfig-r2201-20261007    gcc-16.1.0 smatch
csky                 randconfig-r2301-20261007    gcc-8.5.0  sparse
csky                 randconfig-r2303-20261006    gcc-10.5.0 sparse
csky                 randconfig-r2304-20261006    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261007    gcc-12.5.0
hexagon               randconfig-1001-20261007    gcc-12.5.0
hexagon              randconfig-r2101-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2103-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2106-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2107-20261007    clang-22   cocci
hexagon              randconfig-r2107-20261007    gcc-16.1.0 cocci
hexagon              randconfig-r2200-20261007    clang-24   smatch
hexagon              randconfig-r2301-20261006    gcc-8.5.0  sparse
hexagon              randconfig-r2304-20261007    clang-17   sparse
hexagon              randconfig-r2307-20261006    gcc-10.5.0 sparse
hexagon              randconfig-r2308-20261006    clang-24   sparse
hexagon              randconfig-r2309-20261007    clang-17   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261007    gcc-14
i386        buildonly-randconfig-1001-20261007    gcc-14
i386        buildonly-randconfig-1002-20261007    gcc-14
i386        buildonly-randconfig-1003-20261007    gcc-14
i386        buildonly-randconfig-1004-20261007    gcc-14
i386        buildonly-randconfig-1005-20261007    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261007    clang-22
i386                  randconfig-1001-20261007    clang-22
i386                  randconfig-1002-20261007    clang-22
i386                  randconfig-1003-20261007    clang-22
i386                  randconfig-1004-20261007    clang-22
i386                  randconfig-1005-20261007    clang-22
i386                  randconfig-1006-20261007    clang-22
i386                  randconfig-1007-20261007    gcc-14
i386                  randconfig-1008-20261007    gcc-14
i386                  randconfig-1009-20261007    gcc-14
i386                  randconfig-1010-20261007    gcc-14
i386                  randconfig-1011-20261007    gcc-14
i386                  randconfig-1012-20261007    gcc-14
i386                  randconfig-1013-20261007    gcc-14
i386                  randconfig-2100-20261006    clang-22   cocci
i386                  randconfig-2100-20261007    clang-22   cocci
i386                  randconfig-2101-20261006    clang-22   cocci
i386                  randconfig-2101-20261007    clang-22   cocci
i386                  randconfig-2102-20261006    clang-22   cocci
i386                  randconfig-2102-20261007    clang-22   cocci
i386                  randconfig-2103-20261006    clang-22   cocci
i386                  randconfig-2103-20261007    clang-22   cocci
i386                  randconfig-2200-20261006    gcc-13     smatch
i386                  randconfig-2200-20261007    gcc-14     smatch
i386                  randconfig-2300-20261006    gcc-14     sparse
i386                  randconfig-2300-20261007    clang-22   sparse
i386                  randconfig-2301-20261006    gcc-14     sparse
i386                  randconfig-2301-20261007    clang-22   sparse
i386                  randconfig-2302-20261006    gcc-14     sparse
i386                  randconfig-2302-20261007    clang-22   sparse
i386                 randconfig-r2105-20261006    gcc-16.1.0 cocci
i386                 randconfig-r2202-20261006    gcc-14     smatch
i386                 randconfig-r2300-20261006    gcc-14     sparse
i386                 randconfig-r2300-20261007    gcc-8.5.0  sparse
i386                 randconfig-r2302-20261007    clang-20   sparse
i386                 randconfig-r2307-20261007    clang-17   sparse
i386                 randconfig-r2307-20261007    gcc-13.4.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261007    gcc-12.5.0
loongarch             randconfig-1001-20261007    gcc-12.5.0
loongarch            randconfig-r2106-20261006    gcc-8.5.0  cocci
loongarch            randconfig-r2200-20261006    clang-18   smatch
loongarch            randconfig-r2201-20261006    gcc-13.4.0 smatch
loongarch            randconfig-r2300-20261007    clang-17   sparse
loongarch            randconfig-r2301-20261006    gcc-10.5.0 sparse
loongarch            randconfig-r2302-20261006    gcc-10.5.0 sparse
loongarch            randconfig-r2305-20261007    gcc-8.5.0  sparse
loongarch            randconfig-r2307-20261007    clang-24   sparse
loongarch            randconfig-r2308-20261006    gcc-8.5.0  sparse
loongarch            randconfig-r2309-20261007    clang-17   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2100-20261007    gcc-11.5.0 cocci
m68k                 randconfig-r2101-20261006    gcc-10.5.0 cocci
m68k                 randconfig-r2103-20261006    gcc-9.5.0  cocci
m68k                 randconfig-r2106-20261007    gcc-10.5.0 cocci
m68k                 randconfig-r2302-20261006    gcc-14     sparse
m68k                 randconfig-r2303-20261007    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2104-20261007    gcc-10.5.0 cocci
microblaze           randconfig-r2301-20261006    gcc-10.5.0 sparse
microblaze           randconfig-r2306-20261006    clang-24   sparse
microblaze           randconfig-r2306-20261007    gcc-13.4.0 sparse
microblaze           randconfig-r2307-20261006    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath79_defconfig    gcc-16.1.0
mips                   maltasmvp_eva_defconfig    gcc-16.1.0
mips                 randconfig-r2202-20261006    gcc-13.4.0 smatch
mips                 randconfig-r2301-20261006    gcc-14     sparse
mips                 randconfig-r2303-20261006    gcc-8.5.0  sparse
mips                 randconfig-r2305-20261006    gcc-10.5.0 sparse
mips                 randconfig-r2306-20261007    clang-17   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261007    gcc-12.5.0
nios2                 randconfig-1001-20261007    gcc-12.5.0
nios2                randconfig-r2100-20261006    gcc-10.5.0 cocci
nios2                randconfig-r2101-20261007    gcc-11.5.0 cocci
nios2                randconfig-r2102-20261006    gcc-10.5.0 cocci
nios2                randconfig-r2105-20261007    gcc-10.5.0 cocci
nios2                randconfig-r2106-20261006    gcc-14.3.0 cocci
nios2                randconfig-r2300-20261006    gcc-10.5.0 sparse
nios2                randconfig-r2305-20261006    gcc-8.5.0  sparse
nios2                randconfig-r2306-20261006    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20261007    gcc-10.5.0 cocci
openrisc             randconfig-r2103-20261006    gcc-10.5.0 cocci
openrisc             randconfig-r2104-20261006    gcc-8.5.0  cocci
openrisc             randconfig-r2200-20261007    gcc-12.5.0 smatch
openrisc             randconfig-r2303-20261007    clang-20   sparse
openrisc             randconfig-r2309-20261006    gcc-10.5.0 sparse
openrisc             randconfig-r2309-20261007    gcc-13.4.0 sparse
openrisc                        virt_defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261007    gcc-15.2.0
parisc                randconfig-1001-20261007    gcc-15.2.0
parisc               randconfig-r2100-20261007    gcc-8.5.0  cocci
parisc               randconfig-r2106-20261007    gcc-10.5.0 cocci
parisc               randconfig-r2201-20261007    gcc-8.5.0  smatch
parisc               randconfig-r2309-20261007    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     ge_imp3a_defconfig    gcc-16.1.0
powerpc                         icon_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261007    gcc-15.2.0
powerpc               randconfig-1001-20261007    gcc-15.2.0
powerpc              randconfig-r2101-20261007    gcc-8.5.0  cocci
powerpc              randconfig-r2102-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2104-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2107-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2306-20261007    clang-17   sparse
powerpc              randconfig-r2308-20261007    gcc-13.4.0 sparse
powerpc                  xes_mpc85xx_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261007    gcc-15.2.0
powerpc64             randconfig-1001-20261007    gcc-15.2.0
powerpc64            randconfig-r2102-20261006    gcc-9.5.0  cocci
powerpc64            randconfig-r2103-20261007    gcc-10.5.0 cocci
powerpc64            randconfig-r2104-20261006    clang-24   cocci
powerpc64            randconfig-r2200-20261007    clang-24   smatch
powerpc64            randconfig-r2202-20261007    gcc-10.5.0 smatch
powerpc64            randconfig-r2305-20261006    gcc-10.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261007    clang-24
riscv                 randconfig-1001-20261007    clang-24
riscv                 randconfig-2000-20261006    gcc-16.1.0
riscv                 randconfig-2000-20261007    gcc-12.5.0
riscv                 randconfig-2001-20261006    gcc-16.1.0
riscv                 randconfig-2001-20261007    gcc-12.5.0
riscv                randconfig-r2101-20261007    clang-17   cocci
riscv                randconfig-r2105-20261006    gcc-8.5.0  cocci
riscv                randconfig-r2105-20261007    gcc-8.5.0  cocci
riscv                randconfig-r2201-20261007    clang-24   smatch
riscv                randconfig-r2304-20261006    gcc-10.5.0 sparse
riscv                randconfig-r2304-20261007    gcc-8.5.0  sparse
riscv                randconfig-r2308-20261007    clang-17   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261007    clang-24
s390                  randconfig-1001-20261007    clang-24
s390                  randconfig-2000-20261006    gcc-16.1.0
s390                  randconfig-2000-20261007    gcc-12.5.0
s390                  randconfig-2001-20261006    gcc-16.1.0
s390                  randconfig-2001-20261007    gcc-12.5.0
s390                 randconfig-r2302-20261007    gcc-8.5.0  sparse
s390                 randconfig-r2306-20261006    clang-19   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261007    clang-24
sh                    randconfig-1001-20261007    clang-24
sh                    randconfig-2000-20261006    gcc-16.1.0
sh                    randconfig-2000-20261007    gcc-12.5.0
sh                    randconfig-2001-20261006    gcc-16.1.0
sh                    randconfig-2001-20261007    gcc-12.5.0
sh                   randconfig-r2105-20261007    clang-22   cocci
sh                   randconfig-r2105-20261007    gcc-10.5.0 cocci
sh                   randconfig-r2107-20261006    gcc-14.3.0 cocci
sh                   randconfig-r2302-20261006    gcc-8.5.0  sparse
sh                   randconfig-r2304-20261006    gcc-8.5.0  sparse
sh                           rsk7264_defconfig    gcc-16.1.0
sh                    secureedge5410_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261007    clang-17
sparc                 randconfig-1001-20261007    clang-17
sparc                 randconfig-2000-20261006    clang-24
sparc                 randconfig-2000-20261007    clang-24
sparc                 randconfig-2001-20261006    clang-24
sparc                 randconfig-2001-20261007    clang-24
sparc                randconfig-r2103-20261007    clang-17   cocci
sparc                randconfig-r2201-20261006    gcc-16.1.0 smatch
sparc                randconfig-r2300-20261006    gcc-8.5.0  sparse
sparc                randconfig-r2301-20261007    clang-20   sparse
sparc                randconfig-r2302-20261006    gcc-10.5.0 sparse
sparc                randconfig-r2303-20261006    gcc-10.5.0 sparse
sparc                randconfig-r2304-20261006    gcc-14     sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261007    clang-17
sparc64               randconfig-1001-20261007    clang-17
sparc64               randconfig-2000-20261006    clang-24
sparc64               randconfig-2000-20261007    clang-24
sparc64               randconfig-2001-20261006    clang-24
sparc64               randconfig-2001-20261007    clang-24
sparc64              randconfig-r2100-20261006    gcc-9.5.0  cocci
sparc64              randconfig-r2100-20261007    gcc-8.5.0  cocci
sparc64              randconfig-r2102-20261007    gcc-11.5.0 cocci
sparc64              randconfig-r2201-20261007    gcc-16.1.0 smatch
sparc64              randconfig-r2300-20261007    clang-20   sparse
sparc64              randconfig-r2308-20261006    gcc-10.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261007    clang-17
um                    randconfig-1001-20261007    clang-17
um                    randconfig-2000-20261006    clang-24
um                    randconfig-2000-20261007    clang-24
um                    randconfig-2001-20261006    clang-24
um                    randconfig-2001-20261007    clang-24
um                   randconfig-r2107-20261006    gcc-8.5.0  cocci
um                   randconfig-r2202-20261006    clang-24   smatch
um                   randconfig-r2202-20261007    clang-24   smatch
um                   randconfig-r2302-20261006    gcc-8.5.0  sparse
um                   randconfig-r2303-20261006    gcc-14     sparse
um                   randconfig-r2305-20261006    gcc-14     sparse
um                   randconfig-r2309-20261006    clang-19   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261007    gcc-14
x86_64      buildonly-randconfig-1001-20261007    gcc-14
x86_64      buildonly-randconfig-1002-20261007    gcc-14
x86_64      buildonly-randconfig-1003-20261007    gcc-14
x86_64      buildonly-randconfig-1004-20261007    gcc-14
x86_64      buildonly-randconfig-1005-20261007    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261007    clang-22
x86_64                randconfig-1001-20261007    clang-22
x86_64                randconfig-1002-20261007    clang-22
x86_64                randconfig-1003-20261007    clang-22
x86_64                randconfig-1004-20261007    clang-22
x86_64                randconfig-1005-20261007    clang-22
x86_64                randconfig-1006-20261007    clang-22
x86_64                randconfig-1007-20261007    clang-22
x86_64                randconfig-1008-20261007    clang-22
x86_64                randconfig-1009-20261007    clang-22
x86_64                randconfig-1010-20261007    clang-22
x86_64                randconfig-1011-20261007    clang-22
x86_64                randconfig-1012-20261007    gcc-12
x86_64                randconfig-1013-20261007    gcc-12
x86_64                randconfig-1014-20261007    gcc-12
x86_64                randconfig-1015-20261007    gcc-12
x86_64                randconfig-1016-20261007    gcc-12
x86_64                randconfig-1017-20261007    gcc-12
x86_64                randconfig-2100-20261006    clang-22   cocci
x86_64                randconfig-2100-20261007    clang-22   cocci
x86_64                randconfig-2101-20261006    clang-22   cocci
x86_64                randconfig-2101-20261007    clang-22   cocci
x86_64                randconfig-2102-20261006    clang-22   cocci
x86_64                randconfig-2102-20261007    clang-22   cocci
x86_64                randconfig-2103-20261006    clang-22   cocci
x86_64                randconfig-2103-20261007    clang-22   cocci
x86_64                randconfig-2200-20261006    clang-22   smatch
x86_64                randconfig-2200-20261007    gcc-14     smatch
x86_64                randconfig-2300-20261006    gcc-14     sparse
x86_64                randconfig-2300-20261007    clang-22   sparse
x86_64                randconfig-2301-20261006    gcc-14     sparse
x86_64                randconfig-2301-20261007    clang-22   sparse
x86_64                randconfig-2302-20261006    gcc-14     sparse
x86_64                randconfig-2302-20261007    clang-22   sparse
x86_64               randconfig-r2104-20261007    clang-22   cocci
x86_64               randconfig-r2106-20261006    gcc-16.1.0 cocci
x86_64               randconfig-r2107-20261007    gcc-10.5.0 cocci
x86_64               randconfig-r2301-20261006    gcc-8.5.0  sparse
x86_64               randconfig-r2308-20261007    clang-24   sparse
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
xtensa                randconfig-1000-20261007    clang-17
xtensa                randconfig-1001-20261007    clang-17
xtensa                randconfig-2000-20261006    clang-24
xtensa                randconfig-2000-20261007    clang-24
xtensa                randconfig-2001-20261006    clang-24
xtensa                randconfig-2001-20261007    clang-24
xtensa               randconfig-r2100-20261006    gcc-16.1.0 cocci
xtensa               randconfig-r2102-20261007    clang-17   cocci
xtensa               randconfig-r2103-20261007    gcc-8.5.0  cocci
xtensa               randconfig-r2200-20261006    gcc-9.5.0  smatch
xtensa               randconfig-r2302-20261007    clang-17   sparse
xtensa               randconfig-r2306-20261006    gcc-10.5.0 sparse
xtensa               randconfig-r2307-20261006    clang-24   sparse
xtensa               randconfig-r2307-20261007    clang-17   sparse
xtensa               randconfig-r2309-20261006    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

