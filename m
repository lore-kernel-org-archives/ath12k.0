Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D016C282D1
	for <ath12k@archiver.kernel.org>; Thu,  6 Mar 2025 20:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89lZH1hSwvWnOSQDQg6xB9DrKpTqC1G6usaHlBENQ7k=; b=E5JZVob66n1Z35uP+Cx6oVHCzJ
	ZMbwB8vibDMpuPBiezwLULjKJ5HmYCt3iT/ckizSVhJiCB8i+Pbl/m53fWMMer+XTeCzP1Y4xsVsq
	AQ7z0L7/BDs0abrZX5MHNI7ONIidMzZP/NZ8mLFs3/MQKBVaruQhhrQ7uRL77W1ugjo5PPUtktOx6
	Wo4gDL7iWsdpQqqJm5J9q9KTwgFS08Q86GnVMF/osEvVxvSmawaLG0OcY+wZcPnwBSzSpPKF9NShC
	u8ZLdrRJSCKkhH1xgxyGJzRacJnXMb2CCuMsBoY5T7Bsp6BixHOuZICPXhpc6/xInqibXS1fkc9vE
	2zaSWSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHyw-0000000C8Vu-18Tj
	for ath12k@archiver.kernel.org;
	Thu, 06 Mar 2025 20:38:14 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHyt-0000000C8Uq-1xFg
	for ath12k@lists.infradead.org;
	Thu, 06 Mar 2025 20:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741293492; x=1772829492;
  h=date:from:to:cc:subject:message-id;
  bh=UByVgjT46lM+Qn5wyan2kSxR1FfqgSiki/i5mOgw85s=;
  b=bKkU/lNwsLI+J2gouDrSBbk2SLERc2XcmRjDMLzESjpiaP1hAgL7KdC0
   7Fk5qxyoLd7ze743TQLGjI7+dX47Um8pFf9PBqY/rhcoqVIrZG3iFrlP8
   SMjLzzkqtoSqUVdcoooN6KCw5d4VRkxqWq3kQqYgaazaDSpdvGsetlu0L
   nNrUUKVHFMVa16FSB8XZp7nnqtaTh03dUEElIyik6gAG2MgKJcpNKQN+J
   tk+ChVz7LP/oIiFQZQh/6j2/v23FdrtKe2CNm8moxJONKxVAsnbpzoxex
   6bfc4ciCZtDJKQjgqxtk4sJl/3e1nNIuNZmJC86u74Q/NQHZEdy3lxLYp
   w==;
X-CSE-ConnectionGUID: eMq+ulhWRiC5XfxIxybTYQ==
X-CSE-MsgGUID: YXjH9x7nTgqpTQUB2qpTeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53729818"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="53729818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 12:38:10 -0800
X-CSE-ConnectionGUID: xkJs1H6PTT+7FIerBw8Pfg==
X-CSE-MsgGUID: MDHP5fomSbKfZ7n69ffK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="124163489"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2025 12:38:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqHyn-000NaY-2V;
	Thu, 06 Mar 2025 20:38:05 +0000
Date: Fri, 07 Mar 2025 04:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-split-phy] BUILD SUCCESS
 64723c7be2b959dde8f4a8c85401a57d8740af10
Message-ID: <202503070412.FuluAgBn-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_123811_514886_62C1789F 
X-CRM114-Status: UNSURE (   3.84  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
branch HEAD: 64723c7be2b959dde8f4a8c85401a57d8740af10  wifi: nl80211: store chandef on the correct link when starting CAC

Unverified Warning (likely false positive, kindly check if interested):

    net/mac80211/link.c:96 ieee80211_link_init() warn: can 'master' even be NULL?

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-161-20250306
    `-- net-mac80211-link.c-ieee80211_link_init()-warn:can-master-even-be-NULL

elapsed time: 1451m

configs tested: 91
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250306    gcc-13.2.0
arc                   randconfig-002-20250306    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                          exynos_defconfig    clang-21
arm                   randconfig-001-20250306    gcc-14.2.0
arm                   randconfig-002-20250306    gcc-14.2.0
arm                   randconfig-003-20250306    gcc-14.2.0
arm                   randconfig-004-20250306    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250306    gcc-14.2.0
arm64                 randconfig-002-20250306    gcc-14.2.0
arm64                 randconfig-003-20250306    gcc-14.2.0
arm64                 randconfig-004-20250306    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250306    gcc-14.2.0
csky                  randconfig-002-20250306    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250306    clang-21
hexagon               randconfig-002-20250306    clang-19
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250306    clang-19
i386        buildonly-randconfig-002-20250306    clang-19
i386        buildonly-randconfig-003-20250306    clang-19
i386        buildonly-randconfig-004-20250306    gcc-12
i386        buildonly-randconfig-005-20250306    gcc-12
i386        buildonly-randconfig-006-20250306    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250306    gcc-14.2.0
loongarch             randconfig-002-20250306    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250306    gcc-14.2.0
nios2                 randconfig-002-20250306    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250306    gcc-14.2.0
parisc                randconfig-002-20250306    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250306    clang-21
powerpc               randconfig-002-20250306    clang-18
powerpc               randconfig-003-20250306    gcc-14.2.0
powerpc64             randconfig-001-20250306    clang-18
powerpc64             randconfig-002-20250306    clang-21
powerpc64             randconfig-003-20250306    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250306    clang-18
riscv                 randconfig-002-20250306    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250306    gcc-14.2.0
s390                  randconfig-002-20250306    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250306    gcc-14.2.0
sh                    randconfig-002-20250306    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250306    gcc-14.2.0
sparc                 randconfig-002-20250306    gcc-14.2.0
sparc64               randconfig-001-20250306    gcc-14.2.0
sparc64               randconfig-002-20250306    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250306    gcc-12
um                    randconfig-002-20250306    clang-16
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250306    gcc-11
x86_64      buildonly-randconfig-002-20250306    clang-19
x86_64      buildonly-randconfig-003-20250306    clang-19
x86_64      buildonly-randconfig-004-20250306    clang-19
x86_64      buildonly-randconfig-005-20250306    clang-19
x86_64      buildonly-randconfig-006-20250306    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250306    gcc-14.2.0
xtensa                randconfig-002-20250306    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

