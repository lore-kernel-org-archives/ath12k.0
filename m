Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED1AC54FCD
	for <ath12k@archiver.kernel.org>; Sat,  1 Aug 2026 06:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T7ywO1yG+89Dfnb4YVa1Y+UX2I+NBjr7U2fL1gyrogs=; b=DsX7JhCn6BUcdi5hIaEC+yMO6n
	PMC1OtyZQK/4AbZ6sci2ueu+y10gnYLuCznfLxfOmkXEPyr6zwYKc5Be8Edl8UjAWJvak6Ul9fGqo
	TxLz/8yxgsr2473FI9eZcIhUduK+n8Uu/GR9khLZbPNOCm3mpW1l//be/ybi9pNpa9lSaybHuqHgN
	BQUDpUjfmTdhZMHQW8zEn66cbQNKaXqUlSLQjOkX1EiPB/6rrS7lzQNhSkkPPmBP7atjvYi+p0oC8
	Bdneg69cD+CbO/OPJjONuS2hp6Q9zO8x/1zOCP9byCdjXMKjRVvbtcnIvAun8LN8NRqYcHPiiZHmC
	uvmnFOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq2oP-0000000Dvec-0Jbi;
	Sat, 01 Aug 2026 06:03:09 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq2oL-0000000Dvc3-1Akp
	for ath12k@lists.infradead.org;
	Sat, 01 Aug 2026 06:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785564186; x=1817100186;
  h=date:from:to:cc:subject:message-id;
  bh=pB0J0w5gl+AcwcrAYTBO5gYJwsNoAOPaXxxa0tYftGU=;
  b=Vqh1ImQ6KU9VK3jPLaZiUpZvCattLtWlocYjLSMav4hr47JdcqIqUu7n
   Gr16uH+j5+MwxIT/Aow2noBh9zFgEJfrZD2kTzG/XerKvtMjSPtl89NL2
   dlW6P9jK3SfpPcICmHE5OuDHZCSWsCr4ZpZmQFOUD8G4Xg3BAmKyGsniW
   TJlD5k++kCBqw5ThQM30MkijSBg0e4bdfBzfO+29OnnlgLAWiufhHqdja
   4X9qIcU7SdDWiz/6RWOw9VK67x2mbBb4BiMjLIv9iwj6F44hzRYrREmqd
   PNy+Hs4K9XGVr7WZWNvAZKHCQDzuq2yn1ZQ37T0MrGBK6p1nJ9QhyT9mX
   A==;
X-CSE-ConnectionGUID: hr/SyG3OSM64ARrO1pTd3A==
X-CSE-MsgGUID: HZ8rxImwQ66notSEkSWlQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="97340641"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="97340641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 23:03:03 -0700
X-CSE-ConnectionGUID: hpqTh05ST3OrvrpEBMEmLQ==
X-CSE-MsgGUID: 9u63L5XdTFezaMGh1Jsq2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="284099542"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jul 2026 23:03:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq2oE-000000002r3-1eAz;
	Sat, 01 Aug 2026 06:02:58 +0000
Date: Sat, 01 Aug 2026 14:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 033f8979751ee20d1d73cd1848033820d095e18c
Message-ID: <202608011401.3U2bESRI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_230305_356696_F1A09BD0 
X-CRM114-Status: UNSURE (   3.91  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: 033f8979751ee20d1d73cd1848033820d095e18c  Add localversion-wireless-testing-ath

elapsed time: 774m

configs tested: 79
configs skipped: 2

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
arm                           qcom_defconfig    clang-24
arm                  randconfig-001-20260801    clang-24
arm                  randconfig-002-20260801    gcc-8.5.0
arm                  randconfig-003-20260801    gcc-12.5.0
arm                  randconfig-004-20260801    clang-18
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
i386       buildonly-randconfig-001-20260801    clang-22
i386       buildonly-randconfig-002-20260801    clang-22
i386       buildonly-randconfig-003-20260801    clang-22
i386       buildonly-randconfig-004-20260801    clang-22
i386       buildonly-randconfig-005-20260801    gcc-14
i386       buildonly-randconfig-006-20260801    gcc-14
i386                 randconfig-011-20260801    clang-22
i386                 randconfig-012-20260801    gcc-14
i386                 randconfig-013-20260801    gcc-14
i386                 randconfig-014-20260801    clang-22
i386                 randconfig-015-20260801    clang-22
i386                 randconfig-016-20260801    gcc-14
i386                 randconfig-017-20260801    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260801    clang-18
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
riscv                         randconfig-001    gcc-13.4.0
riscv                randconfig-001-20260801    gcc-14.3.0
riscv                randconfig-002-20260801    clang-20
s390                 randconfig-001-20260801    gcc-15.2.0
s390                 randconfig-002-20260801    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260801    gcc-16.1.0
sh                   randconfig-002-20260801    gcc-16.1.0
sparc64                         alldefconfig    gcc-16.1.0
sparc64              randconfig-001-20260801    gcc-9.5.0
x86_64     buildonly-randconfig-001-20260801    clang-22
x86_64     buildonly-randconfig-002-20260801    clang-22
x86_64     buildonly-randconfig-003-20260801    gcc-13
x86_64     buildonly-randconfig-004-20260801    clang-22
x86_64     buildonly-randconfig-005-20260801    clang-22
x86_64     buildonly-randconfig-006-20260801    clang-22
x86_64               randconfig-011-20260801    clang-22
x86_64               randconfig-012-20260801    gcc-14
x86_64               randconfig-013-20260801    clang-22
x86_64               randconfig-014-20260801    gcc-14
x86_64               randconfig-015-20260801    clang-22
x86_64               randconfig-016-20260801    clang-22
x86_64               randconfig-071-20260801    gcc-14
x86_64               randconfig-072-20260801    gcc-14
x86_64               randconfig-073-20260801    clang-22
x86_64               randconfig-074-20260801    gcc-14
x86_64               randconfig-075-20260801    clang-22
x86_64               randconfig-076-20260801    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

