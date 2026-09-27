Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8577C9830E
	for <ath12k@archiver.kernel.org>; Sun, 27 Sep 2026 06:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fCGjL0NFfGJrRcx8UD2PRER19ZZU9sv3qPCRtgrHQo4=; b=agEozdoJ/LRdLB5756AedHSZLf
	0C4u47SAGNvqTRJH1K5RqbmC5wQfty4/2K7bILbgs9G4BjL3jbNybFCIPyHmmIFVMF6E192JBjedb
	M27WzMb9JTcBpV5/QgU91k0PfKSn23dH6AYT9KNa+8krCOiuiYsXpz6uMPfzPq5ryHQ2tdiSBtoVc
	WldQfWMdI6knDwTrNvJu2b7agQas0ANpNG3Y1Yrbhe/hHKAlNYJ8pIr0BHLhLTyQwyDZpWillcqHx
	xAhR83Bt/rv3ioPG6FuAw+rqPK1KkykncBapartxwhVjNPbRZY8ejHbAgrmAxhecm+tDwjoEmb3Ce
	muQoyqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAimT-0000000G55F-2bVF;
	Sun, 27 Sep 2026 06:54:37 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAimQ-0000000G54s-2e2i
	for ath12k@lists.infradead.org;
	Sun, 27 Sep 2026 06:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790492074; x=1822028074;
  h=date:from:to:cc:subject:message-id;
  bh=9lOc9ocm6GKnT5nlDma/NyLDvYSWWaG6lSbbnydT+aY=;
  b=DkCFpfZa+tbs3+bJwWQDbkrTb6OTT/Rp54KCaG44ZuNvdZkugB5HhaWk
   3OHeaJQFyrAjrgR0zjOTxA7IP0AtmHoJ04HaeyX6O8RHIIkwrkyY7XD4B
   mGWdRr9PvNQjn1vbOOAZ0IfLZ4uUmIE3Zah6Zf9hSRX8sIS5yeLgYQHHm
   hQ5cegaXzoDQW9bTKSzu9/wYBepdKACsrstcMa+lURSuiZ81FSSwrCqzr
   HwhxQ6aPdLMcTUWkEhUwMbkGmTakaNplzyWfvaMrVzZ6R43Ox1meXoG5N
   fJUtt/Vr73E6rVVoAO4K+vbvANS2FDTydVVccoK31y4+C/6Gk37gP48uL
   w==;
X-CSE-ConnectionGUID: tCxDzRmYSOiRJOMsZWpI/Q==
X-CSE-MsgGUID: mo/16jjQT+iqD2w8xByOwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="91080057"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="91080057"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 23:54:34 -0700
X-CSE-ConnectionGUID: XGBSP+OESKSkkRoN0OAMfQ==
X-CSE-MsgGUID: 19TIAds8QJCi8oR5cuei7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="279471371"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2026 23:54:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAimM-00000000Ma1-2UsL;
	Sun, 27 Sep 2026 06:54:30 +0000
Date: Sun, 27 Sep 2026 14:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main-pending] BUILD SUCCESS
 40bd67512c4f311288ee7cd102d02ac7e99c0b04
