Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D315C5AE59
	for <ath12k@archiver.kernel.org>; Sat, 31 May 2025 16:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yHzrXW7RxWkwF4TUZ76T/PYH5DIhiZ1bj2AxE1WsrrA=; b=K2Qom3rILyhZhP25mnVhl9XwpH
	N4N3zJt4W3TTd2Ej/tp+VCaDQvCXs+SSVbxqzp3cXOP/hdXKc+bN5mZncGX97Y8cW6lAOKqC4edQn
	Mf6B5AnaLa3fiJVAC1ObyQY9FVxopQKT1ZVQOr7XtrWzRbHRQ+YA79miaU7Oooxftz5385j7qkwox
	ybzLeDB/Yn6OqNFlQnQtaGoxwGMhChMDg8BonY/XRG6Q9W/rU5Tu7GDHvFhVaXXieQZWeyWh3huYQ
	vR1TLHp8FMQ0T5x836AmYZ2qiApaK1cVAIaXFO2RyCNSCp+OCRq/PRixmJHOwAHIjwL3Vx9deYzui
	xdjl7L7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOfE-0000000418l-3x8y;
	Sat, 31 May 2025 16:02:28 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOfC-0000000418S-1GnS
	for ath12k@lists.infradead.org;
	Sat, 31 May 2025 16:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748707346; x=1780243346;
  h=date:from:to:cc:subject:message-id;
  bh=kvzkvlM/tUeVXprStF0ZN1CAGtSfCtaiodG5djcO3BA=;
  b=dHS73aRhlzzN0cNO6GdMB19LSHyUFlM6P7XhEBMNyaM2hnvsyAmQnaVE
   umyaaeqnlQh+uFL15mGykE3ix99ltoIy+eW1mOw/jd4X6xxDe/RyXMNPZ
   SeIydW9FMtGKMSdKdAm/N4A4nQOGTzwe0C3M/fTm8CUJ/3BGY4BkNUSFV
   ez1Jp25jylQmOmd3h/7N+U0Jjm2+j9vZyinWnw0FYplAccabf0oPuLejp
   pyvWKwkIj9PRLRZOjxoxdfVyDBpQJHAmXholYOiH5ljT+FKiaEblimyxA
   ulOhpQLiCwv7JI0HbPW2tIuxAO0h0QE+mD9Hl3ZUK9qEZxHBi5KN+ldu/
   Q==;
X-CSE-ConnectionGUID: trMXr+WlSv+yXnFgyLlxgw==
X-CSE-MsgGUID: TzpyesblQ4O/I+QsI2HIKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61448833"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="61448833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 09:02:25 -0700
X-CSE-ConnectionGUID: /HBDHzJYSx6vClIWJFIZWg==
X-CSE-MsgGUID: 0uvwEVSeTDaJitr2fGsPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="175025622"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 May 2025 09:02:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLOf7-000YU6-0w;
	Sat, 31 May 2025 16:02:21 +0000
Date: Sun, 01 Jun 2025 00:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 c388638346c903aba2fadc8f990bafe2784ad91a
Message-ID: <202506010055.Rbn61sPG-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_090226_360723_25CBF7D4 
X-CRM114-Status: UNSURE (   3.92  )
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
branch HEAD: c388638346c903aba2fadc8f990bafe2784ad91a  wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready

elapsed time: 922m

configs tested: 132
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250531    gcc-15.1.0
arc                   randconfig-002-20250531    gcc-15.1.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    clang-21
arm                            hisi_defconfig    gcc-15.1.0
arm                      integrator_defconfig    clang-21
arm                   randconfig-001-20250531    gcc-13.3.0
arm                   randconfig-002-20250531    gcc-13.3.0
arm                   randconfig-003-20250531    gcc-7.5.0
arm                   randconfig-004-20250531    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250531    gcc-10.5.0
arm64                 randconfig-002-20250531    clang-20
arm64                 randconfig-003-20250531    clang-21
arm64                 randconfig-004-20250531    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250531    gcc-12.4.0
csky                  randconfig-002-20250531    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250531    clang-21
hexagon               randconfig-002-20250531    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250531    gcc-12
i386        buildonly-randconfig-002-20250531    gcc-12
i386        buildonly-randconfig-003-20250531    gcc-12
i386        buildonly-randconfig-004-20250531    clang-20
i386        buildonly-randconfig-005-20250531    clang-20
i386        buildonly-randconfig-006-20250531    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250531    gcc-15.1.0
loongarch             randconfig-002-20250531    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250531    gcc-10.5.0
nios2                 randconfig-002-20250531    gcc-5.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250531    gcc-7.5.0
parisc                randconfig-002-20250531    gcc-10.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      ppc64e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250531    gcc-11.5.0
powerpc               randconfig-002-20250531    gcc-5.5.0
powerpc               randconfig-003-20250531    gcc-8.5.0
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250531    clang-21
powerpc64             randconfig-003-20250531    clang-17
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250531    gcc-15.1.0
riscv                 randconfig-002-20250531    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250531    gcc-9.3.0
s390                  randconfig-002-20250531    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20250531    gcc-15.1.0
sh                    randconfig-002-20250531    gcc-10.5.0
sh                           sh2007_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250531    gcc-8.5.0
sparc                 randconfig-002-20250531    gcc-6.5.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250531    gcc-12.4.0
sparc64               randconfig-002-20250531    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250531    gcc-12
um                    randconfig-002-20250531    gcc-11
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250531    clang-20
x86_64      buildonly-randconfig-002-20250531    gcc-12
x86_64      buildonly-randconfig-003-20250531    gcc-12
x86_64      buildonly-randconfig-004-20250531    gcc-12
x86_64      buildonly-randconfig-005-20250531    clang-20
x86_64      buildonly-randconfig-006-20250531    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250531    gcc-9.3.0
xtensa                randconfig-002-20250531    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

