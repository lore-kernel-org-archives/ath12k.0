Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D880E6918F
	for <ath12k@archiver.kernel.org>; Fri, 22 Nov 2024 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GadUqqBvdWg234LaIt/Vfc1KowLCchbrDxA6ScFD0p0=; b=oJ7w6LimbRYiATHxF0KgsVCldw
	viBgZUBrGWol/P3tknHsaQhGORItsbA392ahMk8UgX6wlwB8QryK3x1h1TnsNdKIzBZGPyybbfaxM
	ytI5DYZ1VVjkTlvrwbjMdLajzbDHhQjrkp1MSFcMZ+UnKa3UHwY1bIoPbmTbgIAt4PM/pqmAGMV3B
	uYNna5tkLdgtLiI3fh3HMe3QH8oA+ZTzaFXrfbfcFpTYBr8rT5gLoUE3nd+7wz1rMTN+3QhxjKONM
	UEio4uygjBjLZg75FaPQ0lcoB3IbJbXIY/jQZLWnDAS5/O+KPPWzBf6RY0phgR+1zPQUjDhBrmKFO
	v1BxmnTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZKA-00000003CLN-3E9B
	for ath12k@archiver.kernel.org;
	Fri, 22 Nov 2024 19:28:14 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZK8-00000003CL1-10LJ
	for ath12k@lists.infradead.org;
	Fri, 22 Nov 2024 19:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732303692; x=1763839692;
  h=date:from:to:cc:subject:message-id;
  bh=vBghRE9D798rso5NN2GyO+49dOVpNwMYPKbd/vOCK14=;
  b=AstWDZVnpze0+aHgghJl2vdYzMSSLrtXWKq3NCnvtB5DNxFwt6c/JG0g
   JSernsH4FljFCRDPsVxvAa2UxGpZN+DzQMb89/75jjJTkalv2+fRDQ2/V
   qVMl4rBNYKcWPxLy4seHYPnAbXwJbfo51DUlGPxqUmeqaBaSHmJ2d9+TV
   Dr84I0fCsAtIXniJVbYQOluCb/ciSJbU/eFM9w2LG2R4QrExFaiwtmsjF
   /D3G7wtAsQtt5B5J0lOtZQ8NKemu3jfuUMMv+TcxLrADU3XH5EP3LI/k6
   YcKHRfghdHOm+nYmrg6MS4am7/TCSdcewumrrKzkY3yEf/k7luufnrPLC
   g==;
X-CSE-ConnectionGUID: 1rtTx8Z5R6iGfZrc/yU1kg==
X-CSE-MsgGUID: lJdwbIzxRRS8smch2liC8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32408273"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="32408273"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 11:28:06 -0800
X-CSE-ConnectionGUID: ryffBeuOSkKBwHrDIN0fIw==
X-CSE-MsgGUID: SPUQBD8ESAm8FD8WlEZSHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="121615989"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2024 11:28:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEZJy-0004AL-3C;
	Fri, 22 Nov 2024 19:28:02 +0000
Date: Sat, 23 Nov 2024 03:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 6680024deec5d0943e14cc51e22c2fcaf307f4d2
Message-ID: <202411230302.5OpMuDJ7-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_112812_330027_EBD7B2F4 
X-CRM114-Status: UNSURE (   3.71  )
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
branch HEAD: 6680024deec5d0943e14cc51e22c2fcaf307f4d2  wifi: ath12k: Use mac80211 sta's link_sta instead of deflink

elapsed time: 1451m

