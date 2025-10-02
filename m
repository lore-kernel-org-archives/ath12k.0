Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E48CAC5B8
	for <ath12k@archiver.kernel.org>; Thu,  2 Oct 2025 18:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hjClsgVtqWEmSSxVLPJ4X2ck4ryCqAO8oYL58cIakKY=; b=n8ejK7YLC94T4Wc4L8chjTqW+y
	KyLTKgOLQ+g13yy6WFKeAwsxAS50eGIi+rCFxeLlUf7LcNI+3D0VqDMV39GgCZBqIoMufTzjDkNYy
	rbTL4GPjXpDMZzvwgm1gLaInJmM9i185Yv+nv7fwzyHtaULUkY/aEWpaFaD+Y+OKniZ047KkzZySq
	rrwba5+FUR+7eUdyZH4vevIOig1zrchvAo6GQh9WJ6ZVTxl3uUAAb56t1gf3mdhCsSdZKQaBtlIf9
	y3b6yqqVwP0dyp//1z7vDywk85ybami2u9YuTLKSQTkNJmc78fiL8Ec8TD6IoCzSfqOlz6hl89ckG
	krGQOlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4NkL-0000000B0Vo-1Diz;
	Thu, 02 Oct 2025 18:09:41 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4NkI-0000000B0V2-1yiN
	for ath12k@lists.infradead.org;
	Thu, 02 Oct 2025 18:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759428579; x=1790964579;
  h=date:from:to:cc:subject:message-id;
  bh=RTJKdcU7mG19dZgsAHIREnjEdlhtiEyl57jWA8q+KhA=;
  b=Fjtsxlhzj1cDkHHCz6BV12TrHj/3LeNP286HQ9MjqN3uFU5ARJ7RtVAu
   LqKOf/cxIc8DBmIja7zRsYRLcpV+IRu2OiCGuIxRi58JXalZNDkHqU8X9
   I4ENm6D+lzvuDWOg5AbVDpXIvfkiZuP37PinJYzRmKOiLxpp5S9rW5ogt
   57ev7xsoVoWQvDYtovCDFJFrh6MOM8MfYfTfYgJbd2EwtRZkXnR+TKxbQ
   cVoPP+jWckK2Tp61+tQlQh/4YKT6UG7Di72JYG1BXP43eGeNXsNbc/K30
   OstwuZT+mxrXfWVPoadGeG6lxE9/NiMmTxIVFly6hCe+hQ0rq26TxTO1y
   w==;
X-CSE-ConnectionGUID: /f+GprpGT96EKpA3ZSX+SQ==
X-CSE-MsgGUID: R9hCpUyrQaCugc4Me8Zydg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61821191"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="61821191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 11:09:38 -0700
X-CSE-ConnectionGUID: I7XjJ4dITKub0lALA7PuRA==
X-CSE-MsgGUID: 0DzOWyYVRb66L+T2MkqTkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="183123515"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Oct 2025 11:09:37 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4NkD-000419-2k;
	Thu, 02 Oct 2025 18:09:33 +0000
Date: Fri, 03 Oct 2025 02:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending-ath12k-ng] BUILD SUCCESS
 0b436401e776e8599c828787c080f6729b70d239
Message-ID: <202510030251.pQs82RkB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_110938_555278_DF5F504A 
X-CRM114-Status: UNSURE (   3.71  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-ath12k-ng
branch HEAD: 0b436401e776e8599c828787c080f6729b70d239  wifi: ath12k: Rearrange PPDU radio stats

elapsed time: 1478m

configs tested: 100
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                   randconfig-001-20251002    gcc-12.5.0
arc                   randconfig-002-20251002    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                   randconfig-001-20251002    gcc-12.5.0
arm                   randconfig-002-20251002    clang-22
arm                   randconfig-003-20251002    clang-22
arm                   randconfig-004-20251002    clang-20
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251002    gcc-8.5.0
arm64                 randconfig-002-20251002    clang-22
arm64                 randconfig-003-20251002    clang-22
arm64                 randconfig-004-20251002    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251002    gcc-15.1.0
csky                  randconfig-002-20251002    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251002    clang-22
hexagon               randconfig-002-20251002    clang-16
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251002    clang-20
i386        buildonly-randconfig-002-20251002    gcc-14
i386        buildonly-randconfig-003-20251002    clang-20
i386        buildonly-randconfig-004-20251002    clang-20
i386        buildonly-randconfig-005-20251002    gcc-14
i386        buildonly-randconfig-006-20251002    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251002    gcc-15.1.0
loongarch             randconfig-002-20251002    clang-18
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           jazz_defconfig    clang-17
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251002    gcc-11.5.0
nios2                 randconfig-002-20251002    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251002    gcc-9.5.0
parisc                randconfig-002-20251002    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251002    gcc-8.5.0
powerpc               randconfig-002-20251002    gcc-9.5.0
powerpc               randconfig-003-20251002    clang-22
powerpc64             randconfig-001-20251002    clang-22
powerpc64             randconfig-002-20251002    clang-22
powerpc64             randconfig-003-20251002    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251002    clang-22
riscv                 randconfig-002-20251002    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251002    gcc-14.3.0
s390                  randconfig-002-20251002    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20251002    gcc-13.4.0
sh                    randconfig-002-20251002    gcc-15.1.0
sh                           se7722_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251002    gcc-8.5.0
sparc                 randconfig-002-20251002    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251002    clang-22
sparc64               randconfig-002-20251002    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251002    clang-22
um                    randconfig-002-20251002    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251002    gcc-13
x86_64      buildonly-randconfig-002-20251002    clang-20
x86_64      buildonly-randconfig-003-20251002    clang-20
x86_64      buildonly-randconfig-004-20251002    clang-20
x86_64      buildonly-randconfig-005-20251002    gcc-14
x86_64      buildonly-randconfig-006-20251002    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251002    gcc-8.5.0
xtensa                randconfig-002-20251002    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

