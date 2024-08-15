Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7F0C52D7C
	for <ath12k@archiver.kernel.org>; Thu, 15 Aug 2024 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1IEZOOFCTOWb8lhV8R45hSaiFVhVYnuqsdfBFehWRtY=; b=p0U06vGenEYdQZjXeiPuC+lM5W
	Yw5T3sIoF/DKe8N1JUQzMZVda4swEpm+M0FWqDuJdz2QnUvBexbB14k6YTX+wOY3jfRJZDN7A/WoN
	r62c5WUwE8OkySN9YI4sxgkEFcYkSeixMNrUcwt3Tdircm2YDyffLTUxhbBG9YyZBfSbhL9I1S7Us
	o7+41eeurimv+D6GFBo0HSTWTSX0u0e87a+c0KYcUx2f6WfcC1MBLZCna11ilJ+JFtMqykScvxmK7
	otv0406bNpo5HxX2gu/LzB/V6ufA31/b6zoQCYbqzEAyrYZv5eWC0cLdiTk7bsltlMr8zy/PlPxFS
	E9FYtt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebjl-0000000AGO1-0g1M
	for ath12k@archiver.kernel.org;
	Thu, 15 Aug 2024 14:46:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seamI-0000000A5LH-2O2U
	for ath12k@bombadil.infradead.org;
	Thu, 15 Aug 2024 13:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1IEZOOFCTOWb8lhV8R45hSaiFVhVYnuqsdfBFehWRtY=; b=lu3VthVusdiI4opOQwpJ0/xJl5
	mkXS62oy5HaeBE9f1XsXDeznSgCgHyxtM1swauvb4c8j1TkPCo6bp9D8RFY1oEFcrbEGVpziU40+6
	sj65Ytet/yV2eq7O5SvzhGgW7HJmkINoLSNVr7yyySGhukLe8v96lXD3qG/QRAqJtXllo3hrcpiNt
	tQCiNkJpB8HYqjvZDNWpQ3LQgOuBxp+HfcIOY1tyg9a+jrKkxPFkSO/wIh6fBXI1UGrEWcIKo6TK4
	Y0L3hTrKtO+wOKkUgS3a3jzkeaBnjgMoebrSdE1HyCytnkLsbfW+RZv/xHysOuAApFsqGg1i7NB7y
	A6VzXL5w==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seamE-00000008N5r-0wsz
	for ath12k@lists.infradead.org;
	Thu, 15 Aug 2024 13:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723729470; x=1755265470;
  h=date:from:to:cc:subject:message-id;
  bh=GdR2npVKdEFEQZ0HnJb0GhvGOImA5Y+KOgY3MEq6PQQ=;
  b=kkHT+VV4Lqqk0rOx5js3qgpG0NHv7fEQJ1VTS1CRz/lf+FsfOowGyfP9
   vfQ4vcHc99r02WduBppXf0uDGH5230v4jPvtXc8s6SAHoY83hTuKC0pzj
   d0QTE8LVyW+xRx867lXrh1Lzt1gI/+MqK6+vKtPrCjXzqEXWXS22vNXeU
   cwr1I4nOvyIcCD8CuTHw1r3N/djK5xSFcG5T4o7t7B5HaPWmAQLchaP0U
   S3SWKSWNenEKRqr67ngAqP4yWAsz3GC47Z8txUc53V5TSspd7nKxHrMfo
   ItM9yqGMKRhGl7Y9/8DgqT5o8dDNoSQFGpdiO6MJvxPjgswbil/SH9ynS
   A==;
X-CSE-ConnectionGUID: e//yx0wbTKeoIP9XosQoCA==
X-CSE-MsgGUID: YSUcs77NSReAlYeNRKwzmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21801170"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="21801170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 06:44:23 -0700
X-CSE-ConnectionGUID: 49ffFqtQRt2s9+xn3zc5rQ==
X-CSE-MsgGUID: Mq/gJ8MmQvmjH6w89QGJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="59203008"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Aug 2024 06:44:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seam3-0003dg-33;
	Thu, 15 Aug 2024 13:44:19 +0000
