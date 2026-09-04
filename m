Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56779C79F80
	for <ath12k@archiver.kernel.org>; Fri,  4 Sep 2026 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1s2e6wDwD89YTxFzdho8dmseglThrXuB3iUnEaa4z8=; b=bKSU5WeVMfQWItUKvvWE/lssa/
	q2yHrN1SGmIJk94NihSBZhfn7XKzWpA/vIFQFVeL5eZXIvTKrMNvawB54syRHt7tHXaF3nQ7pgNsr
	Hljyunir/1jPDyDJv4ZV01mibjHZRwtQuY/u6xo0oit+sUkfUqzlDEgVonLbQwSQHVTmT4dofp+xw
	TTTI4cnKwMlSj6VL8/D/Yhqux5N0XJu71Pnfy8KLIqp3/A3mfrMayddDvm0jDe7L8hUFPLGnJgKD/
	/cHTlAdGlDxOpqwYnHYy7W5tHqpmXUTV4+S5LF0dJJMZq+kkbjLJr2hs9lS8+N3w5OGsQkp2iRJ1P
	Q5Uj+tuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XGY-00000002p3r-48sG;
	Fri, 04 Sep 2026 16:59:50 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XGW-00000002p3B-3bV9
	for ath12k@lists.infradead.org;
	Fri, 04 Sep 2026 16:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788541189; x=1820077189;
  h=date:from:to:cc:subject:message-id;
  bh=RPb0X1e6kfdA/oJc4TfzrpOgXVrl8s+lCvEVsiyDv98=;
  b=cNL6pTz0+d60VxsIomQ0PP91nJ7rgaUfcujttoSfS/WUkYrdNJ1HsAbV
   blJPVFHHP8Dt5G7211WjfuLBJ7DKleRK4zdgy9xviOWW7ZLvdIWFa+HJf
   bszVtYD5OoSvP5vffTzYxkC5+c8VCAVH7SE76qZuyvu9JoDsCBi6zI04T
   GssN9RwXIQ9sl6e7HaCZglapwebkg+3o1/+d8Rbh5iDghz5M7PmhHTeWs
   5Y7mKEzwj3uuYUq4ZOmpYLYT5f9ENmdOX2OiweFxGlruynpqJd4xX7GJa
   3p7blYgjX68IxVUwE1xrlaKkE2W12Z6wLEOqFMAlEnsLAet3pl+2vjOe0
   g==;
X-CSE-ConnectionGUID: r+Y/MPFwQl+It77kijDvWg==
X-CSE-MsgGUID: wIKvQAFKRfOT5CKKvavhbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92917633"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="92917633"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 09:59:48 -0700
X-CSE-ConnectionGUID: NmGqU9ExRlKmBoPXYGL+pg==
X-CSE-MsgGUID: 2bKD/VyDQWCSQy94prUJIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="272032320"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Sep 2026 09:59:46 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2XGS-000000009zu-0U9N;
	Fri, 04 Sep 2026 16:59:44 +0000
Date: Sat, 05 Sep 2026 00:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main-pending] BUILD SUCCESS
 a0f382b7c5cd2a6513db3d4175f9b2565da63c14
Message-ID: <202609050047.8F0eqhQ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_095949_148463_012DDB6D 
X-CRM114-Status: UNSURE (   3.83  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-pending
branch HEAD: a0f382b7c5cd2a6513db3d4175f9b2565da63c14  Merge branch 'pending' into main-pending

elapsed time: 2711m

configs tested: 69
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

