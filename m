Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71880CA9EDD
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 15:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gQGUchm0BvIVFjX+MKvkqucmjRlD6H4rexy5kmur0ss=; b=jQYbZeoNedFuBJjcmUNPpEG0au
	rEjX1cQeBpjbydRjHK8xYq42ILLS5Z7uRz+PB66dy/eeARH+lV/oorDC5/e+58iA8f0rl//fKzOjI
	BJrOhqVtNaaLNZB7tGK7HctOiQT5Y/dMiJh2FKIoXWuZKvT+hGSfWAJRj435Hzfgcy5mJlb+KGuz2
	Z6X5kRF7a1WmAydKG0ALNLmHWIjzXYrH4yG2QYOklMqlKj9yuZrRgrZluOkGGKfCd28kwHyezUOkj
	DUyUKZakA0nS3dFBWNooU4vXcnOZDZWeqGOu8BVhHpseWwocJBZJX8REJER/nyK+kAA1+iPIO242t
	Q447NJ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIFz-0000000Arhz-3Ky3;
	Mon, 12 Oct 2026 15:48:07 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIFt-0000000ArXc-1aXs
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 15:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820082; x=1823356082;
  h=date:from:to:cc:subject:message-id;
  bh=Y4RlZ9+YrD5Zc10Eq6n9WPeYfrv6MR53RdATSu+xE20=;
  b=MKrUpfllQknEt3x8xSrutZT7TKPzAgjLw+CLGoRURCwb4Z56ePooPksj
   YRVPg8Y5oT9KB+2J4yTKdemAZorzCL4iPGZMCLPYxmLX/LZKtyoT2FixE
   N+5Z8IwlqXrnGJyZk9R3R7SKa0czBWr6rTh4llqU99+5DqBpoeQTdzuEL
   xltDfdFRre5YkalFLIBtWc99i3I65cl0MZcfKugBLSmE5jJCVUAajlWWN
   //A1CG5ymNnNL4kmytNw4O4bt/eRVIXJkli9XfrrT87mIQh3HJNZdn9i9
   SpJUBzd29dstFpG0tdNdN98J2R+cbNmvY3+G7eHDPLOKgzPdFsGwc0gNd
   A==;
X-CSE-ConnectionGUID: vvIwp50BQmK4H/wegfFHUg==
X-CSE-MsgGUID: vei7uCGETbiqFthqhCh48Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="537100"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="537100"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:47:58 -0700
X-CSE-ConnectionGUID: CCj9ThFQRY+TKoccgPTDSw==
X-CSE-MsgGUID: 9CvBrxxRTnmwbPB5rzQf1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="889298"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2026 08:47:56 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGIFm-00000000Bin-01lr;
	Mon, 12 Oct 2026 15:47:54 +0000
Date: Mon, 12 Oct 2026 23:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 7606c56f538d47f5166a4eea2e6db1a5590c9799
Message-ID: <202610122322.t57sLQK3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_084801_544854_F5AC985D 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: 7606c56f538d47f5166a4eea2e6db1a5590c9799  wifi: ath12k: assign device id from the WSI index

elapsed time: 1156m

