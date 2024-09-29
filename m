Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5F0CF6491
	for <ath12k@archiver.kernel.org>; Sun, 29 Sep 2024 03:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YWRFuHuaxj2RqdHcvN5HPKrgpLbPCQSrVs2Xj1aL64k=; b=DWQU7pBw7XwceX6YkppXBdBCZf
	k6Zlp/2y0fPatj3cg2fksIKCrXysipQ0zMPpWQ+9POl8RvCPM17+JEkm2imbLCH2QR0oAmDcLinkK
	v8pPvIpQoaSE6gVvOe/Fm992YHcYMdxmlwBV92rtkneImZfucKulfQqG5VR0ZCn+z93Lb7HFstjm/
	NcBlyxxecHZD0ar2yLhHPX01McPznIWfdkPrXkxXQDAIzlxs/BqzyikiWY6t9lY5RSpafY14o8s5f
	GHFaPHoy3uUQ7qNAmSUZMpfu10Qp7PeJw4F2ea83sbPnQetWWEMcM/RAVovwVwsFT2OetUwAYpTcY
	3CiAdbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sukgP-0000000E3Gw-4174
	for ath12k@archiver.kernel.org;
	Sun, 29 Sep 2024 03:33:17 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sukgM-0000000E3GW-0ztn
	for ath12k@lists.infradead.org;
	Sun, 29 Sep 2024 03:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727580794; x=1759116794;
  h=date:from:to:cc:subject:message-id;
  bh=6ZB6F83blc2gtoDrbqCrETghMYT3b+QgBGHO1NxgPtY=;
  b=OIfrW4DVbgopbGSiOWc+xKqua8SyTgUgjglXsvrP3JVqc/2KJygtS/1m
   VJhoaMk7KrEzcjS3pCtMgESErdGuykWx3al6czL0O4aVtEoxbxVRmqY7q
   bkhLNSlQtTPm8BkpoplquDD9yAbRdd16asXRfq0dQaKyDqEFvxL6uQ6RS
   tpqRtZgwhK8XgeRMG1pBP9vaOieVyE2066b64QHiyP5Sm4UybRI3CQeH2
   /a2XNof34bqLWA194MQRX58CnCcz8RFsTrb6bzy58jr+HofwWemkiGWBB
   ijH+8wOQRNTOJcRhGN0SQiut2SnBZE8i48Y4dE6ljYoQLPryaT/RsJt+y
   g==;
X-CSE-ConnectionGUID: V49QrM5iSby5nF/Z/ZRl2Q==
X-CSE-MsgGUID: Fsy3izX6RxCVGGotJ5zlFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26564886"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26564886"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 20:33:12 -0700
X-CSE-ConnectionGUID: FS0hmW58S26fZYfgH370pA==
X-CSE-MsgGUID: 4Ef6oKWjR3eA3itgwsA+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72805009"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 20:33:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sukgG-000Nrn-0s;
	Sun, 29 Sep 2024 03:33:08 +0000
Date: Sun, 29 Sep 2024 11:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 8ed36fe71fd60c851540839b105fd1fddc870c61
Message-ID: <202409291123.JXNLlp1A-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_203314_361981_B35F4B7A 
X-CRM114-Status: UNSURE (   3.87  )
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
branch HEAD: 8ed36fe71fd60c851540839b105fd1fddc870c61  Add localversion-wireless-testing-ath

elapsed time: 1056m