configs tested: 215
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20241122    gcc-13.2.0
arc                   randconfig-002-20241122    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                        multi_v7_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20241122    clang-17
arm                   randconfig-002-20241122    gcc-14.2.0
arm                   randconfig-003-20241122    clang-20
arm                   randconfig-004-20241122    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241122    gcc-14.2.0
arm64                 randconfig-002-20241122    gcc-14.2.0
arm64                 randconfig-003-20241122    gcc-14.2.0
arm64                 randconfig-004-20241122    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241122    gcc-14.2.0
csky                  randconfig-002-20241122    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241122    clang-20
hexagon               randconfig-002-20241122    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241122    clang-19
i386        buildonly-randconfig-002-20241122    clang-19
i386        buildonly-randconfig-003-20241122    clang-19
i386        buildonly-randconfig-004-20241122    clang-19
i386        buildonly-randconfig-005-20241122    gcc-12
i386        buildonly-randconfig-006-20241122    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241122    gcc-12
i386                  randconfig-002-20241122    clang-19
i386                  randconfig-003-20241122    gcc-12
i386                  randconfig-004-20241122    clang-19
i386                  randconfig-005-20241122    gcc-12
i386                  randconfig-006-20241122    gcc-12
i386                  randconfig-011-20241122    gcc-12
i386                  randconfig-012-20241122    gcc-12
i386                  randconfig-013-20241122    gcc-12
i386                  randconfig-014-20241122    gcc-12
i386                  randconfig-015-20241122    gcc-12
i386                  randconfig-016-20241122    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241122    gcc-14.2.0
loongarch             randconfig-002-20241122    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
mips                            gpr_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241122    gcc-14.2.0
nios2                 randconfig-002-20241122    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241122    gcc-14.2.0
parisc                randconfig-002-20241122    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241122    gcc-14.2.0
powerpc               randconfig-002-20241122    clang-20
powerpc               randconfig-003-20241122    clang-20
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241122    gcc-14.2.0
powerpc64             randconfig-002-20241122    gcc-14.2.0
powerpc64             randconfig-003-20241122    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241122    gcc-14.2.0
riscv                 randconfig-002-20241122    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241122    clang-20
s390                  randconfig-002-20241122    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20241122    gcc-14.2.0
sh                    randconfig-002-20241122    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241122    gcc-14.2.0
sparc64               randconfig-002-20241122    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241122    clang-17
um                    randconfig-002-20241122    gcc-11
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241122    clang-19
x86_64      buildonly-randconfig-001-20241122    gcc-12
x86_64      buildonly-randconfig-002-20241122    clang-19
x86_64      buildonly-randconfig-003-20241122    clang-19
x86_64      buildonly-randconfig-003-20241122    gcc-12
x86_64      buildonly-randconfig-004-20241122    clang-19
x86_64      buildonly-randconfig-004-20241122    gcc-12
x86_64      buildonly-randconfig-005-20241122    clang-19
x86_64      buildonly-randconfig-006-20241122    clang-19
x86_64      buildonly-randconfig-006-20241122    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241122    clang-19
x86_64                randconfig-001-20241122    gcc-12
x86_64                randconfig-002-20241122    clang-19
x86_64                randconfig-003-20241122    clang-19
x86_64                randconfig-003-20241122    gcc-12
x86_64                randconfig-004-20241122    clang-19
x86_64                randconfig-005-20241122    clang-19
x86_64                randconfig-005-20241122    gcc-12
x86_64                randconfig-006-20241122    clang-19
x86_64                randconfig-011-20241122    clang-19
x86_64                randconfig-012-20241122    clang-19
x86_64                randconfig-012-20241122    gcc-12
x86_64                randconfig-013-20241122    clang-19
x86_64                randconfig-013-20241122    gcc-12
x86_64                randconfig-014-20241122    clang-19
x86_64                randconfig-014-20241122    gcc-12
x86_64                randconfig-015-20241122    clang-19
x86_64                randconfig-015-20241122    gcc-12
x86_64                randconfig-016-20241122    clang-19
x86_64                randconfig-016-20241122    gcc-12
x86_64                randconfig-071-20241122    clang-19
x86_64                randconfig-072-20241122    clang-19
x86_64                randconfig-072-20241122    gcc-12
x86_64                randconfig-073-20241122    clang-19
x86_64                randconfig-073-20241122    gcc-12
x86_64                randconfig-074-20241122    clang-19
x86_64                randconfig-075-20241122    clang-19
x86_64                randconfig-075-20241122    gcc-12
x86_64                randconfig-076-20241122    clang-19
x86_64                randconfig-076-20241122    gcc-11
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241122    gcc-14.2.0
xtensa                randconfig-002-20241122    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

