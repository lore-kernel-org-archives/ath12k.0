Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022A8C0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nyL03w/TEL0LIUTcgBc7KEUlJ9ZPqz2823FZ+QpyD/Q=; b=1qD768ki30dHoyS7JS3jgX/Cs2
	UhKDsYGsrh0PBtzWdlbh0sJWb5qa09ajCVVVP8ZJqzrx/6IT93HzzZXL5X82lQChIQQbkohVIjBuA
	EEKQHe02cl8bZ//R8IiRdE5jQS6Ste9gQJEkbCs6RIPZohOieVEG6LU1yvx7qSj5yuYQ/lZJb41Bb
	OaKetVb/LE4JQHuw3RNRCrPt75V86fa73g7DJeznaIW1sC/1d8lzoboWWOu5HW8vV3GTyGx4RsQnJ
	u05DmcNq8W4NXzN6eDdt8cQPn5mw7kurD0GQ2KIMUW/OA4V2c35H+HxTrQRiTHl/1ZgYWyeoNOlPW
	uTPMINVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmRS-000000052Is-3BEg
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 14:19:50 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmQT-000000052GJ-0UEW
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 14:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738073929; x=1769609929;
  h=date:from:to:cc:subject:message-id;
  bh=ImuRmouT8OheAoZElM4MJy+dXiQ6XvBjtR6AXHoCoDA=;
  b=EJa/LwmQdzALyJ5GIIYLpKeueEugxN6GQJBa/wq/dhwRBrLCE+2YJLCR
   tpb+vQ6C8N9vTFbc68W0rPZGBfJmd8i+LVAln0HBv43YMXa+SbkxSxg3b
   qNHDWG3xVqY9xvv4ol277gdPJ3FFoEF+giFGc/8tKhaRfTOri0ZQV1V2w
   ympTxm+ckbrSWu0cKTBLCGvROm9HpV9XbQyD1QjQFtfrWLSqef7jFFTnd
   47340FcmLN1K5alYn5Bd/gcwfO/wcxE/FX8uIP9Zt4cczH79Md9/5jwcS
   qxzlSyyiXpiY0aBXQiyhfpg3C3U+5uKGFVHE9rD3g/MFmQPRPN6UqeUsC
   Q==;
X-CSE-ConnectionGUID: 6JylFjyfR8eiTF/CBBOjqg==
X-CSE-MsgGUID: 0IbMnLB/S4uNpGRuEpKUsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49949870"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="49949870"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 06:18:48 -0800
X-CSE-ConnectionGUID: rN/5puFyTTakN6eFREAglw==
X-CSE-MsgGUID: vtsX0BaVTkmhCCktEh6zyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="108561386"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2025 06:18:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcmQP-000hrz-0O;
	Tue, 28 Jan 2025 14:18:45 +0000
Date: Tue, 28 Jan 2025 22:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 327352e2b335a56c501140675381d123447af61a
Message-ID: <202501282258.voA8mjxw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_061849_200904_F789EFDC 
X-CRM114-Status: UNSURE (   4.04  )
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
branch HEAD: 327352e2b335a56c501140675381d123447af61a  Merge branch 'pending' into main-pending

elapsed time: 727m

configs tested: 114
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250128    gcc-13.2.0
arc                   randconfig-002-20250128    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-19
arm                          moxart_defconfig    gcc-14.2.0
arm                   randconfig-001-20250128    gcc-14.2.0
arm                   randconfig-002-20250128    clang-20
arm                   randconfig-003-20250128    clang-20
arm                   randconfig-004-20250128    clang-15
arm                         s5pv210_defconfig    gcc-14.2.0
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250128    gcc-14.2.0
arm64                 randconfig-002-20250128    clang-17
arm64                 randconfig-003-20250128    gcc-14.2.0
arm64                 randconfig-004-20250128    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250128    gcc-14.2.0
csky                  randconfig-002-20250128    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250128    clang-20
hexagon               randconfig-002-20250128    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250128    clang-19
i386        buildonly-randconfig-002-20250128    clang-19
i386        buildonly-randconfig-003-20250128    gcc-12
i386        buildonly-randconfig-004-20250128    clang-19
i386        buildonly-randconfig-005-20250128    clang-19
i386        buildonly-randconfig-006-20250128    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250128    gcc-14.2.0
loongarch             randconfig-002-20250128    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                 randconfig-001-20250128    gcc-14.2.0
nios2                 randconfig-002-20250128    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250128    gcc-14.2.0
parisc                randconfig-002-20250128    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       ebony_defconfig    clang-18
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250128    clang-17
powerpc               randconfig-002-20250128    gcc-14.2.0
powerpc               randconfig-003-20250128    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250128    clang-15
powerpc64             randconfig-002-20250128    gcc-14.2.0
powerpc64             randconfig-003-20250128    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250128    gcc-14.2.0
riscv                 randconfig-002-20250128    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250128    gcc-14.2.0
s390                  randconfig-002-20250128    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250128    gcc-14.2.0
sh                    randconfig-002-20250128    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250128    gcc-14.2.0
sparc                 randconfig-002-20250128    gcc-14.2.0
sparc64               randconfig-001-20250128    gcc-14.2.0
sparc64               randconfig-002-20250128    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250128    gcc-12
um                    randconfig-002-20250128    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250128    clang-19
x86_64      buildonly-randconfig-002-20250128    clang-19
x86_64      buildonly-randconfig-003-20250128    gcc-12
x86_64      buildonly-randconfig-004-20250128    clang-19
x86_64      buildonly-randconfig-005-20250128    clang-19
x86_64      buildonly-randconfig-006-20250128    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250128    gcc-14.2.0
xtensa                randconfig-002-20250128    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

