Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D673D2D0E4
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tS/ucXZ3FMhf733fak7wpmY7OmYc/aLw7az3ekeasMk=; b=HzLk53mYpCztt7LXQWNtJ9/vPB
	BafHt+x2OuAOOdYsXTXpmm/Ht3tUIsB7A68G2mrb8rrhVrG0f8dTnnqEsiTLYab/guUG+/cqhapJe
	m5ANqiTeWiVbV5bVynw7wQcaBDSS00uEct1VTA+MSYrTbV9tIV3Sl001rfA79uTTkrIko1Iq76uSj
	4AJ5wBtBRcCMlVXb2KdVSJXCplW3RCVkpNPL+E6YPaSXdXGPY+wzbMlYuG+1IUJukP6FK0WIlul0Z
	9AU0nhXLJfVT9fPyMfnetZmu4OgOarZCd9ItLs3Y3aOQHV9LO5XK0VPbpyn22rpoMPM10l8GJOmoo
	zNk98b7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdEn-000000073Td-07Qr;
	Tue, 13 Jan 2026 12:11:05 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdEj-000000073TJ-49J4
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 12:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768306262; x=1799842262;
  h=date:from:to:cc:subject:message-id;
  bh=eCoKjYK8+qdeTXhrKAGvRVTSVy9nxlP+4KQXhFhWTLY=;
  b=R88OHEdl/HQNk4/czyiyQAkmLgJ03ZfJUqwmbfaa1NYGd3L6Oxe1a64O
   /TL5i0Va4S2VF/zvuTK966tPvX4XyOl5yQmtf4Q8bXkiepsLiE1LtlTsf
   brAPcV7GYOvMWISHSvEzt90G8ros8fSMRvSPR4K2zbgO/oL39W6PYyRqp
   I5fP0KHpCnmOvHaf6FvxEU/5e8ZLCA1xSXtf5lTsWCWzr6lJzBpWMv49u
   QHollNCYQdWXQy+id726pEuvKUWi9kCPfqwACLzyRfEaZ3zx1nWK8d3UR
   HT3KNqB/WIXGmZq1YGf9vVE/UiR+5ZQJkyTJNTSs6qmUz/NiVJA2NpA7H
   g==;
X-CSE-ConnectionGUID: 4Xo9qbeqQBe4iid7X/K3Ng==
X-CSE-MsgGUID: NBVIOyrvSyuGln6ihWPj5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69571036"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69571036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:11:01 -0800
X-CSE-ConnectionGUID: BWJZF+1QRGqtsgYJhb9r7w==
X-CSE-MsgGUID: dqtP3xtSQuKYXQADcEcEDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204257520"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 04:10:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfdEf-00000000EiV-1F6H;
	Tue, 13 Jan 2026 12:10:57 +0000
Date: Tue, 13 Jan 2026 20:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:for-current] BUILD SUCCESS
 1fed08c5519d2f929457f354d3c06c6a8c33829c
Message-ID: <202601132037.pQeHjOE3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_041102_102387_E8A8E9F1 
X-CRM114-Status: UNSURE (   4.37  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
branch HEAD: 1fed08c5519d2f929457f354d3c06c6a8c33829c  wifi: ath12k: don't force radio frequency check in freq_to_idx()

elapsed time: 5522m

configs tested: 81
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                   randconfig-001-20260113    clang-22
arc                   randconfig-002-20260113    clang-22
arm                               allnoconfig    clang-22
arm                   milbeaut_m10v_defconfig    gcc-15.2.0
arm                        mvebu_v7_defconfig    gcc-15.2.0
arm                   randconfig-001-20260113    clang-22
arm                   randconfig-002-20260113    clang-22
arm                   randconfig-003-20260113    clang-22
arm                   randconfig-004-20260113    clang-22
arm                           sunxi_defconfig    gcc-15.2.0
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260113    clang-22
arm64                 randconfig-002-20260113    clang-22
arm64                 randconfig-003-20260113    clang-22
arm64                 randconfig-004-20260113    clang-22
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260113    clang-22
csky                  randconfig-002-20260113    clang-22
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20260113    clang-20
i386        buildonly-randconfig-002-20260113    clang-20
i386        buildonly-randconfig-003-20260113    clang-20
i386        buildonly-randconfig-004-20260113    clang-20
i386        buildonly-randconfig-005-20260113    clang-20
i386        buildonly-randconfig-006-20260113    clang-20
i386                  randconfig-011-20260113    gcc-14
i386                  randconfig-012-20260113    gcc-14
i386                  randconfig-013-20260113    gcc-14
i386                  randconfig-014-20260113    gcc-14
i386                  randconfig-015-20260113    gcc-14
i386                  randconfig-016-20260113    gcc-14
i386                  randconfig-017-20260113    gcc-14
loongarch                         allnoconfig    clang-22
m68k                              allnoconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                     cu1000-neo_defconfig    gcc-15.2.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                     tqm8560_defconfig    gcc-15.2.0
riscv                             allnoconfig    gcc-15.2.0
riscv                 randconfig-001-20260113    gcc-15.2.0
riscv                 randconfig-002-20260113    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                  randconfig-001-20260113    gcc-15.2.0
s390                  randconfig-002-20260113    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                    randconfig-001-20260113    gcc-15.2.0
sh                    randconfig-002-20260113    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20260113    clang-20
x86_64      buildonly-randconfig-002-20260113    clang-20
x86_64      buildonly-randconfig-003-20260113    clang-20
x86_64      buildonly-randconfig-004-20260113    clang-20
x86_64      buildonly-randconfig-005-20260113    clang-20
x86_64      buildonly-randconfig-006-20260113    clang-20
x86_64                randconfig-001-20260113    gcc-14
x86_64                randconfig-002-20260113    gcc-14
x86_64                randconfig-003-20260113    gcc-14
x86_64                randconfig-004-20260113    gcc-14
x86_64                randconfig-005-20260113    gcc-14
x86_64                randconfig-006-20260113    gcc-14
xtensa                           alldefconfig    gcc-15.2.0
xtensa                            allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

