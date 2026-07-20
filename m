Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63507C44515
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QJ8AwRihG0Mgvp2EmR5LMtbDv+43OTfJ1ztxe+TbCYU=; b=2w4ibZnMA4oXkTRat0PIjzuiA2
	d1yDn6mtkFaip8+Ew8ztDKaZKWC93t/UM+N41iFnUlx/a/sKJVCzDeDM+3qKF4Zif4nSIAqseOrg2
	aZFdksl1ArECEV+CxbRw7TTgS9e/cqEu8F7U/E4OQJNuxMj9VRF7GV6iYL1KYRpX3IojwDF9PFYSY
	EAIUAs9mWV1o6VYWZa0B/8P3O409h7aoTn5YXxXQY+/Zng+KoHoRjekyQv4dLTuluxWoAk7YrhyE0
	LdLuaFRX6Rn0ldcELmfK8IjleeS6yQnI29SfRgBUK2hrqjBpljsATfXh3aUZt7+a5ECh1cXk7jpc3
	LRL3f8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloEf-00000006rNd-0OCg;
	Mon, 20 Jul 2026 13:40:45 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloEc-00000006rMt-1k60
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 13:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784554842; x=1816090842;
  h=date:from:to:cc:subject:message-id;
  bh=AYZ+vMVcRF75KxDi7X5Pf5nItIrudk3SUSga88++EFU=;
  b=ZyUwRdbMPD4k+QvW9SjNl47vGY8pNvrgAWHBFTW/iuRSY83v1E1YGClZ
   qdZlb/Kv1OUsmxGn8KnQRAIbhaaSi86lF/Zu/6bJesdFJAwhc/MFqDndS
   kmDRGlidIoCAXD5mBVI7seCFKrdP1VskuGsaIE/BaOKnOu77DKYgeIAIh
   +btY8it20TiuhnwZwg++YCWZzvzRYRW/yFpmrLxBEIsET6k7DecrrJJ3t
   tBp2+mGWlF0FtK+BOaOC+yvmwSifq0sICjNS3lEEUTHUIYDM4eaxKQbC2
   VrilP5L6hEOzkgTPQL0OpcHebAL4V4Ei0cLJaF7VYGphRowC2D7exm5NP
   A==;
X-CSE-ConnectionGUID: 0PKa0biXTUeB0HneR5vSqw==
X-CSE-MsgGUID: 8swa4fukRTqMdfpuRDNxWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85334732"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="85334732"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 06:40:38 -0700
X-CSE-ConnectionGUID: WXVh8tTVRIyA+kYI/ArtNw==
X-CSE-MsgGUID: gC1ewGw8Q3WWwrbHfTH6qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="253085318"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jul 2026 06:40:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wloEV-00000000WIp-0hu4;
	Mon, 20 Jul 2026 13:40:35 +0000
Date: Mon, 20 Jul 2026 21:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 612701854b588759c0df3094197d415869ada159
Message-ID: <202607202123.o2SlTAAY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_064042_493860_98973E51 
X-CRM114-Status: UNSURE (   3.85  )
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
branch HEAD: 612701854b588759c0df3094197d415869ada159  wifi: ath6kl: Constify struct cfg80211_ops

