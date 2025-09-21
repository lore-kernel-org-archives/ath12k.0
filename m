Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D93CAC59A
	for <ath12k@archiver.kernel.org>; Sun, 21 Sep 2025 04:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LwyShAc/7X6uz0qiFThVRSP/05quocpCk/TA5X6kmsg=; b=Vgc1Y+GOs/N55NcqA/NFt7LyYQ
	yjPuR20yaiC8ryBdSH7beY95BC/0khrr5Lwe4udC6lLG5AVFTQSqVNPjOJml2YtN6m70wOcVUIcqs
	sSxqteMON7U1Zes+ziJ49+4G0jp2w79xbXcBCP+Y6qq8/QaSGIcktmFP16Meht69ahRjZ3qRfkOse
	WNMcICXomObSfoXOpMmVYUL+68RrIcFO6ysOj0LHkhAbrSEW5YkSIooYafAVMD2Ec4LJ/Lnbx4dtq
	3JjvAakZhcBBvyAC11b7VQIUJ57AuacNpiOVyPNJuYV/AsFM5XIYL7JYJciqICC1ZxbD9abE3cCA4
	nYjCte8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0BYu-00000006Wyl-0aeH;
	Sun, 21 Sep 2025 04:20:32 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0BYq-00000006Wy5-46JL
	for ath12k@lists.infradead.org;
	Sun, 21 Sep 2025 04:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758428429; x=1789964429;
  h=date:from:to:cc:subject:message-id;
  bh=7AEmWl9lafW752f1H76ouvMys6I+RCOp7TymD84ZSD4=;
  b=XTmHcT7T+fLMLkqySrz/8ypuZoTqboiMXEUpsLQDM75uV0LtVfhuzhnS
   5Vckm7h32v5NnaAHmnII7s/3jIQDyN9asHpi15Xa490HtKvUiSjMAjxGT
   8owRJnyuoyRtw4m1owbBxF88DmOaWR27EEWxKSLMLDj8U/ZfWzpMnC0PC
   wuhSir5hhhqgUbGQdIr+T4ju/3AcIkYFkzkWQhja69WtZPZEVjJ7Cf/dn
   BXLIwGVrQwVHtcNNvSClNSYJHURIpG1NJqDyf3Y6r56U84FvTv/oSXVC2
   JbSTbtYwqUGicLrhOPgXMkX6XxrL2hDlR/o+krKaGTAqIxeP2fH9m1TTg
   A==;
X-CSE-ConnectionGUID: Z2tqBfzORmqEsbmQfRvuCA==
X-CSE-MsgGUID: lWc6UJRwSluMhgqfbXh6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="60421006"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="60421006"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 21:20:27 -0700
X-CSE-ConnectionGUID: yCe+vP1lSGO0l5RU5DqpKQ==
X-CSE-MsgGUID: 2rWmiqxkTGqBzV4/p20qSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="199906372"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Sep 2025 21:20:25 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0BYl-0000QT-11;
	Sun, 21 Sep 2025 04:20:23 +0000
Date: Sun, 21 Sep 2025 12:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 7ca61ed8b3f3fc9a7decd68039cb1d7d1238c566
Message-ID: <202509211217.Ywc8GZ05-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_212029_129854_9CBBDFC9 
X-CRM114-Status: UNSURE (   3.68  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: 7ca61ed8b3f3fc9a7decd68039cb1d7d1238c566  wifi: ath12k: Fix peer lookup in ath12k_dp_mon_rx_deliver_msdu()

elapsed time: 727m

configs tested: 126
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250921    gcc-14.3.0
arc                   randconfig-002-20250921    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                           h3600_defconfig    gcc-15.1.0
arm                   randconfig-001-20250921    gcc-11.5.0
arm                   randconfig-002-20250921    clang-16
arm                   randconfig-003-20250921    gcc-8.5.0
arm                   randconfig-004-20250921    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250921    clang-22
arm64                 randconfig-002-20250921    gcc-8.5.0
arm64                 randconfig-003-20250921    clang-22
arm64                 randconfig-004-20250921    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250921    gcc-9.5.0
csky                  randconfig-002-20250921    gcc-15.1.0
hexagon                          alldefconfig    clang-22
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250921    clang-20
hexagon               randconfig-002-20250921    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250921    gcc-14
i386        buildonly-randconfig-002-20250921    clang-20
i386        buildonly-randconfig-003-20250921    gcc-12
i386        buildonly-randconfig-004-20250921    gcc-14
i386        buildonly-randconfig-005-20250921    gcc-14
i386        buildonly-randconfig-006-20250921    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250921    clang-18
loongarch             randconfig-002-20250921    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-22
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250921    gcc-8.5.0
nios2                 randconfig-002-20250921    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250921    gcc-8.5.0
parisc                randconfig-002-20250921    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      bamboo_defconfig    clang-22
powerpc               randconfig-001-20250921    gcc-12.5.0
powerpc               randconfig-002-20250921    gcc-8.5.0
powerpc               randconfig-003-20250921    clang-22
powerpc64             randconfig-001-20250921    gcc-8.5.0
powerpc64             randconfig-002-20250921    gcc-15.1.0
powerpc64             randconfig-003-20250921    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250921    clang-22
riscv                 randconfig-002-20250921    gcc-12.5.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250921    clang-20
s390                  randconfig-002-20250921    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250921    gcc-15.1.0
sh                    randconfig-002-20250921    gcc-15.1.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250921    gcc-13.4.0
sparc                 randconfig-002-20250921    gcc-8.5.0
sparc64               randconfig-001-20250921    clang-22
sparc64               randconfig-002-20250921    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250921    gcc-14
um                    randconfig-002-20250921    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250921    clang-20
x86_64      buildonly-randconfig-002-20250921    clang-20
x86_64      buildonly-randconfig-003-20250921    clang-20
x86_64      buildonly-randconfig-004-20250921    gcc-14
x86_64      buildonly-randconfig-005-20250921    clang-20
x86_64      buildonly-randconfig-006-20250921    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250921    gcc-12.5.0
xtensa                randconfig-002-20250921    gcc-8.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

