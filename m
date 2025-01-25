Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AB7C0218C
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 11:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntitq5sNqPhsyj1x+TbFsN/YcTFay9hm1u8WdMBNRhw=; b=aIAOj6zi+gUvp0l7PW/cYbfnOJ
	AQ+74FMJudPS/OS7P7R8UayXHSOvp1CqWDOu45wHqbq7zYpCalW0HeJgmEvillIwBjmLTSXHIvly6
	FDQt0jEBDnnCp2oS/3LUQOgsnBbJLxbGIzrI1FEFL/fTh386/Qjlv/Vz8XvC8wGc1mv9Ea7AHhoFm
	8Z1WPhYZab75lsP/R9bxZIv+tMu0VK15I9STa5EGDp0bdBI1LZd5loDPD0SfPnA2mwbaghtYHY5wf
	e04lm3zOXurYRgGnhWi2GpFPbYcxhGDtyzJzFnRFItxpB6pUlkQB1XsWZWZDfs1BhFgo0ynGL9Scv
	qH1BL7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbegl-0000000GMtH-2CE5
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 11:50:59 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbegi-0000000GMsy-1n8m
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 11:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737805857; x=1769341857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tLQxd9PZHnxIw8x47h8Ket6AvGPO8g7//q4h0rLHhcA=;
  b=fI2mmaXGlX83K8iwzQebagNRWY2bIAAN2hKwBzLwDvQJuBm1VjJYbTWA
   IQyUjLehQWv9oTmOr/bhVy2Vpyv4q3ACXOh/fQBkAXOto8T9OcXq/wisW
   Oc9OnN+rCgGBmf/YLU836gLSZqVG168lWqbBqf0lqX6H44oJqYgI4sNzg
   QJag1LydOMMLKkcVNaXx6KBTAQg+7Zhv9CF1xN0t/PR/NqU9WEgPcwwBZ
   rWzsKejj9wpz8cvH2mjR0pOcKPeK4k/V2+nx+RojEG+LVtMdCMIOgONff
   qKnv2KhZS8/3wYhpJQX3Miw6Bdt3U/XpRwax/EcbvM24E68IPFZ/MhESr
   w==;
X-CSE-ConnectionGUID: Ouq07O+4QD+RswZQEk97bA==
X-CSE-MsgGUID: XpxvtYK5RSCNgjT4MSaXew==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38433477"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38433477"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 03:50:54 -0800
X-CSE-ConnectionGUID: lO88u461THulesFgCqr6aw==
X-CSE-MsgGUID: QKB0x6pYTEWDxtaVcPsF5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108437501"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Jan 2025 03:50:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbegc-000dmR-1S;
	Sat, 25 Jan 2025 11:50:50 +0000
Date: Sat, 25 Jan 2025 19:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
	ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v2 3/5] wifi: mac80211: Set RTS threshold on per-radio
 basis
Message-ID: <202501251909.8i7nEm4H-lkp@intel.com>
References: <20250124171756.3418663-4-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124171756.3418663-4-quic_rdevanat@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_035056_514038_0C69C6E9 
X-CRM114-Status: UNSURE (   9.39  )
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

Hi Roopni,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e7ef944b3e2c31b608800925e784f67596375770]

url:    https://github.com/intel-lab-lkp/linux/commits/Roopni-Devanathan/wifi-cfg80211-Add-Support-to-Set-RTS-Threshold-for-each-Radio/20250125-012016
base:   e7ef944b3e2c31b608800925e784f67596375770
patch link:    https://lore.kernel.org/r/20250124171756.3418663-4-quic_rdevanat%40quicinc.com
patch subject: [PATCH v2 3/5] wifi: mac80211: Set RTS threshold on per-radio basis
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250125/202501251909.8i7nEm4H-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251909.8i7nEm4H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251909.8i7nEm4H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/rsi/rsi_91x_mac80211.c:1211: warning: Function parameter or struct member 'radio_id' not described in 'rsi_mac80211_set_rts_threshold'


vim +1211 drivers/net/wireless/rsi/rsi_91x_mac80211.c

dad0d04fa7ba41 Fariya Fatima     2014-03-16  1200  
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1201  /**
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1202   * rsi_mac80211_set_rts_threshold() - This function sets rts threshold value.
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1203   * @hw: Pointer to the ieee80211_hw structure.
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1204   * @value: Rts threshold value.
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1205   *
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1206   * Return: 0 on success.
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1207   */
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1208  static int rsi_mac80211_set_rts_threshold(struct ieee80211_hw *hw,
607be4e860ab07 Roopni Devanathan 2025-01-24  1209  					  u8 radio_id,
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1210  					  u32 value)
dad0d04fa7ba41 Fariya Fatima     2014-03-16 @1211  {
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1212  	struct rsi_hw *adapter = hw->priv;
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1213  	struct rsi_common *common = adapter->priv;
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1214  
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1215  	mutex_lock(&common->mutex);
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1216  	common->rts_threshold = value;
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1217  	mutex_unlock(&common->mutex);
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1218  
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1219  	return 0;
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1220  }
dad0d04fa7ba41 Fariya Fatima     2014-03-16  1221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

