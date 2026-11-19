Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCBE606A320
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CkHqIBEm;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GPo1WiEy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=45gzeFzG3Q5h7i4o9e0gCQuSNCanvUcOXRZ9+pH9GmM=; b=CkHqIBEmEPFbQy9Gj+34IqsaZ4
	a+uy05O4NGb74USL4fAQCrgXIypFNVT6SirlFDl6HWA+8hDkuVvBUdy2bh+DI9SQHw+DdSFGf/iYu
	dm19gCqzY6Ct2P2THAKHK6fIk62jTaTmrzeSoPmB1nXlXpS/Z1X4MzTS0fgdg6YNo+KCIoaHblTR4
	qkecenxVvj4cf4ta4C9NsnMlJT67oWtfWaRmeeRLaFFBrMeYHsN+ay9xmdQRiaf5EewAFKE5tAPXf
	0ZAWnmD3WKZbSox3WnhJ1HjbzfHcah2hVNYsCheC7P9G6JU7KHS6j16HTRIWjIaNOE0HTG9n1UaI8
	4vkbkXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwiq-0000000B5SJ-1YjS;
	Thu, 19 Nov 2026 07:38:20 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwil-0000000B5RU-1wrL
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 07:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795073895; x=1826609895;
  h=date:from:to:cc:subject:message-id;
  bh=Qnnkvbg4b7RD3i2h4sOs/a+MVAyhK0Q0XEbw6WDNn98=;
  b=GPo1WiEyqCvvWD1aL7ikgl5cN9xVL6o4TuHuhwMDGdkz6pGXbEBYLfRU
   M/jUD0BfceZ8/xxDBESOjn4u0EPWIsQSabvwSViPoyg3P+58o+Tlrdpnu
   9zuDHcYADt4WY7OgeDpxzGIQ10X0l8qBlhDQiavOajtM+j4nlkO5JPDak
   2uvNh9nyMe/Hu6b1uL88tXDpGsyRxUQyuuyzjiAD8mZlGQmjsc1Yx1g7h
   WXssx6yI7ml2C4V8adxJAXr1h6Dcus8Zkk8qY0/wk3tT/AItoJ5V2a5sb
   SHmzgoZlrilQWCKoueV9gfG+ud0r6Y8ap/7qsxVv/mT6Pzb/xoW0uBEI/
   A==;
X-CSE-ConnectionGUID: YBW1aDHvRrq5eAav0bOp7w==
X-CSE-MsgGUID: d9PktPO4R5+6HAusHBIQog==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3932049"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3932049"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:38:10 -0800
X-CSE-ConnectionGUID: yEJCxiuXSRWg99KCsY/6kQ==
X-CSE-MsgGUID: YUQnohatRSSPsImIv3Q8kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10260896"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2026 23:38:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTwid-00000001FKg-0066;
	Thu, 19 Nov 2026 07:38:07 +0000
Date: Thu, 19 Nov 2026 15:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 ee7edfb99ee26581633fabb0662382734ea3cdbd
Message-ID: <20261119153708.4npQ6iQD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_233815_623677_BB4D16CD 
X-CRM114-Status: UNSURE (   4.76  )
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
branch HEAD: ee7edfb99ee26581633fabb0662382734ea3cdbd  drm/amd/display: use include guards instead of #pragma once in Core 2 headers

elapsed time: 2432m

