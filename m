Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746C7C55160
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lPz+nYNhFUseWF0pIA/27AbPec8wTVHNe2d2MwuTcJA=; b=gkuYEs8m8EZeejPU7R0syrQgAh
	ZWV26Lj4qu5NFHfX9FFKAV6Aqu36IlDOXbD4tfmWfCUgMtJbobgiqwImV6ptlaMJk6+GSbL/NY/iv
	jzjO1PPZIbwOYxbavdyczFhTInYTmXj/8xkWDBIudmj4kSh7Cl8BUeCF+277ArgY0MYJGb7elmgT4
	TU9AkKv0QZNq2NuuLXacyW0llEO5SjgqGCNImEXF7VSQK9eZyxtcqmJnGqwGeV2zOXuIEQsxRS5Te
	Eh0fS3HcDp2gbQUHjrkZWs7Qqg+DM7qaqzognC+mOkdxU0pA9DcnZfM/MMl6P5uyJUzBIAnrDY91F
	wcKpqJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQ7R-0000000AV0x-0e07;
	Thu, 30 Jul 2026 12:44:13 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQ7N-0000000AV0P-3HxC
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 12:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785415450; x=1816951450;
  h=date:from:to:cc:subject:message-id;
  bh=wJmCqTpem4B/w1Q+H9OUUL80r8XzehVk0T+nMEcLQnI=;
  b=g6vun8mEuEzdwWJP7SXjrv1GuQFNFUGkqSKKLnL1Mg6gdHOhdQpW8jru
   QXN6txt0tMbNCza310fDexHn8D3Mxb1CxuP8JyRTZVEQTzPQjNWTmJQCr
   17YpK5zBSl68pB65hyvgwQAHD4wkiwiA8CiI8/gBotJ4j3nISr9/ckEyP
   AFubyJehyQo5nF/Z/v301ORP/sI6wwTcISTb1jzrdPppMb/fLqftEvNJo
   jFt8p+UEZo2OoN9HPjqPSu6MUTtJtGoLDfhdeTbWeyt3UEuDcKLlRf0tp
   W4iD7mK7p7CQQhZG3N0a9cce/ltvMmFUwruM1YzUs2yq2gXNtBb9hjtN8
   A==;
X-CSE-ConnectionGUID: TxfBODO8TjS8fK9vJVbe+g==
X-CSE-MsgGUID: aGJZ01BlRs2Til6Q13mXBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85906660"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85906660"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:44:09 -0700
X-CSE-ConnectionGUID: 55sXcoHDQV62i7b84hq7zw==
X-CSE-MsgGUID: MeX47aCwQPi73wVHDGGuOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="256948785"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2026 05:44:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpQ7G-00000000gYg-1Qrv;
	Thu, 30 Jul 2026 12:44:02 +0000
Date: Thu, 30 Jul 2026 20:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 df70dea3a8e8b0942690a99cdffbbf14c217855a
Message-ID: <202607302025.aV67Vebr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_054410_030848_0A72D5AC 
X-CRM114-Status: UNSURE (   4.06  )
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
branch HEAD: df70dea3a8e8b0942690a99cdffbbf14c217855a  wifi: ath6kl: return 0 explicitly in ath6kl_init_upload()

elapsed time: 893m

configs tested: 142
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260730    gcc-11.5.0
arc                  randconfig-001-20260730    gcc-8.5.0
arc                  randconfig-002-20260730    gcc-8.5.0
arm                  randconfig-001-20260730    gcc-8.5.0
arm                  randconfig-002-20260730    gcc-15.2.0
arm                  randconfig-002-20260730    gcc-8.5.0
arm                  randconfig-003-20260730    gcc-13.4.0
arm                  randconfig-003-20260730    gcc-8.5.0
arm                  randconfig-004-20260730    clang-24
arm                  randconfig-004-20260730    gcc-8.5.0
arm                          stm32_defconfig    gcc-16.1.0
arm64                randconfig-001-20260730    gcc-15.2.0
arm64                randconfig-002-20260730    clang-21
arm64                randconfig-002-20260730    gcc-15.2.0
arm64                randconfig-003-20260730    gcc-15.2.0
arm64                randconfig-003-20260730    gcc-8.5.0
arm64                randconfig-004-20260730    gcc-13.4.0
arm64                randconfig-004-20260730    gcc-15.2.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260730    gcc-13.4.0
csky                 randconfig-001-20260730    gcc-15.2.0
csky                 randconfig-002-20260730    gcc-15.2.0
csky                 randconfig-002-20260730    gcc-16.1.0
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
i386                 randconfig-001-20260730    gcc-14
i386                 randconfig-002-20260730    clang-22
i386                 randconfig-002-20260730    gcc-14
i386                 randconfig-003-20260730    gcc-14
i386                 randconfig-004-20260730    clang-22
i386                 randconfig-004-20260730    gcc-14
i386                 randconfig-005-20260730    clang-22
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
loongarch            randconfig-001-20260730    gcc-16.1.0
loongarch            randconfig-002-20260730    clang-24
loongarch            randconfig-002-20260730    gcc-13.4.0
m68k                      m5249evb_defconfig    gcc-16.1.0
mips                         ath25_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260730    clang-24
nios2                randconfig-001-20260730    gcc-11.5.0
nios2                randconfig-002-20260730    clang-24
nios2                randconfig-002-20260730    gcc-9.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260730    gcc-14.3.0
parisc               randconfig-002-20260730    gcc-14.3.0
powerpc              randconfig-001-20260730    gcc-14.3.0
powerpc              randconfig-002-20260730    gcc-14.3.0
powerpc64            randconfig-001-20260730    gcc-14.3.0
powerpc64            randconfig-002-20260730    gcc-14.3.0
riscv                         randconfig-001    gcc-15.2.0
riscv                randconfig-001-20260730    gcc-15.2.0
riscv                randconfig-002-20260730    gcc-15.2.0
s390                 randconfig-001-20260730    gcc-15.2.0
s390                 randconfig-002-20260730    gcc-15.2.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260730    gcc-15.2.0
sh                   randconfig-002-20260730    gcc-15.2.0
sh                          se7619_defconfig    gcc-16.1.0
sh                          se7705_defconfig    gcc-16.1.0
sparc                         randconfig-001    clang-24
sparc                randconfig-001-20260730    clang-24
sparc                randconfig-001-20260730    gcc-16.1.0
sparc                randconfig-002-20260730    clang-24
sparc                randconfig-002-20260730    gcc-16.1.0
sparc64              randconfig-001-20260730    clang-20
sparc64              randconfig-001-20260730    clang-24
sparc64              randconfig-002-20260730    clang-24
sparc64              randconfig-002-20260730    gcc-14.3.0
um                   randconfig-001-20260730    clang-17
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
x86_64                        randconfig-011    clang-22
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
x86_64               randconfig-073-20260730    clang-22
x86_64               randconfig-073-20260730    gcc-12
x86_64               randconfig-073-20260730    gcc-14
x86_64               randconfig-074-20260730    gcc-12
x86_64               randconfig-074-20260730    gcc-14
x86_64               randconfig-075-20260730    clang-22
x86_64               randconfig-075-20260730    gcc-12
x86_64               randconfig-075-20260730    gcc-14
x86_64               randconfig-076-20260730    clang-22
x86_64               randconfig-076-20260730    gcc-12
x86_64               randconfig-076-20260730    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260730    clang-24
xtensa               randconfig-001-20260730    gcc-16.1.0
xtensa               randconfig-002-20260730    clang-24
xtensa               randconfig-002-20260730    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

