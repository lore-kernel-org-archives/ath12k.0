Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7DFC982D0
	for <ath12k@archiver.kernel.org>; Fri, 18 Sep 2026 02:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FrL//pbJq+aEBUy+PK81Wx1UL/Zja5kGZ0zw/F7G1Ec=; b=eNmSW4WpRgSaaqNjAawu0h+pWE
	7NnptoWq7iXWz+RM6vF37NqQPPZwqPCucpSH83GG283VsXZdcUg3vKS5jth5w3WSuMiJjXqrYoeGO
	C6ee7NBvgALLzNn5rMAVlhGgpgXey6Ee/DXhQsGsTv0Q6W1MdCEsU4f/qa4qq3Szob5pjUKHQQKj5
	eHzkpDnYxpPOxyX71fdPjb+Np9w5VMWzkH3WpmaOeCn/gH7BpBtzbS8oftwhUoxDL4PbpEkVtz5Sg
	Q/g1sxgvJBQV6+v4gw6kbHiasrGh0iy3RToIKxUAwG20mywQmClfSI5GMI53wtzmHJSoV6szIxsvS
	Ix7tH8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Nwf-0000000DFTV-1Q9b;
	Fri, 18 Sep 2026 02:03:21 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Nwd-0000000DFT0-0AYY
	for ath12k@lists.infradead.org;
	Fri, 18 Sep 2026 02:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789696999; x=1821232999;
  h=date:from:to:cc:subject:message-id;
  bh=GyBP9Eapk0kW53/1KYowo5vyGVO+ucGJYqw9oqHd8pg=;
  b=KphTDst9EhFs3MoeMoUZY8s12MP8rOxrNrRaadZTdj5Uk3Fjus5i5cxx
   IR5WTuSuusbEV46ntewFNBPvWC0pQXDsbJAjDW6Yobk5ZVwWwKMPn3gsx
   fSgyHR3DcJ09dhuMEKs2erAh/THmP96XjbBmF8Z4DeHYQLM5S5Ib7tMHJ
   PCcYUq+ac+mlP8r4/7pJ7jngvmO4G7LozA+3LvKhN3SAek7baapSvozO9
   0doWTQLssasHLy4ci7zCOfW77XcTMv6ekpLTi2PUpcGMDtJ4iIOLJCSpq
   Sm22PGdB3EuhLzd9vf6Sm46PMzPVIBSQ2zu3VhJ9hF58D24ZWyO7gKiPF
   A==;
X-CSE-ConnectionGUID: D0O904IQR1mpnrzaEGnn0A==
X-CSE-MsgGUID: o9d5Qcm1S+yjdUg1Zon9QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107678804"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107678804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 19:03:18 -0700
X-CSE-ConnectionGUID: 0qYi79dbTRWSBRwykhj8tA==
X-CSE-MsgGUID: yTxk0QGeTxWbekgcMrVtRg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2026 19:03:16 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7NwY-0000000094V-2a41;
	Fri, 18 Sep 2026 02:03:14 +0000
Date: Fri, 18 Sep 2026 10:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 7d248cdd4caf67762256c249a3839b2f81ff334b
Message-ID: <202609181021.DxCsy2pc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_190319_127065_9CC039BA 
X-CRM114-Status: UNSURE (   3.57  )
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
branch HEAD: 7d248cdd4caf67762256c249a3839b2f81ff334b  wifi: ath11k: reset ar->num_stations on hardware start

elapsed time: m

