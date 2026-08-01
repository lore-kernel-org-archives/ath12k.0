Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B605C54FCD
	for <ath12k@archiver.kernel.org>; Sat,  1 Aug 2026 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mywvg6VW7Cxxa+EH73+dTKXC8qfJTKX6QXbPfzJ4Jp0=; b=wzx5rBKT5MAc5+Vm5D2SsDapyB
	T0xh/m8qVMFsNMYSGj25u2YsTaInI/PolNiIDphHM53XjQ7RkquUTB7NRw5wKQ6DPYBjksCDCoG9e
	gaSgTmzCyfq2HXKmtxVZnfwNniPlcz3GEmz6Wq8jDc596bPzij7KvY/Zg83OiSPSq/XiRjHU+ba10
	imvMpVbp22a2VEFMCSyPPjscdnjZNIANySNekVKNCN3HVBteyK1YBVUQoKaGvmGePUcSPU3oFNcJl
	vEmyMfqDVuIHUqu2uwzqTdtvozyp598t5qclPaZnFIhFSldj7pBOSR1IKa4uQWLTyxzAl78x9kGBo
	S0+av79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq2oM-0000000Dvd4-00fb;
	Sat, 01 Aug 2026 06:03:06 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq2oJ-0000000Dvc3-3YZS
	for ath12k@lists.infradead.org;
	Sat, 01 Aug 2026 06:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785564184; x=1817100184;
  h=date:from:to:cc:subject:message-id;
  bh=6GQjzovDOMBRUfAl4UWy34wwhXf1O57m2bRMTcdz57E=;
  b=cfwfkLzBJ01vGCSjioUISNgQXM4ZFY6+KpsjS0X9SmevTVoBY8JFbavx
   V8j5gbKZM0tgtrGU3+Qii7qtbKJ8dCeV/fNIrdG/SSWhv58dSEI/hYdRH
   dibUoplASMXLiOPxXW++cbqTNtsZOEEpsga5aOH7unFfdItDmoe53SsCL
   TMiGHU6GVAAef/R4o6CsEsG2TTE9EKaNx4M0G0KrNGRM8kTUWNaCTaqdu
   VrFJ18JJou8WibDv2KfA08Tvp4z/53IKG2xEapn4ABxWtg669sXLluf9E
   GovFqW86GM1O5fKwN6WVv94D4ftCafVvXXL1oxD3YbJyDTjMVvEhzP6nY
   w==;
X-CSE-ConnectionGUID: /pcb9Ko/Su+Vd1vioeKVpQ==
X-CSE-MsgGUID: OJbUHLdHSSCwL9GOnyGY0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="97340640"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="97340640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 23:03:03 -0700
X-CSE-ConnectionGUID: Q2n9LacoTIqT7XwRe2UGmQ==
X-CSE-MsgGUID: HQQFoeCrREqeuPcT/t3J5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="284099544"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jul 2026 23:03:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq2oE-000000002r6-2znG;
	Sat, 01 Aug 2026 06:02:58 +0000
Date: Sat, 01 Aug 2026 14:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 4db873154316312aa0eb4e2b6a789a46fd65a344
Message-ID: <202608011426.Ltu2tFUQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_230303_920495_51245F36 
X-CRM114-Status: UNSURE (   3.95  )
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
branch HEAD: 4db873154316312aa0eb4e2b6a789a46fd65a344  wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump

elapsed time: 774m

configs tested: 52
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260801    gcc-14.3.0
arc                  randconfig-002-20260801    gcc-12.5.0
arm                  randconfig-001-20260801    clang-24
arm                  randconfig-002-20260801    gcc-8.5.0
arm                  randconfig-003-20260801    gcc-12.5.0
arm                  randconfig-004-20260801    clang-18
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260801    clang-21
arm64                randconfig-002-20260801    clang-21
arm64                randconfig-003-20260801    gcc-14.3.0
arm64                randconfig-004-20260801    clang-17
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260801    gcc-12.5.0
csky                 randconfig-002-20260801    gcc-10.5.0
hexagon              randconfig-001-20260801    clang-24
hexagon              randconfig-002-20260801    clang-17
i386                            allmodconfig    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-002-20260801    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260801    gcc-8.5.0
nios2                randconfig-002-20260801    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260801    gcc-11.5.0
parisc               randconfig-002-20260801    gcc-9.5.0
powerpc              randconfig-001-20260801    clang-20
powerpc              randconfig-002-20260801    gcc-10.5.0
powerpc64            randconfig-001-20260801    clang-24
powerpc64            randconfig-002-20260801    clang-24
riscv                randconfig-001-20260801    gcc-14.3.0
riscv                randconfig-002-20260801    clang-20
s390                         debug_defconfig    gcc-16.1.0
s390                 randconfig-001-20260801    gcc-15.2.0
s390                 randconfig-002-20260801    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260801    gcc-16.1.0
sh                   randconfig-002-20260801    gcc-16.1.0
sparc64              randconfig-001-20260801    gcc-9.5.0
x86_64     buildonly-randconfig-001-20260801    clang-22
x86_64     buildonly-randconfig-002-20260801    clang-22
x86_64     buildonly-randconfig-003-20260801    gcc-13
x86_64     buildonly-randconfig-004-20260801    clang-22
x86_64     buildonly-randconfig-005-20260801    clang-22
x86_64     buildonly-randconfig-006-20260801    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

