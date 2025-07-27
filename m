Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE26C87FCC
	for <ath12k@archiver.kernel.org>; Sun, 27 Jul 2025 04:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1OYDFgX/tKkByME+zAEF1IGN5ldi5baFGqYROakyQ8M=; b=g8AqCiybp7jXEjZbbNdBXEawJo
	1EmelInSGIaqyTHwGEjyT58I/onOxAr8e5dwZ4Dh6ur3xzl4W60DD4rH3xhJJTesF7Ypfigqj9EZo
	uq32cP21VDFA1Upwrsdy2aGKcSy81uBs8uwv9oMZO1KTTcYK6hpE/VTa88kiFvWltyvCVkfmfDwpx
	qq5vxij3whNmwYoVUjUpsRbRhEbYsEPfdQBLWIM9pcDOWSbO7nZi/xqhvQeoyUbGnslrblzBf/fqT
	00zD0nDK7ybY6tLdGWhJBpPJxtJmdaT+qhFfaaU0Kpt4fc43+Po/zxkUiE2Zghe1V1hrHwjqVzO8A
	VGHCF9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uftB9-0000000CKCe-3XFW;
	Sun, 27 Jul 2025 04:40:07 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uftB6-0000000CKCB-2ZZ8
	for ath12k@lists.infradead.org;
	Sun, 27 Jul 2025 04:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753591205; x=1785127205;
  h=date:from:to:cc:subject:message-id;
  bh=4gbJanhaiaEISFcubWjfl7IjWArgSquYpduHQ9MMtuM=;
  b=APq6lNizB0dNsWBOubrZvvnXVlq8cFEuSPhaSCi8/Eo3Y8bvxJo6s/xq
   qUg8f5NBJZOFunLjC5oREJ77ADApUt79sJKOCh9o+8kP07D3Vq2jwW0ZO
   L5sHiUuFs/gTEiASZH87+cGTC2YxNbV+cOYBWiCaWB0/k6mOtE+trWaPM
   kD7F5qd0nYUq8hn3iNAMBaZdp363iJUeQTOKiAiVB01NK/ttqALYlEex2
   N/35DlAITINErMlmWR5/Zs7/81Xg4bqpHVhPBp2279Onc6xZJmXG7P3f9
   6WipKgAGD+uL2GKX6IDPPkzeZ68dyceVdIYLmz8orSkE+8coZzUwPfL6F
   A==;
X-CSE-ConnectionGUID: lD3tuWykRRigEwqVJj6Lww==
X-CSE-MsgGUID: qldwf/5TQzixBbEt3ASijg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66140410"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66140410"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 21:40:01 -0700
X-CSE-ConnectionGUID: 1HN/Pk9bTYGJQgRRJ1XbbA==
X-CSE-MsgGUID: Tk0fLEBVQFOr/Afvh92vIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166086808"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jul 2025 21:40:00 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uftAz-000MTD-1G;
	Sun, 27 Jul 2025 04:39:57 +0000
Date: Sun, 27 Jul 2025 12:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 0f79768f8d665b43b77967d38b5df6ccebe8cb57
Message-ID: <202507271239.XNy2DqAD-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_214004_727527_529D422A 
X-CRM114-Status: UNSURE (   4.19  )
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
branch HEAD: 0f79768f8d665b43b77967d38b5df6ccebe8cb57  Add localversion-wireless-testing-ath

elapsed time: 725m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250727    gcc-8.5.0
arc                   randconfig-002-20250727    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          collie_defconfig    gcc-15.1.0
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20250727    gcc-11.5.0
arm                   randconfig-002-20250727    gcc-14.3.0
arm                   randconfig-003-20250727    clang-22
arm                   randconfig-004-20250727    gcc-10.5.0
arm                           sama7_defconfig    clang-22
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250727    gcc-11.5.0
arm64                 randconfig-002-20250727    clang-18
arm64                 randconfig-003-20250727    clang-17
arm64                 randconfig-004-20250727    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250727    gcc-15.1.0
csky                  randconfig-002-20250727    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250727    clang-22
hexagon               randconfig-002-20250727    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250727    gcc-12
i386        buildonly-randconfig-002-20250727    gcc-12
i386        buildonly-randconfig-003-20250727    clang-20
i386        buildonly-randconfig-004-20250727    clang-20
i386        buildonly-randconfig-005-20250727    clang-20
i386        buildonly-randconfig-006-20250727    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250727    clang-22
loongarch             randconfig-002-20250727    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-22
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250727    gcc-8.5.0
nios2                 randconfig-002-20250727    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250727    gcc-11.5.0
parisc                randconfig-002-20250727    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250727    gcc-13.4.0
powerpc               randconfig-002-20250727    clang-22
powerpc               randconfig-003-20250727    clang-22
powerpc64             randconfig-001-20250727    gcc-12.5.0
powerpc64             randconfig-002-20250727    clang-22
powerpc64             randconfig-003-20250727    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250727    clang-22
riscv                 randconfig-002-20250727    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250727    clang-22
s390                  randconfig-002-20250727    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250727    gcc-15.1.0
sh                    randconfig-002-20250727    gcc-11.5.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250727    gcc-8.5.0
sparc                 randconfig-002-20250727    gcc-8.5.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250727    gcc-8.5.0
sparc64               randconfig-002-20250727    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250727    clang-22
um                    randconfig-002-20250727    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250727    gcc-12
x86_64      buildonly-randconfig-002-20250727    clang-20
x86_64      buildonly-randconfig-003-20250727    clang-20
x86_64      buildonly-randconfig-004-20250727    clang-20
x86_64      buildonly-randconfig-005-20250727    clang-20
x86_64      buildonly-randconfig-006-20250727    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250727    gcc-8.5.0
xtensa                randconfig-002-20250727    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

