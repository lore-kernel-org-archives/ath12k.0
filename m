Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220F3CA5FA3
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xaPK/7AxIPahv0/6HYvhWkAzGzlHx1fpKVlLAbOQMRY=; b=c9LQWltnF4agAQ2cEpFix7qs9a
	FUahgcrE+cuxNQ1xYlUgUO5KSvATQGgHd9NgBAf/+IfvhKE9YjVcFcWN7AxPVnv3/5woYoTb+g/Kh
	x65vYXpvlOHM4Q1qb2GdcK5t3zdtWIUdWkwICD2AcJyNiDJRbm/Oc9PElERQBlaO0pWkhgcOGZhE/
	RDAsrLuy3LlN+dKwBO1hOKG4Ms9DSTGRENvJYr10XqKCKP7avqSUwzPtNZv/s1XsOxTM0Jnx10Tno
	oIj22l5gj7M79ASN78D7XbByRWk1m3i+O31Vv+4dOwfrSz3Ib5lWmHTr1SFZw+zpJpI0OG4JKVbzk
	xXmpgXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJ56-00000001gnS-3NUq;
	Mon, 28 Sep 2026 21:40:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJ54-00000001gnE-2oF5
	for ath12k@bombadil.infradead.org;
	Mon, 28 Sep 2026 21:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xaPK/7AxIPahv0/6HYvhWkAzGzlHx1fpKVlLAbOQMRY=; b=n4/yHaOQ9TsNwsN3BdN5TUDokA
	wAMff3PKAjfCu9QK4N/EhTPKDjgnxE1mgRVIWVWm90BpnibUoI9lF4LPH1Wa0PfqGJpNX3mcO36XF
	SixGXSUSE0J8iZPMHrjgeaqgHPTZXU/gibCwhCVeRZOdkYwZnbhjtLj0ITKDdfGsM6+LWr42ccZO1
	q1fUW4n1PAuz2SzhNSJobZNVWx8SOel1XojtHkYUf8ZE7EJ9I2hGjxIjhe16Fl04vxMpCxGixrDRw
	ayUcvgq9+RWAiik8zFgytvX7lPJ7q4Co0MGpBjy+jAjWFc/FX56zMLOK+hfiQs5DduKroj3C7X0nB
	eEY7F4NA==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBJ4p-00000001vRW-2GAC
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 21:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790631599; x=1822167599;
  h=date:from:to:cc:subject:message-id;
  bh=cPH8zxdHUq4Em2HAHTplYvZF3tasr1KCIdPjH3fDPfk=;
  b=ViQqCh4NTNigf2ZOk/vQXz2sH1gk+TOjmmdlgye8na3e8+Xud7NuWVWx
   QIk9LcV1qSjuT4k3IMAECL2dvvzjGMyXLYgvIM00zUCt3TvKmMBxUslUL
   TZueqTpMaeD7lZ304VBcm9Wzl43rOWQZxdfNO9U+wYxE1vYfPeQW9NyLN
   uQOzUgyWgXk2g6l4DCMvoiPfBTTHobcD3RBZyjA8vqluiE478CCkVymIJ
   1657C45wYJqCMnOA8Ll/8HI+2ZJJhN/a9mOVcezunvgCs+EsEtCYGPdvX
   M/ePxMjxmwyNbiYek9zUpj6fZYGVrHxc7z+j2p/7YmU27rwpguwmo8xUQ
   A==;
X-CSE-ConnectionGUID: Zc7bRvjcTmycSi5TufMZbA==
X-CSE-MsgGUID: PsCryTBlTNyGBfXPaTE/Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="113129410"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="113129410"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:39:53 -0700
X-CSE-ConnectionGUID: r27A55BSSRKxDHR8TMRCrQ==
X-CSE-MsgGUID: 3HJHXw5WSzmTP+kN6HexhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="272968325"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2026 14:39:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBJ4f-00000000OX1-3tkR;
	Mon, 28 Sep 2026 21:39:49 +0000
Date: Tue, 29 Sep 2026 05:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 bc5c1311806ff0968e646d5e3215b086ae3f9677
Message-ID: <202609290533.Yp4yJTOF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_224001_399022_96F82C5A 
X-CRM114-Status: UNSURE (   6.44  )
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
branch HEAD: bc5c1311806ff0968e646d5e3215b086ae3f9677  MIPS: generic: Remove undefined image 'ramdisk'

elapsed time: 1317m

