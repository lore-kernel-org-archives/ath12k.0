Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08A9CCFA05
	for <ath12k@archiver.kernel.org>; Fri,  7 Nov 2025 02:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aj84sVrUsujCe48nX+23pdpcFANry4lOw8tc1uz03Xc=; b=p+2Xks/JOpDMalzZkQ1IESAA28
	zdSvJcdUBZ4fz581MXECBYeKe3pt98HTM4pTD7jqjd+Z0+qZG/SsXW8gWa2CaBFR88j2e+5ne+9Eo
	N+52/tBNZac2AucXcZfTaRl5qs+1tWYEf8zPCtyWKcNY1ZOJ6SXLQDDDQceM4BEEeCp8sbnMXEUGE
	ehq4MMrdnIleCQ5UdGleIDnOALMJhh0XIF+QtEvquork6qzc2ulRW3L4HMuaU1RPywJDzWwYeB/Om
	YSFO957aeN16GjEUyctYKOxbsDgY0C8I4yH8l2ZMbWWAMK6J8c7KPZ0PGi4XUS8SWPM6pCfcEMbf4
	A9QbmgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBwL-0000000GZ0O-2g9J;
	Fri, 07 Nov 2025 02:11:01 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBwI-0000000GZ02-1zI4
	for ath12k@lists.infradead.org;
	Fri, 07 Nov 2025 02:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762481458; x=1794017458;
  h=date:from:to:cc:subject:message-id;
  bh=xh50qHKBhYwLFbcWwTVO4+DCGu6WCQH+pIIOAsxgrfk=;
  b=DHcbAuM+kLLQSuQT9weYJYX7BZt1fjq/O4Vv8u9EGIToee3amnVD2Mhl
   hcJ195ozEfhjiDKPjM4631oEjz2rfEwj+SjvPio9b7N3rbeZARaGYyFVS
   Ad41sq74GyiY6ZL8zqhKIYcoF+//8kIITztdMFXojAp2cD9P7pIgF5iIm
   ggA8WlY82kmRqFqv/VIrWtuuI18gCzw7RiyvAuXxza6ZU3EdFHX4jul6p
   yd03j3n8+RPQViHiyfYIPflOjC5StbRm/u3YKWImNlS2DGuao0I3dRqfy
   6ioJJw+4Eq7p0SY8zCQe3YrmNuG3Xd7b65ss4lY98+6VrRSHe4v7SFpOF
   w==;
X-CSE-ConnectionGUID: tlmFaDPLT+aSVqEDEfE/FA==
X-CSE-MsgGUID: EO6zyzbWQLqXjZ4A9TXjrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63643130"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="63643130"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 18:10:30 -0800
X-CSE-ConnectionGUID: PN3VCaRLTfWIc8fSX29pFA==
X-CSE-MsgGUID: 2c0AKkiUTQqMlrIZR0hApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="187579457"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Nov 2025 18:10:30 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHBvn-000UaO-2j;
	Fri, 07 Nov 2025 02:10:27 +0000
Date: Fri, 07 Nov 2025 10:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 ea414b0a2d499cf9584664d2155f07b616632a52
Message-ID: <202511071042.M9NoBzVt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_181058_595667_135C8F75 
X-CRM114-Status: UNSURE (   3.93  )
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
branch HEAD: ea414b0a2d499cf9584664d2155f07b616632a52  Merge branch 'pending' into main-pending

elapsed time: 1630m

configs tested: 107
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20251106    gcc-12.5.0
arc                   randconfig-002-20251106    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                       imx_v4_v5_defconfig    clang-22
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20251106    gcc-11.5.0
arm                   randconfig-002-20251106    clang-22
arm                   randconfig-003-20251106    gcc-10.5.0
arm                   randconfig-004-20251106    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251107    gcc-8.5.0
arm64                 randconfig-002-20251107    clang-22
arm64                 randconfig-003-20251107    gcc-8.5.0
arm64                 randconfig-004-20251107    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251107    gcc-12.5.0
csky                  randconfig-002-20251107    gcc-13.4.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251106    clang-19
hexagon               randconfig-002-20251106    clang-20
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251107    clang-20
i386        buildonly-randconfig-002-20251107    clang-20
i386        buildonly-randconfig-003-20251107    gcc-13
i386        buildonly-randconfig-004-20251107    gcc-14
i386        buildonly-randconfig-005-20251107    clang-20
i386        buildonly-randconfig-006-20251107    clang-20
i386                  randconfig-001-20251107    clang-20
i386                  randconfig-002-20251107    gcc-13
i386                  randconfig-003-20251107    clang-20
i386                  randconfig-004-20251107    clang-20
i386                  randconfig-005-20251107    gcc-14
i386                  randconfig-006-20251107    clang-20
i386                  randconfig-007-20251107    clang-20
loongarch                        alldefconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251106    gcc-15.1.0
loongarch             randconfig-002-20251106    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251106    gcc-9.5.0
nios2                 randconfig-002-20251106    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251106    gcc-10.5.0
parisc                randconfig-002-20251106    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    clang-20
powerpc               randconfig-001-20251106    gcc-14.3.0
powerpc               randconfig-002-20251106    clang-22
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20251106    gcc-8.5.0
powerpc64             randconfig-002-20251106    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251106    clang-22
riscv                 randconfig-002-20251106    gcc-12.5.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251106    gcc-8.5.0
s390                  randconfig-002-20251106    gcc-14.3.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251106    gcc-11.5.0
sh                    randconfig-002-20251106    gcc-13.4.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
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
x86_64      buildonly-randconfig-001-20251107    gcc-14
x86_64      buildonly-randconfig-002-20251107    clang-20
x86_64      buildonly-randconfig-003-20251107    gcc-14
x86_64      buildonly-randconfig-004-20251107    clang-20
x86_64      buildonly-randconfig-005-20251107    gcc-14
x86_64      buildonly-randconfig-006-20251107    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251107    gcc-14
x86_64                randconfig-012-20251107    gcc-14
x86_64                randconfig-013-20251107    clang-20
x86_64                randconfig-014-20251107    clang-20
x86_64                randconfig-015-20251107    gcc-14
x86_64                randconfig-016-20251107    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251107    gcc-10.5.0
xtensa                randconfig-002-20251107    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

