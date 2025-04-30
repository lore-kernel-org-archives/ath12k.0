Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C067EC369D9
	for <ath12k@archiver.kernel.org>; Wed, 30 Apr 2025 14:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCILys+yHVUwYfVKUNACbbfV4Dpb2KXlkbgWgQa0z+0=; b=XziDCOv2uTkqHkHmmwGWpFsdhz
	AhYHoEXjKiMm619woU8RoN4TmV8prDMeeLjxEscwCMKvvABxRFS4sog3gTG1XCWqUAQIIwKPQpW8u
	nQzqZ1NJAq2VvDkeezfz9uy0bGS9Tc+s38lzavzCrkFLjHdlGt6Nytg0d5JzBlU8A+BE3Do8rp9qq
	eVav+zRfaox/kHpIuwjhZlwPmrztolmyWk9x77U06ZFeviCHjujd+zxyA9wEhwqyKOYpm5VJNDtNb
	5Dy46gm2fWYii3yKovtzBMhiT5+MxoSEOrwwv90oMxo+o4M1b18L67FXKDhhzfR9/tPnVNbEZPEo1
	JJPCN5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8RM-0000000D7WV-1YPh;
	Wed, 30 Apr 2025 14:29:36 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8RJ-0000000D7Vd-1nny;
	Wed, 30 Apr 2025 14:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746023374; x=1777559374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=McTwb9pq+/vbqEqNIWzbMZewBCRlkfKpTurFpG+gIdk=;
  b=Ei/1iTES6Y0eP0QAeBPIFSi0znciJiAIZKTmYaTdSl7e0GhRfcTumcPJ
   XYnbAb3/GNT/lLkTyRahhNIDUoMohjWF4na6XkwMOsQDnlmtDGkdfIp87
   T39HVoez7kFcD5sugt2kJvezHCEWI5isupBgZJ0loSDecxj5Trk/sjl3J
   boCoPdKnnsDrHgPYFbsw08B9QmIZxmBAczZ7dNR4FdrPZE5GlcGmvbkEw
   Qbs+Dc5fwAx10KBaT5biof9EFj0hi+rsZYaShFTdMa4GniCc1Z54t3XjP
   UMxRCNPEBHUQbXv1YNrvwfzaKSxpVJ/bxGdv4Ag1YjfVBklY0YqXHRa14
   Q==;
X-CSE-ConnectionGUID: 4h9low+mS+eV7yXooWY7rw==
X-CSE-MsgGUID: 4AzAKnJATQWevH+itkt/qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47698506"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47698506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 07:29:31 -0700
X-CSE-ConnectionGUID: /vGbO1UYRdKeO1UzaAIs1g==
X-CSE-MsgGUID: q4UKBdEtQ/SYH4H1q429Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138968832"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Apr 2025 07:29:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA8R9-0003WT-16;
	Wed, 30 Apr 2025 14:29:23 +0000
Date: Wed, 30 Apr 2025 22:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Yan Zhen <yanzhen@vivo.com>, Kunwu Chan <chentao@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Troy Hanson <quic_thanson@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH v3] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <202504302208.7JSH4wb6-lkp@intel.com>
References: <20250429122351.108684-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429122351.108684-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_072933_702768_204B4521 
X-CRM114-Status: GOOD (  10.82  )
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

Hi Muhammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ath/ath-next]
[also build test WARNING on next-20250430]
[cannot apply to mani-mhi/mhi-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus staging/staging-testing staging/staging-next staging/staging-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/bus-mhi-host-don-t-free-bhie-tables-during-suspend-hibernation/20250429-202649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20250429122351.108684-1-usama.anjum%40collabora.com
patch subject: [PATCH v3] bus: mhi: host: don't free bhie tables during suspend/hibernation
config: arm-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504302208.7JSH4wb6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504302208.7JSH4wb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504302208.7JSH4wb6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/pm.c:1246:6: warning: no previous prototype for 'mhi_power_down_unprepare_keep_dev' [-Wmissing-prototypes]
    1246 | void mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mhi_power_down_unprepare_keep_dev +1246 drivers/bus/mhi/host/pm.c

  1245	
> 1246	void mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
  1247	{
  1248		mhi_cntrl->bhi = NULL;
  1249		mhi_cntrl->bhie = NULL;
  1250	
  1251		mhi_deinit_dev_ctxt(mhi_cntrl);
  1252	}
  1253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

