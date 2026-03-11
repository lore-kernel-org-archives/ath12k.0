Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEE0FD88F3
	for <ath12k@archiver.kernel.org>; Wed, 11 Mar 2026 04:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Siu73g8nvk80ZWdJwPgE8G3cBZ/I5grM0ccqvfGu+VI=; b=BfBso2jQlH2bfd63pIin0ZbyK4
	ktAKOTcgxKBHilj1tpB88mPY+LGpgxODid5SSmXTfrNsMZ1OqScAG3QTiXtovhBX6dCy38TLh13fT
	b9qrUj/hahLd+sOJFLKQntjrrCIR//DB+2nGSSGBZrYSPGySuPHGBphU87/g+tlqz/3HfedTZHTDD
	3yrdDwqWumIH4Fqw6MLeh+Nsvw2HHKOo298H2xIu952RO7TTeikq1Guyf1f/+OB0aWtKuBWzYT/ln
	4hcpNabuBHE6epHEGwkr4bdNFXHK9JBTYXtZKfymd3esrj5x0wcRyOsou35ssCUtQtaPl84gK7p4o
	IG8h4P2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0AvW-0000000AgcD-3bW9;
	Wed, 11 Mar 2026 04:12:06 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0AvU-0000000AgbT-0jf2
	for ath12k@lists.infradead.org;
	Wed, 11 Mar 2026 04:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773202324; x=1804738324;
  h=date:from:to:cc:subject:message-id;
  bh=L5AtOzcD73+1Mh/yQxK7WQWOzGkdRwksk/yiZnmDndg=;
  b=jNlusaIqg2ElM3iyMoA7SZxz+d4ezxizVE72ZdZMBTRb5MItYQapoJfE
   IaR+B2e1BhjVRvRlSaNiGHp+gCM/ZZCrv/Fwbzx/OTTxamr58bohxu6z9
   HSdvc4dw/8yBs4ul3/7r7aX5KAwLA47gOyOSoot/CQu6nxCOTFdjjfSyW
   Ft+7EOllcWqndoE5q52ZftZUxvL946M/CuxJxQnjt0xGVJal0yQP7P09t
   V87x8CH031zpNpSd4H/X2NG00Yg89GDfNyt0zDUItsvPadsImo+MlhAFQ
   qZvOxEHvpRcYR8Gj6UKFflbw3ATfymj2KinuMA8wSPmNNYdGnG7AI+QmC
   Q==;
X-CSE-ConnectionGUID: 71uPINVCSUG29iGAS614cA==
X-CSE-MsgGUID: SoI7Tt5hSfyog3NAahzhPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="76872340"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="76872340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 21:12:01 -0700
X-CSE-ConnectionGUID: C8sKptWbTAq8w6yJXdzAtw==
X-CSE-MsgGUID: NXQWTJBdScaUOGSRKqF2bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="218237461"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2026 21:12:01 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0AvO-000000000gX-0Asm;
	Wed, 11 Mar 2026 04:11:58 +0000
Date: Wed, 11 Mar 2026 12:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 27401c9b143278eb9fa7d46f97ab063d65e5afd5
Message-ID: <202603111245.xcVMnAI9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_211204_254517_1A8A3007 
X-CRM114-Status: UNSURE (   3.56  )
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
branch HEAD: 27401c9b143278eb9fa7d46f97ab063d65e5afd5  wifi: ath12k: Use .mbn firmware for AHB devices

elapsed time: 739m

