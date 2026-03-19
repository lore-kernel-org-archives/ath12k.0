Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD291088E46
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 04:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5/6t7Mct4LWEYdOb+cpZFt/Ta7eCbK+HpjRpbm1FEGs=; b=rOVwWK4B5nIEiq1jiqaPhWp7Xp
	iTUM5OVzRjvYcf33JykU9+0jLuh8PGizGGHJ9dc8vKx+21ViqoBN1lVcRyACoSp5ClttGfIt5SOXW
	OjxX8g2ltotX+n6yELs1jWaRNLMxHGZOghytEGSd8q6kFs+017gSuH91L+KE0lvwNQwFUYKhYnIAd
	HiF2dxz/OV4n8bHvmrVUC6N8/EBauHHdB65F9K5ZmheL8bsvkqyybcBLrGzRz5fw3PcUK7E7CQOqw
	fPxKWOGKFaHsaerzWTjZ+1N2QsUpiYl+UckirUVcmjgTXDzI8e4h6zdkVqRjjjD6t981XAXs1Vxx9
	psqPvy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w350r-00000009txC-1hf5;
	Thu, 19 Mar 2026 04:29:37 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w350o-00000009tws-3MFK
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 04:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773894574; x=1805430574;
  h=date:from:to:cc:subject:message-id;
  bh=CWkn217oviSrVphfiAem5ldfJWKZzg6CaYOvhr8LqQI=;
  b=SIRcx2yFdsRFAdM5VUH7HPG/hD1RMOlc2uDMbnL3BN9/IxG96/xpcrZ2
   2HUmlhi+LY87tBpg864pKmvQM7WKEJkQdyOZY9KhRhVjnDjNTd87iEE6Q
   cwR+e4S3tTQUzmKj6o7jlZx8qmyVJwF+maffp+Rk58djB/PqVqgxGbVMF
   sh+rVADG1EPwzQJdEst0zE5Yzn6u1PUslZCNNyw6fgVGcKHx2o7MoVl/E
   E32mufRHJ2wDViwPGruuvA82K7uLBlcJaEH1+q9qB38ygdXKd6N8Ro/cX
   UgaAXV8SVVb6lXk1t64tCsngQ+fE2u1dDv2TnsN4blaUnz3SgkgvBD4uY
   Q==;
X-CSE-ConnectionGUID: EsnkLdO0SQ6CVY7ibplOLA==
X-CSE-MsgGUID: X/mYC5aTQQ2Khj+shIYH2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75145372"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75145372"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 21:29:34 -0700
X-CSE-ConnectionGUID: pEIX6LeITrSIFgvymvAYhg==
X-CSE-MsgGUID: soPDsY7gQxmfDB+1xHwbJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227328508"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Mar 2026 21:29:32 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w350k-000000000JN-0qYs;
	Thu, 19 Mar 2026 04:29:30 +0000
Date: Thu, 19 Mar 2026 12:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 19f61c1738a3da09758e17e73618f5cfc103519b
Message-ID: <202603191251.N06QgJfV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_212934_930379_D80F50FD 
X-CRM114-Status: UNSURE (   4.13  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: 19f61c1738a3da09758e17e73618f5cfc103519b  Merge branch 'pending' into main-pending

elapsed time: 740m

configs tested: 61
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260319    gcc-11.5.0
parisc      randconfig-002-20260319    gcc-8.5.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260319    clang-23
powerpc     randconfig-002-20260319    clang-16
powerpc64   randconfig-001-20260319    clang-19
powerpc64   randconfig-002-20260319    clang-23
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

