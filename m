Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BA8C54FDF
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1W1jT1nE3XZ8zt2whWaaEfVxDZZBDJZHmb2CLQVIVxY=; b=i4B7BQWOpmG4RRqZFDqdsR20hy
	cMzO16sglf0LjUgRDutqgdgnhR7ECvzBJZy8PHppWdI4u/6Gqp3yVnPBcZ5dqVH6qRI2qAYvGPBEB
	oE73dxqdelv2ykXf9amCi5gWNKhLe6+lh1nMUYoE11ZaAWaYDZDFmtCSLhM6uY0ywukyH6fr1eNX1
	5BdLxCvePajQ0FeV3Cj0jUMP4jiancPlWEyQLanQqSkS5WfaR46FLv2k9tUBpq9fUoPCv7ccPL24C
	SCRHdsbZ1zzCvd+kg1KDj3qZtiqSPtg2UHbk7IyofijGHhDcOUUuRFR1RKS4JAgR6YTQYm+tLV/1p
	88HJpJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNb6-0000000A8FE-1a4R;
	Thu, 30 Jul 2026 10:02:40 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNb3-0000000A8Ea-1AWv
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 10:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785405758; x=1816941758;
  h=date:from:to:cc:subject:message-id;
  bh=N2qpVjiheFMoO7clFe481RB7s3Kuo4xQjl7VbP0t9bE=;
  b=kU5qOTExrFCX1nqQYqV8LXTp/I/e7m72yDzx/Sb3Q4SgG0SrryQjEME8
   dQMU1ACKNy4wo9f0Msu3yvYLzbVot4fYGPWkSRj/2JnYAHX0m4jczZVYg
   kUakioSkYVEr+coLjv/DqhWVT54M+y8B0oN96l4Ft0cuX+7jlb4PozrK5
   T6je9bokzK3C0EA9tUMcxsh4asM5U16tJZfaGO/UaWqeJM23U0ozxHki7
   r+2m7IJLcgGqCA6HBhUJ6YTEctpEB6YjLAcja0nPXMlcd6hEDn6Sa8XBZ
   zszhmwjnTNm6u2lgzcJJOfigKrtylojDVNX4CfOQtGW3YFnZ0snVKuAKy
   A==;
X-CSE-ConnectionGUID: EmIpb/G/Rj+5FVPxS92Pnw==
X-CSE-MsgGUID: v9OGcfngRd+0UIUVuKn61Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85875712"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85875712"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:02:35 -0700
X-CSE-ConnectionGUID: F/kDlzxQRkmVB61WVPGO5A==
X-CSE-MsgGUID: uqs6vG9eQ4eRk4WG7Obobw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="264532335"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Jul 2026 03:02:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpNad-00000000gOE-0dll;
	Thu, 30 Jul 2026 10:02:13 +0000
Date: Thu, 30 Jul 2026 18:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main-pending] BUILD SUCCESS
 ea29f7e3bc24dc7aac4c7aed2b9fceae56cf8eb4
