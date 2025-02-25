Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EACC021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 22:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+V/h7TyeyGhboicug5AQKQA6YpsQ8/gU+ZO3OOv1MA=; b=nOLrcfBTxaCIYuJVbdmsQiXvlT
	elEhXUvxyL6zWsqOIO43HBoAe6PN8+6np497RtO3uP4KpUhfHeZsiWLZygwu3bcuMBrbD4gnaKNhz
	52bCRlFp36q0mbpsleTYVeYVOojj7qr9A+NWqYWYbynw4XDvdPRFwwPiyBYUJ2Q/FhtS6WiUd+a0/
	HdKylKcFspKvaZtEh9hh+fyicF5oLiObyMg2TOToswrf7l3rVfXnBHSyQpO7Gnz5hcXYP/O5eHvnh
	bK/P4jPOgF6jhwTAFQTlg85dMCMPCWA0AY7pXxYl372VT1/zbNkylToTbMLmOPakc3ibrIBi1UskZ
	iA1fdzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3bz-00000001juY-0BZy
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 22:41:11 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3bu-00000001jt0-32Xz
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 22:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740523267; x=1772059267;
  h=date:from:to:cc:subject:message-id;
  bh=FLZRDt6nLN2hyt0Pm83cp0Kv7dv0gElfYS2gV89WgfI=;
  b=YtC+4rOKocmzENEwA0aqO2n7XkN7krpZjexksyQr528D8t4tepd+BRGr
   bgPvhuTRmihAUrXXsSyf/bUeq+lKR3I1waZfjliAY9woBDLX0Vxaer66j
   BpbjN4J8OUf9K2Kt68dwJpzP/jZONSKssD8udl1on/hJOYgugZ5gRSrqN
   /Gfc2s90lZIhOMId/MvS/DEHET1pK04ApDkExUFZwVohHmzsBZ+M1DCiR
   l7kAhcbkp5NIoUeDvn1MF4LEyjMgnVP5LehhV1CjfyiiplFjN92ZHbIWY
   govj/M9OZElnhIOxBm+TXNIXOZJ6VANbeMzU2I9ZMPEap6AdXqLpUYlxJ
   A==;
X-CSE-ConnectionGUID: 11MHnhjWQSujiS/SrVe0iA==
X-CSE-MsgGUID: 9m4ikOfYR866+iFLHEtqkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41481928"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41481928"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 14:41:01 -0800
X-CSE-ConnectionGUID: XfakjCqPQ0yhcVb1wfzxzg==
X-CSE-MsgGUID: KZzgfIQuQ62JnarO1yW3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="121519459"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Feb 2025 14:40:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn3bl-000At5-0f;
	Tue, 25 Feb 2025 22:40:57 +0000
Date: Wed, 26 Feb 2025 06:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 894ffb9f5a6d06a972fe94d7537baa18ac2cf67d
Message-ID: <202502260638.nxNkX0TF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_144106_805894_0DC132BF 
X-CRM114-Status: UNSURE (   4.08  )
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
branch HEAD: 894ffb9f5a6d06a972fe94d7537baa18ac2cf67d  Merge branch 'pending' into main-pending

elapsed time: 1415m

configs tested: 86
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250225    gcc-13.2.0
arc                   randconfig-002-20250225    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250225    gcc-14.2.0
arm                   randconfig-002-20250225    gcc-14.2.0
arm                   randconfig-003-20250225    gcc-14.2.0
arm                   randconfig-004-20250225    clang-15
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250225    clang-19
arm64                 randconfig-002-20250225    clang-17
arm64                 randconfig-003-20250225    clang-15
arm64                 randconfig-004-20250225    clang-21
csky                  randconfig-001-20250225    gcc-14.2.0
csky                  randconfig-002-20250225    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250225    clang-21
hexagon               randconfig-002-20250225    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250225    clang-19
i386        buildonly-randconfig-002-20250225    gcc-11
i386        buildonly-randconfig-003-20250225    clang-19
i386        buildonly-randconfig-004-20250225    clang-19
i386        buildonly-randconfig-005-20250225    gcc-12
i386        buildonly-randconfig-006-20250225    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250225    gcc-14.2.0
loongarch             randconfig-002-20250225    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20250225    gcc-14.2.0
nios2                 randconfig-002-20250225    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250225    gcc-14.2.0
parisc                randconfig-002-20250225    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250225    gcc-14.2.0
powerpc               randconfig-002-20250225    clang-19
powerpc               randconfig-003-20250225    clang-21
powerpc64             randconfig-001-20250225    gcc-14.2.0
powerpc64             randconfig-002-20250225    gcc-14.2.0
powerpc64             randconfig-003-20250225    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250225    clang-15
riscv                 randconfig-002-20250225    clang-21
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250225    clang-15
s390                  randconfig-002-20250225    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250225    gcc-14.2.0
sh                    randconfig-002-20250225    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250225    gcc-14.2.0
sparc                 randconfig-002-20250225    gcc-14.2.0
sparc64               randconfig-001-20250225    gcc-14.2.0
sparc64               randconfig-002-20250225    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250225    clang-21
um                    randconfig-002-20250225    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250225    gcc-12
x86_64      buildonly-randconfig-002-20250225    clang-19
x86_64      buildonly-randconfig-003-20250225    clang-19
x86_64      buildonly-randconfig-004-20250225    gcc-11
x86_64      buildonly-randconfig-005-20250225    gcc-12
x86_64      buildonly-randconfig-006-20250225    clang-19
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250225    gcc-14.2.0
xtensa                randconfig-002-20250225    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

