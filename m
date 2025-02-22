Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000C8C021B3
	for <ath12k@archiver.kernel.org>; Sat, 22 Feb 2025 00:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZgXSnK8irl63X3JWi7kwX+wH9HMBIBh1Ob2568cMI1M=; b=F9Bp78wengegcfreOE5C/1o3PB
	WOLjSMUIMfQQgaZ9B+akp2Jtfyb8Pon7fRX90Omfr2xxFI4+kwYNVyyVrRFBgf5Kq13QROUxT4693
	/Qmp2vZRaVk7EDv8UFFSx214o9cxYHPfJlPFBagcGR0+78Cr3EWDnof7Qvhwz66FlSvoYkI8DUZmh
	MAfsyUTNDqzlpjW+UsK0+iMhomgK1wcvZhAGPLLp1Fo5L0UADrz7H777bDM1TVmNz/IeCUxT9V1oy
	doRGpoXBduO3ieMuKGDvu5H2MO3pMaDw/LhYaNi/vQv4wI5Iyi4od45QYJaKescWpUdLYCZg9QTY/
	4mUlcpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tld53-00000007BkI-31Fe
	for ath12k@archiver.kernel.org;
	Sat, 22 Feb 2025 00:09:17 +0000
Received: from [198.175.65.19] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tld50-00000007Bj3-47p1
	for ath12k@lists.infradead.org;
	Sat, 22 Feb 2025 00:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740182955; x=1771718955;
  h=date:from:to:cc:subject:message-id;
  bh=G3uEXIrrpO9iz3tZwdd+TuDaOCchr5WEqX+mULaI+OQ=;
  b=ldcFuX0H36VDp6uaf5AkEQnwNLRBo23SUtTXiCMwpup31E0fmOLdfitn
   fWgCzObnv0hfZSooTFeiceBOHkBR7Gx5noScGET8Pkurs4nwIj+l3kGcp
   uJ2YB8Zp9TPphOGgX41r4Lu/lf2gn5VZfa2+XsHVFzl5pibEZglxncjZR
   aIHxwbTRtZcInmbQ4GcWH7G/lZxfgeXIjWokjNKSM/HxUGFWQM6l7FVI3
   u+w73UyNZ2ZDQ6+JmV2yYr2RVJ83gAyWo8TTUcAXubjvlOErkg//zoBuR
   c2qVH2DeN8oTQC5bZKH0wgaV4oCS6I3uTaQWE3y7Fwg3tyJ51tQorFj9I
   Q==;
X-CSE-ConnectionGUID: npIh+GZ6Tt+Rc268KE5kEQ==
X-CSE-MsgGUID: vNyVno1hThSyZs1divzThQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40862850"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="40862850"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 16:09:14 -0800
X-CSE-ConnectionGUID: B+IKvlU5Tc2wpjO3QYKmwQ==
X-CSE-MsgGUID: X39zrFIIQ3WJaZJK1NlX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152704658"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Feb 2025 16:09:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tld4w-0006At-1F;
	Sat, 22 Feb 2025 00:09:10 +0000
Date: Sat, 22 Feb 2025 08:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-split-phy] BUILD SUCCESS
 df5aa493b78cb2d19b5c8f0259c21d2193aa2147
Message-ID: <202502220855.Rs2IYKOF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_160915_100101_77D8CAC3 
X-CRM114-Status: UNSURE (   4.14  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
branch HEAD: df5aa493b78cb2d19b5c8f0259c21d2193aa2147  wifi: ath12k: Add support for 512 MB profile

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here
`-- um-allmodconfig
    `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here

elapsed time: 1448m

configs tested: 69
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250221    gcc-13.2.0
arc                  randconfig-002-20250221    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250221    gcc-14.2.0
arm                  randconfig-002-20250221    clang-19
arm                  randconfig-003-20250221    gcc-14.2.0
arm                  randconfig-004-20250221    clang-21
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250221    clang-15
arm64                randconfig-002-20250221    clang-21
arm64                randconfig-003-20250221    clang-21
arm64                randconfig-004-20250221    gcc-14.2.0
csky                 randconfig-001-20250221    gcc-14.2.0
csky                 randconfig-002-20250221    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250221    clang-21
hexagon              randconfig-002-20250221    clang-21
i386       buildonly-randconfig-001-20250221    gcc-12
i386       buildonly-randconfig-002-20250221    gcc-12
i386       buildonly-randconfig-003-20250221    gcc-12
i386       buildonly-randconfig-004-20250221    gcc-12
i386       buildonly-randconfig-005-20250221    clang-19
i386       buildonly-randconfig-006-20250221    clang-19
loongarch            randconfig-001-20250221    gcc-14.2.0
loongarch            randconfig-002-20250221    gcc-14.2.0
nios2                randconfig-001-20250221    gcc-14.2.0
nios2                randconfig-002-20250221    gcc-14.2.0
parisc               randconfig-001-20250221    gcc-14.2.0
parisc               randconfig-002-20250221    gcc-14.2.0
powerpc              randconfig-001-20250221    clang-21
powerpc              randconfig-002-20250221    clang-21
powerpc              randconfig-003-20250221    clang-17
powerpc64            randconfig-001-20250221    clang-21
powerpc64            randconfig-002-20250221    clang-21
powerpc64            randconfig-003-20250221    clang-19
riscv                randconfig-001-20250221    clang-21
riscv                randconfig-002-20250221    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250221    gcc-14.2.0
s390                 randconfig-002-20250221    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250221    gcc-14.2.0
sh                   randconfig-002-20250221    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250221    gcc-14.2.0
sparc                randconfig-002-20250221    gcc-14.2.0
sparc64              randconfig-001-20250221    gcc-14.2.0
sparc64              randconfig-002-20250221    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250221    gcc-12
um                   randconfig-002-20250221    gcc-12
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250221    gcc-12
x86_64     buildonly-randconfig-002-20250221    clang-19
x86_64     buildonly-randconfig-003-20250221    clang-19
x86_64     buildonly-randconfig-004-20250221    clang-19
x86_64     buildonly-randconfig-005-20250221    clang-19
x86_64     buildonly-randconfig-006-20250221    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250221    gcc-14.2.0
xtensa               randconfig-002-20250221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

