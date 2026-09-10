Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEC7C79FB9
	for <ath12k@archiver.kernel.org>; Thu, 10 Sep 2026 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jgOTJ/G/l0LOpMRDMbLAtWHvhQXQvz482dM6GlkdxlU=; b=MLzhImpcsfC0CARcCRP0L6LEYo
	/lzXdN6ZcKk955M0QCtA7sm0aoACk2YkDyK0PDTyvobuVNkGrG12xlI6qpOqesl7oHce/rI5Z2ejQ
	f4pM0f+PMa87Y72IO6ZGYUd8uH8gqojTRj3gKEJ04NP+aEZBdXpHZZxOslovuB7TiyDo8Wor/DOZz
	aXdy5PCIqM0T+OBEe6otDeUynzsDlW4RG6PJZdsywSoTM39fMyo2kk1GgrX+eHI1j/6qZ7MWUl4XX
	HE7zF29D00N86Ra0CIvMAijPy07UNQF1xQygTYezwGY/sWUqHjlwcOjnpD+yCf/1SgPOzqxgiqxlx
	3aS1e62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dkv-0000000EJyf-2lzE;
	Thu, 10 Sep 2026 12:19:53 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dkt-0000000EJyL-3jHU
	for ath12k@lists.infradead.org;
	Thu, 10 Sep 2026 12:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789042792; x=1820578792;
  h=date:from:to:cc:subject:message-id;
  bh=7HNck2qKCwcsPwR4IDAHNOvg8GG+G9KLVI5RiNQKqsY=;
  b=dt35Fmqg6wfFyN7VtdpdJyg/HFHwrjBfNFVhWRZuuE21gevz575Qmcqf
   4Rtf1qEkWbmu+1DhX6+jFcBcwxUT35lEG/abxkTnWYvyrq7tBIkR6y9JD
   oVPPdrMv7Xw2bJIokq10NwHI5P0mmNn2AjH8HHTUmEXbGYCEp4KlSpdm0
   PIVVekuHYe5q/ZyCj6pKW0FHInUE7nJE10geYBGi65nywnKemJFECfStL
   yK56ZEFr6aEwk72VVhLL+dZ8tMmuN14Zir+PvDmp467xHtohLBUfAhYd7
   VmbZPtDvzwprqqWd3+CrqeE9uBS/uEaKsYsG6SGRartJsZ2BCsjZSKAQC
   g==;
X-CSE-ConnectionGUID: Aum8LkOVTDG8t6SVqwhSYA==
X-CSE-MsgGUID: zbWPmiKwSCuOT7p6A1nR8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="101007529"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="101007529"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:19:52 -0700
X-CSE-ConnectionGUID: dEc5jGdpRV+wFyP3NSeSWQ==
X-CSE-MsgGUID: r93kz0DHSxaGiJJRNEYvZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="275140266"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 05:19:51 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4dkp-000000001nn-3dpA;
	Thu, 10 Sep 2026 12:19:47 +0000
Date: Thu, 10 Sep 2026 20:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-current] BUILD SUCCESS
 a4d4c205cdb8657077f72bf0676b51df8ea8e01e
Message-ID: <202609102053.sUV81GOJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_051951_970792_D015016F 
X-CRM114-Status: UNSURE (   3.99  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-current
branch HEAD: a4d4c205cdb8657077f72bf0676b51df8ea8e01e  wifi: mac80211: set up the TX info early to fix failure paths

elapsed time: 2769m

configs tested: 85
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-16.1.0
alpha         allyesconfig    gcc-16.1.0
arc           allmodconfig    clang-24
arc           allmodconfig    gcc-16.1.0
arc            allnoconfig    gcc-16.1.0
arc           allyesconfig    clang-24
arc           allyesconfig    gcc-16.1.0
arm            allnoconfig    clang-17
arm            allnoconfig    gcc-16.1.0
arm           allyesconfig    clang-24
arm           allyesconfig    gcc-16.1.0
arm64         allmodconfig    clang-24
arm64          allnoconfig    gcc-16.1.0
csky          allmodconfig    gcc-16.1.0
csky           allnoconfig    gcc-16.1.0
hexagon       allmodconfig    clang-24
hexagon       allmodconfig    gcc-16.1.0
hexagon        allnoconfig    clang-24
hexagon        allnoconfig    gcc-16.1.0
i386          allmodconfig    clang-22
i386           allnoconfig    gcc-14
i386           allnoconfig    gcc-16.1.0
i386          allyesconfig    clang-22
loongarch     allmodconfig    clang-19
loongarch     allmodconfig    clang-24
loongarch      allnoconfig    clang-20
loongarch      allnoconfig    gcc-16.1.0
m68k          allmodconfig    gcc-16.1.0
m68k           allnoconfig    gcc-16.1.0
m68k          allyesconfig    clang-24
m68k          allyesconfig    gcc-16.1.0
microblaze     allnoconfig    gcc-16.1.0
microblaze    allyesconfig    gcc-16.1.0
mips          allmodconfig    gcc-16.1.0
mips           allnoconfig    gcc-16.1.0
mips          allyesconfig    gcc-16.1.0
nios2         allmodconfig    clang-20
nios2         allmodconfig    gcc-11.5.0
nios2          allnoconfig    clang-24
nios2          allnoconfig    gcc-11.5.0
openrisc      allmodconfig    clang-20
openrisc      allmodconfig    gcc-16.1.0
openrisc       allnoconfig    clang-24
openrisc       allnoconfig    gcc-16.1.0
parisc        allmodconfig    gcc-16.1.0
parisc         allnoconfig    clang-24
parisc         allnoconfig    gcc-16.1.0
parisc        allyesconfig    clang-17
parisc        allyesconfig    gcc-16.1.0
powerpc       allmodconfig    gcc-16.1.0
powerpc        allnoconfig    clang-24
powerpc        allnoconfig    gcc-16.1.0
riscv         allmodconfig    clang-24
riscv          allnoconfig    clang-24
riscv          allnoconfig    gcc-16.1.0
riscv         allyesconfig    clang-24
s390          allmodconfig    clang-17
s390          allmodconfig    clang-24
s390           allnoconfig    clang-24
s390          allyesconfig    gcc-16.1.0
sh            allmodconfig    gcc-16.1.0
sh             allnoconfig    clang-24
sh             allnoconfig    gcc-16.1.0
sh            allyesconfig    clang-17
sh            allyesconfig    gcc-16.1.0
sparc          allnoconfig    clang-24
sparc          allnoconfig    gcc-16.1.0
sparc64       allmodconfig    clang-20
um            allmodconfig    clang-17
um             allnoconfig    clang-17
um             allnoconfig    clang-24
um            allyesconfig    gcc-14
um            allyesconfig    gcc-16.1.0
x86_64        allmodconfig    clang-22
x86_64         allnoconfig    clang-22
x86_64         allnoconfig    clang-24
x86_64        allyesconfig    clang-22
x86_64        rhel-9.4-bpf    gcc-14
x86_64      rhel-9.4-kunit    gcc-14
x86_64        rhel-9.4-ltp    gcc-14
x86_64       rhel-9.4-rust    clang-22
xtensa         allnoconfig    clang-24
xtensa         allnoconfig    gcc-16.1.0
xtensa        allyesconfig    clang-20
xtensa        allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

