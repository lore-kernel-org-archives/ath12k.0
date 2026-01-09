Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB12D26D7A
	for <ath12k@archiver.kernel.org>; Fri,  9 Jan 2026 17:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Kv4vJxR37w8Qqz53Xxz7Y5dXBJWHivqj1W+2YcyYEc=; b=rRT8r67tRgHlllP46QOc+02I1/
	YklLl1wdRu2kxEVtY4OkxAxSqfwf+z0NbdtDB+rR2UZZmtc9ScN5LINQlKkTXXTWe9Z21mI2R4Gar
	xK9QTVoqfF6d54PQfn8EGXj6PW4Ri8T9IpQU8GqGDp42SJ+8TEI/YwDjX+GN0xn9UFu6GH4JERj3i
	hrTBBWHQabskEA5zrfmS6qqW2u8cv/uvEDcF/sGu+LwG/S2iG8Nno+FELJ2WKpQCRyj/fe0XUQwF+
	JiVz3sRGiDnWgxuf/Oqf0+KTsXA1E5YJghjJgJ3iz5xB00wFpkVdXpaoTtoCG7k827zmcRPcIS+Mx
	1AF6r9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGcE-00000002qxA-1AXa;
	Fri, 09 Jan 2026 17:49:38 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGcB-00000002qwN-20ea
	for ath12k@lists.infradead.org;
	Fri, 09 Jan 2026 17:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767980975; x=1799516975;
  h=date:from:to:cc:subject:message-id;
  bh=OWKLQZIPQ0wjvvqLsUkngAa4oGGGgTUnnTS9mRZNvLY=;
  b=IaNYSZTw1eNhblHvGVF+DR/Sons+GiymTDkSztyLcovMPWnKLgx+uf9P
   o9dLaDxZtvQsvWnapY2tUsHwR/lY3uOn795fui+QCgaN4BEKH6CIYd7wS
   p6OO36YBo6x4pXgEz4HUo5J2JKm3NcEJWKcUCSOh5x2LDmrZJeHWjBjrZ
   FBTkeS8PuadSr2MRrciT8htBwdx80vwhTskU+D1KMr3+01gTfcweOaYjq
   sjwVJzWnp4SJapU0yAMJdzPgRnFVplgzARcBVhUYRlksfaAwxROOcqUsv
   OjIxTXPi+BO58w+FFLWZexvpberEPgyat/an4qPrke9BsBVcQwjpP94Or
   A==;
X-CSE-ConnectionGUID: ppUYS8NsTvq67CQRZ/a+ZA==
X-CSE-MsgGUID: 7u5MaomQT82M2yEKS3Fovg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68369863"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="68369863"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 09:49:33 -0800
X-CSE-ConnectionGUID: l9g2vbPnR3iqrUU08VwvRg==
X-CSE-MsgGUID: 3Ci924h0S+mJMirWJiSjkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="208007693"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jan 2026 09:49:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veGc5-000000007Zs-41xJ;
	Fri, 09 Jan 2026 17:49:29 +0000
