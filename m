Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022A8CD37AC
	for <ath12k@archiver.kernel.org>; Tue, 12 May 2026 05:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7X7ypOE7Mx1akoN2Z6DexiuhUh6sBzjDkzTywArlUes=; b=J28afq8wdP2gT7lRm7FACJ2B/c
	u0PVOz0S/Z36C3VxRLhgy1c8HEEmuKI1cgFewKAonhCPbGLZydmGPQlV+gH33BFw3/4vzlOoZiIb0
	DMwqmMymglmSy9hvgloiq7qV1rnL9W7iOFfV2+jKjF1H9ZbSaQfGHI8TPBv8piuhv+NtbrB9hHVTq
	gH1dJ8clCd381tn47VuVh53u+E4ykkxmAz1COnwajWTMLM3KvZiReF3p5vMiicyb0sm4FGTXvRTJ3
	do5kf+fgmJeZiF9JvMocGZt1rwKrCcynYu3LCha9jB/Gn/U2JfC+j6SksZDuitBUY0vgGQqg9GabX
	oCi5LDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfHZ-0000000FX3Q-31cc;
	Tue, 12 May 2026 05:03:49 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfHX-0000000FX2z-2oDV
	for ath12k@lists.infradead.org;
	Tue, 12 May 2026 05:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778562227; x=1810098227;
  h=date:from:to:cc:subject:message-id;
  bh=5tnGU/4YgvNYiSphUI/kp2RCERcajroV5ozznEeU14I=;
  b=h5RCgxLvjUMwQ63EvCuHOW3duEdhNPTTNobnIwIi1XdrqrpR1FGEgCRQ
   Q3/WyfQKyPkxTPbSEHCFq/IaJPtnsrRdyq1X70SptvKpuIUn81VnmO8WZ
   IgTFrYMF/CwURq176cpX4dMNIC3rVxpJIEX14YXLkK/o3n/HHKZVZDgCd
   o6NAt/CqI0M9bKDPT7jP4iEYn+Iy1pZiL2oFZuXHoNxusmhb9yl4iF0Z9
   QJ87wI0DPgB/gFwMJdZkRMGIYvnAKMWHdXsv6im4ClLiZ04U62UE0iycM
   hI9t9a+XQdWvK+vl3t8SWxPlvb3X7HPaU0AUXuiKnNoiGi3nYIUK+c27z
   Q==;
X-CSE-ConnectionGUID: lh78PW1IQym5kP3JUx/gOQ==
X-CSE-MsgGUID: 7db21pm5St2HJRCesNB6bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104916933"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104916933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 22:03:46 -0700
X-CSE-ConnectionGUID: pRM8+M4sSCOLrYF40NW+PA==
X-CSE-MsgGUID: A8rKIxhiR2a5uc8Cqap24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="275780325"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 May 2026 22:03:44 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMfHS-000000001bM-0xJR;
	Tue, 12 May 2026 05:03:42 +0000
Date: Tue, 12 May 2026 13:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 9ba3b286130cc7be732c21342b21db7734a11680
Message-ID: <202605121318.VhbByAAo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_220347_724390_08617266 
X-CRM114-Status: UNSURE (   4.28  )
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
branch HEAD: 9ba3b286130cc7be732c21342b21db7734a11680  wifi: ath10k: skip WMI and beacon transmission when device is wedged

elapsed time: 732m

