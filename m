Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B087CD98C6
	for <ath12k@archiver.kernel.org>; Thu, 11 Jun 2026 02:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1JLeN1Gw6laSYpqY2v1fORyxqzssLNosAh67YxwDLl4=; b=fqezBS6USejKqS5c1Fyoyp5NfD
	yFQzaLU91EppXP0SfOiVz5OLABkxSu1UQdmJKwTUwLJgInlTzDDWohHPH+8XVi6V7oifIhQR++1uh
	FsFzHc228kINSbZWhxaBMjctbOKOln5b8E8XprrzS7I1BgjJoi+mvU3n8BGeLq+rKlToryxodmtVG
	OBQyIahwUNs2QObbJGU6XJ9agHqhsYxidp1pE4VRp8SrFZiULTf2TU3JLAPggZoSu7To4FoQe2M2N
	DfFkSjCkawZaXdijGfHqLLpv2sGuB0t0O3jKOtEiiGjV9alyq8/g2npLYdrqctvgTctxbok0KlLWF
	OS/4au+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVYc-00000008apV-0hpo;
	Thu, 11 Jun 2026 02:54:14 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVYZ-00000008ap1-2xXK
	for ath12k@lists.infradead.org;
	Thu, 11 Jun 2026 02:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781146452; x=1812682452;
  h=date:from:to:cc:subject:message-id;
  bh=6cmYemO+S1kZApR56MMqLqDUAidJc4mHQXjzE7/jmIs=;
  b=ANbV2/jQLwtnk83cNK2SwaUPOowdyLA4DUB21oBfSHQePViqlQyNktBY
   0GaWRXVsLqsmmgWu8biCkP2YAcAOs/kbgao4UQLK1x+0vQLBUcPglyarT
   Kwod6PMTp9/adsv1pMzoS1N8LEDv8z3pqvJr8iMTUYBwllhIfu9Su4vjL
   zAepNGt+0SN4jwzCjreZhUMGLu8Pp3slcyaT3GEyz103DW4lDKuSBwXAN
   c8/lPszlSQtL/7GqGfGWJfX46lD3wVESpzIjZIKyKK3djGW3dLc2w3K9/
   McLFH+5D83JFdoTklP1Pbv2uDuHrTP6ZQryF6pK5ejxcxaJYnnNfmYqqp
   A==;
X-CSE-ConnectionGUID: rdCXm/NBQbmE8T6Zn0JpOQ==
X-CSE-MsgGUID: utbbGNBhTFW4picou1AtRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82017908"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82017908"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 19:54:09 -0700
X-CSE-ConnectionGUID: qJG0zoAJRRmB8Nq+uNhd+Q==
X-CSE-MsgGUID: SLiD5OfLSE+lD7U1vdBfTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251268625"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2026 19:54:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXVYS-00000000MEA-3b19;
	Thu, 11 Jun 2026 02:54:04 +0000
Date: Thu, 11 Jun 2026 10:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 31206c06bd77693df9b53df5e9f5b7ca7ecaf55e
Message-ID: <202606111006.tlPAohVi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_195411_826539_0B16AF12 
X-CRM114-Status: UNSURE (   3.49  )
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
branch HEAD: 31206c06bd77693df9b53df5e9f5b7ca7ecaf55e  Merge branch 'pending' into main-pending

elapsed time: 3028m

