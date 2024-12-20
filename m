Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5965BE77188
	for <ath12k@archiver.kernel.org>; Fri, 20 Dec 2024 19:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IVTPWYwvYx1lwSntpr9MDdiJD83iO2FsMhudjUMAWW8=; b=TOq1q2h+3meHCStup2iJhtu0Ww
	MZhshcwO4QaOiUJ3lLf7awi3JXQZhIKfthVblEqeH76IoLaH1R1f5OpRCTE1avhFShNP8epGicld0
	fTTyPjsbl6pym2Vnw26JsxFvgTayFv6/OQ7ZvnZ09RW/ADX8Z/OIgGKj8ujM6SzWRcb+GLT+Eqio8
	WA9T4UPLbZ7XSGLK8tTB2++4EiukY6E9D6FpZ2ceI4HVxPcDHmrLzWEdouu8vU/wRVxYfLnyaeLLZ
	qyRPedh+uYbcR51Mgg6Ztgu5riaIle249kgc0GQcVEKrJWD9efbGUtkNEmPo+qVi8npWTkT59odAU
	LEWSNvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiOz-00000005siH-02s7
	for ath12k@archiver.kernel.org;
	Fri, 20 Dec 2024 19:11:09 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiOw-00000005shf-3DWd
	for ath12k@lists.infradead.org;
	Fri, 20 Dec 2024 19:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734721867; x=1766257867;
  h=date:from:to:cc:subject:message-id;
  bh=PzgT1Z5AV8PYctS5bIlAZC7OQeABni52wGyCIcTMuvE=;
  b=XuZrizbvt+BE4iHKfsblT+iXnjw4/D5xrwWh/tmpcG2lWhbqNGlXYtVr
   2ax3LJYMeBd3GipRntSudtq8Xbbv6IXFcULL55AVefPEVTItp0ndGaHHE
   9GEo8zIQ4fzccfjJQFQtdTE7+Iud2WRElTUYO6l1GTWZ8A1wMuwr2mj7G
   3fgfiSPDPiUHCDlkk8rk6osFwgtHbU859FR7tVIvgDo+kcHhOV6zD0UDY
   Sk8m4SmMr8mHNWIjwjg2sVwr+W6+JfA33XTW9/NsEUhh55eOCxrz3ABEW
   I5x2uEglg79QCAsaiH9gQGeVbUw9wWPA0+oZ6xAS5mAjFeKCiaZLhbFt+
   A==;
X-CSE-ConnectionGUID: KRL/se4xTqGkvq5vxA8sfQ==
X-CSE-MsgGUID: y2P2H95NTSegOuNIHtHRsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35444441"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35444441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 11:11:06 -0800
X-CSE-ConnectionGUID: fbBu0ScoTAKunku4rc0nuQ==
X-CSE-MsgGUID: k6yQ7rrzQ2a088lng3m72A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103662998"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2024 11:11:05 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOiOs-0001bH-1W;
	Fri, 20 Dec 2024 19:11:02 +0000
Date: Sat, 21 Dec 2024 03:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 578f6fc55c2ced5f68a7f87edbf6db3663dc6b57
Message-ID: <202412210334.HjCwvtcS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_111106_814964_9CEF073E 
X-CRM114-Status: UNSURE (   3.17  )
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
branch HEAD: 578f6fc55c2ced5f68a7f87edbf6db3663dc6b57  wifi: ath12k: Fix spelling mistake "requestted" -> "requested"

elapsed time: 1447m

configs tested: 75
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20241220    gcc-13.2.0
arc                  randconfig-002-20241220    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20241220    clang-19
arm                  randconfig-002-20241220    gcc-14.2.0
arm                  randconfig-003-20241220    gcc-14.2.0
arm                  randconfig-004-20241220    clang-20
arm64                           allmodconfig    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20241220    clang-17
arm64                randconfig-002-20241220    clang-19
arm64                randconfig-003-20241220    clang-20
arm64                randconfig-004-20241220    clang-19
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20241220    gcc-14.2.0
csky                 randconfig-002-20241220    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20241220    clang-20
hexagon              randconfig-002-20241220    clang-20
i386       buildonly-randconfig-001-20241220    gcc-12
i386       buildonly-randconfig-002-20241220    gcc-12
i386       buildonly-randconfig-003-20241220    gcc-12
i386       buildonly-randconfig-004-20241220    clang-19
i386       buildonly-randconfig-005-20241220    gcc-12
i386       buildonly-randconfig-006-20241220    gcc-12
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20241220    gcc-14.2.0
loongarch            randconfig-002-20241220    gcc-14.2.0
nios2                randconfig-001-20241220    gcc-14.2.0
nios2                randconfig-002-20241220    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20241220    gcc-14.2.0
parisc               randconfig-002-20241220    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20241220    clang-15
powerpc              randconfig-002-20241220    gcc-14.2.0
powerpc              randconfig-003-20241220    gcc-14.2.0
powerpc64            randconfig-001-20241220    gcc-14.2.0
powerpc64            randconfig-002-20241220    clang-19
powerpc64            randconfig-003-20241220    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20241220    gcc-14.2.0
riscv                randconfig-002-20241220    clang-19
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241220    gcc-14.2.0
s390                 randconfig-002-20241220    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241220    gcc-14.2.0
sh                   randconfig-002-20241220    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241220    gcc-14.2.0
sparc                randconfig-002-20241220    gcc-14.2.0
sparc64              randconfig-001-20241220    gcc-14.2.0
sparc64              randconfig-002-20241220    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20241220    clang-20
um                   randconfig-002-20241220    clang-20
x86_64     buildonly-randconfig-001-20241220    gcc-12
x86_64     buildonly-randconfig-002-20241220    clang-19
x86_64     buildonly-randconfig-003-20241220    gcc-12
x86_64     buildonly-randconfig-004-20241220    gcc-12
x86_64     buildonly-randconfig-005-20241220    clang-19
x86_64     buildonly-randconfig-006-20241220    gcc-12
xtensa               randconfig-001-20241220    gcc-14.2.0
xtensa               randconfig-002-20241220    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

