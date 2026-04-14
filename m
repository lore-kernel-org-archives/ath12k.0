Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9A6F531F6
	for <ath12k@archiver.kernel.org>; Tue, 14 Apr 2026 07:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s8VDTbgYgCOz1fx5VCYeV1RF4IpzvMEw+X5TFmE/wgk=; b=mbc1DWBuxuXduDto8CDARoIe95
	Gl1840781Y2B/RgMsGWgzAwXFYSFoSHcz/sCZXSiCn+RRVD53XoXwYei9knMFsjxLre1r4wowTEe5
	oi8d87sMeFuX2kogSx1bfCDV28qsKpLBoOM9cXh4Nj9A04NF0sZ+lIbQ4TOaezT7xQJRRUj0ZKH/k
	FYq27tRAe4PSjgRrhc6uDVdo5KbKNxm7cqDyRGF8PfpoI0l6dLjaKVUnIyz3dAVt1NB3KttngfR7B
	yK5D8cf+ybB50sUcjDS8znVGO6PuVSSehRrETaJzbLRMtEW1/p+s/rPpJEyaHDCJvO4FZ8c/Q3Q/q
	xv3avzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXor-0000000GsTx-3OJF;
	Tue, 14 Apr 2026 07:04:21 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXop-0000000GsTd-0z5g
	for ath12k@lists.infradead.org;
	Tue, 14 Apr 2026 07:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776150259; x=1807686259;
  h=date:from:to:cc:subject:message-id;
  bh=tAtt2UKgtJpqbaEPi6Bq4vlXkb/uUSzZL3iXUCN0vWo=;
  b=SXrNQxICA70UmijbKV9QntS7pdYH6V29JXNFQL0Brx7lZauVZ7WZP8Jz
   sazXQekqfazYb2ulGgzVjCgsIXQEMwILsvheRojEV3AUebR+RytEzUih0
   VvE1c2dEPiLsRc8QQuTh9Kd88APPEnDO8/BhCTINRubKaig1qTa6JsL/n
   8xZxA2qCljFM2UGg2H0urps8eMR1fSGGwgx0l8SPd0f+eKsThTH4ai1BT
   WflgOH5btlrrzVeBknABLvCtHMTTGW+5rA4OMnIPcaQifR8bQJqj6TWSH
   uVl1ZyDLZegbmO/BKAU49+s+qDR4dIcfzf4EHeLECTk0i6SM+mq5/puMM
   g==;
X-CSE-ConnectionGUID: zF8WcNdJRbmDyJ0ZqrXjhQ==
X-CSE-MsgGUID: f+UqLYEyTWKUrT4qNC/f4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64632765"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="64632765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:04:15 -0700
X-CSE-ConnectionGUID: B0QscgheSRK9HkXAzVCimg==
X-CSE-MsgGUID: 1nt3CfS0R4K/M4V+Ab5Q8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253405686"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Apr 2026 00:04:14 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCXoh-000000001DJ-3pQ1;
	Tue, 14 Apr 2026 07:04:11 +0000
Date: Tue, 14 Apr 2026 15:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 e6630ad4c58f89ba72e64fca5989ecf1e06319c9
Message-ID: <202604141541.AOEJs3kp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_000419_322189_D9DAD9D8 
X-CRM114-Status: UNSURE (   3.39  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: e6630ad4c58f89ba72e64fca5989ecf1e06319c9  Add localversion-wireless-testing-ath

elapsed time: 729m

configs tested: 119
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260414    gcc-9.5.0
arc                   randconfig-002-20260414    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260414    clang-23
arm                   randconfig-002-20260414    gcc-15.2.0
arm                   randconfig-003-20260414    clang-23
arm                   randconfig-004-20260414    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260414    clang-23
hexagon               randconfig-002-20260414    clang-16
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260414    gcc-14
i386                  randconfig-002-20260414    clang-20
i386                  randconfig-003-20260414    gcc-14
i386                  randconfig-004-20260414    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch             randconfig-001-20260414    clang-18
loongarch             randconfig-002-20260414    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                      mmu_defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20260414    gcc-11.5.0
nios2                 randconfig-002-20260414    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260414    gcc-8.5.0
parisc                randconfig-002-20260414    gcc-14.3.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260414    gcc-8.5.0
powerpc               randconfig-002-20260414    gcc-8.5.0
powerpc64             randconfig-001-20260414    gcc-13.4.0
powerpc64             randconfig-002-20260414    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260414    clang-23
riscv                 randconfig-002-20260414    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260414    clang-23
s390                  randconfig-002-20260414    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260414    gcc-15.2.0
sh                    randconfig-002-20260414    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260414    gcc-15.2.0
sparc                 randconfig-002-20260414    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260414    gcc-8.5.0
sparc64               randconfig-002-20260414    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260414    clang-23
um                    randconfig-002-20260414    gcc-12
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260414    gcc-14
x86_64      buildonly-randconfig-002-20260414    gcc-14
x86_64      buildonly-randconfig-003-20260414    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20260414    gcc-14
x86_64                randconfig-012-20260414    clang-20
x86_64                randconfig-013-20260414    gcc-14
x86_64                randconfig-014-20260414    gcc-14
x86_64                randconfig-015-20260414    gcc-14
x86_64                randconfig-016-20260414    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260414    gcc-8.5.0
xtensa                randconfig-002-20260414    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

