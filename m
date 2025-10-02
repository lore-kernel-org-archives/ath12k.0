Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275D3CAC5B0
	for <ath12k@archiver.kernel.org>; Thu,  2 Oct 2025 18:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=URsjvs+wAMG5qJxXUOfn1Rdxf8/Kad7fHdRatpT0h3o=; b=twtvPZttb7Ot1JlHn5uaw5eas6
	LJAlvFCmY+FB92RnnxRlhh0jJ/epEpquz/pzG4HEt2CYVJZDPXz8UKanacRe7SpZvBB/35bhTHmGZ
	Yqm3GY03/FKbuen+F9BODRQXa5jBRtYx6WWodurUFvy0dYJOAnxmePa+5+450h26jkkL/u1CUsqV7
	q3mv2xIUTXW08Kuycc/99Jf1RJaxBspEeULZDj4v0KfvEmir+8mdWgvedaKYRux/wbMZK3mCN/Wm0
	wTvyXJ3dYJ67KQtct1vz22AeJyZiOeWmuLxLkXGCbMLjvp2NtJoP8InbwjvMQLgRSfAyE6RWyVaMh
	ShQ4kFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Nzs-0000000B1mQ-3SIK;
	Thu, 02 Oct 2025 18:25:44 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Nzq-0000000B1le-0awE
	for ath12k@lists.infradead.org;
	Thu, 02 Oct 2025 18:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759429542; x=1790965542;
  h=date:from:to:cc:subject:message-id;
  bh=DUyAZfeVoo1EH27gPEKANAWIgQfsXNhRHAADLJFb+Vs=;
  b=m8tZU48mD8OlO3xrmZRj9RlA3oQ7k6RQAy4MXVPgvqI7Ui/LEexkKvJe
   16tY+61vdP+plwzokVjbVb5qM6RaCHjf0m9GlNyWHoJwgajyyqs0eQKMv
   UnIw/CWUdXdAT2ofiTwxVCePBGZsLrVl8+q2VTO7LoI+PMLQRHh9N2Tz0
   lRv1PLaYhKBMCOaaPIjcE2b3ivDgHzk4rJ9wEySPBcgdcIH83iahFngNF
   V9ZXXEnPJoG+sl3cgrzlTytzVNs01HvERxk1Pqn9sWjMoiDFylfnBeFIh
   GDriooBlrg9p8CZW9CbOdhSD5o6cdj1dSIGPSh4PlEKxImZPIAL2b64Cs
   w==;
X-CSE-ConnectionGUID: ESot80HDTtemyVXHLRXgkA==
X-CSE-MsgGUID: 972OHyXbTT67v8oavAAxDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="60760399"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="60760399"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 11:25:39 -0700
X-CSE-ConnectionGUID: 1VUL7nq8QhSrv/Ty8Hwm9g==
X-CSE-MsgGUID: 8PRce4ObRjqB4irzAYHSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="178913640"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2025 11:25:38 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4Nzi-00041n-37;
	Thu, 02 Oct 2025 18:25:34 +0000
Date: Fri, 03 Oct 2025 02:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:main-ath12k-ng] BUILD SUCCESS
 c0aa877c395146bf3998bb0a4e550e6ae75fbbf2
Message-ID: <202510030234.28QLHhB5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_112542_194925_644F031E 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-ath12k-ng
branch HEAD: c0aa877c395146bf3998bb0a4e550e6ae75fbbf2  Add localversion-wireless-testing-ath12k-ng

elapsed time: 1494m

configs tested: 102
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251002    gcc-12.5.0
arc                   randconfig-002-20251002    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20251002    gcc-12.5.0
arm                   randconfig-002-20251002    clang-22
arm                   randconfig-003-20251002    clang-22
arm                   randconfig-004-20251002    clang-20
arm                           sama5_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251002    gcc-8.5.0
arm64                 randconfig-002-20251002    clang-22
arm64                 randconfig-003-20251002    clang-22
arm64                 randconfig-004-20251002    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251002    gcc-15.1.0
csky                  randconfig-002-20251002    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251002    clang-22
hexagon               randconfig-002-20251002    clang-16
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251002    clang-20
i386        buildonly-randconfig-002-20251002    gcc-14
i386        buildonly-randconfig-003-20251002    clang-20
i386        buildonly-randconfig-004-20251002    clang-20
i386        buildonly-randconfig-005-20251002    gcc-14
i386        buildonly-randconfig-006-20251002    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251002    gcc-15.1.0
loongarch             randconfig-002-20251002    clang-18
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        maltaup_defconfig    clang-22
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251002    gcc-11.5.0
nios2                 randconfig-002-20251002    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251002    gcc-9.5.0
parisc                randconfig-002-20251002    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251002    gcc-8.5.0
powerpc               randconfig-002-20251002    gcc-9.5.0
powerpc               randconfig-003-20251002    clang-22
powerpc64             randconfig-001-20251002    clang-22
powerpc64             randconfig-002-20251002    clang-22
powerpc64             randconfig-003-20251002    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251002    clang-22
riscv                 randconfig-002-20251002    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251002    gcc-14.3.0
s390                  randconfig-002-20251002    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251002    gcc-13.4.0
sh                    randconfig-002-20251002    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251002    gcc-8.5.0
sparc                 randconfig-002-20251002    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251002    clang-22
sparc64               randconfig-002-20251002    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251002    clang-22
um                    randconfig-002-20251002    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251002    gcc-13
x86_64      buildonly-randconfig-002-20251002    clang-20
x86_64      buildonly-randconfig-003-20251002    clang-20
x86_64      buildonly-randconfig-004-20251002    clang-20
x86_64      buildonly-randconfig-005-20251002    gcc-14
x86_64      buildonly-randconfig-006-20251002    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251002    gcc-8.5.0
xtensa                randconfig-002-20251002    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

