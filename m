Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD7AC624D3
	for <ath12k@archiver.kernel.org>; Wed,  2 Sep 2026 17:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pmCNBWg4Y1zhVz1LVwxNhjVsfMVHhL6RhJzndL382TY=; b=Pc3X8O55Prl/UPxTH1S20nyyaV
	TAlQR4PUKJaelLxzAYlMKC96LSoWQdE3LBUoPkBqv5D5kFIf1C3COsyYeWCos8yYGVPlb2DNADNy5
	z2GXWaI8DMgERFtF3kUr4gjs6ORM8+YUjlGqym75gS/PXDmWP7YEFQFu0DeYe2k1taMgnQOF69ALY
	E+UErDospQxJwQGrizB8/6tD+16TDhZE/l4u9sgx/94LjtJuiXRZ8YGY/JTBW7NEcGwi5811JDpMw
	7cYZsvzRkq83+wQ6ZyoAtYgkPjGi5qw2Q5LVbXpPEzEqrrN+GcNPfYQiVf1AumOw9lS8XfMM3gXBS
	YSIAuWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1opJ-0000000FRke-2S9I;
	Wed, 02 Sep 2026 17:32:45 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1opH-0000000FRk9-0JWf
	for ath12k@lists.infradead.org;
	Wed, 02 Sep 2026 17:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788370364; x=1819906364;
  h=date:from:to:cc:subject:message-id;
  bh=Lj/lEkywM8n1djN6alodZOXJdJ6RtUKg4ceQoaFquNg=;
  b=fFP0OTTedp62Je1cCjpmcbZNtY6dmLjEZrHxuTn7ELVlj5FvUQsIQzx3
   fYR/lqSA9P4dOCnQaBS2ByQ6/RoU00KLNsM4nmEBiFgyeyEy828c4nvxg
   CX/RAzJgkC31qWQPjZboy+Ujb29DJWcRRYsWQXRmE6qfaR1dpFs19s2rZ
   m3eKTjjdMWKPoVwNdT8CiHOVu9YkjoYXHHzHoWCafWnHERe0DVVOSBIHl
   QSJ88MXaPy0BA8y6bMqUSlr90m3jjMsLUSWFG5ePw1wifENuqDnR7F2bC
   THwCf2xYPhoeDtik0E7RTaBN/sfdPxIm26ESYWB+BjZP4tL7ohbg8Og6z
   Q==;
X-CSE-ConnectionGUID: UXfzzGEKSoGkGgFeXCOqUQ==
X-CSE-MsgGUID: hc1zaYXjRo2IE6qAt6Xh2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88889310"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88889310"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:32:43 -0700
X-CSE-ConnectionGUID: ZQ6PRIacQl2cEziaYnt8fA==
X-CSE-MsgGUID: c/nKhnK1TAmftf4bJIqO4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="267702794"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Sep 2026 10:32:41 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1opD-0000000034Y-0vkB;
	Wed, 02 Sep 2026 17:32:39 +0000
Date: Thu, 03 Sep 2026 01:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 4baaaf913fc99b492e62443cb69aba06becea29b
Message-ID: <202609030128.3flu7XsQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_103243_148717_9C7B7F35 
X-CRM114-Status: UNSURE (   4.43  )
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
branch HEAD: 4baaaf913fc99b492e62443cb69aba06becea29b  wifi: ath11k: unregister PM notifier on QMI init failure path

elapsed time: 1534m

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
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

