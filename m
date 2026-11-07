Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C271606A32E
	for <ath12k@archiver.kernel.org>; Sat,  7 Nov 2026 16:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vRfzyQjh;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WgAyEm94
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GolXEcrK2jnWE0froxj/kJMOqIboiHy1ZB8TItCXDtA=; b=vRfzyQjhn8F00Ogg8gNM0oJnx1
	iYAk3/qaezNJlBFo4Lfz7vfZ7qa33FUaIk0r5bSuQuPEhprurqzSdB4f2TCVUTAhNjZDjKcYw+HV/
	PZ29fxtyMwn05R9yQl9UjVg0bbgEqFeLIzqhK/yWi1vHtCzaDsR1NIvqOFVlw5iSJmgFr1KeQ95dO
	HL7pBCbeR7l0ml68kBVEf4YM4MORmOJCHdSMEdstcN960zlUw7B0NfVykqU0/E3HL1JgdQdGo4HzV
	pqoZfR5MgUVh6Jfbe9iol5Li5MI7gKQTTZWAJgUGFc740bUyfphJZoCkcftOGSgwgw+U0XpoLFjaO
	FHrJvsag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjiy-0000000F3tF-3ai9;
	Sat, 07 Nov 2026 16:57:04 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjiv-0000000F3sk-2zFy
	for ath12k@lists.infradead.org;
	Sat, 07 Nov 2026 16:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794070622; x=1825606622;
  h=date:from:to:cc:subject:message-id;
  bh=t3nUJkTjq0ryvZr2LVuIvQhrMgR9d01RsD7RxJqHEhE=;
  b=WgAyEm942Rv5Y0GekVk4QvUt6vDNgoRYLpIcjXzwGPT1nTjamqHNktqJ
   rbKDwyY5q5pjXBDRl0tIT301t749wm8Y1lDD6ry8Z9RrFgVR3GdXbvjtE
   S+l811TosuUDTbBxQX217bjiCAplVHiFQWfD1hBglcoxWSE7ukdtl+HZ2
   /d/jfDyB5ybnrde3UwAjreRO83eY54hHcloIL91akGgOBEDOMlsKZ5uHj
   xGAi9QMG7qyB3+mbptdrEou98rPNrs9jNZvpZIIv3SVYywBMlDFXor8qh
   B2h1DOqqsdul0IgSegKVtQISAZLCX0W6FCnGMIj252Pnekvs7sUsvxCAj
   w==;
X-CSE-ConnectionGUID: j3+gpOkESraq15HP7cibEQ==
X-CSE-MsgGUID: 2ez2zcQySruMhOFoW2qahA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2849934"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2849934"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 08:57:00 -0800
X-CSE-ConnectionGUID: sw6rvhOGT/SPAtSuIU0/1Q==
X-CSE-MsgGUID: YHxXZsqeSnKUoebQAoIkyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7520941"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2026 08:56:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPjiq-00000000rEp-0m0G;
	Sat, 07 Nov 2026 16:56:56 +0000
