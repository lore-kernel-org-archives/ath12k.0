Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E79C624DB
	for <ath12k@archiver.kernel.org>; Sat,  5 Sep 2026 19:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7xz6nBUG/FKmMIDzCarYFnAZKq7DCWngkuyaKVf1L0s=; b=PLsyXgS+kwe4wspVaQdSwUH79X
	UBm33LbXKKRB3jbRJt5xu3iW9X7JlZSXLmnRrK9qbMWsCZCjECtw+r0MbILWIbcnsYFsq+Z9tD56s
	5A94uSFLhiUPW1kTs1ffd+AFNr4SBgVi8PZ1Q+awV10AtdMKekno4kvyBMolVtVJ4GJWP0TLKVffb
	CkYVjfLcZq2CpQoCfIwGGtHf9heb2MEjjGWcmBX23shpVBFGBflxL+xrFbGuDS7zKd8rHyGKMUP7x
	cilmqy5qvKyTXART6Wd9sswtoj0E7KiLXsazQQ0BtNEdRb6/sjWkscHnGv/s4ukQEn7HDLrtqTEms
	31ccB8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2wWb-00000004Nty-2Zdp;
	Sat, 05 Sep 2026 19:58:05 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2wWZ-00000004Ntf-11K7
	for ath12k@lists.infradead.org;
	Sat, 05 Sep 2026 19:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788638284; x=1820174284;
  h=date:from:to:cc:subject:message-id;
  bh=+3HNuizgl26q7T+8HD52Tzf8r2VDs1IRg/PDpEJ1bUI=;
  b=PhbY1NQbItveJqKV+s85+WDVa3NcE5/FBUbvhFShLxh+JoQYZRX96AdZ
   NAazRt6XZfNBSQ8BTHFnQum11C+7SSEFU9cfCFhHY37Tkr11Kxu7VYwM/
   dHRcK8a2laf068wnUv0Tj5wLCG2Lvo+ns7uHmjCjOBbeh0o0lL2fvNE6u
   JiG0y9/v/MnHgjgeMpZRrC+nUWAJ3e5pPODqBjKufRomiGI0gb3JCssIX
   TdtG73jDvIPhc/dNo+WCzH7k0S1vW1WBVA1IhRCXoDFTNwQDVMxPR32gC
   nO8ypupHjSuYhAUxh3RD59wOR4KFv9gVQMSSFDdjlPY9GlqCkb7/AVhgR
   Q==;
X-CSE-ConnectionGUID: fFLAM++pQSyxQWo5EKYLCA==
X-CSE-MsgGUID: 8zIxc+DtReGrDzrci+Ujjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="100263406"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="100263406"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 12:58:01 -0700
X-CSE-ConnectionGUID: Y0DZf67OQTWM8hZUg+yOWg==
X-CSE-MsgGUID: TO4GQ/EuTOmA+lAQAZgk8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="272288956"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Sep 2026 12:57:59 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2wWT-0000000012r-273A;
	Sat, 05 Sep 2026 19:57:57 +0000
Date: Sun, 06 Sep 2026 03:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 1d8e73163ef933624341075f576e2f36ef9133f7
Message-ID: <202609060348.okA5BqeA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_125803_352985_5E2F49E6 
X-CRM114-Status: UNSURE (   3.33  )
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
branch HEAD: 1d8e73163ef933624341075f576e2f36ef9133f7  wifi: ath11k: unregister PM notifier on QMI init failure path

elapsed time: 2910m

configs tested: 58
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

