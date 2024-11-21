Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E1DD7878A
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dHsjlIggYHsMx2oHTHRQthg1YZ1UtNMzbkWJ7Ott5ZM=; b=rC/NMvRW/oL0khLUrbhwkcfhi4
	lQ7xaOjZB7C5HEKUxxwJh87BxiVCwE1BgJiAzO08i1YaWcmGnkIGMlfuahVCfnanIHnbDHSj3tGSd
	bRFZG6ZKOd39isLzgCVetOyZPYuVawFmyN/2qUNkQ+eW/g0oVYcOGkAj0Ztr8TRermjkN/7iKs+gA
	poAQsjD2Fv5MrfJeQ83UAjJgoDDVbIC0yHpP0Snvd3nMpXUSnNd7cnz/r5bqaGQDRp4icLhs1l4yu
	OaDmADtY+Derdh1/gHeS3G+OIaOr0XNRb0qa8flxhZ3nEWLZ7poxMZTMc0u8Jw3g/XPLZwtkwXTvq
	j0AksSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9zj-00000000Rdx-3XKR
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 16:25:27 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9zh-00000000Rcs-1Z1x
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 16:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732206326; x=1763742326;
  h=date:from:to:cc:subject:message-id;
  bh=rQL57Sjrmvroc7nyCJJawwlSfKPbHz0g/Wue3EkkIVo=;
  b=WkqX7Ap6J5z2zP7dUWSRhcFJfArBRCYc/Y108wOhelLr2j0q5kSd3l4X
   PhNHhsql7jt1niUKQ93aWAe8dWBmnvt/v8Cvxw+AQQqatWmb6TePBfggb
   b68xQ1qABwlW4NrR8BANqrik9uxMT0d3vQAdkyI3xVc4RjjpwukkLvQGl
   /8VXyHEmgR2RJIr9JhcA62Gx8K6FvxjcNa24rRQKsaQF2X3uLMVrj7uIX
   qw0qXizJQgRu9ngiLi7QPmI8ElAl2gcWQ7Q7/dYmJi7YBcH/Gslo1R2kT
   YKFfF/jeURLJeEsrYIaIYCuWrRd8IKfu+agBVdOl+dv8FYqzYnsZ0rMJ/
   w==;
X-CSE-ConnectionGUID: TKymhdwETveZwJ6sPxg1zw==
X-CSE-MsgGUID: UBtHuB9pQ5WeGVlQgaRhRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42842999"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="42842999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 08:25:23 -0800
X-CSE-ConnectionGUID: MRcNA551TfG+dRA+N0/gpg==
X-CSE-MsgGUID: byT7sfWGQv+ZaseaxLWjCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="90284218"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2024 08:25:22 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE9za-00039v-30;
	Thu, 21 Nov 2024 16:25:18 +0000
Date: Fri, 22 Nov 2024 00:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 ea58aae8458480d6391c404e62f1a4b30462b9c3
Message-ID: <202411220057.raPY4oZA-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_082525_448157_AED757F9 
X-CRM114-Status: UNSURE (   3.94  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: ea58aae8458480d6391c404e62f1a4b30462b9c3  wifi: ath12k: Support MBSSID Control Frame Stats

elapsed time: 1461m

configs tested: 87
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-13.2.0
arc                     allnoconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241121    gcc-13.2.0
arc         randconfig-002-20241121    gcc-13.2.0
arm                    allmodconfig    gcc-14.2.0
arm                     allnoconfig    clang-20
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20241121    clang-20
arm         randconfig-002-20241121    gcc-14.2.0
arm         randconfig-003-20241121    clang-20
arm         randconfig-004-20241121    gcc-14.2.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.2.0
arm64       randconfig-001-20241121    clang-20
arm64       randconfig-002-20241121    clang-20
arm64       randconfig-003-20241121    gcc-14.2.0
arm64       randconfig-004-20241121    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky        randconfig-001-20241121    gcc-14.2.0
csky        randconfig-002-20241121    gcc-14.2.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20241121    clang-20
hexagon     randconfig-002-20241121    clang-15
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch   randconfig-001-20241121    gcc-14.2.0
loongarch   randconfig-002-20241121    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2       randconfig-001-20241121    gcc-14.2.0
nios2       randconfig-002-20241121    gcc-14.2.0
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
openrisc                  defconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc                    defconfig    gcc-14.2.0
parisc      randconfig-001-20241121    gcc-14.2.0
parisc      randconfig-002-20241121    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    clang-20
powerpc     randconfig-001-20241121    clang-15
powerpc     randconfig-002-20241121    gcc-14.2.0
powerpc     randconfig-003-20241121    clang-20
powerpc64   randconfig-001-20241121    gcc-14.2.0
powerpc64   randconfig-002-20241121    clang-20
powerpc64   randconfig-003-20241121    clang-20
riscv                  allmodconfig    clang-20
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    clang-20
riscv       randconfig-001-20241121    gcc-14.2.0
riscv       randconfig-002-20241121    gcc-14.2.0
s390                   allmodconfig    clang-20
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.2.0
s390        randconfig-001-20241121    gcc-14.2.0
s390        randconfig-002-20241121    clang-20
sh                     allmodconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh                        defconfig    gcc-14.2.0
sh          randconfig-001-20241121    gcc-14.2.0
sh          randconfig-002-20241121    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
sparc64     randconfig-001-20241121    gcc-14.2.0
sparc64     randconfig-002-20241121    gcc-14.2.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
um          randconfig-001-20241121    gcc-12
um          randconfig-002-20241121    gcc-12
x86_64                  allnoconfig    clang-19
x86_64                        kexec    clang-19
x86_64                     rhel-9.4    gcc-12
xtensa      randconfig-001-20241121    gcc-14.2.0
xtensa      randconfig-002-20241121    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

