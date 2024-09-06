Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EE6E6FE41
	for <ath12k@archiver.kernel.org>; Fri,  6 Sep 2024 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j1SkrlhpNpOswlLjeD9k1z4zdS0IROmRReS6sg9n3k0=; b=t6snYXv73mPBrki7Pq96CNQQDO
	CH3CGh78fzVRxGRqza4maUmbZO7zeM+GWJY5RO0fnMggN15YdC7n1vCLy2qh93/IoHY2//lUnvoQJ
	6x2Qap5JRWS4OUzTljwZp3cfCbJ79O4YrSL3i2hpifopuo+qw5t1bZwb++J8GgpNH2VThKdLnsTVa
	VZMFIsIaiTK7NrPNXP7+mZiiONZkfEM4gd4wFdRY3Ga5EpBE4lbUX93k0QL8ER7U+eWSDOqWrguJ/
	IW3nBbJLilNmdkt1HNIOZeZedK3TY7CNkwB0dJbwgYT6HRqni7YRFuJjiQ0fuerXC7zlXbTojo4PF
	DdPHHOcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smdch-0000000DGjL-2PMD
	for ath12k@archiver.kernel.org;
	Fri, 06 Sep 2024 18:23:55 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smdcf-0000000DGin-140d
	for ath12k@lists.infradead.org;
	Fri, 06 Sep 2024 18:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725647033; x=1757183033;
  h=date:from:to:cc:subject:message-id;
  bh=xvWFvRFnYk+xgcuToiTiJy725PpSVajJQKP9zNmCROY=;
  b=MVRJYaWpnf+fBpxgEjaFWE7fCUJY3sSEFA8PdYCd86m6lSTzjsIuE02P
   6T2JBcaQlOGVNc1aT3rn7LUkDcw1R3MssVZ+9NShZq/CiJGboNCKUvy56
   Asp8AL/dN7476xW8q4Ep92wf9dmIrARjTGJxaq9d09Y9POXBAzfwsAuFX
   Y5xssgAdKepcBAyEChk21vsmiPCURjuwbVjM3ryS0vQFc3hFT9RcMk0uy
   uyi0E5RxF5HCR/3ayf8aHAsraPS+oq1iNJMbJmt1SahLvHBtsa2FFBxOV
   WyfdRFda7DUcOHvrfqbya/eWCAxIZLc9+RHfrkGnut6YfHXGEcGwiNd1b
   A==;
X-CSE-ConnectionGUID: Mfc04UpFS+6nkKYa+Qhfbw==
X-CSE-MsgGUID: NZ/XLAEDSZuky1kfRMPiqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24569121"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="24569121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 11:23:50 -0700
X-CSE-ConnectionGUID: RtfsGvjUSl+YCH98CXlcXQ==
X-CSE-MsgGUID: PF2a26XFTLaaC7IgdHBS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="96811943"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Sep 2024 11:23:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smdcY-000BaF-1M;
	Fri, 06 Sep 2024 18:23:46 +0000
