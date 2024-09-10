Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99E8EE01F1
	for <ath12k@archiver.kernel.org>; Tue, 10 Sep 2024 23:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M4De4+d+UUn9KipCRMsFofDihPPWXL9DPqfhoKp//vg=; b=WcBKXBY8lfPVBCyPJsVmhuqsu+
	cXWFk0LhDCHqP3U6DOAMkxt1ygdXnQVdbsCBD1Gpd6KBUGq+VEg0SJkMe+kkpFtGGDycqDjf1W64W
	mO+1hvbVQYHIuKyQwcHbkksv5T+8llnQLIbWUquHuUs6Qq0j07jxKBDeEJEUZrW9FqcRKQkYeUVUp
	7WSuK1HOPQ0PwFubZKxNv0LANpOI0QsC/MSNlAmvwwE/x2sxBlvkl79QWOjzeL6iJl/lZUJLGnxEt
	nZKCFHEkm6YqInfvBVwAJPaNVsx61StgEW8V9LlGl22f0br36M+ZbwSnDZHeDijMocymaa7WmaL77
	990Sm/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soA3v-00000007PB5-1Aof
	for ath12k@archiver.kernel.org;
	Tue, 10 Sep 2024 23:14:19 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soA3s-00000007PAm-3zBy
	for ath12k@lists.infradead.org;
	Tue, 10 Sep 2024 23:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726010057; x=1757546057;
  h=date:from:to:cc:subject:message-id;
  bh=01Adoiie0g+q/WF05ccXZHJTUb4lHgXmF6J8lAwjKkU=;
  b=Je4iiLeCAkre8OYPtAPpoaZoNBaxMYp7tM5eF9umVtjfwWqBAGBiv65+
   c3yly7Lq0st7OFWjW4NRyzlUHdwRxXExf9HhoQ221Yk2tvxzdyTdV7x5c
   0ijBtFkYu8PwCQGBFv5Q4n29Wp8QA+SQi7iekjG2liPKrjYiZ+nSXo+EK
   gLxz9FcIQ2yfs0/EFoKOGku/bCbH7dNpg4VKVkWQovsjtv680L1PmSWuw
   /OnHUrggG90khn8KMn1Er26KlATLsN23QwcnZPwA62wpli8hNs2l/HuBs
   aHnVTBVR0REQVUZd3q9XCEsuMoQ56nwB9ji1BLybYC8zM9x9wTmayNPNC
   Q==;
X-CSE-ConnectionGUID: 45q/hyIyQmSivaLVpIagvQ==
X-CSE-MsgGUID: vqLomrPJQMeXQ8ReXIgUxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24983189"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24983189"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 16:14:16 -0700
X-CSE-ConnectionGUID: zbZOKoEySjePKiyprP/C5A==
X-CSE-MsgGUID: wJpMETWvQ76TZ9Lo/LWjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67240170"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2024 16:14:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soA3o-0002ok-3A;
	Tue, 10 Sep 2024 23:14:12 +0000
Date: Wed, 11 Sep 2024 07:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 b1365224b7bd30454b0a0cfebc65ee7b41ed0a6c
Message-ID: <202409110748.UTqU1Jwd-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_161417_037248_DD6D9B33 
X-CRM114-Status: UNSURE (   3.83  )
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
branch HEAD: b1365224b7bd30454b0a0cfebc65ee7b41ed0a6c  Add localversion-wireless-testing-ath

elapsed time: 1464m

