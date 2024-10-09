Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E311CEE343
	for <ath12k@archiver.kernel.org>; Wed,  9 Oct 2024 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FSHxQf5LwY1qkugh/MqOFLYHPfdplrHgwxOyFz9FnVk=; b=Ixa3p8AR5asyNXo3WG0Pn4dNhn
	QnF3akh2RZgNiwV6T2cXSG6JNalVXY+wEX6NyeLGDup74HniZpqtivkUyp2EYIFtqk8oWrIhyV23P
	/0Hgfx8Nv2e7HDFvKM/jk8g3NEK0IR4Vc0lY5uhmHBgoZpnGutpMGZQVhw35hNvFUn+ffYoU+WHkV
	4UQF5YrtgU+YfPwC4CliBR8WuSMHs7ppnUcKqxDlsi9WvUG6oCiNHHWBUV9JB+anQjwecbcAUQEUf
	rxmZL3/KAAjscabZ1Boo1YI6kbIhZzTu/sfJ2jfizdXene1ydptHVrDE3lm6l/jQ48vEbQxwJ4KM+
	lf33fUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syd1a-0000000Aase-1zuI
	for ath12k@archiver.kernel.org;
	Wed, 09 Oct 2024 20:11:10 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sycCR-0000000AUAi-30pF
	for ath12k@lists.infradead.org;
	Wed, 09 Oct 2024 19:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728501500; x=1760037500;
  h=date:from:to:cc:subject:message-id;
  bh=xuGQMoNRmCiP6m8J6por/2r0h3WT+fjxFq1r854hRrY=;
  b=IWQ1UAw3kL3/FzaDo4EzZMDCsEIcnj6tzqjUjy/OwLOzcaDm9I0Fr5At
   lUrk4WCzZXOzMJSbcKU5Dg7UIGJEtHKIZnw6OI1akuKaDTAOeo4WQG5dy
   8/jm1rmEPl3wPm/Lq5OpTBxukKGTLmOcP61YGoECwkp7YXP4MXukQyzSQ
   Pay6OhW9wLtUrK3rAk5ZpWvCvsy0W91DyrK0Mtwg9+X/wZra8DK/8XNZY
   8MRD2zKgx5AN5t2Zx5cbubUrWDiZvr9RDaOAohRXFVbXXuqKY69cSfLkx
   RWrl/qU+vxdol/bfgerUyPfHSbhJYWzsTz3BFTdjC06ds5zHGvz84ouM4
   w==;
X-CSE-ConnectionGUID: abNxAGmlQtGItHcGFm3g9w==
X-CSE-MsgGUID: PNk5S5r+R5CSjZw0/JfCQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38473086"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="38473086"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 12:18:18 -0700
X-CSE-ConnectionGUID: FY/Ta1ABS02zD7FHhxumhg==
X-CSE-MsgGUID: y1oUenMZTs2o6MMfVCUP0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="81155113"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2024 12:18:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sycCM-0009ik-2C;
	Wed, 09 Oct 2024 19:18:14 +0000
Date: Thu, 10 Oct 2024 03:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 829df6ff2c3cd9bdd352a1f7bc4f33cc2a53b8bd
Message-ID: <202410100331.mjhdXZ6c-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_121819_797505_BC47E41C 
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
branch HEAD: 829df6ff2c3cd9bdd352a1f7bc4f33cc2a53b8bd  wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct wiphy_work

elapsed time: 1474m

configs tested: 138
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241009    gcc-13.2.0
arc                   randconfig-002-20241009    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                          gemini_defconfig    clang-20
arm                        keystone_defconfig    gcc-14.1.0
arm                   randconfig-001-20241009    gcc-14.1.0
arm                   randconfig-002-20241009    clang-15
arm                   randconfig-003-20241009    clang-20
arm                   randconfig-004-20241009    clang-20
arm                        spear3xx_defconfig    clang-16
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
m68k                       m5208evb_defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
m68k                          sun3x_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip30_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20241009    gcc-14.1.0
nios2                 randconfig-002-20241009    gcc-14.1.0
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
powerpc                    ge_imp3a_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                      pmac32_defconfig    clang-20
powerpc                     powernv_defconfig    gcc-13.2.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc                     rainier_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241009    clang-20
powerpc               randconfig-002-20241009    clang-20
powerpc               randconfig-003-20241009    clang-20
powerpc64             randconfig-001-20241009    clang-20
powerpc64             randconfig-002-20241009    clang-20
powerpc64             randconfig-003-20241009    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
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
sh                                  defconfig    gcc-14.1.0
sh                    randconfig-001-20241009    gcc-14.1.0
sh                    randconfig-002-20241009    gcc-14.1.0
sh                           se7751_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
sparc64               randconfig-001-20241009    gcc-14.1.0
sparc64               randconfig-002-20241009    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241009    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241009    clang-18
x86_64      buildonly-randconfig-002-20241009    clang-18
x86_64      buildonly-randconfig-004-20241009    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241009    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

