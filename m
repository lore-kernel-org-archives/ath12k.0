Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1DECEB2C9
	for <ath12k@archiver.kernel.org>; Sat, 15 Nov 2025 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HilrCxeFJGJU6yqrcObq0qdcezkJ6LM0opkT3WPtB1k=; b=k/VLkS+Oz8dNrCuEpyXCBs8QRM
	HtgL3zYRxq1bAJibbijCgb2l7vD3z9b1z5cqj/+OcLmVAGGg81TFVyn1tqesRKt4cxzkb/hXWnnvu
	wXHucAtON0X8kfaf33vMOMeaEU5iBxAjQIoRgdA5wwySXZuIYCx73vb4Mizj3NEi3IcICFijEvqDo
	GXWWO8zWnBKTIftqLXCeDkFkn78V3XLf7JElbfr2SoBRYgZ0gFGCJ7nyBojtFhItD1UZiZY20H5cs
	lYkdGg6EUf/8tw9H/OrF93yDq+yX2+zhcGw6GWMuVS5cTyEa6rN+ZyNQ5XnIO/8nRKAjeqdZ5WVPR
	nGxQEmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCwn-0000000DfXz-2YsQ;
	Sat, 15 Nov 2025 09:51:57 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCwi-0000000DfWG-2m2Y;
	Sat, 15 Nov 2025 09:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763200313; x=1794736313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TNO/pWSCuytWRdiYa0o5CX+QYwHxTJhHAX8l7vDVP4A=;
  b=V6d2L/mh1PMVVLbNYEE8xSiOMEYyh6zGM3efxKfJeHYOm350byH8U+KC
   zSY1SG0lB52PB8VPLgleFFb4c3UMqUrh1r6PsqpjmjhRo1ZzYCFS0gIsS
   GYMCXRxaQitSIyiWhiH97W4t8bcH9R6myHeFN11jTqek7pNJ6rNzUzQLh
   Gszdtaf9RNcxpnGzEqmxff0kYwTDk4GFH01DVTtrg7jIC2pPvsj6C54w6
   Njqqrbm2JNjdQQHai8cYj5zIABmrEJUQ9LBpnpvwUAZcI9/2Y6eDJ8Wlk
   cB6KT1bSKcn8uQXvhesRxV5KxCkuV1vvtJT1b8bxjWu+XprZ90aYB3IdM
   w==;
X-CSE-ConnectionGUID: E5il8Ql9QAW7HbWf2+/2rA==
X-CSE-MsgGUID: 8kN+SOR7RqOSoyH/lHptoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65375977"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65375977"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 01:51:49 -0800
X-CSE-ConnectionGUID: uG+q97uVRgSsI6liqwQZeQ==
X-CSE-MsgGUID: YObL3VYdSOSw5BYe6PTfJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="194443766"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Nov 2025 01:51:46 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKCwZ-0007rX-1a;
	Sat, 15 Nov 2025 09:51:43 +0000
Date: Sat, 15 Nov 2025 17:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <202511151754.ggEBSIV4-lkp@intel.com>
References: <20251114-ath-variant-tbl-v1-1-a9adfc49e3f3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-ath-variant-tbl-v1-1-a9adfc49e3f3@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_015152_747712_7E30EC0F 
X-CRM114-Status: UNSURE (   9.95  )
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

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam/wifi-ath-Use-static-calibration-variant-table-for-devicetree-platforms/20251114-183506
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251114-ath-variant-tbl-v1-1-a9adfc49e3f3%40oss.qualcomm.com
patch subject: [PATCH 1/2] wifi: ath: Use static calibration variant table for devicetree platforms
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251115/202511151754.ggEBSIV4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151754.ggEBSIV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151754.ggEBSIV4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath10k/core.h:26,
                    from drivers/net/wireless/ath/ath10k/core.c:21:
   In function 'ath_get_calib_variant',
       inlined from 'ath10k_core_check_dt' at drivers/net/wireless/ath/ath10k/core.c:1164:12:
>> drivers/net/wireless/ath/ath10k/../ath.h:431:36: warning: argument 2 null where non-null expected [-Wnonnull]
     431 |         while ((entry->machine) && strcmp(entry->machine, model))
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/net/wireless/ath/ath10k/core.c:11:
   include/linux/string.h: In function 'ath10k_core_check_dt':
   include/linux/string.h:161:12: note: in a call to function 'strcmp' declared 'nonnull'
     161 | extern int strcmp(const char *,const char *);
         |            ^~~~~~
--
   In file included from drivers/net/wireless/ath/ath11k/core.c:23:
   In function 'ath_get_calib_variant',
       inlined from 'ath11k_core_check_dt' at drivers/net/wireless/ath/ath11k/core.c:1367:12:
>> drivers/net/wireless/ath/ath11k/../ath.h:431:36: warning: argument 2 null where non-null expected [-Wnonnull]
     431 |         while ((entry->machine) && strcmp(entry->machine, model))
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/net/wireless/ath/ath11k/core.c:9:
   include/linux/string.h: In function 'ath11k_core_check_dt':
   include/linux/string.h:161:12: note: in a call to function 'strcmp' declared 'nonnull'
     161 | extern int strcmp(const char *,const char *);
         |            ^~~~~~


vim +431 drivers/net/wireless/ath/ath10k/../ath.h

   424	
   425	static inline const char *ath_get_calib_variant(void)
   426	{
   427		const struct __ath_calib_variant_table *entry = ath_calib_variant_table;
   428		struct device_node *root __free(device_node) = of_find_node_by_path("/");
   429		const char *model = of_get_property(root, "model", NULL);
   430	
 > 431		while ((entry->machine) && strcmp(entry->machine, model))
   432			entry++;
   433	
   434		return entry->machine ? entry->variant : NULL;
   435	}
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