configs tested: 236
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-16.2.0
alpha        randconfig-2000-20261117    gcc-15.3.0
alpha        randconfig-2000-20261117    gcc-8.5.0
alpha        randconfig-2001-20261117    gcc-10.5.0
alpha        randconfig-2001-20261117    gcc-15.3.0
alpha        randconfig-2200-20261117    gcc-8.5.0  smatch
alpha       randconfig-r2301-20261117    gcc-14.4.0 sparse
alpha       randconfig-r2310-20261117    gcc-8.5.0  sparse
alpha       randconfig-r2311-20261117    gcc-15.3.0 sparse
arc                       allnoconfig    gcc-16.2.0
arc          randconfig-1000-20261119    gcc-8.5.0
arc          randconfig-1001-20261119    gcc-8.5.0
arc          randconfig-2000-20261117    gcc-12.5.0
arc          randconfig-2001-20261117    gcc-12.5.0
arc          randconfig-2002-20261117    gcc-12.5.0
arc          randconfig-2003-20261117    gcc-12.5.0
arc          randconfig-2004-20261117    gcc-12.5.0
arc          randconfig-2005-20261117    gcc-12.5.0
arc          randconfig-2200-20261117    gcc-8.5.0  smatch
arc         randconfig-r2100-20261117    gcc-11.5.0 cocci
arc         randconfig-r2306-20261117    gcc-13.5.0 sparse
arc         randconfig-r2309-20261117    gcc-11.5.0 sparse
arm                       allnoconfig    gcc-16.2.0
arm          randconfig-1000-20261119    gcc-8.5.0
arm          randconfig-1001-20261119    gcc-8.5.0
arm          randconfig-1002-20261119    gcc-8.5.0
arm          randconfig-1003-20261119    gcc-8.5.0
arm          randconfig-2000-20261117    gcc-10.5.0
arm          randconfig-2001-20261117    gcc-10.5.0
arm          randconfig-2002-20261117    gcc-10.5.0
arm         randconfig-r2307-20261117    clang-17   sparse
arm64                     allnoconfig    gcc-16.2.0
arm64        randconfig-2000-20261117    gcc-10.5.0
arm64        randconfig-2001-20261117    gcc-10.5.0
arm64        randconfig-2002-20261117    gcc-10.5.0
arm64        randconfig-2200-20261117    clang-17   smatch
arm64       randconfig-r2105-20261117    gcc-11.5.0 cocci
arm64       randconfig-r2307-20261117    gcc-11.5.0 sparse
csky                      allnoconfig    gcc-16.2.0
csky         randconfig-2000-20261117    gcc-16.2.0
csky         randconfig-2001-20261117    gcc-16.2.0
csky         randconfig-2200-20261117    gcc-14.4.0 smatch
csky        randconfig-r2308-20261117    gcc-16.2.0 sparse
hexagon                   allnoconfig    gcc-16.2.0
hexagon      randconfig-2000-20261117    gcc-16.2.0
hexagon      randconfig-2001-20261117    gcc-16.2.0
hexagon      randconfig-2200-20261117    clang-17   smatch
hexagon     randconfig-r2307-20261117    clang-24   sparse
i386                      allnoconfig    gcc-16.2.0
i386         randconfig-1000-20261119    clang-22
i386         randconfig-1001-20261119    clang-22
i386         randconfig-1002-20261119    clang-22
i386         randconfig-1003-20261119    clang-22
i386         randconfig-1004-20261119    clang-22
i386         randconfig-1005-20261119    clang-22
i386         randconfig-1006-20261119    clang-22
i386         randconfig-2000-20261117    clang-22
i386         randconfig-2001-20261117    clang-22
i386         randconfig-2002-20261117    clang-22
i386         randconfig-2003-20261117    clang-22
i386         randconfig-2004-20261117    clang-22
i386         randconfig-2005-20261117    clang-22
i386         randconfig-2100-20261117    clang-22   cocci
i386         randconfig-2101-20261117    clang-22   cocci
i386         randconfig-2102-20261117    clang-22   cocci
i386         randconfig-2103-20261117    clang-22   cocci
i386         randconfig-2104-20261117    clang-22   cocci
i386         randconfig-2105-20261117    clang-22   cocci
i386         randconfig-2200-20261117    gcc-14     smatch
i386         randconfig-2300-20261117    clang-22   sparse
i386         randconfig-2301-20261117    clang-22   sparse
i386         randconfig-2302-20261117    clang-22   sparse
loongarch                 allnoconfig    gcc-16.2.0
loongarch                   defconfig    clang-24
loongarch    randconfig-2000-20261117    gcc-8.5.0
loongarch    randconfig-2001-20261117    gcc-8.5.0
loongarch    randconfig-2200-20261117    gcc-13.5.0 smatch
m68k                      allnoconfig    gcc-16.2.0
m68k                        defconfig    clang-24
m68k         randconfig-2000-20261117    gcc-15.3.0
m68k         randconfig-2000-20261117    gcc-8.5.0
m68k         randconfig-2001-20261117    gcc-15.3.0
m68k         randconfig-2200-20261117    gcc-11.5.0 smatch
m68k        randconfig-r2304-20261117    gcc-14.4.0 sparse
m68k        randconfig-r2308-20261117    clang-24   sparse
microblaze                allnoconfig    gcc-16.2.0
microblaze                  defconfig    clang-24
microblaze   randconfig-2000-20261117    gcc-12.5.0
microblaze   randconfig-2000-20261117    gcc-15.3.0
microblaze   randconfig-2001-20261117    gcc-14.4.0
microblaze   randconfig-2001-20261117    gcc-15.3.0
microblaze   randconfig-2200-20261117    gcc-14.4.0 smatch
microblaze  randconfig-r2106-20261117    gcc-16.2.0 cocci
microblaze  randconfig-r2302-20261117    gcc-14.4.0 sparse
microblaze  randconfig-r2306-20261117    clang-24   sparse
mips                      allnoconfig    gcc-16.2.0
mips         randconfig-2000-20261117    gcc-16.2.0
mips         randconfig-2001-20261117    gcc-16.2.0
mips         randconfig-2002-20261117    gcc-16.2.0
mips         randconfig-2200-20261117    clang-24   smatch
mips        randconfig-r2103-20261117    gcc-11.5.0 cocci
mips        randconfig-r2110-20261117    gcc-16.2.0 cocci
nios2                     allnoconfig    clang-24
nios2                       defconfig    clang-24
nios2        randconfig-2000-20261117    gcc-8.5.0
nios2        randconfig-2001-20261117    gcc-8.5.0
nios2        randconfig-2200-20261117    gcc-11.5.0 smatch
nios2       randconfig-r2101-20261117    gcc-11.5.0 cocci
nios2       randconfig-r2305-20261117    gcc-14.4.0 sparse
openrisc                  allnoconfig    clang-24
openrisc                    defconfig    gcc-16.2.0
openrisc     randconfig-2000-20261117    gcc-16.2.0
openrisc     randconfig-2001-20261117    gcc-16.2.0
openrisc     randconfig-2002-20261117    gcc-16.2.0
openrisc     randconfig-2200-20261117    gcc-16.2.0 smatch
openrisc    randconfig-r2308-20261117    gcc-13.5.0 sparse
openrisc    randconfig-r2310-20261117    clang-24   sparse
parisc                    allnoconfig    clang-24
parisc                      defconfig    gcc-16.2.0
parisc       randconfig-2000-20261117    gcc-8.5.0
parisc       randconfig-2001-20261117    gcc-8.5.0
parisc       randconfig-2200-20261117    gcc-8.5.0  smatch
parisc      randconfig-r2104-20261117    gcc-11.5.0 cocci
parisc      randconfig-r2309-20261117    clang-24   sparse
parisc64                    defconfig    clang-24
powerpc                   allnoconfig    clang-24
powerpc      randconfig-2000-20261117    gcc-8.5.0
powerpc      randconfig-2001-20261117    gcc-8.5.0
powerpc      randconfig-2002-20261117    gcc-8.5.0
powerpc      randconfig-2200-20261117    gcc-8.5.0  smatch
powerpc     randconfig-r2309-20261117    clang-17   sparse
powerpc64    randconfig-2000-20261117    gcc-8.5.0
powerpc64    randconfig-2001-20261117    gcc-8.5.0
powerpc64    randconfig-2002-20261117    gcc-8.5.0
powerpc64    randconfig-2200-20261117    gcc-8.5.0  smatch
riscv                     allnoconfig    clang-24
riscv                       defconfig    gcc-16.2.0
riscv        randconfig-2000-20261117    gcc-11.5.0
riscv        randconfig-2000-20261117    gcc-8.5.0
riscv        randconfig-2001-20261117    clang-18
riscv        randconfig-2001-20261117    gcc-11.5.0
riscv        randconfig-2002-20261117    clang-24
riscv        randconfig-2002-20261117    gcc-11.5.0
riscv        randconfig-2003-20261117    gcc-11.5.0
riscv        randconfig-2004-20261117    clang-17
riscv        randconfig-2004-20261117    gcc-11.5.0
riscv        randconfig-2005-20261117    clang-24
riscv        randconfig-2005-20261117    gcc-11.5.0
riscv        randconfig-2200-20261117    clang-24   smatch
riscv       randconfig-r2306-20261117    gcc-8.5.0  sparse
s390                      allnoconfig    clang-24
s390                        defconfig    gcc-16.2.0
s390         randconfig-2000-20261117    gcc-13.5.0
s390         randconfig-2000-20261117    gcc-15.3.0
s390         randconfig-2001-20261117    clang-24
s390         randconfig-2001-20261117    gcc-15.3.0
s390         randconfig-2002-20261117    clang-17
s390         randconfig-2002-20261117    gcc-15.3.0
s390         randconfig-2003-20261117    clang-24
s390         randconfig-2003-20261117    gcc-15.3.0
s390         randconfig-2004-20261117    gcc-15.3.0
s390         randconfig-2004-20261117    gcc-8.5.0
s390         randconfig-2005-20261117    gcc-15.3.0
s390         randconfig-2200-20261117    gcc-11.5.0 smatch
s390        randconfig-r2107-20261117    gcc-16.2.0 cocci
sh                        allnoconfig    clang-24
sh           randconfig-2000-20261117    gcc-14.4.0
sh           randconfig-2001-20261117    gcc-14.4.0
sh           randconfig-2002-20261117    gcc-14.4.0
sh           randconfig-2003-20261117    gcc-14.4.0
sh           randconfig-2004-20261117    gcc-14.4.0
sh           randconfig-2005-20261117    gcc-14.4.0
sh           randconfig-2200-20261117    gcc-16.2.0 smatch
sh          randconfig-r2109-20261117    gcc-16.2.0 cocci
sh          randconfig-r2300-20261117    gcc-14.4.0 sparse
sh          randconfig-r2303-20261117    gcc-14.4.0 sparse
sh          randconfig-r2310-20261117    gcc-16.2.0 sparse
sparc                     allnoconfig    clang-24
sparc                       defconfig    gcc-16.2.0
sparc        randconfig-1000-20261119    gcc-13.5.0
sparc        randconfig-1001-20261119    gcc-13.5.0
sparc        randconfig-2000-20261117    gcc-14
sparc        randconfig-2001-20261117    gcc-14
sparc       randconfig-r2108-20261117    gcc-16.2.0 cocci
sparc64      randconfig-1000-20261119    gcc-13.5.0
sparc64      randconfig-1001-20261119    gcc-13.5.0
sparc64      randconfig-2000-20261117    gcc-14
sparc64      randconfig-2001-20261117    gcc-14
sparc64      randconfig-2200-20261117    gcc-8.5.0  smatch
sparc64     randconfig-r2111-20261117    gcc-16.2.0 cocci
sparc64     randconfig-r2311-20261117    clang-22   sparse
um                        allnoconfig    clang-24
um           randconfig-1000-20261119    gcc-13.5.0
um           randconfig-1001-20261119    gcc-13.5.0
um           randconfig-2000-20261117    gcc-14
um           randconfig-2001-20261117    gcc-14
um           randconfig-2200-20261117    clang-21   smatch
x86_64                    allnoconfig    clang-24
x86_64                          kexec    clang-22
x86_64       randconfig-1000-20261119    gcc-14
x86_64       randconfig-1001-20261119    gcc-14
x86_64       randconfig-1002-20261119    gcc-14
x86_64       randconfig-1003-20261119    gcc-14
x86_64       randconfig-1004-20261119    gcc-14
x86_64       randconfig-1005-20261119    gcc-14
x86_64       randconfig-2000-20261117    gcc-14
x86_64       randconfig-2001-20261117    gcc-14
x86_64       randconfig-2002-20261117    gcc-14
x86_64       randconfig-2003-20261117    gcc-14
x86_64       randconfig-2004-20261117    gcc-14
x86_64       randconfig-2005-20261117    gcc-14
x86_64       randconfig-2100-20261117    gcc-14     cocci
x86_64       randconfig-2101-20261117    gcc-14     cocci
x86_64       randconfig-2102-20261117    gcc-14     cocci
x86_64       randconfig-2103-20261117    gcc-14     cocci
x86_64       randconfig-2104-20261117    gcc-14     cocci
x86_64       randconfig-2105-20261117    gcc-14     cocci
x86_64       randconfig-2200-20261117    gcc-14     smatch
x86_64       randconfig-2300-20261117    clang-22   sparse
x86_64       randconfig-2301-20261117    clang-22   sparse
x86_64       randconfig-2302-20261117    clang-22   sparse
x86_64      randconfig-r2102-20261117    gcc-11.5.0 cocci
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                   rhel-9.4-ltp    clang-22
x86_64                  rhel-9.4-rust    clang-22
xtensa                    allnoconfig    clang-24
xtensa       randconfig-1000-20261119    gcc-13.5.0
xtensa       randconfig-1001-20261119    gcc-13.5.0
xtensa       randconfig-2000-20261117    gcc-16.2.0
xtensa       randconfig-2001-20261117    gcc-16.2.0
xtensa       randconfig-2200-20261117    gcc-8.5.0  smatch
xtensa      randconfig-r2311-20261117    clang-24   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