configs tested: 210
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260512    gcc-11.5.0
arc                   randconfig-002-20260512    gcc-11.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    clang-23
arm                   randconfig-001-20260512    gcc-11.5.0
arm                   randconfig-002-20260512    gcc-11.5.0
arm                   randconfig-003-20260512    gcc-11.5.0
arm                   randconfig-004-20260512    gcc-11.5.0
arm                             rpc_defconfig    clang-18
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260512    clang-23
arm64                 randconfig-001-20260512    gcc-14.3.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260512    clang-23
arm64                 randconfig-002-20260512    gcc-14.3.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260512    clang-23
arm64                 randconfig-003-20260512    gcc-14.3.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260512    clang-23
arm64                 randconfig-004-20260512    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260512    clang-23
csky                  randconfig-001-20260512    gcc-14.3.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260512    clang-23
csky                  randconfig-002-20260512    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260512    gcc-10.5.0
hexagon               randconfig-002-20260512    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260512    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260512    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260512    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260512    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260512    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260512    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260512    gcc-14
i386                  randconfig-002-20260512    gcc-14
i386                  randconfig-003-20260512    gcc-14
i386                  randconfig-004-20260512    gcc-14
i386                  randconfig-005-20260512    gcc-14
i386                  randconfig-006-20260512    gcc-14
i386                  randconfig-007-20260512    gcc-14
i386                  randconfig-011-20260512    clang-20
i386                  randconfig-011-20260512    gcc-14
i386                  randconfig-012-20260512    clang-20
i386                  randconfig-013-20260512    clang-20
i386                  randconfig-014-20260512    clang-20
i386                  randconfig-015-20260512    clang-20
i386                  randconfig-015-20260512    gcc-14
i386                  randconfig-016-20260512    clang-20
i386                  randconfig-016-20260512    gcc-14
i386                  randconfig-017-20260512    clang-20
i386                  randconfig-017-20260512    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260512    gcc-10.5.0
loongarch             randconfig-002-20260512    gcc-10.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-17
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260512    gcc-10.5.0
nios2                 randconfig-002-20260512    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260512    gcc-12.5.0
parisc                randconfig-002-20260512    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                       holly_defconfig    clang-23
powerpc               randconfig-001-20260512    gcc-12.5.0
powerpc               randconfig-002-20260512    gcc-12.5.0
powerpc64             randconfig-001-20260512    gcc-12.5.0
powerpc64             randconfig-002-20260512    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-15.2.0
riscv                 randconfig-001-20260512    gcc-15.2.0
riscv                          randconfig-002    gcc-15.2.0
riscv                 randconfig-002-20260512    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260512    gcc-15.2.0
s390                           randconfig-002    gcc-15.2.0
s390                  randconfig-002-20260512    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260512    gcc-15.2.0
sh                             randconfig-002    gcc-15.2.0
sh                    randconfig-002-20260512    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-13.4.0
sparc                 randconfig-001-20260512    gcc-13.4.0
sparc                          randconfig-002    gcc-13.4.0
sparc                 randconfig-002-20260512    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-13.4.0
sparc64               randconfig-001-20260512    gcc-13.4.0
sparc64                        randconfig-002    gcc-13.4.0
sparc64               randconfig-002-20260512    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-13.4.0
um                    randconfig-001-20260512    gcc-13.4.0
um                             randconfig-002    gcc-13.4.0
um                    randconfig-002-20260512    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260512    gcc-14
x86_64      buildonly-randconfig-002-20260512    gcc-14
x86_64      buildonly-randconfig-003-20260512    gcc-14
x86_64      buildonly-randconfig-004-20260512    gcc-14
x86_64      buildonly-randconfig-005-20260512    gcc-14
x86_64      buildonly-randconfig-006-20260512    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260512    gcc-14
x86_64                randconfig-002-20260512    gcc-14
x86_64                randconfig-003-20260512    gcc-14
x86_64                randconfig-004-20260512    gcc-14
x86_64                randconfig-005-20260512    gcc-14
x86_64                randconfig-006-20260512    gcc-14
x86_64                randconfig-011-20260512    clang-20
x86_64                randconfig-012-20260512    clang-20
x86_64                randconfig-013-20260512    clang-20
x86_64                randconfig-014-20260512    clang-20
x86_64                randconfig-015-20260512    clang-20
x86_64                randconfig-016-20260512    clang-20
x86_64                randconfig-071-20260512    clang-20
x86_64                randconfig-071-20260512    gcc-14
x86_64                randconfig-072-20260512    clang-20
x86_64                randconfig-073-20260512    clang-20
x86_64                randconfig-074-20260512    clang-20
x86_64                randconfig-074-20260512    gcc-14
x86_64                randconfig-075-20260512    clang-20
x86_64                randconfig-076-20260512    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-13.4.0
xtensa                randconfig-001-20260512    gcc-13.4.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260512    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

