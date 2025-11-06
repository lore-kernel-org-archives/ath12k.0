Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0402CCF9F8
	for <ath12k@archiver.kernel.org>; Thu,  6 Nov 2025 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y8MPdm+5di4f8KuRmeOBye2S2pnGo2d/an+O16fg3c0=; b=3vAOMA24wzGtSTyCzFnInCkPz4
	giOcV0X/6AKkU3QZ54sYomqfTNv+Jd0ePwJ4tfuq9wr/pol3H+SaHIOv2HcFZYgiciSP5R1HByBv/
	Y1hAcJrSTM8dOfzabTcDs8V4oNlfeD5Y41G45nCgJvBX6iHhM+HcqSIJnxx548EmbqAKAhpVXnzhg
	mIhDmWuTIC2yH4yTSqGD/X6MIEHBiFK7uUOe6ysDZMRt/lAKj2C53aEL+fb3EjJKmb7QFZuUztcb0
	Sd11n0RaWD48anUKdas5SWf5CVliQH42HB7nfmQSWlIOVmazck9btqB3gQHk/RH5beoBreJ/6f0Hd
	lp9nF26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2PS-0000000FrX8-2cqp;
	Thu, 06 Nov 2025 16:00:26 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2PL-0000000FrQT-2BdR
	for ath12k@lists.infradead.org;
	Thu, 06 Nov 2025 16:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762444819; x=1793980819;
  h=date:from:to:cc:subject:message-id;
  bh=yXS4duOGVkZBUAjLvdvhFWxKD+dKiD47LdELGlatYV0=;
  b=FVzos+R8TljjbXBr3dDB5Swb9/8l0sD4lYdYTYnUUdhG8dOYk2fEDcpi
   K1jnmi3dTvLfd5qwPyaRekjY2UydjIBfeNN/XIzmHwgFZbb6ZhV2zBwyc
   PAJC0Kl+jT+QPE7q9TERQtuehFBwa4Rvk2MwNWLLawbL6TvJgLR3f15Q1
   O98T8hAzvgTrELyA2/VH3o8keR39o6kJ6WBrt7Jx3sw3pJN1aZGtR5wZp
   F6hc/DBAFGR7NmAurJfxxMWlxgNyoLMw3GQZJdP6uSicQr+tXcsX4VP8h
   Bw18zTuujJ215xo7t2lSARk+00TMhIpWoSIaRT3qRK2d48Z4NvSaS18J/
   g==;
X-CSE-ConnectionGUID: mM1POZ7JRYyaeUMyW9K4pA==
X-CSE-MsgGUID: uY2OIwNUR42lo/B1+FtU6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="74876971"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="74876971"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:00:18 -0800
X-CSE-ConnectionGUID: ASoAD1VEShCiFrXz0LGelA==
X-CSE-MsgGUID: lfp76VXtSHa4/NfbpxBMNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187735950"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2025 08:00:16 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH2PF-000U6c-24;
	Thu, 06 Nov 2025 16:00:13 +0000
Date: Thu, 06 Nov 2025 23:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 f87034a7576f918f2e60a14f17185b492e91580d
Message-ID: <202511062346.UO1c7MIL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_080019_600524_0E4398AA 
X-CRM114-Status: UNSURE (   4.33  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-ath12k-ng
branch HEAD: f87034a7576f918f2e60a14f17185b492e91580d  wifi: ath12k: Replace lock/unlock with guard()

elapsed time: 1458m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20251106    gcc-12.5.0
arc                   randconfig-002-20251106    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20251106    gcc-11.5.0
arm                   randconfig-002-20251106    clang-22
arm                   randconfig-003-20251106    gcc-10.5.0
arm                   randconfig-004-20251106    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251106    gcc-11.5.0
arm64                 randconfig-002-20251106    clang-19
arm64                 randconfig-003-20251106    gcc-14.3.0
arm64                 randconfig-004-20251106    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251106    gcc-12.5.0
csky                  randconfig-002-20251106    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251106    clang-19
hexagon               randconfig-002-20251106    clang-20
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251106    clang-20
i386        buildonly-randconfig-002-20251106    clang-20
i386        buildonly-randconfig-003-20251106    gcc-14
i386        buildonly-randconfig-004-20251106    clang-20
i386        buildonly-randconfig-005-20251106    gcc-14
i386        buildonly-randconfig-006-20251106    gcc-14
i386                  randconfig-011-20251106    gcc-14
i386                  randconfig-012-20251106    clang-20
i386                  randconfig-013-20251106    clang-20
i386                  randconfig-014-20251106    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251106    gcc-15.1.0
loongarch             randconfig-002-20251106    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251106    gcc-9.5.0
nios2                 randconfig-002-20251106    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251106    gcc-10.5.0
parisc                randconfig-002-20251106    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     asp8347_defconfig    clang-22
powerpc                   motionpro_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    clang-22
powerpc               randconfig-001-20251106    gcc-14.3.0
powerpc               randconfig-002-20251106    clang-22
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20251106    gcc-8.5.0
powerpc64             randconfig-002-20251106    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20251106    clang-22
riscv                 randconfig-002-20251106    gcc-12.5.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251106    gcc-8.5.0
s390                  randconfig-002-20251106    gcc-14.3.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20251106    gcc-11.5.0
sh                    randconfig-002-20251106    gcc-13.4.0
sh                             sh03_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251106    gcc-15.1.0
sparc                 randconfig-002-20251106    gcc-15.1.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251106    gcc-13.4.0
sparc64               randconfig-002-20251106    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251106    gcc-14
um                    randconfig-002-20251106    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251106    gcc-12
x86_64      buildonly-randconfig-002-20251106    gcc-14
x86_64      buildonly-randconfig-003-20251106    gcc-14
x86_64      buildonly-randconfig-004-20251106    gcc-14
x86_64      buildonly-randconfig-005-20251106    clang-20
x86_64      buildonly-randconfig-006-20251106    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251106    clang-20
x86_64                randconfig-012-20251106    clang-20
x86_64                randconfig-013-20251106    clang-20
x86_64                randconfig-014-20251106    gcc-14
x86_64                randconfig-015-20251106    gcc-14
x86_64                randconfig-016-20251106    gcc-12
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251106    gcc-9.5.0
xtensa                randconfig-002-20251106    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

