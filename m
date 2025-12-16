Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7244D5CCA5
	for <ath12k@archiver.kernel.org>; Tue, 16 Dec 2025 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KKa1KSSivgHn2xBaMNRcohOzWbFcGIdW+dCxEexO6eM=; b=XIOmy6/mPuUVmtQj/1l7SBzjvS
	rC+9xE0x3WQ4GfVTM/NG3gNw4oAk9RDrdMxKcPlf6o2heR4kjh24UnWJkjzp0eSWf5LmL28foGx7b
	fnTNshF/uzHSCNKuEuHNwVkQhhyZeyyL1joi5V8VSUC0s/Fp+oSLqi0M/lvct8rQB101wnUR0ZULU
	ORIT5hM4qj4vOknVNDnt0Rd8aYAR/9eX3zFLFpK8ZJuLJLfHNLinln7RVNg51OfZH3g1EqrQtcwSf
	FFB5qfPIK7spk7Q4WhzAXPch1RgYOD4F0ONeXbad+dZasypwJrxh5Yj3rtt5TT4BeM1NnzPb+U4Yy
	yNyatfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSAJ-000000051qK-1PUl;
	Tue, 16 Dec 2025 10:20:23 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSAG-000000051q1-1xGX
	for ath12k@lists.infradead.org;
	Tue, 16 Dec 2025 10:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765880421; x=1797416421;
  h=date:from:to:cc:subject:message-id;
  bh=anqV795D3jL/Cjo3ZtXMa2CFvFpcMJayDTOUkcS7/Q0=;
  b=Re+MLCGWO/DpJP0oJv+gDnuH9nAWoe8pCDVFW+BCo9+8XvRCBdv+nqFv
   9SOqPLK0VOvOplc95+TiVcYoXQvOBYBRhYrGMI8ot6+EgnS/c6YRQkxp/
   VzzBn6TSV7zoSJKJ3GGCAkMbRfWm/N4NRnnFNsOUjrtESMaLEYL8MEEc9
   C6u/MrSnLN3tYUjW/ixl3e8YvVo2E2pfVvZ9mHoaf3FMbrZ37Q1z0qtUW
   qF8utGJLFSDeo2h/sBwDupuUwK1R2n90q8h1r5TqH0+cG3kTtAQQ3AVY+
   XEEzzeM10bfdg/J/pqVLX/wlJgs7grMaTA1XPf+b7U6I9zdsSsTqXoGoQ
   Q==;
X-CSE-ConnectionGUID: 5IlOPsjFQqC0pSO3e4v+wg==
X-CSE-MsgGUID: fsl7DQ61TyiUYvuCp4xDWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67830796"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67830796"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:20:20 -0800
X-CSE-ConnectionGUID: Kv/UlIQwS0O2J/lholOXgg==
X-CSE-MsgGUID: LsESaS04SECeRPXlPmSRgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="229057993"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Dec 2025 02:20:18 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVSA7-000000001Ua-2H4X;
	Tue, 16 Dec 2025 10:20:13 +0000
Date: Tue, 16 Dec 2025 18:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 631ee338f04db713ba611883f28e94157ebb68e5
Message-ID: <202512161814.BPVgYP7w-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_022020_528077_E1D8CC18 
X-CRM114-Status: UNSURE (   3.45  )
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
branch HEAD: 631ee338f04db713ba611883f28e94157ebb68e5  Merge branch 'ath12k-ng' into ath-next

elapsed time: 1016m