configs tested: 254
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20240928    gcc-14.1.0
arc                   randconfig-001-20240929    gcc-13.2.0
arc                   randconfig-002-20240928    gcc-14.1.0
arc                   randconfig-002-20240929    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                          collie_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                             mxs_defconfig    clang-20
arm                       netwinder_defconfig    gcc-14.1.0
arm                   randconfig-001-20240928    gcc-14.1.0
arm                   randconfig-001-20240929    clang-20
arm                   randconfig-002-20240928    gcc-14.1.0
arm                   randconfig-002-20240929    gcc-14.1.0
arm                   randconfig-003-20240928    gcc-14.1.0
arm                   randconfig-003-20240929    clang-15
arm                   randconfig-004-20240928    gcc-14.1.0
arm                   randconfig-004-20240929    gcc-14.1.0
arm                           sunxi_defconfig    gcc-14.1.0
arm                           tegra_defconfig    gcc-14.1.0
arm                        vexpress_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240928    gcc-14.1.0
arm64                 randconfig-001-20240929    clang-20
arm64                 randconfig-002-20240928    gcc-14.1.0
arm64                 randconfig-002-20240929    gcc-14.1.0
arm64                 randconfig-003-20240928    gcc-14.1.0
arm64                 randconfig-003-20240929    gcc-14.1.0
arm64                 randconfig-004-20240928    gcc-14.1.0
arm64                 randconfig-004-20240929    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240928    gcc-14.1.0
csky                  randconfig-001-20240929    gcc-14.1.0
csky                  randconfig-002-20240928    gcc-14.1.0
csky                  randconfig-002-20240929    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240928    gcc-14.1.0
hexagon               randconfig-001-20240929    clang-16
hexagon               randconfig-002-20240928    gcc-14.1.0
hexagon               randconfig-002-20240929    clang-20
i386                             alldefconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240928    clang-18
i386        buildonly-randconfig-001-20240929    clang-18
i386        buildonly-randconfig-002-20240928    gcc-12
i386        buildonly-randconfig-002-20240929    clang-18
i386        buildonly-randconfig-003-20240928    clang-18
i386        buildonly-randconfig-003-20240929    clang-18
i386        buildonly-randconfig-004-20240928    gcc-12
i386        buildonly-randconfig-004-20240929    clang-18
i386        buildonly-randconfig-005-20240928    gcc-12
i386        buildonly-randconfig-005-20240929    clang-18
i386        buildonly-randconfig-006-20240928    gcc-12
i386        buildonly-randconfig-006-20240929    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240928    clang-18
i386                  randconfig-001-20240929    clang-18
i386                  randconfig-002-20240928    gcc-12
i386                  randconfig-002-20240929    clang-18
i386                  randconfig-003-20240928    clang-18
i386                  randconfig-003-20240929    clang-18
i386                  randconfig-003-20240929    gcc-12
i386                  randconfig-004-20240928    clang-18
i386                  randconfig-004-20240929    clang-18
i386                  randconfig-005-20240928    clang-18
i386                  randconfig-005-20240929    clang-18
i386                  randconfig-006-20240928    gcc-12
i386                  randconfig-006-20240929    clang-18
i386                  randconfig-006-20240929    gcc-12
i386                  randconfig-011-20240928    clang-18
i386                  randconfig-011-20240929    clang-18
i386                  randconfig-011-20240929    gcc-11
i386                  randconfig-012-20240928    gcc-12
i386                  randconfig-012-20240929    clang-18
i386                  randconfig-012-20240929    gcc-12
i386                  randconfig-013-20240928    clang-18
i386                  randconfig-013-20240929    clang-18
i386                  randconfig-014-20240928    clang-18
i386                  randconfig-014-20240929    clang-18
i386                  randconfig-014-20240929    gcc-12
i386                  randconfig-015-20240928    clang-18
i386                  randconfig-015-20240929    clang-18
i386                  randconfig-016-20240928    clang-18
i386                  randconfig-016-20240929    clang-18
i386                  randconfig-016-20240929    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240928    gcc-14.1.0
loongarch             randconfig-001-20240929    gcc-14.1.0
loongarch             randconfig-002-20240928    gcc-14.1.0
loongarch             randconfig-002-20240929    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    gcc-14.1.0
m68k                       bvme6000_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    gcc-14.1.0
m68k                        mvme147_defconfig    gcc-14.1.0
m68k                        stmark2_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    gcc-14.1.0
mips                        vocore2_defconfig    clang-15
nios2                         3c120_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240928    gcc-14.1.0
nios2                 randconfig-001-20240929    gcc-14.1.0
nios2                 randconfig-002-20240928    gcc-14.1.0
nios2                 randconfig-002-20240929    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
openrisc                       virt_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    gcc-14.1.0
parisc                generic-64bit_defconfig    gcc-14.1.0
parisc                randconfig-001-20240928    gcc-14.1.0
parisc                randconfig-001-20240929    gcc-14.1.0
parisc                randconfig-002-20240928    gcc-14.1.0
parisc                randconfig-002-20240929    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      chrp32_defconfig    gcc-14.1.0
powerpc                    ge_imp3a_defconfig    gcc-14.1.0
powerpc                        icon_defconfig    gcc-14.1.0
powerpc                     kmeter1_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
powerpc                      pcm030_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240928    gcc-14.1.0
powerpc               randconfig-002-20240928    gcc-14.1.0
powerpc               randconfig-002-20240929    gcc-14.1.0
powerpc               randconfig-003-20240928    gcc-14.1.0
powerpc               randconfig-003-20240929    clang-20
powerpc                    socrates_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20240928    gcc-14.1.0
powerpc64             randconfig-001-20240929    clang-20
powerpc64             randconfig-002-20240928    gcc-14.1.0
powerpc64             randconfig-002-20240929    clang-15
powerpc64             randconfig-003-20240928    gcc-14.1.0
powerpc64             randconfig-003-20240929    clang-17
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240928    gcc-14.1.0
riscv                 randconfig-001-20240929    clang-20
riscv                 randconfig-002-20240928    gcc-14.1.0
riscv                 randconfig-002-20240929    clang-20
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240928    gcc-14.1.0
s390                  randconfig-001-20240929    gcc-14.1.0
s390                  randconfig-002-20240928    gcc-14.1.0
s390                  randconfig-002-20240929    gcc-14.1.0
sh                               alldefconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          r7780mp_defconfig    gcc-14.1.0
sh                    randconfig-001-20240928    gcc-14.1.0
sh                    randconfig-001-20240929    gcc-14.1.0
sh                    randconfig-002-20240928    gcc-14.1.0
sh                    randconfig-002-20240929    gcc-14.1.0
sh                           se7705_defconfig    gcc-14.1.0
sh                           se7721_defconfig    gcc-14.1.0
sh                           se7750_defconfig    gcc-14.1.0
sh                             shx3_defconfig    gcc-14.1.0
sh                            titan_defconfig    gcc-14.1.0
sparc                            alldefconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240928    gcc-14.1.0
sparc64               randconfig-001-20240929    gcc-14.1.0
sparc64               randconfig-002-20240928    gcc-14.1.0
sparc64               randconfig-002-20240929    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240928    gcc-14.1.0
um                    randconfig-001-20240929    clang-20
um                    randconfig-002-20240928    gcc-14.1.0
um                    randconfig-002-20240929    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    gcc-14.1.0
xtensa                  nommu_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20240928    gcc-14.1.0
xtensa                randconfig-002-20240928    gcc-14.1.0
xtensa                randconfig-002-20240929    gcc-14.1.0
xtensa                         virt_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

