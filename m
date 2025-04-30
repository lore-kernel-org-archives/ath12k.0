Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2510BC369D9
	for <ath12k@archiver.kernel.org>; Wed, 30 Apr 2025 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc0AZY5QrStEaZH2IJVhHO6VnojpLEy6uLZw7TptXX0=; b=Kjpo4ueYDWT5c2pXM17DvM0h89
	qKndP/GhJ5Ufi7OvBQRCS48jkUKct4llfPQjCgO+ClGLgFLpWJlUL571PLy5JEqfENozsURFNDur1
	IZ79QbsdnBnijSXXPi0VzD10Vm+8gC1Lq3zMIl6EGA+oiaG/pJX3QZSX0adY/UIgJXJdYhlPZSNeX
	gxBp3Sssd07R7aF5WVxwesxuf4eIdTWclRUTpD4SGa96LzBiXhRLodxaZEI34SaJx+L2MUxZuzIc8
	wq+kVCT3sBNAuTdSu/OVlUDw5oNkAPCH989TtaF6GyjyS6MdZPt5//bijk4WjfIOH7qOP+M4FTbGp
	4wKb12Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAZ7-0000000DTNF-2paw;
	Wed, 30 Apr 2025 16:45:45 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAZ4-0000000DTMd-0kPW;
	Wed, 30 Apr 2025 16:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746031542; x=1777567542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRFeOE2SvEpVpyHUyxI/7ubZqIxqK3KMU4XzCZOjQhw=;
  b=MlQgVbrqSmuma3KnqtkAx5p6VaFOla/TFHjtOAX8n5t9YiXLTnL9j8tC
   PsIi5UvBOSW4OWsf26n1E/PiMZATS7/OjnEH4Gz9fMaR5x/bGZmNpEyxD
   vG3u3USkegG0zGp0nKBoCq++aHdoDheLV9pcS7HM/GO4Cs452BoUjsBma
   ij8Pp+cBsFkSew+aPTVvMxiE5lqdUXHFRdURKiaki6bRrlzroDUBE1Bal
   oyjuAf06vmFI3SVjQewyXb2c8eiViinbkp4KIxeYHJn+Cf4GiKzKhDdwj
   qxJA38q+yxxmmCyhEoXZoK1ze0U9As54SlfIvj0KHBJzrT/FuerT0InLT
   A==;
X-CSE-ConnectionGUID: 2eDJ+WaMSfqzti0dm6kTug==
X-CSE-MsgGUID: IlMMUwPYQRedGbq9gW9PNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="57900349"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="57900349"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 09:45:39 -0700
X-CSE-ConnectionGUID: FRYk2KNrTwGYffzVPt4jkA==
X-CSE-MsgGUID: dXoFU1mgRlq9kWHXKov/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="134108205"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2025 09:45:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAAYu-0003cH-2Q;
	Wed, 30 Apr 2025 16:45:32 +0000
Date: Thu, 1 May 2025 00:45:24 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel@collabora.com, Carl Vanderlip <quic_carlv@quicinc.com>,
	Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH v3] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <202505010037.1PMLamw8-lkp@intel.com>
References: <20250429122351.108684-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429122351.108684-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_094542_305162_3D3636E1 
X-CRM114-Status: GOOD (  12.22  )
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
config: arm64-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250501/202505010037.1PMLamw8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010037.1PMLamw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010037.1PMLamw8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/pm.c:1246:6: warning: no previous prototype for function 'mhi_power_down_unprepare_keep_dev' [-Wmissing-prototypes]
    1246 | void mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
         |      ^
   drivers/bus/mhi/host/pm.c:1246:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1246 | void mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
         | ^
         | static 
   1 warning generated.


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