configs tested: 270
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251216    gcc-12.5.0
arc                   randconfig-001-20251216    gcc-8.5.0
arc                   randconfig-002-20251216    gcc-12.5.0
arc                   randconfig-002-20251216    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                   milbeaut_m10v_defconfig    gcc-15.1.0
arm                   randconfig-001-20251216    gcc-10.5.0
arm                   randconfig-001-20251216    gcc-8.5.0
arm                   randconfig-002-20251216    gcc-8.5.0
arm                   randconfig-003-20251216    gcc-11.5.0
arm                   randconfig-003-20251216    gcc-8.5.0
arm                   randconfig-004-20251216    clang-19
arm                   randconfig-004-20251216    gcc-8.5.0
arm                             rpc_defconfig    clang-18
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251216    clang-16
arm64                 randconfig-001-20251216    gcc-10.5.0
arm64                 randconfig-002-20251216    gcc-10.5.0
arm64                 randconfig-002-20251216    gcc-8.5.0
arm64                 randconfig-003-20251216    gcc-10.5.0
arm64                 randconfig-004-20251216    gcc-10.5.0
arm64                 randconfig-004-20251216    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251216    gcc-10.5.0
csky                  randconfig-001-20251216    gcc-15.1.0
csky                  randconfig-002-20251216    gcc-10.5.0
csky                  randconfig-002-20251216    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251216    clang-22
hexagon               randconfig-001-20251216    gcc-8.5.0
hexagon               randconfig-002-20251216    clang-19
hexagon               randconfig-002-20251216    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251216    clang-20
i386        buildonly-randconfig-001-20251216    gcc-14
i386        buildonly-randconfig-002-20251216    gcc-14
i386        buildonly-randconfig-003-20251216    gcc-14
i386        buildonly-randconfig-004-20251216    gcc-14
i386        buildonly-randconfig-005-20251216    clang-20
i386        buildonly-randconfig-005-20251216    gcc-14
i386        buildonly-randconfig-006-20251216    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251216    clang-20
i386                  randconfig-001-20251216    gcc-14
i386                  randconfig-002-20251216    clang-20
i386                  randconfig-002-20251216    gcc-14
i386                  randconfig-003-20251216    gcc-14
i386                  randconfig-004-20251216    gcc-14
i386                  randconfig-005-20251216    gcc-14
i386                  randconfig-006-20251216    gcc-14
i386                  randconfig-007-20251216    clang-20
i386                  randconfig-007-20251216    gcc-14
i386                  randconfig-011-20251216    gcc-13
i386                  randconfig-012-20251216    clang-20
i386                  randconfig-012-20251216    gcc-13
i386                  randconfig-013-20251216    gcc-13
i386                  randconfig-014-20251216    gcc-13
i386                  randconfig-015-20251216    clang-20
i386                  randconfig-015-20251216    gcc-13
i386                  randconfig-016-20251216    clang-20
i386                  randconfig-016-20251216    gcc-13
i386                  randconfig-017-20251216    clang-20
i386                  randconfig-017-20251216    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251216    gcc-15.1.0
loongarch             randconfig-001-20251216    gcc-8.5.0
loongarch             randconfig-002-20251216    clang-22
loongarch             randconfig-002-20251216    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251216    gcc-8.5.0
nios2                 randconfig-002-20251216    gcc-11.5.0
nios2                 randconfig-002-20251216    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251216    clang-22
parisc                randconfig-001-20251216    gcc-11.5.0
parisc                randconfig-002-20251216    clang-22
parisc                randconfig-002-20251216    gcc-11.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251216    clang-22
powerpc               randconfig-002-20251216    clang-19
powerpc               randconfig-002-20251216    clang-22
powerpc64             randconfig-001-20251216    clang-22
powerpc64             randconfig-002-20251216    clang-17
powerpc64             randconfig-002-20251216    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251216    clang-17
riscv                 randconfig-001-20251216    gcc-9.5.0
riscv                 randconfig-002-20251216    clang-17
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251216    clang-17
s390                  randconfig-001-20251216    clang-22
s390                  randconfig-002-20251216    clang-17
s390                  randconfig-002-20251216    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251216    clang-17
sh                    randconfig-001-20251216    gcc-13.4.0
sh                    randconfig-002-20251216    clang-17
sh                    randconfig-002-20251216    gcc-12.5.0
sh                           se7712_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251216    gcc-8.5.0
sparc                 randconfig-002-20251216    gcc-14.3.0
sparc                 randconfig-002-20251216    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251216    clang-22
sparc64               randconfig-001-20251216    gcc-8.5.0
sparc64               randconfig-002-20251216    clang-22
sparc64               randconfig-002-20251216    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251216    gcc-12
um                    randconfig-001-20251216    gcc-8.5.0
um                    randconfig-002-20251216    gcc-14
um                    randconfig-002-20251216    gcc-8.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251216    clang-20
x86_64      buildonly-randconfig-002-20251216    clang-20
x86_64      buildonly-randconfig-002-20251216    gcc-14
x86_64      buildonly-randconfig-003-20251216    clang-20
x86_64      buildonly-randconfig-004-20251216    clang-20
x86_64      buildonly-randconfig-005-20251216    clang-20
x86_64      buildonly-randconfig-005-20251216    gcc-14
x86_64      buildonly-randconfig-006-20251216    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251216    clang-20
x86_64                randconfig-001-20251216    gcc-14
x86_64                randconfig-002-20251216    clang-20
x86_64                randconfig-003-20251216    clang-20
x86_64                randconfig-004-20251216    clang-20
x86_64                randconfig-004-20251216    gcc-14
x86_64                randconfig-005-20251216    clang-20
x86_64                randconfig-006-20251216    clang-20
x86_64                randconfig-006-20251216    gcc-14
x86_64                randconfig-011-20251216    clang-20
x86_64                randconfig-011-20251216    gcc-14
x86_64                randconfig-012-20251216    clang-20
x86_64                randconfig-012-20251216    gcc-14
x86_64                randconfig-013-20251216    clang-20
x86_64                randconfig-014-20251216    clang-20
x86_64                randconfig-015-20251216    clang-20
x86_64                randconfig-016-20251216    clang-20
x86_64                randconfig-071-20251216    clang-20
x86_64                randconfig-071-20251216    gcc-14
x86_64                randconfig-072-20251216    gcc-14
x86_64                randconfig-073-20251216    gcc-14
x86_64                randconfig-074-20251216    gcc-12
x86_64                randconfig-074-20251216    gcc-14
x86_64                randconfig-075-20251216    clang-20
x86_64                randconfig-075-20251216    gcc-14
x86_64                randconfig-076-20251216    clang-20
x86_64                randconfig-076-20251216    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251216    gcc-8.5.0
xtensa                randconfig-002-20251216    gcc-12.5.0
xtensa                randconfig-002-20251216    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