Message-ID: <202609271420.neTwgraE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_235435_026638_908A8A8D 
X-CRM114-Status: UNSURE (   4.08  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-pending
branch HEAD: 40bd67512c4f311288ee7cd102d02ac7e99c0b04  Merge branch 'pending' into main-pending

elapsed time: 3759m

configs tested: 306
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2201-20260925    gcc-13.4.0 smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260926    clang-24
arc                   randconfig-1001-20260926    clang-24
arc                  randconfig-r1301-20260926    gcc-9.5.0  sparse
arc                  randconfig-r2101-20260925    gcc-9.5.0  cocci
arc                  randconfig-r2107-20260925    gcc-16.1.0 cocci
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             hisi_defconfig    clang-24
arm                       jornada720_defconfig    clang-24
arm                         keystone_defconfig    clang-24
arm                         keystone_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260926    clang-24
arm                   randconfig-1001-20260926    clang-24
arm                   randconfig-1002-20260926    clang-24
arm                   randconfig-1003-20260926    clang-24
arm                  randconfig-r1307-20260926    gcc-8.5.0  sparse
arm                  randconfig-r2202-20260924    gcc-8.5.0  smatch
arm                           sp7021_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260926    gcc-8.5.0
arm64                 randconfig-1001-20260926    gcc-8.5.0
arm64                 randconfig-1002-20260926    gcc-8.5.0
arm64                 randconfig-1003-20260926    gcc-8.5.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260926    gcc-8.5.0
csky                  randconfig-1001-20260926    gcc-8.5.0
csky                 randconfig-r1302-20260926    gcc-13.4.0 sparse
csky                 randconfig-r1302-20260926    gcc-9.5.0  sparse
csky                 randconfig-r1309-20260926    gcc-16.1.0 sparse
csky                 randconfig-r2106-20260925    gcc-11.5.0 cocci
csky                 randconfig-r2200-20260925    gcc-10.5.0 smatch
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260926    gcc-10.5.0
hexagon               randconfig-1001-20260926    gcc-10.5.0
hexagon              randconfig-r2100-20260925    clang-19   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260926    gcc-14
i386        buildonly-randconfig-1001-20260926    gcc-14
i386        buildonly-randconfig-1002-20260926    gcc-14
i386        buildonly-randconfig-1003-20260926    gcc-14
i386        buildonly-randconfig-1004-20260926    gcc-14
i386        buildonly-randconfig-1005-20260926    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260926    gcc-14
i386                  randconfig-1000-20260927    clang-22
i386                  randconfig-1001-20260926    gcc-14
i386                  randconfig-1001-20260927    clang-22
i386                  randconfig-1002-20260926    gcc-14
i386                  randconfig-1002-20260927    clang-22
i386                  randconfig-1003-20260926    gcc-14
i386                  randconfig-1003-20260927    clang-22
i386                  randconfig-1004-20260926    gcc-14
i386                  randconfig-1004-20260927    clang-22
i386                  randconfig-1005-20260926    gcc-14
i386                  randconfig-1005-20260927    clang-22
i386                  randconfig-1006-20260926    gcc-14
i386                  randconfig-1006-20260927    clang-22
i386                  randconfig-1007-20260926    gcc-14
i386                  randconfig-1008-20260926    gcc-14
i386                  randconfig-1009-20260926    gcc-14
i386                  randconfig-1010-20260926    gcc-14
i386                  randconfig-1011-20260926    gcc-14
i386                  randconfig-1012-20260926    gcc-14
i386                  randconfig-1013-20260926    gcc-14
i386                  randconfig-1300-20260926    gcc-13     sparse
i386                  randconfig-1301-20260926    gcc-13     sparse
i386                  randconfig-1302-20260926    gcc-13     sparse
i386                  randconfig-2100-20260925    clang-22   cocci
i386                  randconfig-2100-20260925    gcc-14     cocci
i386                  randconfig-2101-20260925    clang-22   cocci
i386                  randconfig-2102-20260925    clang-22   cocci
i386                  randconfig-2103-20260925    clang-22   cocci
i386                  randconfig-2200-20260925    gcc-14     smatch
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260926    gcc-10.5.0
loongarch             randconfig-1001-20260926    gcc-10.5.0
loongarch            randconfig-r1309-20260926    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                       m54418evb_defconfig    gcc-16.1.0
m68k                             q40_defconfig    gcc-16.1.0
m68k                 randconfig-r1305-20260926    gcc-9.5.0  sparse
m68k                 randconfig-r1308-20260926    gcc-16.1.0 sparse
m68k                            sun3_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                   cavium_octeon_defconfig    gcc-16.1.0
mips                            ci20_defconfig    clang-24
mips                          cobalt_defconfig    gcc-16.1.0
mips                 econet_en751221_defconfig    gcc-16.1.0
mips                      loongson2k_defconfig    gcc-16.1.0
mips                 malta_qemu_32r6_defconfig    gcc-16.1.0
mips                       maltasmvp_defconfig    gcc-16.1.0
nios2                             alldefconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260926    gcc-10.5.0
nios2                 randconfig-1001-20260926    gcc-10.5.0
nios2                randconfig-r1305-20260926    gcc-13.4.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r1308-20260926    gcc-8.5.0  sparse
openrisc             randconfig-r2103-20260925    gcc-15.2.0 cocci
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260926    clang-24
parisc                randconfig-1001-20260926    clang-24
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                    currituck_defconfig    gcc-16.1.0
powerpc                     ge_imp3a_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260926    clang-24
powerpc               randconfig-1001-20260926    clang-24
powerpc64             randconfig-1000-20260926    clang-24
powerpc64             randconfig-1001-20260926    clang-24
powerpc64            randconfig-r1306-20260926    gcc-16.1.0 sparse
powerpc64            randconfig-r2101-20260925    clang-24   cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260926    gcc-9.5.0
riscv                 randconfig-1000-20260927    gcc-16.1.0
riscv                 randconfig-1001-20260926    gcc-9.5.0
riscv                 randconfig-1001-20260927    gcc-16.1.0
riscv                 randconfig-2000-20260925    gcc-11.5.0
riscv                 randconfig-2001-20260925    gcc-11.5.0
riscv                 randconfig-2001-20260925    gcc-9.5.0
riscv                randconfig-r1301-20260926    gcc-13.4.0 sparse
riscv                randconfig-r2104-20260925    gcc-9.5.0  cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260926    gcc-9.5.0
s390                  randconfig-1000-20260927    gcc-16.1.0
s390                  randconfig-1001-20260926    gcc-9.5.0
s390                  randconfig-1001-20260927    gcc-16.1.0
s390                  randconfig-2000-20260925    gcc-11.5.0
s390                  randconfig-2000-20260925    gcc-8.5.0
s390                  randconfig-2001-20260925    clang-24
s390                  randconfig-2001-20260925    gcc-11.5.0
s390                 randconfig-r2103-20260925    gcc-9.5.0  cocci
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.1.0
sh                          apsh4a3a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                             hp6xx_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260926    gcc-9.5.0
sh                    randconfig-1000-20260927    gcc-16.1.0
sh                    randconfig-1001-20260926    gcc-9.5.0
sh                    randconfig-1001-20260927    gcc-16.1.0
sh                    randconfig-2000-20260925    gcc-11.5.0
sh                    randconfig-2000-20260925    gcc-14.3.0
sh                    randconfig-2001-20260925    gcc-11.5.0
sh                    randconfig-2001-20260925    gcc-16.1.0
sh                   randconfig-r1303-20260926    gcc-9.5.0  sparse
sh                   randconfig-r2100-20260925    gcc-9.5.0  cocci
sh                   randconfig-r2104-20260925    gcc-16.1.0 cocci
sh                   randconfig-r2105-20260925    gcc-16.1.0 cocci
sh                           sdk7780_defconfig    gcc-16.1.0
sh                              sh03_defconfig    gcc-16.1.0
sh                           urquell_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260926    gcc-14
sparc                 randconfig-1001-20260926    gcc-14
sparc                 randconfig-2000-20260925    gcc-14.3.0
sparc                 randconfig-2000-20260925    gcc-16.1.0
sparc                 randconfig-2001-20260925    gcc-16.1.0
sparc                randconfig-r1303-20260926    gcc-13.4.0 sparse
sparc                randconfig-r1306-20260926    gcc-8.5.0  sparse
sparc                randconfig-r1307-20260926    gcc-16.1.0 sparse
sparc                randconfig-r2105-20260925    gcc-16.1.0 cocci
sparc                randconfig-r2106-20260925    gcc-16.1.0 cocci
sparc                randconfig-r2202-20260925    gcc-15.2.0 smatch
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260926    gcc-14
sparc64               randconfig-1001-20260926    gcc-14
sparc64               randconfig-2000-20260925    gcc-15.2.0
sparc64               randconfig-2000-20260925    gcc-16.1.0
sparc64               randconfig-2001-20260925    clang-20
sparc64               randconfig-2001-20260925    gcc-16.1.0
sparc64              randconfig-r1300-20260926    gcc-9.5.0  sparse
sparc64              randconfig-r1304-20260926    gcc-13.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260926    gcc-14
um                    randconfig-1001-20260926    gcc-14
um                    randconfig-2000-20260925    gcc-14
um                    randconfig-2000-20260925    gcc-16.1.0
um                    randconfig-2001-20260925    gcc-14
um                    randconfig-2001-20260925    gcc-16.1.0
um                   randconfig-r1304-20260926    gcc-9.5.0  sparse
um                   randconfig-r2107-20260925    clang-24   cocci
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260926    gcc-14
x86_64      buildonly-randconfig-1000-20260927    gcc-14
x86_64      buildonly-randconfig-1001-20260926    gcc-14
x86_64      buildonly-randconfig-1001-20260927    gcc-14
x86_64      buildonly-randconfig-1002-20260926    gcc-14
x86_64      buildonly-randconfig-1002-20260927    gcc-14
x86_64      buildonly-randconfig-1003-20260926    gcc-14
x86_64      buildonly-randconfig-1003-20260927    gcc-14
x86_64      buildonly-randconfig-1004-20260926    gcc-14
x86_64      buildonly-randconfig-1004-20260927    gcc-14
x86_64      buildonly-randconfig-1005-20260926    gcc-14
x86_64      buildonly-randconfig-1005-20260927    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260926    gcc-14
x86_64                randconfig-1001-20260926    gcc-14
x86_64                randconfig-1002-20260926    gcc-14
x86_64                randconfig-1003-20260926    gcc-14
x86_64                randconfig-1004-20260926    gcc-14
x86_64                randconfig-1005-20260926    gcc-14
x86_64                randconfig-1006-20260926    gcc-14
x86_64                randconfig-1007-20260926    gcc-14
x86_64                randconfig-1008-20260926    gcc-14
x86_64                randconfig-1009-20260926    gcc-14
x86_64                randconfig-1010-20260926    gcc-14
x86_64                randconfig-1011-20260926    gcc-14
x86_64                randconfig-1012-20260926    clang-22
x86_64                randconfig-1012-20260927    clang-22
x86_64                randconfig-1013-20260926    clang-22
x86_64                randconfig-1013-20260927    clang-22
x86_64                randconfig-1014-20260926    clang-22
x86_64                randconfig-1014-20260927    clang-22
x86_64                randconfig-1015-20260926    clang-22
x86_64                randconfig-1015-20260927    clang-22
x86_64                randconfig-1016-20260926    clang-22
x86_64                randconfig-1016-20260927    clang-22
x86_64                randconfig-1017-20260926    clang-22
x86_64                randconfig-1017-20260927    clang-22
x86_64                randconfig-1300-20260926    gcc-13     sparse
x86_64                randconfig-1301-20260926    gcc-13     sparse
x86_64                randconfig-1302-20260926    gcc-13     sparse
x86_64                randconfig-2100-20260925    clang-22   cocci
x86_64                randconfig-2100-20260925    gcc-14     cocci
x86_64                randconfig-2101-20260925    clang-22   cocci
x86_64                randconfig-2102-20260925    clang-22   cocci
x86_64                randconfig-2103-20260925    clang-22   cocci
x86_64                randconfig-2200-20260925    gcc-14     smatch
x86_64               randconfig-r2102-20260925    clang-22   cocci
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
xtensa                randconfig-1000-20260926    gcc-14
xtensa                randconfig-1001-20260926    gcc-14
xtensa                randconfig-2000-20260925    gcc-12.5.0
xtensa                randconfig-2000-20260925    gcc-16.1.0
xtensa                randconfig-2001-20260925    gcc-16.1.0
xtensa                randconfig-2001-20260925    gcc-8.5.0
xtensa               randconfig-r1300-20260926    gcc-13.4.0 sparse
xtensa               randconfig-r2102-20260925    gcc-9.5.0  cocci
xtensa                     xip_kc705_defconfig    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

