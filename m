Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E61D65C56
	for <ath12k@archiver.kernel.org>; Thu, 14 Nov 2024 07:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XzXKdMCg5BUMN9wKkhjmh9choewbRtLbbt70abbsG6U=; b=1rZJpBADbwBurdVPUOVvzdeds4
	4PiSfVBUQrEvcMlpW42cQuVVQ1Zx9pFezxCaUwO8cHru2IVn/TnRvyCLviNVQE8x8WLFuioBbTFQ0
	FT9CXx1FhuC+Pd19tiKEUFvqm+SiGw3E3E9KChL900E3h9qpV27YA7pgiPQftsrjbX1yQoQOVfuO0
	GnnHtZQy4bo+IVo3YeqRbAnh7c+lYxbm8zz7I+LFyqZmm59y7Qevp25w9kOjp/iOAsZTyWkrEdmYk
	YF+wvtzkCMOJ76Xv2F5p+WTQdTHRx2/u7+agOkLGrnyyUlaTd4MYDrRgtJWfeE0barg1ioFtByvX8
	KQwa+8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUOb-000000095wN-2Zvw
	for ath12k@archiver.kernel.org;
	Thu, 14 Nov 2024 07:36:05 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUOY-000000095vp-1p7C
	for ath12k@lists.infradead.org;
	Thu, 14 Nov 2024 07:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731569762; x=1763105762;
  h=date:from:to:cc:subject:message-id;
  bh=dPPhvCZTqAj6P864fjHHrVUj790jt5yQbk8fZ74dEe0=;
  b=HW0XrQWCzKWKkw9WK4FKiPIOabgpu6DkLAJ8Tn37ZYoSeFHJlLS7sDpu
   mARq5xNNOHBhQeh1j5qs1+ZTjbj8+STjLIlCwFmVslrm3Dpu5gxxcgK+v
   z40CVOgyj+mdJClWaVDAgzs6LAiczr2baFEQFYGg1y99Pw7eTAWpsSvvX
   2Upx0NOECpRMQIyZUIIOmCSzGdgZk3ES+8XUOXNr0bPaQXW/mhKt3mbtC
   MO7pPqU0hMXfPGAhFJASTHU5X9iDW+iuN2ued0n0SgcuVdt7i4PEDcSYN
   yAn1mYlmentu59uIrvSbi1mP08Dl9FzqpDclO79wbqLD7zm0+KbtJQK5q
   A==;
X-CSE-ConnectionGUID: 9Sif4xBySgew8WDhHRLjyQ==
X-CSE-MsgGUID: oZeriwuKSbqG1tC06lYzvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42113175"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42113175"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 23:36:02 -0800
X-CSE-ConnectionGUID: JH0kgwyqTEWAbiohC4/B4A==
X-CSE-MsgGUID: IG3DGmTsSQWxZLTPS47QeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88098079"
Received: from lkp-server01.sh.intel.com (HELO 8eed2ac03994) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2024 23:36:01 -0800
Received: from kbuild by 8eed2ac03994 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBUOU-00003G-0t;
	Thu, 14 Nov 2024 07:35:58 +0000
Date: Thu, 14 Nov 2024 14:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 0ea161de5e5afa1323e982adc8f59bf4af99a84b
Message-ID: <202411141434.b7fttIpb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_233602_537563_8ED80814 
X-CRM114-Status: UNSURE (   3.76  )
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
branch HEAD: 0ea161de5e5afa1323e982adc8f59bf4af99a84b  Add localversion-wireless-testing-ath

elapsed time: 737m

configs tested: 52
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha              allyesconfig    clang-20
arc                allmodconfig    clang-20
arc                allmodconfig    gcc-13.2.0
arc                allyesconfig    clang-20
arc                allyesconfig    gcc-13.2.0
arm                allmodconfig    clang-20
arm                allmodconfig    gcc-14.2.0
arm                allyesconfig    clang-20
arm                allyesconfig    gcc-14.2.0
arm64              allmodconfig    clang-20
hexagon            allmodconfig    clang-20
hexagon            allyesconfig    clang-20
i386               allmodconfig    clang-19
i386               allmodconfig    gcc-12
i386                allnoconfig    clang-19
i386                allnoconfig    gcc-12
i386               allyesconfig    clang-19
i386               allyesconfig    gcc-12
i386                  defconfig    clang-19
loongarch          allmodconfig    gcc-14.2.0
m68k               allmodconfig    gcc-14.2.0
m68k               allyesconfig    gcc-14.2.0
microblaze         allmodconfig    gcc-14.2.0
microblaze         allyesconfig    gcc-14.2.0
openrisc            allnoconfig    gcc-14.2.0
openrisc           allyesconfig    gcc-14.2.0
parisc             allmodconfig    gcc-14.2.0
parisc              allnoconfig    gcc-14.2.0
parisc             allyesconfig    gcc-14.2.0
powerpc            allmodconfig    gcc-14.2.0
powerpc             allnoconfig    gcc-14.2.0
powerpc            allyesconfig    gcc-14.2.0
riscv              allmodconfig    gcc-14.2.0
riscv               allnoconfig    gcc-14.2.0
riscv              allyesconfig    gcc-14.2.0
s390               allmodconfig    clang-20
s390               allmodconfig    gcc-14.2.0
s390                allnoconfig    clang-20
s390               allyesconfig    gcc-14.2.0
sh                 allmodconfig    gcc-14.2.0
sh                 allyesconfig    gcc-14.2.0
sparc              allmodconfig    gcc-14.2.0
um                 allmodconfig    clang-20
um                  allnoconfig    clang-17
um                 allyesconfig    clang-20
x86_64              allnoconfig    clang-19
x86_64             allyesconfig    clang-19
x86_64                defconfig    clang-19
x86_64                defconfig    gcc-11
x86_64                    kexec    clang-19
x86_64                 rhel-8.3    gcc-12
x86_64      rhel-8.3-kselftests    clang-19

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

