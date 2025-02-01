Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E32C0218A
	for <ath12k@archiver.kernel.org>; Sat,  1 Feb 2025 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2iTb7k7W5ryiYc8GBPTMiGJuAvLuVb+NEpqTmWOqoKE=; b=X32gGJr3cDs4qXJGttUvjEgoAX
	J7kewuxc7eA/KnGj6gNT/4VrVmaN9mEknoTv5SKRYdplI6Pq5dEQRszW1AOdiYdYlEMqVRLjooQiq
	qvIQjWIF6vPgezTA8DHa6nQMsRVx4bZdG7OM8AzXuerQpcStibP1d5da1Y3zFvDBCXAZ7tTnoRa+j
	g2h32tFptlxtDStD4wjpEBZktaDI/huAXZIPkryRf11rjBVelg+mn75GkjF9R9Z0NR3RFiwnjZLVR
	+fuMtAvidUUggyz6+NQmT7Z0j5TgFJszyQBFmwhNBaUH8JWZ1AkkePnUgEDEnTd4zHQ939+HCkR/Y
	ZnxnghoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te92U-0000000C3ND-39sd
	for ath12k@archiver.kernel.org;
	Sat, 01 Feb 2025 08:39:42 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te92S-0000000C3Ms-0BR9
	for ath12k@lists.infradead.org;
	Sat, 01 Feb 2025 08:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738399180; x=1769935180;
  h=date:from:to:cc:subject:message-id;
  bh=qjH+co+taARCsxfAmUHSTyi97fiviY+P/6lJ2aeuD68=;
  b=NaLEqYrErqIiB6rUTZpdiGrB3rFEEUAqj/PF6MygYKltvwW+KUSn1BJO
   tWFEnWtqOesjyxUuchIsVb2NOYcWaWVETMbyWvjt7rNlrD2VMpIW24P7F
   233LMEzFHS3uWVzfHvDm9sRj6Ktr1UJG2yYRGy9Ps+/e3OP5FwjfOW/+T
   li4NBaWuUY76coTZ6cyldDtUe8lRMjG4DMbA1mSAKHQZXglRqhbOX4nz8
   r5dvO4gcQOuK866Q/9YCNZ+0bs3r3HBBeuQM+XlDYKDLG56XmUTtnjn+b
   8PQcFCsoGesuJhF8+xqLyqXum7mXXHExbgDegSeducZ0REjBMmdShMaTg
   w==;
X-CSE-ConnectionGUID: gCd+g0PqQo2DwW+PsA0z8g==
X-CSE-MsgGUID: N4oH/kiYQ0OZfmuYARpy9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49219957"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="49219957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 00:39:37 -0800
X-CSE-ConnectionGUID: K80zycYFSuCpZ/GdPEn/tQ==
X-CSE-MsgGUID: TZZ5EiEeQG2acPpHgPo/iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110277607"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Feb 2025 00:39:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te92L-000ntz-1K;
	Sat, 01 Feb 2025 08:39:33 +0000
Date: Sat, 01 Feb 2025 16:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 1ed13fdf7d8284742c8ede36dd553387839e5163
Message-ID: <202502011646.2RSnKOVy-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_003940_221123_19B27A57 
X-CRM114-Status: UNSURE (   3.91  )
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
branch HEAD: 1ed13fdf7d8284742c8ede36dd553387839e5163  Add localversion-wireless-testing-ath

elapsed time: 722m

configs tested: 136
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    clang-21
arc                   randconfig-001-20250201    gcc-13.2.0
arc                   randconfig-002-20250201    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-21
arm                   randconfig-001-20250201    gcc-14.2.0
arm                   randconfig-002-20250201    clang-18
arm                   randconfig-003-20250201    gcc-14.2.0
arm                   randconfig-004-20250201    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250201    gcc-14.2.0
arm64                 randconfig-002-20250201    clang-16
arm64                 randconfig-003-20250201    gcc-14.2.0
arm64                 randconfig-004-20250201    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250201    gcc-14.2.0
csky                  randconfig-002-20250201    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250201    clang-21
hexagon               randconfig-002-20250201    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250201    clang-19
i386        buildonly-randconfig-002-20250201    gcc-12
i386        buildonly-randconfig-003-20250201    gcc-12
i386        buildonly-randconfig-004-20250201    gcc-12
i386        buildonly-randconfig-005-20250201    gcc-12
i386        buildonly-randconfig-006-20250201    clang-19
i386                                defconfig    clang-19
i386                  randconfig-011-20250201    clang-19
i386                  randconfig-012-20250201    clang-19
i386                  randconfig-013-20250201    clang-19
i386                  randconfig-014-20250201    clang-19
i386                  randconfig-015-20250201    clang-19
i386                  randconfig-016-20250201    clang-19
i386                  randconfig-017-20250201    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250201    gcc-14.2.0
loongarch             randconfig-002-20250201    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250201    gcc-14.2.0
nios2                 randconfig-002-20250201    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250201    gcc-14.2.0
parisc                randconfig-002-20250201    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      bamboo_defconfig    clang-21
powerpc                   currituck_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250201    clang-21
powerpc               randconfig-002-20250201    clang-18
powerpc               randconfig-003-20250201    gcc-14.2.0
powerpc64             randconfig-001-20250201    gcc-14.2.0
powerpc64             randconfig-002-20250201    gcc-14.2.0
powerpc64             randconfig-003-20250201    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250201    clang-21
riscv                 randconfig-002-20250201    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250201    gcc-14.2.0
s390                  randconfig-002-20250201    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250201    gcc-14.2.0
sh                    randconfig-002-20250201    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250201    gcc-14.2.0
sparc                 randconfig-002-20250201    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250201    gcc-14.2.0
sparc64               randconfig-002-20250201    gcc-14.2.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250201    clang-18
um                    randconfig-002-20250201    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250201    clang-19
x86_64      buildonly-randconfig-002-20250201    gcc-12
x86_64      buildonly-randconfig-003-20250201    gcc-12
x86_64      buildonly-randconfig-004-20250201    gcc-12
x86_64      buildonly-randconfig-005-20250201    clang-19
x86_64      buildonly-randconfig-006-20250201    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250201    gcc-14.2.0
xtensa                randconfig-002-20250201    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