Message-ID: <202607301817.WW3qMDt6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_030237_436495_7223CF09 
X-CRM114-Status: UNSURE (   4.07  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-pending
branch HEAD: ea29f7e3bc24dc7aac4c7aed2b9fceae56cf8eb4  Merge branch 'pending' into main-pending

elapsed time: 914m

configs tested: 127
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260730    gcc-8.5.0
arc                  randconfig-002-20260730    gcc-8.5.0
arm                  randconfig-001-20260730    gcc-8.5.0
arm                  randconfig-002-20260730    gcc-8.5.0
arm                  randconfig-003-20260730    gcc-8.5.0
arm                  randconfig-004-20260730    gcc-8.5.0
arm                       realview_defconfig    clang-17
arm                          stm32_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260730    gcc-14.3.0
arm64                randconfig-001-20260730    gcc-15.2.0
arm64                randconfig-002-20260730    gcc-14.3.0
arm64                randconfig-002-20260730    gcc-15.2.0
arm64                randconfig-003-20260730    gcc-14.3.0
arm64                randconfig-003-20260730    gcc-15.2.0
arm64                randconfig-004-20260730    gcc-14.3.0
arm64                randconfig-004-20260730    gcc-15.2.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260730    gcc-14.3.0
csky                 randconfig-001-20260730    gcc-15.2.0
csky                 randconfig-002-20260730    gcc-14.3.0
csky                 randconfig-002-20260730    gcc-15.2.0
hexagon                       randconfig-001    clang-24
hexagon              randconfig-001-20260730    clang-24
hexagon              randconfig-002-20260730    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260730    gcc-14
i386       buildonly-randconfig-002-20260730    gcc-14
i386       buildonly-randconfig-003-20260730    gcc-14
i386       buildonly-randconfig-004-20260730    gcc-14
i386       buildonly-randconfig-005-20260730    gcc-14
i386       buildonly-randconfig-006-20260730    gcc-14
i386                          randconfig-001    gcc-14
i386                 randconfig-001-20260730    gcc-14
i386                 randconfig-002-20260730    gcc-14
i386                 randconfig-003-20260730    gcc-14
i386                 randconfig-004-20260730    gcc-14
i386                 randconfig-005-20260730    gcc-14
i386                 randconfig-006-20260730    gcc-14
i386                 randconfig-007-20260730    gcc-14
i386                 randconfig-011-20260730    clang-22
i386                 randconfig-012-20260730    clang-22
i386                 randconfig-013-20260730    clang-22
i386                 randconfig-014-20260730    clang-22
i386                 randconfig-015-20260730    clang-22
i386                 randconfig-016-20260730    clang-22
i386                 randconfig-017-20260730    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260730    clang-24
loongarch            randconfig-002-20260730    clang-24
m68k                      m5249evb_defconfig    gcc-16.1.0
mips                         ath25_defconfig    clang-24
mips                decstation_r4k_defconfig    gcc-16.1.0
mips                          ip30_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260730    clang-24
nios2                randconfig-002-20260730    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-14.3.0
parisc               randconfig-001-20260730    gcc-14.3.0
parisc               randconfig-002-20260730    gcc-14.3.0
powerpc                    rainier_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260730    gcc-14.3.0
powerpc              randconfig-002-20260730    gcc-14.3.0
powerpc64            randconfig-001-20260730    gcc-14.3.0
powerpc64            randconfig-002-20260730    gcc-14.3.0
riscv                randconfig-001-20260730    gcc-15.2.0
riscv                randconfig-002-20260730    gcc-15.2.0
s390                 randconfig-001-20260730    gcc-15.2.0
s390                 randconfig-002-20260730    gcc-15.2.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260730    gcc-15.2.0
sh                   randconfig-002-20260730    gcc-15.2.0
sh                          se7705_defconfig    gcc-16.1.0
sparc                         randconfig-001    clang-24
sparc                randconfig-001-20260730    clang-24
sparc                randconfig-002-20260730    clang-24
sparc64              randconfig-001-20260730    clang-24
sparc64              randconfig-002-20260730    clang-24
um                   randconfig-001-20260730    clang-24
um                   randconfig-002-20260730    clang-24
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260730    gcc-14
x86_64     buildonly-randconfig-002-20260730    gcc-14
x86_64     buildonly-randconfig-003-20260730    gcc-14
x86_64     buildonly-randconfig-004-20260730    gcc-14
x86_64     buildonly-randconfig-005-20260730    gcc-14
x86_64     buildonly-randconfig-006-20260730    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    clang-22
x86_64               randconfig-001-20260730    clang-22
x86_64               randconfig-002-20260730    clang-22
x86_64               randconfig-003-20260730    clang-22
x86_64               randconfig-004-20260730    clang-22
x86_64               randconfig-005-20260730    clang-22
x86_64               randconfig-006-20260730    clang-22
x86_64               randconfig-011-20260730    clang-22
x86_64               randconfig-012-20260730    clang-22
x86_64               randconfig-013-20260730    clang-22
x86_64               randconfig-014-20260730    clang-22
x86_64               randconfig-015-20260730    clang-22
x86_64               randconfig-016-20260730    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260730    gcc-12
x86_64               randconfig-071-20260730    gcc-14
x86_64               randconfig-072-20260730    gcc-12
x86_64               randconfig-072-20260730    gcc-14
x86_64               randconfig-073-20260730    gcc-12
x86_64               randconfig-073-20260730    gcc-14
x86_64               randconfig-074-20260730    gcc-12
x86_64               randconfig-074-20260730    gcc-14
x86_64               randconfig-075-20260730    gcc-12
x86_64               randconfig-075-20260730    gcc-14
x86_64               randconfig-076-20260730    gcc-12
x86_64               randconfig-076-20260730    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260730    clang-24
xtensa               randconfig-002-20260730    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

