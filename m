Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE08C79F9F
	for <ath12k@archiver.kernel.org>; Thu, 10 Sep 2026 18:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A350+J8vHvQ8uXlR9U5Q4kqkRhLzQRTu299CKeMNh/o=; b=U7FmEPX0hz2RHIj9OoQbtyyQDq
	8YnKT8fsWBpWG3F/7c75P+6/WIUCl5v1BtiP8KPPmPgg0a1H6ciCuQdtsF9edfFeQjFDe+Q52INEC
	LpI9DfBIvGtynsMqvb8QUtT2ilahcJpTWa+xpnswMKCnh/ni1n2WVxoHHRe8DEe2kc+QiR7+iODmF
	A1X6DenY6QKnP0aI/yCbq6osaUqzQfcl0nU3opVGI+JYkma6MwY5tje17geEWq3c7eekQUxnmUhhN
	/+DUkGfY3940WRoqiXXrJRnSSYz1DG5iKxNJ6gZchSLflSHjQW7WRMVMoBulSIy+DrSPoSzIFKDWX
	fpg66+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jKU-0000000F8cH-06w7;
	Thu, 10 Sep 2026 18:16:58 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jKQ-0000000F8bj-43IF
	for ath12k@lists.infradead.org;
	Thu, 10 Sep 2026 18:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789064215; x=1820600215;
  h=date:from:to:cc:subject:message-id;
  bh=PjGLoiU2ZmqiWvY9yu9cu27xDn2+jgNprjj4SI/T5I0=;
  b=dWB2/DZkoacZf0i1RolyEcvx6ilqdl8dujnoQwa5be/gQMqA4jtVJF3y
   beGs5dkgcmWf5d7AwNOn4njIJ5ik09GkVvhr6ASZm7vO/pKdpcaXpHjWt
   ojTlaHnoVhne89+UgP13RDuumRw6njvq04LuETDyYSTqfPlgI8Ezjge8J
   i12ckaggd4FbFMAVBfWehdF56mPANorrtvYMpdcCSap1TTz2QOMmk4TDq
   os4XeYYUyqHXZ8namDMRy0pYOZtY4AZwS8ke6W2IPVFU5sdHeHHv41LVc
   8flTbY098L0/agiYeDshLxaXlMG6FufFq02UVz/It/QHCTX0EeaKjqx3v
   w==;
X-CSE-ConnectionGUID: 0oHaEum3SFOp+2nwV6wu7Q==
X-CSE-MsgGUID: 6S1TdE71QaaXZ5OLVByegQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93349382"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93349382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 11:16:53 -0700
X-CSE-ConnectionGUID: 3pTU/ODBRKyZXlGI3kKIKA==
X-CSE-MsgGUID: UinQOuSSTkmi3emi2kHzEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="276939233"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Sep 2026 11:16:52 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4jKM-000000000Op-0N6z;
	Thu, 10 Sep 2026 18:16:50 +0000
Date: Fri, 11 Sep 2026 02:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 2bbfa845cdfa0cc727c2f29f8d37d322117caf38
Message-ID: <202609110223.sW6FTU48-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_111655_018726_27631F02 
X-CRM114-Status: UNSURE (   4.07  )
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
branch HEAD: 2bbfa845cdfa0cc727c2f29f8d37d322117caf38  wifi: ath12k: add support to load shared firmware on multiPD

elapsed time: 1015m

configs tested: 65
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

