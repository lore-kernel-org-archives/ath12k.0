Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAD7C77B7A
	for <ath12k@archiver.kernel.org>; Tue, 30 May 2023 19:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgE6Y5RCr1LUDiU99w6nH+jEMJCdg9adFrv/9NzCAMM=; b=k6i4I2KSZBOomc
	gU/wwaKa4XehgkGIZ9UxwbIYTjBz9xsGK/83W7EVitlS5+Wuad5P8NkMkhli7VgRFEKnjo5Au0tcR
	7yQg6D/zkq6reFxCyoG56b8QwIuHSBb+wbokffgOSElUBwXfC7Z2i8NC7TW31fgCJIlAbXN7IiSxn
	h/+odIFlGPvKNHE3BDfYUSIZBOK/49R0ecgAHJyXDDNuGFl6NBDrUyW4MpZ4HOcFiqOwo8fI3QMCk
	xFH5LYQJX4GXHbCv7yEqnEYXaA/ZKwWx6GcR4GBD2rstJND6wxqW3QnhaIEv+aqnaSfDkPRaNCQpb
	EeaOToKjcOADTUNrNl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45G3-00F0Vp-0N
	for ath12k@archiver.kernel.org;
	Tue, 30 May 2023 19:43:51 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45G0-00F0VL-1x;
	Tue, 30 May 2023 19:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685475828; x=1717011828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nvmOvQoNmAoTsH+wEqnxySP1xPrfiw2o/cbFmdtW2O8=;
  b=WYxp2O890KRLL3AdgiMMBYpNHoMHtIU0V9llXGSmYoEXSlFO66vShHzN
   2VZ5leNyUyKtYe8agzLDy3HYTjJIzpb6ewqPhBg4s5SuL4DXvR0v1P20r
   eyFpLHHdFRW8lK14X1L2y0pBn33yMV0lQGa70eL+DRp+rQztlOtwyYTHM
   PoKVRvQXZms882TuO+O9NM2Iaj03iv5ZHrjheNlxONMCCi76y5gtLmA2r
   1q8swInPZNM3Ckymzb7w1QVq6EZnz7FhacYkj+e0Tl31kQisFz4mL2Lk3
   w+TAs73LHQULX0x1TW4eZrlV875KLrz9I48nJnrbEuHtyV3atI8xC+bVn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357410334"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="357410334"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 12:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="776476045"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="776476045"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 May 2023 12:43:39 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q45Fr-0000lq-06;
	Tue, 30 May 2023 19:43:39 +0000
Date: Wed, 31 May 2023 03:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
	kvalo@kernel.org, nbd@nbd.name, lorenzo@kernel.org,
	ryder.lee@mediatek.com, shayne.chen@mediatek.com,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, Mario.Limonciello@amd.com,
	Lijo.Lazar@amd.com
Cc: oe-kbuild-all@lists.linux.dev, ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, ath11k@lists.infradead.org
Subject: Re: [PATCH 9/9] drm/amd/pm: enable Wifi RFI mitigation feature
 support for SMU13.0.7
Message-ID: <202305310314.EAMX2AeE-lkp@intel.com>
References: <20230530024227.2139632-10-evan.quan@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230530024227.2139632-10-evan.quan@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_124348_737567_69693BAA 
X-CRM114-Status: GOOD (  12.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi Evan,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on kvalo-ath/ath-next wireless-next/main wireless/main]
[cannot apply to linus/master v6.4-rc4 next-20230530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Quan/drivers-acpi-Add-support-for-Wifi-band-RF-mitigations/20230530-104541
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230530024227.2139632-10-evan.quan%40amd.com
patch subject: [PATCH 9/9] drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230531/202305310314.EAMX2AeE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8c935eeab7a439739f3dd369516f18ddd86ef348
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Evan-Quan/drivers-acpi-Add-support-for-Wifi-band-RF-mitigations/20230530-104541
        git checkout 8c935eeab7a439739f3dd369516f18ddd86ef348
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310314.EAMX2AeE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.o: in function `smu_v13_0_0_set_wbrf_exclusion_ranges':
   smu_v13_0_0_ppt.c:(.text+0xfa8): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: smu_v13_0_0_ppt.c:(.text+0xfc0): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: smu_v13_0_0_ppt.c:(.text+0xfd4): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.o: in function `smu_v13_0_7_set_wbrf_exclusion_ranges':
>> smu_v13_0_7_ppt.c:(.text+0xe9c): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: smu_v13_0_7_ppt.c:(.text+0xeb4): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.o:smu_v13_0_7_ppt.c:(.text+0xec8): more undefined references to `__aeabi_uldivmod' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
