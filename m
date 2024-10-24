Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F210CCE8E9D
	for <ath12k@archiver.kernel.org>; Thu, 24 Oct 2024 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iIlcafxJUhjfwcatLXFMV+NJcjsrgilwo1ODTyBPACo=; b=Jf59vASMnxnw/dJhI+jH1c/PGj
	xU27tSSAyT7H+unRYHWqE76vgKh0pHC9zh2fM+FfVOl3WWxQmiZPv/VGIA+llWnDGHqbd2iLD49Sp
	Jw/DFeLaoKq1v62z0HZNAUDt1abd4/8MqWhJZ9lon+xqyjOt7iRAkG/UVsFMoGGVhVUSDs7ItIL9n
	A6CW4pSvxR1zLAjKehMi1XGRlvoLLl5wvhmcjOCzNH0oO2h/bGSKJ5lEXX6AZhnpjj8fpJPcpFLGf
	MGSK+BdVEsxppmj9yWHFR2eSiqKBbFD0QNOjfAi/6rfolUltebqgJYkb5nTUTr2e79C7Dcsf+wxNj
	Q6uP5qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42i1-00000001TDX-2vpu
	for ath12k@archiver.kernel.org;
	Thu, 24 Oct 2024 18:37:21 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t42hx-00000001TBK-0V8y
	for ath12k@lists.infradead.org;
	Thu, 24 Oct 2024 18:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729795037; x=1761331037;
  h=date:from:to:cc:subject:message-id;
  bh=tYtFxspWXloe3EIkica+Z7nouenonFxB2bbuCODN1YU=;
  b=ZE4gLrW3RS4G3/O0+kBPTJTIDOW1WkQEMhTDrGHQNR2FfkQpQ8R5USRK
   tYC8AuWtJieeCtGwm4rkU2uCvIob8sVBiPBZmX6gUGtmjF4zxhSYN8ocj
   wx1Z8rQQVFKDhmsemcCbgzrprTws+YzIZTxMiCKsYMZyzOsZIqDvt8Izq
   UN2bMPY/k8pUzY0DsMXHS9UNqlDbNv1mI4opHXyCByEw9FyS2ejn8ik9B
   f+YV6vdr+eDvL7ujX3Zixnamm6Z7h4y/EP8GrCQK44Q+71vIcjBVZBMvj
   Ubzp8ZCIarzFA5hdeP7iw1wDnURdSHQOC1RIfNQy3csRmI3KBXMigsg9P
   Q==;
X-CSE-ConnectionGUID: GPf91ji7Qxuz4nKj+4CHOA==
X-CSE-MsgGUID: Wv9W0PUVR7GW1GlcLdAwHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29217552"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29217552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 11:37:13 -0700
X-CSE-ConnectionGUID: EYtSDBVWTeui1QJbskLPmQ==
X-CSE-MsgGUID: w4WqxMnuQm6avmEXf/w0pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="84642908"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2024 11:37:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t42hp-000WrI-37;
	Thu, 24 Oct 2024 18:37:09 +0000
Date: Fri, 25 Oct 2024 02:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 9f31eddf8a8e279decb6893a3d6b1a5836f8d032
Message-ID: <202410250232.WjUYCpVU-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_113717_255909_35A1C6C0 
X-CRM114-Status: UNSURE (   3.74  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
branch HEAD: 9f31eddf8a8e279decb6893a3d6b1a5836f8d032  wifi: ath12k: handle ath12k_bss_assoc for MLO

elapsed time: 1421m

configs tested: 174
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241024    gcc-14.1.0
arc                   randconfig-002-20241024    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm                   randconfig-001-20241024    gcc-14.1.0
arm                   randconfig-002-20241024    gcc-14.1.0
arm                   randconfig-003-20241024    gcc-14.1.0
arm                   randconfig-004-20241024    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241024    gcc-14.1.0
arm64                 randconfig-002-20241024    gcc-14.1.0
arm64                 randconfig-003-20241024    gcc-14.1.0
arm64                 randconfig-004-20241024    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241024    gcc-14.1.0
csky                  randconfig-002-20241024    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241024    gcc-14.1.0
hexagon               randconfig-002-20241024    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241024    clang-19
i386        buildonly-randconfig-002-20241024    clang-19
i386        buildonly-randconfig-003-20241024    clang-19
i386        buildonly-randconfig-004-20241024    clang-19
i386        buildonly-randconfig-005-20241024    clang-19
i386        buildonly-randconfig-006-20241024    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241024    clang-19
i386                  randconfig-002-20241024    clang-19
i386                  randconfig-003-20241024    clang-19
i386                  randconfig-004-20241024    clang-19
i386                  randconfig-005-20241024    clang-19
i386                  randconfig-006-20241024    clang-19
i386                  randconfig-011-20241024    clang-19
i386                  randconfig-012-20241024    clang-19
i386                  randconfig-013-20241024    clang-19
i386                  randconfig-014-20241024    clang-19
i386                  randconfig-015-20241024    clang-19
i386                  randconfig-016-20241024    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241024    gcc-14.1.0
loongarch             randconfig-002-20241024    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241024    gcc-14.1.0
nios2                 randconfig-002-20241024    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241024    gcc-14.1.0
parisc                randconfig-002-20241024    gcc-14.1.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       ebony_defconfig    gcc-14.1.0
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241024    gcc-14.1.0
powerpc               randconfig-002-20241024    gcc-14.1.0
powerpc               randconfig-003-20241024    gcc-14.1.0
powerpc                     tqm8540_defconfig    gcc-14.1.0
powerpc                     tqm8548_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241024    gcc-14.1.0
powerpc64             randconfig-002-20241024    gcc-14.1.0
powerpc64             randconfig-003-20241024    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.1.0
riscv                 randconfig-001-20241024    gcc-14.1.0
riscv                 randconfig-002-20241024    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241024    gcc-14.1.0
s390                  randconfig-002-20241024    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241024    gcc-14.1.0
sh                    randconfig-002-20241024    gcc-14.1.0
sh                      rts7751r2d1_defconfig    gcc-14.1.0
sh                           se7750_defconfig    gcc-14.1.0
sh                             shx3_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241024    gcc-14.1.0
sparc64               randconfig-002-20241024    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241024    gcc-14.1.0
um                    randconfig-002-20241024    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241024    gcc-12
x86_64      buildonly-randconfig-002-20241024    gcc-12
x86_64      buildonly-randconfig-003-20241024    gcc-12
x86_64      buildonly-randconfig-004-20241024    gcc-12
x86_64      buildonly-randconfig-005-20241024    gcc-12
x86_64      buildonly-randconfig-006-20241024    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241024    gcc-12
x86_64                randconfig-002-20241024    gcc-12
x86_64                randconfig-003-20241024    gcc-12
x86_64                randconfig-004-20241024    gcc-12
x86_64                randconfig-005-20241024    gcc-12
x86_64                randconfig-006-20241024    gcc-12
x86_64                randconfig-011-20241024    gcc-12
x86_64                randconfig-012-20241024    gcc-12
x86_64                randconfig-013-20241024    gcc-12
x86_64                randconfig-014-20241024    gcc-12
x86_64                randconfig-015-20241024    gcc-12
x86_64                randconfig-016-20241024    gcc-12
x86_64                randconfig-071-20241024    gcc-12
x86_64                randconfig-072-20241024    gcc-12
x86_64                randconfig-073-20241024    gcc-12
x86_64                randconfig-074-20241024    gcc-12
x86_64                randconfig-075-20241024    gcc-12
x86_64                randconfig-076-20241024    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241024    gcc-14.1.0
xtensa                randconfig-002-20241024    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