Date: Sat, 10 Jan 2026 01:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 d66676e6ca96bf8680f869a9bd6573b26c634622
Message-ID: <202601100153.EZNoxESO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_094935_531932_BCAC6952 
X-CRM114-Status: UNSURE (   4.15  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: d66676e6ca96bf8680f869a9bd6573b26c634622  wifi: libertas: fix WARNING in usb_tx_block

elapsed time: 1697m

configs tested: 139
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260109    gcc-13.4.0
arc                   randconfig-002-20260109    gcc-13.4.0
arm                               allnoconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260109    gcc-13.4.0
arm                   randconfig-002-20260109    gcc-13.4.0
arm                   randconfig-003-20260109    gcc-13.4.0
arm                   randconfig-004-20260109    gcc-13.4.0
arm                           spitz_defconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260109    gcc-8.5.0
arm64                 randconfig-002-20260109    gcc-8.5.0
arm64                 randconfig-003-20260109    gcc-8.5.0
arm64                 randconfig-004-20260109    gcc-8.5.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260109    gcc-8.5.0
csky                  randconfig-002-20260109    gcc-8.5.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260109    gcc-8.5.0
hexagon               randconfig-002-20260109    gcc-8.5.0
i386                              allnoconfig    gcc-15.2.0
i386        buildonly-randconfig-001-20260109    clang-20
i386        buildonly-randconfig-002-20260109    clang-20
i386        buildonly-randconfig-003-20260109    clang-20
i386        buildonly-randconfig-004-20260109    clang-20
i386        buildonly-randconfig-005-20260109    clang-20
i386        buildonly-randconfig-006-20260109    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260109    gcc-14
i386                  randconfig-002-20260109    gcc-14
i386                  randconfig-003-20260109    gcc-14
i386                  randconfig-004-20260109    gcc-14
i386                  randconfig-005-20260109    gcc-14
i386                  randconfig-006-20260109    gcc-14
i386                  randconfig-007-20260109    gcc-14
i386                  randconfig-011-20260109    clang-20
i386                  randconfig-012-20260109    clang-20
i386                  randconfig-013-20260109    clang-20
i386                  randconfig-014-20260109    clang-20
i386                  randconfig-015-20260109    clang-20
i386                  randconfig-016-20260109    clang-20
i386                  randconfig-017-20260109    clang-20
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260109    gcc-8.5.0
loongarch             randconfig-002-20260109    gcc-8.5.0
m68k                              allnoconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                           sun3_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.2.0
mips                     decstation_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260109    gcc-8.5.0
nios2                 randconfig-002-20260109    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260109    gcc-8.5.0
parisc                randconfig-002-20260109    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc               randconfig-001-20260109    gcc-8.5.0
powerpc               randconfig-002-20260109    gcc-8.5.0
powerpc                      tqm8xx_defconfig    clang-22
powerpc64             randconfig-001-20260109    gcc-8.5.0
powerpc64             randconfig-002-20260109    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260109    clang-22
riscv                 randconfig-002-20260109    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260109    clang-22
s390                  randconfig-002-20260109    clang-22
s390                       zfcpdump_defconfig    clang-22
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    clang-22
sh                    randconfig-001-20260109    clang-22
sh                    randconfig-002-20260109    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260109    gcc-14.3.0
sparc                 randconfig-002-20260109    gcc-14.3.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260109    gcc-14.3.0
sparc64               randconfig-002-20260109    gcc-14.3.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260109    gcc-14.3.0
um                    randconfig-002-20260109    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260109    gcc-14
x86_64      buildonly-randconfig-002-20260109    gcc-14
x86_64      buildonly-randconfig-003-20260109    gcc-14
x86_64      buildonly-randconfig-004-20260109    gcc-14
x86_64      buildonly-randconfig-005-20260109    gcc-14
x86_64      buildonly-randconfig-006-20260109    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260109    gcc-14
x86_64                randconfig-002-20260109    gcc-14
x86_64                randconfig-003-20260109    gcc-14
x86_64                randconfig-004-20260109    gcc-14
x86_64                randconfig-005-20260109    gcc-14
x86_64                randconfig-006-20260109    gcc-14
x86_64                randconfig-011-20260109    gcc-14
x86_64                randconfig-012-20260109    gcc-14
x86_64                randconfig-013-20260109    gcc-14
x86_64                randconfig-014-20260109    gcc-14
x86_64                randconfig-015-20260109    gcc-14
x86_64                randconfig-016-20260109    gcc-14
x86_64                randconfig-071-20260109    clang-20
x86_64                randconfig-072-20260109    clang-20
x86_64                randconfig-073-20260109    clang-20
x86_64                randconfig-074-20260109    clang-20
x86_64                randconfig-075-20260109    clang-20
x86_64                randconfig-076-20260109    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260109    gcc-14.3.0
xtensa                randconfig-002-20260109    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

