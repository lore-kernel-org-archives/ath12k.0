Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10154CCA476
	for <ath12k@archiver.kernel.org>; Sat, 11 Oct 2025 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P4VwiI7qngXTFNlkKul2WBgtutwi5NUhrZ8z6ToXAY8=; b=kbnGZ+JkP6N6OW7JMRwH9/7JXr
	vtNfkwqPjDmZDEDMSB7IYjwcd9spk9cCa+ZVolmu18rpGzjloQlNWPvaIlV3pmHZMjKpc8tQVoWMr
	Q5LWRAzFdaNojaPoFfGFLd7w+C78e3+55I0dNxYZsxVGLkbqE63Q4s9ptOjiYmYTpMpjmNV0vyb46
	eZzSepBXNTJIlG2c7j0x2tlAZfORdgqqaY6Ku7ERfXOMCtQTpSlNBtetTHgwO5YOH3lOOkAIk5QFb
	GsuRngUTx0EqFkdjFFJNBrcVaVfACy4bcXLHIsGPVDHgJRjLLwg3dX5ajoKdTmvqDFC2hkuQs4UT3
	R979NNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7abt-0000000AFK6-2zJ0;
	Sat, 11 Oct 2025 14:30:13 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7abr-0000000AFJf-19zP
	for ath12k@lists.infradead.org;
	Sat, 11 Oct 2025 14:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760193011; x=1791729011;
  h=date:from:to:cc:subject:message-id;
  bh=L8F1ivjcB5nrJlxSPZ3Z/cUAUI6pYrJoZvoSsIt4y84=;
  b=nEplHWPB3BXrxNXHB9gzSSVcNXqE9B0UuV91pWi6Zjo2P3tjeTWRgOsV
   bRD20RFP36vs0/QYC1Qz6JfpGqniKKJ9WSV6Pt9PiZSrIKJnure+Z0Ebl
   YghU2U68apUWTdjgapaEJrkKS+DdkW43ITnF/eVmJtEhQj+1X+aPm36lG
   WzB8fvk3eWur6Gcbid1jL9E4AHamXltJrBOanMS/fhA8tMBx5Gxcm191n
   8FU9mNMkkOHp1jUKJ0ECwApl74iEb7ZcQi0v3Gzuv2NWiy7nZWKfPE1cn
   KNIvMAVya1jsmzc7KSfNFzUAIhpNh9Rw7u4CsCIdKPkwyV7k2gjt4djgi
   A==;
X-CSE-ConnectionGUID: +s4rNDttRFGxVnIqn8cvTg==
X-CSE-MsgGUID: KodojKnRSte7W+P5HR+9WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="49946129"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="49946129"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 07:30:03 -0700
X-CSE-ConnectionGUID: eTPv8gAZQOmA2jx2zs4jOg==
X-CSE-MsgGUID: hzcvWSHXRySb9/IWeY91jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="180448579"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Oct 2025 07:30:02 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7abf-0003oV-0q;
	Sat, 11 Oct 2025 14:29:59 +0000
Date: Sat, 11 Oct 2025 22:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 25122460e7f96864a80b59ffe6c953911516d3b3
Message-ID: <202510112219.isGHefKE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_073011_333550_46104733 
X-CRM114-Status: UNSURE (   3.50  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-ath12k-ng
branch HEAD: 25122460e7f96864a80b59ffe6c953911516d3b3  wifi: ath12k: Drop hal_ prefix from hardware register names

elapsed time: 1425m

configs tested: 161
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251010    gcc-12.5.0
arc                   randconfig-001-20251011    gcc-9.5.0
arc                   randconfig-002-20251010    gcc-8.5.0
arc                   randconfig-002-20251011    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                       imx_v6_v7_defconfig    clang-16
arm                          moxart_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20251010    gcc-8.5.0
arm                   randconfig-001-20251011    clang-22
arm                   randconfig-002-20251010    gcc-13.4.0
arm                   randconfig-002-20251011    gcc-12.5.0
arm                   randconfig-003-20251010    gcc-8.5.0
arm                   randconfig-003-20251011    clang-22
arm                   randconfig-004-20251010    gcc-8.5.0
arm                   randconfig-004-20251011    clang-22
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251010    gcc-14.3.0
arm64                 randconfig-001-20251011    gcc-10.5.0
arm64                 randconfig-002-20251010    clang-19
arm64                 randconfig-002-20251011    gcc-12.5.0
arm64                 randconfig-003-20251010    clang-17
arm64                 randconfig-003-20251011    clang-22
arm64                 randconfig-004-20251010    gcc-15.1.0
arm64                 randconfig-004-20251011    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251010    gcc-15.1.0
csky                  randconfig-001-20251011    gcc-13.4.0
csky                  randconfig-002-20251010    gcc-10.5.0
csky                  randconfig-002-20251011    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251010    clang-22
hexagon               randconfig-001-20251011    clang-18
hexagon               randconfig-002-20251010    clang-18
hexagon               randconfig-002-20251011    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251010    gcc-14
i386        buildonly-randconfig-002-20251010    clang-20
i386        buildonly-randconfig-003-20251010    clang-20
i386        buildonly-randconfig-004-20251010    gcc-14
i386        buildonly-randconfig-005-20251010    gcc-14
i386        buildonly-randconfig-006-20251010    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251010    clang-22
loongarch             randconfig-001-20251011    clang-18
loongarch             randconfig-002-20251010    gcc-15.1.0
loongarch             randconfig-002-20251011    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251010    gcc-11.5.0
nios2                 randconfig-001-20251011    gcc-8.5.0
nios2                 randconfig-002-20251010    gcc-9.5.0
nios2                 randconfig-002-20251011    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251010    gcc-8.5.0
parisc                randconfig-001-20251011    gcc-8.5.0
parisc                randconfig-002-20251010    gcc-12.5.0
parisc                randconfig-002-20251011    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      chrp32_defconfig    clang-19
powerpc                 linkstation_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20251010    clang-22
powerpc               randconfig-001-20251011    clang-22
powerpc               randconfig-002-20251010    gcc-15.1.0
powerpc               randconfig-002-20251011    gcc-8.5.0
powerpc               randconfig-003-20251010    clang-22
powerpc               randconfig-003-20251011    clang-22
powerpc64             randconfig-001-20251010    clang-22
powerpc64             randconfig-001-20251011    clang-22
powerpc64             randconfig-002-20251010    gcc-14.3.0
powerpc64             randconfig-002-20251011    gcc-8.5.0
powerpc64             randconfig-003-20251010    gcc-13.4.0
powerpc64             randconfig-003-20251011    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251010    clang-22
riscv                 randconfig-002-20251010    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251010    gcc-14.3.0
s390                  randconfig-002-20251010    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        dreamcast_defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20251010    gcc-15.1.0
sh                    randconfig-002-20251010    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251010    gcc-11.5.0
sparc                 randconfig-002-20251010    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251010    clang-20
sparc64               randconfig-002-20251010    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251010    gcc-14
um                    randconfig-002-20251010    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251010    clang-20
x86_64      buildonly-randconfig-002-20251010    clang-20
x86_64      buildonly-randconfig-003-20251010    clang-20
x86_64      buildonly-randconfig-004-20251010    clang-20
x86_64      buildonly-randconfig-005-20251010    gcc-14
x86_64      buildonly-randconfig-006-20251010    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251010    gcc-8.5.0
xtensa                randconfig-002-20251010    gcc-9.5.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

