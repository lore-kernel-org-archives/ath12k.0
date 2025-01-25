Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568B8C0218C
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 08:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1jo9YEccVDmmFHXvwSlGnKCcLNaeM9BqZlY6R7SP0UA=; b=LuOoNdS5c+8il9ULge8i67TPZI
	FHBMte0tvWFBAewgqGLSDcEoBi9zjlfiLy7hQ2CA+Yfvp+0GEWLCn2MjxWYSkYOuCRnetbklD1Otr
	txF6cQM+3Zi4P8nH/qNk8GenwQUQiOopRgZ0YdpnRvo9DXljhI0ihchl6dAxVYDeK/F0NzpZrNrPY
	fvyEC+uzhFbF+HwYfVOz3epLTTiEgezsM8vjjjPtQHho2ZX3CPcWdba4IYlHJVUKA6NMijXMHlEqC
	E6/wpDGkrVUK8VWW1yXt513MyhbiPWgcLA4l7Yru9o0SxYSsW+Ktl2PLHLnWA4Pj0iXmMsrobqMAc
	T6Z7IIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbbfl-0000000GFq9-452t
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 08:37:45 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbbfi-0000000GFpo-40an
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 08:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737794263; x=1769330263;
  h=date:from:to:cc:subject:message-id;
  bh=kgQS9uyq3RxPGosvqtl2nkgS9g2fve/u+H70zXexZw0=;
  b=TwyXhoYz57WUXENUXN3IgaEOLzbdTZkviM+qfO00tCJAWT9TjvL9WrI3
   OQNaBYvok6RzAqPFcTBcNIzS9aOpcdOU2o+wJAcFq+UkJYXdS5Ib49mir
   E7TCVwEPD12DBF+c0l8voJxzVwJvTpAvkD8Bk12bl243PdvONf0TfovAN
   oGB2f2vjCArUGGoBXyG5y949FBpVZKC3ACkai7mAKyaJkB6JKuiQAh5ws
   EscnGWYRlJaFwxnn9lMw8tNTK1o2+HswAKhS3Lb8tj1Oiw+q9ZN0Cjwhy
   BU7SF5XCFGvyMdKo/qBNc8U0xnSF0azDOJjuWdIMkWcnS9ICX7vknpJNL
   Q==;
X-CSE-ConnectionGUID: OTeMApxcR1KVnjupPzgpyA==
X-CSE-MsgGUID: Djxk9zRpRLObT/x/vGnohA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38240041"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="38240041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 00:37:35 -0800
X-CSE-ConnectionGUID: 6d4+MLlQRlasU3CKXe8hCQ==
X-CSE-MsgGUID: VYQdLfGeSze1UvE9e+JFGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="138841211"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Jan 2025 00:37:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbbfX-000ddf-2A;
	Sat, 25 Jan 2025 08:37:31 +0000
Date: Sat, 25 Jan 2025 16:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-current] BUILD SUCCESS
 64a1ba4072b34af1b76bf15fca5c2075b8cc4d64
Message-ID: <202501251617.HjkTCcmv-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_003743_042982_DF0B5DC2 
X-CRM114-Status: UNSURE (   4.09  )
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
branch HEAD: 64a1ba4072b34af1b76bf15fca5c2075b8cc4d64  wifi: ath12k: fix handling of 6 GHz rules

elapsed time: 841m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250125    gcc-13.2.0
arc                   randconfig-002-20250125    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250125    gcc-14.2.0
arm                   randconfig-002-20250125    gcc-14.2.0
arm                   randconfig-003-20250125    clang-18
arm                   randconfig-004-20250125    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250125    gcc-14.2.0
arm64                 randconfig-002-20250125    gcc-14.2.0
arm64                 randconfig-003-20250125    gcc-14.2.0
arm64                 randconfig-004-20250125    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250125    gcc-14.2.0
csky                  randconfig-002-20250125    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250125    clang-20
hexagon               randconfig-002-20250125    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250125    gcc-12
i386        buildonly-randconfig-002-20250125    clang-19
i386        buildonly-randconfig-003-20250125    gcc-12
i386        buildonly-randconfig-004-20250125    clang-19
i386        buildonly-randconfig-005-20250125    clang-19
i386        buildonly-randconfig-006-20250125    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250125    gcc-14.2.0
loongarch             randconfig-002-20250125    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250125    gcc-14.2.0
nios2                 randconfig-002-20250125    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250125    gcc-14.2.0
parisc                randconfig-002-20250125    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250125    clang-18
powerpc               randconfig-002-20250125    gcc-14.2.0
powerpc               randconfig-003-20250125    gcc-14.2.0
powerpc64             randconfig-001-20250125    gcc-14.2.0
powerpc64             randconfig-002-20250125    clang-20
powerpc64             randconfig-003-20250125    clang-16
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250125    gcc-14.2.0
riscv                 randconfig-002-20250125    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250125    clang-19
s390                  randconfig-002-20250125    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250125    gcc-14.2.0
sh                    randconfig-002-20250125    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250125    gcc-14.2.0
sparc                 randconfig-002-20250125    gcc-14.2.0
sparc64               randconfig-001-20250125    gcc-14.2.0
sparc64               randconfig-002-20250125    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250125    clang-20
um                    randconfig-002-20250125    gcc-11
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250125    clang-19
x86_64      buildonly-randconfig-002-20250125    gcc-11
x86_64      buildonly-randconfig-003-20250125    clang-19
x86_64      buildonly-randconfig-004-20250125    gcc-12
x86_64      buildonly-randconfig-005-20250125    clang-19
x86_64      buildonly-randconfig-006-20250125    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250125    gcc-14.2.0
xtensa                randconfig-002-20250125    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