Date: Sat, 07 Sep 2024 02:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 02f454f9aa6255d99611d6a4e37edd08812878df
Message-ID: <202409070201.BGRHDJkV-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_112353_398620_1A6ABC05 
X-CRM114-Status: UNSURE (   3.79  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: 02f454f9aa6255d99611d6a4e37edd08812878df  wifi: ath12k: Avoid -Wflex-array-member-not-at-end warnings

elapsed time: 1479m

configs tested: 162
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                   randconfig-001-20240906   clang-20
arc                   randconfig-002-20240906   clang-20
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                         bcm2835_defconfig   clang-20
arm                      footbridge_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240906   clang-20
arm                   randconfig-002-20240906   clang-20
arm                   randconfig-003-20240906   clang-20
arm                   randconfig-004-20240906   clang-20
arm                         s5pv210_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240906   clang-20
arm64                 randconfig-002-20240906   clang-20
arm64                 randconfig-003-20240906   clang-20
arm64                 randconfig-004-20240906   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240906   clang-20
csky                  randconfig-002-20240906   clang-20
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240906   clang-20
hexagon               randconfig-002-20240906   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240906   gcc-12
i386         buildonly-randconfig-002-20240906   gcc-12
i386         buildonly-randconfig-003-20240906   gcc-12
i386         buildonly-randconfig-004-20240906   gcc-12
i386         buildonly-randconfig-005-20240906   gcc-12
i386         buildonly-randconfig-006-20240906   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240906   gcc-12
i386                  randconfig-002-20240906   gcc-12
i386                  randconfig-003-20240906   gcc-12
i386                  randconfig-004-20240906   gcc-12
i386                  randconfig-005-20240906   gcc-12
i386                  randconfig-006-20240906   gcc-12
i386                  randconfig-011-20240906   gcc-12
i386                  randconfig-012-20240906   gcc-12
i386                  randconfig-013-20240906   gcc-12
i386                  randconfig-014-20240906   gcc-12
i386                  randconfig-015-20240906   gcc-12
i386                  randconfig-016-20240906   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240906   clang-20
loongarch             randconfig-002-20240906   clang-20
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                     loongson1c_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240906   clang-20
nios2                 randconfig-002-20240906   clang-20
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                randconfig-001-20240906   clang-20
parisc                randconfig-002-20240906   clang-20
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      arches_defconfig   clang-20
powerpc                   bluestone_defconfig   clang-20
powerpc                 linkstation_defconfig   clang-20
powerpc                 mpc8315_rdb_defconfig   clang-20
powerpc                      ppc44x_defconfig   clang-20
powerpc               randconfig-001-20240906   clang-20
powerpc               randconfig-002-20240906   clang-20
powerpc               randconfig-003-20240906   clang-20
powerpc                      tqm8xx_defconfig   clang-20
powerpc64             randconfig-001-20240906   clang-20
powerpc64             randconfig-002-20240906   clang-20
powerpc64             randconfig-003-20240906   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                 randconfig-001-20240906   clang-20
riscv                 randconfig-002-20240906   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240906   clang-20
s390                  randconfig-002-20240906   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                          landisk_defconfig   clang-20
sh                    randconfig-001-20240906   clang-20
sh                    randconfig-002-20240906   clang-20
sh                          sdk7780_defconfig   clang-20
sh                             sh03_defconfig   clang-20
sh                     sh7710voipgw_defconfig   clang-20
sh                            titan_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240906   clang-20
sparc64               randconfig-002-20240906   clang-20
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240906   clang-20
um                    randconfig-002-20240906   clang-20
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240906   clang-18
x86_64       buildonly-randconfig-002-20240906   clang-18
x86_64       buildonly-randconfig-003-20240906   clang-18
x86_64       buildonly-randconfig-004-20240906   clang-18
x86_64       buildonly-randconfig-005-20240906   clang-18
x86_64       buildonly-randconfig-006-20240906   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240906   clang-18
x86_64                randconfig-002-20240906   clang-18
x86_64                randconfig-003-20240906   clang-18
x86_64                randconfig-004-20240906   clang-18
x86_64                randconfig-005-20240906   clang-18
x86_64                randconfig-006-20240906   clang-18
x86_64                randconfig-011-20240906   clang-18
x86_64                randconfig-012-20240906   clang-18
x86_64                randconfig-013-20240906   clang-18
x86_64                randconfig-014-20240906   clang-18
x86_64                randconfig-015-20240906   clang-18
x86_64                randconfig-016-20240906   clang-18
x86_64                randconfig-071-20240906   clang-18
x86_64                randconfig-072-20240906   clang-18
x86_64                randconfig-073-20240906   clang-18
x86_64                randconfig-074-20240906   clang-18
x86_64                randconfig-075-20240906   clang-18
x86_64                randconfig-076-20240906   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240906   clang-20
xtensa                randconfig-002-20240906   clang-20

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

