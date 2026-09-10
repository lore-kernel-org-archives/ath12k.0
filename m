Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECD9C79FBB
	for <ath12k@archiver.kernel.org>; Thu, 10 Sep 2026 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r1XkBkQo0DMrqkYIvLNVRIbpGt3muImRQTdZ1VMo59g=; b=c5zX6grawxOW7VKKqSIaHZeCk2
	S7lKbM9BJlnOQrYdkhkb1gWngYMDKGaNem3rbNfahwP1sX8G8NvVROanqBQooaSCorlGJ7nNfgWZ6
	wOG+9zvMchKABfuwSZkW4jE1vZWJYRbY+7oxzvHuod2OsL5cI5r/TYYyEh0TTyow3arevncyXZaC0
	/i5ZMzgWcBiPHGKrsyrM839N734HXGOuxsHNsTQpuQVoPE5rZOf2a4uVEu8ug2UNgQYJ+ZoIMIcxU
	PK7bjBvIr6jlvQ6DMeAj4lWnZGiCCIFkt0eD1EB5vjzy/RO0u0xuPXaLDBIkJC3SlIhaNYuh8PpzZ
	fYLHuBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kd8-0000000FGVy-2Ran;
	Thu, 10 Sep 2026 19:40:18 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kd6-0000000FGVZ-0s0C
	for ath12k@lists.infradead.org;
	Thu, 10 Sep 2026 19:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789069216; x=1820605216;
  h=date:from:to:cc:subject:message-id;
  bh=plztFAp4huZeMwx/DKDV40GQCEVCJpWSQTairvc2MHc=;
  b=Jfx2+R6fXUofbmCfBitGvydjf2scpN3XyMK451sQWZqpP4hga16Tr7Pf
   haUiRWRrCWhb/QloqZUIgMxO2Bkoxfh7bP2vwvDUXWcO5d1BBQ52a58iF
   Tf+EYLibwzEZzzqXaZtp8aGJf6hNXEPgQTcBZ6nb76zRkBMg7em91cgmI
   F+gw6CB/NPKtAYZVPso4m6Cn5AHdW0GnUrt/tpYzZIEL4yDVRsdtKBcUN
   UENY4/MlpC/5Q0Eec73XkbOU3fwu/frrADgs1t50SpPlITCuA/7QkyTrq
   +biD4LL9oXpuSSlQDLjiHu6HBFA9CH4eRT4cwgx2KKdnFE9ehElC7UsYq
   w==;
X-CSE-ConnectionGUID: b6INexj1QE+62yrMPZdncg==
X-CSE-MsgGUID: LTP+wPbHQbu63f+dv0GJgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89402274"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89402274"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 12:40:15 -0700
X-CSE-ConnectionGUID: CAlUJ/7HTvysfXszK03TVw==
X-CSE-MsgGUID: gQXdBTTeQa2JM1AYA23W+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="60167"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa011.fm.intel.com with ESMTP; 10 Sep 2026 12:40:14 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4kd1-000000000U7-45Ac;
	Thu, 10 Sep 2026 19:40:11 +0000
Date: Fri, 11 Sep 2026 03:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 03dee8921448c661b06116d14967a57fbecaee6d
Message-ID: <202609110303.dItvpSw5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_124016_300678_5BC54B91 
X-CRM114-Status: UNSURE (   3.75  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: 03dee8921448c661b06116d14967a57fbecaee6d  Add localversion-wireless-testing-ath

elapsed time: 1224m

configs tested: 67
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-16.1.0
alpha              allyesconfig    gcc-16.1.0
arc                allmodconfig    clang-24
arc                allmodconfig    gcc-16.1.0
arc                 allnoconfig    gcc-16.1.0
arc                allyesconfig    clang-24
arm                 allnoconfig    gcc-16.1.0
arm                allyesconfig    clang-24
arm                allyesconfig    gcc-16.1.0
arm64              allmodconfig    clang-24
arm64               allnoconfig    gcc-16.1.0
csky               allmodconfig    gcc-16.1.0
csky                allnoconfig    gcc-16.1.0
hexagon            allmodconfig    clang-24
hexagon            allmodconfig    gcc-16.1.0
hexagon             allnoconfig    gcc-16.1.0
i386               allmodconfig    clang-22
i386                allnoconfig    gcc-16.1.0
i386               allyesconfig    clang-22
loongarch          allmodconfig    clang-24
loongarch           allnoconfig    gcc-16.1.0
m68k               allmodconfig    gcc-16.1.0
m68k                allnoconfig    gcc-16.1.0
m68k               allyesconfig    clang-24
m68k               allyesconfig    gcc-16.1.0
microblaze          allnoconfig    gcc-16.1.0
microblaze         allyesconfig    gcc-16.1.0
mips               allmodconfig    gcc-16.1.0
mips                allnoconfig    gcc-16.1.0
mips               allyesconfig    gcc-16.1.0
nios2              allmodconfig    clang-20
nios2               allnoconfig    clang-24
openrisc           allmodconfig    clang-20
openrisc            allnoconfig    clang-24
parisc             allmodconfig    gcc-16.1.0
parisc              allnoconfig    clang-24
parisc             allyesconfig    clang-17
powerpc            allmodconfig    gcc-16.1.0
powerpc             allnoconfig    clang-24
riscv              allmodconfig    clang-24
riscv               allnoconfig    clang-24
riscv              allyesconfig    clang-24
s390               allmodconfig    clang-17
s390                allnoconfig    clang-24
s390               allyesconfig    gcc-16.1.0
sh                 allmodconfig    gcc-16.1.0
sh                  allnoconfig    clang-24
sh                 allyesconfig    clang-17
sparc               allnoconfig    clang-24
sparc64            allmodconfig    clang-20
um                 allmodconfig    clang-17
um                  allnoconfig    clang-24
um                 allyesconfig    gcc-14
um                 allyesconfig    gcc-16.1.0
x86_64             allmodconfig    clang-22
x86_64              allnoconfig    clang-24
x86_64             allyesconfig    clang-22
x86_64                    kexec    clang-22
x86_64                 rhel-9.4    clang-22
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-22
x86_64      rhel-9.4-kselftests    clang-22
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-22
xtensa              allnoconfig    clang-24
xtensa             allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

