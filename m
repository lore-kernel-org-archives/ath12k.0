Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CB8D1CDBD
	for <ath12k@archiver.kernel.org>; Tue, 22 Oct 2024 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lReBbNWJjT9MsdqfUOB5pmwGVMH9/pNjdEhpaazca24=; b=sreMxSGnP56qJCOYAKBJ1XbIAw
	yyFTLE8ERvGzpNKvJNra3y5EJLB8utotbiUR2iXOkFZHrW7N0Lfih8q1xTSbFEsIty2t3cjQRMowH
	0RrWvivdl8RHWteiEeBm4f7DQrdy/+JffgDe1lmYx6wWeJbadmzN3f9a/5so9omVPATnSA15PopTR
	cyTs5bRzFIdLKc8DWFVxZXC9zUbuyAg4Wj2zeeyUY1UnoR4x+fBJMse66zN6EepWrIOVcqo6MRpMo
	ZTOhup2R8em0h64rk1iuQpLGdzKjn1XiNLtlO6JsTZewur+7qDF0nIKUJ95O+DxKaV+YQeTpAplgj
	J1PzlIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Aib-0000000AFzk-0n0m
	for ath12k@archiver.kernel.org;
	Tue, 22 Oct 2024 08:58:21 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ads-0000000AExV-3oOY
	for ath12k@lists.infradead.org;
	Tue, 22 Oct 2024 08:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729587208; x=1761123208;
  h=date:from:to:cc:subject:message-id;
  bh=Rhhq+TSP+vNWbFVVMnvp4KHEUmZfYkm9OQA6Ecujne4=;
  b=TWVT8dDNSsux0zvS5pQK/pfZvSpidWM29kIFOO0lQfuw86wSj7U3vWnU
   eNw0IgvHWjEn7PGOpfKKfxIa/X75ToUiGamGlEF2kZFZcfISbpSHKlGXX
   TgDV8Ji0dXZ9DOcIuVqn8VbmJzHFEoixwQbBGsFkhp7A9fs0zYjCbbcKj
   zPs7OuRRhUfpfBtt1OlWJ+kj55hKhN4G3BLASBdZmHq/aJTIdkb8X/L4k
   ySUBNOkVJAc1kEWktSHIRQA5QUy846Oq6X0YFxKW2mEzU7LWLRwrJKtRO
   0YRmRcc4xcM6z70J8Vzchvn3iYoNaRH5ps/lrb2FpPRWb+zBptJV7fJzx
   w==;
X-CSE-ConnectionGUID: PrnMJAjmSO6i68Rdi5hAeg==
X-CSE-MsgGUID: oqalA8/rQEWp2mp7peEmvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40229874"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40229874"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 01:53:28 -0700
X-CSE-ConnectionGUID: 3xIVNWTlSui5xBqEmVPSpQ==
X-CSE-MsgGUID: QYqAy+sBTPS/pwolo+nXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79868510"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Oct 2024 01:53:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Ado-000TLW-2j;
	Tue, 22 Oct 2024 08:53:24 +0000
Date: Tue, 22 Oct 2024 16:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 ceffcfa263ed14608d72ef7444a96347fd037655
Message-ID: <202410221610.cza7W69s-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_015329_024920_F35A1AE8 
X-CRM114-Status: UNSURE (   3.99  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: ceffcfa263ed14608d72ef7444a96347fd037655  wifi: ath12k: advertise MLO support and capabilities

elapsed time: 1050m

configs tested: 152
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
arc                   randconfig-001-20241022    gcc-14.1.0
arc                   randconfig-002-20241022    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ep93xx_defconfig    gcc-14.1.0
arm                   milbeaut_m10v_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    gcc-14.1.0
arm                   randconfig-001-20241022    gcc-14.1.0
arm                   randconfig-002-20241022    gcc-14.1.0
arm                   randconfig-003-20241022    gcc-14.1.0
arm                   randconfig-004-20241022    gcc-14.1.0
arm                         s5pv210_defconfig    gcc-14.1.0
arm                           sama5_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241022    gcc-14.1.0
arm64                 randconfig-002-20241022    gcc-14.1.0
arm64                 randconfig-003-20241022    gcc-14.1.0
arm64                 randconfig-004-20241022    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241022    gcc-14.1.0
csky                  randconfig-002-20241022    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241022    gcc-14.1.0
hexagon               randconfig-002-20241022    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241022    clang-18
i386        buildonly-randconfig-002-20241022    clang-18
i386        buildonly-randconfig-003-20241022    clang-18
i386        buildonly-randconfig-004-20241022    clang-18
i386        buildonly-randconfig-005-20241022    clang-18
i386        buildonly-randconfig-006-20241022    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241022    clang-18
i386                  randconfig-002-20241022    clang-18
i386                  randconfig-003-20241022    clang-18
i386                  randconfig-004-20241022    clang-18
i386                  randconfig-005-20241022    clang-18
i386                  randconfig-006-20241022    clang-18
i386                  randconfig-011-20241022    clang-18
i386                  randconfig-012-20241022    clang-18
i386                  randconfig-013-20241022    clang-18
i386                  randconfig-014-20241022    clang-18
i386                  randconfig-015-20241022    clang-18
i386                  randconfig-016-20241022    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241022    gcc-14.1.0
loongarch             randconfig-002-20241022    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                            mac_defconfig    gcc-14.1.0
m68k                        mvme147_defconfig    gcc-14.1.0
m68k                        stmark2_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      bmips_stb_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241022    gcc-14.1.0
nios2                 randconfig-002-20241022    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    gcc-14.1.0
parisc                randconfig-001-20241022    gcc-14.1.0
parisc                randconfig-002-20241022    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      cm5200_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241022    gcc-14.1.0
powerpc               randconfig-002-20241022    gcc-14.1.0
powerpc               randconfig-003-20241022    gcc-14.1.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241022    gcc-14.1.0
powerpc64             randconfig-002-20241022    gcc-14.1.0
powerpc64             randconfig-003-20241022    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241022    gcc-14.1.0
riscv                 randconfig-002-20241022    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241022    gcc-14.1.0
s390                  randconfig-002-20241022    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241022    gcc-14.1.0
sh                    randconfig-002-20241022    gcc-14.1.0
sh                        sh7757lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241022    gcc-14.1.0
sparc64               randconfig-002-20241022    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241022    gcc-14.1.0
um                    randconfig-002-20241022    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                           alldefconfig    gcc-14.1.0
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  nommu_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20241022    gcc-14.1.0
xtensa                randconfig-002-20241022    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

