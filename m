Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E15CD4F54
	for <ath12k@archiver.kernel.org>; Wed, 27 May 2026 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLjX7LfsKH1EFQeqd2yG4LJngw4EkaI4f9BUEA+MfG0=; b=w/dLLOJoAodfwZERnfv+oVsjkM
	thNyRTQ7Eh1whDqWJ3MBvNwdQ9v49jhSyJtb0rU83+9b/A98Zvf5M6nsixabIUbCZIs2qjuk0jnyi
	dJZO8Vii3gftAQUJegvfBNvxzIgb714vDhX+yKlNUnNNHI3hNpaJgqjpCqLYNkBiQpEp6HK6spHAq
	zNPgB75aGMH73OOmm4pS13B6ccR4KAtn3nfAldNLJ7cuuTA455wn0uwPW6KjMSGND2e06FFBiLMmz
	EejP6gn98q0RwTcTkZPEU12dGeswOMlsMRirwl/b9GR9pOqapONSwXUZEYbG6APJajfba57p3VT3F
	QZAnam5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBqh-00000003xtS-04ys;
	Wed, 27 May 2026 10:50:55 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBqd-00000003xsu-4AtR
	for ath12k@lists.infradead.org;
	Wed, 27 May 2026 10:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779879052; x=1811415052;
  h=date:from:to:cc:subject:message-id;
  bh=6Tc5NiJjqcyf4iMhD5t3Z8viopJLd1DYrBhYHWpK+8M=;
  b=csXp73trb2YwX+YVmwPbWLj1E5wcTA8NDQng44BPLjNzGZgJGSW/Lp+g
   7ucIKVfmHBKVkNyGk2pw4ipETAyRSZTIVNNX2fRJmO+lQwlvXHJTf5EmO
   Z9lP5nz9mfEm0H7gKr54vzS+6JBj6rRfwjaw6TGyBs1OWGAKEJGIutkxV
   Wlg0p0QeVZdry2B8FkJLcDGznKxhC9qsLv7E/hlabm7U5IyK38TTYCQDp
   Z1/Ze6nXGpcPBl4jD3Jdl9ZGYG7JbHa9XQ7Gf5gWlo+8fkC6JiKBzlGvs
   Oo9MTmBaaxRTp3IGHKk4f9ShJoZ4djWmY3scSwiW2ckFukNhv9fRQN21+
   Q==;
X-CSE-ConnectionGUID: j9VbfYEeTWuqXvjKyB0oAA==
X-CSE-MsgGUID: 0dfxsOruRXOJ3aLvrn5D6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79853627"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="79853627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 03:50:51 -0700
X-CSE-ConnectionGUID: W+LyViy6QROanMFTBl8OtA==
X-CSE-MsgGUID: 18gs6FPqToeHV6nbGdjU/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="265795091"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 May 2026 03:50:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSBqa-000000003pq-0uJH;
	Wed, 27 May 2026 10:50:48 +0000
Date: Wed, 27 May 2026 18:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 f8880761e00e4f2529a8404fcbfe80567f7a59b3
Message-ID: <202605271802.JYWsOjeR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_035052_048315_7F75F2BD 
X-CRM114-Status: UNSURE (   3.91  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: f8880761e00e4f2529a8404fcbfe80567f7a59b3  Add localversion-wireless-testing-ath

elapsed time: 1074m

configs tested: 55
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

