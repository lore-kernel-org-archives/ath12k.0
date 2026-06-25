Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72162CDB479
	for <ath12k@archiver.kernel.org>; Thu, 25 Jun 2026 05:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g4Ekz1RtHlqmbnTfWqN8NtLN4MTtLvcuoWJXqXGT0KU=; b=EGtnRzlg+N/ue/FoZIzcl1IiW4
	JwbYzbO3LthkVAvAQ1jldeNgRNBXceGux17VRDGPsRoRw0CgytG9pQQiGfHqVC7rAgowbjbjvz9wv
	jyNEir4f4vFJD9R5lbw9ouxV9R6i4y6YvxTLRXjt6Ep1OyyDQ5x1QgTa7B/lFRILc6YZ5hncmUk7n
	qC7ba6cw74YZcGEpPgLP7d2rIhgUsk2qgKRwGfCd758gYe8kAJ47P2ST8X+5AZEMewN7rL41WD7ui
	sH+IBB8JewqnJLlehCHON4FLjhFcbxW8X1C+dWQkFVWg6DxxMdIQfackqcnV8oNCs/eP3pNS09GT9
	CM2G8vuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccTH-00000008f4d-0rfy;
	Thu, 25 Jun 2026 05:17:51 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccTE-00000008erj-0P8z
	for ath12k@lists.infradead.org;
	Thu, 25 Jun 2026 05:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782364668; x=1813900668;
  h=date:from:to:cc:subject:message-id;
  bh=BDjiRqJUR+qLLHoKFTWWm9EpoBdMozdWRrqPmF85Hs4=;
  b=ji5r5tkXfsNzcYsEghAXR9MnpIDWl7z1bbPXYGDgIo++auUzlaf5CbBg
   3jrAB4LRVCNtwL0K+Azur4ekEG3wj4BSVyzHkl7IPbn3190m6i1A2y0Ut
   XgO50+F75IrwlTwfKuV1zjAjqVyzC1U0LXGJz34LMB5W+CoIvwbnXg7Fu
   uZkcMske8UeJwW5i+8OJuX/0Jzk0CUlqx6CatF1B4xpkZSJfJ4RNM9uyZ
   7hInrgML5QKDQ9+kq/rMZzQfvxU9FIkCurKrFErF1C0HJu2Ie9BoE7ovI
   L9dbUuizD4meNEZMLkVk0k5McM8u/uRl7PrwDjonRjJGBAw/WGQz9nziI
   w==;
X-CSE-ConnectionGUID: P7JjcVKzQC+WpzxkBkl+9A==
X-CSE-MsgGUID: lBfs6UmqSK2PRkaOO/BOEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="100686315"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="100686315"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 22:15:44 -0700
X-CSE-ConnectionGUID: cSAqg888S3+zcMkC6l79BQ==
X-CSE-MsgGUID: I3/bG5aNQ1OEbT52/geiIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="280525431"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Jun 2026 22:15:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wccRA-000000003u1-1Jgc;
	Thu, 25 Jun 2026 05:15:40 +0000
Date: Thu, 25 Jun 2026 13:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 3c6647c474ac21aa4def553003ac8123bae0d016
Message-ID: <202606251336.GzDfUL2w-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_221748_188626_10A55E53 
X-CRM114-Status: UNSURE (   3.78  )
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
branch HEAD: 3c6647c474ac21aa4def553003ac8123bae0d016  Merge branch 'pending' into main-pending

elapsed time: 725m