configs tested: 472
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261011    gcc-12.5.0 cocci
alpha                randconfig-r2201-20261011    gcc-8.5.0  smatch
alpha                randconfig-r2309-20261011    clang-24   sparse
alpha                randconfig-r2310-20261010    gcc-9.5.0  sparse
alpha                randconfig-r2311-20261010    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261012    gcc-8.5.0
arc                   randconfig-1001-20261012    gcc-8.5.0
arc                   randconfig-2000-20261010    gcc-12.5.0
arc                   randconfig-2000-20261010    gcc-8.5.0
arc                   randconfig-2000-20261011    gcc-8.5.0
arc                   randconfig-2001-20261010    gcc-8.5.0
arc                   randconfig-2001-20261011    gcc-8.5.0
arc                  randconfig-r2103-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2104-20261011    gcc-12.5.0 cocci
arc                  randconfig-r2107-20261011    gcc-12.5.0 cocci
arc                  randconfig-r2108-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2109-20261011    gcc-16.1.0 cocci
arc                  randconfig-r2306-20261010    gcc-13.4.0 sparse
arc                  randconfig-r2310-20261011    clang-19   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261012    gcc-8.5.0
arm                   randconfig-1001-20261012    gcc-8.5.0
arm                   randconfig-1002-20261012    gcc-8.5.0
arm                   randconfig-1003-20261012    gcc-8.5.0
arm                   randconfig-2000-20261010    gcc-14.3.0
arm                   randconfig-2000-20261010    gcc-8.5.0
arm                   randconfig-2000-20261011    gcc-8.5.0
arm                   randconfig-2001-20261010    gcc-16.1.0
arm                   randconfig-2001-20261010    gcc-8.5.0
arm                   randconfig-2001-20261011    gcc-8.5.0
arm                  randconfig-r2106-20261011    gcc-16.1.0 cocci
arm                  randconfig-r2107-20261011    gcc-9.5.0  cocci
arm                  randconfig-r2109-20261011    clang-24   cocci
arm                  randconfig-r2300-20261011    gcc-8.5.0  sparse
arm                  randconfig-r2301-20261011    gcc-16.1.0 sparse
arm                  randconfig-r2303-20261011    gcc-8.5.0  sparse
arm                  randconfig-r2305-20261010    gcc-15.2.0 sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261012    clang-24
arm64                 randconfig-1001-20261012    clang-24
arm64                 randconfig-1002-20261012    clang-24
arm64                 randconfig-1003-20261012    clang-24
arm64                 randconfig-2000-20261011    gcc-16.1.0
arm64                 randconfig-2001-20261011    gcc-16.1.0
arm64                randconfig-r2101-20261010    clang-19   cocci
arm64                randconfig-r2101-20261011    gcc-16.1.0 cocci
arm64                randconfig-r2108-20261011    clang-24   cocci
arm64                randconfig-r2108-20261011    gcc-12.5.0 cocci
arm64                randconfig-r2109-20261010    gcc-8.5.0  cocci
arm64                randconfig-r2300-20261011    gcc-8.5.0  sparse
arm64                randconfig-r2301-20261010    gcc-15.2.0 sparse
arm64                randconfig-r2308-20261010    gcc-13.4.0 sparse
arm64                randconfig-r2308-20261011    clang-19   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261012    clang-24
csky                  randconfig-1001-20261012    clang-24
csky                  randconfig-2000-20261011    gcc-16.1.0
csky                  randconfig-2001-20261011    gcc-16.1.0
csky                 randconfig-r2101-20261011    gcc-12.5.0 cocci
csky                 randconfig-r2110-20261011    gcc-16.1.0 cocci
csky                 randconfig-r2110-20261011    gcc-9.5.0  cocci
csky                 randconfig-r2201-20261011    gcc-11.5.0 smatch
csky                 randconfig-r2202-20261011    gcc-9.5.0  smatch
csky                 randconfig-r2304-20261010    gcc-15.2.0 sparse
csky                 randconfig-r2308-20261010    gcc-11.5.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261012    clang-17
hexagon               randconfig-1001-20261012    clang-17
hexagon               randconfig-2000-20261011    gcc-16.1.0
hexagon               randconfig-2001-20261011    gcc-16.1.0
hexagon              randconfig-r2103-20261011    clang-24   cocci
hexagon              randconfig-r2107-20261011    clang-24   cocci
hexagon              randconfig-r2200-20261011    clang-17   smatch
hexagon              randconfig-r2302-20261011    clang-22   sparse
hexagon              randconfig-r2306-20261010    gcc-11.5.0 sparse
hexagon              randconfig-r2307-20261011    clang-19   sparse
hexagon              randconfig-r2308-20261011    clang-24   sparse
hexagon              randconfig-r2310-20261011    clang-22   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261012    clang-22
i386        buildonly-randconfig-1001-20261012    clang-22
i386        buildonly-randconfig-1002-20261012    clang-22
i386        buildonly-randconfig-1003-20261012    clang-22
i386        buildonly-randconfig-1004-20261012    clang-22
i386        buildonly-randconfig-1005-20261012    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261012    gcc-14
i386                  randconfig-1001-20261012    gcc-14
i386                  randconfig-1002-20261012    gcc-14
i386                  randconfig-1003-20261012    gcc-14
i386                  randconfig-1004-20261012    gcc-14
i386                  randconfig-1005-20261012    gcc-14
i386                  randconfig-1006-20261012    gcc-14
i386                  randconfig-1007-20261012    clang-22
i386                  randconfig-1008-20261012    clang-22
i386                  randconfig-1009-20261012    clang-22
i386                  randconfig-1010-20261012    clang-22
i386                  randconfig-1011-20261012    clang-22
i386                  randconfig-1012-20261012    clang-22
i386                  randconfig-1013-20261012    clang-22
i386                  randconfig-2000-20261010    gcc-14
i386                  randconfig-2000-20261010    gcc-8.5.0
i386                  randconfig-2000-20261011    gcc-8.5.0
i386                  randconfig-2001-20261010    clang-22
i386                  randconfig-2001-20261010    gcc-8.5.0
i386                  randconfig-2001-20261011    gcc-8.5.0
i386                  randconfig-2100-20261010    gcc-13     cocci
i386                  randconfig-2100-20261011    gcc-14     cocci
i386                  randconfig-2101-20261010    gcc-13     cocci
i386                  randconfig-2101-20261011    gcc-14     cocci
i386                  randconfig-2102-20261010    gcc-13     cocci
i386                  randconfig-2102-20261011    gcc-14     cocci
i386                  randconfig-2103-20261010    gcc-13     cocci
i386                  randconfig-2103-20261011    gcc-14     cocci
i386                  randconfig-2104-20261010    gcc-13     cocci
i386                  randconfig-2104-20261011    gcc-14     cocci
i386                  randconfig-2105-20261010    gcc-13     cocci
i386                  randconfig-2105-20261011    gcc-14     cocci
i386                  randconfig-2200-20261010    gcc-12     smatch
i386                  randconfig-2200-20261011    clang-22   smatch
i386                  randconfig-2300-20261010    gcc-14     sparse
i386                  randconfig-2301-20261010    gcc-14     sparse
i386                  randconfig-2302-20261010    clang-22   sparse
i386                 randconfig-r2101-20261011    clang-24   cocci
i386                 randconfig-r2104-20261011    clang-24   cocci
i386                 randconfig-r2108-20261011    gcc-14     cocci
i386                 randconfig-r2300-20261011    clang-22   sparse
i386                 randconfig-r2300-20261011    gcc-16.1.0 sparse
i386                 randconfig-r2301-20261011    gcc-8.5.0  sparse
i386                 randconfig-r2302-20261010    gcc-14     sparse
i386                 randconfig-r2303-20261011    gcc-16.1.0 sparse
i386                 randconfig-r2304-20261010    gcc-15.2.0 sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261012    clang-17
loongarch             randconfig-1001-20261012    clang-17
loongarch             randconfig-2000-20261010    gcc-16.1.0
loongarch             randconfig-2000-20261010    gcc-8.5.0
loongarch             randconfig-2000-20261011    gcc-8.5.0
loongarch             randconfig-2001-20261010    clang-24
loongarch             randconfig-2001-20261010    gcc-8.5.0
loongarch             randconfig-2001-20261011    gcc-8.5.0
loongarch            randconfig-r2102-20261011    gcc-14     cocci
loongarch            randconfig-r2102-20261011    gcc-16.1.0 cocci
loongarch            randconfig-r2104-20261011    gcc-16.1.0 cocci
loongarch            randconfig-r2301-20261011    gcc-8.5.0  sparse
loongarch            randconfig-r2305-20261011    clang-22   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    clang-24
m68k                        m5275evb_defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2101-20261011    gcc-14     cocci
m68k                 randconfig-r2104-20261011    gcc-9.5.0  cocci
m68k                 randconfig-r2202-20261011    gcc-16.1.0 smatch
m68k                 randconfig-r2300-20261010    gcc-8.5.0  sparse
m68k                 randconfig-r2302-20261011    clang-22   sparse
m68k                 randconfig-r2306-20261011    clang-22   sparse
m68k                 randconfig-r2311-20261011    clang-22   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2103-20261011    gcc-14     cocci
microblaze           randconfig-r2105-20261011    gcc-12.5.0 cocci
microblaze           randconfig-r2107-20261011    gcc-16.1.0 cocci
microblaze           randconfig-r2303-20261011    clang-22   sparse
microblaze           randconfig-r2305-20261011    clang-22   sparse
microblaze           randconfig-r2306-20261011    clang-24   sparse
microblaze           randconfig-r2307-20261011    clang-22   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                            ip30_defconfig    clang-24
mips                 randconfig-r2100-20261011    clang-24   cocci
mips                 randconfig-r2100-20261011    gcc-16.1.0 cocci
mips                 randconfig-r2106-20261011    clang-24   cocci
mips                 randconfig-r2107-20261010    clang-21   cocci
mips                 randconfig-r2202-20261011    gcc-15.2.0 smatch
mips                 randconfig-r2302-20261011    gcc-16.1.0 sparse
mips                 randconfig-r2302-20261011    gcc-8.5.0  sparse
mips                 randconfig-r2303-20261010    gcc-8.5.0  sparse
mips                 randconfig-r2303-20261011    clang-22   sparse
mips                 randconfig-r2305-20261011    gcc-8.5.0  sparse
mips                 randconfig-r2310-20261011    clang-24   sparse
mips                           rb532_defconfig    clang-24
nios2                          10m50_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261012    clang-17
nios2                 randconfig-1001-20261012    clang-17
nios2                 randconfig-2000-20261010    gcc-11.5.0
nios2                 randconfig-2000-20261010    gcc-8.5.0
nios2                 randconfig-2000-20261011    gcc-8.5.0
nios2                 randconfig-2001-20261010    gcc-8.5.0
nios2                 randconfig-2001-20261011    gcc-8.5.0
nios2                randconfig-r2102-20261011    gcc-16.1.0 cocci
nios2                randconfig-r2103-20261011    gcc-12.5.0 cocci
nios2                randconfig-r2108-20261011    gcc-16.1.0 cocci
nios2                randconfig-r2110-20261011    gcc-12.5.0 cocci
nios2                randconfig-r2200-20261011    gcc-8.5.0  smatch
nios2                randconfig-r2307-20261010    gcc-11.5.0 sparse
nios2                randconfig-r2308-20261011    clang-22   sparse
nios2                randconfig-r2311-20261011    clang-19   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261011    gcc-12.5.0 cocci
openrisc             randconfig-r2102-20261010    gcc-16.1.0 cocci
openrisc             randconfig-r2105-20261011    gcc-16.1.0 cocci
openrisc             randconfig-r2111-20261011    gcc-16.1.0 cocci
openrisc             randconfig-r2201-20261011    gcc-9.5.0  smatch
openrisc             randconfig-r2304-20261011    gcc-16.1.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261012    gcc-8.5.0
parisc                randconfig-1001-20261012    gcc-8.5.0
parisc                randconfig-2000-20261010    gcc-10.5.0
parisc                randconfig-2000-20261010    gcc-8.5.0
parisc                randconfig-2000-20261011    gcc-8.5.0
parisc                randconfig-2001-20261010    gcc-16.1.0
parisc                randconfig-2001-20261010    gcc-8.5.0
parisc                randconfig-2001-20261011    gcc-8.5.0
parisc               randconfig-r2101-20261010    gcc-8.5.0  cocci
parisc               randconfig-r2101-20261011    gcc-12.5.0 cocci
parisc               randconfig-r2102-20261011    gcc-12.5.0 cocci
parisc               randconfig-r2108-20261011    gcc-12.5.0 cocci
parisc               randconfig-r2111-20261011    gcc-16.1.0 cocci
parisc               randconfig-r2307-20261011    clang-24   sparse
parisc               randconfig-r2310-20261010    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.1.0
powerpc                    bluestone_defconfig    clang-24
powerpc                       ep88xc_defconfig    clang-24
powerpc                       ep88xc_defconfig    gcc-16.1.0
powerpc                    motionpro_defconfig    gcc-16.1.0
powerpc                  mpc837x_rdb_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261012    gcc-8.5.0
powerpc               randconfig-1001-20261012    gcc-8.5.0
powerpc               randconfig-2000-20261010    clang-17
powerpc               randconfig-2000-20261011    clang-22
powerpc               randconfig-2001-20261010    clang-24
powerpc               randconfig-2001-20261011    clang-22
powerpc              randconfig-r2100-20261010    gcc-8.5.0  cocci
powerpc              randconfig-r2100-20261011    gcc-12.5.0 cocci
powerpc              randconfig-r2100-20261011    gcc-16.1.0 cocci
powerpc              randconfig-r2109-20261011    gcc-14     cocci
powerpc              randconfig-r2200-20261011    clang-21   smatch
powerpc              randconfig-r2301-20261011    clang-22   sparse
powerpc              randconfig-r2302-20261011    gcc-8.5.0  sparse
powerpc              randconfig-r2304-20261011    clang-22   sparse
powerpc              randconfig-r2304-20261011    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261010    gcc-8.5.0  sparse
powerpc              randconfig-r2311-20261011    clang-24   sparse
powerpc                       tqm8xx_defconfig    clang-24
powerpc64             randconfig-1000-20261012    gcc-8.5.0
powerpc64             randconfig-1001-20261012    gcc-8.5.0
powerpc64             randconfig-2000-20261010    clang-24
powerpc64             randconfig-2000-20261011    clang-22
powerpc64             randconfig-2001-20261010    gcc-13.4.0
powerpc64             randconfig-2001-20261011    clang-22
powerpc64            randconfig-r2102-20261010    gcc-8.5.0  cocci
powerpc64            randconfig-r2104-20261011    gcc-16.1.0 cocci
powerpc64            randconfig-r2105-20261011    clang-24   cocci
powerpc64            randconfig-r2106-20261011    gcc-16.1.0 cocci
powerpc64            randconfig-r2202-20261011    gcc-10.5.0 smatch
powerpc64            randconfig-r2304-20261011    gcc-8.5.0  sparse
powerpc64            randconfig-r2311-20261010    gcc-11.5.0 sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261012    clang-24
riscv                 randconfig-1001-20261012    clang-24
riscv                 randconfig-2000-20261010    gcc-16.1.0
riscv                 randconfig-2000-20261011    gcc-13.4.0
riscv                 randconfig-2001-20261010    gcc-16.1.0
riscv                 randconfig-2001-20261011    gcc-13.4.0
riscv                randconfig-r2101-20261011    gcc-16.1.0 cocci
riscv                randconfig-r2110-20261011    clang-24   cocci
riscv                randconfig-r2301-20261010    gcc-15.2.0 sparse
riscv                randconfig-r2305-20261011    gcc-16.1.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261012    clang-24
s390                  randconfig-1001-20261012    clang-24
s390                  randconfig-2000-20261010    gcc-16.1.0
s390                  randconfig-2000-20261011    gcc-13.4.0
s390                  randconfig-2001-20261010    gcc-16.1.0
s390                  randconfig-2001-20261011    gcc-13.4.0
s390                 randconfig-r2104-20261010    clang-21   cocci
s390                 randconfig-r2105-20261011    gcc-9.5.0  cocci
s390                 randconfig-r2109-20261011    gcc-12.5.0 cocci
s390                 randconfig-r2111-20261011    gcc-12.5.0 cocci
s390                 randconfig-r2111-20261011    gcc-9.5.0  cocci
s390                 randconfig-r2201-20261011    gcc-15.2.0 smatch
s390                 randconfig-r2300-20261010    gcc-15.2.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261012    clang-24
sh                    randconfig-1001-20261012    clang-24
sh                    randconfig-2000-20261010    gcc-16.1.0
sh                    randconfig-2000-20261011    gcc-13.4.0
sh                    randconfig-2001-20261010    gcc-16.1.0
sh                    randconfig-2001-20261011    gcc-13.4.0
sh                   randconfig-r2103-20261011    gcc-16.1.0 cocci
sh                   randconfig-r2201-20261010    gcc-15.2.0 smatch
sh                           rsk7201_defconfig    gcc-16.1.0
sh                           rsk7203_defconfig    gcc-16.1.0
sh                           sdk7780_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261012    clang-20
sparc                 randconfig-1001-20261012    clang-20
sparc                 randconfig-2000-20261010    gcc-16.1.0
sparc                 randconfig-2000-20261010    gcc-8.5.0
sparc                 randconfig-2000-20261011    gcc-8.5.0
sparc                 randconfig-2001-20261010    gcc-16.1.0
sparc                 randconfig-2001-20261011    gcc-8.5.0
sparc                randconfig-r2100-20261011    gcc-14     cocci
sparc                randconfig-r2102-20261011    clang-24   cocci
sparc                randconfig-r2106-20261010    clang-21   cocci
sparc                randconfig-r2107-20261011    gcc-16.1.0 cocci
sparc                randconfig-r2108-20261011    gcc-16.1.0 cocci
sparc                randconfig-r2110-20261011    gcc-16.1.0 cocci
sparc                randconfig-r2111-20261011    clang-24   cocci
sparc                randconfig-r2300-20261011    gcc-8.5.0  sparse
sparc                randconfig-r2304-20261011    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261010    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261012    clang-20
sparc64               randconfig-1001-20261012    clang-20
sparc64               randconfig-2000-20261010    gcc-16.1.0
sparc64               randconfig-2000-20261010    gcc-8.5.0
sparc64               randconfig-2000-20261011    gcc-8.5.0
sparc64               randconfig-2001-20261010    clang-21
sparc64               randconfig-2001-20261010    gcc-16.1.0
sparc64               randconfig-2001-20261011    gcc-8.5.0
sparc64              randconfig-r2103-20261011    gcc-16.1.0 cocci
sparc64              randconfig-r2106-20261011    gcc-12.5.0 cocci
sparc64              randconfig-r2304-20261011    clang-22   sparse
sparc64              randconfig-r2305-20261010    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261012    clang-20
um                    randconfig-1001-20261012    clang-20
um                    randconfig-2000-20261010    clang-24
um                    randconfig-2000-20261010    gcc-16.1.0
um                    randconfig-2000-20261011    gcc-8.5.0
um                    randconfig-2001-20261010    clang-24
um                    randconfig-2001-20261010    gcc-16.1.0
um                    randconfig-2001-20261011    gcc-8.5.0
um                   randconfig-r2105-20261010    clang-21   cocci
um                   randconfig-r2105-20261011    gcc-16.1.0 cocci
um                   randconfig-r2106-20261011    gcc-9.5.0  cocci
um                   randconfig-r2109-20261011    gcc-12.5.0 cocci
um                   randconfig-r2109-20261011    gcc-16.1.0 cocci
um                   randconfig-r2302-20261010    gcc-15.2.0 sparse
um                   randconfig-r2302-20261011    gcc-8.5.0  sparse
um                   randconfig-r2305-20261011    gcc-8.5.0  sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261012    clang-22
x86_64      buildonly-randconfig-1001-20261012    clang-22
x86_64      buildonly-randconfig-1002-20261012    clang-22
x86_64      buildonly-randconfig-1003-20261012    clang-22
x86_64      buildonly-randconfig-1004-20261012    clang-22
x86_64      buildonly-randconfig-1005-20261012    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261012    clang-22
x86_64                randconfig-1001-20261012    clang-22
x86_64                randconfig-1002-20261012    clang-22
x86_64                randconfig-1003-20261012    clang-22
x86_64                randconfig-1004-20261012    clang-22
x86_64                randconfig-1005-20261012    clang-22
x86_64                randconfig-1006-20261012    clang-22
x86_64                randconfig-1007-20261012    clang-22
x86_64                randconfig-1008-20261012    clang-22
x86_64                randconfig-1009-20261012    clang-22
x86_64                randconfig-1010-20261012    clang-22
x86_64                randconfig-1011-20261012    clang-22
x86_64                randconfig-1012-20261012    gcc-14
x86_64                randconfig-1013-20261012    gcc-14
x86_64                randconfig-1014-20261012    gcc-14
x86_64                randconfig-1015-20261012    gcc-14
x86_64                randconfig-1016-20261012    gcc-14
x86_64                randconfig-1017-20261012    gcc-14
x86_64                randconfig-2000-20261010    clang-22
x86_64                randconfig-2000-20261011    clang-22
x86_64                randconfig-2001-20261010    gcc-14
x86_64                randconfig-2001-20261011    clang-22
x86_64                randconfig-2100-20261010    clang-22   cocci
x86_64                randconfig-2100-20261011    gcc-14     cocci
x86_64                randconfig-2101-20261010    clang-22   cocci
x86_64                randconfig-2101-20261011    gcc-14     cocci
x86_64                randconfig-2102-20261010    clang-22   cocci
x86_64                randconfig-2102-20261011    gcc-14     cocci
x86_64                randconfig-2103-20261010    clang-22   cocci
x86_64                randconfig-2103-20261011    gcc-14     cocci
x86_64                randconfig-2104-20261010    clang-22   cocci
x86_64                randconfig-2104-20261011    gcc-14     cocci
x86_64                randconfig-2105-20261010    clang-22   cocci
x86_64                randconfig-2105-20261011    gcc-14     cocci
x86_64                randconfig-2200-20261011    clang-22   smatch
x86_64                randconfig-2300-20261010    clang-22   sparse
x86_64                randconfig-2301-20261010    clang-22   sparse
x86_64                randconfig-2302-20261010    clang-22   sparse
x86_64               randconfig-r2103-20261010    clang-22   cocci
x86_64               randconfig-r2202-20261011    clang-22   smatch
x86_64               randconfig-r2300-20261011    clang-22   sparse
x86_64               randconfig-r2301-20261011    clang-22   sparse
x86_64               randconfig-r2303-20261010    gcc-15.2.0 sparse
x86_64               randconfig-r2305-20261011    gcc-8.5.0  sparse
x86_64               randconfig-r2309-20261011    clang-19   sparse
x86_64               randconfig-r2309-20261011    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261012    clang-20
xtensa                randconfig-1001-20261012    clang-20
xtensa                randconfig-2000-20261010    gcc-10.5.0
xtensa                randconfig-2000-20261010    gcc-16.1.0
xtensa                randconfig-2000-20261011    gcc-8.5.0
xtensa                randconfig-2001-20261010    gcc-16.1.0
xtensa                randconfig-2001-20261011    gcc-8.5.0
xtensa               randconfig-r2303-20261011    gcc-8.5.0  sparse
xtensa               randconfig-r2306-20261011    clang-19   sparse
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

