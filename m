Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AC4D462BF
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6bCLENyUTYsx2Ug0GPq564LSgl4c12sVX5MGhAd2rSo=; b=TxDlqqsu6MYT2xBQznbT/wvMyl
	lmkzja7KA9Rj3V0qSejrw1Wk75BOgXYSxbbInQC6n7K5jWy7Pdn0o2PqCsoJB0Xp6nsviw6Srlcqf
	LSjD8bKkRQNiN5jaFm7AL8I0xJXwrfQRvO7gV7yvGy9uw94J6COYyMTdGddEzqy02dxdkajlq4Qpu
	IslRs+uw2m6ABGfJPPf2JsK3HleqgyHsn4rZZndVTeuRsXsWfFL+pY8J1S2XnkGo/271zg6vCC6A3
	kNgymFkyMSa4xjzComOYVqqC2SDwSclVRxd6LpOh0k7nR1GhtKgKq9eVKmyZcv/dWcrW+Uqhhyg/P
	JvF56vOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFXA-00000007LTb-2mR1
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 15:43:56 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFX6-00000007LSC-3KX9
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 15:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731512633; x=1763048633;
  h=date:from:to:cc:subject:message-id;
  bh=jekrgqn7RoczRB0Ki4hI4h9f85ddeiNpmP92fL195gk=;
  b=iltvq40NRG1XcLA0FEKvT64qBxAEqLJEwoRUp+ZK2riL9J1zr/7tghbU
   Dz3X252yCVmro7cmbV7SWzTo7lU3+QzWC+5S7Wzal/fV1YBnzIE0Tnq+P
   L29odsfTDex8V8qm4W8aK5vOEhKoIDumUPzII4tvwGpzkd9Zv8xMqj93I
   jcKXbe67BmxPSVRiXkPpEhLgEJJvCA9iX/r7LM7ckuMkJGvCsD3Yc9qFM
   aiEZKLifliF1EXbO+Kg7dJzKGFwAlfKDkHFof7OvRy96tBEzfRQqyj4jW
   nGYAsiZunZz+eqplfptq4KXpvpOtndlTI70ZtJhBgEy6SI2WQw1mSTVeM
   w==;
X-CSE-ConnectionGUID: 0J24XeQARJ+fUjvM22KoCA==
X-CSE-MsgGUID: 8BNNplQoS+mOOmB9W/S3Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31566380"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31566380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 07:43:52 -0800
X-CSE-ConnectionGUID: mtYVL0EWT++iDd6xiwpqsg==
X-CSE-MsgGUID: H5ATDl2URBivzYuOSM3CFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="88331044"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2024 07:43:49 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBFX0-0000VF-2j;
	Wed, 13 Nov 2024 15:43:46 +0000
Date: Wed, 13 Nov 2024 23:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD REGRESSION
 fc6f018eda7f9054e427f731db1e8b200f22873c
Message-ID: <202411132313.IJoYZM63-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_074352_984277_070E44D1 
X-CRM114-Status: UNSURE (   3.42  )
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
branch HEAD: fc6f018eda7f9054e427f731db1e8b200f22873c  Add localversion-wireless-testing-ath

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202411131838.DE0FWg8Q-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202411131901.ZSs0uLgF-lkp@intel.com

    drivers/net/ethernet/intel/ice/ice_gnss.c:400:23: error: implicit declaration of function 'ice_read_pca9575_reg'; did you mean 'ice_read_pca9575_reg_e810t'? [-Werror=implicit-function-declaration]
    drivers/net/ethernet/intel/ice/ice_gnss.c:400:9: error: call to undeclared function 'ice_read_pca9575_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/net/ethernet/intel/ice/ice_ptp.c:165:15: error: implicit declaration of function 'ice_read_sma_ctrl'; did you mean 'ice_read_sr_word'? [-Werror=implicit-function-declaration]
    drivers/net/ethernet/intel/ice/ice_ptp.c:165:8: error: call to undeclared function 'ice_read_sma_ctrl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/net/ethernet/intel/ice/ice_ptp.c:187:16: error: implicit declaration of function 'ice_write_sma_ctrl'; did you mean 'ice_write_intrl'? [-Werror=implicit-function-declaration]
    drivers/net/ethernet/intel/ice/ice_ptp.c:187:9: error: call to undeclared function 'ice_write_sma_ctrl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/net/ethernet/intel/ice/ice_ptp.c:2556:15: error: implicit declaration of function 'ice_ptp_read_sdp_ac' [-Werror=implicit-function-declaration]
    drivers/net/ethernet/intel/ice/ice_ptp.c:2556:8: error: call to undeclared function 'ice_ptp_read_sdp_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5250:5: warning: no previous prototype for 'ice_read_sma_ctrl' [-Wmissing-prototypes]
    drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5250:5: warning: no previous prototype for function 'ice_read_sma_ctrl' [-Wmissing-prototypes]
    drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5283:5: warning: no previous prototype for 'ice_write_sma_ctrl' [-Wmissing-prototypes]
    drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5283:5: warning: no previous prototype for function 'ice_write_sma_ctrl' [-Wmissing-prototypes]
    drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5314:5: warning: no previous prototype for 'ice_read_pca9575_reg' [-Wmissing-prototypes]
    drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5314:5: warning: no previous prototype for function 'ice_read_pca9575_reg' [-Wmissing-prototypes]
    drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5346:5: warning: no previous prototype for 'ice_ptp_read_sdp_ac' [-Wmissing-prototypes]
    drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5346:5: warning: no previous prototype for function 'ice_ptp_read_sdp_ac' [-Wmissing-prototypes]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-allyesconfig
