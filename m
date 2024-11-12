Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88732D42B80
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CHa3PMkDW3JsopP35J84FBdytDqjs2ZXaXLgSNXT6/E=; b=jTsy6121B5E9l9zlP0brCXh3vP
	zNLX5rDGP0t4IpqQzX/2jcAVUAgF+nkzerFbarEDHSm+p/R3GvI4jWsYn7Cb0UhGkeF64wracUk77
	uGezGLoDl7tCDuiPFXIvBTyYl2Xbkl/2al/GLSsf9loTlII4SohIvun/EkwYFyLODDyoqAp34KY7W
	moVHB3VgYe9BwArgbJmKkdn7VFLgH5CfJjokCa4ZWVSlABDHmUjH+D9F6WJuwXz4FXKIi/1yo5+iI
	JDX6QpErHw0yXdyNzcJC/Zs0rtwv6zPGbIw1WYWXg4eES4slDtpUGS1kYwnDgeu46OxjtwHxlznvl
	saGqiR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArJg-00000003eon-0vFR
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 13:52:24 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tArJU-00000003emW-2FPF
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 13:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731419532; x=1762955532;
  h=date:from:to:cc:subject:message-id;
  bh=DBg8mi2OeRsjm6gqSiWXFhxOfTh9qROdOVAfQvJWlfc=;
  b=TlrKehVGXL8KYt9OPnR3Z4q3X1QMO9a4hhK0mPaZ+/db3BdKSOqEUak0
   /ICcVSPL3C/bM/VwDtDxkdAKhHrb6znXdWeotMRKdSMAcdXd0RWm1Lzzk
   gUFMeF4l0aR6QmgYZtqWUiR8/EAe9FqO0sdj9paciVAyguKwNVxBvXkq8
   H9YKRP89HjobDSyizBctOD20vYr5QXlxOxz5tGVpwipC/iGAzOQpwl32U
   0L94aWG6Gz8+eYBwPoTrTYdHDwXH4pejqtkVDgbk8vh/of5buhx7eqow9
   ms/Tt1MauRMWByLAXRvipQJHF/zGz/vQvH6l0qtR2KQpUehPJONdW8P7u
   Q==;
X-CSE-ConnectionGUID: sX2ZMwGBRT6v5qZWsf6eGw==
X-CSE-MsgGUID: C9QV9cLNSS2miBigJHwMhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31127168"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="31127168"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 05:52:11 -0800
X-CSE-ConnectionGUID: xiISueEoS46txH5TqzFCig==
X-CSE-MsgGUID: y82VH0bsQ5qkm6dvK0CDZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87370325"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Nov 2024 05:52:10 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tArJO-0001O9-2K;
	Tue, 12 Nov 2024 13:52:06 +0000
Date: Tue, 12 Nov 2024 21:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 8d8c2e408d234f375298123d7d2e50c1dbc578cc
Message-ID: <202411122143.rzs9cxUE-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_055212_610057_01C1C74A 
X-CRM114-Status: UNSURE (   4.32  )
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
branch HEAD: 8d8c2e408d234f375298123d7d2e50c1dbc578cc  Merge branch 'pending' into main-pending

elapsed time: 1130m

configs tested: 83
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241112    gcc-13.2.0
arc         randconfig-002-20241112    gcc-13.2.0
arm                    allmodconfig    gcc-14.2.0
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20241112    clang-20
arm         randconfig-002-20241112    gcc-14.2.0
arm         randconfig-003-20241112    clang-14
arm         randconfig-004-20241112    gcc-14.2.0
arm64                  allmodconfig    clang-20
arm64       randconfig-001-20241112    gcc-14.2.0
arm64       randconfig-002-20241112    clang-20
arm64       randconfig-003-20241112    clang-20
arm64       randconfig-004-20241112    clang-20
csky        randconfig-001-20241112    gcc-14.2.0
csky        randconfig-002-20241112    gcc-14.2.0
hexagon                allmodconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20241112    clang-17
hexagon     randconfig-002-20241112    clang-20
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-19
loongarch              allmodconfig    gcc-14.2.0
loongarch   randconfig-001-20241112    gcc-14.2.0
loongarch   randconfig-002-20241112    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
nios2       randconfig-001-20241112    gcc-14.2.0
nios2       randconfig-002-20241112    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
openrisc                  defconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc                    defconfig    gcc-14.2.0
parisc      randconfig-001-20241112    gcc-14.2.0
parisc      randconfig-002-20241112    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                allyesconfig    clang-20
powerpc     randconfig-001-20241112    gcc-14.2.0
powerpc     randconfig-002-20241112    gcc-14.2.0
powerpc     randconfig-003-20241112    gcc-14.2.0
powerpc64   randconfig-001-20241112    gcc-14.2.0
powerpc64   randconfig-002-20241112    gcc-14.2.0
powerpc64   randconfig-003-20241112    clang-14
riscv                  allmodconfig    clang-20
riscv                  allyesconfig    clang-20
riscv                     defconfig    clang-20
riscv       randconfig-001-20241112    gcc-14.2.0
riscv       randconfig-002-20241112    clang-20
s390                   allmodconfig    clang-20
s390                   allyesconfig    gcc-14.2.0
s390                      defconfig    clang-20
s390        randconfig-001-20241112    gcc-14.2.0
s390        randconfig-002-20241112    clang-20
sh                     allmodconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh                        defconfig    gcc-14.2.0
sh          randconfig-001-20241112    gcc-14.2.0
sh          randconfig-002-20241112    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
sparc64                   defconfig    gcc-14.2.0
sparc64     randconfig-001-20241112    gcc-14.2.0
sparc64     randconfig-002-20241112    gcc-14.2.0
um                     allmodconfig    clang-20
um                     allyesconfig    gcc-12
um                        defconfig    clang-20
um                   i386_defconfig    gcc-12
um          randconfig-001-20241112    gcc-12
um          randconfig-002-20241112    gcc-12
um                 x86_64_defconfig    clang-15
x86_64                  allnoconfig    clang-19
x86_64                 allyesconfig    clang-19
x86_64                    defconfig    gcc-11
x86_64                        kexec    clang-19
x86_64                     rhel-8.3    gcc-12
xtensa      randconfig-001-20241112    gcc-14.2.0
xtensa      randconfig-002-20241112    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

