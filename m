Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7035BF9B5E0
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uM0nptxwT/SVJXZy+P8sFguFkPRBCTeyiGHOndbXxHA=; b=u3tfEeZ2HFmkngEFF421Ns6ztZ
	c8/TFs4tsYBzywa8151JpL7eUErSaUj6UO7v05wjN96bwTn/0FtbhR3/D4HEXVqoJscEe7mzfwYuO
	Dve8V9NF/iRL/I6rof3vOaJOnkJbYUU6ghs5QEW3OsYvdQrx5fV2MJpU4TFM+lh+ynaLAIdTlK/Ov
	e22+LM059V0YwYREfMPIzbPw/TNLSQ2Zj6gZ2ig7pO1+9EX0VwwebatuLN/nPdEmW/Jwq0EQZWG+p
	ml9kgJVF0N58MPJNzOR8feYTYFMvu5CS+qpciYO6LIcaOW94RkVSiYD0dgj8fFXWbSYJslufQcRWU
	OjtJwI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSzW-00000009mOu-0GAX;
	Wed, 22 Apr 2026 08:31:26 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSzS-00000009mOB-2jFm
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 08:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776846683; x=1808382683;
  h=date:from:to:cc:subject:message-id;
  bh=dF8BvcRGvEtHBO3Sp7X4k3GHsgNeTtvc5itMze8h6xw=;
  b=dgou3LxM0A7XgpO7Gk061gR7reVYLoCA4EGuRNUcbnT61OfABV/cAfHh
   CE1kNCN56ss1PSNEzvJbx6bT+OKBDSIdiagkei+y38iNkCMCg2mW2Hili
   jHazv5hfhP0VLqmBQqQcEVk1XG/3D+KArbun+/Cw40JmtLB9eKgENGOhH
   GM3oUguAcxClAb7KhJo4h3NZZ7b2faliATfwkTDL5FKBzlOlDoiNdzNik
   XxDLmF98z2ofn02yjK2nHFuXXvzdTR+M+LdQ+30mhjiTDJHLXWVVpscre
   sq++9rs1md4bYF2SAkjpLP1FT3ilr3P7f+IFmkjoRUzQDbTPq7lxOpqyU
   Q==;
X-CSE-ConnectionGUID: 2qMdP35JSAqOiQ2M3lXElA==
X-CSE-MsgGUID: jCSuJWCgSMqEjncRWWbTdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77809667"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77809667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:31:15 -0700
X-CSE-ConnectionGUID: /rJswEPhQDOPrpbWvqyK7w==
X-CSE-MsgGUID: ccnUZcIsRkq+bOY4jLI0Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="229125284"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2026 01:31:14 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFSzH-000000000Kj-3ezD;
	Wed, 22 Apr 2026 08:31:11 +0000
Date: Wed, 22 Apr 2026 16:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 012c7d7212725e3fe67d60e303037e7285936ae4
Message-ID: <202604221652.uTGNKBNy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_013122_765721_5C44ABDE 
X-CRM114-Status: UNSURE (   3.96  )
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
branch HEAD: 012c7d7212725e3fe67d60e303037e7285936ae4  wifi: ath9k: Obtain system GPIOS from descriptors

elapsed time: 771m

configs tested: 90
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260422    gcc-9.5.0
arc                   randconfig-002-20260422    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260422    gcc-8.5.0
arm                   randconfig-002-20260422    gcc-8.5.0
arm64                             allnoconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                  randconfig-002-20260422    gcc-14
i386                  randconfig-003-20260422    clang-20
i386                  randconfig-004-20260422    gcc-14
i386                  randconfig-005-20260422    gcc-14
i386                  randconfig-011-20260422    gcc-14
loongarch                         allnoconfig    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260422    gcc-14.3.0
parisc                randconfig-002-20260422    gcc-9.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260422    gcc-13.4.0
powerpc               randconfig-002-20260422    gcc-14.3.0
powerpc64             randconfig-002-20260422    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-002-20260422    clang-18
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260422    gcc-13.4.0
sparc64                          allmodconfig    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260422    gcc-14
x86_64      buildonly-randconfig-002-20260422    gcc-14
x86_64      buildonly-randconfig-003-20260422    gcc-14
x86_64      buildonly-randconfig-004-20260422    clang-20
x86_64      buildonly-randconfig-005-20260422    gcc-14
x86_64      buildonly-randconfig-006-20260422    clang-20
x86_64                randconfig-001-20260422    clang-20
x86_64                randconfig-002-20260422    gcc-14
x86_64                randconfig-003-20260422    gcc-14
x86_64                randconfig-004-20260422    clang-20
x86_64                randconfig-005-20260422    gcc-14
x86_64                randconfig-006-20260422    clang-20
x86_64                randconfig-011-20260422    clang-20
x86_64                randconfig-012-20260422    gcc-14
x86_64                randconfig-013-20260422    clang-20
x86_64                randconfig-014-20260422    clang-20
x86_64                randconfig-015-20260422    gcc-14
x86_64                randconfig-016-20260422    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