Date: Sun, 08 Nov 2026 00:56:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 a354a5c5a17185e050f0ff11bf8c903eb727b794
Message-ID: <20261108005624.aDGda5Bq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085701_811171_DC80C6CB 
X-CRM114-Status: UNSURE (   3.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: a354a5c5a17185e050f0ff11bf8c903eb727b794  wifi: ath12k: remove duplicate ucast_ra_only assignment in dp_peer_create

elapsed time: 1001m

configs tested: 236
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    clang-17
arc                             hsdk_defconfig    gcc-16.2.0
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261107    gcc-12.5.0
arc                   randconfig-1001-20261107    gcc-12.5.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                            omap1_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261107    gcc-12.5.0
arm                   randconfig-1001-20261107    gcc-12.5.0
arm                   randconfig-1002-20261107    gcc-12.5.0
arm                   randconfig-1003-20261107    gcc-12.5.0
arm                              rpc_defconfig    gcc-16.2.0
arm                           sp7021_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261107    gcc-11.5.0
arm64                 randconfig-1001-20261107    gcc-11.5.0
arm64                 randconfig-1002-20261107    gcc-11.5.0
arm64                 randconfig-1003-20261107    gcc-11.5.0
arm64                        renesas_defconfig    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261107    gcc-11.5.0
csky                  randconfig-1001-20261107    gcc-11.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1001-20261107    clang-18
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261107    gcc-14
i386        buildonly-randconfig-1001-20261107    gcc-14
i386        buildonly-randconfig-1002-20261107    gcc-14
i386        buildonly-randconfig-1003-20261107    gcc-14
i386        buildonly-randconfig-1004-20261107    gcc-14
i386        buildonly-randconfig-1005-20261107    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261107    clang-22
i386                  randconfig-1001-20261107    clang-22
i386                  randconfig-1002-20261107    clang-22
i386                  randconfig-1003-20261107    clang-22
i386                  randconfig-1004-20261107    clang-22
i386                  randconfig-1005-20261107    clang-22
i386                  randconfig-1006-20261107    clang-22
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1013-20261107    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1001-20261107    clang-18
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                      cu1000-neo_defconfig    clang-24
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-16.2.0
mips                           malta_defconfig    clang-17
mips                       malta_kvm_defconfig    clang-17
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1001-20261107    clang-18
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261107    clang-24
parisc                randconfig-1001-20261107    clang-24
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                      akebono_defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc                        ebony_defconfig    gcc-16.2.0
powerpc                      ep8248e_defconfig    gcc-16.2.0
powerpc                       katmai_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    gcc-16.2.0
powerpc                      mpc5200_defconfig    clang-24
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261107    clang-24
powerpc               randconfig-1001-20261107    clang-24
powerpc                      sequoia_defconfig    gcc-16.2.0
powerpc                      tqm8548_defconfig    clang-24
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc                          wii_defconfig    clang-24
powerpc64             randconfig-1000-20261107    clang-24
powerpc64             randconfig-1001-20261107    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-17
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1000-20261108    gcc-12.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261108    gcc-12.5.0
s390                              alldefconfig    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1000-20261108    gcc-12.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
s390                  randconfig-1001-20261108    gcc-12.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    clang-24
sh                                j2_defconfig    clang-24
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1000-20261108    gcc-12.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                    randconfig-1001-20261108    gcc-12.5.0
sh                           rsk7269_defconfig    clang-17
sh                           sdk7786_defconfig    clang-24
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7619_defconfig    gcc-16.2.0
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                              sh03_defconfig    clang-17
sh                            sh2007_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261107    gcc-10.5.0
sparc                 randconfig-1001-20261107    gcc-10.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261107    gcc-10.5.0
sparc64               randconfig-1001-20261107    gcc-10.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261107    gcc-10.5.0
um                    randconfig-1001-20261107    gcc-10.5.0
um                            x86_64_defconfig    gcc-14
um                            x86_64_defconfig    gcc-16.2.0
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261107    gcc-14
x86_64                randconfig-1001-20261107    gcc-14
x86_64                randconfig-1002-20261107    gcc-14
x86_64                randconfig-1003-20261107    gcc-14
x86_64                randconfig-1004-20261107    gcc-14
x86_64                randconfig-1005-20261107    gcc-14
x86_64                randconfig-1006-20261107    gcc-13
x86_64                randconfig-1007-20261107    gcc-13
x86_64                randconfig-1008-20261107    gcc-13
x86_64                randconfig-1009-20261107    gcc-13
x86_64                randconfig-1010-20261107    gcc-13
x86_64                randconfig-1011-20261107    gcc-13
x86_64                randconfig-1012-20261107    clang-22
x86_64                randconfig-1013-20261107    clang-22
x86_64                randconfig-1014-20261107    clang-22
x86_64                randconfig-1015-20261107    clang-22
x86_64                randconfig-1016-20261107    clang-22
x86_64                randconfig-1017-20261107    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261107    gcc-10.5.0
xtensa                randconfig-1001-20261107    gcc-10.5.0
xtensa                          virt_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

