Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315E5D78768
	for <ath12k@archiver.kernel.org>; Fri, 22 Nov 2024 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cv33H2eUWQW54fdkjbm8XlshEyJKdYHqsANm85RT5V0=; b=adxt4JLw9FrPwsEDZFQxHIyJ8m
	nsG3ez20RQu15G9XFLAD9FOfs/SRr6kC/qefbSVrQaBys7POps1FO0PXlg+B5S0Q/9TZ1xBaJ/BEE
	xi5pTUMe/pywYfYtFWn5COMzZmipi4HtwfKeSDt0eZCRF9SZBPfPnY19HyZPA/JsIbLM368LIkDXa
	uqcyBp4mSquQEJxlDwrDQZGW28SNihaNXiTI8UzRhieAAVDGcBZxybQ+qepIcmIqtFqfEhM6NvH+Z
	jAtOE/KqMlE1HsZHqWI5b7RjRCAvQXcwB5UGDBpOwpSfOZzFI1MdkkwGxpiZe8Qpr9qUwPSme40s9
	W10LZTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQm0-00000002EbZ-43N8
	for ath12k@archiver.kernel.org;
	Fri, 22 Nov 2024 10:20:24 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQaI-00000002Cde-32sZ
	for ath12k@lists.infradead.org;
	Fri, 22 Nov 2024 10:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732270099; x=1763806099;
  h=date:from:to:cc:subject:message-id;
  bh=A+Msmx3wz6n9eHgX4WeChi9w7+uJPdv98M/+gyuqSxw=;
  b=lKUaViA0zTlmbSjobCykbKuRvtQR4ECGafuGebEcNnHeS7wVI0jTPg9z
   H3z8hw5byBFfSd0Jc9yTRrzX1ZolLQhisvwCEudzcclqwpLZjUKuJsBQK
   WmcL0mUYPQW39S+6giN2IixoZ5BnEgLawyZx1Yk69kOm6IfJ+qGCGV1A1
   kn+HelL1rdiXG9oI1VebJ7atNoN3ZVfKSdaaMg4HDVccPuapApKW3joQI
   /OIswT238MEkfV9ML9scm5vQD4wZPGGH5VYLP1dvNEQv/F08q4d9I1jzR
   UoXhxnJshA8+LNE5ytSnQDvMrBoEsj4Oz/diKMCUkOdr3/y+/cX8eq623
   A==;
X-CSE-ConnectionGUID: d91L1yoxQe6Mq+jL75TUXg==
X-CSE-MsgGUID: RLvSR/okQRqg3UOQw5No2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49840330"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="49840330"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:08:13 -0800
X-CSE-ConnectionGUID: DSvPA5ghQDanRjTfpM0cow==
X-CSE-MsgGUID: O2UTj6R6RSSITp+KEsdbHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="95489056"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Nov 2024 02:08:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEQa9-0003p9-1A;
	Fri, 22 Nov 2024 10:08:09 +0000
Date: Fri, 22 Nov 2024 18:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 66005568b5bec2a84c0812c7f7290e3feabbe494
Message-ID: <202411221835.fbdG95tk-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_020818_810286_A0AB2E98 
X-CRM114-Status: UNSURE (   3.72  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
branch HEAD: 66005568b5bec2a84c0812c7f7290e3feabbe494  wifi: ath12k: ath12k_mac_op_sta_rc_update(): use mac80211 provided link id

elapsed time: 963m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241122    gcc-13.2.0
arc                   randconfig-002-20241122    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241122    clang-17
arm                   randconfig-002-20241122    gcc-14.2.0
arm                   randconfig-003-20241122    clang-20
arm                   randconfig-004-20241122    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241122    gcc-14.2.0
arm64                 randconfig-002-20241122    gcc-14.2.0
arm64                 randconfig-003-20241122    gcc-14.2.0
arm64                 randconfig-004-20241122    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241122    gcc-14.2.0
csky                  randconfig-002-20241122    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241122    clang-20
hexagon               randconfig-002-20241122    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241122    gcc-14.2.0
loongarch             randconfig-002-20241122    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241122    gcc-14.2.0
nios2                 randconfig-002-20241122    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241122    gcc-14.2.0
parisc                randconfig-002-20241122    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241122    gcc-14.2.0
powerpc               randconfig-002-20241122    clang-20
powerpc               randconfig-003-20241122    clang-20
powerpc64             randconfig-001-20241122    gcc-14.2.0
powerpc64             randconfig-002-20241122    gcc-14.2.0
powerpc64             randconfig-003-20241122    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20241122    gcc-14.2.0
riscv                 randconfig-002-20241122    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241122    clang-20
s390                  randconfig-002-20241122    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20241122    gcc-14.2.0
sh                    randconfig-002-20241122    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241122    gcc-14.2.0
sparc64               randconfig-002-20241122    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241122    clang-17
um                    randconfig-002-20241122    gcc-11
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241122    gcc-12
x86_64      buildonly-randconfig-002-20241122    clang-19
x86_64      buildonly-randconfig-003-20241122    gcc-12
x86_64      buildonly-randconfig-004-20241122    gcc-12
x86_64      buildonly-randconfig-005-20241122    clang-19
x86_64      buildonly-randconfig-006-20241122    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241122    gcc-12
x86_64                randconfig-002-20241122    clang-19
x86_64                randconfig-003-20241122    gcc-12
x86_64                randconfig-004-20241122    clang-19
x86_64                randconfig-005-20241122    gcc-12
x86_64                randconfig-006-20241122    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241122    gcc-14.2.0
xtensa                randconfig-002-20241122    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

