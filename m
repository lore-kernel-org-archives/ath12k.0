Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4BC02183
	for <ath12k@archiver.kernel.org>; Thu, 16 Jan 2025 20:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l+enhnwzNZW8DIvZglZ2JzIuMhzvFfiWqSBI5qKTjCw=; b=N+xo8BGY9lJFLrqCSQO08HMa/8
	GUfNrZlqjGlMmOEe1O3ct87Bdk2wsW7YZ2/vvbYcehd13Xg2360nwvrcbAb1oQHHWiHmYEQwEmMJw
	Y1qKmj8xofY1YoSdTeAQL78z0asPJfGIl9PNNrc1Ehs6R3/sjX5UxKIziU0QQyLXg9+MwsaB2s+mT
	wF05GBlR5oSa25KMee6wyhNzn/ryFlL0ub217KHuIQzEIiU/Nw/wD88fk7V85tf+a4aUT6A17Q18X
	I+gRt7f32ILYFTDlOGUEIqksv+WSCnuRqet3q4aEY0kbkLriIO0isntbTW75sRS3BqPyFQ/8/gWiN
	nTbyMd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWtu-0000000G5e0-0zTX
	for ath12k@archiver.kernel.org;
	Thu, 16 Jan 2025 20:55:38 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWtr-0000000G5df-1AqQ
	for ath12k@lists.infradead.org;
	Thu, 16 Jan 2025 20:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737060935; x=1768596935;
  h=date:from:to:cc:subject:message-id;
  bh=eRCk+xCA6f906lxUong6seyzIH6Sc/YKkuRVedUnYOY=;
  b=dN1PTz2PB009jL/YXCFywr9p5999xyjSSqFhTwoluFSw8NduSa4X0PjA
   8z9wV4SMy83g9IzzvqtF4E4x/ZFohVH7e7WaEMJLCJpfSMOwNApUIx+5b
   ihBNlLQhper/kRtTU9y9QqMqiWqWoj314JVC6H5ia7uRhzUuLvOATC/gF
   4qZiFRjBoKXS/YSZcYiqVgAIE/aP67feY9Kfl8JwRGun4bzSXks5E1Gtj
   7oguAq0T1dpAMVSz0baPhS+1IS1d9VwVYoUsoHx3WQ1gMSRfFIPBfqKza
   /aS0wXARhT1HhMPV3JM1atXTN26U6D1eb4WQbxxlVGpGI2PUoOu/GqRly
   A==;
X-CSE-ConnectionGUID: o1IHwguRSmOkMylC9S8t6Q==
X-CSE-MsgGUID: ZM1pOa8uTdagU2N4A9LwVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37708797"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="37708797"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 12:52:57 -0800
X-CSE-ConnectionGUID: 4ZWww1OcTDe7EiJhFxUSIQ==
X-CSE-MsgGUID: JbHZy4FSTtyTRvFKtFygYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="106191171"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2025 12:52:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYWrG-000SOD-1J;
	Thu, 16 Jan 2025 20:52:54 +0000
Date: Fri, 17 Jan 2025 04:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 d7bef42fc98f2d8f67546d1ea1a3f2c2932fd72b
Message-ID: <202501170411.9sIdFLM7-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_125535_368924_80A4C1BE 
X-CRM114-Status: UNSURE (   3.88  )
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
branch HEAD: d7bef42fc98f2d8f67546d1ea1a3f2c2932fd72b  Add localversion-wireless-testing-ath

elapsed time: 1453m

configs tested: 65
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250116    gcc-13.2.0
arc                  randconfig-002-20250116    gcc-13.2.0
arm                  randconfig-001-20250116    gcc-14.2.0
arm                  randconfig-002-20250116    clang-15
arm                  randconfig-003-20250116    gcc-14.2.0
arm                  randconfig-004-20250116    gcc-14.2.0
arm64                randconfig-001-20250116    gcc-14.2.0
arm64                randconfig-002-20250116    gcc-14.2.0
arm64                randconfig-003-20250116    clang-15
arm64                randconfig-004-20250116    clang-20
csky                 randconfig-001-20250116    gcc-14.2.0
csky                 randconfig-002-20250116    gcc-14.2.0
hexagon              randconfig-001-20250116    clang-20
hexagon              randconfig-002-20250116    clang-20
i386       buildonly-randconfig-001-20250116    clang-19
i386       buildonly-randconfig-002-20250116    clang-19
i386       buildonly-randconfig-003-20250116    clang-19
i386       buildonly-randconfig-004-20250116    clang-19
i386       buildonly-randconfig-005-20250116    clang-19
i386       buildonly-randconfig-006-20250116    clang-19
loongarch            randconfig-001-20250116    gcc-14.2.0
loongarch            randconfig-002-20250116    gcc-14.2.0
mips                          ci20_defconfig    clang-19
mips                       qi_lb60_defconfig    clang-18
nios2                randconfig-001-20250116    gcc-14.2.0
nios2                randconfig-002-20250116    gcc-14.2.0
openrisc                   or1ksim_defconfig    gcc-14.2.0
parisc               randconfig-001-20250116    gcc-14.2.0
parisc               randconfig-002-20250116    gcc-14.2.0
powerpc              randconfig-001-20250116    clang-20
powerpc              randconfig-002-20250116    gcc-14.2.0
powerpc              randconfig-003-20250116    clang-20
powerpc64            randconfig-001-20250116    clang-19
powerpc64            randconfig-002-20250116    clang-20
powerpc64            randconfig-003-20250116    clang-15
riscv            nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                randconfig-001-20250116    gcc-14.2.0
riscv                randconfig-002-20250116    gcc-14.2.0
s390                            alldefconfig    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250116    gcc-14.2.0
s390                 randconfig-002-20250116    clang-18
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                         landisk_defconfig    gcc-14.2.0
sh                   randconfig-001-20250116    gcc-14.2.0
sh                   randconfig-002-20250116    gcc-14.2.0
sh                         rsk7203_defconfig    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250116    gcc-14.2.0
sparc                randconfig-002-20250116    gcc-14.2.0
sparc64              randconfig-001-20250116    gcc-14.2.0
sparc64              randconfig-002-20250116    gcc-14.2.0
um                            i386_defconfig    gcc-12
um                   randconfig-001-20250116    clang-19
um                   randconfig-002-20250116    gcc-12
x86_64     buildonly-randconfig-001-20250116    gcc-12
x86_64     buildonly-randconfig-002-20250116    gcc-12
x86_64     buildonly-randconfig-003-20250116    gcc-12
x86_64     buildonly-randconfig-004-20250116    clang-19
x86_64     buildonly-randconfig-005-20250116    clang-19
x86_64     buildonly-randconfig-006-20250116    clang-19
xtensa               randconfig-001-20250116    gcc-14.2.0
xtensa               randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