configs tested: 307
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.1.0
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1304-20260917    clang-21   sparse
alpha                randconfig-r1306-20260917    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260917    gcc-15.2.0
arc                   randconfig-1000-20260918    gcc-16.1.0
arc                   randconfig-1001-20260917    gcc-15.2.0
arc                   randconfig-1001-20260918    gcc-16.1.0
arc                  randconfig-r1300-20260918    gcc-14     sparse
arc                  randconfig-r1302-20260917    gcc-8.5.0  sparse
arc                  randconfig-r1303-20260917    gcc-8.5.0  sparse
arc                  randconfig-r1305-20260917    gcc-8.5.0  sparse
arc                            tb10x_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                        imx_v6_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260917    gcc-15.2.0
arm                   randconfig-1000-20260918    gcc-16.1.0
arm                   randconfig-1001-20260917    gcc-15.2.0
arm                   randconfig-1001-20260918    gcc-16.1.0
arm                   randconfig-1002-20260917    gcc-15.2.0
arm                   randconfig-1002-20260918    gcc-16.1.0
arm                   randconfig-1003-20260917    gcc-15.2.0
arm                   randconfig-1003-20260918    gcc-16.1.0
arm                  randconfig-r1308-20260917    gcc-13.4.0 sparse
arm64                             alldefconfig    gcc-16.1.0
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260917    gcc-11.5.0
arm64                 randconfig-1000-20260918    gcc-16.1.0
arm64                 randconfig-1001-20260917    gcc-11.5.0
arm64                 randconfig-1001-20260918    gcc-16.1.0
arm64                 randconfig-1002-20260917    gcc-11.5.0
arm64                 randconfig-1002-20260918    gcc-16.1.0
arm64                 randconfig-1003-20260917    gcc-11.5.0
arm64                 randconfig-1003-20260918    gcc-16.1.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260917    gcc-11.5.0
csky                  randconfig-1000-20260918    gcc-16.1.0
csky                  randconfig-1001-20260917    gcc-11.5.0
csky                  randconfig-1001-20260918    gcc-16.1.0
csky                 randconfig-r1308-20260917    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260917    clang-24
hexagon               randconfig-1000-20260918    gcc-16.1.0
hexagon               randconfig-1001-20260917    clang-24
hexagon               randconfig-1001-20260918    gcc-16.1.0
hexagon              randconfig-r1300-20260917    clang-21   sparse
hexagon              randconfig-r1301-20260917    gcc-8.5.0  sparse
hexagon              randconfig-r1304-20260917    gcc-8.5.0  sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260917    gcc-13
i386        buildonly-randconfig-1000-20260918    gcc-14
i386        buildonly-randconfig-1001-20260917    gcc-13
i386        buildonly-randconfig-1001-20260918    gcc-14
i386        buildonly-randconfig-1002-20260917    gcc-13
i386        buildonly-randconfig-1002-20260918    gcc-14
i386        buildonly-randconfig-1003-20260917    gcc-13
i386        buildonly-randconfig-1003-20260918    gcc-14
i386        buildonly-randconfig-1004-20260917    gcc-13
i386        buildonly-randconfig-1004-20260918    gcc-14
i386        buildonly-randconfig-1005-20260917    gcc-13
i386        buildonly-randconfig-1005-20260918    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260917    clang-22
i386                  randconfig-1000-20260918    gcc-12
i386                  randconfig-1001-20260917    clang-22
i386                  randconfig-1001-20260918    gcc-12
i386                  randconfig-1002-20260917    clang-22
i386                  randconfig-1002-20260918    gcc-12
i386                  randconfig-1003-20260917    clang-22
i386                  randconfig-1003-20260918    gcc-12
i386                  randconfig-1004-20260917    clang-22
i386                  randconfig-1004-20260918    gcc-12
i386                  randconfig-1005-20260917    clang-22
i386                  randconfig-1005-20260918    gcc-12
i386                  randconfig-1006-20260917    clang-22
i386                  randconfig-1006-20260918    gcc-12
i386                  randconfig-1007-20260917    clang-22
i386                  randconfig-1007-20260918    clang-22
i386                  randconfig-1008-20260917    clang-22
i386                  randconfig-1008-20260918    clang-22
i386                  randconfig-1009-20260917    clang-22
i386                  randconfig-1009-20260918    clang-22
i386                  randconfig-1010-20260917    clang-22
i386                  randconfig-1010-20260918    clang-22
i386                  randconfig-1011-20260917    clang-22
i386                  randconfig-1011-20260918    clang-22
i386                  randconfig-1012-20260917    clang-22
i386                  randconfig-1012-20260918    clang-22
i386                  randconfig-1013-20260917    clang-22
i386                  randconfig-1013-20260918    clang-22
i386                  randconfig-1300-20260917    gcc-14     sparse
i386                  randconfig-1300-20260918    clang-22   sparse
i386                  randconfig-1301-20260917    gcc-14     sparse
i386                  randconfig-1301-20260918    clang-22   sparse
i386                  randconfig-1302-20260917    gcc-14     sparse
i386                  randconfig-1302-20260918    clang-22   sparse
i386                 randconfig-r1301-20260918    gcc-14     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260917    clang-24
loongarch             randconfig-1000-20260918    gcc-16.1.0
loongarch             randconfig-1001-20260917    clang-24
loongarch             randconfig-1001-20260918    gcc-16.1.0
loongarch            randconfig-r1302-20260918    gcc-14     sparse
loongarch            randconfig-r1307-20260917    clang-24   sparse
loongarch            randconfig-r1309-20260917    gcc-13.4.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    gcc-16.1.0
m68k                          apollo_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.1.0
m68k                         mvme147_defconfig    gcc-16.1.0
m68k                           sun3x_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                   cavium_octeon_defconfig    gcc-16.1.0
mips                          cobalt_defconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                       malta_kvm_defconfig    gcc-16.1.0
mips                 randconfig-r1309-20260917    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260917    clang-24
nios2                 randconfig-1000-20260918    gcc-16.1.0
nios2                 randconfig-1001-20260917    clang-24
nios2                 randconfig-1001-20260918    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r1300-20260917    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260917    gcc-11.5.0
parisc                randconfig-1000-20260918    gcc-8.5.0
parisc                randconfig-1001-20260917    gcc-11.5.0
parisc                randconfig-1001-20260918    gcc-8.5.0
parisc               randconfig-r1302-20260917    clang-21   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       ep88xc_defconfig    gcc-16.1.0
powerpc                      kmeter1_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260917    gcc-11.5.0
powerpc               randconfig-1000-20260918    gcc-8.5.0
powerpc               randconfig-1001-20260917    gcc-11.5.0
powerpc               randconfig-1001-20260918    gcc-8.5.0
powerpc                   storcenter_defconfig    gcc-16.1.0
powerpc                         warp_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260917    gcc-11.5.0
powerpc64             randconfig-1000-20260918    gcc-8.5.0
powerpc64             randconfig-1001-20260917    gcc-11.5.0
powerpc64             randconfig-1001-20260918    gcc-8.5.0
powerpc64            randconfig-r1304-20260918    gcc-14     sparse
powerpc64            randconfig-r1305-20260917    clang-21   sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260917    clang-17
riscv                 randconfig-1000-20260918    clang-24
riscv                 randconfig-1001-20260917    clang-17
riscv                 randconfig-1001-20260918    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260917    clang-17
s390                  randconfig-1000-20260918    clang-24
s390                  randconfig-1001-20260917    clang-17
s390                  randconfig-1001-20260918    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                          ecovec24_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260917    clang-17
sh                    randconfig-1000-20260918    clang-24
sh                    randconfig-1001-20260917    clang-17
sh                    randconfig-1001-20260918    clang-24
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260917    clang-17
sparc                 randconfig-1000-20260918    gcc-14
sparc                 randconfig-1001-20260917    clang-17
sparc                 randconfig-1001-20260918    gcc-14
sparc                randconfig-r1306-20260917    gcc-13.4.0 sparse
sparc                randconfig-r1307-20260917    gcc-13.4.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260917    clang-17
sparc64               randconfig-1000-20260918    gcc-14
sparc64               randconfig-1001-20260917    clang-17
sparc64               randconfig-1001-20260918    gcc-14
sparc64              randconfig-r1301-20260917    clang-21   sparse
sparc64              randconfig-r1303-20260917    clang-21   sparse
sparc64              randconfig-r1305-20260918    gcc-14     sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260917    clang-17
um                    randconfig-1000-20260918    gcc-14
um                    randconfig-1001-20260917    clang-17
um                    randconfig-1001-20260918    gcc-14
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260917    gcc-14
x86_64      buildonly-randconfig-1000-20260918    clang-22
x86_64      buildonly-randconfig-1001-20260917    gcc-14
x86_64      buildonly-randconfig-1001-20260918    clang-22
x86_64      buildonly-randconfig-1002-20260917    gcc-14
x86_64      buildonly-randconfig-1002-20260918    clang-22
x86_64      buildonly-randconfig-1003-20260917    gcc-14
x86_64      buildonly-randconfig-1003-20260918    clang-22
x86_64      buildonly-randconfig-1004-20260917    gcc-14
x86_64      buildonly-randconfig-1004-20260918    clang-22
x86_64      buildonly-randconfig-1005-20260917    gcc-14
x86_64      buildonly-randconfig-1005-20260918    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260917    clang-22
x86_64                randconfig-1000-20260918    clang-22
x86_64                randconfig-1001-20260917    clang-22
x86_64                randconfig-1001-20260918    clang-22
x86_64                randconfig-1002-20260917    clang-22
x86_64                randconfig-1002-20260918    clang-22
x86_64                randconfig-1003-20260917    clang-22
x86_64                randconfig-1003-20260918    clang-22
x86_64                randconfig-1004-20260917    clang-22
x86_64                randconfig-1004-20260918    clang-22
x86_64                randconfig-1005-20260917    clang-22
x86_64                randconfig-1005-20260918    clang-22
x86_64                randconfig-1006-20260917    clang-22
x86_64                randconfig-1006-20260918    gcc-14
x86_64                randconfig-1007-20260917    clang-22
x86_64                randconfig-1007-20260918    gcc-14
x86_64                randconfig-1008-20260917    clang-22
x86_64                randconfig-1008-20260918    gcc-14
x86_64                randconfig-1009-20260917    clang-22
x86_64                randconfig-1009-20260918    gcc-14
x86_64                randconfig-1010-20260917    clang-22
x86_64                randconfig-1010-20260918    gcc-14
x86_64                randconfig-1011-20260917    clang-22
x86_64                randconfig-1011-20260918    gcc-14
x86_64                randconfig-1012-20260917    clang-22
x86_64                randconfig-1012-20260918    clang-22
x86_64                randconfig-1013-20260917    clang-22
x86_64                randconfig-1013-20260918    clang-22
x86_64                randconfig-1014-20260917    clang-22
x86_64                randconfig-1014-20260918    clang-22
x86_64                randconfig-1015-20260917    clang-22
x86_64                randconfig-1015-20260918    clang-22
x86_64                randconfig-1016-20260917    clang-22
x86_64                randconfig-1016-20260918    clang-22
x86_64                randconfig-1017-20260917    clang-22
x86_64                randconfig-1017-20260918    clang-22
x86_64                randconfig-1300-20260917    gcc-14     sparse
x86_64                randconfig-1300-20260918    clang-22   sparse
x86_64                randconfig-1301-20260917    gcc-14     sparse
x86_64                randconfig-1301-20260918    clang-22   sparse
x86_64                randconfig-1302-20260917    gcc-14     sparse
x86_64                randconfig-1302-20260918    clang-22   sparse
x86_64               randconfig-r1303-20260918    gcc-14     sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.1.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   cadence_csp_defconfig    gcc-16.1.0
xtensa                           iss_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20260917    clang-17
xtensa                randconfig-1000-20260918    gcc-14
xtensa                randconfig-1001-20260917    clang-17
xtensa                randconfig-1001-20260918    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