configs tested: 168
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
alpha                     defconfig    gcc-15.2.0
arc                    allmodconfig    clang-16
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc                       defconfig    gcc-15.2.0
arc         randconfig-001-20260311    gcc-14.3.0
arc         randconfig-001-20260311    gcc-8.5.0
arc         randconfig-002-20260311    gcc-8.5.0
arc         randconfig-002-20260311    gcc-9.5.0
arm                     allnoconfig    clang-23
arm                     allnoconfig    gcc-15.2.0
arm                    allyesconfig    clang-16
arm                    allyesconfig    gcc-15.2.0
arm                       defconfig    clang-23
arm                       defconfig    gcc-15.2.0
arm         randconfig-001-20260311    clang-23
arm         randconfig-001-20260311    gcc-8.5.0
arm         randconfig-002-20260311    gcc-8.5.0
arm         randconfig-003-20260311    clang-16
arm         randconfig-003-20260311    gcc-8.5.0
arm         randconfig-004-20260311    gcc-8.5.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64                     defconfig    gcc-15.2.0
arm64       randconfig-001-20260311    gcc-12.5.0
arm64       randconfig-002-20260311    gcc-12.5.0
arm64       randconfig-003-20260311    gcc-12.5.0
arm64       randconfig-004-20260311    gcc-12.5.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky                      defconfig    gcc-15.2.0
csky        randconfig-001-20260311    gcc-11.5.0
csky        randconfig-001-20260311    gcc-12.5.0
csky        randconfig-002-20260311    gcc-11.5.0
csky        randconfig-002-20260311    gcc-12.5.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
hexagon                 allnoconfig    gcc-15.2.0
hexagon                   defconfig    clang-23
hexagon                   defconfig    gcc-15.2.0
hexagon     randconfig-001-20260311    clang-23
hexagon     randconfig-002-20260311    clang-16
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                    allnoconfig    gcc-15.2.0
i386                   allyesconfig    gcc-14
i386                      defconfig    clang-20
i386                      defconfig    gcc-15.2.0
i386        randconfig-001-20260311    gcc-14
i386        randconfig-002-20260311    gcc-14
i386        randconfig-003-20260311    gcc-14
i386        randconfig-004-20260311    gcc-14
i386        randconfig-005-20260311    gcc-14
i386        randconfig-006-20260311    gcc-14
i386        randconfig-007-20260311    gcc-14
i386        randconfig-011-20260311    gcc-14
i386        randconfig-012-20260311    gcc-14
i386        randconfig-013-20260311    gcc-14
i386        randconfig-014-20260311    gcc-14
i386        randconfig-015-20260311    clang-20
i386        randconfig-015-20260311    gcc-14
i386        randconfig-016-20260311    clang-20
i386        randconfig-016-20260311    gcc-14
i386        randconfig-017-20260311    clang-20
i386        randconfig-017-20260311    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch               allnoconfig    gcc-15.2.0
loongarch                 defconfig    clang-19
loongarch   randconfig-001-20260311    clang-23
loongarch   randconfig-002-20260311    gcc-15.2.0
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    clang-16
m68k                   allyesconfig    gcc-15.2.0
m68k                      defconfig    clang-19
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
microblaze                defconfig    clang-19
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    clang-23
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    clang-23
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    clang-19
nios2       randconfig-001-20260311    gcc-8.5.0
nios2       randconfig-002-20260311    gcc-11.5.0
openrisc               allmodconfig    clang-23
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    clang-23
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    clang-23
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260311    clang-23
parisc      randconfig-001-20260311    gcc-14.3.0
parisc      randconfig-002-20260311    clang-23
parisc      randconfig-002-20260311    gcc-11.5.0
parisc64                  defconfig    clang-19
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    clang-23
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260311    clang-23
powerpc     randconfig-001-20260311    gcc-10.5.0
powerpc     randconfig-002-20260311    clang-23
powerpc     randconfig-002-20260311    gcc-8.5.0
powerpc64   randconfig-001-20260311    clang-23
powerpc64   randconfig-002-20260311    clang-23
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    clang-23
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-14
sh              sh7785lcr_defconfig    gcc-15.2.0
sparc                   allnoconfig    clang-23
sparc                   allnoconfig    gcc-15.2.0
sparc       randconfig-001-20260311    gcc-8.5.0
sparc       randconfig-002-20260311    gcc-8.5.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    gcc-14
sparc64     randconfig-001-20260311    gcc-8.5.0
sparc64     randconfig-002-20260311    gcc-8.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                        defconfig    gcc-14
um                   i386_defconfig    gcc-14
um          randconfig-001-20260311    gcc-8.5.0
um          randconfig-002-20260311    gcc-8.5.0
um                 x86_64_defconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                  allnoconfig    clang-23
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64                        kexec    clang-20
x86_64      randconfig-011-20260311    gcc-13
x86_64      randconfig-012-20260311    gcc-13
x86_64      randconfig-013-20260311    gcc-13
x86_64      randconfig-014-20260311    gcc-13
x86_64      randconfig-015-20260311    gcc-13
x86_64      randconfig-016-20260311    gcc-13
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    clang-23
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    clang-23
xtensa                 allyesconfig    gcc-15.2.0
xtensa      randconfig-001-20260311    gcc-8.5.0
xtensa      randconfig-002-20260311    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

