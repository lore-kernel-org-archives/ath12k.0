Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93063CAC5BB
	for <ath12k@archiver.kernel.org>; Fri, 10 Oct 2025 05:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lnybns+ZiuBsFFlWl4+m9kuim2TcKgTSvi+BaPD7qNo=; b=oCtVt5bSfW5JIBT1e2843BKx5N
	VLVd7oLPiRkHSlMM/JOj6baBMut0s7oXks0vflVHDkoprzUJVpl8lekQS6sXIyTpXGxK5AYbRSr29
	CZG0We+QwyKMuxpfYWJTKBupFxyQif2WrjbuX99k032DLCwS8AKjvoht6rksOhFGz1WFzFY4vK3Wj
	QqF03o4YrU4yTZwnYMddayazqZsFfPWVnc2UvwfHoijXXlfAPyKWoRm94enAZqMAVXN6lAtfQQQXe
	Dy9bcTCDyyFB7VJmEVv2Y9VjNa2Zp41es+OpomX+nfWphxjjCkYOUyh63IVWcl+pnTw1Do7ad9fkj
	tF/stWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75kP-00000007iRD-1Prv;
	Fri, 10 Oct 2025 05:32:57 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75kN-00000007iQs-19P9
	for ath12k@lists.infradead.org;
	Fri, 10 Oct 2025 05:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760074375; x=1791610375;
  h=date:from:to:cc:subject:message-id;
  bh=TiHHQ0JoxD6+UwATEFj44llk/HCaGGuMkSJAvO//r0U=;
  b=OcrJ1Oz6b/vKCCoIRJsrqkWsFeTdPu8Myvai/RRDNwvSubR4u5oR1Trh
   hjR3/RBtB0Oi85C/tH2/VzBCXQOwqgBCcTr3XcxwbJvH6CxhA5eHgudp3
   TCTIlGdOvac2jAUpEIl+qyGmATDzGDllwgWjTGOa7vQP/nfh5fawaMQHo
   LxK8reh4p6cdv7CIZqTgprpAFGkJ75pypzxq+Gw7lj/TQN3/ZmdWx4kwc
   Cce3d5vsV0POm9vW8VYZOg81SOIgVpkBo1d5dSUlDU5VcNt3LVvZzIL3V
   45svR5k+gU+zF4l9u/uc/SVDAtaTUguaYCRS1Q/NLeR/XadmB79dSCHWv
   g==;
X-CSE-ConnectionGUID: b5zD9RUEQke6DQod6bjcsA==
X-CSE-MsgGUID: OQVUUVUgTbmuCNNcI+v2MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="61500775"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="61500775"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:32:52 -0700
X-CSE-ConnectionGUID: pLQ+2E5OQF69OfhPVYUpiw==
X-CSE-MsgGUID: OeN8Iz82SEyGUlbh8YvFhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180711297"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2025 22:32:51 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v75kG-0002ID-2z;
	Fri, 10 Oct 2025 05:32:48 +0000
Date: Fri, 10 Oct 2025 13:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 c57176c0dad91a00bd20feb5f6dc4e8d575f4628
Message-ID: <202510101356.DAMGt65t-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_223255_345791_C95DAC61 
X-CRM114-Status: UNSURE (   4.15  )
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
branch HEAD: c57176c0dad91a00bd20feb5f6dc4e8d575f4628  wifi: ath12k: Rearrange PPDU radio stats

elapsed time: 1361m

configs tested: 138
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251009    gcc-11.5.0
arc                   randconfig-002-20251009    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-22
arm                      integrator_defconfig    clang-22
arm                   randconfig-001-20251009    gcc-10.5.0
arm                   randconfig-002-20251009    gcc-11.5.0
arm                   randconfig-003-20251009    gcc-11.5.0
arm                   randconfig-004-20251009    gcc-12.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251009    gcc-8.5.0
arm64                 randconfig-002-20251009    gcc-14.3.0
arm64                 randconfig-003-20251009    gcc-9.5.0
arm64                 randconfig-004-20251009    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251009    gcc-13.4.0
csky                  randconfig-002-20251009    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251009    clang-16
hexagon               randconfig-002-20251009    clang-19
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
loongarch             randconfig-001-20251009    gcc-15.1.0
loongarch             randconfig-002-20251009    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
mips                           gcw0_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251009    gcc-8.5.0
nios2                 randconfig-002-20251009    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251009    gcc-8.5.0
parisc                randconfig-002-20251009    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251009    gcc-8.5.0
powerpc               randconfig-002-20251009    gcc-11.5.0
powerpc               randconfig-003-20251009    gcc-8.5.0
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251009    gcc-10.5.0
powerpc64             randconfig-002-20251009    clang-22
powerpc64             randconfig-003-20251009    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20251009    gcc-8.5.0
riscv                 randconfig-002-20251009    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251009    clang-22
s390                  randconfig-002-20251009    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251009    gcc-15.1.0
sh                    randconfig-002-20251009    gcc-12.5.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           sh2007_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251009    gcc-8.5.0
sparc                 randconfig-002-20251009    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251009    clang-22
sparc64               randconfig-002-20251009    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251009    clang-17
um                    randconfig-002-20251009    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251009    clang-20
x86_64      buildonly-randconfig-001-20251010    clang-20
x86_64      buildonly-randconfig-002-20251009    clang-20
x86_64      buildonly-randconfig-002-20251010    clang-20
x86_64      buildonly-randconfig-003-20251009    clang-20
x86_64      buildonly-randconfig-003-20251010    clang-20
x86_64      buildonly-randconfig-004-20251009    clang-20
x86_64      buildonly-randconfig-004-20251010    clang-20
x86_64      buildonly-randconfig-005-20251009    clang-20
x86_64      buildonly-randconfig-005-20251010    gcc-14
x86_64      buildonly-randconfig-006-20251009    gcc-14
x86_64      buildonly-randconfig-006-20251010    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251009    gcc-11.5.0
xtensa                randconfig-002-20251009    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