configs tested: 299
configs skipped: 3

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
arc                   randconfig-001-20260610    gcc-8.5.0
arc                   randconfig-001-20260611    gcc-14.3.0
arc                   randconfig-002-20260610    gcc-9.5.0
arc                   randconfig-002-20260611    gcc-14.3.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                        mvebu_v7_defconfig    clang-23
arm                   randconfig-001-20260610    clang-23
arm                   randconfig-001-20260611    gcc-14.3.0
arm                   randconfig-002-20260610    clang-20
arm                   randconfig-002-20260611    gcc-14.3.0
arm                   randconfig-003-20260610    clang-23
arm                   randconfig-003-20260611    gcc-14.3.0
arm                   randconfig-004-20260610    clang-23
arm                   randconfig-004-20260611    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260610    gcc-11.5.0
arm64                 randconfig-001-20260611    gcc-14.3.0
arm64                 randconfig-002-20260610    gcc-9.5.0
arm64                 randconfig-002-20260611    gcc-14.3.0
arm64                 randconfig-003-20260610    gcc-8.5.0
arm64                 randconfig-003-20260611    gcc-14.3.0
arm64                 randconfig-004-20260610    clang-23
arm64                 randconfig-004-20260611    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260610    gcc-9.5.0
csky                  randconfig-001-20260611    gcc-14.3.0
csky                  randconfig-002-20260610    gcc-11.5.0
csky                  randconfig-002-20260611    gcc-14.3.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260610    clang-23
hexagon               randconfig-001-20260611    clang-17
hexagon               randconfig-002-20260610    clang-22
hexagon               randconfig-002-20260611    clang-17
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260610    gcc-14
i386        buildonly-randconfig-001-20260611    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260610    gcc-14
i386        buildonly-randconfig-002-20260611    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260610    gcc-14
i386        buildonly-randconfig-003-20260611    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260610    gcc-14
i386        buildonly-randconfig-004-20260611    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260610    gcc-14
i386        buildonly-randconfig-005-20260611    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260610    clang-22
i386        buildonly-randconfig-006-20260611    clang-22
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260610    gcc-14
i386                  randconfig-001-20260611    gcc-14
i386                  randconfig-002-20260610    gcc-14
i386                  randconfig-002-20260611    gcc-14
i386                  randconfig-003-20260610    clang-22
i386                  randconfig-003-20260611    gcc-14
i386                  randconfig-004-20260610    gcc-14
i386                  randconfig-004-20260611    gcc-14
i386                  randconfig-005-20260610    clang-22
i386                  randconfig-005-20260611    gcc-14
i386                  randconfig-006-20260610    gcc-14
i386                  randconfig-006-20260611    gcc-14
i386                  randconfig-007-20260610    gcc-14
i386                  randconfig-007-20260611    gcc-14
i386                  randconfig-011-20260610    clang-22
i386                  randconfig-011-20260611    gcc-14
i386                  randconfig-012-20260610    clang-22
i386                  randconfig-012-20260611    gcc-14
i386                  randconfig-013-20260610    clang-22
i386                  randconfig-013-20260611    gcc-14
i386                  randconfig-014-20260610    clang-22
i386                  randconfig-014-20260611    gcc-14
i386                  randconfig-015-20260610    clang-22
i386                  randconfig-015-20260611    gcc-14
i386                  randconfig-016-20260610    clang-22
i386                  randconfig-016-20260611    gcc-14
i386                  randconfig-017-20260610    gcc-14
i386                  randconfig-017-20260611    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260610    gcc-16.1.0
loongarch             randconfig-001-20260611    clang-17
loongarch             randconfig-002-20260610    gcc-16.1.0
loongarch             randconfig-002-20260611    clang-17
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
m68k                            mac_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260610    gcc-11.5.0
nios2                 randconfig-001-20260611    clang-17
nios2                 randconfig-002-20260610    gcc-11.5.0
nios2                 randconfig-002-20260611    clang-17
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
openrisc                 simple_smp_defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    clang-23
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260610    gcc-8.5.0
parisc                randconfig-001-20260611    gcc-13.4.0
parisc                randconfig-002-20260610    gcc-8.5.0
parisc                randconfig-002-20260611    gcc-13.4.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260610    gcc-9.5.0
powerpc               randconfig-001-20260611    gcc-13.4.0
powerpc               randconfig-002-20260610    clang-23
powerpc               randconfig-002-20260611    gcc-13.4.0
powerpc                     taishan_defconfig    clang-21
powerpc64             randconfig-001-20260610    clang-23
powerpc64             randconfig-001-20260611    gcc-13.4.0
powerpc64             randconfig-002-20260610    gcc-10.5.0
powerpc64             randconfig-002-20260611    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260610    gcc-15.2.0
riscv                 randconfig-001-20260611    gcc-12.5.0
riscv                 randconfig-002-20260610    gcc-8.5.0
riscv                 randconfig-002-20260611    gcc-12.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260610    clang-23
s390                  randconfig-001-20260611    gcc-12.5.0
s390                  randconfig-002-20260610    clang-23
s390                  randconfig-002-20260611    gcc-12.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    clang-23
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260610    gcc-16.1.0
sh                    randconfig-001-20260611    gcc-12.5.0
sh                    randconfig-002-20260610    gcc-16.1.0
sh                    randconfig-002-20260611    gcc-12.5.0
sh                   sh7770_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260610    gcc-8.5.0
sparc                 randconfig-001-20260611    gcc-15.2.0
sparc                 randconfig-002-20260610    gcc-14.3.0
sparc                 randconfig-002-20260611    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260610    gcc-12.5.0
sparc64               randconfig-001-20260611    gcc-15.2.0
sparc64               randconfig-002-20260610    clang-23
sparc64               randconfig-002-20260611    gcc-15.2.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260610    clang-23
um                    randconfig-001-20260611    gcc-15.2.0
um                    randconfig-002-20260610    clang-18
um                    randconfig-002-20260611    gcc-15.2.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260610    clang-22
x86_64      buildonly-randconfig-001-20260611    gcc-14
x86_64      buildonly-randconfig-002-20260610    gcc-14
x86_64      buildonly-randconfig-002-20260611    gcc-14
x86_64      buildonly-randconfig-003-20260610    clang-22
x86_64      buildonly-randconfig-003-20260611    gcc-14
x86_64      buildonly-randconfig-004-20260610    clang-22
x86_64      buildonly-randconfig-004-20260611    gcc-14
x86_64      buildonly-randconfig-005-20260610    gcc-14
x86_64      buildonly-randconfig-005-20260611    gcc-14
x86_64      buildonly-randconfig-006-20260610    gcc-14
x86_64      buildonly-randconfig-006-20260611    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260610    clang-22
x86_64                randconfig-001-20260611    gcc-14
x86_64                randconfig-002-20260610    clang-22
x86_64                randconfig-002-20260611    gcc-14
x86_64                randconfig-003-20260610    gcc-13
x86_64                randconfig-003-20260611    gcc-14
x86_64                randconfig-004-20260610    clang-22
x86_64                randconfig-004-20260611    gcc-14
x86_64                randconfig-005-20260610    clang-22
x86_64                randconfig-005-20260611    gcc-14
x86_64                randconfig-006-20260610    gcc-13
x86_64                randconfig-006-20260611    gcc-14
x86_64                randconfig-011-20260610    gcc-12
x86_64                randconfig-011-20260611    gcc-14
x86_64                randconfig-012-20260610    gcc-12
x86_64                randconfig-012-20260611    gcc-14
x86_64                randconfig-013-20260610    gcc-14
x86_64                randconfig-013-20260611    gcc-14
x86_64                randconfig-014-20260610    gcc-12
x86_64                randconfig-014-20260611    gcc-14
x86_64                randconfig-015-20260610    gcc-14
x86_64                randconfig-015-20260611    gcc-14
x86_64                randconfig-016-20260610    gcc-14
x86_64                randconfig-016-20260611    gcc-14
x86_64                randconfig-071-20260610    gcc-14
x86_64                randconfig-071-20260611    clang-22
x86_64                randconfig-072-20260610    clang-22
x86_64                randconfig-072-20260611    clang-22
x86_64                randconfig-073-20260610    clang-22
x86_64                randconfig-073-20260611    clang-22
x86_64                randconfig-074-20260610    gcc-14
x86_64                randconfig-074-20260611    clang-22
x86_64                randconfig-075-20260610    gcc-14
x86_64                randconfig-075-20260611    clang-22
x86_64                randconfig-076-20260610    clang-22
x86_64                randconfig-076-20260611    clang-22
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
xtensa                randconfig-001-20260610    gcc-8.5.0
xtensa                randconfig-001-20260611    gcc-15.2.0
xtensa                randconfig-002-20260610    gcc-8.5.0
xtensa                randconfig-002-20260611    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

