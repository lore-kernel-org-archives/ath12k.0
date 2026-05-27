Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CB6CD4F54
	for <ath12k@archiver.kernel.org>; Wed, 27 May 2026 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=opJCUfRELb9qJDwolzaKrze0nCSk0VToVKfu8VwqN6k=; b=EE0qFy81oWuL9uUk8mfMEeUWV4
	+4v6KZ23mbKOgdQT2gMJyAf8Zk9YXnKWmTe+tT8eKRE9SXBCEFuH0NlZHcI6x9dykycZk6SxHFdDq
	dE4LpUQM8vUf+Pk0e4GYWMCzk/+ssc8pmDVDSEx1642Tx74csrB4aSQrA0qFg82FK49BtBz1SFZ0i
	KHMrXJIcB7i57fJ+pvR4ZFWw0cM3qUGllbl65SZie1vBOA72eVCESpc/03DLbZoVI+z4eqhz1W5Jw
	Kpqfzm5neRUTg3L20sZBuETq91y/rXp5yEMdwl3h8C6BMADvBvmrtsKbYQ128nZFKdfqntZ5/ikUu
	82YRRSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAcB-00000003eBz-0I0S;
	Wed, 27 May 2026 09:31:51 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAc8-00000003eB6-1pOL
	for ath12k@lists.infradead.org;
	Wed, 27 May 2026 09:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779874308; x=1811410308;
  h=date:from:to:cc:subject:message-id;
  bh=wVmJc9xIAWYB8UZc3ppupP4uMFwW56ohJdwVIQE7KSo=;
  b=KYOYG2nqJsxUW1JBnfW8oAdsQzkqP900dnMDHqhATeyFqArFRpDNcDVr
   bRUKng5yo+kx7PGDsOL/G85TDGNYYcyWuQuThsph4t8H5B/FASvA/dudt
   Hg58IAwHEY8mSBStXMqpH0FryAJ120iW5r4n8OK/3DNmIxDnGHUZuX04i
   9T+Ne8ko2tpADMZsQRNqqK1qM/GiN4lAcu7uQOr2UqbVwdHZ6Nyy0nwM6
   omVIFx9QFzlJplF2BGVPfn2O00B7YRAzE+c9dfUc70p3IjzRlgDFSItWX
   142FKS238b/CoZymS1O6gLuM2wT57VoPsm9LTHtVHqWABz0HpR/yXXIQQ
   g==;
X-CSE-ConnectionGUID: 7wqHVnHbSQuPnmFl0aHkGA==
X-CSE-MsgGUID: aEW7lX1tStKFFL6Nacz5bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80886993"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80886993"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:31:47 -0700
X-CSE-ConnectionGUID: aSeYElDgTeaJ3xpxHxFDHw==
X-CSE-MsgGUID: PpEis3ooTsyAK+7WJV0g8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="239178715"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 May 2026 02:31:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSAc4-000000003ky-04O9;
	Wed, 27 May 2026 09:31:44 +0000
Date: Wed, 27 May 2026 17:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 d5c336161088c588f85da64f48ba6deead194afd
Message-ID: <202605271736.gn1BPGc1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_023148_555118_AC4D827B 
X-CRM114-Status: UNSURE (   3.85  )
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
branch HEAD: d5c336161088c588f85da64f48ba6deead194afd  wifi: ath12k: fix error unwind on arch_init() failure in PCI probe

elapsed time: 1045m

configs tested: 55
configs skipped: 0

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

