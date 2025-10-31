Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EB2CCF9FE
	for <ath12k@archiver.kernel.org>; Fri, 31 Oct 2025 22:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u4h0w+NsptftWOMVqc7MHEyENv3HiEu5JlCLCKaFhqc=; b=TnbybTL0G1YrjE8pAntuTZJbNm
	5b5G4cdS7fK2ejBtZ9x6iu5f3sB5ZszP9bHuvZUY89zHlWLl8wbZf7W8nlUGlpExxNIE9FuafL3R+
	t6PFMfKMLZBgE/2kFLHMBgwvEmn6YiN5AEdAnbo/X5rfI+2HnKccxVKwB6ebdOWOU7v7MX1hbwzop
	i20Bgb8lzAVWxHpg8NKlAE95Rucslj0th2yTjXWmLI96N7A9O/A2sdbffeBD+mytlDs3Ncc/W9FCw
	8bFfwNA2g4Vi5fyGsrzRDSlYyk3z2Eh4N968vAD2dyUUHb3zowtI9smUV1TjinjKRcbsY7nuzlj7D
	D+QSYhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExqI-00000006sKG-06Tz;
	Fri, 31 Oct 2025 22:43:34 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExqE-00000006sJs-0AiX
	for ath12k@lists.infradead.org;
	Fri, 31 Oct 2025 22:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761950610; x=1793486610;
  h=date:from:to:cc:subject:message-id;
  bh=JYhNaI76T+qyLycyG71RufqPJhYIhHEWyNhFDeKKD4A=;
  b=ivRAoUe82gfvraOxJz5r3HIlQcqqzQ9/JJEcOYVH2K9q7PSQ6/SNYNhY
   jDKbfzCGFHKYv9Y9h+VYVYIUq3Wg0r9THC1r3vgCZ1YRV9NPD6PBmVKg+
   KTAdsXVXVerKrPAK61JySCGV65JCBiAb71FZkujW7kB69f24aARofK4Fj
   3JoHzBjYt8APTz+E0QZSLZkVQblvsqKl7r1P84R3UFhXVEc8FYO/ghxoe
   ESyBlKVnG51INLrnCDFKaIe2Ig+zvJoP0WtrrnrRb60Sw7ONDVvBcCwdj
   Y7Z+4+OOYyVq/17fWwXqc9EfPHno/qoE1c4H+woqh8DiZz9QXGMu27oac
   g==;
X-CSE-ConnectionGUID: L6tP71OUS9u7OFpYRsIUKw==
X-CSE-MsgGUID: NvXiq8aJRNugAaCpa+O3NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64037403"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="64037403"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 15:43:29 -0700
X-CSE-ConnectionGUID: kSNm4iSAR4yongJ+rNlAsA==
X-CSE-MsgGUID: MvYjQjHaQh2WJseM10JLeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="190428674"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2025 15:43:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vExpc-000NhM-30;
	Fri, 31 Oct 2025 22:43:03 +0000
Date: Sat, 01 Nov 2025 06:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 f9886192d409c55c7600d239a8c04fb9f430b7b0
Message-ID: <202511010612.ajobpYed-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_154330_231261_0E6CFF89 
X-CRM114-Status: UNSURE (   3.64  )
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
branch HEAD: f9886192d409c55c7600d239a8c04fb9f430b7b0  Merge branch 'pending' into main-pending

elapsed time: 1468m