elapsed time: 733m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260720    gcc-14.3.0
arc                  randconfig-002-20260720    gcc-16.1.0
arm                  randconfig-001-20260720    gcc-8.5.0
arm                  randconfig-002-20260720    clang-24
arm                  randconfig-003-20260720    gcc-8.5.0
arm                  randconfig-004-20260720    gcc-8.5.0
arm64                randconfig-001-20260720    clang-24
arm64                randconfig-002-20260720    gcc-8.5.0
arm64                randconfig-003-20260720    gcc-10.5.0
arm64                randconfig-004-20260720    clang-17
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260720    gcc-16.1.0
csky                 randconfig-002-20260720    gcc-14.3.0
hexagon              randconfig-001-20260720    clang-24
hexagon              randconfig-002-20260720    clang-24
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260720    gcc-14
i386       buildonly-randconfig-002-20260720    clang-22
i386       buildonly-randconfig-003-20260720    clang-22
i386       buildonly-randconfig-004-20260720    gcc-14
i386       buildonly-randconfig-005-20260720    gcc-13
i386       buildonly-randconfig-006-20260720    clang-22
i386                 randconfig-001-20260720    gcc-14
i386                 randconfig-002-20260720    gcc-13
i386                 randconfig-003-20260720    gcc-14
i386                 randconfig-004-20260720    gcc-14
i386                 randconfig-005-20260720    clang-22
i386                 randconfig-006-20260720    clang-22
i386                 randconfig-007-20260720    clang-22
i386                 randconfig-011-20260720    clang-22
i386                 randconfig-012-20260720    gcc-14
i386                 randconfig-013-20260720    gcc-12
i386                 randconfig-014-20260720    clang-22
i386                 randconfig-015-20260720    clang-22
i386                 randconfig-016-20260720    clang-22
i386                 randconfig-017-20260720    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260720    gcc-16.1.0
loongarch            randconfig-002-20260720    clang-18
mips                       qi_lb60_defconfig    clang-17
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260720    gcc-10.5.0
nios2                randconfig-002-20260720    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260720    gcc-11.5.0
parisc               randconfig-002-20260720    gcc-13.4.0
powerpc              mpc834x_itxgp_defconfig    clang-24
powerpc              randconfig-001-20260720    clang-17
powerpc              randconfig-002-20260720    clang-17
powerpc64            randconfig-001-20260720    clang-24
powerpc64            randconfig-002-20260720    clang-24
riscv                randconfig-001-20260720    gcc-10.5.0
riscv                randconfig-002-20260720    gcc-8.5.0
s390                 randconfig-001-20260720    gcc-11.5.0
s390                 randconfig-002-20260720    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260720    gcc-12.5.0
sh                   randconfig-002-20260720    gcc-10.5.0
sparc                randconfig-001-20260720    gcc-16.1.0
sparc                randconfig-002-20260720    gcc-11.5.0
sparc64              randconfig-001-20260720    gcc-8.5.0
sparc64              randconfig-002-20260720    clang-24
um                   randconfig-001-20260720    clang-18
um                   randconfig-002-20260720    clang-19
x86_64     buildonly-randconfig-001-20260720    clang-22
x86_64     buildonly-randconfig-002-20260720    clang-22
x86_64     buildonly-randconfig-003-20260720    gcc-14
x86_64     buildonly-randconfig-004-20260720    gcc-14
x86_64     buildonly-randconfig-005-20260720    gcc-14
x86_64     buildonly-randconfig-006-20260720    clang-22
x86_64               randconfig-001-20260720    clang-22
x86_64               randconfig-002-20260720    gcc-14
x86_64               randconfig-003-20260720    gcc-14
x86_64               randconfig-004-20260720    gcc-14
x86_64               randconfig-005-20260720    gcc-12
x86_64               randconfig-006-20260720    clang-22
x86_64               randconfig-011-20260720    clang-22
x86_64               randconfig-012-20260720    clang-22
x86_64               randconfig-013-20260720    clang-22
x86_64               randconfig-014-20260720    gcc-14
x86_64               randconfig-015-20260720    gcc-13
x86_64               randconfig-016-20260720    gcc-14
x86_64               randconfig-071-20260720    clang-22
x86_64               randconfig-072-20260720    clang-22
x86_64               randconfig-073-20260720    gcc-13
x86_64               randconfig-074-20260720    gcc-14
x86_64               randconfig-075-20260720    gcc-14
x86_64               randconfig-076-20260720    gcc-14
xtensa               randconfig-001-20260720    gcc-13.4.0
xtensa               randconfig-002-20260720    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

