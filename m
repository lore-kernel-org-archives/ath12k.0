Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F0FCD5BB1
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G5mAB6ydbGadddBL0p75v285UldxNRKErP4L0usnL8s=; b=FuX2MvEWBdKRThoq8yO44CIW8l
	Hla/rWpVnyVljf9lqfgZtU/Eo4wpDXl0HegB2kflW1A0QD463a0u9HLj+LbLpD9h/lr22GSbjTs0X
	C4n153ijLK5EG3ra901ai3ZPZJ1dMMFnoTzQ1ZU56X4rpyQrh3EWlbmvChRh99ztGhNvPmduxLLQL
	u5VJNycxCQWroigSlnDxAezSvYZ3jX/P8/LVlECR/90phRJySG/QW78pQFMqvLJnDAk815ulZW3dG
	m55TDHSGAMAndcmpkn9JqjKy+zx106AUCXVYO5jtlkoLBgwJvTPbj2jXTZukFr4JhscI+NwxUwaxV
	cziOHPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMx0-0000000ATQr-25AY;
	Fri, 22 May 2026 10:17:54 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMwx-0000000ATNx-2F4X
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 10:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779445071; x=1810981071;
  h=date:from:to:cc:subject:message-id;
  bh=2ua8k3dKpoSDWt5u1Ry6gfovqy5C0PkgvMsR0yOnw3k=;
  b=GMFzeosrVDaxevmex/+tnWJ4wVpJUC+YBmxOS0G0d0BWPLqhric2O2qI
   rk6u4HP5jk/p1m5sHsDWqqZyvOgfb09soN2oOMzaVzMTFWTQDsVj0Xm5r
   LaVPEHeT350qPy+KvOqvtblc7Klh5/xHLxOMMm8OY1CHjpsPMn4svS7dW
   mKSjcs5qGj3X6GGXPR5qk4wnLqWtpNTpEcoE+uiAZQPs2A4hCsfjnFsvl
   jEIzTYI1ADZAcBsirJxBemLZTJLV015TcOf9XcPIAHzb0KiQR1IvLQLPF
   0eBtOLo/YEUdq+K1NLL8ggya7hsZpuq4/iZNuj2IOetifYq0wEuC1CN8i
   A==;
X-CSE-ConnectionGUID: F/+OoJODSVOAXfl4Ld3F/A==
X-CSE-MsgGUID: gEkptpfnQMmUw0lZRrTFXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90947220"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="90947220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:17:50 -0700
X-CSE-ConnectionGUID: o4O6C+xRRLiywSSs3dzL4A==
X-CSE-MsgGUID: hbg3ygEFQHSSVWlUThk7Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="271221424"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 May 2026 03:17:50 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQMwt-000000002DJ-0Nax;
	Fri, 22 May 2026 10:17:47 +0000
Date: Fri, 22 May 2026 18:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 ff61789eb0f91081526b9dcd353938c64150b9ae
Message-ID: <202605221817.zcjkwujn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031751_588393_B16252FF 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: ff61789eb0f91081526b9dcd353938c64150b9ae  Merge branch 'pending' into main-pending

elapsed time: 1060m

configs tested: 144
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                   randconfig-001-20260522    clang-23
arc                   randconfig-002-20260522    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                   randconfig-001-20260522    clang-23
arm                   randconfig-002-20260522    clang-23
arm                   randconfig-003-20260522    clang-23
arm                   randconfig-004-20260522    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260522    gcc-14.3.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260522    gcc-14.3.0
arm64                          randconfig-003    gcc-14.3.0
arm64                 randconfig-003-20260522    gcc-14.3.0
arm64                          randconfig-004    gcc-14.3.0
arm64                 randconfig-004-20260522    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                           randconfig-001    gcc-14.3.0
csky                  randconfig-001-20260522    gcc-14.3.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260522    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    gcc-15.2.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260522    clang-20
i386        buildonly-randconfig-002-20260522    clang-20
i386        buildonly-randconfig-003-20260522    clang-20
i386        buildonly-randconfig-004-20260522    clang-20
i386        buildonly-randconfig-005-20260522    clang-20
i386        buildonly-randconfig-006-20260522    clang-20
i386                  randconfig-011-20260522    clang-20
i386                  randconfig-012-20260522    clang-20
i386                  randconfig-013-20260522    clang-20
i386                  randconfig-014-20260522    clang-20
i386                  randconfig-015-20260522    clang-20
i386                  randconfig-016-20260522    clang-20
i386                  randconfig-017-20260522    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
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
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260522    gcc-12.5.0
parisc                randconfig-002-20260522    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260522    gcc-12.5.0
powerpc               randconfig-002-20260522    gcc-12.5.0
powerpc64             randconfig-001-20260522    gcc-12.5.0
powerpc64             randconfig-002-20260522    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260522    gcc-9.5.0
sparc                 randconfig-002-20260522    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260522    gcc-9.5.0
sparc64               randconfig-002-20260522    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260522    gcc-9.5.0
um                    randconfig-002-20260522    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260522    gcc-14
x86_64      buildonly-randconfig-002-20260522    gcc-14
x86_64      buildonly-randconfig-003-20260522    gcc-14
x86_64      buildonly-randconfig-004-20260522    gcc-14
x86_64      buildonly-randconfig-005-20260522    gcc-14
x86_64      buildonly-randconfig-006-20260522    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260522    gcc-14
x86_64                randconfig-002-20260522    gcc-14
x86_64                randconfig-003-20260522    gcc-14
x86_64                randconfig-004-20260522    gcc-14
x86_64                randconfig-005-20260522    gcc-14
x86_64                randconfig-006-20260522    gcc-14
x86_64                randconfig-011-20260522    gcc-14
x86_64                randconfig-012-20260522    gcc-14
x86_64                randconfig-013-20260522    gcc-14
x86_64                randconfig-014-20260522    gcc-14
x86_64                randconfig-015-20260522    gcc-14
x86_64                randconfig-016-20260522    gcc-14
x86_64                randconfig-071-20260522    clang-20
x86_64                randconfig-072-20260522    clang-20
x86_64                randconfig-073-20260522    clang-20
x86_64                randconfig-074-20260522    clang-20
x86_64                randconfig-075-20260522    clang-20
x86_64                randconfig-076-20260522    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260522    gcc-9.5.0
xtensa                randconfig-002-20260522    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

