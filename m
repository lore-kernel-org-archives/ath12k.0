Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A6BCD98F2
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 06:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9tsTFhpKafz3YSNLEV0RvucJUVi0mP2ow9zftbqG2wA=; b=c4+rrx6JQjxQGSY2qOdHJ/9Y2d
	R9B4s2I8idMW3q0q8iJ4Bcm+E6PIsxdfkm7er9kuZ+4vViX4IyLbxI6X1SgjgMq9ikM9XcyDH58JG
	gwvmHeWhvks+RNNk7hDO8AvvlX0VpoLZcC4VGfvS15umjUXlhd4TfW+Vk7S4TAThvlFGx36ljaFC8
	JLrNVCUdQOEU0rcWfhH0IIMih0ZWb5C32siqmV+7F1zx0BU6jISbMv63BLD7Xl5+nJ0CkIL0NiOSL
	Nj0+Yy3CINdl5KPGWznGLOAWLvkGkJdAECALJjavjEY/OmxFl4X4I55PqsnbDHubnM3kno6cTsnMp
	MaXhjzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6LA-00000000hSd-1clg;
	Thu, 18 Jun 2026 06:35:04 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6L7-00000000hRy-2GNJ
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 06:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781764501; x=1813300501;
  h=date:from:to:cc:subject:message-id;
  bh=69kGb4EBfK0HA0tF3ZubLnu/9wCBFOcqc1BWG+DdLpE=;
  b=LC8KVCBmsjvWDvwN4VRmZ0imhT14mNgBq6YnsPl6RUwPmKdz2bSQCyPp
   w1qKQrMjMPvuNraBOJ4gCFoqi1Hx35bX+/TM0Vpz+myNN45HOhpG9z06/
   I3ZGigq8P+wJqoZy6H+JzrpyYDlx4HrjB5WUj8sZT9TVv9tdjb2s641ZA
   XzDL69I6Aiz48XPVUDNzmGx2a8qtIG3ur0rtZcVCebmEkGWwHP/hDg112
   oBcrCdxRxZRjUlxoiWcge8qaEVlObOCwQrPJ24ykYU7kRqisVpgtttqLf
   Km3JIhYNJUO1H2cDu8uQp6P2LyLFUuKVxPGbu2BKHBr+L0UmWAtHNxzar
   A==;
X-CSE-ConnectionGUID: CK2T5hXBSByoy7F2cN8WSw==
X-CSE-MsgGUID: WIMSoOB8TrG81UHMLA8h7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="100148534"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="100148534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:35:00 -0700
X-CSE-ConnectionGUID: GVQXqwTaTj2TstrZlH2AZg==
X-CSE-MsgGUID: XU3woamQQw2TDv8NPCLxtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="244112503"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jun 2026 23:34:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa6L2-00000000VIw-0h0a;
	Thu, 18 Jun 2026 06:34:56 +0000
Date: Thu, 18 Jun 2026 14:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9
Message-ID: <202606181411.46pl2cL1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_233501_626760_E2B2161D 
X-CRM114-Status: UNSURE (   3.67  )
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
branch HEAD: 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9  Add localversion-wireless-testing-ath

elapsed time: 741m

configs tested: 200
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260618    gcc-15.2.0
arc                   randconfig-002-20260618    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260618    gcc-15.2.0
arm                   randconfig-002-20260618    gcc-15.2.0
arm                   randconfig-003-20260618    gcc-15.2.0
arm                   randconfig-004-20260618    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260618    gcc-15.2.0
arm64                 randconfig-002-20260618    gcc-15.2.0
arm64                 randconfig-003-20260618    gcc-15.2.0
arm64                 randconfig-004-20260618    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260618    gcc-15.2.0
csky                  randconfig-002-20260618    gcc-15.2.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260618    clang-23
hexagon               randconfig-002-20260618    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260618    gcc-14
i386        buildonly-randconfig-002-20260618    gcc-14
i386        buildonly-randconfig-003-20260618    gcc-14
i386        buildonly-randconfig-004-20260618    gcc-14
i386        buildonly-randconfig-005-20260618    gcc-14
i386        buildonly-randconfig-006-20260618    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260618    clang-22
i386                  randconfig-002-20260618    clang-22
i386                  randconfig-003-20260618    clang-22
i386                  randconfig-004-20260618    clang-22
i386                  randconfig-005-20260618    clang-22
i386                  randconfig-006-20260618    clang-22
i386                  randconfig-007-20260618    clang-22
i386                  randconfig-011-20260618    clang-22
i386                  randconfig-012-20260618    clang-22
i386                  randconfig-013-20260618    clang-22
i386                  randconfig-014-20260618    clang-22
i386                  randconfig-015-20260618    clang-22
i386                  randconfig-016-20260618    clang-22
i386                  randconfig-017-20260618    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260618    clang-23
loongarch             randconfig-002-20260618    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260618    clang-23
nios2                 randconfig-002-20260618    clang-23
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260618    gcc-16.1.0
parisc                randconfig-002-20260618    gcc-16.1.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260618    gcc-16.1.0
powerpc               randconfig-002-20260618    gcc-16.1.0
powerpc64             randconfig-001-20260618    gcc-16.1.0
powerpc64             randconfig-002-20260618    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260618    gcc-13.4.0
riscv                 randconfig-002-20260618    gcc-13.4.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260618    gcc-13.4.0
s390                  randconfig-002-20260618    gcc-13.4.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                         ap325rxa_defconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260618    gcc-13.4.0
sh                    randconfig-002-20260618    gcc-13.4.0
sh                           se7619_defconfig    gcc-16.1.0
sh                        sh7763rdp_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260618    gcc-14.3.0
sparc                 randconfig-002-20260618    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260618    gcc-14.3.0
sparc64               randconfig-002-20260618    gcc-14.3.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260618    gcc-14.3.0
um                    randconfig-002-20260618    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260618    clang-22
x86_64      buildonly-randconfig-002-20260618    clang-22
x86_64      buildonly-randconfig-003-20260618    clang-22
x86_64      buildonly-randconfig-004-20260618    clang-22
x86_64      buildonly-randconfig-004-20260618    gcc-14
x86_64      buildonly-randconfig-005-20260618    clang-22
x86_64      buildonly-randconfig-006-20260618    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260618    clang-22
x86_64                randconfig-002-20260618    clang-22
x86_64                randconfig-003-20260618    clang-22
x86_64                randconfig-004-20260618    clang-22
x86_64                randconfig-005-20260618    clang-22
x86_64                randconfig-006-20260618    clang-22
x86_64                randconfig-011-20260618    gcc-14
x86_64                randconfig-012-20260618    gcc-14
x86_64                randconfig-013-20260618    gcc-14
x86_64                randconfig-014-20260618    gcc-14
x86_64                randconfig-015-20260618    gcc-14
x86_64                randconfig-016-20260618    gcc-14
x86_64                randconfig-071-20260618    clang-22
x86_64                randconfig-072-20260618    clang-22
x86_64                randconfig-073-20260618    clang-22
x86_64                randconfig-074-20260618    clang-22
x86_64                randconfig-075-20260618    clang-22
x86_64                randconfig-076-20260618    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260618    gcc-14.3.0
xtensa                randconfig-002-20260618    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

