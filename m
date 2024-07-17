Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355E4C3DA60
	for <ath12k@archiver.kernel.org>; Wed, 17 Jul 2024 20:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuqxL38Le66wG8j6GurM8x7Rfl/Pru5tArYcOvMaXNU=; b=I15Plb6aq51p5cXvZhki28iQo3
	VaXxfkuytWAVOUJbGTV7bW4glFHWUtl9OJRVo68qG5Ui8enadG9krm9dXIz+0b9sFqH2h26150d1B
	4aRpP3b5XfwKDilktGXf5EXnBS1gh41WqajX3KOnkja+QDSG+IGeqRGNRZPU6QGInsgx2p2u4MBvY
	TsBY1B9GJqt6mRfSFMn6x3Yv6/wngvNmQs4JRJGbIhzBFq6FX7+VP+QJxo0nbH1gW6aZ4E3MHa/tU
	nyoCQsqVDiFZqtfiduI3FiZi32UXuB4X6A2jSsUjC+YX18K9YU7qpIoIPQjfH87P1/nR6q0zqncOL
	RbxHy6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUBP6-0000000ErfW-3gqE
	for ath12k@archiver.kernel.org;
	Wed, 17 Jul 2024 20:37:36 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUBP3-0000000EreZ-1JS8
	for ath12k@lists.infradead.org;
	Wed, 17 Jul 2024 20:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721248653; x=1752784653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Axa3+fJrm+kDX4tcl99tyN59zaR0l/jTZrzGSuyHfak=;
  b=LOlgafYbjlwqcu0DgIeCCi//oUCAbY5n18kQG/MA/vsef7OoXdl1s0CV
   V4HdhqFIsKHmIVa3fO+5u95HVPX1NwbKCZw3vn4KjNugBkkRWeMK3SliU
   OjPhrM5M3U0G08gy0lTNK91IUQhFWEdnnoWy+vK9GPelF28uTN81VfcdW
   aF8sZ0hH4BvLY9DS/BSCNNbdD+aUJCkgkUlLSpy7QYTwaudOzg70b7ZbN
   c0btrZBFwmVpx2AXXxhO32Auf7IV2ffswRV4AJ2KVN/Vggn8riZUBo13I
   dlWCh1PeEBuC/5SnYyNQfXRvLW9D3QJ3ejtYxGRjmEXJ38+GbqPvsrOKk
   w==;
X-CSE-ConnectionGUID: xfuglJUJRe6xSskhQl9tEw==
X-CSE-MsgGUID: GfQq+p0yQKq976m8sWuZeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="36222490"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="36222490"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 13:37:30 -0700
X-CSE-ConnectionGUID: u1mitnfkSdqdT6Tgg6RIjw==
X-CSE-MsgGUID: 8ksHjwr5SGS+JnJiQ+l+wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="50607096"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2024 13:37:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUBOx-000gek-1n;
	Wed, 17 Jul 2024 20:37:27 +0000
Date: Thu, 18 Jul 2024 04:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	quic_lingbok@quicinc.com
Subject: Re: [PATCH 2/4] wifi: ath12k: Add Support for enabling or disabling
 specific features based on ACPI bitflag
Message-ID: <202407180403.SFqsPj0v-lkp@intel.com>
References: <20240717111023.78798-3-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717111023.78798-3-quic_lingbok@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_133733_422199_FCCCC4D2 
X-CRM114-Status: UNSURE (   9.83  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on db1ce56e6e1d395dd42a3cd6332a871d9be59c45]

url:    https://github.com/intel-lab-lkp/linux/commits/Lingbo-Kong/wifi-ath12k-Add-support-for-obtaining-the-buffer-type-ACPI-function-bitmap/20240717-211701
base:   db1ce56e6e1d395dd42a3cd6332a871d9be59c45
patch link:    https://lore.kernel.org/r/20240717111023.78798-3-quic_lingbok%40quicinc.com
patch subject: [PATCH 2/4] wifi: ath12k: Add Support for enabling or disabling specific features based on ACPI bitflag
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240718/202407180403.SFqsPj0v-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180403.SFqsPj0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180403.SFqsPj0v-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/core.c: In function 'ath12k_core_rfkill_config':
>> drivers/net/wireless/ath/ath12k/core.c:33:15: error: 'struct ath12k_base' has no member named 'acpi'
      33 |         if (ab->acpi.acpi_disable_rfkill)
         |               ^~
--
   drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_mac_copy_eht_cap':
>> drivers/net/wireless/ath/ath12k/mac.c:5488:19: error: 'struct ath12k_base' has no member named 'acpi'
    5488 |             ar->ab->acpi.acpi_disable_11be)
         |                   ^~


vim +33 drivers/net/wireless/ath/ath12k/core.c

    24	
    25	static int ath12k_core_rfkill_config(struct ath12k_base *ab)
    26	{
    27		struct ath12k *ar;
    28		int ret = 0, i;
    29	
    30		if (!(ab->target_caps.sys_cap_info & WMI_SYS_CAP_INFO_RFKILL))
    31			return 0;
    32	
  > 33		if (ab->acpi.acpi_disable_rfkill)
    34			return 0;
    35	
    36		for (i = 0; i < ab->num_radios; i++) {
    37			ar = ab->pdevs[i].ar;
    38	
    39			ret = ath12k_mac_rfkill_config(ar);
    40			if (ret && ret != -EOPNOTSUPP) {
    41				ath12k_warn(ab, "failed to configure rfkill: %d", ret);
    42				return ret;
    43			}
    44		}
    45	
    46		return ret;
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

