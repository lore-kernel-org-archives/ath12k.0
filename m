Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E637FCE8D4C
	for <ath12k@archiver.kernel.org>; Thu, 19 Sep 2024 05:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KgCAeLLIIk5l5a0LbvKnxYlQMkIO7Fgw9HjEDKEFXnY=; b=OwhU/GIKUyKRfpYEcyPQpAKl67
	rGA/ZrklBUzcsmGsIq12MDyEYRwVslFhqaXVfaXYEM9C04d/xzVQuCJftKWbsQc0W/lU5/1mwZ6ep
	/CDVyf1KRk0kF9tQfRYqE4H+2B61J5/hPXv6Pyb20PmfoS20cWAi+DSYyMhRA+zPf5GvWcFFQjJco
	YZroFDuWeScIin+JcNr3Hu2Abom8DnCB1jLFcMVXmeiGoWg32JLt/pI0nu+u0pMvsViS0nOUmVuTj
	064r973kMKeExvExX0jryx33NQTepdLyZie6rCsIlvmjKz7Q/8myknezRc295x/DhkYJvr9xXIFv2
	tdekPyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srA7h-00000009VXZ-1MoU
	for ath12k@archiver.kernel.org;
	Thu, 19 Sep 2024 05:54:37 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srA7d-00000009VWo-3OB7
	for ath12k@lists.infradead.org;
	Thu, 19 Sep 2024 05:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725274; x=1758261274;
  h=date:from:to:cc:subject:message-id;
  bh=jGET59Yo0F1VSuqt/KKv2iLYQhfva/507feAv8+MzCU=;
  b=fbsh4xJxV5SllWiUBUXqSMECU2Cpbc7J4D5Gmyv2RfKGSVK2TzEa0SQ0
   ecT711NOTDYLGpCBZCNk9+Rn6X6q9Mzyq6zLGTZW0xwbCBQs/GUhJCbRf
   p4ERPnj2N0eHNgKnTqSrcQ8UFmQNKZYws1/PBTO4adBf8l49g558ogM9P
   bV8s4yWjs7tTgapj8Yu3k3gZOO18F1yL0wQvZgGxht9roRxKw5wcFw+X8
   alpDOdD0RQQD3eUnYViw8pyUP0hrGPiSFskLAd4XhzPgFtFgfV9HcBbHK
   hk/uGhr3W3Krp9xPmkqvlo14hzFhd6iCsU8MMrNpXRMvdVdwHOuWPhjmc
   g==;
X-CSE-ConnectionGUID: IdjUeQolSL+vRfMRHw35PQ==
X-CSE-MsgGUID: iAK6PsQ5QBGHYwomX4bQ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="51078690"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="51078690"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:54:26 -0700
X-CSE-ConnectionGUID: q/oVPajORRGVQO4yylkwxA==
X-CSE-MsgGUID: jl12OZVhRD+8RAHflmW0Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70062061"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2024 22:54:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srA7S-000CyW-1b;
	Thu, 19 Sep 2024 05:54:22 +0000
Date: Thu, 19 Sep 2024 13:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 955bc29c6df31fc983fc80608b5e7efe545639c8
Message-ID: <202409191321.aWhCkiZt-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_225433_883526_3AAFF334 
X-CRM114-Status: UNSURE (   4.64  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: 955bc29c6df31fc983fc80608b5e7efe545639c8  wifi: ath12k: use arsta->addr instead of sta->addr where ever possible

elapsed time: 2370m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20240919    gcc-13.2.0
arc                   randconfig-002-20240919    gcc-13.2.0
arm                               allnoconfig    clang-20
arm                   randconfig-001-20240919    clang-20
arm                   randconfig-002-20240919    clang-20
arm                   randconfig-003-20240919    clang-20
arm                   randconfig-004-20240919    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240919    gcc-14.1.0
arm64                 randconfig-002-20240919    clang-15
arm64                 randconfig-003-20240919    clang-20
arm64                 randconfig-004-20240919    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240919    gcc-14.1.0
csky                  randconfig-002-20240919    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240919    clang-20
hexagon               randconfig-002-20240919    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240918    clang-18
i386        buildonly-randconfig-002-20240918    gcc-12
i386        buildonly-randconfig-003-20240918    gcc-12
i386        buildonly-randconfig-004-20240918    gcc-12
i386        buildonly-randconfig-005-20240918    clang-18
i386        buildonly-randconfig-006-20240918    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240918    clang-18
i386                  randconfig-002-20240918    clang-18
i386                  randconfig-003-20240918    clang-18
i386                  randconfig-004-20240918    gcc-12
i386                  randconfig-005-20240918    gcc-12
i386                  randconfig-006-20240918    clang-18
i386                  randconfig-011-20240918    gcc-12
i386                  randconfig-012-20240918    clang-18
i386                  randconfig-013-20240918    gcc-12
i386                  randconfig-014-20240918    clang-18
i386                  randconfig-015-20240918    clang-18
i386                  randconfig-016-20240918    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240919    gcc-14.1.0
loongarch             randconfig-002-20240919    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         cobalt_defconfig    gcc-13.2.0
mips                         db1xxx_defconfig    clang-20
mips                     loongson1c_defconfig    gcc-13.2.0
mips                malta_qemu_32r6_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240919    gcc-14.1.0
nios2                 randconfig-002-20240919    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
openrisc                       virt_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc                    sam440ep_defconfig    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                               j2_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    gcc-14.1.0
sh                           se7705_defconfig    gcc-14.1.0
sh                           se7722_defconfig    gcc-14.1.0
sh                   secureedge5410_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sparc                            alldefconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