configs tested: 248
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260625    clang-23
arc                   randconfig-002-20260625    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260625    clang-23
arm                   randconfig-002-20260625    clang-23
arm                   randconfig-003-20260625    clang-23
arm                   randconfig-004-20260625    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260625    clang-23
arm64                 randconfig-002-20260625    clang-23
arm64                 randconfig-003-20260625    clang-23
arm64                 randconfig-004-20260625    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260625    clang-23
csky                  randconfig-002-20260625    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260625    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260625    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260625    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260625    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260625    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260625    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260625    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260625    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260625    clang-22
i386                  randconfig-002-20260625    clang-22
i386                  randconfig-003-20260625    clang-22
i386                  randconfig-004-20260625    clang-22
i386                  randconfig-005-20260625    clang-22
i386                  randconfig-006-20260625    clang-22
i386                  randconfig-007-20260625    clang-22
i386                  randconfig-011-20260625    clang-22
i386                  randconfig-012-20260625    clang-22
i386                  randconfig-012-20260625    gcc-14
i386                  randconfig-013-20260625    clang-22
i386                  randconfig-013-20260625    gcc-14
i386                  randconfig-014-20260625    clang-22
i386                  randconfig-014-20260625    gcc-12
i386                  randconfig-015-20260625    clang-22
i386                  randconfig-016-20260625    clang-22
i386                  randconfig-017-20260625    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260625    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260625    gcc-11.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                          atari_defconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                          ath25_defconfig    clang-23
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260625    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260625    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260625    gcc-13.4.0
parisc                randconfig-002-20260625    gcc-13.4.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                     kmeter1_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260625    gcc-13.4.0
powerpc               randconfig-002-20260625    gcc-13.4.0
powerpc                     tqm5200_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260625    gcc-13.4.0
powerpc64             randconfig-002-20260625    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-13.4.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260625    clang-23
riscv                 randconfig-001-20260625    gcc-8.5.0
riscv                          randconfig-002    clang-23
riscv                          randconfig-002    gcc-8.5.0
riscv                 randconfig-002-20260625    gcc-8.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-15.2.0
s390                           randconfig-001    gcc-8.5.0
s390                  randconfig-001-20260625    gcc-8.5.0
s390                  randconfig-001-20260625    gcc-9.5.0
s390                           randconfig-002    clang-18
s390                           randconfig-002    gcc-8.5.0
s390                  randconfig-002-20260625    gcc-15.2.0
s390                  randconfig-002-20260625    gcc-8.5.0
sh                               alldefconfig    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-14.3.0
sh                             randconfig-001    gcc-8.5.0
sh                    randconfig-001-20260625    gcc-14.3.0
sh                    randconfig-001-20260625    gcc-8.5.0
sh                             randconfig-002    gcc-8.5.0
sh                             randconfig-002    gcc-9.5.0
sh                    randconfig-002-20260625    gcc-16.1.0
sh                    randconfig-002-20260625    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260625    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260625    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260625    gcc-8.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260625    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260625    gcc-8.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260625    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260625    clang-22
x86_64      buildonly-randconfig-001-20260625    gcc-14
x86_64      buildonly-randconfig-002-20260625    clang-22
x86_64      buildonly-randconfig-002-20260625    gcc-14
x86_64      buildonly-randconfig-003-20260625    clang-22
x86_64      buildonly-randconfig-004-20260625    clang-22
x86_64      buildonly-randconfig-005-20260625    clang-22
x86_64      buildonly-randconfig-005-20260625    gcc-14
x86_64      buildonly-randconfig-006-20260625    clang-22
x86_64      buildonly-randconfig-006-20260625    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260625    gcc-14
x86_64                randconfig-002-20260625    gcc-14
x86_64                randconfig-003-20260625    gcc-14
x86_64                randconfig-004-20260625    gcc-14
x86_64                randconfig-005-20260625    gcc-14
x86_64                randconfig-006-20260625    gcc-14
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260625    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260625    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260625    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260625    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260625    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260625    clang-22
x86_64                         randconfig-071    clang-22
x86_64                randconfig-071-20260625    clang-22
x86_64                         randconfig-072    clang-22
x86_64                randconfig-072-20260625    clang-22
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260625    clang-22
x86_64                         randconfig-074    clang-22
x86_64                randconfig-074-20260625    clang-22
x86_64                         randconfig-075    clang-22
x86_64                randconfig-075-20260625    clang-22
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260625    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260625    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260625    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

