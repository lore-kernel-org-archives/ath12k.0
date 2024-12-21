Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D94E7718E
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZZsEtsR+YBKkr8WzrgNfaB9kENsWSc6+W3p9fHWoik=; b=dkvmbKzXb9NIQpIjMG5RRW+erU
	R973NoHySChdpfgc1xy15tuiVGdDhEkDeV3PYURPLwiBk7X2QgihJsBlIi13l0lBRT+hA1H3GWlBD
	1tNKy24C0oQfxi5Hbo3qMHiqFQXQGAHrUbJeKqxf2I+CH/8+DaoRXCzHke+ibpzi9Mp8PspBGFcPB
	rTsaplH3uV0eoP0EYwMpV4iqtMpEnDGl8yoi3fmDeOp6DBfAnuym/F1oksVXYfi9/tUpUeAPEXsjg
	YSE37/iY3GFDfxMNkJAlrR/2QyYDZ9QpHtuQz4hHLBszY1jV/So+QUbcBrZefx31VcviDF8y5Os0y
	caaxA7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP8Q8-00000007Wi7-3hPv
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 22:58:04 +0000
Received: from [198.175.65.19] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP8Q5-00000007Whf-3OhG
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 22:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734821882; x=1766357882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nsobIdYYKnBKr5gNA7nnnirRHkdS/46BhbK2G8cNw3w=;
  b=RhDwjrT5xNY4Cr0Y2JOMgn1Ud/wTbtLABg9tr/nnvzyC62EuN595wTE4
   fn0GgjlFliq7f3Gjp3FyOQpCLAc/k1OZV6i84QEQRwmVUnKFgyGFu8RVv
   HX4WaK7Odbr0llxIpJMCSr/gz+wLX0P+usnAN0KLgE4mJf9g5m4Ehhy+u
   ZVE/T15kLSh8rnvNJiKTaiy5bepfKTGEc17YcmjkCzuJKWx3k3rV05xWn
   87S4Yrd5BuQnupkyiSHVjyI5lhQNyZjqrSOuqbHaCf+ubymONy/Mxt6/k
   ucrC1JGr0WAWfIG92HGXx3M/I2mnI7AhYwB9IbuuldkrLEju3nRTdDgwq
   g==;
X-CSE-ConnectionGUID: xfwvSKbsSsO9bhfxjILerQ==
X-CSE-MsgGUID: OJ4AiQX+TPKpUbGiQ6w28Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35217361"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35217361"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 14:57:56 -0800
X-CSE-ConnectionGUID: 7Q2MCnAjTuKTAQM+6Hx+3Q==
X-CSE-MsgGUID: FjVqoHYZRTOwi3r4W+PB+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98910103"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2024 14:57:54 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP8Pv-0002YJ-2T;
	Sat, 21 Dec 2024 22:57:51 +0000
Date: Sun, 22 Dec 2024 06:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
	ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: Re: [PATCH 1/2] wifi: ath12k: Add Support to Parse TPC Event from
 Firmware
Message-ID: <202412220617.gNBV4iPi-lkp@intel.com>
References: <20241220203638.2082002-2-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220203638.2082002-2-quic_rdevanat@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_145802_173218_B686902C 
X-CRM114-Status: UNSURE (   8.55  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 09fa3b6974a1245ddd0751747609431494ba5b4f]

url:    https://github.com/intel-lab-lkp/linux/commits/Roopni-Devanathan/wifi-ath12k-Add-Support-to-Parse-TPC-Event-from-Firmware/20241221-043752
base:   09fa3b6974a1245ddd0751747609431494ba5b4f
patch link:    https://lore.kernel.org/r/20241220203638.2082002-2-quic_rdevanat%40quicinc.com
patch subject: [PATCH 1/2] wifi: ath12k: Add Support to Parse TPC Event from Firmware
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241222/202412220617.gNBV4iPi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220617.gNBV4iPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220617.gNBV4iPi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/wmi.c: In function 'ath12k_wmi_free_tpc_stats_mem':
>> drivers/net/wireless/ath/ath12k/wmi.c:7668:50: error: 'struct ath12k' has no member named 'debug'
    7668 |         struct wmi_tpc_stats_info *tpc_stats = ar->debug.tpc_stats;
         |                                                  ^~
   drivers/net/wireless/ath/ath12k/wmi.c:7678:19: error: 'struct ath12k' has no member named 'debug'
    7678 |                 ar->debug.tpc_stats = NULL;
         |                   ^~
   drivers/net/wireless/ath/ath12k/wmi.c: In function 'ath12k_process_tpc_stats':
   drivers/net/wireless/ath/ath12k/wmi.c:7722:16: error: 'struct ath12k' has no member named 'debug'
    7722 |         if (!ar->debug.tpc_request) {
         |                ^~
   drivers/net/wireless/ath/ath12k/wmi.c:7726:23: error: 'struct ath12k' has no member named 'debug'
    7726 |                 if (ar->debug.tpc_stats) {
         |                       ^~
   drivers/net/wireless/ath/ath12k/wmi.c:7735:23: error: 'struct ath12k' has no member named 'debug'
    7735 |                 if (ar->debug.tpc_stats) {
         |                       ^~
   drivers/net/wireless/ath/ath12k/wmi.c:7740:19: error: 'struct ath12k' has no member named 'debug'
    7740 |                 ar->debug.tpc_stats =
         |                   ^~
   drivers/net/wireless/ath/ath12k/wmi.c:7743:24: error: 'struct ath12k' has no member named 'debug'
    7743 |                 if (!ar->debug.tpc_stats) {
         |                        ^~
   drivers/net/wireless/ath/ath12k/wmi.c:7750:23: error: 'struct ath12k' has no member named 'debug'
    7750 |         tpc_stats = ar->debug.tpc_stats;
         |                       ^~
   drivers/net/wireless/ath/ath12k/wmi.c:7776:29: error: 'struct ath12k' has no member named 'debug'
    7776 |                 complete(&ar->debug.tpc_complete);
         |                             ^~


vim +7668 drivers/net/wireless/ath/ath12k/wmi.c

  7665	
  7666	void ath12k_wmi_free_tpc_stats_mem(struct ath12k *ar)
  7667	{
> 7668		struct wmi_tpc_stats_info *tpc_stats = ar->debug.tpc_stats;
  7669	
  7670		lockdep_assert_held(&ar->data_lock);
  7671		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "tpc stats mem free\n");
  7672		if (tpc_stats) {
  7673			kfree(tpc_stats->max_reg_allowed_power.reg_pwr_array);
  7674			kfree(tpc_stats->rates_array1.rate_array);
  7675			kfree(tpc_stats->rates_array2.rate_array);
  7676			kfree(tpc_stats->ctl_array.ctl_pwr_table);
  7677			kfree(tpc_stats);
  7678			ar->debug.tpc_stats = NULL;
  7679		}
  7680	}
  7681	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

