Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3792ACCD1BE
	for <ath12k@archiver.kernel.org>; Thu, 23 Oct 2025 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Vqe0O3kq7BorX4+RBf1ngN2eo0WzdMNPKVjJZNcSKk=; b=OBA8zm1lcb1zLgyuWA8x/iL0O6
	rkZWtUhnQJ0genhgaAf1QBpMqx3/XJZt0JBRpZ/M/33ORwdKIY9OFY4+HRnC4RTKCSnlBuIbOzqab
	dCX+4znJgaV0sfCc1Uv19fQEAXB5X9S3uIEZsJXGHJlEJJRntobitsSsyijOLFXkpQRAMbtJP5K60
	X8y8xGIVD7cfFgk7HeadhMp5zwRK41n4KSsoxNjo1M/w841feSYFl657WK9enbOfOnsPm/RJ+93qJ
	sn4kisupgxb8+rse/gy2MAxmD6QZXBEJV9osGHNesz30oX7ONz/JBRUqbgqRP9aSE722TR1zIQ3Ct
	hfhdhoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwA7-00000006Z2F-3guj;
	Thu, 23 Oct 2025 14:19:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwA6-00000006Z1e-32FQ
	for ath12k@bombadil.infradead.org;
	Thu, 23 Oct 2025 14:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=7Vqe0O3kq7BorX4+RBf1ngN2eo0WzdMNPKVjJZNcSKk=; b=GB9XdTO0ej8GbS31BJXGbAn+UV
	+CeVeo9Zj3LfwYLpLH31vx5KWwmmZseD0DcAiM4yhCDoIoJ/bnpdg4H9a7YdFAbdPPMdAVttNMq0y
	rVhWB2pPQEWdLWgHB+nxhQCRO6lCMCf4uhmgAZadFIIi2jHRlwJdhNpqhHBd9sUyJSeMJIU5Q80V7
	xHQWlhvqBzlOuO5Fetu+K4e0UIePXehSRxPvVj27WCbFj04g9RS6DuR6w+Tth7X0zst4kGRBzZNF5
	tGz3b4eNuRZciYARg6XYRc1jD5hWqohIlbyHWuSSf1P88lC2r7iXduFNjEF/YW/PFNxGsA3+3dNqh
	53Ngf0qA==;
Received: from mgamail.intel.com ([198.175.65.17])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvIM-00000001P9z-3dkI
	for ath12k@lists.infradead.org;
	Thu, 23 Oct 2025 13:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761229166; x=1792765166;
  h=date:from:to:cc:subject:message-id;
  bh=Vc3ODg9rBseJqi/9aEENfs/Mbz1O4x2u1vjw9Wsf4DU=;
  b=YGYpmTsVvW3ylnkZzjR7+BQTzofUcsgP2s9DzD9hF9TF2Bht2hSP9xfO
   syQUKvgkrKv25uI10YYHJxjfDlCKSZSa+aniBAmllCxrqDPejIW/eBDwL
   PoH2roCck7p76R/+PFk1TgmfnfkqqPveDeeXSKBw74sCf4j+2DzmgZHQo
   ifUqpGAN1g0EamSUNLe+2M6lfC2Ctbbs7DCGYcxdcXIuk1E9wz3Zoituu
   Mgk3fWh8/pvm0ZFPqm11vnZoOuTeWZDNZSjIMnsiCMfuoBfkHvdq91wLG
   VzUCUS6GtDLIWKdnvcpy4slfsn61vkQrW4CawVASamVfrKBA15Qr7jNho
   Q==;
X-CSE-ConnectionGUID: WF9omzRCS7uYl+/8ndmN1w==
X-CSE-MsgGUID: 8N/BSqDHTMi2f3YRns7sKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63321490"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63321490"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 07:19:21 -0700
X-CSE-ConnectionGUID: yFYh64/2Qse7UXL+n30f8g==
X-CSE-MsgGUID: HF/yZwalQZqOYocCui42HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183341478"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2025 07:19:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBw9D-000DZh-3C;
	Thu, 23 Oct 2025 14:18:41 +0000
Date: Thu, 23 Oct 2025 22:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 210fa0fea21179f7556e814473cad9e1bc4858f3
Message-ID: <202510232247.iCHNfnL4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_142359_374418_44DD5D72 
X-CRM114-Status: UNSURE (   3.19  )
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
branch HEAD: 210fa0fea21179f7556e814473cad9e1bc4858f3  spi: amlogic: fix spifc build error

elapsed time: 1342m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251023    gcc-8.5.0
arc                   randconfig-002-20251023    gcc-8.5.0
arm                              alldefconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                           h3600_defconfig    gcc-15.1.0
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20251023    clang-22
arm                   randconfig-002-20251023    clang-19
arm                   randconfig-003-20251023    gcc-8.5.0
arm                   randconfig-004-20251023    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251023    clang-22
arm64                 randconfig-002-20251023    gcc-8.5.0
arm64                 randconfig-003-20251023    gcc-8.5.0
arm64                 randconfig-004-20251023    clang-17
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251023    gcc-11.5.0
csky                  randconfig-002-20251023    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251023    clang-22
hexagon               randconfig-002-20251023    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251023    clang-20
i386        buildonly-randconfig-002-20251023    clang-20
i386        buildonly-randconfig-003-20251023    gcc-14
i386        buildonly-randconfig-004-20251023    clang-20
i386        buildonly-randconfig-005-20251023    clang-20
i386        buildonly-randconfig-006-20251023    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251023    clang-22
loongarch             randconfig-002-20251023    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251023    gcc-8.5.0
nios2                 randconfig-002-20251023    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251023    gcc-9.5.0
parisc                randconfig-002-20251023    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     asp8347_defconfig    clang-22
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251023    gcc-12.5.0
powerpc               randconfig-002-20251023    clang-22
powerpc               randconfig-003-20251023    clang-22
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251023    clang-22
powerpc64             randconfig-002-20251023    gcc-10.5.0
powerpc64             randconfig-003-20251023    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251023    gcc-8.5.0
riscv                 randconfig-002-20251023    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251023    clang-19
s390                  randconfig-002-20251023    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20251023    gcc-15.1.0
sh                    randconfig-002-20251023    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251023    gcc-12.5.0
sparc                 randconfig-002-20251023    gcc-8.5.0
sparc64               randconfig-001-20251023    clang-22
sparc64               randconfig-002-20251023    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251023    gcc-13
um                    randconfig-002-20251023    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251022    clang-20
x86_64      buildonly-randconfig-002-20251022    gcc-14
x86_64      buildonly-randconfig-003-20251022    gcc-14
x86_64      buildonly-randconfig-004-20251022    clang-20
x86_64      buildonly-randconfig-005-20251022    gcc-14
x86_64      buildonly-randconfig-006-20251022    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251023    gcc-8.5.0
xtensa                randconfig-002-20251023    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