Date: Thu, 15 Aug 2024 21:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 cec90d44dd150b5271c5c4d5eb047815014c270d
Message-ID: <202408152136.uD3hkjXX-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_144431_017703_573FC271 
X-CRM114-Status: UNSURE (   3.67  )
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
branch HEAD: cec90d44dd150b5271c5c4d5eb047815014c270d  Add localversion-wireless-testing-ath

elapsed time: 1239m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240815   gcc-13.2.0
arc                   randconfig-002-20240815   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240815   gcc-14.1.0
arm                   randconfig-002-20240815   clang-16
arm                   randconfig-003-20240815   gcc-14.1.0
arm                   randconfig-004-20240815   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240815   clang-16
arm64                 randconfig-002-20240815   clang-17
arm64                 randconfig-003-20240815   clang-20
arm64                 randconfig-004-20240815   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240815   gcc-14.1.0
csky                  randconfig-002-20240815   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240815   clang-20
hexagon               randconfig-002-20240815   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240815   gcc-12
i386         buildonly-randconfig-002-20240815   clang-18
i386         buildonly-randconfig-003-20240815   clang-18
i386         buildonly-randconfig-004-20240815   clang-18
i386         buildonly-randconfig-005-20240815   clang-18
i386         buildonly-randconfig-006-20240815   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240815   gcc-12
i386                  randconfig-002-20240815   clang-18
i386                  randconfig-003-20240815   clang-18
i386                  randconfig-004-20240815   gcc-12
i386                  randconfig-005-20240815   gcc-12
i386                  randconfig-006-20240815   gcc-12
i386                  randconfig-011-20240815   clang-18
i386                  randconfig-012-20240815   clang-18
i386                  randconfig-013-20240815   gcc-12
i386                  randconfig-014-20240815   clang-18
i386                  randconfig-015-20240815   clang-18
i386                  randconfig-016-20240815   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240815   gcc-14.1.0
loongarch             randconfig-002-20240815   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240815   gcc-14.1.0
nios2                 randconfig-002-20240815   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240815   gcc-14.1.0
parisc                randconfig-002-20240815   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-001-20240815   gcc-14.1.0
powerpc               randconfig-002-20240815   gcc-14.1.0
powerpc               randconfig-003-20240815   gcc-14.1.0
powerpc64             randconfig-001-20240815   clang-20
powerpc64             randconfig-002-20240815   gcc-14.1.0
powerpc64             randconfig-003-20240815   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240815   gcc-14.1.0
riscv                 randconfig-002-20240815   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240815   clang-17
s390                  randconfig-002-20240815   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240815   gcc-14.1.0
sh                    randconfig-002-20240815   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240815   gcc-14.1.0
sparc64               randconfig-002-20240815   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240815   clang-16
um                    randconfig-002-20240815   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240815   gcc-12
x86_64       buildonly-randconfig-002-20240815   gcc-11
x86_64       buildonly-randconfig-003-20240815   clang-18
x86_64       buildonly-randconfig-004-20240815   gcc-12
x86_64       buildonly-randconfig-005-20240815   gcc-12
x86_64       buildonly-randconfig-006-20240815   gcc-12
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240815   clang-18
x86_64                randconfig-002-20240815   gcc-12
x86_64                randconfig-003-20240815   clang-18
x86_64                randconfig-004-20240815   gcc-12
x86_64                randconfig-005-20240815   clang-18
x86_64                randconfig-006-20240815   gcc-12
x86_64                randconfig-011-20240815   clang-18
x86_64                randconfig-012-20240815   gcc-12
x86_64                randconfig-013-20240815   gcc-12
x86_64                randconfig-014-20240815   gcc-12
x86_64                randconfig-015-20240815   gcc-12
x86_64                randconfig-016-20240815   clang-18
x86_64                randconfig-071-20240815   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240815   gcc-14.1.0
xtensa                randconfig-002-20240815   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

