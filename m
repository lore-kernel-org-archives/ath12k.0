Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6FBCED268
	for <ath12k@archiver.kernel.org>; Tue,  8 Oct 2024 05:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=75Xin4dktqwOgMw5YH6O49NLvpWJsUt9O7NR0z5nlQA=; b=Hod7juZfumkNw1HbHwR40VwexW
	Y8Yama6qFApiL5rxtZxIZqhxI6nMphM53mmgo/oK/79V9vL/qUOU6mrRDxk3gPO3yOzKVA3taiOkd
	H1T6tPueEFRn9vlW5iDYoYVrrwpgvlvVr1vMxGwRUewfEIZkyhGROwLub8e3ybYS6+wkK26RC2knl
	fHsBhIH2/dmZZmA397YoE46FLP0/ohpZZSKRXXW2qcwcqt6FGEfhLTSLp0m/4sbgD7to5xL91pOeE
	/0eVU3Ei5s69R1Z1aaKIHTYl80YUiIN/OQWIgCR/YQdTJ+pOraGtqnvHqmtAs1Rd7ID65Xxe5Gqe9
	MWjGD5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2uh-00000004ZHF-2aPd
	for ath12k@archiver.kernel.org;
	Tue, 08 Oct 2024 05:37:39 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2uf-00000004ZGk-248s
	for ath12k@lists.infradead.org;
	Tue, 08 Oct 2024 05:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728365857; x=1759901857;
  h=date:from:to:cc:subject:message-id;
  bh=SIzh45K9N6JzWdc7cRcgeRNFYVhRUsAmM1oy9P2+17s=;
  b=RUzEDSiyJCLyCK/DkzPzB0hwBkWlnoi9Eq7n17ajVwcZX3CXpy5KK7Bm
   IownjxucJE71tFMpUzLGSWQxZPSUfThD8XmtUv7nf2eAB51qyA3lPcY3O
   ruoDgpvgWLGEZVOSm9e/HZg1FWbnCPOpJ6QNDk99mgAD/9NLIim30hlvF
   gfgKP78rcHkVzEl9Wr9hmMHW5bL3s++HK+tLLDniUCCa+pmYAjzjc34C9
   +wLNWgnGyx982Y6ZDOLR5cMAvOHNByzmmlBt1DsGxg73aUCdpEykAOUn0
   u4KP7P+ZNSQjJ4Kb71f0HnKSdvN4bApcu05Td4WTygsSEyRhaOi9tO0q3
   A==;
X-CSE-ConnectionGUID: 0+lKk8fZQeaD5NW8AXZinQ==
X-CSE-MsgGUID: q0Tc4nFZQsiW/0uRd0dwxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="52943716"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="52943716"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 22:37:37 -0700
X-CSE-ConnectionGUID: HFg7aJETQcSkKd/K2DhyLQ==
X-CSE-MsgGUID: kZMw+4yUQiyAywy8yu781Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="75955284"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Oct 2024 22:37:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy2ub-0005wW-1M;
	Tue, 08 Oct 2024 05:37:33 +0000
Date: Tue, 08 Oct 2024 13:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 17881fc070ee4530899ee6902ecf0f9db7e85b92
Message-ID: <202410081342.gLz7PeZs-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_223737_613596_EFA4B524 
X-CRM114-Status: UNSURE (   4.18  )
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
branch HEAD: 17881fc070ee4530899ee6902ecf0f9db7e85b92  wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct wiphy_work

elapsed time: 735m

