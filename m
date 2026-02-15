Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58831E63F08
	for <ath12k@archiver.kernel.org>; Sun, 15 Feb 2026 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFjIncPE/ygomcY4BZG6hXyPekENZl+Z6pN5ng8JTWM=; b=JejingT3R5slR6mWIHwElcI1u7
	JB8EF7ns/QgFR7XNhX//uV5YKy2+DPtgOGengIz09Kh/HAF5C81v+YTYaoAgjjj1k40u88KnNLzC5
	uacgIDtWHYCpj+z9BYwfq9DmE75qSd3uIKSeaYIaSBZWkLO4Oi6umizKeVZts3GRAPBT3o1qTy9N9
	dnXRk8Zk/YkTZ+rSrQCRvGx0vq2be0mmOwmXM5iL/GpuIgDX0GW13AlgzxTbA5EbawvRsFuighlOY
	FnPOET2gJBD1m/EDm5WTzLDnYjLBB+9ZhmEVlldktulakKvrZlrB5z9fF+f1XiDjdg3qO9shXxH/W
	NOe+SxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrgJi-00000005ZLr-06C5;
	Sun, 15 Feb 2026 17:53:58 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrgJe-00000005ZLX-3WQG
	for ath12k@lists.infradead.org;
	Sun, 15 Feb 2026 17:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771178035; x=1802714035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hXOlYDzkGeHdSnx/HxwTez3vHrXkvJwme569VZU5k80=;
  b=FkKLAI5swBUYmXiSnlEJsWWSUiOdc+JpqA1C9JRs7XTnKXB97GPY6Dlf
   /gEH04qNLPLnGcONFvJs7pfQHtbIOl4qAWgLVL+/uZFVssp2ht1KvzzaN
   kjCbIk3e+qf9oQcLDvdhDgz73BEm3OeY1i/xarY07dlO9MI7GoUUD0AoA
   QXrzzRbD9xfDUDMBJMtxQfeUawcZn4q0HvAaxfuxDu/mhL+RiXvflLh4z
   sm52YjpNFHIp8Yx3gbWBPpYKxg0b5H1pV5sB+kuMDhIIJqB5MPoNHHtwK
   EscT7ljGN4bM//EZnEIj4oyr97Cn9PN+Aa9adbX9rkiTad7Fss5M2AG8s
   A==;
X-CSE-ConnectionGUID: eDpdMRzURyGxy6tlfUh/hA==
X-CSE-MsgGUID: qE1lDTygTPi0yzqZyWzsng==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="75902218"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="75902218"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 09:53:52 -0800
X-CSE-ConnectionGUID: jJMFrSu/Qn2e0t5khQiiFw==
X-CSE-MsgGUID: QhR4QmFQSZiO/izzqqUGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="212449286"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Feb 2026 09:53:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrgJX-00000000yye-1ZjV;
	Sun, 15 Feb 2026 17:53:47 +0000
Date: Mon, 16 Feb 2026 01:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
	ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
	Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: add basic hwmon temperature
 reporting
Message-ID: <202602160145.YQdvbqYY-lkp@intel.com>
References: <20260214035947.44671-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214035947.44671-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_095354_959500_3D411185 
X-CRM114-Status: UNSURE (   9.46  )
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

Hi Maharaja,

kernel test robot noticed the following build errors:

[auto build test ERROR on 37a93dd5c49b5fda807fd204edf2547c3493319c]

url:    https://github.com/intel-lab-lkp/linux/commits/Maharaja-Kennadyrajan/wifi-ath12k-add-basic-hwmon-temperature-reporting/20260214-120212
base:   37a93dd5c49b5fda807fd204edf2547c3493319c
patch link:    https://lore.kernel.org/r/20260214035947.44671-1-maharaja.kennadyrajan%40oss.qualcomm.com
patch subject: [PATCH ath-next] wifi: ath12k: add basic hwmon temperature reporting
config: x86_64-randconfig-075-20250806 (https://download.01.org/0day-ci/archive/20260216/202602160145.YQdvbqYY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160145.YQdvbqYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160145.YQdvbqYY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ath12k_thermal_unregister':
>> drivers/net/wireless/ath/ath12k/thermal.c:118:(.text+0x2df8112): undefined reference to `hwmon_device_unregister'


vim +118 drivers/net/wireless/ath/ath12k/thermal.c

   106	
   107	void ath12k_thermal_unregister(struct ath12k_base *ab)
   108	{
   109		struct ath12k *ar;
   110		int i;
   111	
   112		for (i = 0; i < ab->num_radios; i++) {
   113			ar = ab->pdevs[i].ar;
   114			if (!ar)
   115				continue;
   116	
   117			if (ar->thermal.hwmon_dev) {
 > 118				hwmon_device_unregister(ar->thermal.hwmon_dev);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

