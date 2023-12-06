Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DACC4167B
	for <ath12k@archiver.kernel.org>; Wed,  6 Dec 2023 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVXgQr3gLHw9XLIUiiQAx3bv8lEys27g9ehtv1ztkAg=; b=H3dtSz5+T56xZsGSS31xATOZeO
	Fi7srgiBUKnig0pbwEnuGyLveVdYMIzyvbp7NNqYxQahXFqwhrHQdeQ9kvldZRVeh/LWyuC/5CCRW
	R3jvf+mnzf1qOrkPyirRf+7yGs/XF/beht7NK1PetlD8Vnv3QZ9YpxJZNh83soWtxccZ5jDABjp3Q
	9rH2tkgkkjEwAlLmrrnpIzMq/B4CqzpuF3eqIzERx1R33xJwi757AdszNcf/tEczuQ/4dOdcNqTLn
	hFvMqAVIQgv7Sgiz4JaE6mfgacEWhDm0hQWqZEI5jlr+wNGAEXGJuiw+DoxZHf8Wq8qOITTG1BKEE
	KKIglh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB1Yu-00BVHY-39
	for ath12k@archiver.kernel.org;
	Wed, 06 Dec 2023 23:44:16 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB1Yr-00BVGO-2Q
	for ath12k@lists.infradead.org;
	Wed, 06 Dec 2023 23:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701906253; x=1733442253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Au4NheutJTv2N9tkxCMLcTBy6zYGIHCMAyKzgq/xz0=;
  b=OhaV4PCk59tEu7BDgYZ7/gjFAbH+ZYTzOPV6g3x16IpmG36cXw7IFfct
   nj2Dxv9uvyoxMUSSEiNsedeDcDPBTQ3BGI3mnHNDU0BhzLPslN9nbJKvJ
   LF1AEBWxKRs/zPPjTZpuSOuX9sfpGoKgeZNMO491vaGE+jpc8y1eumnGL
   W6ktWL83mjrTqEQe7OTFRqABi+rluA6OoZTHLejv+Qj/RKF6CIG280s83
   im3jPOm6F63tRzgueIa9Yg2cEsQHKRxRmvTdjw63lvxUXtzWNsXLx7A87
   18qFiU1giYZ8P1kV6MvyjXyXMP9UKOzcgCQ1p7jpuDtNK13NojEqtmHh1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373634438"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373634438"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 15:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018737714"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1018737714"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2023 15:44:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB1Yk-000Bb6-35;
	Wed, 06 Dec 2023 23:44:06 +0000
Date: Thu, 7 Dec 2023 07:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	quic_lingbok@quicinc.com
Subject: Re: [PATCH] wifi: ath12k: report tx bitrate for iw dev xxx station
 dump
Message-ID: <202312070759.wWy93Ana-lkp@intel.com>
References: <20231206134654.24662-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206134654.24662-1-quic_lingbok@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_154413_799340_D9E07955 
X-CRM114-Status: UNSURE (   9.21  )
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

Hi Lingbo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0dbdc9383054fd3ecbcacfeb364aace3db744314]

url:    https://github.com/intel-lab-lkp/linux/commits/Lingbo-Kong/wifi-ath12k-report-tx-bitrate-for-iw-dev-xxx-station-dump/20231206-215109
base:   0dbdc9383054fd3ecbcacfeb364aace3db744314
patch link:    https://lore.kernel.org/r/20231206134654.24662-1-quic_lingbok%40quicinc.com
patch subject: [PATCH] wifi: ath12k: report tx bitrate for iw dev xxx station dump
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231207/202312070759.wWy93Ana-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070759.wWy93Ana-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070759.wWy93Ana-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/mac.c:7765:20: warning: conflicting types for 'ath12k_mac_he_gi_to_nl80211_he_gi' due to enum/integer mismatch; have 'enum nl80211_he_gi(u8)' {aka 'enum nl80211_he_gi(unsigned char)'} [-Wenum-int-mismatch]
    7765 | enum nl80211_he_gi ath12k_mac_he_gi_to_nl80211_he_gi(u8 sgi)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/ath/ath12k/mac.c:9:
   drivers/net/wireless/ath/ath12k/mac.h:79:5: note: previous declaration of 'ath12k_mac_he_gi_to_nl80211_he_gi' with type 'u32(u8)' {aka 'unsigned int(unsigned char)'}
      79 | u32 ath12k_mac_he_gi_to_nl80211_he_gi(u8 sgi);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +7765 drivers/net/wireless/ath/ath12k/mac.c

  7764	
> 7765	enum nl80211_he_gi ath12k_mac_he_gi_to_nl80211_he_gi(u8 sgi)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