configs tested: 194
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241008    gcc-14.1.0
arc                   randconfig-002-20241008    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-13.2.0
arm                          pxa3xx_defconfig    gcc-14.1.0
arm                   randconfig-001-20241008    gcc-14.1.0
arm                   randconfig-002-20241008    gcc-14.1.0
arm                   randconfig-003-20241008    gcc-14.1.0
arm                   randconfig-004-20241008    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241008    gcc-14.1.0
arm64                 randconfig-002-20241008    gcc-14.1.0
arm64                 randconfig-003-20241008    gcc-14.1.0
arm64                 randconfig-004-20241008    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241008    gcc-14.1.0
csky                  randconfig-002-20241008    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241008    gcc-14.1.0
hexagon               randconfig-002-20241008    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241008    clang-18
i386        buildonly-randconfig-002-20241008    clang-18
i386        buildonly-randconfig-003-20241008    clang-18
i386        buildonly-randconfig-004-20241008    clang-18
i386        buildonly-randconfig-005-20241008    clang-18
i386        buildonly-randconfig-006-20241008    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241008    clang-18
i386                  randconfig-002-20241008    clang-18
i386                  randconfig-003-20241008    clang-18
i386                  randconfig-004-20241008    clang-18
i386                  randconfig-005-20241008    clang-18
i386                  randconfig-006-20241008    clang-18
i386                  randconfig-011-20241008    clang-18
i386                  randconfig-012-20241008    clang-18
i386                  randconfig-013-20241008    clang-18
i386                  randconfig-014-20241008    clang-18
i386                  randconfig-015-20241008    clang-18
i386                  randconfig-016-20241008    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241008    gcc-14.1.0
loongarch             randconfig-002-20241008    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          hp300_defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    gcc-13.2.0
mips                      bmips_stb_defconfig    gcc-13.2.0
mips                          eyeq5_defconfig    gcc-13.2.0
mips                           ip27_defconfig    gcc-13.2.0
mips                           ip30_defconfig    gcc-13.2.0
mips                      loongson3_defconfig    gcc-14.1.0
mips                        maltaup_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241008    gcc-14.1.0
nios2                 randconfig-002-20241008    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
openrisc                       virt_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241008    gcc-14.1.0
parisc                randconfig-002-20241008    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-13.2.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       eiger_defconfig    gcc-14.1.0
powerpc                 linkstation_defconfig    gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-13.2.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
powerpc                     ppa8548_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241008    gcc-14.1.0
powerpc               randconfig-002-20241008    gcc-14.1.0
powerpc               randconfig-003-20241008    gcc-14.1.0
powerpc                    sam440ep_defconfig    gcc-13.2.0
powerpc                     tqm8540_defconfig    gcc-14.1.0
powerpc                     tqm8541_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241008    gcc-14.1.0
powerpc64             randconfig-002-20241008    gcc-14.1.0
powerpc64             randconfig-003-20241008    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241008    gcc-14.1.0
riscv                 randconfig-002-20241008    gcc-14.1.0
s390                             alldefconfig    gcc-13.2.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241008    gcc-14.1.0
s390                  randconfig-002-20241008    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.1.0
sh                          r7780mp_defconfig    gcc-13.2.0
sh                    randconfig-001-20241008    gcc-14.1.0
sh                    randconfig-002-20241008    gcc-14.1.0
sh                      rts7751r2d1_defconfig    gcc-13.2.0
sh                           se7712_defconfig    gcc-14.1.0
sh                           se7780_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-13.2.0
sparc                            alldefconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241008    gcc-14.1.0
sparc64               randconfig-002-20241008    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241008    gcc-14.1.0
um                    randconfig-002-20241008    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241008    gcc-12
x86_64      buildonly-randconfig-002-20241008    gcc-12
x86_64      buildonly-randconfig-003-20241008    gcc-12
x86_64      buildonly-randconfig-004-20241008    gcc-12
x86_64      buildonly-randconfig-005-20241008    gcc-12
x86_64      buildonly-randconfig-006-20241008    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241008    gcc-12
x86_64                randconfig-002-20241008    gcc-12
x86_64                randconfig-003-20241008    gcc-12
x86_64                randconfig-004-20241008    gcc-12
x86_64                randconfig-005-20241008    gcc-12
x86_64                randconfig-006-20241008    gcc-12
x86_64                randconfig-011-20241008    gcc-12
x86_64                randconfig-012-20241008    gcc-12
x86_64                randconfig-013-20241008    gcc-12
x86_64                randconfig-014-20241008    gcc-12
x86_64                randconfig-015-20241008    gcc-12
x86_64                randconfig-016-20241008    gcc-12
x86_64                randconfig-071-20241008    gcc-12
x86_64                randconfig-072-20241008    gcc-12
x86_64                randconfig-073-20241008    gcc-12
x86_64                randconfig-074-20241008    gcc-12
x86_64                randconfig-075-20241008    gcc-12
x86_64                randconfig-076-20241008    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241008    gcc-14.1.0
xtensa                randconfig-002-20241008    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

