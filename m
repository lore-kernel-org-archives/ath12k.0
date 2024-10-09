Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BC9CEE345
	for <ath12k@archiver.kernel.org>; Wed,  9 Oct 2024 20:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vf5eYtnAGgH5SWplWpSY7+vIOnT+YMM9eGhpYYIWV0A=; b=KwvnhOEeBMIFtgRVPej/+O1oiP
	n736l9Gl/rR2DSeULUnvT0UCZ3663VPVlYJsQ3eNoj1bj1yyekIKprsMyQLdVahn1BkKZ84yNYlw/
	tZKFkPCjiMBUzoMtWYXsD6VqomsHPEvXIQ4i2BT83V9JsB6DUK/x26iM+zkfqlFXGkfReroTODqQf
	Q3ay73pgDhMczQ+/L9vWnOXJCZxBqgxYLk6+URXJ1wMbisVrG3OUeX0r3amsCDQaelm6wDi2DJMTW
	WNKojPvoyCScPC6N7M0lbk/8stSRjfx3/RZvr7B3u2Um2+iHIQ+71Sq96Vehl6DCkq3UbHPqbz1l7
	1B+Vbr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syd1Y-0000000AaqE-10wW
	for ath12k@archiver.kernel.org;
	Wed, 09 Oct 2024 20:11:08 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sycBT-0000000AU7x-2rV2
	for ath12k@lists.infradead.org;
	Wed, 09 Oct 2024 19:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728501440; x=1760037440;
  h=date:from:to:cc:subject:message-id;
  bh=JunMHTlp+TTsyzt5PCS1SLLoATaUs9Cj5BL3vg5xQLg=;
  b=ge/lOmGxZeilWVbef7G0hqcm1XNnj79zt870N/G+m1PYfdQtewhk4VNm
   72EuTplZ0n5VK70h2VPs9CwQ4k1mG8Ryh/WuGhOllrjlbao+Qkbe9IpFI
   T1JWc8BZnZvlJk8/UuiJfdbBzq8hoJudhDQ2lFSM9S6fcjGcIrK61Sx6E
   GOnhmCulNd+2Mv52Uzrnf2sbEXETMzJpW1nZYQe07YXvIvKlWwEbeQvYP
   4XdjnJU6qHnfq3dUzxYhM0yK8FgOvK7xxsCmTEl1+a9rOjgirgRoPUvmr
   PDzrzoT7kSUnmu2Yjni66Pj3v5J3ij1obKhClZi5maa33ZyNeYOpPWO+P
   w==;
X-CSE-ConnectionGUID: TU/YY9uqThmJvoVkpi+r3w==
X-CSE-MsgGUID: XswEZ9bwRSK1YjH5kcTevw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38956209"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="38956209"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 12:17:18 -0700
X-CSE-ConnectionGUID: ytZwR0eZQUyksQdqowcCUA==
X-CSE-MsgGUID: c3GzQSZjTmm6SpmtvGV+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="76820605"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2024 12:17:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sycBO-0009ie-20;
	Wed, 09 Oct 2024 19:17:14 +0000
Date: Thu, 10 Oct 2024 03:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 7435d14d41d5d479a5e6a8a2cd4efdac9d928823
Message-ID: <202410100311.eVZAKT6p-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_121719_804633_2706E463 
X-CRM114-Status: UNSURE (   4.11  )
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
branch HEAD: 7435d14d41d5d479a5e6a8a2cd4efdac9d928823  wifi: ath12k: advertise MLO support and capabilities

Unverified Warning (likely false positive, kindly check if interested):

    drivers/net/wireless/ath/ath12k/mac.c:10744 ath12k_mac_hw_register() error: uninitialized symbol 'cap'.
    drivers/net/wireless/ath/ath12k/mac.c:4304 ath12k_mac_op_set_key() error: uninitialized symbol 'ret'.
    drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
    drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15

Warning ids grouped by kconfigs:

recent_errors
`-- csky-randconfig-r072-20241008
    |-- drivers-net-wireless-ath-ath12k-mac.c-ath12k_get_link_bss_conf()-error:buffer-overflow-vif-link_conf
    |-- drivers-net-wireless-ath-ath12k-mac.c-ath12k_get_link_sta()-error:buffer-overflow-sta-link
    |-- drivers-net-wireless-ath-ath12k-mac.c-ath12k_mac_hw_register()-error:uninitialized-symbol-cap-.
    `-- drivers-net-wireless-ath-ath12k-mac.c-ath12k_mac_op_set_key()-error:uninitialized-symbol-ret-.

elapsed time: 1471m

configs tested: 130
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                   randconfig-001-20241009    gcc-13.2.0
arc                   randconfig-002-20241009    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                   randconfig-001-20241009    gcc-14.1.0
arm                   randconfig-002-20241009    clang-15
arm                   randconfig-003-20241009    clang-20
arm                   randconfig-004-20241009    clang-20
arm                         s3c6400_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20241009    clang-20
arm64                 randconfig-002-20241009    clang-20
arm64                 randconfig-003-20241009    gcc-14.1.0
arm64                 randconfig-004-20241009    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20241009    gcc-14.1.0
csky                  randconfig-002-20241009    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241009    clang-20
hexagon               randconfig-002-20241009    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241009    clang-18
i386        buildonly-randconfig-002-20241009    gcc-12
i386        buildonly-randconfig-003-20241009    clang-18
i386        buildonly-randconfig-004-20241009    clang-18
i386        buildonly-randconfig-005-20241009    clang-18
i386        buildonly-randconfig-006-20241009    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241009    clang-18
i386                  randconfig-002-20241009    clang-18
i386                  randconfig-003-20241009    gcc-12
i386                  randconfig-004-20241009    clang-18
i386                  randconfig-005-20241009    gcc-12
i386                  randconfig-006-20241009    clang-18
i386                  randconfig-011-20241009    clang-18
i386                  randconfig-012-20241009    clang-18
i386                  randconfig-013-20241009    clang-18
i386                  randconfig-014-20241009    gcc-12
i386                  randconfig-015-20241009    clang-18
i386                  randconfig-016-20241009    gcc-11
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20241009    gcc-14.1.0
loongarch             randconfig-002-20241009    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    clang-20
mips                     decstation_defconfig    gcc-13.2.0
mips                           ip22_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20241009    gcc-14.1.0
nios2                 randconfig-002-20241009    gcc-14.1.0
openrisc                         alldefconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20241009    gcc-14.1.0
parisc                randconfig-002-20241009    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                       maple_defconfig    clang-20
powerpc               randconfig-001-20241009    clang-20
powerpc               randconfig-002-20241009    clang-20
powerpc               randconfig-003-20241009    clang-20
powerpc                     tqm8555_defconfig    clang-20
powerpc64             randconfig-001-20241009    clang-20
powerpc64             randconfig-002-20241009    clang-20
powerpc64             randconfig-003-20241009    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    clang-20
riscv                 randconfig-001-20241009    gcc-14.1.0
riscv                 randconfig-002-20241009    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241009    clang-20
s390                  randconfig-002-20241009    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                    randconfig-001-20241009    gcc-14.1.0
sh                          rsk7201_defconfig    gcc-14.1.0
sh                          sdk7780_defconfig    gcc-14.1.0
sh                           se7705_defconfig    gcc-14.1.0
sh                           se7712_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241009    clang-18
x86_64      buildonly-randconfig-002-20241009    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