configs tested: 328
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2202-20260928    gcc-8.5.0  smatch
alpha                randconfig-r2306-20260928    gcc-13.4.0 sparse
alpha                randconfig-r2307-20260928    gcc-15.2.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                          haps_hs_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260928    clang-24
arc                   randconfig-1001-20260928    clang-24
arc                  randconfig-r2103-20260928    gcc-14.3.0 cocci
arc                  randconfig-r2104-20260927    gcc-11.5.0 cocci
arc                  randconfig-r2107-20260927    gcc-9.5.0  cocci
arc                  randconfig-r2202-20260927    gcc-10.5.0 smatch
arc                  randconfig-r2301-20260928    gcc-12.5.0 sparse
arc                  randconfig-r2308-20260928    gcc-10.5.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                            h3600_defconfig    gcc-16.1.0
arm                             mmp2_defconfig    gcc-16.1.0
arm                         multi_v5_defconfig    gcc-16.1.0
arm                         mvebu_v5_defconfig    clang-24
arm                         neponset_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260928    clang-24
arm                   randconfig-1001-20260928    clang-24
arm                   randconfig-1002-20260928    clang-24
arm                   randconfig-1003-20260928    clang-24
arm                  randconfig-r2309-20260928    clang-17   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260928    gcc-15.2.0
arm64                 randconfig-1001-20260928    gcc-15.2.0
arm64                 randconfig-1002-20260928    gcc-15.2.0
arm64                 randconfig-1003-20260928    gcc-15.2.0
arm64                randconfig-r2104-20260928    gcc-12.5.0 cocci
arm64                randconfig-r2200-20260927    clang-24   smatch
arm64                randconfig-r2305-20260928    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260928    gcc-15.2.0
csky                  randconfig-1001-20260928    gcc-15.2.0
csky                 randconfig-r2105-20260927    gcc-11.5.0 cocci
csky                 randconfig-r2107-20260928    gcc-12.5.0 cocci
csky                 randconfig-r2304-20260928    gcc-16.1.0 sparse
csky                 randconfig-r2306-20260928    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260928    gcc-8.5.0
hexagon               randconfig-1001-20260928    gcc-8.5.0
hexagon              randconfig-r2201-20260927    clang-24   smatch
hexagon              randconfig-r2306-20260928    gcc-16.1.0 sparse
hexagon              randconfig-r2308-20260928    gcc-16.1.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260928    clang-22
i386        buildonly-randconfig-1001-20260928    clang-22
i386        buildonly-randconfig-1002-20260928    clang-22
i386        buildonly-randconfig-1003-20260928    clang-22
i386        buildonly-randconfig-1004-20260928    clang-22
i386        buildonly-randconfig-1005-20260928    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260928    gcc-14
i386                  randconfig-1001-20260928    gcc-14
i386                  randconfig-1002-20260928    gcc-14
i386                  randconfig-1003-20260928    gcc-14
i386                  randconfig-1004-20260928    gcc-14
i386                  randconfig-1005-20260928    gcc-14
i386                  randconfig-1006-20260928    gcc-14
i386                  randconfig-1007-20260928    clang-22
i386                  randconfig-1008-20260928    clang-22
i386                  randconfig-1009-20260928    clang-22
i386                  randconfig-1010-20260928    clang-22
i386                  randconfig-1011-20260928    clang-22
i386                  randconfig-1012-20260928    clang-22
i386                  randconfig-1013-20260928    clang-22
i386                  randconfig-2100-20260927    clang-22   cocci
i386                  randconfig-2100-20260928    gcc-14     cocci
i386                  randconfig-2101-20260927    clang-22   cocci
i386                  randconfig-2101-20260928    gcc-14     cocci
i386                  randconfig-2102-20260927    clang-22   cocci
i386                  randconfig-2102-20260928    gcc-14     cocci
i386                  randconfig-2103-20260927    clang-22   cocci
i386                  randconfig-2103-20260928    gcc-14     cocci
i386                  randconfig-2200-20260928    clang-22   smatch
i386                  randconfig-2300-20260927    clang-22   sparse
i386                  randconfig-2300-20260928    clang-22   sparse
i386                  randconfig-2300-20260928    gcc-14     sparse
i386                  randconfig-2301-20260927    clang-22   sparse
i386                  randconfig-2301-20260928    clang-22   sparse
i386                  randconfig-2301-20260928    gcc-12     sparse
i386                  randconfig-2302-20260927    clang-22   sparse
i386                  randconfig-2302-20260928    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260928    gcc-8.5.0
loongarch             randconfig-1001-20260928    gcc-8.5.0
loongarch            randconfig-r2105-20260927    clang-24   cocci
loongarch            randconfig-r2303-20260928    clang-18   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2102-20260928    clang-17   cocci
m68k                 randconfig-r2309-20260928    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20260928    gcc-8.5.0  cocci
microblaze           randconfig-r2102-20260928    gcc-8.5.0  cocci
microblaze           randconfig-r2307-20260928    gcc-11.5.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       bmips_stb_defconfig    gcc-16.1.0
mips                       fuloong2e_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                         omega2p_defconfig    gcc-16.1.0
mips                 randconfig-r2106-20260928    gcc-12.5.0 cocci
mips                 randconfig-r2304-20260928    gcc-10.5.0 sparse
nios2                          3c120_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260928    gcc-8.5.0
nios2                 randconfig-1001-20260928    gcc-8.5.0
nios2                randconfig-r2307-20260928    gcc-16.1.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20260928    clang-17   cocci
openrisc             randconfig-r2201-20260928    gcc-11.5.0 smatch
openrisc             randconfig-r2300-20260928    gcc-10.5.0 sparse
openrisc             randconfig-r2309-20260928    gcc-16.1.0 sparse
parisc                            alldefconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260928    clang-24
parisc                randconfig-1000-20260929    gcc-8.5.0
parisc                randconfig-1001-20260928    clang-24
parisc                randconfig-1001-20260929    gcc-8.5.0
parisc               randconfig-r2100-20260928    gcc-8.5.0  cocci
parisc               randconfig-r2105-20260928    gcc-12.5.0 cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                         cell_defconfig    gcc-16.1.0
powerpc                    currituck_defconfig    gcc-16.1.0
powerpc                  linkstation_defconfig    clang-24
powerpc                  mpc834x_itx_defconfig    clang-24
powerpc                      rainier_defconfig    clang-24
powerpc               randconfig-1000-20260928    clang-24
powerpc               randconfig-1000-20260929    gcc-8.5.0
powerpc               randconfig-1001-20260928    clang-24
powerpc               randconfig-1001-20260929    gcc-8.5.0
powerpc              randconfig-r2101-20260928    gcc-10.5.0 cocci
powerpc              randconfig-r2106-20260927    clang-17   cocci
powerpc              randconfig-r2201-20260927    clang-24   smatch
powerpc              randconfig-r2303-20260928    gcc-16.1.0 sparse
powerpc              randconfig-r2308-20260928    clang-21   sparse
powerpc                      redwood_defconfig    gcc-16.1.0
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260928    clang-24
powerpc64             randconfig-1000-20260929    gcc-8.5.0
powerpc64             randconfig-1001-20260928    clang-24
powerpc64             randconfig-1001-20260929    gcc-8.5.0
powerpc64            randconfig-r2100-20260928    clang-17   cocci
powerpc64            randconfig-r2301-20260928    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260928    clang-24
riscv                 randconfig-1001-20260928    clang-24
riscv                 randconfig-2000-20260927    clang-24
riscv                 randconfig-2000-20260928    gcc-8.5.0
riscv                 randconfig-2001-20260927    gcc-11.5.0
riscv                 randconfig-2001-20260928    gcc-8.5.0
riscv                randconfig-r2103-20260928    clang-17   cocci
riscv                randconfig-r2200-20260927    clang-24   smatch
s390                              alldefconfig    gcc-16.1.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260928    clang-24
s390                  randconfig-1001-20260928    clang-24
s390                  randconfig-2000-20260927    clang-24
s390                  randconfig-2000-20260928    gcc-8.5.0
s390                  randconfig-2001-20260927    gcc-15.2.0
s390                  randconfig-2001-20260928    gcc-8.5.0
s390                 randconfig-r2305-20260928    gcc-8.5.0  sparse
s390                        zfcpdump_defconfig    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    clang-24
sh                             hp6xx_defconfig    gcc-16.1.0
sh                           lboxre2_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260928    clang-24
sh                    randconfig-1001-20260928    clang-24
sh                    randconfig-2000-20260927    gcc-12.5.0
sh                    randconfig-2000-20260928    gcc-8.5.0
sh                    randconfig-2001-20260927    gcc-14.3.0
sh                    randconfig-2001-20260928    gcc-8.5.0
sh                   randconfig-r2202-20260927    gcc-9.5.0  smatch
sh                    rts7751r2dplus_defconfig    gcc-16.1.0
sh                            se7206_defconfig    gcc-16.1.0
sh                    sh7770_generic_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260928    clang-17
sparc                 randconfig-1001-20260928    clang-17
sparc                 randconfig-2000-20260927    gcc-16.1.0
sparc                 randconfig-2000-20260928    gcc-13.4.0
sparc                 randconfig-2001-20260927    gcc-16.1.0
sparc                 randconfig-2001-20260928    gcc-13.4.0
sparc                randconfig-r2302-20260928    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260928    clang-17
sparc64               randconfig-1001-20260928    clang-17
sparc64               randconfig-2000-20260927    clang-24
sparc64               randconfig-2000-20260928    gcc-13.4.0
sparc64               randconfig-2001-20260927    clang-20
sparc64               randconfig-2001-20260928    gcc-13.4.0
sparc64              randconfig-r2102-20260928    clang-20   cocci
sparc64              randconfig-r2103-20260928    gcc-16.1.0 cocci
sparc64              randconfig-r2104-20260927    clang-24   cocci
sparc64              randconfig-r2107-20260927    clang-24   cocci
sparc64              randconfig-r2200-20260928    gcc-11.5.0 smatch
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260928    clang-17
um                    randconfig-1001-20260928    clang-17
um                    randconfig-2000-20260927    gcc-14
um                    randconfig-2000-20260928    gcc-13.4.0
um                    randconfig-2001-20260927    clang-22
um                    randconfig-2001-20260928    gcc-13.4.0
um                   randconfig-r2106-20260927    gcc-14     cocci
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.1.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260928    gcc-14
x86_64      buildonly-randconfig-1001-20260928    gcc-14
x86_64      buildonly-randconfig-1002-20260928    gcc-14
x86_64      buildonly-randconfig-1003-20260928    gcc-14
x86_64      buildonly-randconfig-1004-20260928    gcc-14
x86_64      buildonly-randconfig-1005-20260928    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260928    gcc-14
x86_64                randconfig-1001-20260928    gcc-14
x86_64                randconfig-1002-20260928    gcc-14
x86_64                randconfig-1003-20260928    gcc-14
x86_64                randconfig-1004-20260928    gcc-14
x86_64                randconfig-1005-20260928    gcc-14
x86_64                randconfig-1006-20260928    gcc-14
x86_64                randconfig-1007-20260928    gcc-14
x86_64                randconfig-1008-20260928    gcc-14
x86_64                randconfig-1009-20260928    gcc-14
x86_64                randconfig-1010-20260928    gcc-14
x86_64                randconfig-1011-20260928    gcc-14
x86_64                randconfig-1012-20260928    clang-22
x86_64                randconfig-1013-20260928    clang-22
x86_64                randconfig-1014-20260928    clang-22
x86_64                randconfig-1015-20260928    clang-22
x86_64                randconfig-1016-20260928    clang-22
x86_64                randconfig-1017-20260928    clang-22
x86_64                randconfig-2100-20260927    clang-22   cocci
x86_64                randconfig-2100-20260928    gcc-12     cocci
x86_64                randconfig-2101-20260927    clang-22   cocci
x86_64                randconfig-2101-20260928    gcc-12     cocci
x86_64                randconfig-2102-20260927    gcc-14     cocci
x86_64                randconfig-2102-20260928    gcc-12     cocci
x86_64                randconfig-2103-20260927    clang-22   cocci
x86_64                randconfig-2103-20260928    gcc-12     cocci
x86_64                randconfig-2200-20260927    gcc-14     smatch
x86_64                randconfig-2200-20260928    gcc-14     smatch
x86_64                randconfig-2300-20260927    gcc-14     sparse
x86_64                randconfig-2300-20260928    clang-22   sparse
x86_64                randconfig-2300-20260928    gcc-14     sparse
x86_64                randconfig-2301-20260927    gcc-14     sparse
x86_64                randconfig-2301-20260928    clang-22   sparse
x86_64                randconfig-2301-20260928    gcc-14     sparse
x86_64                randconfig-2302-20260927    gcc-13     sparse
x86_64                randconfig-2302-20260928    clang-22   sparse
x86_64               randconfig-r2300-20260928    gcc-14     sparse
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
xtensa                randconfig-1000-20260928    clang-17
xtensa                randconfig-1001-20260928    clang-17
xtensa                randconfig-2000-20260927    gcc-8.5.0
xtensa                randconfig-2000-20260928    gcc-13.4.0
xtensa                randconfig-2001-20260927    gcc-16.1.0
xtensa                randconfig-2001-20260928    gcc-13.4.0
xtensa               randconfig-r2101-20260928    gcc-14.3.0 cocci
xtensa               randconfig-r2302-20260928    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