configs tested: 213
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arc                     haps_hs_smp_defconfig   gcc-14.1.0
arc                   randconfig-001-20240910   gcc-13.2.0
arc                   randconfig-002-20240910   gcc-13.2.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                       aspeed_g4_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-14.1.0
arm                      footbridge_defconfig   gcc-14.1.0
arm                            hisi_defconfig   gcc-14.1.0
arm                           imxrt_defconfig   gcc-14.1.0
arm                            mmp2_defconfig   gcc-14.1.0
arm                         orion5x_defconfig   gcc-14.1.0
arm                   randconfig-001-20240910   gcc-13.2.0
arm                   randconfig-002-20240910   gcc-13.2.0
arm                   randconfig-003-20240910   gcc-13.2.0
arm                   randconfig-004-20240910   gcc-13.2.0
arm                        realview_defconfig   gcc-14.1.0
arm                         s5pv210_defconfig   gcc-14.1.0
arm                       spear13xx_defconfig   gcc-14.1.0
arm                        spear3xx_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240910   gcc-13.2.0
arm64                 randconfig-002-20240910   gcc-13.2.0
arm64                 randconfig-003-20240910   gcc-13.2.0
arm64                 randconfig-004-20240910   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240910   gcc-13.2.0
csky                  randconfig-002-20240910   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240910   gcc-13.2.0
hexagon               randconfig-002-20240910   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240910   clang-18
i386         buildonly-randconfig-001-20240911   gcc-12
i386         buildonly-randconfig-002-20240910   clang-18
i386         buildonly-randconfig-002-20240911   gcc-12
i386         buildonly-randconfig-003-20240910   clang-18
i386         buildonly-randconfig-003-20240911   gcc-12
i386         buildonly-randconfig-004-20240910   clang-18
i386         buildonly-randconfig-004-20240911   gcc-12
i386         buildonly-randconfig-005-20240910   clang-18
i386         buildonly-randconfig-005-20240911   gcc-12
i386         buildonly-randconfig-006-20240910   clang-18
i386         buildonly-randconfig-006-20240911   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240910   clang-18
i386                  randconfig-001-20240911   gcc-12
i386                  randconfig-002-20240910   clang-18
i386                  randconfig-002-20240911   gcc-12
i386                  randconfig-003-20240910   clang-18
i386                  randconfig-003-20240911   gcc-12
i386                  randconfig-004-20240910   clang-18
i386                  randconfig-004-20240911   gcc-12
i386                  randconfig-005-20240910   clang-18
i386                  randconfig-005-20240911   gcc-12
i386                  randconfig-006-20240910   clang-18
i386                  randconfig-006-20240911   gcc-12
i386                  randconfig-011-20240910   clang-18
i386                  randconfig-011-20240911   gcc-12
i386                  randconfig-012-20240910   clang-18
i386                  randconfig-012-20240911   gcc-12
i386                  randconfig-013-20240910   clang-18
i386                  randconfig-013-20240911   gcc-12
i386                  randconfig-014-20240910   clang-18
i386                  randconfig-014-20240911   gcc-12
i386                  randconfig-015-20240910   clang-18
i386                  randconfig-015-20240911   gcc-12
i386                  randconfig-016-20240910   clang-18
i386                  randconfig-016-20240911   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240910   gcc-13.2.0
loongarch             randconfig-002-20240910   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          atari_defconfig   gcc-14.1.0
m68k                       bvme6000_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                       m5275evb_defconfig   gcc-14.1.0
m68k                            mac_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           ip32_defconfig   gcc-14.1.0
mips                      loongson3_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240910   gcc-13.2.0
nios2                 randconfig-002-20240910   gcc-13.2.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                randconfig-001-20240910   gcc-13.2.0
parisc                randconfig-002-20240910   gcc-13.2.0
parisc64                         alldefconfig   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   currituck_defconfig   gcc-14.1.0
powerpc                     ep8248e_defconfig   gcc-14.1.0
powerpc                       maple_defconfig   gcc-14.1.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig   gcc-14.1.0
powerpc                 mpc834x_itx_defconfig   gcc-14.1.0
powerpc               mpc834x_itxgp_defconfig   gcc-14.1.0
powerpc                     rainier_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240910   gcc-13.2.0
powerpc               randconfig-002-20240910   gcc-13.2.0
powerpc               randconfig-003-20240910   gcc-13.2.0
powerpc64             randconfig-001-20240910   gcc-13.2.0
powerpc64             randconfig-002-20240910   gcc-13.2.0
powerpc64             randconfig-003-20240910   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                 randconfig-001-20240910   gcc-13.2.0
riscv                 randconfig-002-20240910   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240910   gcc-13.2.0
s390                  randconfig-002-20240910   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                    randconfig-001-20240910   gcc-13.2.0
sh                    randconfig-002-20240910   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-14.1.0
sh                          sdk7780_defconfig   gcc-14.1.0
sh                           se7206_defconfig   gcc-14.1.0
sh                           se7721_defconfig   gcc-14.1.0
sh                   sh7770_generic_defconfig   gcc-14.1.0
sh                            titan_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240910   gcc-13.2.0
sparc64               randconfig-002-20240910   gcc-13.2.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240910   gcc-13.2.0
um                    randconfig-002-20240910   gcc-13.2.0
um                           x86_64_defconfig   gcc-12
x86_64                           alldefconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240910   gcc-12
x86_64       buildonly-randconfig-002-20240910   gcc-12
x86_64       buildonly-randconfig-003-20240910   gcc-12
x86_64       buildonly-randconfig-004-20240910   gcc-12
x86_64       buildonly-randconfig-005-20240910   gcc-12
x86_64       buildonly-randconfig-006-20240910   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240910   gcc-12
x86_64                randconfig-002-20240910   gcc-12
x86_64                randconfig-003-20240910   gcc-12
x86_64                randconfig-004-20240910   gcc-12
x86_64                randconfig-005-20240910   gcc-12
x86_64                randconfig-006-20240910   gcc-12
x86_64                randconfig-011-20240910   gcc-12
x86_64                randconfig-012-20240910   gcc-12
x86_64                randconfig-013-20240910   gcc-12
x86_64                randconfig-014-20240910   gcc-12
x86_64                randconfig-015-20240910   gcc-12
x86_64                randconfig-016-20240910   gcc-12
x86_64                randconfig-071-20240910   gcc-12
x86_64                randconfig-072-20240910   gcc-12
x86_64                randconfig-073-20240910   gcc-12
x86_64                randconfig-074-20240910   gcc-12
x86_64                randconfig-075-20240910   gcc-12
x86_64                randconfig-076-20240910   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  audio_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240910   gcc-13.2.0
xtensa                randconfig-002-20240910   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

