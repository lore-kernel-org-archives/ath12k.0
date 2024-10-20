Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57372D3C931
	for <ath12k@archiver.kernel.org>; Sun, 20 Oct 2024 03:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DCP2hIg2b1ufv6qq/WjyZGG4N25Wt6j0sFj8+YFvnVQ=; b=qrF9tWblxHyitafjAGiuXz24OZ
	0rkVXu4tlxqvCRfSMvC0I5Tvzp85LAayxvSBOYm7Ey0uqEZ5eLkXIEVvkv4d9A5YMewzLeXlqBGET
	XHpH4+lS9XMDNM+eKD5jIPdtr6rDN4aJAf/DyAoKyeWCOmkf1GbuZicaWQNtJB7GOan5qxOl5DWsu
	u9HHflnvLFX39z5M8G79qoS/VOuusA2UEICyncV32C6EfmjzwaiVPZmq9JZX2iV5htl/68GZenUBi
	pmNogkhx6cnZt5VJqS1SjqAAeuk2KErlXXCyf1lHZNssLjgBElboLHBYDxv6IJ9xMTImareSMXdUc
	VZDbDlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2MB0-00000004IgA-20Jy
	for ath12k@archiver.kernel.org;
	Sun, 20 Oct 2024 03:00:18 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2MAx-00000004Ifl-2GEk
	for ath12k@lists.infradead.org;
	Sun, 20 Oct 2024 03:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729393216; x=1760929216;
  h=date:from:to:cc:subject:message-id;
  bh=SGNMcNCZd/Oue6v/sa1gnK77rg2AqnjGXClCDP7NgBE=;
  b=GhMD5/fB2DBqZOc5sfapXpPLFlUcbvxIrW5enYb0koskOYD8D0Xw7v/p
   bg/7VduhKp9uZ8uCVl5SYH3m1N31PmglPisuD7kErt+tysyOvB0tT0a2T
   +26spanMqcOTPYSQPpVUYSWwpV5vE7lJrPXEdfBGBjG8+XrPaWD1mGzbQ
   dEpHrsGWZ7KicoWevymZByp27Id00KT9n/XTuGPWiiYIFEZg4bJStj98L
   gJ50avyfluw8nly7Z5qVa3EbqfLZKgwZfcKtvJ+iP07ZbS1UvvzLVdFiH
   rGtCFsIqrozOQYV6GuGeoW27KP9EgiZ7dMDPAzZ4o4JAXJMAOXPVjSuIN
   g==;
X-CSE-ConnectionGUID: f4Dq3+ObTlCd2U/TUTWctA==
X-CSE-MsgGUID: HEjiHpjVSRSr2CVUsZvE1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="32809712"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="32809712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 20:00:13 -0700
X-CSE-ConnectionGUID: n/fI6Yo/QLWU/Q15qHI7Jg==
X-CSE-MsgGUID: 1423+YtIRyWAWiHr9C/0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="84266147"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Oct 2024 20:00:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2MAr-000Po9-2H;
	Sun, 20 Oct 2024 03:00:09 +0000
Date: Sun, 20 Oct 2024 10:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 b22c14547951792c3a849c1e2a95965d657eed48
Message-ID: <202410201048.rBgSWlro-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_200015_648208_328B0A04 
X-CRM114-Status: UNSURE (   3.71  )
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
branch HEAD: b22c14547951792c3a849c1e2a95965d657eed48  Merge branch 'pending' into main-pending

elapsed time: 1998m

configs tested: 102
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                               allnoconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    clang-20
arm                          ep93xx_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                             rpc_defconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241020    gcc-12
i386        buildonly-randconfig-002-20241020    gcc-12
i386        buildonly-randconfig-003-20241020    gcc-12
i386        buildonly-randconfig-004-20241020    gcc-12
i386        buildonly-randconfig-005-20241020    gcc-12
i386        buildonly-randconfig-006-20241020    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241020    gcc-12
i386                  randconfig-002-20241020    gcc-12
i386                  randconfig-003-20241020    gcc-12
i386                  randconfig-004-20241020    gcc-12
i386                  randconfig-005-20241020    gcc-12
i386                  randconfig-006-20241020    gcc-12
i386                  randconfig-011-20241020    gcc-12
i386                  randconfig-012-20241020    gcc-12
i386                  randconfig-013-20241020    gcc-12
i386                  randconfig-014-20241020    gcc-12
i386                  randconfig-015-20241020    gcc-12
i386                  randconfig-016-20241020    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         bigsur_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-20
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
powerpc                     tqm8540_defconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    clang-20
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    clang-20
sh                                  defconfig    gcc-12
sh                           se7780_defconfig    clang-20
sh                        sh7763rdp_defconfig    clang-20
sh                              ul2_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

