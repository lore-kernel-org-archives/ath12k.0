Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E319CC282D1
	for <ath12k@archiver.kernel.org>; Sun,  9 Mar 2025 06:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qS4cT1PUHCB3AMS+DL1BlwffPJ3SOgg2siGoIWHOJ0Q=; b=Mw29JSinaX1+dxKdr8ok5T+Q3l
	1wJwtWMt6q9ueq/7kpIor8OhiQAsCKZW2J55THPPkWkEuX0dkt6hY+cJHf/MOZTaj9FUFdSij2+yA
	qGpy907Zgs2i8ucnDN7O29Rytgs8ot9FZQVgmecXgwj82KiA/MpP0yCcm+4rn7FHov3Tq8BKJKSCi
	lNKtm6HkDvVaaWmMEX5QcR6x9TXlzqtAW+9lterwWSox3t4+ytLyiSPq8ZFPgpau4GG/NQi3x4SjX
	Ehj06JjTN/Q49wm62h/V5TwlqqFuBG52ERc3hyzJWPaQYvwkotbPvy5vjqntfWWm2Qbl6l4bjiMXL
	fmLaRf0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAbn-000000005FR-2qLK
	for ath12k@archiver.kernel.org;
	Sun, 09 Mar 2025 06:57:59 +0000
Received: from [192.198.163.19] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAZl-0000000056I-2fQt
	for ath12k@lists.infradead.org;
	Sun, 09 Mar 2025 06:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741503353; x=1773039353;
  h=date:from:to:cc:subject:message-id;
  bh=r5dMbVgLniYjgZHYqvwbKjelrWGAsNRs6rQ6eQ2rAmg=;
  b=jW63xcN5RuFuhFM+NvGTcrnmYkMIjEKEQa+4sXBLu9CLrLlvInHKOCia
   BeEGgwp2VXyyiwx0RpgFRRw2H9SG9dmX8gmg16HkZJ1nuCCQ+c3G7D/Io
   cipl6M5JIh78fCEHgeYI9e3UVkoIpP0CrJvJ7A71gMQbULM1BOT/Nvj4k
   3yXj9s/8I3GZ1F4OakOwiNEbKqBKKfEGd9fejWRQ/lIjSCCJHf3rPXnZZ
   Iid8qM3YG7lqvNc4qd4Re8+0jROqyle7kdsiP/JNU4kTXGeUYOXXZxgRE
   2aVPMLsPGJqWhWUaHZvEHYUVl0PHNKpFXRvj/zBEMGWUcuYiMiUdel2lH
   A==;
X-CSE-ConnectionGUID: HDXNNnLxTW2Rpxhc+3KZSg==
X-CSE-MsgGUID: Ixaf28MbSCW8VDRzK92rng==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="41673311"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="41673311"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 22:55:52 -0800
X-CSE-ConnectionGUID: nXEFdmbvRhOtIamlT4Erug==
X-CSE-MsgGUID: K/kLsQrCQF2zk5TRZACcaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="150480574"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Mar 2025 22:55:51 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trAZg-0002ma-1o;
	Sun, 09 Mar 2025 06:55:48 +0000
Date: Sun, 09 Mar 2025 14:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 2ae02228b8dc2763a80daa264259566da0847fde
Message-ID: <202503091401.Y4p1xjLJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_225553_718604_4ADB34A4 
X-CRM114-Status: UNSURE (   3.53  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: 2ae02228b8dc2763a80daa264259566da0847fde  Merge branch 'pending' into main-pending

elapsed time: 1418m

configs tested: 137
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250308    gcc-13.2.0
arc                   randconfig-002-20250308    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-17
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-15
arm                       multi_v4t_defconfig    clang-21
arm                   randconfig-001-20250308    gcc-14.2.0
arm                   randconfig-002-20250308    gcc-14.2.0
arm                   randconfig-003-20250308    gcc-14.2.0
arm                   randconfig-004-20250308    gcc-14.2.0
arm                           sama7_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250308    gcc-14.2.0
arm64                 randconfig-002-20250308    gcc-14.2.0
arm64                 randconfig-003-20250308    clang-16
arm64                 randconfig-004-20250308    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250308    gcc-14.2.0
csky                  randconfig-002-20250308    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250308    clang-19
hexagon               randconfig-002-20250308    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250308    gcc-12
i386        buildonly-randconfig-002-20250308    gcc-11
i386        buildonly-randconfig-003-20250308    clang-19
i386        buildonly-randconfig-004-20250308    clang-19
i386        buildonly-randconfig-005-20250308    clang-19
i386        buildonly-randconfig-006-20250308    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250308    gcc-14.2.0
loongarch             randconfig-002-20250308    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                      bmips_stb_defconfig    clang-18
mips                         db1xxx_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250308    gcc-14.2.0
nios2                 randconfig-002-20250308    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250308    gcc-14.2.0
parisc                randconfig-002-20250308    gcc-14.2.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250308    clang-18
powerpc               randconfig-002-20250308    gcc-14.2.0
powerpc               randconfig-003-20250308    gcc-14.2.0
powerpc64             randconfig-001-20250308    gcc-14.2.0
powerpc64             randconfig-002-20250308    gcc-14.2.0
powerpc64             randconfig-003-20250308    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20250308    clang-21
riscv                 randconfig-002-20250308    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250308    clang-19
s390                  randconfig-002-20250308    clang-17
s390                       zfcpdump_defconfig    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250308    gcc-14.2.0
sh                    randconfig-002-20250308    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250308    gcc-14.2.0
sparc                 randconfig-002-20250308    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250308    gcc-14.2.0
sparc64               randconfig-002-20250308    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250308    gcc-12
um                    randconfig-002-20250308    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250308    gcc-12
x86_64      buildonly-randconfig-002-20250308    clang-19
x86_64      buildonly-randconfig-003-20250308    gcc-12
x86_64      buildonly-randconfig-004-20250308    clang-19
x86_64      buildonly-randconfig-005-20250308    clang-19
x86_64      buildonly-randconfig-006-20250308    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250308    gcc-14.2.0
xtensa                randconfig-002-20250308    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

