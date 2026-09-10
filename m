Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4471C79F9F
	for <ath12k@archiver.kernel.org>; Thu, 10 Sep 2026 15:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EyHjt5aSXpvdxXJDdzOcGw7dzTcuOmR7G+ia53uTipk=; b=u9r4vEX3pEPBFDULS0KdMpupeF
	gPjEJu5Bv2lJ0NuP0dIa2Ib21aT7v/pMSzqsB5qbDBu+22d3FfIyn25M63Mg5FGSPxaladgDYMN/k
	gLXb/aCNKXErYaqRovBOQ/SlJqIgkhW4e8RdArjg23odb2961lILWHo4jAAwwENxEu2LB1d+thHqc
	d0hbl8sHpQ7Yc/8tIPqaB0/GmMNUUtw2BaUPKZP315e6EgqAM9TkRManmx2SB9K28bGn15zOmtEUU
	jmXQoFt5issJvbjKRmp5Wvf3QK477uYdKl70Ic2WuqasyazK9t62hBlzcrGtIK5TdEyMwRbte46IY
	EoapdnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gXa-0000000Ela9-3aNc;
	Thu, 10 Sep 2026 15:18:18 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gXY-0000000ElZT-0d2h
	for ath12k@lists.infradead.org;
	Thu, 10 Sep 2026 15:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789053496; x=1820589496;
  h=date:from:to:cc:subject:message-id;
  bh=pJbVjjDPKILPryh+MaSRF4/Jnv+VJMfYQ0uBqeaanic=;
  b=WRY/N8iu+NeG8elz03o6s0O1+1qKMCaUp079zDbYBrfJgN+PZ1MG33lL
   4jaboLkiRAf6a3PHKTj++no2AcX/OPJIJXziU1lAvURmtP5BgJTN2MELi
   NmjFeGyCzARon8SWJRYDkCT3Ar37meYzd4tcrC9gugnf9X8L8P1i6kC20
   cRHNV6hsDgvZqUma4YG5/TQq+81Vfk5gCpNnDnflT/i3xpOcrbSKN245N
   5HaVN1XH5ydW8ykVhcYA/nWEiaqm7nHqtwwDxr5WSsbv6tY5992k/QFJL
   7Z0zH1zzCgg+lqq0LfhED9j4ok0OGnfrnh+VQTiP8C2XVEjAOogwuzPZh
   Q==;
X-CSE-ConnectionGUID: p/9fU72CS4KEi8QJzAoGWA==
X-CSE-MsgGUID: iPDKKp/TRhSNIEUFQ2W+nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93332286"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93332286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:18:15 -0700
X-CSE-ConnectionGUID: GvsISMo0SbSFwv3V/LI6hg==
X-CSE-MsgGUID: +uYrq4BoQwmJzszuKnmekg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267979375"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2026 08:18:14 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gX3-000000000Be-3Tm6;
	Thu, 10 Sep 2026 15:17:53 +0000
Date: Thu, 10 Sep 2026 23:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 69b2d06dafa4a61b718704d655dd370ba660052a
Message-ID: <202609102359.LqZa9SLm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_081816_229347_ECA3DB8E 
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
branch HEAD: 69b2d06dafa4a61b718704d655dd370ba660052a  wifi: ath12k: preserve PPDU state across monitor status buffers

elapsed time: 1254m

configs tested: 58
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-16.1.0
alpha         allyesconfig    gcc-16.1.0
arc           allmodconfig    clang-24
arc            allnoconfig    gcc-16.1.0
arc           allyesconfig    clang-24
arm            allnoconfig    gcc-16.1.0
arm           allyesconfig    clang-24
arm64         allmodconfig    clang-24
arm64          allnoconfig    gcc-16.1.0
csky          allmodconfig    gcc-16.1.0
csky           allnoconfig    gcc-16.1.0
hexagon       allmodconfig    gcc-16.1.0
hexagon        allnoconfig    gcc-16.1.0
i386          allmodconfig    clang-22
i386           allnoconfig    gcc-16.1.0
i386          allyesconfig    clang-22
loongarch     allmodconfig    clang-24
loongarch      allnoconfig    gcc-16.1.0
m68k          allmodconfig    gcc-16.1.0
m68k           allnoconfig    gcc-16.1.0
m68k          allyesconfig    clang-24
microblaze     allnoconfig    gcc-16.1.0
microblaze    allyesconfig    gcc-16.1.0
mips          allmodconfig    gcc-16.1.0
mips           allnoconfig    gcc-16.1.0
mips          allyesconfig    gcc-16.1.0
nios2         allmodconfig    clang-20
nios2          allnoconfig    clang-24
openrisc      allmodconfig    clang-20
openrisc       allnoconfig    clang-24
parisc        allmodconfig    gcc-16.1.0
parisc         allnoconfig    clang-24
parisc        allyesconfig    clang-17
powerpc       allmodconfig    gcc-16.1.0
powerpc        allnoconfig    clang-24
riscv         allmodconfig    clang-24
riscv          allnoconfig    clang-24
riscv         allyesconfig    clang-24
s390          allmodconfig    clang-17
s390           allnoconfig    clang-24
s390          allyesconfig    gcc-16.1.0
sh            allmodconfig    gcc-16.1.0
sh             allnoconfig    clang-24
sh            allyesconfig    clang-17
sparc          allnoconfig    clang-24
sparc64       allmodconfig    clang-20
um            allmodconfig    clang-17
um             allnoconfig    clang-24
um            allyesconfig    gcc-16.1.0
x86_64        allmodconfig    clang-22
x86_64         allnoconfig    clang-24
x86_64        allyesconfig    clang-22
x86_64        rhel-9.4-bpf    gcc-14
x86_64      rhel-9.4-kunit    gcc-14
x86_64        rhel-9.4-ltp    gcc-14
x86_64       rhel-9.4-rust    clang-22
xtensa         allnoconfig    clang-24
xtensa        allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

