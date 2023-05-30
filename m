Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2767C77B7A
	for <ath12k@archiver.kernel.org>; Tue, 30 May 2023 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EruMf9HqUrGomrN+tb0bHm/+U7kGnovGFx9fXe+OWYU=; b=1i2WbL2DAXY0/f
	gjbVKyiK8QDcMUP+lbb5LfXMBi0Slcdyk3x7kIVF8ZAFpBKeRljTqe2GPLWbVnOGSyBYmei+YkSuO
	3I6TdyQDmxbjrzdpQxg1w+43zXVRSy7WI2ZHe+3+fYGdxNviLRHlgG7nXmKdzTWtxL1IMTboa3Q44
	yq+DIyprF9BpdxCHh5UYDTYa/PYymYYF+GOprsqbOy4JdEBfzGeRivD18f/Xgij5VF0SnXlNI9ygB
	mz+HkptwZlH2V2qz0LTxYjJJrH6mG3NPx4wmj2o1JORJddbKj7/0nT85qSEFz56bxr+6aJau71nUp
	QzAIxSdk6Jm98WTgqnfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zkR-00E6Tw-1E
	for ath12k@archiver.kernel.org;
	Tue, 30 May 2023 13:50:51 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zkN-00E6Se-1l;
	Tue, 30 May 2023 13:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685454647; x=1716990647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=coaE20tPVJ7AZBZ9YIPPD7ohxPRVwifqLulonpO6f/c=;
  b=YJckxA+FyN3ki0NCQjov++QYgmYr5Gl5vJsecqC3Sqj396ywu8T+kR92
   6Kf95Dr31MiHgV0a8bm0pvXw0Bd7ZF+5tKUNegXYCeOyU8hlPVyCEBFjD
   35yQ8IyXb47tkRRviIegbGRVQR3LlDO97WD9XYaEXGJVqrtHiQYayCtsw
   ntNJqpDefa1LSh4cKkJdFzzGFl/Lb4teMpLfhW/e4xmMr+sne/eMTUNF0
   xSoD8S+/WSB+rfZp8z6aGDwVuu1Vexl1CmBve8r2Fkz0bdrz+hB4kny4e
   AuquQBPV6DfRzOFl8lna3eCoVyuWogQ5H2kVyK3/N4mhablMUPGvCNjS9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="352418871"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="352418871"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 06:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="771552147"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="771552147"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 May 2023 06:50:23 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3zjy-0000aN-2p;
	Tue, 30 May 2023 13:50:22 +0000
Date: Tue, 30 May 2023 21:50:09 +0800
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
Subject: Re: [PATCH 8/9] drm/amd/pm: enable Wifi RFI mitigation feature
 support for SMU13.0.0
Message-ID: <202305302118.3mARqykY-lkp@intel.com>
References: <20230530024227.2139632-9-evan.quan@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230530024227.2139632-9-evan.quan@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_065047_619647_81C97B8C 
X-CRM114-Status: GOOD (  11.05  )
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
[also build test ERROR on kvalo-ath/ath-next wireless-next/main wireless/main linus/master v6.4-rc4]
[cannot apply to next-20230530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Quan/drivers-acpi-Add-support-for-Wifi-band-RF-mitigations/20230530-104541
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230530024227.2139632-9-evan.quan%40amd.com
patch subject: [PATCH 8/9] drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230530/202305302118.3mARqykY-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8ecc361da81a0915bb626156b47403a91b678de1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Evan-Quan/drivers-acpi-Add-support-for-Wifi-band-RF-mitigations/20230530-104541
        git checkout 8ecc361da81a0915bb626156b47403a91b678de1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305302118.3mARqykY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
