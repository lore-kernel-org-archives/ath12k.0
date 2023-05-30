Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B57C7EE23
	for <ath12k@archiver.kernel.org>; Tue, 30 May 2023 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETVR6tPtauUImRVPUalRX0AK7iC3xiURSzEqTlJYNm8=; b=uvMHePlVAto1B6
	R9T4YpHBBKeghVe8G9wIRW5cku1iBuglx/t/tFMBKn6YzsJL6JyuMFiywd4wKPjUxzuT12iIluvT1
	eCA6C65M6Y13No8beo8rmjQ4vOd6drfTrHcQZRq3jfFBcxO2XEmjxMXtIXXxCp1zDKlTNS4cUIBFO
	tN5cr5VJJ8JctTnRS9kXMkWMHmUf0WZ42O5VFDW08BieZycYwF7LDKT2jTgcs2W6LZVKMMWpxNP+U
	5kVjEmG9NrKN4r7R0yTE6cRlGqmIihZ1JKAVuNJ6BHfVb4NwB/8qbR331aPpPdwFfxiXU1ZiXxXfe
	27geGOdqgMEKU8pkahxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q404W-00EBWn-31
	for ath12k@archiver.kernel.org;
	Tue, 30 May 2023 14:11:36 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q404T-00EBVn-0f;
	Tue, 30 May 2023 14:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685455893; x=1716991893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0ZSjvmRsPahZ8Twh6++RSb7rZmPdH3pP2QZxrCkFm9U=;
  b=QNoIVtPLIpdmCYMXfl5JkaG5EpEc+d/8KHlPBzK+IZJp8/oASpfs52RC
   I/A2IetpFYKqsLoXVMFkV3MDe1GLFa9mVHVPeDH+6fNLUJY8tyBvLAtjt
   m4FP/0u8vhZs3r/sjXb0woqA1grIialZQPYVdw5Gc8RJrJNLP/jidsGrj
   AqK/jXT/D72WtAAyvD9N89oSqjFjXei++zwlI8ssa+HqBVoh/PqVgPrBT
   g2YmmwC0qV1p1puYLSln2w8oILQpArZ1ZRKPn3VsJBGZCRtZRLB2x0D4N
   WDv53JZAdV3cfijtxclTWvvghT0L/RYUyFNngr10sFOVORfbxYzoDnQH2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="441282307"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="441282307"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 07:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="830768672"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="830768672"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 May 2023 07:11:23 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q404J-0000ap-0k;
	Tue, 30 May 2023 14:11:23 +0000
Date: Tue, 30 May 2023 22:10:52 +0800
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
Message-ID: <202305302142.rrUt4NJV-lkp@intel.com>
References: <20230530024227.2139632-9-evan.quan@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230530024227.2139632-9-evan.quan@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_071133_262413_66E98DB3 
X-CRM114-Status: GOOD (  10.36  )
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
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230530/202305302142.rrUt4NJV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305302142.rrUt4NJV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.o: in function `smu_v13_0_0_set_wbrf_exclusion_ranges':
>> smu_v13_0_0_ppt.c:(.text+0x1384): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: smu_v13_0_0_ppt.c:(.text+0x139c): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: smu_v13_0_0_ppt.c:(.text+0x13b0): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