configs tested: 199
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251031    gcc-8.5.0
arc                   randconfig-002-20251031    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20251031    gcc-14.3.0
arm                   randconfig-001-20251031    gcc-8.5.0
arm                   randconfig-002-20251031    clang-22
arm                   randconfig-002-20251031    gcc-8.5.0
arm                   randconfig-003-20251031    gcc-11.5.0
arm                   randconfig-003-20251031    gcc-8.5.0
arm                   randconfig-004-20251031    clang-22
arm                   randconfig-004-20251031    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251031    gcc-10.5.0
arm64                 randconfig-002-20251031    gcc-10.5.0
arm64                 randconfig-003-20251031    gcc-10.5.0
arm64                 randconfig-004-20251031    gcc-10.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251031    gcc-10.5.0
csky                  randconfig-002-20251031    gcc-10.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251031    clang-22
hexagon               randconfig-002-20251031    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251031    clang-20
i386        buildonly-randconfig-002-20251031    clang-20
i386        buildonly-randconfig-003-20251031    clang-20
i386        buildonly-randconfig-004-20251031    clang-20
i386        buildonly-randconfig-005-20251031    clang-20
i386        buildonly-randconfig-006-20251031    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251031    clang-20
i386                  randconfig-002-20251031    clang-20
i386                  randconfig-003-20251031    clang-20
i386                  randconfig-004-20251031    clang-20
i386                  randconfig-005-20251031    clang-20
i386                  randconfig-006-20251031    clang-20
i386                  randconfig-007-20251031    clang-20
i386                  randconfig-011-20251031    gcc-13
i386                  randconfig-012-20251031    gcc-13
i386                  randconfig-013-20251031    gcc-13
i386                  randconfig-014-20251031    gcc-13
i386                  randconfig-015-20251031    gcc-13
i386                  randconfig-016-20251031    gcc-13
i386                  randconfig-017-20251031    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251031    clang-22
loongarch             randconfig-001-20251031    gcc-15.1.0
loongarch             randconfig-002-20251031    clang-22
loongarch             randconfig-002-20251031    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                       m5208evb_defconfig    clang-22
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251031    clang-22
nios2                 randconfig-001-20251031    gcc-9.5.0
nios2                 randconfig-002-20251031    clang-22
nios2                 randconfig-002-20251031    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251031    gcc-14.3.0
parisc                randconfig-002-20251031    gcc-15.1.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   lite5200b_defconfig    clang-22
powerpc                     mpc5200_defconfig    clang-22
powerpc               randconfig-001-20251031    clang-22
powerpc               randconfig-002-20251031    gcc-12.5.0
powerpc64             randconfig-001-20251031    clang-22
powerpc64             randconfig-002-20251031    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251031    clang-17
riscv                 randconfig-001-20251031    gcc-8.5.0
riscv                 randconfig-002-20251031    clang-17
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251031    clang-16
s390                  randconfig-001-20251031    clang-17
s390                  randconfig-002-20251031    clang-17
s390                  randconfig-002-20251031    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251031    clang-17
sh                    randconfig-001-20251031    gcc-14.3.0
sh                    randconfig-002-20251031    clang-17
sh                    randconfig-002-20251031    gcc-14.3.0
sh                           se7705_defconfig    clang-22
sh                           se7750_defconfig    clang-22
sh                            titan_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251031    gcc-8.5.0
sparc                 randconfig-002-20251031    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251031    gcc-8.5.0
sparc64               randconfig-002-20251031    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251031    gcc-8.5.0
um                    randconfig-002-20251031    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251031    gcc-14
x86_64      buildonly-randconfig-002-20251031    gcc-14
x86_64      buildonly-randconfig-003-20251031    gcc-14
x86_64      buildonly-randconfig-004-20251031    gcc-14
x86_64      buildonly-randconfig-005-20251031    gcc-14
x86_64      buildonly-randconfig-006-20251031    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251031    gcc-14
x86_64                randconfig-002-20251031    gcc-14
x86_64                randconfig-003-20251031    gcc-14
x86_64                randconfig-004-20251031    gcc-14
x86_64                randconfig-005-20251031    gcc-14
x86_64                randconfig-006-20251031    gcc-14
x86_64                randconfig-011-20251031    gcc-14
x86_64                randconfig-012-20251031    gcc-14
x86_64                randconfig-013-20251031    gcc-14
x86_64                randconfig-014-20251031    gcc-14
x86_64                randconfig-015-20251031    gcc-14
x86_64                randconfig-016-20251031    gcc-14
x86_64                randconfig-071-20251031    clang-20
x86_64                randconfig-072-20251031    clang-20
x86_64                randconfig-073-20251031    clang-20
x86_64                randconfig-074-20251031    clang-20
x86_64                randconfig-075-20251031    clang-20
x86_64                randconfig-076-20251031    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251031    gcc-8.5.0
xtensa                randconfig-002-20251031    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

