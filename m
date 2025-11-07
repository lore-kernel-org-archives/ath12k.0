Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C4ACCF9E3
	for <ath12k@archiver.kernel.org>; Fri,  7 Nov 2025 19:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ClQ5ZySkOfWYA+KODfx55dGLoMTuNYhNGLrU5d3FgXE=; b=0PnED3PMvZbiw9jn2rKag2kO34
	88Wyu4V9htr64s4qkgZJWTkU7Q8sSnfENQlzwE5+DdZCxvcKcixLVnFo6XoATMOe47rXhNaDiAJfW
	LPbAvkMazpzAgzTaRVv4pJJ0HVECoMfND5NYyhIQyZpAif/VlbFC7WZ2NVfclXndAOjDWNgeEPvbN
	9V73+EVe7iCIiKp/1SF3YYyF6U5dgDLVbco+48I4Fa0MiEJXUVx66h0obCIh/P3OC4ciOQEhQ/PMp
	QomTNVlzD7HncpMAgQrYUOsSXKs4exk+Dgm8kg/wE7ejWJ4c8hO3SWhNLEQekjlfcvSPv/kpDiem4
	uWseUVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHS4H-00000000iTZ-1jbD;
	Fri, 07 Nov 2025 19:24:17 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHS4F-00000000iSB-023L
	for ath12k@lists.infradead.org;
	Fri, 07 Nov 2025 19:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762543455; x=1794079455;
  h=date:from:to:cc:subject:message-id;
  bh=QJSrWQ37F/RxfZN6NwMH87LGqcwcd+TI9VtrPzUTy9U=;
  b=koGTHPa/+Mmvdm1GSrl9tbyrCed+Du8e4QkV9WwKqNAHlHdmS1lzl4IM
   3cd1Uo0cP7rMbYjGZYPbSFdJxYhdeh559VdgWCJrpn6hG8j0Zwh/yK1qR
   m+aUL/uPEWn+77Kkrzr/j+e3p02h1EzrFnkJEj7tViOZjMa6vH1hdBsUW
   YZtS9hwWbRzcA9y9CBa8u/5ars8T8yk5Cy6xR5S3gL0jpVyv6EiaFptj8
   jPiJLndJhBwqEZFNDP8IsqNf5DLeSo1OpVGLWagHAV+5CBvaXFDoj9ps/
   GFHjacuFZ6JVevjE8EvY676dBUwhAwn4lYfJ2KBVURzDEipcJYSY/EtfQ
   Q==;
X-CSE-ConnectionGUID: tWSLOnJnRTqrqSdPVwNHvQ==
X-CSE-MsgGUID: +sw4meXLSi2fyIs6nIm/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="82325506"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="82325506"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 11:24:14 -0800
X-CSE-ConnectionGUID: Xe76uWbPT6umD7R29QSRFA==
X-CSE-MsgGUID: LZPvfbuaRb6Mcdba/qVDDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="188543537"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2025 11:24:13 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHS4B-0000Hz-1G;
	Fri, 07 Nov 2025 19:24:11 +0000
Date: Sat, 08 Nov 2025 03:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 2977567b244f056d86658160659f06cd6c78ba3d
Message-ID: <202511080334.M8Dhq4WS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_112415_084867_0EA86D59 
X-CRM114-Status: UNSURE (   3.87  )
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
branch HEAD: 2977567b244f056d86658160659f06cd6c78ba3d  wifi: ath12k: Fix timeout error during beacon stats retrieval

elapsed time: 1618m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251107    gcc-8.5.0
arc                   randconfig-002-20251107    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                         at91_dt_defconfig    clang-22
arm                        clps711x_defconfig    clang-22
arm                   randconfig-001-20251107    clang-17
arm                   randconfig-002-20251107    gcc-13.4.0
arm                   randconfig-003-20251107    clang-22
arm                   randconfig-004-20251107    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251107    gcc-8.5.0
arm64                 randconfig-002-20251107    clang-22
arm64                 randconfig-003-20251107    gcc-8.5.0
arm64                 randconfig-004-20251107    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251107    gcc-12.5.0
csky                  randconfig-002-20251107    gcc-13.4.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251107    clang-22
hexagon               randconfig-002-20251107    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-002-20251108    gcc-14
i386        buildonly-randconfig-003-20251108    gcc-14
i386        buildonly-randconfig-004-20251108    gcc-14
i386        buildonly-randconfig-005-20251108    clang-20
i386                  randconfig-011-20251107    gcc-14
i386                  randconfig-012-20251107    clang-20
i386                  randconfig-013-20251107    clang-20
i386                  randconfig-014-20251107    gcc-14
i386                  randconfig-015-20251107    clang-20
i386                  randconfig-016-20251107    clang-20
i386                  randconfig-017-20251107    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251107    gcc-15.1.0
loongarch             randconfig-002-20251107    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
mips                           mtx1_defconfig    clang-22
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251107    gcc-11.5.0
nios2                 randconfig-002-20251107    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251107    gcc-8.5.0
parisc                randconfig-002-20251107    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    clang-22
powerpc               randconfig-001-20251107    clang-22
powerpc               randconfig-002-20251107    clang-22
powerpc64             randconfig-001-20251107    gcc-14.3.0
powerpc64             randconfig-002-20251107    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251107    clang-22
riscv                 randconfig-002-20251107    gcc-13.4.0
s390                             alldefconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251107    gcc-8.5.0
s390                  randconfig-002-20251107    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251107    gcc-13.4.0
sh                    randconfig-002-20251107    gcc-11.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251107    gcc-11.5.0
sparc                 randconfig-002-20251107    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251107    gcc-8.5.0
sparc64               randconfig-002-20251107    gcc-9.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251107    clang-22
um                    randconfig-002-20251107    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251108    gcc-14
x86_64      buildonly-randconfig-002-20251108    gcc-12
x86_64      buildonly-randconfig-003-20251108    clang-20
x86_64      buildonly-randconfig-004-20251108    gcc-14
x86_64      buildonly-randconfig-005-20251108    gcc-14
x86_64      buildonly-randconfig-006-20251108    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251107    gcc-14
x86_64                randconfig-012-20251107    gcc-14
x86_64                randconfig-013-20251107    clang-20
x86_64                randconfig-014-20251107    clang-20
x86_64                randconfig-015-20251107    gcc-14
x86_64                randconfig-016-20251107    gcc-14
x86_64                randconfig-071-20251108    gcc-14
x86_64                randconfig-072-20251108    clang-20
x86_64                randconfig-073-20251108    clang-20
x86_64                randconfig-074-20251108    clang-20
x86_64                randconfig-076-20251108    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251107    gcc-10.5.0
xtensa                randconfig-002-20251107    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

