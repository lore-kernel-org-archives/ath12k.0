Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608A7C3ABC0
	for <ath12k@archiver.kernel.org>; Thu,  8 May 2025 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qd9R5srpkmM4KUhqDypNnYqT4A2A8ZuzknrMaO3IdGU=; b=uFhIpHQyFljz5ovLko6OfbaLhF
	qBF5E9XlwgH3eUCukDDLTxcNR3l0IpW3KR+7W5V9nlcKaxlbxZ5pMlzh8jViZjB5fguG2DqNBnEg3
	gpLGyosgFy79hfEDPLzAvdq0KzXo8vewUSQ3DcOq9/BWpki68w+z1TKo1qnsEoU7hLsFjlnV+1wqD
	71Mvd4J3m9wvBoyeSkYcxiUWevNY96zV24UgjW+Mh7Fs3ZeiQtR1x2uqP+sVxBoJmXs2jdno0Hcpt
	D0M1io690IHwadrr5uLkvDpgvg0Gg7TL4P1Lf3aNhz+6UCQKvXJMKxnYjWFWPVDio7VcqNNYEINia
	g0KgUiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD32u-000000016zG-0M4u;
	Thu, 08 May 2025 15:20:24 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2Ss-00000000yGl-3CJw
	for ath12k@lists.infradead.org;
	Thu, 08 May 2025 14:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746715391; x=1778251391;
  h=date:from:to:cc:subject:message-id;
  bh=mgene5imfrKGYFliorFT0DdTFqPq1ZdvHJeyUDVlA0w=;
  b=E19/ImZ8VOMH2oGXkSggk0Z/s0hkjlHNWNlcnqiiDsOChNDakpBF11vf
   kw2S2r/xhDBCKWo8vsa+v3aiq+lIKYSqTeWv0xX3UWr+hJG3vX63IxEvR
   aCPmZl2ldnTmee8kfFU193Y5//+vjY5WDoz9vIgEHg2YZdUd/Tj5qPNgY
   AVIRy2RtMcDNwThXz0QNlaC/kq7nHEkhyrmsFo4Ynwf3yXQR6AohgK+X4
   8eyb0VGlRMoao10c1YO7bkJ1wSJGUd3D/KdbCF0cIbJqIC55T1lwu5zM2
   BC9UMb4ZMHiK55JAp8/mEDIZbAIMZL5piECI+4fisICEjSSOR3ma2a4DB
   A==;
X-CSE-ConnectionGUID: VDP5gzwYQv6qX3UhettlpA==
X-CSE-MsgGUID: 5LPSTg+sR+KLaa0O1NKpUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47761409"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="47761409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:43:10 -0700
X-CSE-ConnectionGUID: P/82Vkm0QYWz2pS2R1d/vg==
X-CSE-MsgGUID: zdg0fq63Sq6TpCkLXam1Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136200596"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2025 07:43:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD2Sn-000B4B-2q;
	Thu, 08 May 2025 14:43:05 +0000
Date: Thu, 08 May 2025 22:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 6fbe024c96837781441c7683cdf6e1e4f81e354d
Message-ID: <202505082214.e2XGELm3-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_074310_838038_CCC07205 
X-CRM114-Status: UNSURE (   3.56  )
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
branch HEAD: 6fbe024c96837781441c7683cdf6e1e4f81e354d  Merge branch 'pending' into main-pending

elapsed time: 1143m

configs tested: 65
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-14.2.0
alpha         allyesconfig    clang-19
alpha         allyesconfig    gcc-14.2.0
arc           allmodconfig    clang-19
arc            allnoconfig    gcc-14.2.0
arc           allyesconfig    clang-19
arm           allmodconfig    clang-19
arm            allnoconfig    clang-21
arm           allyesconfig    clang-19
arm64         allmodconfig    clang-19
arm64          allnoconfig    gcc-14.2.0
csky           allnoconfig    gcc-14.2.0
hexagon       allmodconfig    clang-17
hexagon       allmodconfig    clang-19
hexagon        allnoconfig    clang-21
hexagon       allyesconfig    clang-19
hexagon       allyesconfig    clang-21
i386          allmodconfig    clang-20
i386           allnoconfig    clang-20
i386          allyesconfig    clang-20
i386             defconfig    clang-20
loongarch     allmodconfig    gcc-14.2.0
loongarch      allnoconfig    gcc-14.2.0
m68k          allmodconfig    gcc-14.2.0
m68k           allnoconfig    gcc-14.2.0
m68k          allyesconfig    gcc-14.2.0
microblaze    allmodconfig    gcc-14.2.0
microblaze     allnoconfig    gcc-14.2.0
microblaze    allyesconfig    gcc-14.2.0
mips           allnoconfig    gcc-14.2.0
nios2          allnoconfig    gcc-14.2.0
openrisc       allnoconfig    gcc-14.2.0
openrisc      allyesconfig    gcc-14.2.0
parisc        allmodconfig    gcc-14.2.0
parisc         allnoconfig    gcc-14.2.0
parisc        allyesconfig    gcc-14.2.0
powerpc       allmodconfig    gcc-14.2.0
powerpc        allnoconfig    gcc-14.2.0
powerpc       allyesconfig    gcc-14.2.0
riscv         allmodconfig    gcc-14.2.0
riscv          allnoconfig    gcc-14.2.0
riscv         allyesconfig    gcc-14.2.0
s390          allmodconfig    clang-18
s390          allmodconfig    gcc-14.2.0
s390           allnoconfig    clang-21
s390          allyesconfig    gcc-14.2.0
sh            allmodconfig    gcc-14.2.0
sh             allnoconfig    gcc-14.2.0
sh            allyesconfig    gcc-14.2.0
sparc         allmodconfig    gcc-14.2.0
sparc          allnoconfig    gcc-14.2.0
um            allmodconfig    clang-19
um             allnoconfig    clang-21
um            allyesconfig    clang-19
um            allyesconfig    gcc-12
x86_64         allnoconfig    clang-20
x86_64        allyesconfig    clang-20
x86_64           defconfig    clang-20
x86_64               kexec    clang-20
x86_64            rhel-9.4    clang-20
x86_64        rhel-9.4-bpf    gcc-12
x86_64      rhel-9.4-kunit    gcc-12
x86_64        rhel-9.4-ltp    gcc-12
x86_64       rhel-9.4-rust    clang-20
xtensa         allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