|   |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:implicit-declaration-of-function-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_read_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_write_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_sma_ctrl
|   `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_write_sma_ctrl
|-- microblaze-allmodconfig
|   |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:implicit-declaration-of-function-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_read_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_write_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_sma_ctrl
|   `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_write_sma_ctrl
|-- microblaze-allyesconfig
|   |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:implicit-declaration-of-function-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_read_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_write_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_sma_ctrl
|   `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_write_sma_ctrl
|-- mips-allyesconfig
|   |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:implicit-declaration-of-function-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_read_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_write_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_sma_ctrl
|   `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_write_sma_ctrl
|-- powerpc-allmodconfig
|   |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:implicit-declaration-of-function-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_read_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_write_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_sma_ctrl
|   `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_write_sma_ctrl
|-- powerpc-allyesconfig
|   |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:call-to-undeclared-function-ice_read_pca9575_reg-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:call-to-undeclared-function-ice_ptp_read_sdp_ac-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:call-to-undeclared-function-ice_read_sma_ctrl-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:call-to-undeclared-function-ice_write_sma_ctrl-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_read_sma_ctrl
|   `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_write_sma_ctrl
|-- riscv-allmodconfig
|   |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:call-to-undeclared-function-ice_read_pca9575_reg-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:call-to-undeclared-function-ice_ptp_read_sdp_ac-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:call-to-undeclared-function-ice_read_sma_ctrl-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:call-to-undeclared-function-ice_write_sma_ctrl-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_read_sma_ctrl
|   `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_write_sma_ctrl
|-- s390-allmodconfig
|   |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:call-to-undeclared-function-ice_read_pca9575_reg-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:call-to-undeclared-function-ice_ptp_read_sdp_ac-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:call-to-undeclared-function-ice_read_sma_ctrl-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:call-to-undeclared-function-ice_write_sma_ctrl-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_read_sma_ctrl
|   `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-function-ice_write_sma_ctrl
|-- um-allyesconfig
|   |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:implicit-declaration-of-function-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_read_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_write_sma_ctrl
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_ptp_read_sdp_ac
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_pca9575_reg
|   |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_sma_ctrl
|   `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_write_sma_ctrl
`-- xtensa-allyesconfig
    |-- drivers-net-ethernet-intel-ice-ice_gnss.c:error:implicit-declaration-of-function-ice_read_pca9575_reg
    |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_ptp_read_sdp_ac
    |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_read_sma_ctrl
    |-- drivers-net-ethernet-intel-ice-ice_ptp.c:error:implicit-declaration-of-function-ice_write_sma_ctrl
    |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_ptp_read_sdp_ac
    |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_pca9575_reg
    |-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_read_sma_ctrl
    `-- drivers-net-ethernet-intel-ice-ice_ptp_hw.c:warning:no-previous-prototype-for-ice_write_sma_ctrl

elapsed time: 773m

configs tested: 139
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                          collie_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241113    clang-19
i386        buildonly-randconfig-002-20241113    clang-19
i386        buildonly-randconfig-003-20241113    clang-19
i386        buildonly-randconfig-004-20241113    clang-19
i386        buildonly-randconfig-005-20241113    clang-19
i386        buildonly-randconfig-006-20241113    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241113    clang-19
i386                  randconfig-002-20241113    clang-19
i386                  randconfig-003-20241113    clang-19
i386                  randconfig-004-20241113    clang-19
i386                  randconfig-005-20241113    clang-19
i386                  randconfig-006-20241113    clang-19
i386                  randconfig-011-20241113    clang-19
i386                  randconfig-012-20241113    clang-19
i386                  randconfig-013-20241113    clang-19
i386                  randconfig-014-20241113    clang-19
i386                  randconfig-015-20241113    clang-19
i386                  randconfig-016-20241113    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                       maple_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241113    clang-19
x86_64      buildonly-randconfig-002-20241113    clang-19
x86_64      buildonly-randconfig-003-20241113    clang-19
x86_64      buildonly-randconfig-004-20241113    clang-19
x86_64      buildonly-randconfig-005-20241113    clang-19
x86_64      buildonly-randconfig-006-20241113    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241113    clang-19
x86_64                randconfig-002-20241113    clang-19
x86_64                randconfig-003-20241113    clang-19
x86_64                randconfig-004-20241113    clang-19
x86_64                randconfig-005-20241113    clang-19
x86_64                randconfig-006-20241113    clang-19
x86_64                randconfig-011-20241113    clang-19
x86_64                randconfig-012-20241113    clang-19
x86_64                randconfig-013-20241113    clang-19
x86_64                randconfig-014-20241113    clang-19
x86_64                randconfig-015-20241113    clang-19
x86_64                randconfig-016-20241113    clang-19
x86_64                randconfig-071-20241113    clang-19
x86_64                randconfig-072-20241113    clang-19
x86_64                randconfig-073-20241113    clang-19
x86_64                randconfig-074-20241113    clang-19
x86_64                randconfig-075-20241113    clang-19
x86_64                randconfig-076-20241113    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

