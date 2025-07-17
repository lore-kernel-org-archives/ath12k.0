Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F43C83F1B
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 07:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LRUApSOhA7LXW2Fj3fv0uvNiVizlS+Z9ZRgwbmyTNo=; b=k/qby5fBUYRCOwIkmnDVu/f75t
	BNMyxmVJXYZ+tfPGIfqdaFlAxv8QHkIcbSkKZFwJud1f25NSlGXP5u5CVMwNBcu37Es3aUtzsamrN
	oy3f11Ilx2xOIM+OQcqGLOZk4aIZ+fRmv6bZ3prbuh3UTMhSZGjTdpEi9tBChatSDBjti5JN+1Rq4
	0aWhOD0DpLocKUOaoHISI7lBxD6GTVNDkomP1lrEEJSqQOT0kJU9lFzW1GenKsjEkjnvaebxeduZn
	i9SumrTSGMmTfXwVaJEHWtEo04yRgUuftX3kPTTQ3GoIq4n+94ceV54AnolSUpioY6hM7hItwNSvt
	ImkE/EaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIty-00000009PZd-2GLR;
	Thu, 17 Jul 2025 07:19:34 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIaq-00000009Lye-3O6X;
	Thu, 17 Jul 2025 06:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752735590; x=1784271590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WfQDUZl8/0uR3HB4LyHO328cyXvBUlw0A/UhOlJxz1U=;
  b=EVQX4mwuC/RnKRbmAhFemrpAK//4GGDwO+fsNMqqwCubnD2vYEC69Wta
   PChxKmhQhNEgzauuYGQEWP8QYb1wP9yULEvIqIVqsreOKO2QQuFG3Yn8G
   DatwTqSL5VgobpzJn+qM6bkbCy60nbtFIJfcDz9HqawtwIQVKfId9dgpK
   iC2CbBRl6zZPKZ8QVT197aH4Bsxbso8k4Z+8sikCfbdNAKkxXZY1R9XfB
   3Bo8ubVkonus38oiy0wUQQ8rHeRtIEVVTwFuYRWkfu90zoI/Noz+Prpej
   6CbV8Pd/X5hZ4ILT43p8vjfVV52im+sYyenio5ttkhQt1mqveZtXqwvsE
   w==;
X-CSE-ConnectionGUID: hm0fxZDRRnCfUxU83BrgAQ==
X-CSE-MsgGUID: UQHAA+6cSv2Xo+zQeFGtbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57608562"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="57608562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 23:59:48 -0700
X-CSE-ConnectionGUID: xCcATFy/QTatTT5/uaWjQw==
X-CSE-MsgGUID: ZIXncjgcTTumw+1qNYHO7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="188654912"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jul 2025 23:59:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucIah-000DGd-10;
	Thu, 17 Jul 2025 06:59:39 +0000
Date: Thu, 17 Jul 2025 14:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
	ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
Message-ID: <202507171411.xOxUslAs-lkp@intel.com>
References: <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_235948_856483_21598281 
X-CRM114-Status: GOOD (  12.68  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam-via-B4-Relay/PCI-ASPM-Fix-the-behavior-of-pci_enable_link_state-APIs/20250716-205857
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250716-ath-aspm-fix-v1-4-dd3e62c1b692%40oss.qualcomm.com
patch subject: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250717/202507171411.xOxUslAs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171411.xOxUslAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171411.xOxUslAs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/main.c:22:
   drivers/net/wireless/ath/ath.h: In function 'ath_pci_aspm_state':
>> drivers/net/wireless/ath/ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
     346 |                 state |= PCIE_LINK_STATE_L0S;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/ath/ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
     348 |                 state |= PCIE_LINK_STATE_L1;
         |                          ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/ath/ath9k/common.h:19,
                    from drivers/net/wireless/ath/ath9k/ath9k.h:29,
                    from drivers/net/wireless/ath/ath9k/beacon.c:18:
   drivers/net/wireless/ath/ath9k/../ath.h: In function 'ath_pci_aspm_state':
>> drivers/net/wireless/ath/ath9k/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
     346 |                 state |= PCIE_LINK_STATE_L0S;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath9k/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/ath/ath9k/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
     348 |                 state |= PCIE_LINK_STATE_L1;
         |                          ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/ath/carl9170/../regd.h:23,
                    from drivers/net/wireless/ath/carl9170/carl9170.h:61,
                    from drivers/net/wireless/ath/carl9170/main.c:47:
   drivers/net/wireless/ath/carl9170/../ath.h: In function 'ath_pci_aspm_state':
>> drivers/net/wireless/ath/carl9170/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
     346 |                 state |= PCIE_LINK_STATE_L0S;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/carl9170/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/ath/carl9170/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
     348 |                 state |= PCIE_LINK_STATE_L1;
         |                          ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/ath/ath6kl/../regd.h:23,
                    from drivers/net/wireless/ath/ath6kl/wmi.c:24:
   drivers/net/wireless/ath/ath6kl/../ath.h: In function 'ath_pci_aspm_state':
>> drivers/net/wireless/ath/ath6kl/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
     346 |                 state |= PCIE_LINK_STATE_L0S;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath6kl/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/ath/ath6kl/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
     348 |                 state |= PCIE_LINK_STATE_L1;
         |                          ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/ath/ath10k/core.h:25,
                    from drivers/net/wireless/ath/ath10k/mac.h:11,
                    from drivers/net/wireless/ath/ath10k/mac.c:9:
   drivers/net/wireless/ath/ath10k/../ath.h: In function 'ath_pci_aspm_state':
>> drivers/net/wireless/ath/ath10k/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
     346 |                 state |= PCIE_LINK_STATE_L0S;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/ath/ath10k/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
     348 |                 state |= PCIE_LINK_STATE_L1;
         |                          ^~~~~~~~~~~~~~~~~~


vim +/PCIE_LINK_STATE_L0S +346 drivers/net/wireless/ath/ath.h

   340	
   341	static inline int ath_pci_aspm_state(u16 lnkctl)
   342	{
   343		int state = 0;
   344	
   345		if (lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
 > 346			state |= PCIE_LINK_STATE_L0S;
   347		if (lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
 > 348			state |= PCIE_LINK_STATE_L1;
   349	
   350		return state;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

